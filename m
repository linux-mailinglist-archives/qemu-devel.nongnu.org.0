Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F43A132B3A
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jan 2020 17:39:56 +0100 (CET)
Received: from localhost ([::1]:52808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iortb-0000N8-4S
	for lists+qemu-devel@lfdr.de; Tue, 07 Jan 2020 11:39:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46296)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mst@redhat.com>) id 1iorkJ-000736-UE
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 11:30:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mst@redhat.com>) id 1iorkI-00051n-8V
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 11:30:19 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:43642
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mst@redhat.com>) id 1iorkI-00051Q-3W
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 11:30:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578414617;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2mjtemMUgB27JpLi8+N3bxzl1+0IVjBnBvvjPKdiAjc=;
 b=c9ldSnM2VvIdlBiak4kuwQsuCeFNctVJRUSVab5EqZOEDvaH4L2SILsPxQodEEMWHkBE6V
 l5h+NJ/PtJ0c3aLZ9a9uqRF1F24vY6DOxAqdHyyw2MJTRiIWaYmYxBghhlKvyVt1p9WRyS
 xb+nM9jif1H9w8z5lHMAgiiW5Vd2m1A=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-399-dHfgYL-LNYKThYYUF6a-Jw-1; Tue, 07 Jan 2020 11:30:16 -0500
Received: by mail-qv1-f69.google.com with SMTP id n11so231433qvp.15
 for <qemu-devel@nongnu.org>; Tue, 07 Jan 2020 08:30:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=P6B2QZEV+S1MRINFAeh/u30RoNzW+dHtR0xLU33u1wE=;
 b=t//CdrczMu455kZ7emNM2LK9+3UvFHtmVoupVIu7pTbS2wQe9fVOG+kO3MvoY3l3yM
 SZ1wNWZ5DAmGq0Mv2fEA6cnelWYah2SXtFa/U81Wsd1xUc28d+TeQxAV/zYA/f4NPGYe
 NrRJKBCrIAHvO1+f20xP9q7n9vZtA4Modpz21yoWYtqysgmvPnHbNyfKWyagQnLFSRFG
 L2N59JwNNTkqJ8uROQrTaip2pxCIlp4MF0gnMtLdAhFusFjl/WaeSEgKsvQ/iGolBTZR
 ICSeIWi/QL+KhGk5BwVqbtw/e5iBnp0G3MNp4g45bVTCujLfESBYERdLx4euvXQQXMht
 mgsw==
X-Gm-Message-State: APjAAAWFAKti6hsssjlefAKhcy9FQm33K833nn8diTnW6CCNVCeQIbxF
 zkSTLB43rxCep9yXVSYGpPOzlAk4FMga/LmnvljXKR3847wwZRGswD/6SKk0pW2hJ/LJjJsg7VS
 w3PQJHZfSG+tNkak=
X-Received: by 2002:a0c:fac7:: with SMTP id p7mr260249qvo.46.1578414614629;
 Tue, 07 Jan 2020 08:30:14 -0800 (PST)
X-Google-Smtp-Source: APXvYqzXsJKJIsaS7He1wfVLTgMn3Ym73X9jPiD1JuiMAF1cW/+YK1uU/tm4O29tSaxxe400Qlkw1A==
X-Received: by 2002:a0c:fac7:: with SMTP id p7mr260217qvo.46.1578414614239;
 Tue, 07 Jan 2020 08:30:14 -0800 (PST)
Received: from redhat.com (bzq-79-183-34-164.red.bezeqint.net. [79.183.34.164])
 by smtp.gmail.com with ESMTPSA id q2sm46946qkm.5.2020.01.07.08.30.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2020 08:30:13 -0800 (PST)
Date: Tue, 7 Jan 2020 11:30:10 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v3 09/32] Implement backend program convention command for
 vhost-user-blk
Message-ID: <20200107162850.411448-10-mst@redhat.com>
References: <20200107162850.411448-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200107162850.411448-1-mst@redhat.com>
X-Mailer: git-send-email 2.24.1.751.gd10ce2899c
X-Mutt-Fcc: =sent
X-MC-Unique: dHfgYL-LNYKThYYUF6a-Jw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Micky Yun Chan <chanmickyyun@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Micky Yun Chan <chanmickyyun@gmail.com>

This patch is to add standard commands defined in docs/interop/vhost-user.r=
st
For vhost-user-* program

Signed-off-by: Micky Yun Chan (michiboo) <chanmickyyun@gmail.com>
Message-Id: <20191209015331.5455-1-chanmickyyun@gmail.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 docs/interop/vhost-user.json            |  31 +++++++
 contrib/vhost-user-blk/vhost-user-blk.c | 108 ++++++++++++++----------
 docs/interop/vhost-user.rst             |  17 ++++
 3 files changed, 112 insertions(+), 44 deletions(-)

diff --git a/docs/interop/vhost-user.json b/docs/interop/vhost-user.json
index da6aaf51c8..ce0ef74db5 100644
--- a/docs/interop/vhost-user.json
+++ b/docs/interop/vhost-user.json
@@ -54,6 +54,37 @@
   ]
 }
=20
+##
+# @VHostUserBackendBlockFeature:
+#
+# List of vhost user "block" features.
+#
+# @read-only: The --read-only command line option is supported.
+# @blk-file: The --blk-file command line option is supported.
+#
+# Since: 5.0
+##
+{
+  'enum': 'VHostUserBackendBlockFeature',
+  'data': [ 'read-only', 'blk-file' ]
+}
+
+##
+# @VHostUserBackendCapabilitiesBlock:
+#
+# Capabilities reported by vhost user "block" backends
+#
+# @features: list of supported features.
+#
+# Since: 5.0
+##
+{
+  'struct': 'VHostUserBackendCapabilitiesBlock',
+  'data': {
+    'features': [ 'VHostUserBackendBlockFeature' ]
+  }
+}
+
 ##
 # @VHostUserBackendInputFeature:
 #
diff --git a/contrib/vhost-user-blk/vhost-user-blk.c b/contrib/vhost-user-b=
lk/vhost-user-blk.c
index ae61034656..6fd91c7e99 100644
--- a/contrib/vhost-user-blk/vhost-user-blk.c
+++ b/contrib/vhost-user-blk/vhost-user-blk.c
@@ -576,70 +576,90 @@ vub_new(char *blk_file)
     return vdev_blk;
 }
=20
+static int opt_fdnum =3D -1;
+static char *opt_socket_path;
+static char *opt_blk_file;
+static gboolean opt_print_caps;
+static gboolean opt_read_only;
+
+static GOptionEntry entries[] =3D {
+    { "print-capabilities", 'c', 0, G_OPTION_ARG_NONE, &opt_print_caps,
+      "Print capabilities", NULL },
+    { "fd", 'f', 0, G_OPTION_ARG_INT, &opt_fdnum,
+      "Use inherited fd socket", "FDNUM" },
+    { "socket-path", 's', 0, G_OPTION_ARG_FILENAME, &opt_socket_path,
+      "Use UNIX socket path", "PATH" },
+    {"blk-file", 'b', 0, G_OPTION_ARG_FILENAME, &opt_blk_file,
+     "block device or file path", "PATH"},
+    { "read-only", 'r', 0, G_OPTION_ARG_NONE, &opt_read_only,
+      "Enable read-only", NULL }
+};
+
 int main(int argc, char **argv)
 {
-    int opt;
-    char *unix_socket =3D NULL;
-    char *blk_file =3D NULL;
-    bool enable_ro =3D false;
     int lsock =3D -1, csock =3D -1;
     VubDev *vdev_blk =3D NULL;
+    GError *error =3D NULL;
+    GOptionContext *context;
=20
-    while ((opt =3D getopt(argc, argv, "b:rs:h")) !=3D -1) {
-        switch (opt) {
-        case 'b':
-            blk_file =3D g_strdup(optarg);
-            break;
-        case 's':
-            unix_socket =3D g_strdup(optarg);
-            break;
-        case 'r':
-            enable_ro =3D true;
-            break;
-        case 'h':
-        default:
-            printf("Usage: %s [ -b block device or file, -s UNIX domain so=
cket"
-                   " | -r Enable read-only ] | [ -h ]\n", argv[0]);
-            return 0;
+    context =3D g_option_context_new(NULL);
+    g_option_context_add_main_entries(context, entries, NULL);
+    if (!g_option_context_parse(context, &argc, &argv, &error)) {
+        g_printerr("Option parsing failed: %s\n", error->message);
+        exit(EXIT_FAILURE);
+    }
+    if (opt_print_caps) {
+        g_print("{\n");
+        g_print("  \"type\": \"block\",\n");
+        g_print("  \"features\": [\n");
+        g_print("    \"read-only\",\n");
+        g_print("    \"blk-file\"\n");
+        g_print("  ]\n");
+        g_print("}\n");
+        exit(EXIT_SUCCESS);
+    }
+
+    if (!opt_blk_file) {
+        g_print("%s\n", g_option_context_get_help(context, true, NULL));
+        exit(EXIT_FAILURE);
+    }
+
+    if (opt_socket_path) {
+        lsock =3D unix_sock_new(opt_socket_path);
+        if (lsock < 0) {
+            exit(EXIT_FAILURE);
         }
+    } else if (opt_fdnum < 0) {
+        g_print("%s\n", g_option_context_get_help(context, true, NULL));
+        exit(EXIT_FAILURE);
+    } else {
+        lsock =3D opt_fdnum;
     }
=20
-    if (!unix_socket || !blk_file) {
-        printf("Usage: %s [ -b block device or file, -s UNIX domain socket=
"
-               " | -r Enable read-only ] | [ -h ]\n", argv[0]);
-        return -1;
-    }
-
-    lsock =3D unix_sock_new(unix_socket);
-    if (lsock < 0) {
-        goto err;
-    }
-
-    csock =3D accept(lsock, (void *)0, (void *)0);
+    csock =3D accept(lsock, NULL, NULL);
     if (csock < 0) {
-        fprintf(stderr, "Accept error %s\n", strerror(errno));
-        goto err;
+        g_printerr("Accept error %s\n", strerror(errno));
+        exit(EXIT_FAILURE);
     }
=20
-    vdev_blk =3D vub_new(blk_file);
+    vdev_blk =3D vub_new(opt_blk_file);
     if (!vdev_blk) {
-        goto err;
+        exit(EXIT_FAILURE);
     }
-    if (enable_ro) {
+    if (opt_read_only) {
         vdev_blk->enable_ro =3D true;
     }
=20
     if (!vug_init(&vdev_blk->parent, VHOST_USER_BLK_MAX_QUEUES, csock,
                   vub_panic_cb, &vub_iface)) {
-        fprintf(stderr, "Failed to initialized libvhost-user-glib\n");
-        goto err;
+        g_printerr("Failed to initialize libvhost-user-glib\n");
+        exit(EXIT_FAILURE);
     }
=20
     g_main_loop_run(vdev_blk->loop);
-
+    g_main_loop_unref(vdev_blk->loop);
+    g_option_context_free(context);
     vug_deinit(&vdev_blk->parent);
-
-err:
     vub_free(vdev_blk);
     if (csock >=3D 0) {
         close(csock);
@@ -647,8 +667,8 @@ err:
     if (lsock >=3D 0) {
         close(lsock);
     }
-    g_free(unix_socket);
-    g_free(blk_file);
+    g_free(opt_socket_path);
+    g_free(opt_blk_file);
=20
     return 0;
 }
diff --git a/docs/interop/vhost-user.rst b/docs/interop/vhost-user.rst
index 7827b710aa..015ac08177 100644
--- a/docs/interop/vhost-user.rst
+++ b/docs/interop/vhost-user.rst
@@ -1376,3 +1376,20 @@ Command line options:
   Enable virgl rendering support.
=20
   (optional)
+
+vhost-user-blk
+--------------
+
+Command line options:
+
+--blk-file=3DPATH
+
+  Specify block device or file path.
+
+  (optional)
+
+--read-only
+
+  Enable read-only.
+
+  (optional)
--=20
MST


