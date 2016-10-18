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
    public class HatsTablesController : Controller
    {
        private WardrobeEntities db = new WardrobeEntities();

        // GET: HatsTables
        public ActionResult Index()
        {
            return View(db.HatsTables.ToList());
        }

        // GET: HatsTables/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            HatsTable hatsTable = db.HatsTables.Find(id);
            if (hatsTable == null)
            {
                return HttpNotFound();
            }
            return View(hatsTable);
        }

        // GET: HatsTables/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: HatsTables/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "HatsID,NameHats,Type,Color,Season,Occasion,Photo")] HatsTable hatsTable)
        {
            if (ModelState.IsValid)
            {
                db.HatsTables.Add(hatsTable);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(hatsTable);
        }

        // GET: HatsTables/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            HatsTable hatsTable = db.HatsTables.Find(id);
            if (hatsTable == null)
            {
                return HttpNotFound();
            }
            return View(hatsTable);
        }

        // POST: HatsTables/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "HatsID,NameHats,Type,Color,Season,Occasion,Photo")] HatsTable hatsTable)
        {
            if (ModelState.IsValid)
            {
                db.Entry(hatsTable).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(hatsTable);
        }

        // GET: HatsTables/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            HatsTable hatsTable = db.HatsTables.Find(id);
            if (hatsTable == null)
            {
                return HttpNotFound();
            }
            return View(hatsTable);
        }

        // POST: HatsTables/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            HatsTable hatsTable = db.HatsTables.Find(id);
            db.HatsTables.Remove(hatsTable);
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
