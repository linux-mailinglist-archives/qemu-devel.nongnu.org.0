Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5574867A8D2
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Jan 2023 03:36:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKVcl-0008DP-Rf; Tue, 24 Jan 2023 21:34:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pKVcj-0008Cu-Pz
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 21:34:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pKVci-0005LP-1M
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 21:34:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674614091;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4xT6CcNZptOwqyiLv/EWJ7ABnDSmBj18pWnLojDvO3c=;
 b=CbCm5RMiAHpq3YAotuPA53rLGmjf2sTfypJNMSaz2YHf9mdxd7wCc69FefmbXQhNa8XRbb
 u6oTQNJLc+JoYWnEMSRHcwGvq2iXkqf2xT+83KSVMN6Adxbv5K9w4ZFdVHpBr2iO50EDSg
 1JprPCiO6o+e1y3c4mHyy7xQYlrDO3E=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-180-krgcCGueOT-vLUqSMoNBUQ-1; Tue, 24 Jan 2023 21:34:48 -0500
X-MC-Unique: krgcCGueOT-vLUqSMoNBUQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 79DBB29A9CA3;
 Wed, 25 Jan 2023 02:34:47 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.119])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E91222026D4B;
 Wed, 25 Jan 2023 02:34:46 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, John Snow <jsnow@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org,
 Cleber Rosa <crosa@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 Beraldo Leal <bleal@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Dongdong Zhang <zhangdongdong@eswincomputing.com>
Subject: [PULL 1/7] Fix some typos
Date: Tue, 24 Jan 2023 21:34:39 -0500
Message-Id: <20230125023445.3655253-2-jsnow@redhat.com>
In-Reply-To: <20230125023445.3655253-1-jsnow@redhat.com>
References: <20230125023445.3655253-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Dongdong Zhang <zhangdongdong@eswincomputing.com>

Fix some typos in 'python' directory.

Signed-off-by: Dongdong Zhang <zhangdongdong@eswincomputing.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-id: 20221130015358.6998-2-zhangdongdong@eswincomputing.com
[Fixed additional typo spotted by Max Filippov. --js]
Reviewed-by: John Snow <jsnow@redhat.com>
Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/machine/console_socket.py | 2 +-
 python/qemu/machine/qtest.py          | 2 +-
 python/qemu/qmp/protocol.py           | 2 +-
 python/qemu/qmp/qmp_tui.py            | 6 +++---
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/python/qemu/machine/console_socket.py b/python/qemu/machine/console_socket.py
index 8c4ff598ad7..4e28ba9bb23 100644
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
index 1a1fc6c9b08..1c46138bd0c 100644
--- a/python/qemu/machine/qtest.py
+++ b/python/qemu/machine/qtest.py
@@ -42,7 +42,7 @@ class QEMUQtestProtocol:
     :raise socket.error: on socket connection errors
 
     .. note::
-       No conection is estabalished by __init__(), this is done
+       No connection is established by __init__(), this is done
        by the connect() or accept() methods.
     """
     def __init__(self, address: SocketAddrT,
diff --git a/python/qemu/qmp/protocol.py b/python/qemu/qmp/protocol.py
index 6ea86650ad2..15909b7dbad 100644
--- a/python/qemu/qmp/protocol.py
+++ b/python/qemu/qmp/protocol.py
@@ -812,7 +812,7 @@ async def _bh_flush_writer(self) -> None:
 
     @bottom_half
     async def _bh_close_stream(self, error_pathway: bool = False) -> None:
-        # NB: Closing the writer also implcitly closes the reader.
+        # NB: Closing the writer also implicitly closes the reader.
         if not self._writer:
             return
 
diff --git a/python/qemu/qmp/qmp_tui.py b/python/qemu/qmp/qmp_tui.py
index ce239d8979b..83691447231 100644
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
2.39.0


