Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B3B453A81
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 21:02:50 +0100 (CET)
Received: from localhost ([::1]:59816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mn4fJ-00020Y-B5
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 15:02:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1mn4cO-0000SN-8K
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 14:59:48 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:59227)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1mn4cK-0007dF-R3
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 14:59:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=TdnozHTYS7RP8n6+Etc5NbFgVQ2damXLBL5mk6yO/2E=; b=Ph4JR0GzVLeCAtSY6972GAoLFs
 O4sAa/ryTwTy/DnMHLZi5J86yYGdyjTU3+wmsqyEovgyrmMYfX11kFO5OdMJ3hjcB4RP+cxgsyR1c
 ihwYXwZQneag/MBR1p1+xvb0Ht+cJJrZgBxQ1/ONNx0ylvArZf0pi+oNGEwzPxXoB+eCI+VG1z70j
 ATuRrGsFJbuT4+6xekBkcQbPfwM4bnzk9vPSvU+gTVyW8kFC9A2m4UXRe7KObQV1bo7ZbLT8lsj1S
 Czu6G+mEdPGZCFQ9sQlnJCD67xCV9Xpp+eA0J4kSfEe5718x+beyw3ZzZpx0HfLV2eRCzUaLBlx6r
 V86e1aPQPgtHCh9TX1Dlp8FotzTL+o4N2i1kYnECWLrjFfmzlLO6TucdrV4/QMoINycVfZwr8VMQE
 FaogVzXDxrw0anCacFDZoexHg2f+wVP4iiegcIQXExsQ4V9BQoBPONMau887pIxKVfm2hieX/1FP2
 r9CR8t/BI1gj/4YyaYjuwhbwkz+Z5/hmEfo0FgIZLwIG3MN5aV71cbgt6rMLD5rtahE/k3eKCPRlb
 yyisicPnV9r+Zc8t6kSAeb86B/isNMNr7JLasuhUExODNgEz2PYrr+Mx9dtWMK2+r5sEjg4kb/tW7
 1Z7JDfKu+UlmGjXZ9xmMC0m4bBkUBA+LqN6mq4VXs=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH] tests/9pfs: use g_autofree where possible
Date: Tue, 16 Nov 2021 20:59:32 +0100
Message-ID: <1863782.ycR9oMG01i@silver>
In-Reply-To: <20211116191221.7a170501@bahia>
References: <E1mn1fA-0005qZ-TM@lizzy.crudebyte.com>
 <20211116191221.7a170501@bahia>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Dienstag, 16. November 2021 19:12:21 CET Greg Kurz wrote:
> On Tue, 16 Nov 2021 17:40:08 +0100
> 
> Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
> > Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > ---
> 
> Since g_autofree is scope based, I guess you could also convert this
> snippet, that appears twice in the file BTW :
> 
>     for (int i = 0; i < QTEST_V9FS_SYNTH_READDIR_NFILES; ++i) {
>         char *name = g_strdup_printf(QTEST_V9FS_SYNTH_READDIR_FILE, i);
>         g_assert_cmpint(fs_dirents_contain_name(entries, name), ==, true);
>         g_free(name);
>     }
> 
> No big deal.

Ah, that slipped through as I was misreading it as an array free.

If you don't mind I just add this on my end without sending a v2, it is 
trivial enough I think.

> Reviewed-by: Greg Kurz <groug@kaod.org>

Thanks!

> >  tests/qtest/virtio-9p-test.c | 86 +++++++++++-------------------------
> >  1 file changed, 25 insertions(+), 61 deletions(-)
> > 
> > diff --git a/tests/qtest/virtio-9p-test.c b/tests/qtest/virtio-9p-test.c
> > index 41fed41de1..11861aaf7d 100644
> > --- a/tests/qtest/virtio-9p-test.c
> > +++ b/tests/qtest/virtio-9p-test.c
> > @@ -84,7 +84,7 @@ static void pci_config(void *obj, void *data,
> > QGuestAllocator *t_alloc)> 
> >      QVirtio9P *v9p = obj;
> >      alloc = t_alloc;
> >      size_t tag_len = qvirtio_config_readw(v9p->vdev, 0);
> > 
> > -    char *tag;
> > +    g_autofree char *tag = NULL;
> > 
> >      int i;
> >      
> >      g_assert_cmpint(tag_len, ==, strlen(MOUNT_TAG));
> > 
> > @@ -94,7 +94,6 @@ static void pci_config(void *obj, void *data,
> > QGuestAllocator *t_alloc)> 
> >          tag[i] = qvirtio_config_readb(v9p->vdev, i + 2);
> >      
> >      }
> >      g_assert_cmpmem(tag, tag_len, MOUNT_TAG, tag_len);
> > 
> > -    g_free(tag);
> > 
> >  }
> >  
> >  #define P9_MAX_SIZE 4096 /* Max size of a T-message or R-message */
> > 
> > @@ -580,7 +579,7 @@ static void do_version(QVirtio9P *v9p)
> > 
> >  {
> >  
> >      const char *version = "9P2000.L";
> >      uint16_t server_len;
> > 
> > -    char *server_version;
> > +    g_autofree char *server_version = NULL;
> > 
> >      P9Req *req;
> >      
> >      req = v9fs_tversion(v9p, P9_MAX_SIZE, version, P9_NOTAG);
> > 
> > @@ -588,8 +587,6 @@ static void do_version(QVirtio9P *v9p)
> > 
> >      v9fs_rversion(req, &server_len, &server_version);
> >      
> >      g_assert_cmpmem(server_version, server_len, version,
> >      strlen(version));
> > 
> > -
> > -    g_free(server_version);
> > 
> >  }
> >  
> >  /* utility function: walk to requested dir and return fid for that dir */
> > 
> > @@ -637,7 +634,7 @@ static void fs_walk(void *obj, void *data,
> > QGuestAllocator *t_alloc)> 
> >      alloc = t_alloc;
> >      char *wnames[P9_MAXWELEM];
> >      uint16_t nwqid;
> > 
> > -    v9fs_qid *wqid;
> > +    g_autofree v9fs_qid *wqid = NULL;
> > 
> >      int i;
> >      P9Req *req;
> > 
> > @@ -655,8 +652,6 @@ static void fs_walk(void *obj, void *data,
> > QGuestAllocator *t_alloc)> 
> >      for (i = 0; i < P9_MAXWELEM; i++) {
> >      
> >          g_free(wnames[i]);
> >      
> >      }
> > 
> > -
> > -    g_free(wqid);
> > 
> >  }
> >  
> >  static bool fs_dirents_contain_name(struct V9fsDirent *e, const char*
> >  name)
> > 
> > @@ -984,7 +979,8 @@ static void fs_walk_dotdot(void *obj, void *data,
> > QGuestAllocator *t_alloc)> 
> >      QVirtio9P *v9p = obj;
> >      alloc = t_alloc;
> >      char *const wnames[] = { g_strdup("..") };
> > 
> > -    v9fs_qid root_qid, *wqid;
> > +    v9fs_qid root_qid;
> > +    g_autofree v9fs_qid *wqid = NULL;
> > 
> >      P9Req *req;
> >      
> >      do_version(v9p);
> > 
> > @@ -998,7 +994,6 @@ static void fs_walk_dotdot(void *obj, void *data,
> > QGuestAllocator *t_alloc)> 
> >      g_assert_cmpmem(&root_qid, 13, wqid[0], 13);
> > 
> > -    g_free(wqid);
> > 
> >      g_free(wnames[0]);
> >  
> >  }
> > 
> > @@ -1027,7 +1022,7 @@ static void fs_write(void *obj, void *data,
> > QGuestAllocator *t_alloc)> 
> >      alloc = t_alloc;
> >      static const uint32_t write_count = P9_MAX_SIZE / 2;
> >      char *const wnames[] = { g_strdup(QTEST_V9FS_SYNTH_WRITE_FILE) };
> > 
> > -    char *buf = g_malloc0(write_count);
> > +    g_autofree char *buf = g_malloc0(write_count);
> > 
> >      uint32_t count;
> >      P9Req *req;
> > 
> > @@ -1045,7 +1040,6 @@ static void fs_write(void *obj, void *data,
> > QGuestAllocator *t_alloc)> 
> >      v9fs_rwrite(req, &count);
> >      g_assert_cmpint(count, ==, write_count);
> > 
> > -    g_free(buf);
> > 
> >      g_free(wnames[0]);
> >  
> >  }
> > 
> > @@ -1125,7 +1119,7 @@ static void fs_flush_ignored(void *obj, void *data,
> > QGuestAllocator *t_alloc)> 
> >  static void do_mkdir(QVirtio9P *v9p, const char *path, const char *cname)
> >  {
> > 
> > -    char *const name = g_strdup(cname);
> > +    g_autofree char *name = g_strdup(cname);
> > 
> >      uint32_t fid;
> >      P9Req *req;
> > 
> > @@ -1134,15 +1128,13 @@ static void do_mkdir(QVirtio9P *v9p, const char
> > *path, const char *cname)> 
> >      req = v9fs_tmkdir(v9p, fid, name, 0750, 0, 0);
> >      v9fs_req_wait_for_reply(req, NULL);
> >      v9fs_rmkdir(req, NULL);
> > 
> > -
> > -    g_free(name);
> > 
> >  }
> >  
> >  /* create a regular file with Tlcreate and return file's fid */
> >  static uint32_t do_lcreate(QVirtio9P *v9p, const char *path,
> >  
> >                             const char *cname)
> >  
> >  {
> > 
> > -    char *const name = g_strdup(cname);
> > +    g_autofree char *name = g_strdup(cname);
> > 
> >      uint32_t fid;
> >      P9Req *req;
> > 
> > @@ -1152,7 +1144,6 @@ static uint32_t do_lcreate(QVirtio9P *v9p, const
> > char *path,> 
> >      v9fs_req_wait_for_reply(req, NULL);
> >      v9fs_rlcreate(req, NULL, NULL);
> > 
> > -    g_free(name);
> > 
> >      return fid;
> >  
> >  }
> > 
> > @@ -1160,8 +1151,8 @@ static uint32_t do_lcreate(QVirtio9P *v9p, const
> > char *path,> 
> >  static void do_symlink(QVirtio9P *v9p, const char *path, const char
> >  *clink,
> >  
> >                         const char *to)
> >  
> >  {
> > 
> > -    char *const name = g_strdup(clink);
> > -    char *const dst = g_strdup(to);
> > +    g_autofree char *name = g_strdup(clink);
> > +    g_autofree char *dst = g_strdup(to);
> > 
> >      uint32_t fid;
> >      P9Req *req;
> > 
> > @@ -1170,9 +1161,6 @@ static void do_symlink(QVirtio9P *v9p, const char
> > *path, const char *clink,> 
> >      req = v9fs_tsymlink(v9p, fid, name, dst, 0, 0);
> >      v9fs_req_wait_for_reply(req, NULL);
> >      v9fs_rsymlink(req, NULL);
> > 
> > -
> > -    g_free(dst);
> > -    g_free(name);
> > 
> >  }
> >  
> >  /* create a hard link named @a clink in directory @a path pointing to @a
> >  to */> 
> > @@ -1193,7 +1181,7 @@ static void do_hardlink(QVirtio9P *v9p, const char
> > *path, const char *clink,> 
> >  static void do_unlinkat(QVirtio9P *v9p, const char *atpath, const char
> >  *rpath,>  
> >                          uint32_t flags)
> >  
> >  {
> > 
> > -    char *const name = g_strdup(rpath);
> > +    g_autofree char *name = g_strdup(rpath);
> > 
> >      uint32_t fid;
> >      P9Req *req;
> > 
> > @@ -1202,8 +1190,6 @@ static void do_unlinkat(QVirtio9P *v9p, const char
> > *atpath, const char *rpath,> 
> >      req = v9fs_tunlinkat(v9p, fid, name, flags, 0);
> >      v9fs_req_wait_for_reply(req, NULL);
> >      v9fs_runlinkat(req);
> > 
> > -
> > -    g_free(name);
> > 
> >  }
> >  
> >  static void fs_readdir_split_128(void *obj, void *data,
> > 
> > @@ -1235,8 +1221,8 @@ static void fs_create_dir(void *obj, void *data,
> > QGuestAllocator *t_alloc)> 
> >      QVirtio9P *v9p = obj;
> >      alloc = t_alloc;
> >      struct stat st;
> > 
> > -    char *root_path = virtio_9p_test_path("");
> > -    char *new_dir = virtio_9p_test_path("01");
> > +    g_autofree char *root_path = virtio_9p_test_path("");
> > +    g_autofree char *new_dir = virtio_9p_test_path("01");
> > 
> >      g_assert(root_path != NULL);
> > 
> > @@ -1247,9 +1233,6 @@ static void fs_create_dir(void *obj, void *data,
> > QGuestAllocator *t_alloc)> 
> >      g_assert(stat(new_dir, &st) == 0);
> >      /* ... and is actually a directory */
> >      g_assert((st.st_mode & S_IFMT) == S_IFDIR);
> > 
> > -
> > -    g_free(new_dir);
> > -    g_free(root_path);
> > 
> >  }
> >  
> >  static void fs_unlinkat_dir(void *obj, void *data, QGuestAllocator
> >  *t_alloc)> 
> > @@ -1257,8 +1240,8 @@ static void fs_unlinkat_dir(void *obj, void *data,
> > QGuestAllocator *t_alloc)> 
> >      QVirtio9P *v9p = obj;
> >      alloc = t_alloc;
> >      struct stat st;
> > 
> > -    char *root_path = virtio_9p_test_path("");
> > -    char *new_dir = virtio_9p_test_path("02");
> > +    g_autofree char *root_path = virtio_9p_test_path("");
> > +    g_autofree char *new_dir = virtio_9p_test_path("02");
> > 
> >      g_assert(root_path != NULL);
> > 
> > @@ -1273,9 +1256,6 @@ static void fs_unlinkat_dir(void *obj, void *data,
> > QGuestAllocator *t_alloc)> 
> >      do_unlinkat(v9p, "/", "02", AT_REMOVEDIR);
> >      /* directory should be gone now */
> >      g_assert(stat(new_dir, &st) != 0);
> > 
> > -
> > -    g_free(new_dir);
> > -    g_free(root_path);
> > 
> >  }
> >  
> >  static void fs_create_file(void *obj, void *data, QGuestAllocator
> >  *t_alloc)
> > 
> > @@ -1283,7 +1263,7 @@ static void fs_create_file(void *obj, void *data,
> > QGuestAllocator *t_alloc)> 
> >      QVirtio9P *v9p = obj;
> >      alloc = t_alloc;
> >      struct stat st;
> > 
> > -    char *new_file = virtio_9p_test_path("03/1st_file");
> > +    g_autofree char *new_file = virtio_9p_test_path("03/1st_file");
> > 
> >      do_attach(v9p);
> >      do_mkdir(v9p, "/", "03");
> > 
> > @@ -1293,8 +1273,6 @@ static void fs_create_file(void *obj, void *data,
> > QGuestAllocator *t_alloc)> 
> >      g_assert(stat(new_file, &st) == 0);
> >      /* ... and is a regular file */
> >      g_assert((st.st_mode & S_IFMT) == S_IFREG);
> > 
> > -
> > -    g_free(new_file);
> > 
> >  }
> >  
> >  static void fs_unlinkat_file(void *obj, void *data, QGuestAllocator
> >  *t_alloc)> 
> > @@ -1302,7 +1280,7 @@ static void fs_unlinkat_file(void *obj, void *data,
> > QGuestAllocator *t_alloc)> 
> >      QVirtio9P *v9p = obj;
> >      alloc = t_alloc;
> >      struct stat st;
> > 
> > -    char *new_file = virtio_9p_test_path("04/doa_file");
> > +    g_autofree char *new_file = virtio_9p_test_path("04/doa_file");
> > 
> >      do_attach(v9p);
> >      do_mkdir(v9p, "/", "04");
> > 
> > @@ -1316,8 +1294,6 @@ static void fs_unlinkat_file(void *obj, void *data,
> > QGuestAllocator *t_alloc)> 
> >      do_unlinkat(v9p, "04", "doa_file", 0);
> >      /* file should be gone now */
> >      g_assert(stat(new_file, &st) != 0);
> > 
> > -
> > -    g_free(new_file);
> > 
> >  }
> >  
> >  static void fs_symlink_file(void *obj, void *data, QGuestAllocator
> >  *t_alloc)> 
> > @@ -1325,8 +1301,8 @@ static void fs_symlink_file(void *obj, void *data,
> > QGuestAllocator *t_alloc)> 
> >      QVirtio9P *v9p = obj;
> >      alloc = t_alloc;
> >      struct stat st;
> > 
> > -    char *real_file = virtio_9p_test_path("05/real_file");
> > -    char *symlink_file = virtio_9p_test_path("05/symlink_file");
> > +    g_autofree char *real_file = virtio_9p_test_path("05/real_file");
> > +    g_autofree char *symlink_file =
> > virtio_9p_test_path("05/symlink_file");> 
> >      do_attach(v9p);
> >      do_mkdir(v9p, "/", "05");
> > 
> > @@ -1338,9 +1314,6 @@ static void fs_symlink_file(void *obj, void *data,
> > QGuestAllocator *t_alloc)> 
> >      /* check if created link exists now */
> >      g_assert(stat(symlink_file, &st) == 0);
> > 
> > -
> > -    g_free(symlink_file);
> > -    g_free(real_file);
> > 
> >  }
> >  
> >  static void fs_unlinkat_symlink(void *obj, void *data,
> > 
> > @@ -1349,8 +1322,8 @@ static void fs_unlinkat_symlink(void *obj, void
> > *data,> 
> >      QVirtio9P *v9p = obj;
> >      alloc = t_alloc;
> >      struct stat st;
> > 
> > -    char *real_file = virtio_9p_test_path("06/real_file");
> > -    char *symlink_file = virtio_9p_test_path("06/symlink_file");
> > +    g_autofree char *real_file = virtio_9p_test_path("06/real_file");
> > +    g_autofree char *symlink_file =
> > virtio_9p_test_path("06/symlink_file");> 
> >      do_attach(v9p);
> >      do_mkdir(v9p, "/", "06");
> > 
> > @@ -1364,9 +1337,6 @@ static void fs_unlinkat_symlink(void *obj, void
> > *data,> 
> >      do_unlinkat(v9p, "06", "symlink_file", 0);
> >      /* symlink should be gone now */
> >      g_assert(stat(symlink_file, &st) != 0);
> > 
> > -
> > -    g_free(symlink_file);
> > -    g_free(real_file);
> > 
> >  }
> >  
> >  static void fs_hardlink_file(void *obj, void *data, QGuestAllocator
> >  *t_alloc)> 
> > @@ -1374,8 +1344,8 @@ static void fs_hardlink_file(void *obj, void *data,
> > QGuestAllocator *t_alloc)> 
> >      QVirtio9P *v9p = obj;
> >      alloc = t_alloc;
> >      struct stat st_real, st_link;
> > 
> > -    char *real_file = virtio_9p_test_path("07/real_file");
> > -    char *hardlink_file = virtio_9p_test_path("07/hardlink_file");
> > +    g_autofree char *real_file = virtio_9p_test_path("07/real_file");
> > +    g_autofree char *hardlink_file =
> > virtio_9p_test_path("07/hardlink_file");> 
> >      do_attach(v9p);
> >      do_mkdir(v9p, "/", "07");
> > 
> > @@ -1391,9 +1361,6 @@ static void fs_hardlink_file(void *obj, void *data,
> > QGuestAllocator *t_alloc)> 
> >      g_assert((st_link.st_mode & S_IFMT) == S_IFREG);
> >      g_assert(st_link.st_dev == st_real.st_dev);
> >      g_assert(st_link.st_ino == st_real.st_ino);
> > 
> > -
> > -    g_free(hardlink_file);
> > -    g_free(real_file);
> > 
> >  }
> >  
> >  static void fs_unlinkat_hardlink(void *obj, void *data,
> > 
> > @@ -1402,8 +1369,8 @@ static void fs_unlinkat_hardlink(void *obj, void
> > *data,> 
> >      QVirtio9P *v9p = obj;
> >      alloc = t_alloc;
> >      struct stat st_real, st_link;
> > 
> > -    char *real_file = virtio_9p_test_path("08/real_file");
> > -    char *hardlink_file = virtio_9p_test_path("08/hardlink_file");
> > +    g_autofree char *real_file = virtio_9p_test_path("08/real_file");
> > +    g_autofree char *hardlink_file =
> > virtio_9p_test_path("08/hardlink_file");> 
> >      do_attach(v9p);
> >      do_mkdir(v9p, "/", "08");
> > 
> > @@ -1419,9 +1386,6 @@ static void fs_unlinkat_hardlink(void *obj, void
> > *data,> 
> >      g_assert(stat(hardlink_file, &st_link) != 0);
> >      /* and old file should still exist */
> >      g_assert(stat(real_file, &st_real) == 0);
> > 
> > -
> > -    g_free(hardlink_file);
> > -    g_free(real_file);
> > 
> >  }
> >  
> >  static void *assign_9p_local_driver(GString *cmd_line, void *arg)



