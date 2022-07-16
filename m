Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1231357706F
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Jul 2022 19:36:59 +0200 (CEST)
Received: from localhost ([::1]:56560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oClir-0000Um-SY
	for lists+qemu-devel@lfdr.de; Sat, 16 Jul 2022 13:36:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>) id 1oClgw-00067Z-Ad
 for qemu-devel@nongnu.org; Sat, 16 Jul 2022 13:34:58 -0400
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:41651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>) id 1oClgu-0004z8-8l
 for qemu-devel@nongnu.org; Sat, 16 Jul 2022 13:34:57 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 9F0FA5805C3;
 Sat, 16 Jul 2022 13:34:55 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Sat, 16 Jul 2022 13:34:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1657992895; x=
 1657996495; bh=CJh3hoK/BNf5pcgKYJOwjRXVQhzGtp1vWocDZ5WMbtU=; b=P
 08QUS7dwkuAJUftZ+1nel3gPk3z04BH5dfPZTxAOaMFjeqy/nTVu0ba01EDkzP+U
 0iJbGEUOhx/BdWlwbID9/bkhOu0wzyDZp6NaCPvPdC1NPXuhk1CbbZVAcYW2t1kN
 iKrL5rfoEZL8G0VSSJMzgonJvERvJFLTsG1vva5/rDgjIK1n7y7KQ5pmw5g89bgy
 Lxoi9XCwwg/joph2L482rAvBFPyexhZVtbN1Y6Zpp49eW1UiaEAtYDIZbfMKOTZH
 h/LpXvUX1IY2WSIHpSmW+P72/5KSn0yr7S4OlxpMpPeS/I/mTxuj7kSTf8Rgv537
 FAnRPqa1u2eJEztk4h33A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1657992895; x=
 1657996495; bh=CJh3hoK/BNf5pcgKYJOwjRXVQhzGtp1vWocDZ5WMbtU=; b=e
 6iU6qRI23GGz5Gn2HSuWFxBWSA8JgYEiMpQi1S5HmRKFeXVza/fwUAvZtt1ZClge
 szJ343QLTFWCg932Xkm/W7aniTnDWmyuOo/tO1l+OKFLPU11YYst/ig3S+//LQiT
 FMgVMu/6Ba95gCVwexTp2xpMEWQBqn6yp75ip+I9GgeYQPYdT3R3Dt/zkLlUaWoV
 cJDN54ExzNNJFCoM+RhBGGjVaxQz3Ubn2Oa4OuXl9ibexIgDCzztwdAjHOfo7Pk7
 3Ke1HjPOCuMmE0VZaSJylljCGM1jH1IDJhqN2zvUpsyR2z3HINv1JEPHlwl7YD1v
 CEr9DLgHmMdvOpdBQg3CA==
X-ME-Sender: <xms:v_bSYqhKnY6RwEj1QK1eRpkcxT-HK2tezy1c7TPtTgcyouNxGz1lqA>
 <xme:v_bSYrDV4dQHKDHexCk_X6SdGd5lXizpkP2Mjfh0rOrHqdK6L-GCJI8XcGNBTP9Wj
 USOF1CnCdigCKuKJgw>
X-ME-Received: <xmr:v_bSYiF0xB8V46rCbZu4t6n3y4PunEw-B5zZuxXqdtn9zbbLxYNygnynjotn4gXUe-DPjHDKCGDgGyj6ZLKWuiqEg68ucc6j>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudekfedguddujecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecumhhishhsihhnghcuvffquchfihgvlhguucdlfe
 dtmdenucfjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhep
 rfgvthgvrhcuffgvlhgvvhhorhihrghsuceophgvthgvrhesphhjugdruggvvheqnecugg
 ftrfgrthhtvghrnhepvedtveffkeevuedthffgfeekvefffeduvdehiefhjeehuefhveeu
 leduteejjeetnecuffhomhgrihhnpehsthgrtghkvgigtghhrghnghgvrdgtohhmnecuve
 hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgvthgvrhes
 phhjugdruggvvh
X-ME-Proxy: <xmx:v_bSYjSESvh3h8RDK7Lxpyfsod54tAg2nlSG2EsI-KF9L__uvm-hMQ>
 <xmx:v_bSYnzGtN7P5SbAJfS7ouIZicTP3Kw-p6NWQPxGaduyZkw7yyItAA>
 <xmx:v_bSYh6HgkCs4pwQmfCNQLF9mwPTs615b2gSnNPbIto0k7GErI6Mtw>
 <xmx:v_bSYumpEvD7dWlAOQFGSkwH8L1Djh1gKKadmTQ7LKFHi2y2pQy60Q>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 16 Jul 2022 13:34:55 -0400 (EDT)
From: Peter Delevoryas <peter@pjd.dev>
To: 
Cc: jsnow@redhat.com, crosa@redhat.com, bleal@redhat.com, f4bug@amsat.org,
 wainersm@redhat.com, qemu-devel@nongnu.org, berrange@redhat.com,
 peter@pjd.dev
Subject: [PATCH v2 1/1] python/machine: Fix AF_UNIX path too long on macOS
Date: Sat, 16 Jul 2022 10:34:34 -0700
Message-Id: <20220716173434.17183-2-peter@pjd.dev>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220716173434.17183-1-peter@pjd.dev>
References: <20220716173434.17183-1-peter@pjd.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.230; envelope-from=peter@pjd.dev;
 helo=new4-smtp.messagingengine.com
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

This change reduces the size of both paths, and removes the unique
identification information from the socket name, since it seems to be
unnecessary.

This commit produces paths like the following:

    pdel@pdel-mbp:/var/folders/d7/rz20f6hd709c1ty8f6_6y_z40000gn/T
    $ tree qemu*
    qemu_oc7h7f3u
    ├── qmp-console.sock
    └── qmp-monitor.sock

[1] https://apple.stackexchange.com/questions/353832/why-is-mac-osx-temp-directory-in-weird-path
[2] /Library/Developer/CommandLineTools/SDKs/MacOSX12.3.sdk/usr/include/sys/un.h

Signed-off-by: Peter Delevoryas <peter@pjd.dev>
---
 python/qemu/machine/machine.py         | 2 +-
 tests/avocado/avocado_qemu/__init__.py | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/machine.py
index 37191f433b..b1823966b3 100644
--- a/python/qemu/machine/machine.py
+++ b/python/qemu/machine/machine.py
@@ -157,7 +157,7 @@ def __init__(self,
         self._wrapper = wrapper
         self._qmp_timer = qmp_timer
 
-        self._name = name or f"qemu-{os.getpid()}-{id(self):02x}"
+        self._name = name or "qmp"
         self._temp_dir: Optional[str] = None
         self._base_temp_dir = base_temp_dir
         self._sock_dir = sock_dir
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


