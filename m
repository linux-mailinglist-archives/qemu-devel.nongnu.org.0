Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F7C37A7BF
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 15:34:53 +0200 (CEST)
Received: from localhost ([::1]:36014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgSXE-0003IS-Sz
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 09:34:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lgSR8-0000fZ-5j
 for qemu-devel@nongnu.org; Tue, 11 May 2021 09:28:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48036)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lgSR6-0001BM-3H
 for qemu-devel@nongnu.org; Tue, 11 May 2021 09:28:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620739711;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wAPhYU5OLFq2sZpS1SKm5uq/PilPmWus3PWArecQtMc=;
 b=Z3a44I2R3+xjsJzbwOeC5g4qM5Xc7gAq12jxarZ2ZRy/+zAMPNVpwypVmJZb/dgRlF1VwB
 hnkkdxL/JNMga85ea47/m/ta9/DuP7vdpY+qWil4bR2rVVtQPW+nCmwHZ8wNz1N+SO5VNY
 yG4hX/4EVvOwTKYL/0AWbnWvvV1hNvI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-403-bSaE_1l_Oh2mJfwDRt-8BA-1; Tue, 11 May 2021 09:28:27 -0400
X-MC-Unique: bSaE_1l_Oh2mJfwDRt-8BA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 01DBB107ACF8;
 Tue, 11 May 2021 13:28:26 +0000 (UTC)
Received: from foo.redhat.com (ovpn-115-93.ams2.redhat.com [10.36.115.93])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B77D39CA0;
 Tue, 11 May 2021 13:28:22 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 10/12] bump min required glib version to 2.50
Date: Tue, 11 May 2021 14:26:39 +0100
Message-Id: <20210511132641.1022161-11-berrange@redhat.com>
In-Reply-To: <20210511132641.1022161-1-berrange@redhat.com>
References: <20210511132641.1022161-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The glib version was not previously constrained by RHEL-7 since it
rebases fairly often. Instead SLES 12 and Ubuntu 16.04 were the
constraints in 00f2cfbbec63fb6f5a7789797a62ccedd22466ea. Both of
these are old enough that they are outside our platform support
matrix now.

Per repology, current shipping versions are:

             RHEL-8: 2.56.4
     Debian Stretch: 2.50.3
      Debian Buster: 2.58.3
 openSUSE Leap 15.2: 2.62.6
   Ubuntu LTS 18.04: 2.56.4
   Ubuntu LTS 20.04: 2.64.6
            FreeBSD: 2.66.7
          Fedora 33: 2.66.8
          Fedora 34: 2.68.1
            OpenBSD: 2.68.1
     macOS HomeBrew: 2.68.1

Thus Debian Stretch is the constraint for GLib version now.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 configure             |   2 +-
 include/glib-compat.h |   9 --
 util/oslib-win32.c    | 204 ------------------------------------------
 3 files changed, 1 insertion(+), 214 deletions(-)

diff --git a/configure b/configure
index 69631fad3b..a1a40577c9 100755
--- a/configure
+++ b/configure
@@ -3296,7 +3296,7 @@ done
 ##########################################
 # glib support probe
 
-glib_req_ver=2.48
+glib_req_ver=2.50
 glib_modules=gthread-2.0
 if test "$modules" = yes; then
     glib_modules="$glib_modules gmodule-export-2.0"
diff --git a/include/glib-compat.h b/include/glib-compat.h
index 4542e920d5..f3b2eb04da 100644
--- a/include/glib-compat.h
+++ b/include/glib-compat.h
@@ -68,15 +68,6 @@
  * without generating warnings.
  */
 
-#if defined(_WIN32) && !GLIB_CHECK_VERSION(2, 50, 0)
-/*
- * g_poll has a problem on Windows when using
- * timeouts < 10ms, so use wrapper.
- */
-#define g_poll(fds, nfds, timeout) g_poll_fixed(fds, nfds, timeout)
-gint g_poll_fixed(GPollFD *fds, guint nfds, gint timeout);
-#endif
-
 #if defined(G_OS_UNIX)
 /*
  * Note: The fallback implementation is not MT-safe, and it returns a copy of
diff --git a/util/oslib-win32.c b/util/oslib-win32.c
index 05e4ee5033..ca99356fdf 100644
--- a/util/oslib-win32.c
+++ b/util/oslib-win32.c
@@ -347,210 +347,6 @@ const char *qemu_get_exec_dir(void)
     return exec_dir;
 }
 
-#if !GLIB_CHECK_VERSION(2, 50, 0)
-/*
- * The original implementation of g_poll from glib has a problem on Windows
- * when using timeouts < 10 ms.
- *
- * Whenever g_poll is called with timeout < 10 ms, it does a quick poll instead
- * of wait. This causes significant performance degradation of QEMU.
- *
- * The following code is a copy of the original code from glib/gpoll.c
- * (glib commit 20f4d1820b8d4d0fc4447188e33efffd6d4a88d8 from 2014-02-19).
- * Some debug code was removed and the code was reformatted.
- * All other code modifications are marked with 'QEMU'.
- */
-
-/*
- * gpoll.c: poll(2) abstraction
- * Copyright 1998 Owen Taylor
- * Copyright 2008 Red Hat, Inc.
- *
- * This library is free software; you can redistribute it and/or
- * modify it under the terms of the GNU Lesser General Public
- * License as published by the Free Software Foundation; either
- * version 2.1 of the License, or (at your option) any later version.
- *
- * This library is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
- * Lesser General Public License for more details.
- *
- * You should have received a copy of the GNU Lesser General Public
- * License along with this library; if not, see <http://www.gnu.org/licenses/>.
- */
-
-static int poll_rest(gboolean poll_msgs, HANDLE *handles, gint nhandles,
-                     GPollFD *fds, guint nfds, gint timeout)
-{
-    DWORD ready;
-    GPollFD *f;
-    int recursed_result;
-
-    if (poll_msgs) {
-        /* Wait for either messages or handles
-         * -> Use MsgWaitForMultipleObjectsEx
-         */
-        ready = MsgWaitForMultipleObjectsEx(nhandles, handles, timeout,
-                                            QS_ALLINPUT, MWMO_ALERTABLE);
-
-        if (ready == WAIT_FAILED) {
-            gchar *emsg = g_win32_error_message(GetLastError());
-            g_warning("MsgWaitForMultipleObjectsEx failed: %s", emsg);
-            g_free(emsg);
-        }
-    } else if (nhandles == 0) {
-        /* No handles to wait for, just the timeout */
-        if (timeout == INFINITE) {
-            ready = WAIT_FAILED;
-        } else {
-            SleepEx(timeout, TRUE);
-            ready = WAIT_TIMEOUT;
-        }
-    } else {
-        /* Wait for just handles
-         * -> Use WaitForMultipleObjectsEx
-         */
-        ready =
-            WaitForMultipleObjectsEx(nhandles, handles, FALSE, timeout, TRUE);
-        if (ready == WAIT_FAILED) {
-            gchar *emsg = g_win32_error_message(GetLastError());
-            g_warning("WaitForMultipleObjectsEx failed: %s", emsg);
-            g_free(emsg);
-        }
-    }
-
-    if (ready == WAIT_FAILED) {
-        return -1;
-    } else if (ready == WAIT_TIMEOUT || ready == WAIT_IO_COMPLETION) {
-        return 0;
-    } else if (poll_msgs && ready == WAIT_OBJECT_0 + nhandles) {
-        for (f = fds; f < &fds[nfds]; ++f) {
-            if (f->fd == G_WIN32_MSG_HANDLE && f->events & G_IO_IN) {
-                f->revents |= G_IO_IN;
-            }
-        }
-
-        /* If we have a timeout, or no handles to poll, be satisfied
-         * with just noticing we have messages waiting.
-         */
-        if (timeout != 0 || nhandles == 0) {
-            return 1;
-        }
-
-        /* If no timeout and handles to poll, recurse to poll them,
-         * too.
-         */
-        recursed_result = poll_rest(FALSE, handles, nhandles, fds, nfds, 0);
-        return (recursed_result == -1) ? -1 : 1 + recursed_result;
-    } else if (/* QEMU: removed the following unneeded statement which causes
-                * a compiler warning: ready >= WAIT_OBJECT_0 && */
-               ready < WAIT_OBJECT_0 + nhandles) {
-        for (f = fds; f < &fds[nfds]; ++f) {
-            if ((HANDLE) f->fd == handles[ready - WAIT_OBJECT_0]) {
-                f->revents = f->events;
-            }
-        }
-
-        /* If no timeout and polling several handles, recurse to poll
-         * the rest of them.
-         */
-        if (timeout == 0 && nhandles > 1) {
-            /* Remove the handle that fired */
-            int i;
-            for (i = ready - WAIT_OBJECT_0 + 1; i < nhandles; i++) {
-                handles[i-1] = handles[i];
-            }
-            nhandles--;
-            recursed_result = poll_rest(FALSE, handles, nhandles, fds, nfds, 0);
-            return (recursed_result == -1) ? -1 : 1 + recursed_result;
-        }
-        return 1;
-    }
-
-    return 0;
-}
-
-gint g_poll_fixed(GPollFD *fds, guint nfds, gint timeout)
-{
-    HANDLE handles[MAXIMUM_WAIT_OBJECTS];
-    gboolean poll_msgs = FALSE;
-    GPollFD *f;
-    gint nhandles = 0;
-    int retval;
-
-    for (f = fds; f < &fds[nfds]; ++f) {
-        if (f->fd == G_WIN32_MSG_HANDLE && (f->events & G_IO_IN)) {
-            poll_msgs = TRUE;
-        } else if (f->fd > 0) {
-            /* Don't add the same handle several times into the array, as
-             * docs say that is not allowed, even if it actually does seem
-             * to work.
-             */
-            gint i;
-
-            for (i = 0; i < nhandles; i++) {
-                if (handles[i] == (HANDLE) f->fd) {
-                    break;
-                }
-            }
-
-            if (i == nhandles) {
-                if (nhandles == MAXIMUM_WAIT_OBJECTS) {
-                    g_warning("Too many handles to wait for!\n");
-                    break;
-                } else {
-                    handles[nhandles++] = (HANDLE) f->fd;
-                }
-            }
-        }
-    }
-
-    for (f = fds; f < &fds[nfds]; ++f) {
-        f->revents = 0;
-    }
-
-    if (timeout == -1) {
-        timeout = INFINITE;
-    }
-
-    /* Polling for several things? */
-    if (nhandles > 1 || (nhandles > 0 && poll_msgs)) {
-        /* First check if one or several of them are immediately
-         * available
-         */
-        retval = poll_rest(poll_msgs, handles, nhandles, fds, nfds, 0);
-
-        /* If not, and we have a significant timeout, poll again with
-         * timeout then. Note that this will return indication for only
-         * one event, or only for messages. We ignore timeouts less than
-         * ten milliseconds as they are mostly pointless on Windows, the
-         * MsgWaitForMultipleObjectsEx() call will timeout right away
-         * anyway.
-         *
-         * Modification for QEMU: replaced timeout >= 10 by timeout > 0.
-         */
-        if (retval == 0 && (timeout == INFINITE || timeout > 0)) {
-            retval = poll_rest(poll_msgs, handles, nhandles,
-                               fds, nfds, timeout);
-        }
-    } else {
-        /* Just polling for one thing, so no need to check first if
-         * available immediately
-         */
-        retval = poll_rest(poll_msgs, handles, nhandles, fds, nfds, timeout);
-    }
-
-    if (retval == -1) {
-        for (f = fds; f < &fds[nfds]; ++f) {
-            f->revents = 0;
-        }
-    }
-
-    return retval;
-}
-#endif
-
 int getpagesize(void)
 {
     SYSTEM_INFO system_info;
-- 
2.31.1


