Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DDD6143D00
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jan 2020 13:38:23 +0100 (CET)
Received: from localhost ([::1]:53168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1itsnV-0000Ii-Sb
	for lists+qemu-devel@lfdr.de; Tue, 21 Jan 2020 07:38:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51029)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1itsb5-0005KU-Uo
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 07:25:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1itsb2-0001nf-1U
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 07:25:31 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:58408
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1itsb1-0001nP-TJ
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 07:25:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579609527;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z7pshSYtaQLpzqjUaEkNukuVp3q7GoT4DmjlHMRRBJg=;
 b=MPxnhixS7pxXGnTUlbNLxasfO+kOdEQW3a3DJk4oly/rpv9EaVEmqILhffgaKY9IOij2qS
 YNNvOzhUvxmriF8Rlnb16CulFj3yycsSXThhRdpnPjnB7srpd7qJ8i5XzA4a//UeZ/zAkA
 oYynteZhQ1ua0QzpzCHaRdzraUOYoaU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-144-9rHFOm3kMPan2bYNscsnjg-1; Tue, 21 Jan 2020 07:25:26 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1F940A0CBF;
 Tue, 21 Jan 2020 12:25:25 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.36.118.32])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 15C0060BE0;
 Tue, 21 Jan 2020 12:25:17 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, stefanha@redhat.com, vgoyal@redhat.com,
 berrange@redhat.com, slp@redhat.com, philmd@redhat.com
Subject: [PATCH v2 008/109] virtiofsd: remove mountpoint dummy argument
Date: Tue, 21 Jan 2020 12:22:52 +0000
Message-Id: <20200121122433.50803-9-dgilbert@redhat.com>
In-Reply-To: <20200121122433.50803-1-dgilbert@redhat.com>
References: <20200121122433.50803-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: 9rHFOm3kMPan2bYNscsnjg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
Cc: m.mizuma@jp.fujitsu.com, misono.tomohiro@jp.fujitsu.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefan Hajnoczi <stefanha@redhat.com>

Classic FUSE file system daemons take a mountpoint argument but
virtiofsd exposes a vhost-user UNIX domain socket instead.  The
mountpoint argument is not used by virtiofsd but the user is still
required to pass a dummy argument on the command-line.

Remove the mountpoint argument to clean up the command-line.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
---
 tools/virtiofsd/fuse_lowlevel.c  |  2 +-
 tools/virtiofsd/fuse_lowlevel.h  |  4 +---
 tools/virtiofsd/helper.c         | 20 +++-----------------
 tools/virtiofsd/passthrough_ll.c | 12 ++----------
 4 files changed, 7 insertions(+), 31 deletions(-)

diff --git a/tools/virtiofsd/fuse_lowlevel.c b/tools/virtiofsd/fuse_lowleve=
l.c
index 117298683a..3219123b35 100644
--- a/tools/virtiofsd/fuse_lowlevel.c
+++ b/tools/virtiofsd/fuse_lowlevel.c
@@ -2471,7 +2471,7 @@ out1:
     return NULL;
 }
=20
-int fuse_session_mount(struct fuse_session *se, const char *mountpoint)
+int fuse_session_mount(struct fuse_session *se)
 {
     int fd;
=20
diff --git a/tools/virtiofsd/fuse_lowlevel.h b/tools/virtiofsd/fuse_lowleve=
l.h
index 719730c111..9919181c68 100644
--- a/tools/virtiofsd/fuse_lowlevel.h
+++ b/tools/virtiofsd/fuse_lowlevel.h
@@ -1864,7 +1864,6 @@ struct fuse_cmdline_opts {
     int foreground;
     int debug;
     int nodefault_subtype;
-    char *mountpoint;
     int show_version;
     int show_help;
     unsigned int max_idle_threads;
@@ -1925,12 +1924,11 @@ struct fuse_session *fuse_session_new(struct fuse_a=
rgs *args,
 /**
  * Mount a FUSE file system.
  *
- * @param mountpoint the mount point path
  * @param se session object
  *
  * @return 0 on success, -1 on failure.
  **/
-int fuse_session_mount(struct fuse_session *se, const char *mountpoint);
+int fuse_session_mount(struct fuse_session *se);
=20
 /**
  * Enter a single threaded, blocking event loop.
diff --git a/tools/virtiofsd/helper.c b/tools/virtiofsd/helper.c
index f37de149a3..46466f4054 100644
--- a/tools/virtiofsd/helper.c
+++ b/tools/virtiofsd/helper.c
@@ -142,27 +142,13 @@ void fuse_cmdline_help(void)
 static int fuse_helper_opt_proc(void *data, const char *arg, int key,
                                 struct fuse_args *outargs)
 {
+    (void)data;
     (void)outargs;
-    struct fuse_cmdline_opts *opts =3D data;
=20
     switch (key) {
     case FUSE_OPT_KEY_NONOPT:
-        if (!opts->mountpoint) {
-            if (fuse_mnt_parse_fuse_fd(arg) !=3D -1) {
-                return fuse_opt_add_opt(&opts->mountpoint, arg);
-            }
-
-            char mountpoint[PATH_MAX] =3D "";
-            if (realpath(arg, mountpoint) =3D=3D NULL) {
-                fuse_log(FUSE_LOG_ERR, "fuse: bad mount point `%s': %s\n",=
 arg,
-                         strerror(errno));
-                return -1;
-            }
-            return fuse_opt_add_opt(&opts->mountpoint, mountpoint);
-        } else {
-            fuse_log(FUSE_LOG_ERR, "fuse: invalid argument `%s'\n", arg);
-            return -1;
-        }
+        fuse_log(FUSE_LOG_ERR, "fuse: invalid argument `%s'\n", arg);
+        return -1;
=20
     default:
         /* Pass through unknown options */
diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough=
_ll.c
index c5850ef803..9377718d9d 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -1297,7 +1297,7 @@ int main(int argc, char *argv[])
         return 1;
     }
     if (opts.show_help) {
-        printf("usage: %s [options] <mountpoint>\n\n", argv[0]);
+        printf("usage: %s [options]\n\n", argv[0]);
         fuse_cmdline_help();
         fuse_lowlevel_help();
         ret =3D 0;
@@ -1308,13 +1308,6 @@ int main(int argc, char *argv[])
         goto err_out1;
     }
=20
-    if (opts.mountpoint =3D=3D NULL) {
-        printf("usage: %s [options] <mountpoint>\n", argv[0]);
-        printf("       %s --help\n", argv[0]);
-        ret =3D 1;
-        goto err_out1;
-    }
-
     if (fuse_opt_parse(&args, &lo, lo_opts, NULL) =3D=3D -1) {
         return 1;
     }
@@ -1374,7 +1367,7 @@ int main(int argc, char *argv[])
         goto err_out2;
     }
=20
-    if (fuse_session_mount(se, opts.mountpoint) !=3D 0) {
+    if (fuse_session_mount(se) !=3D 0) {
         goto err_out3;
     }
=20
@@ -1393,7 +1386,6 @@ err_out3:
 err_out2:
     fuse_session_destroy(se);
 err_out1:
-    free(opts.mountpoint);
     fuse_opt_free_args(&args);
=20
     if (lo.root.fd >=3D 0) {
--=20
2.24.1


