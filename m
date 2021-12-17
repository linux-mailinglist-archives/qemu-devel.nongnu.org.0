Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E851479551
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 21:15:41 +0100 (CET)
Received: from localhost ([::1]:33924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myJdk-0006xE-C9
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 15:15:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1myJYl-0005wH-8J; Fri, 17 Dec 2021 15:10:31 -0500
Received: from mout.kundenserver.de ([212.227.126.135]:55323)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1myJYj-0001K7-C5; Fri, 17 Dec 2021 15:10:30 -0500
Received: from quad ([82.142.30.186]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1M72Xn-1mrRXC1K3T-008XfC; Fri, 17
 Dec 2021 21:10:25 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 7/9] glib-compat: Introduce g_memdup2() wrapper
Date: Fri, 17 Dec 2021 21:10:17 +0100
Message-Id: <20211217201019.1652798-8-laurent@vivier.eu>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211217201019.1652798-1-laurent@vivier.eu>
References: <20211217201019.1652798-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:UeMXTxEg4EZxikICzR28+jbzOvBt+qYBo66QQvSlzlZMPxYxKa6
 8Zlt9gUR0RdLQMwks26xphRyjvlaUyzVLqNPRDwCLH7pAJxixV4O55pIHJ8U56BwlTvYS61
 NhPs0MIJYnWB+y9AWCa1FBub2s97dViQduaDqdZ1GOVslhiFOHHMWOPgjW3fA19ugC8rkD6
 uk2RwfHlUVLiu0dimD92g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:QJFJ1H0ftOo=:fML5X/pRHoasRnp12sVCgd
 cwiihyEKbXMSamd4gOKNEQ5VM9RJlwwAqa3aBeErm7CblgRc80Y00obtvJBgq8sfXJtTPpbCl
 PeqmzfKRONkmxrzp709EuAxpLcP8nv3uvoY2FUYQr00tDhL09VvAUUJg5x1HSP3Um73LS5gV3
 J/7uBUWgMPFKvIhzfDMo+jpgpXM+yWMtvnQfpNRcrM08gR9d7Njq9uGL4YV+JUPnoOwcjlnIK
 61o/sjN5Ah28pEoEOeMhYZK4e4o3nKi9I9b/bzGjxqRrS9O/3PchRIUhDFWX8agf6SXOGTdL/
 43+ZGKU1IZRnoYmICliNbSfp4ju01pYe8bOHlkUNIX9PRWy5idqqOOW5pP8ndIXFrZgYh3aXv
 6L9hkuDJ8UC8TK5JzAQCn5arEbHTqA4gYyUQZZyeufiyosNcxQn7s1LRG+U8Hiu3HTOOVz0pc
 YBv83WT70KQgMkxF1dJS9nogHgm+4Xx1MJNy5L+/M450qGI/i5tDvtw/Q5/ZiDb1rKanRQ81J
 qovb1CwRd0KsJq6eZFE/9AdNVBZBYo8TGgscSu/Eh6t5z46G8NcJynl8IMgX+S587jEA0WHxA
 ZSg3BoNJNzvPiRm6XxoOrPEzax0sKnf6oKZMn6BckgNQuCv6y5hMCv+Q3Ro+7TKqzIwNwnsUQ
 27QldzoOXxVHV/BMS83MlnnGlREKrwM0lErS1HM7EOW6Rj+f3wOCxRwR6CK765/0q9J8=
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Eric Blake <eblake@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

When experimenting raising GLIB_VERSION_MIN_REQUIRED to 2.68
(Fedora 34 provides GLib 2.68.1) we get:

  hw/virtio/virtio-crypto.c:245:24: error: 'g_memdup' is deprecated: Use 'g_memdup2' instead [-Werror,-Wdeprecated-declarations]
  ...

g_memdup() has been updated by g_memdup2() to fix eventual security
issues (size argument is 32-bit and could be truncated / wrapping).
GLib recommends to copy their static inline version of g_memdup2():
https://discourse.gnome.org/t/port-your-module-from-g-memdup-to-g-memdup2-now/5538

Our glib-compat.h provides a comment explaining how to deal with
these deprecated declarations (see commit e71e8cc0355
"glib: enforce the minimum required version and warn about old APIs").

Following this comment suggestion, implement the g_memdup2_qemu()
wrapper to g_memdup2(), and use the safer equivalent inlined when
we are using pre-2.68 GLib.

Reported-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Message-Id: <20210903174510.751630-3-philmd@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 include/glib-compat.h | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/include/glib-compat.h b/include/glib-compat.h
index 9e95c888f54f..8d01a8c01fb8 100644
--- a/include/glib-compat.h
+++ b/include/glib-compat.h
@@ -68,6 +68,43 @@
  * without generating warnings.
  */
 
+/*
+ * g_memdup2_qemu:
+ * @mem: (nullable): the memory to copy.
+ * @byte_size: the number of bytes to copy.
+ *
+ * Allocates @byte_size bytes of memory, and copies @byte_size bytes into it
+ * from @mem. If @mem is %NULL it returns %NULL.
+ *
+ * This replaces g_memdup(), which was prone to integer overflows when
+ * converting the argument from a #gsize to a #guint.
+ *
+ * This static inline version is a backport of the new public API from
+ * GLib 2.68, kept internal to GLib for backport to older stable releases.
+ * See https://gitlab.gnome.org/GNOME/glib/-/issues/2319.
+ *
+ * Returns: (nullable): a pointer to the newly-allocated copy of the memory,
+ *          or %NULL if @mem is %NULL.
+ */
+static inline gpointer g_memdup2_qemu(gconstpointer mem, gsize byte_size)
+{
+#if GLIB_CHECK_VERSION(2, 68, 0)
+    return g_memdup2(mem, byte_size);
+#else
+    gpointer new_mem;
+
+    if (mem && byte_size != 0) {
+        new_mem = g_malloc(byte_size);
+        memcpy(new_mem, mem, byte_size);
+    } else {
+        new_mem = NULL;
+    }
+
+    return new_mem;
+#endif
+}
+#define g_memdup2(m, s) g_memdup2_qemu(m, s)
+
 #if defined(G_OS_UNIX)
 /*
  * Note: The fallback implementation is not MT-safe, and it returns a copy of
-- 
2.33.1


