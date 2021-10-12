Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB5542AF50
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 23:51:44 +0200 (CEST)
Received: from localhost ([::1]:40884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maPgV-0001NT-CT
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 17:51:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1maPYf-00063q-Oa
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 17:43:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1maPYc-0000T0-J9
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 17:43:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634075014;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OmNmlMU+lMrXtw7ojfZ4dpUPDyEE5IsCQi4bwPQDLI8=;
 b=bBoJRD8he98PBbfGz++O15A0iWYsjhTyz3+qHxf5/GY9JGLTwCtv3MUzn1n/FXJd4it9PZ
 IfSN5aBssh+2o5fr9GnE9FwcehpRrw/fXl6a1dbBum4Q8oQEOEEZ1ONmJQGaSVFTfi7VUW
 4p90TDjcQr9uSJCTMsbRIIk2qgJOpAY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-339-1x9YnXSKMRWwdyasHZj_jA-1; Tue, 12 Oct 2021 17:43:30 -0400
X-MC-Unique: 1x9YnXSKMRWwdyasHZj_jA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 884CA800FF0;
 Tue, 12 Oct 2021 21:43:29 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.191])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B92A05D6A8;
 Tue, 12 Oct 2021 21:43:24 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/10] python, iotests: remove socket_scm_helper
Date: Tue, 12 Oct 2021 17:41:52 -0400
Message-Id: <20211012214152.802483-11-jsnow@redhat.com>
In-Reply-To: <20211012214152.802483-1-jsnow@redhat.com>
References: <20211012214152.802483-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Daniel Berrange <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Willian Rampazzo <willianr@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It's not used anymore, now.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Message-id: 20210923004938.3999963-11-jsnow@redhat.com
Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/qemu-iotests/socket_scm_helper.c | 136 -------------------------
 python/qemu/machine/machine.py         |   3 -
 python/qemu/machine/qtest.py           |   2 -
 tests/Makefile.include                 |   1 -
 tests/meson.build                      |   4 -
 tests/qemu-iotests/iotests.py          |   3 -
 tests/qemu-iotests/meson.build         |   5 -
 tests/qemu-iotests/testenv.py          |   8 +-
 8 files changed, 1 insertion(+), 161 deletions(-)
 delete mode 100644 tests/qemu-iotests/socket_scm_helper.c
 delete mode 100644 tests/qemu-iotests/meson.build

diff --git a/tests/qemu-iotests/socket_scm_helper.c b/tests/qemu-iotests/socket_scm_helper.c
deleted file mode 100644
index eb76d31aa94..00000000000
--- a/tests/qemu-iotests/socket_scm_helper.c
+++ /dev/null
@@ -1,136 +0,0 @@
-/*
- * SCM_RIGHTS with unix socket help program for test
- *
- * Copyright IBM, Inc. 2013
- *
- * Authors:
- *  Wenchao Xia    <xiawenc@linux.vnet.ibm.com>
- *
- * This work is licensed under the terms of the GNU LGPL, version 2 or later.
- * See the COPYING.LIB file in the top-level directory.
- */
-
-#include "qemu/osdep.h"
-#include <sys/socket.h>
-#include <sys/un.h>
-
-/* #define SOCKET_SCM_DEBUG */
-
-/*
- * @fd and @fd_to_send will not be checked for validation in this function,
- * a blank will be sent as iov data to notify qemu.
- */
-static int send_fd(int fd, int fd_to_send)
-{
-    struct msghdr msg;
-    struct iovec iov[1];
-    int ret;
-    char control[CMSG_SPACE(sizeof(int))];
-    struct cmsghdr *cmsg;
-
-    memset(&msg, 0, sizeof(msg));
-    memset(control, 0, sizeof(control));
-
-    /* Send a blank to notify qemu */
-    iov[0].iov_base = (void *)" ";
-    iov[0].iov_len = 1;
-
-    msg.msg_iov = iov;
-    msg.msg_iovlen = 1;
-
-    msg.msg_control = control;
-    msg.msg_controllen = sizeof(control);
-
-    cmsg = CMSG_FIRSTHDR(&msg);
-
-    cmsg->cmsg_len = CMSG_LEN(sizeof(int));
-    cmsg->cmsg_level = SOL_SOCKET;
-    cmsg->cmsg_type = SCM_RIGHTS;
-    memcpy(CMSG_DATA(cmsg), &fd_to_send, sizeof(int));
-
-    do {
-        ret = sendmsg(fd, &msg, 0);
-    } while (ret < 0 && errno == EINTR);
-
-    if (ret < 0) {
-        fprintf(stderr, "Failed to send msg, reason: %s\n", strerror(errno));
-    }
-
-    return ret;
-}
-
-/* Convert string to fd number. */
-static int get_fd_num(const char *fd_str, bool silent)
-{
-    int sock;
-    char *err;
-
-    errno = 0;
-    sock = strtol(fd_str, &err, 10);
-    if (errno) {
-        if (!silent) {
-            fprintf(stderr, "Failed in strtol for socket fd, reason: %s\n",
-                    strerror(errno));
-        }
-        return -1;
-    }
-    if (!*fd_str || *err || sock < 0) {
-        if (!silent) {
-            fprintf(stderr, "bad numerical value for socket fd '%s'\n", fd_str);
-        }
-        return -1;
-    }
-
-    return sock;
-}
-
-/*
- * To make things simple, the caller needs to specify:
- * 1. socket fd.
- * 2. path of the file to be sent.
- */
-int main(int argc, char **argv, char **envp)
-{
-    int sock, fd, ret;
-
-#ifdef SOCKET_SCM_DEBUG
-    int i;
-    for (i = 0; i < argc; i++) {
-        fprintf(stderr, "Parameter %d: %s\n", i, argv[i]);
-    }
-#endif
-
-    if (argc != 3) {
-        fprintf(stderr,
-                "Usage: %s < socket-fd > < file-path >\n",
-                argv[0]);
-        return EXIT_FAILURE;
-    }
-
-
-    sock = get_fd_num(argv[1], false);
-    if (sock < 0) {
-        return EXIT_FAILURE;
-    }
-
-    fd = get_fd_num(argv[2], true);
-    if (fd < 0) {
-        /* Now only open a file in readonly mode for test purpose. If more
-           precise control is needed, use python script in file operation, which
-           is supposed to fork and exec this program. */
-        fd = open(argv[2], O_RDONLY);
-        if (fd < 0) {
-            fprintf(stderr, "Failed to open file '%s'\n", argv[2]);
-            return EXIT_FAILURE;
-        }
-    }
-
-    ret = send_fd(sock, fd);
-    if (ret < 0) {
-        close(fd);
-        return EXIT_FAILURE;
-    }
-
-    close(fd);
-    return EXIT_SUCCESS;
-}
diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/machine.py
index 1c6532a3d68..056d340e355 100644
--- a/python/qemu/machine/machine.py
+++ b/python/qemu/machine/machine.py
@@ -98,7 +98,6 @@ def __init__(self,
                  name: Optional[str] = None,
                  base_temp_dir: str = "/var/tmp",
                  monitor_address: Optional[SocketAddrT] = None,
-                 socket_scm_helper: Optional[str] = None,
                  sock_dir: Optional[str] = None,
                  drain_console: bool = False,
                  console_log: Optional[str] = None,
@@ -113,7 +112,6 @@ def __init__(self,
         @param name: prefix for socket and log file names (default: qemu-PID)
         @param base_temp_dir: default location where temp files are created
         @param monitor_address: address for QMP monitor
-        @param socket_scm_helper: helper program, required for send_fd_scm()
         @param sock_dir: where to create socket (defaults to base_temp_dir)
         @param drain_console: (optional) True to drain console socket to buffer
         @param console_log: (optional) path to console log file
@@ -134,7 +132,6 @@ def __init__(self,
         self._base_temp_dir = base_temp_dir
         self._sock_dir = sock_dir or self._base_temp_dir
         self._log_dir = log_dir
-        self._socket_scm_helper = socket_scm_helper
 
         if monitor_address is not None:
             self._monitor_address = monitor_address
diff --git a/python/qemu/machine/qtest.py b/python/qemu/machine/qtest.py
index 395cc8fbfe9..f2f9aaa5e50 100644
--- a/python/qemu/machine/qtest.py
+++ b/python/qemu/machine/qtest.py
@@ -115,7 +115,6 @@ def __init__(self,
                  wrapper: Sequence[str] = (),
                  name: Optional[str] = None,
                  base_temp_dir: str = "/var/tmp",
-                 socket_scm_helper: Optional[str] = None,
                  sock_dir: Optional[str] = None,
                  qmp_timer: Optional[float] = None):
         # pylint: disable=too-many-arguments
@@ -126,7 +125,6 @@ def __init__(self,
             sock_dir = base_temp_dir
         super().__init__(binary, args, wrapper=wrapper, name=name,
                          base_temp_dir=base_temp_dir,
-                         socket_scm_helper=socket_scm_helper,
                          sock_dir=sock_dir, qmp_timer=qmp_timer)
         self._qtest: Optional[QEMUQtestProtocol] = None
         self._qtest_path = os.path.join(sock_dir, name + "-qtest.sock")
diff --git a/tests/Makefile.include b/tests/Makefile.include
index 7426522bbed..7bb8961515c 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -148,7 +148,6 @@ check-acceptance: check-venv $(TESTS_RESULTS_DIR) get-vm-images
 check:
 
 ifeq ($(CONFIG_TOOLS)$(CONFIG_POSIX),yy)
-QEMU_IOTESTS_HELPERS-$(CONFIG_LINUX) = tests/qemu-iotests/socket_scm_helper$(EXESUF)
 check: check-block
 export PYTHON
 check-block: $(SRC_PATH)/tests/check-block.sh qemu-img$(EXESUF) \
diff --git a/tests/meson.build b/tests/meson.build
index 55a7b082751..3f3882748ae 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -67,10 +67,6 @@ if have_tools and 'CONFIG_VHOST_USER' in config_host and 'CONFIG_LINUX' in confi
              dependencies: [qemuutil, vhost_user])
 endif
 
-if have_system and 'CONFIG_POSIX' in config_host
-  subdir('qemu-iotests')
-endif
-
 test('decodetree', sh,
      args: [ files('decode/check.sh'), config_host['PYTHON'], files('../scripts/decodetree.py') ],
      workdir: meson.current_source_dir() / 'decode',
diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index b06ad76e0c5..e5fff6ddcfc 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -107,8 +107,6 @@
 
     qemu_valgrind = ['valgrind', valgrind_logfile, '--error-exitcode=99']
 
-socket_scm_helper = os.environ.get('SOCKET_SCM_HELPER', 'socket_scm_helper')
-
 luks_default_secret_object = 'secret,id=keysec0,data=' + \
                              os.environ.get('IMGKEYSECRET', '')
 luks_default_key_secret_opt = 'key-secret=keysec0'
@@ -598,7 +596,6 @@ def __init__(self, path_suffix=''):
         super().__init__(qemu_prog, qemu_opts, wrapper=wrapper,
                          name=name,
                          base_temp_dir=test_dir,
-                         socket_scm_helper=socket_scm_helper,
                          sock_dir=sock_dir, qmp_timer=timer)
         self._num_drives = 0
 
diff --git a/tests/qemu-iotests/meson.build b/tests/qemu-iotests/meson.build
deleted file mode 100644
index 67aed1e4927..00000000000
--- a/tests/qemu-iotests/meson.build
+++ /dev/null
@@ -1,5 +0,0 @@
-if 'CONFIG_LINUX' in config_host
-    socket_scm_helper = executable('socket_scm_helper', 'socket_scm_helper.c')
-else
-    socket_scm_helper = []
-endif
diff --git a/tests/qemu-iotests/testenv.py b/tests/qemu-iotests/testenv.py
index 99a57a69f3a..c33454fa685 100644
--- a/tests/qemu-iotests/testenv.py
+++ b/tests/qemu-iotests/testenv.py
@@ -68,7 +68,7 @@ class TestEnv(ContextManager['TestEnv']):
     env_variables = ['PYTHONPATH', 'TEST_DIR', 'SOCK_DIR', 'SAMPLE_IMG_DIR',
                      'OUTPUT_DIR', 'PYTHON', 'QEMU_PROG', 'QEMU_IMG_PROG',
                      'QEMU_IO_PROG', 'QEMU_NBD_PROG', 'QSD_PROG',
-                     'SOCKET_SCM_HELPER', 'QEMU_OPTIONS', 'QEMU_IMG_OPTIONS',
+                     'QEMU_OPTIONS', 'QEMU_IMG_OPTIONS',
                      'QEMU_IO_OPTIONS', 'QEMU_IO_OPTIONS_NO_FMT',
                      'QEMU_NBD_OPTIONS', 'IMGOPTS', 'IMGFMT', 'IMGPROTO',
                      'AIOMODE', 'CACHEMODE', 'VALGRIND_QEMU',
@@ -140,7 +140,6 @@ def init_binaries(self) -> None:
         """Init binary path variables:
              PYTHON (for bash tests)
              QEMU_PROG, QEMU_IMG_PROG, QEMU_IO_PROG, QEMU_NBD_PROG, QSD_PROG
-             SOCKET_SCM_HELPER
         """
         self.python = sys.executable
 
@@ -174,10 +173,6 @@ def root(*names: str) -> str:
             if not isxfile(b):
                 sys.exit('Not executable: ' + b)
 
-        helper_path = os.path.join(self.build_iotests, 'socket_scm_helper')
-        if isxfile(helper_path):
-            self.socket_scm_helper = helper_path  # SOCKET_SCM_HELPER
-
     def __init__(self, imgfmt: str, imgproto: str, aiomode: str,
                  cachemode: Optional[str] = None,
                  imgopts: Optional[str] = None,
@@ -303,7 +298,6 @@ def print_env(self) -> None:
 PLATFORM      -- {platform}
 TEST_DIR      -- {TEST_DIR}
 SOCK_DIR      -- {SOCK_DIR}
-SOCKET_SCM_HELPER -- {SOCKET_SCM_HELPER}
 GDB_OPTIONS   -- {GDB_OPTIONS}
 VALGRIND_QEMU -- {VALGRIND_QEMU}
 PRINT_QEMU_OUTPUT -- {PRINT_QEMU}
-- 
2.31.1


