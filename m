Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1755157E680
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jul 2022 20:27:25 +0200 (CEST)
Received: from localhost ([::1]:53274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oExMx-0003Xo-Bc
	for lists+qemu-devel@lfdr.de; Fri, 22 Jul 2022 14:27:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>) id 1oExKv-0000UF-P3
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 14:25:17 -0400
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:44903)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>) id 1oExKt-0006Wj-TM
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 14:25:17 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 296B3580AF1;
 Fri, 22 Jul 2022 14:25:15 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Fri, 22 Jul 2022 14:25:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1658514315; x=
 1658517915; bh=xjF3QlZZ8BhEp4tGWMNpXzqIf4D6XHDAwU26nTh6Dqc=; b=i
 nDw6MXJdQtCWNR5VpYRcKMnFdI3KZCrtN0f6NSlTWu7F4LidGAUkv8VqxhVAWC66
 sDLOZafYSZnbZ1NZGtvdnD9jCqFqjMFgsZ7RYStbG03oDM19+9gQ+ZEId/rIUGOs
 VKyN66AhYub1fyhZlcTlvmF8k2dmqFU6bcFVJI8h0h4W9UTaKzsTOiU+1JBGUO19
 Qo6MjCSNp3C/caRgFta9q/spzS6ytLZDGXK/wO5ELb/9TsqJzAlZhpG+V2owA0Zz
 6z9GAagtsl+Z7VcVL6VI++Krtw1/cGx+zH+HNt1jhl0OZb8AW4sYZRmcPZZXBC3+
 5s/y0LFWXaupYGJdA+qKA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1658514315; x=
 1658517915; bh=xjF3QlZZ8BhEp4tGWMNpXzqIf4D6XHDAwU26nTh6Dqc=; b=s
 btmCM5JKZIXQlNaqekngIfRjsEVYJUED4wKZS93/0tJSEdX764hf6zAt95dpL/po
 eyP1sIwkzJ0af3x80/YYlvuWvap5tVaQ9eXJTqJCvEZwIJ73FfuepjDfkHz8jhs7
 wBCJQM8zb195g+v5KYLR1J+TYmwOSdu04dA4Repr+msGmr2sLiXasB0Z3nheyrtw
 xjGJG0SaLr1x7L9zsUhhRhnY96Bv2j3BPOqhgbixbdBro84WnvbVy9/cT3dyjWlD
 NsxNSA0kqsIIHQgwPVCdM/eGsZKPZn+xRaBxwTVhD2SboECaw296nzOdtwAeuBut
 6tXDpSQeiyxBmqA7/pxCQ==
X-ME-Sender: <xms:iuvaYvDnwr0ky9tsleAooKqPAoectrSVMFjrytmkspOlQq3CNg5OAQ>
 <xme:iuvaYlh9lCEsG-yGjp8lDFuwrZE0MwjDRqxOFSJ0TTc0bcaqGVlTgsfxpDRZxdSON
 pSWiZsNfd4xkDzJo_A>
X-ME-Received: <xmr:iuvaYqnGVomfmk41T1MpcSe_ul_DI-9mk3_yQWNiwQT-IWPL8lalnFb7VPM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvddtvddguddvgecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecumhhishhsihhnghcuvffquchfihgvlhguucdlfe
 dtmdenucfjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhep
 rfgvthgvrhcuffgvlhgvvhhorhihrghsuceophgvthgvrhesphhjugdruggvvheqnecugg
 ftrfgrthhtvghrnhepvedtveffkeevuedthffgfeekvefffeduvdehiefhjeehuefhveeu
 leduteejjeetnecuffhomhgrihhnpehsthgrtghkvgigtghhrghnghgvrdgtohhmnecuve
 hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgvthgvrhes
 phhjugdruggvvh
X-ME-Proxy: <xmx:iuvaYhzYHWepFtmldA0UoMd0WkVhBJOtbC6l3f6278JQ82LJY9PgQA>
 <xmx:iuvaYkTw8XUQtfSxju53vJ2AfSGFBcBsUKB_lTSPQaO_T_geszytJQ>
 <xmx:iuvaYkYBd436_871NncXsX2Onufz_vG4D8fkiy_PRyh0aJlt8vtQGw>
 <xmx:iuvaYjEpenhrKePJ79-UTv743SqaYTUT-0nqe4aTLeux8MlH3IuFjocJlFI>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 22 Jul 2022 14:25:14 -0400 (EDT)
From: Peter Delevoryas <peter@pjd.dev>
To: 
Cc: jsnow@redhat.com, crosa@redhat.com, bleal@redhat.com, f4bug@amsat.org,
 wainersm@redhat.com, qemu-devel@nongnu.org, berrange@redhat.com,
 peter@pjd.dev
Subject: [PATCH v3 1/1] python/machine: Fix AF_UNIX path too long on macOS
Date: Fri, 22 Jul 2022 11:25:08 -0700
Message-Id: <20220722182508.89761-2-peter@pjd.dev>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220722182508.89761-1-peter@pjd.dev>
References: <20220722182508.89761-1-peter@pjd.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.224; envelope-from=peter@pjd.dev;
 helo=new2-smtp.messagingengine.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FROM_FMBLA_NEWDOM28=0.798, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On macOS, private $TMPDIR's are the default. These $TMPDIR's are
generated from a user's unix UID and UUID [1], which can create a
relatively long path:

    /var/folders/d7/rz20f6hd709c1ty8f6_6y_z40000gn/T/

QEMU's avocado tests create a temporary directory prefixed by
"avo_qemu_sock_", and create QMP sockets within _that_ as well.
The QMP socket is unnecessarily long, because a temporary directory
is created for every QEMUMachine object.

    /avo_qemu_sock_uh3w_dgc/qemu-37331-10bacf110-monitor.sock

The path limit for unix sockets on macOS is 104: [2]

    /*
     * [XSI] Definitions for UNIX IPC domain.
     */
    struct  sockaddr_un {
        unsigned char   sun_len;        /* sockaddr len including null */
        sa_family_t     sun_family;     /* [XSI] AF_UNIX */
        char            sun_path[104];  /* [XSI] path name (gag) */
    };

This results in avocado tests failing on macOS because the QMP unix
socket can't be created, because the path is too long:

    ERROR| Failed to establish connection: OSError: AF_UNIX path too long

This change resolves by reducing the size of the socket directory prefix
and the suffix on the QMP and console socket names.

The result is paths like this:

    pdel@pdel-mbp:/var/folders/d7/rz20f6hd709c1ty8f6_6y_z40000gn/T
    $ tree qemu*
    qemu_df4evjeq
    qemu_jbxel3gy
    qemu_ml9s_gg7
    qemu_oc7h7f3u
    qemu_oqb1yf97
    ├── 10a004050.con
    └── 10a004050.qmp

[1] https://apple.stackexchange.com/questions/353832/why-is-mac-osx-temp-directory-in-weird-path
[2] /Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/include/sys/un.h

Signed-off-by: Peter Delevoryas <peter@pjd.dev>
---
 python/qemu/machine/machine.py         | 6 +++---
 tests/avocado/avocado_qemu/__init__.py | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/machine.py
index 37191f433b..5df210c810 100644
--- a/python/qemu/machine/machine.py
+++ b/python/qemu/machine/machine.py
@@ -157,7 +157,7 @@ def __init__(self,
         self._wrapper = wrapper
         self._qmp_timer = qmp_timer
 
-        self._name = name or f"qemu-{os.getpid()}-{id(self):02x}"
+        self._name = name or f"{id(self):x}"
         self._temp_dir: Optional[str] = None
         self._base_temp_dir = base_temp_dir
         self._sock_dir = sock_dir
@@ -167,7 +167,7 @@ def __init__(self,
             self._monitor_address = monitor_address
         else:
             self._monitor_address = os.path.join(
-                self.sock_dir, f"{self._name}-monitor.sock"
+                self.sock_dir, f"{self._name}.qmp"
             )
 
         self._console_log_path = console_log
@@ -192,7 +192,7 @@ def __init__(self,
         self._console_set = False
         self._console_device_type: Optional[str] = None
         self._console_address = os.path.join(
-            self.sock_dir, f"{self._name}-console.sock"
+            self.sock_dir, f"{self._name}.con"
         )
         self._console_socket: Optional[socket.socket] = None
         self._remove_files: List[str] = []
diff --git a/tests/avocado/avocado_qemu/__init__.py b/tests/avocado/avocado_qemu/__init__.py
index ed4853c805..43b8c8848c 100644
--- a/tests/avocado/avocado_qemu/__init__.py
+++ b/tests/avocado/avocado_qemu/__init__.py
@@ -296,7 +296,7 @@ def require_accelerator(self, accelerator):
                         "available" % accelerator)
 
     def _new_vm(self, name, *args):
-        self._sd = tempfile.TemporaryDirectory(prefix="avo_qemu_sock_")
+        self._sd = tempfile.TemporaryDirectory(prefix="qemu_")
         vm = QEMUMachine(self.qemu_bin, base_temp_dir=self.workdir,
                          sock_dir=self._sd.name, log_dir=self.logdir)
         self.log.debug('QEMUMachine "%s" created', name)
-- 
2.37.0


