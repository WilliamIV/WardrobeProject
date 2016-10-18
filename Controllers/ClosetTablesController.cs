using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using WardrobeApplication.Models;

namespace WardrobeApplication.Controllers
{
    public class ClosetTablesController : Controller
    {
        private WardrobeEntities db = new WardrobeEntities();

        // GET: ClosetTables
        public ActionResult Index()
        {
           
            var closetTables = db.ClosetTables.Include(c => c.BottomsTable).Include(c => c.HatsTable).Include(c => c.ShoesTable).Include(c => c.TopsTable);
            return View(closetTables.ToList());
        }

        // GET: ClosetTables/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ClosetTable closetTable = db.ClosetTables.Find(id);
            if (closetTable == null)
            {
                return HttpNotFound();
            }
            return View(closetTable);
        }

        // GET: ClosetTables/Create
        public ActionResult Create()
        {
            ViewBag.BottomsID = new SelectList(db.BottomsTables, "BottomsID", "NameBottom");
            ViewBag.HatsID = new SelectList(db.HatsTables, "HatsID", "NameHats");
            ViewBag.ShoesID = new SelectList(db.ShoesTables, "ShoesID", "NameShoes");
            ViewBag.TopsID = new SelectList(db.TopsTables, "TopsID", "NameTop");
            return View();
        }

        // POST: ClosetTables/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ClosetID,TopsID,BottomsID,ShoesID,HatsID")] ClosetTable closetTable)
        {
            if (ModelState.IsValid)
            {
                db.ClosetTables.Add(closetTable);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.BottomsID = new SelectList(db.BottomsTables, "BottomsID", "NameBottom", closetTable.BottomsID);
            ViewBag.HatsID = new SelectList(db.HatsTables, "HatsID", "NameHats", closetTable.HatsID);
            ViewBag.ShoesID = new SelectList(db.ShoesTables, "ShoesID", "NameShoes", closetTable.ShoesID);
            ViewBag.TopsID = new SelectList(db.TopsTables, "TopsID", "NameTop", closetTable.TopsID);
            return View(closetTable);
        }

        // GET: ClosetTables/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ClosetTable closetTable = db.ClosetTables.Find(id);
            if (closetTable == null)
            {
                return HttpNotFound();
            }
            ViewBag.BottomsID = new SelectList(db.BottomsTables, "BottomsID", "NameBottom", closetTable.BottomsID);
            ViewBag.HatsID = new SelectList(db.HatsTables, "HatsID", "NameHats", closetTable.HatsID);
            ViewBag.ShoesID = new SelectList(db.ShoesTables, "ShoesID", "NameShoes", closetTable.ShoesID);
            ViewBag.TopsID = new SelectList(db.TopsTables, "TopsID", "NameTop", closetTable.TopsID);
            return View(closetTable);
        }

        // POST: ClosetTables/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ClosetID,TopsID,BottomsID,ShoesID,HatsID")] ClosetTable closetTable)
        {
            if (ModelState.IsValid)
            {
                db.Entry(closetTable).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.BottomsID = new SelectList(db.BottomsTables, "BottomsID", "NameBottom", closetTable.BottomsID);
            ViewBag.HatsID = new SelectList(db.HatsTables, "HatsID", "NameHats", closetTable.HatsID);
            ViewBag.ShoesID = new SelectList(db.ShoesTables, "ShoesID", "NameShoes", closetTable.ShoesID);
            ViewBag.TopsID = new SelectList(db.TopsTables, "TopsID", "NameTop", closetTable.TopsID);
            return View(closetTable);
        }

        // GET: ClosetTables/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ClosetTable closetTable = db.ClosetTables.Find(id);
            if (closetTable == null)
            {
                return HttpNotFound();
            }
            return View(closetTable);
        }

        // POST: ClosetTables/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            ClosetTable closetTable = db.ClosetTables.Find(id);
            db.ClosetTables.Remove(closetTable);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
