Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1619C5A916C
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 09:59:58 +0200 (CEST)
Received: from localhost ([::1]:35424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTf79-0002aW-MD
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 03:59:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qyliss@x220.qyliss.net>)
 id 1oTeaF-0003hJ-Dh
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 03:25:51 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:38939)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qyliss@x220.qyliss.net>)
 id 1oTeaC-00080S-K6
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 03:25:51 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 1FB343200944;
 Thu,  1 Sep 2022 03:18:29 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Thu, 01 Sep 2022 03:18:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alyssa.is; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :message-id:mime-version:reply-to:sender:subject:subject:to:to;
 s=fm3; t=1662016708; x=1662103108; bh=JxQxLw6B6JE7d86CxPCELN/mM
 hiuk8xUa49LYOz87Yk=; b=AhkzWMLi9d/u1xAz69bD35sWS31lJnBh/O2DXqyCB
 9lUy+vTy0whX5/Zm/OUpYwffFV8eemqAI3LwGQPDmb+F3lcLiWJjUMbVBO1PGJMy
 2n+VN6JDARFL17Uz8k+6kHoc1a/3WOQi0gZNhyBqPAm8HLUHUWG+RELlFOH8PmKJ
 TH9HaLjfJfGgY7bjtNt1XVz7x4awho7DxIvPi6lHDg0Zq9V/r9O1JLzhCLrNZNkE
 2Ankseg05DuZf5fn1xoP5mgYovQDZxbGibMtr+cHbgM1yiw/YV6WISQK5Iv1RYwc
 JWZo6NeBt3389RU6CtClykUFYEFCQnOfwLCqK6yITj7Ug==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
 1662016708; x=1662103108; bh=JxQxLw6B6JE7d86CxPCELN/mMhiuk8xUa49
 LYOz87Yk=; b=xNtDVUkLLzD1tEp84F8Oo/qRHT785+LS2E+QGmP7j7i27agzWBS
 yMzAJD67Iqs7mE12lnvCOfEv3K/cxT12oAQl9wxLt4Kx8TMDiOQrnmDAi6tNyq+M
 TJ8jH3axa3vogpTic35E2kSRk3rBo+UBw1iX2EY0hXYYgiTMepeHGfH6NV4KJO5Z
 O77Y+ionMZBTx5aXZR8PM/Y7/erQRZNQZFfJmphz1q/BwIOAfZZvCXZUM3LgEfIU
 TMK8wLHU/p/lcb3bWgXZO5ODO4D1dwrzLQYzLqHf3MafJGN9RsC9cB/La/wKoFjU
 sdN4idVmmiL9K9uVgsZjG3TrTdeGcfnrZew==
X-ME-Sender: <xms:xFwQYxjA2r_wqgUE-bdEH-aucc3l5ZuTe7iJD1DhcbdhJRXBjSZayg>
 <xme:xFwQY2B2z2YWcmMZ6aZA595s9CXhjX9OWHkauMYJGX9LGuSCCK7-ZeMd5wfEuFCe9
 1iUHTGdSQ9cSBQjjA>
X-ME-Received: <xmr:xFwQYxH_j4IGIlKSMIU31Vh6Bgnf-g0-7Hdr2L-SOlP5yA7fmIOpw_YknqKF41EH2BQOEbo99ozYddyfAP_nVyJB53q8a2nKnA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdekjedguddvudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgggfestdekre
 dtredttdenucfhrhhomheptehlhihsshgrucftohhsshcuoehhihesrghlhihsshgrrdhi
 sheqnecuggftrfgrthhtvghrnhepueefiedvheffveegieejjeevgfejjeduveekffeive
 euvedvtedvhfelieeutdfgnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhu
 shhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehqhihlihhsshesgi
 dvvddtrdhqhihlihhsshdrnhgvth
X-ME-Proxy: <xmx:xFwQY2RMCB0VOKE0B6TXM3LfA7FdJlqPoACnu3MxZi9sXexMkvCfqg>
 <xmx:xFwQY-winjFw-oyTvDqniG-njhYbcQedzD9PqugLp2ijciSBD5BAwg>
 <xmx:xFwQY86CK44-R_IogfZ4824wNln5VNOgd_SDEWYwSgYpPIN1XcvzKg>
 <xmx:xFwQY0aNvdix-1Hilut4AdqhGbrbC2U7eTxmQ8k1-XEcghdPKPgTqw>
Feedback-ID: i12284293:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 1 Sep 2022 03:18:28 -0400 (EDT)
Received: by x220.qyliss.net (Postfix, from userid 1000)
 id 8BEC4566; Thu,  1 Sep 2022 07:18:26 +0000 (UTC)
From: Alyssa Ross <hi@alyssa.is>
To: qemu-devel@nongnu.org
Cc: "Michael S . Tsirkin" <mst@redhat.com>
Subject: [PATCH] docs: clarify absence of set_features in vhost-user
Date: Thu,  1 Sep 2022 07:18:03 +0000
Message-Id: <20220901071803.273291-1-hi@alyssa.is>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: softfail client-ip=64.147.123.21;
 envelope-from=qyliss@x220.qyliss.net; helo=wout5-smtp.messagingengine.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001, SPF_SOFTFAIL=0.665,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

The previous wording was (at least to me) ambiguous about whether a
backend should enable features immediately after they were set using
VHOST_USER_SET_PROTOCOL_FEATURES, or wait for support for protocol
features to be acknowledged if it hasn't been yet before enabling
those features.

This patch attempts to make it clearer that
VHOST_USER_SET_PROTOCOL_FEATURES should immediately enable features,
even if support for protocol features has not yet been acknowledged,
while still also making clear that the frontend SHOULD acknowledge
support for protocol features.

Previous discussion begins here:
<https://lore.kernel.org/qemu-devel/87sgd1ktx9.fsf@alyssa.is/>

Cc: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Alyssa Ross <hi@alyssa.is>
---
 docs/interop/vhost-user.rst | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/docs/interop/vhost-user.rst b/docs/interop/vhost-user.rst
index 3f18ab424e..c8b9771a16 100644
--- a/docs/interop/vhost-user.rst
+++ b/docs/interop/vhost-user.rst
@@ -906,9 +906,9 @@ Front-end message types
   ``VHOST_USER_SET_FEATURES``.
 
 .. Note::
-   Back-ends that report ``VHOST_USER_F_PROTOCOL_FEATURES`` must
-   support this message even before ``VHOST_USER_SET_FEATURES`` was
-   called.
+   While QEMU should acknowledge ``VHOST_USER_F_PROTOCOL_FEATURES``, a
+   back-end must allow ``VHOST_USER_GET_PROTOCOL_FEATURES`` even if
+   ``VHOST_USER_F_PROTOCOL_FEATURES`` has not been acknowledged yet.
 
 ``VHOST_USER_SET_PROTOCOL_FEATURES``
   :id: 16
@@ -923,8 +923,12 @@ Front-end message types
   ``VHOST_USER_SET_FEATURES``.
 
 .. Note::
-   Back-ends that report ``VHOST_USER_F_PROTOCOL_FEATURES`` must support
-   this message even before ``VHOST_USER_SET_FEATURES`` was called.
+   While QEMU should acknowledge ``VHOST_USER_F_PROTOCOL_FEATURES``, a
+   back-end must allow ``VHOST_USER_SET_PROTOCOL_FEATURES`` even if
+   ``VHOST_USER_F_PROTOCOL_FEATURES`` has not been acknowledged yet.
+   The back-end must not wait for ``VHOST_USER_SET_FEATURES`` before
+   enabling protocol features requested with
+   ``VHOST_USER_SET_PROTOCOL_FEATURES``.
 
 ``VHOST_USER_SET_OWNER``
   :id: 3

base-commit: e93ded1bf6c94ab95015b33e188bc8b0b0c32670
-- 
2.37.1


