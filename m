Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D1A014718F
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jan 2020 20:14:13 +0100 (CET)
Received: from localhost ([::1]:35416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iuhvf-0008Oz-TG
	for lists+qemu-devel@lfdr.de; Thu, 23 Jan 2020 14:14:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40851)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1iufdJ-0004GX-2S
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 11:47:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1iufdG-0006B1-2r
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 11:47:04 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:49020
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1iufdF-0006Al-Vh
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 11:47:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579798021;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B6mXVHYr/FGbhen88ckbal97bng9PV2hB+4vb7JhGU0=;
 b=SBwxUVV6H9ut0kUaCWjTcknRFCXiR7RwbBwghzypbwx790pX2e2uvWU0UecHRzlqZGQ0YE
 N+AvHLRsNtQexcLTPODlnCbAwRp8CBUJ3jMUe0hJcxosU7s7kt77+b3Dhlz9yIvo3AdkdH
 B/Am9TmQRW8ax9hngypFjOiK8BDspyM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-212-TSkpAExFPfG_9o4ZT7go9Q-1; Thu, 23 Jan 2020 11:46:56 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 176CC8C4C5F
 for <qemu-devel@nongnu.org>; Thu, 23 Jan 2020 16:46:56 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-116-110.ams2.redhat.com
 [10.36.116.110])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F1DB728994;
 Thu, 23 Jan 2020 16:46:51 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org,
	stefanha@redhat.com
Subject: [PULL 009/108] virtiofsd: remove unused notify reply support
Date: Thu, 23 Jan 2020 16:44:51 +0000
Message-Id: <20200123164630.91498-10-dgilbert@redhat.com>
In-Reply-To: <20200123164630.91498-1-dgilbert@redhat.com>
References: <20200123164630.91498-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: TSkpAExFPfG_9o4ZT7go9Q-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

From: Stefan Hajnoczi <stefanha@redhat.com>

Notify reply support is unused by virtiofsd.  The code would need to be
updated to validate input buffer sizes.  Remove this unused code since
changes to it are untestable.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 tools/virtiofsd/fuse_lowlevel.c | 147 +-------------------------------
 tools/virtiofsd/fuse_lowlevel.h |  47 ----------
 2 files changed, 1 insertion(+), 193 deletions(-)

diff --git a/tools/virtiofsd/fuse_lowlevel.c b/tools/virtiofsd/fuse_lowleve=
l.c
index 2f32c68161..eb0ec49d38 100644
--- a/tools/virtiofsd/fuse_lowlevel.c
+++ b/tools/virtiofsd/fuse_lowlevel.c
@@ -31,12 +31,6 @@
 #define PARAM(inarg) (((char *)(inarg)) + sizeof(*(inarg)))
 #define OFFSET_MAX 0x7fffffffffffffffLL
=20
-#define container_of(ptr, type, member)                    \
-    ({                                                     \
-        const typeof(((type *)0)->member) *__mptr =3D (ptr); \
-        (type *)((char *)__mptr - offsetof(type, member)); \
-    })
-
 struct fuse_pollhandle {
     uint64_t kh;
     struct fuse_session *se;
@@ -1862,52 +1856,6 @@ static void do_destroy(fuse_req_t req, fuse_ino_t no=
deid, const void *inarg)
     send_reply_ok(req, NULL, 0);
 }
=20
-static void list_del_nreq(struct fuse_notify_req *nreq)
-{
-    struct fuse_notify_req *prev =3D nreq->prev;
-    struct fuse_notify_req *next =3D nreq->next;
-    prev->next =3D next;
-    next->prev =3D prev;
-}
-
-static void list_add_nreq(struct fuse_notify_req *nreq,
-                          struct fuse_notify_req *next)
-{
-    struct fuse_notify_req *prev =3D next->prev;
-    nreq->next =3D next;
-    nreq->prev =3D prev;
-    prev->next =3D nreq;
-    next->prev =3D nreq;
-}
-
-static void list_init_nreq(struct fuse_notify_req *nreq)
-{
-    nreq->next =3D nreq;
-    nreq->prev =3D nreq;
-}
-
-static void do_notify_reply(fuse_req_t req, fuse_ino_t nodeid,
-                            const void *inarg, const struct fuse_buf *buf)
-{
-    struct fuse_session *se =3D req->se;
-    struct fuse_notify_req *nreq;
-    struct fuse_notify_req *head;
-
-    pthread_mutex_lock(&se->lock);
-    head =3D &se->notify_list;
-    for (nreq =3D head->next; nreq !=3D head; nreq =3D nreq->next) {
-        if (nreq->unique =3D=3D req->unique) {
-            list_del_nreq(nreq);
-            break;
-        }
-    }
-    pthread_mutex_unlock(&se->lock);
-
-    if (nreq !=3D head) {
-        nreq->reply(nreq, req, nodeid, inarg, buf);
-    }
-}
-
 static int send_notify_iov(struct fuse_session *se, int notify_code,
                            struct iovec *iov, int count)
 {
@@ -2059,95 +2007,6 @@ int fuse_lowlevel_notify_store(struct fuse_session *=
se, fuse_ino_t ino,
     return res;
 }
=20
-struct fuse_retrieve_req {
-    struct fuse_notify_req nreq;
-    void *cookie;
-};
-
-static void fuse_ll_retrieve_reply(struct fuse_notify_req *nreq, fuse_req_=
t req,
-                                   fuse_ino_t ino, const void *inarg,
-                                   const struct fuse_buf *ibuf)
-{
-    struct fuse_session *se =3D req->se;
-    struct fuse_retrieve_req *rreq =3D
-        container_of(nreq, struct fuse_retrieve_req, nreq);
-    const struct fuse_notify_retrieve_in *arg =3D inarg;
-    struct fuse_bufvec bufv =3D {
-        .buf[0] =3D *ibuf,
-        .count =3D 1,
-    };
-
-    if (!(bufv.buf[0].flags & FUSE_BUF_IS_FD)) {
-        bufv.buf[0].mem =3D PARAM(arg);
-    }
-
-    bufv.buf[0].size -=3D
-        sizeof(struct fuse_in_header) + sizeof(struct fuse_notify_retrieve=
_in);
-
-    if (bufv.buf[0].size < arg->size) {
-        fuse_log(FUSE_LOG_ERR, "fuse: retrieve reply: buffer size too smal=
l\n");
-        fuse_reply_none(req);
-        goto out;
-    }
-    bufv.buf[0].size =3D arg->size;
-
-    if (se->op.retrieve_reply) {
-        se->op.retrieve_reply(req, rreq->cookie, ino, arg->offset, &bufv);
-    } else {
-        fuse_reply_none(req);
-    }
-out:
-    free(rreq);
-}
-
-int fuse_lowlevel_notify_retrieve(struct fuse_session *se, fuse_ino_t ino,
-                                  size_t size, off_t offset, void *cookie)
-{
-    struct fuse_notify_retrieve_out outarg;
-    struct iovec iov[2];
-    struct fuse_retrieve_req *rreq;
-    int err;
-
-    if (!se) {
-        return -EINVAL;
-    }
-
-    if (se->conn.proto_major < 6 || se->conn.proto_minor < 15) {
-        return -ENOSYS;
-    }
-
-    rreq =3D malloc(sizeof(*rreq));
-    if (rreq =3D=3D NULL) {
-        return -ENOMEM;
-    }
-
-    pthread_mutex_lock(&se->lock);
-    rreq->cookie =3D cookie;
-    rreq->nreq.unique =3D se->notify_ctr++;
-    rreq->nreq.reply =3D fuse_ll_retrieve_reply;
-    list_add_nreq(&rreq->nreq, &se->notify_list);
-    pthread_mutex_unlock(&se->lock);
-
-    outarg.notify_unique =3D rreq->nreq.unique;
-    outarg.nodeid =3D ino;
-    outarg.offset =3D offset;
-    outarg.size =3D size;
-    outarg.padding =3D 0;
-
-    iov[1].iov_base =3D &outarg;
-    iov[1].iov_len =3D sizeof(outarg);
-
-    err =3D send_notify_iov(se, FUSE_NOTIFY_RETRIEVE, iov, 2);
-    if (err) {
-        pthread_mutex_lock(&se->lock);
-        list_del_nreq(&rreq->nreq);
-        pthread_mutex_unlock(&se->lock);
-        free(rreq);
-    }
-
-    return err;
-}
-
 void *fuse_req_userdata(fuse_req_t req)
 {
     return req->se->userdata;
@@ -2226,7 +2085,7 @@ static struct {
     [FUSE_POLL] =3D { do_poll, "POLL" },
     [FUSE_FALLOCATE] =3D { do_fallocate, "FALLOCATE" },
     [FUSE_DESTROY] =3D { do_destroy, "DESTROY" },
-    [FUSE_NOTIFY_REPLY] =3D { (void *)1, "NOTIFY_REPLY" },
+    [FUSE_NOTIFY_REPLY] =3D { NULL, "NOTIFY_REPLY" },
     [FUSE_BATCH_FORGET] =3D { do_batch_forget, "BATCH_FORGET" },
     [FUSE_READDIRPLUS] =3D { do_readdirplus, "READDIRPLUS" },
     [FUSE_RENAME2] =3D { do_rename2, "RENAME2" },
@@ -2333,8 +2192,6 @@ void fuse_session_process_buf_int(struct fuse_session=
 *se,
     inarg =3D (void *)&in[1];
     if (in->opcode =3D=3D FUSE_WRITE && se->op.write_buf) {
         do_write_buf(req, in->nodeid, inarg, buf);
-    } else if (in->opcode =3D=3D FUSE_NOTIFY_REPLY) {
-        do_notify_reply(req, in->nodeid, inarg, buf);
     } else {
         fuse_ll_ops[in->opcode].func(req, in->nodeid, inarg);
     }
@@ -2437,8 +2294,6 @@ struct fuse_session *fuse_session_new(struct fuse_arg=
s *args,
=20
     list_init_req(&se->list);
     list_init_req(&se->interrupts);
-    list_init_nreq(&se->notify_list);
-    se->notify_ctr =3D 1;
     fuse_mutex_init(&se->lock);
=20
     memcpy(&se->op, op, op_size);
diff --git a/tools/virtiofsd/fuse_lowlevel.h b/tools/virtiofsd/fuse_lowleve=
l.h
index 8d8909b35d..12a84b460f 100644
--- a/tools/virtiofsd/fuse_lowlevel.h
+++ b/tools/virtiofsd/fuse_lowlevel.h
@@ -1084,21 +1084,6 @@ struct fuse_lowlevel_ops {
     void (*write_buf)(fuse_req_t req, fuse_ino_t ino, struct fuse_bufvec *=
bufv,
                       off_t off, struct fuse_file_info *fi);
=20
-    /**
-     * Callback function for the retrieve request
-     *
-     * Valid replies:
-     *  fuse_reply_none
-     *
-     * @param req request handle
-     * @param cookie user data supplied to fuse_lowlevel_notify_retrieve()
-     * @param ino the inode number supplied to fuse_lowlevel_notify_retrie=
ve()
-     * @param offset the offset supplied to fuse_lowlevel_notify_retrieve(=
)
-     * @param bufv the buffer containing the returned data
-     */
-    void (*retrieve_reply)(fuse_req_t req, void *cookie, fuse_ino_t ino,
-                           off_t offset, struct fuse_bufvec *bufv);
-
     /**
      * Forget about multiple inodes
      *
@@ -1726,38 +1711,6 @@ int fuse_lowlevel_notify_delete(struct fuse_session =
*se, fuse_ino_t parent,
 int fuse_lowlevel_notify_store(struct fuse_session *se, fuse_ino_t ino,
                                off_t offset, struct fuse_bufvec *bufv,
                                enum fuse_buf_copy_flags flags);
-/**
- * Retrieve data from the kernel buffers
- *
- * Retrieve data in the kernel buffers belonging to the given inode.
- * If successful then the retrieve_reply() method will be called with
- * the returned data.
- *
- * Only present pages are returned in the retrieve reply.  Retrieving
- * stops when it finds a non-present page and only data prior to that
- * is returned.
- *
- * If this function returns an error, then the retrieve will not be
- * completed and no reply will be sent.
- *
- * This function doesn't change the dirty state of pages in the kernel
- * buffer.  For dirty pages the write() method will be called
- * regardless of having been retrieved previously.
- *
- * Added in FUSE protocol version 7.15. If the kernel does not support
- * this (or a newer) version, the function will return -ENOSYS and do
- * nothing.
- *
- * @param se the session object
- * @param ino the inode number
- * @param size the number of bytes to retrieve
- * @param offset the starting offset into the file to retrieve from
- * @param cookie user data to supply to the reply callback
- * @return zero for success, -errno for failure
- */
-int fuse_lowlevel_notify_retrieve(struct fuse_session *se, fuse_ino_t ino,
-                                  size_t size, off_t offset, void *cookie)=
;
-
=20
 /*
  * Utility functions
--=20
2.24.1


