Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD1C13494DE
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 16:03:15 +0100 (CET)
Received: from localhost ([::1]:48876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPRVy-000108-Qn
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 11:03:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qyliss@x220.qyliss.net>)
 id 1lPRTz-0007u4-5g
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 11:01:12 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:44259)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qyliss@x220.qyliss.net>)
 id 1lPRTt-0003TK-7j
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 11:01:08 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 38DF95C015E;
 Thu, 25 Mar 2021 10:48:56 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Thu, 25 Mar 2021 10:48:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alyssa.is; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm2; bh=HRHEphmII1Y9ED0NNzoUdVTb0R
 il8sG1H2Z4FPOrTeE=; b=XLQmyArfm6MWx94bzoeMd0RHil/tbzZqUC2CIcxTpI
 NE91TWZNM4riPyO7mZBN3eewNRTOjLnlrwWEBzs0DlbDHJDTb6YbuMxo5pOGF1AN
 +xDLsa8vi9XuXjl5S7YEO8PeD46cnfe70S28PZjHjmABcKAZnjzXH5JEa3RSoDKN
 t0PPnThIp4VTLfHnorFPvntQDQLxr70GjgJn/8wjRi+H1QgTFRfIc3dl+sVxOA93
 SymzJvoXqdH/zWkRLJYmKzzWmJp5FfVDB492TdJCtAnpoKiupGCYWphHd3pMHJGn
 R+KM7TUo/fbUjG+DYp6RS1mXsSbvqEu2LtRVEN2RVDEg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=HRHEphmII1Y9ED0NN
 zoUdVTb0Ril8sG1H2Z4FPOrTeE=; b=rcGOLkDfJn6v3y3t3JYG2Z0GjoinCGhO/
 cAfA7+zM/OGGIV/q7Lt1Gtin87xOcCMPi5grLF2tBW95vbSXrMzKsq0x4XWsv6tu
 OPirb1UFGVt5Tu8De8WagmiCn7kGj1QjCMog0c54k/lTkMyqMNyMRZXYIKiYSOZf
 W+zBVj2oH1/xGX8OtuIWctMUPzVxRkNtiZtUl4BEemJNrFaa1/5xQ3HUZeUoGHfA
 MEX/vsHdnPZ8Lg60VRLD4ACdQTjqUyvy+hFts2ZQD97BZQCCnrfxnIEsTanQ0P+L
 mCAb8BqX2L4XhttYGaWM7B/xbcokzRWeS/NIXtT9nx5iajDBI1i7g==
X-ME-Sender: <xms:2KJcYLjaod9bJ2TXTl1-YiGv2WLxsT1Rcr24vK3nUbiIUnuWwP00iw>
 <xme:2KJcYH_xgDx__TIcIUPSSCB4iR79VlIo6FP2Nb8catd_7BPEUn40_S9RsZa6D2E1P
 N2ErjXWXTLqGwvk1Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudehtddgieelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
 dttdenucfhrhhomheptehlhihsshgrucftohhsshcuoehhihesrghlhihsshgrrdhisheq
 necuggftrfgrthhtvghrnhephefgtdelieffueevgeekueffhedvvefhteefheefffelte
 etvddvgeekuddugefgnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepkeeg
 rddukeegrddvfedtrddvudelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
 hmrghilhhfrhhomhepqhihlhhishhsseigvddvtddrqhihlhhishhsrdhnvght
X-ME-Proxy: <xmx:2KJcYH_iFwC_FMeCXCS9_25DpnDWv6EdeSfqHCQrA47enyj2-PweCg>
 <xmx:2KJcYAB3aDDNxkbDhL8Y8yam7vc0etw-WreYZ6ddOlhfwfb6IRWgaQ>
 <xmx:2KJcYHy0YzoR3jUIKdwUXOusJcLJv0xRFmcyYfhUwfhSKpJpBEQ4qA>
 <xmx:2KJcYDIgnYxIWtC22Le3Us51bKK0hq9BHd46a1QtkpTJKOLgAOkLsQ>
Received: from x220.qyliss.net (p54b8e6db.dip0.t-ipconnect.de [84.184.230.219])
 by mail.messagingengine.com (Postfix) with ESMTPA id ED3F9240054;
 Thu, 25 Mar 2021 10:48:55 -0400 (EDT)
Received: by x220.qyliss.net (Postfix, from userid 1000)
 id 47C4F91C; Thu, 25 Mar 2021 14:48:54 +0000 (UTC)
From: Alyssa Ross <hi@alyssa.is>
To: qemu-devel@nongnu.org
Subject: [PATCH RESEND] docs: clarify absence of set_features in vhost-user
Date: Thu, 25 Mar 2021 14:48:46 +0000
Message-Id: <20210325144846.17520-1-hi@alyssa.is>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: softfail client-ip=66.111.4.28;
 envelope-from=qyliss@x220.qyliss.net; helo=out4-smtp.messagingengine.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: "Michael S . Tsirkin" <mst@redhat.com>
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
index d6085f7045..c42150331d 100644
--- a/docs/interop/vhost-user.rst
+++ b/docs/interop/vhost-user.rst
@@ -871,9 +871,9 @@ Master message types
   ``VHOST_USER_GET_FEATURES``.
 
 .. Note::
-   Slave that reported ``VHOST_USER_F_PROTOCOL_FEATURES`` must
-   support this message even before ``VHOST_USER_SET_FEATURES`` was
-   called.
+   While QEMU should acknowledge ``VHOST_USER_F_PROTOCOL_FEATURES``, a
+   backend must allow ``VHOST_USER_GET_PROTOCOL_FEATURES`` even if
+   ``VHOST_USER_F_PROTOCOL_FEATURES`` has not been acknowledged yet.
 
 ``VHOST_USER_SET_PROTOCOL_FEATURES``
   :id: 16
@@ -886,8 +886,12 @@ Master message types
   ``VHOST_USER_GET_FEATURES``.
 
 .. Note::
-   Slave that reported ``VHOST_USER_F_PROTOCOL_FEATURES`` must support
-   this message even before ``VHOST_USER_SET_FEATURES`` was called.
+   While QEMU should acknowledge ``VHOST_USER_F_PROTOCOL_FEATURES``, a
+   backend must allow ``VHOST_USER_SET_PROTOCOL_FEATURES`` even if
+   ``VHOST_USER_F_PROTOCOL_FEATURES`` has not been acknowledged yet.
+   The backend must not wait for ``VHOST_USER_SET_FEATURES`` before
+   enabling protocol features requested with
+   ``VHOST_USER_SET_PROTOCOL_FEATURES``.
 
 ``VHOST_USER_SET_OWNER``
   :id: 3
-- 
2.30.0


