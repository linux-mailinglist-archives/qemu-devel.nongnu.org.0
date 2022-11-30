Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 338E063CD27
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 03:08:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0CUz-0002Av-C1; Tue, 29 Nov 2022 21:06:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhangdongdong@eswincomputing.com>)
 id 1p0CJB-0003O4-3k
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 20:54:45 -0500
Received: from azure-sdnproxy.icoremail.net ([20.232.28.96])
 by eggs.gnu.org with smtp (Exim 4.90_1)
 (envelope-from <zhangdongdong@eswincomputing.com>)
 id 1p0CJ8-0005Qe-T9
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 20:54:44 -0500
Received: from localhost.localdomain (unknown [10.12.130.38])
 by app2 (Coremail) with SMTP id EggMCgCXaC3at4ZjYTEUAA--.25977S5;
 Wed, 30 Nov 2022 09:54:38 +0800 (CST)
From: Dongdong Zhang <zhangdongdong@eswincomputing.com>
To: qemu-devel@nongnu.org
Cc: jsnow@redhat.com, crosa@redhat.com, bleal@redhat.com,
 Dongdong Zhang <zhangdongdong@eswincomputing.com>
Subject: [PATCH 1/1] Fix some typos
Date: Wed, 30 Nov 2022 09:53:58 +0800
Message-Id: <20221130015358.6998-2-zhangdongdong@eswincomputing.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221130015358.6998-1-zhangdongdong@eswincomputing.com>
References: <20221130015358.6998-1-zhangdongdong@eswincomputing.com>
X-CM-TRANSID: EggMCgCXaC3at4ZjYTEUAA--.25977S5
X-Coremail-Antispam: 1UD129KBjvJXoWxGw1kuFWDtFWrGFWDZw4UCFg_yoW5ur1xpF
 4UAa4ayF4FvryrZa1kXay29F1rWr1vkF47C345K3yFvas8Wa1fZr15ta4Y93yUGF4kuF1F
 9ryUGr45XF4qqaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBF14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
 x26xkF7I0E14v26r1Y6r1xM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
 Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
 A2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS
 0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
 IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
 Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY02Avz4vE-syl42xK82IYc2
 Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
 6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0x
 vE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE
 42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6x
 kF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0JUHHq7UUUUU=
X-CM-SenderInfo: x2kd0wpgrqwvxrqjqvxvzl0uprps33xlqjhudrp/1tbiAQEGCmOGTnAIkgAAsN
Received-SPF: pass client-ip=20.232.28.96;
 envelope-from=zhangdongdong@eswincomputing.com;
 helo=azure-sdnproxy.icoremail.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 29 Nov 2022 21:06:53 -0500
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Fix some typos in 'python' directory.

Signed-off-by: Dongdong Zhang <zhangdongdong@eswincomputing.com>
---
 python/qemu/machine/console_socket.py | 2 +-
 python/qemu/machine/qtest.py          | 2 +-
 python/qemu/qmp/protocol.py           | 2 +-
 python/qemu/qmp/qmp_tui.py            | 6 +++---
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/python/qemu/machine/console_socket.py b/python/qemu/machine/console_socket.py
index 8c4ff598ad..4e28ba9bb2 100644
--- a/python/qemu/machine/console_socket.py
+++ b/python/qemu/machine/console_socket.py
@@ -68,7 +68,7 @@ def _thread_start(self) -> threading.Thread:
         """Kick off a thread to drain the socket."""
         # Configure socket to not block and timeout.
         # This allows our drain thread to not block
-        # on recieve and exit smoothly.
+        # on receive and exit smoothly.
         socket.socket.setblocking(self, False)
         socket.socket.settimeout(self, 1)
         drain_thread = threading.Thread(target=self._drain_fn)
diff --git a/python/qemu/machine/qtest.py b/python/qemu/machine/qtest.py
index 1a1fc6c9b0..906bd13298 100644
--- a/python/qemu/machine/qtest.py
+++ b/python/qemu/machine/qtest.py
@@ -42,7 +42,7 @@ class QEMUQtestProtocol:
     :raise socket.error: on socket connection errors
 
     .. note::
-       No conection is estabalished by __init__(), this is done
+       No connection is estabalished by __init__(), this is done
        by the connect() or accept() methods.
     """
     def __init__(self, address: SocketAddrT,
diff --git a/python/qemu/qmp/protocol.py b/python/qemu/qmp/protocol.py
index 6ea86650ad..15909b7dba 100644
--- a/python/qemu/qmp/protocol.py
+++ b/python/qemu/qmp/protocol.py
@@ -812,7 +812,7 @@ def _done(task: Optional['asyncio.Future[Any]']) -> bool:
 
     @bottom_half
     async def _bh_close_stream(self, error_pathway: bool = False) -> None:
-        # NB: Closing the writer also implcitly closes the reader.
+        # NB: Closing the writer also implicitly closes the reader.
         if not self._writer:
             return
 
diff --git a/python/qemu/qmp/qmp_tui.py b/python/qemu/qmp/qmp_tui.py
index ce239d8979..8369144723 100644
--- a/python/qemu/qmp/qmp_tui.py
+++ b/python/qemu/qmp/qmp_tui.py
@@ -71,7 +71,7 @@ def format_json(msg: str) -> str:
     due to an decoding error then a simple string manipulation is done to
     achieve a single line JSON string.
 
-    Converting into single line is more asthetically pleasing when looking
+    Converting into single line is more aesthetically pleasing when looking
     along with error messages.
 
     Eg:
@@ -91,7 +91,7 @@ def format_json(msg: str) -> str:
 
         [1, true, 3]: QMP message is not a JSON object.
 
-    The single line mode is more asthetically pleasing.
+    The single line mode is more aesthetically pleasing.
 
     :param msg:
         The message to formatted into single line.
@@ -498,7 +498,7 @@ def __init__(self, parent: App) -> None:
 class HistoryBox(urwid.ListBox):
     """
     This widget is modelled using the ListBox widget, contains the list of
-    all messages both QMP messages and log messsages to be shown in the TUI.
+    all messages both QMP messages and log messages to be shown in the TUI.
 
     The messages are urwid.Text widgets. On every append of a message, the
     focus is shifted to the last appended message.
-- 
2.17.1


