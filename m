Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F0A11DDEF
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Dec 2019 06:50:29 +0100 (CET)
Received: from localhost ([::1]:41166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ifdqO-0004SS-LP
	for lists+qemu-devel@lfdr.de; Fri, 13 Dec 2019 00:50:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55013)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <andrew@aj.id.au>) id 1ifdol-0002yk-VU
 for qemu-devel@nongnu.org; Fri, 13 Dec 2019 00:48:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <andrew@aj.id.au>) id 1ifdok-0004hC-T0
 for qemu-devel@nongnu.org; Fri, 13 Dec 2019 00:48:47 -0500
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:33035)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <andrew@aj.id.au>)
 id 1ifdoh-0004YM-Md; Fri, 13 Dec 2019 00:48:44 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id ED206909;
 Fri, 13 Dec 2019 00:48:41 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 13 Dec 2019 00:48:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=N9bCwlClnlHDFDNFqpp3fD4D/m
 1EZqVMm4Nk97EMVP4=; b=e9RikxxK9qaigA7SxEUg3gR9YbtXk+fnRLeeB9h1Oq
 0b8GfuOZC9ELD1gmpwFC5fYEdgbEi8J7oNp7Si0xZLVQC6NlE6x+5tomuaggvjT9
 zu9UB6GyeQg9Zk9YVRRTCqXKOLJnQAO8vgy+0v0pvEFtCkV1AsDBB232zWGwUM1p
 U62oW4qFCWu6cTi9rB97ft1VP0wVs+fDlNLj91rZCN1Y7jyHG1afQ8DeahlFk5eB
 uNNwXRGMBAt2LDRU+2CIaHh3gEaaFSJD57QLovvA+og+EDwJh8ElcKXI4Jt2U2VR
 nncERydcGxaLeFfIVN42YTBGdgM5pRNSm8U9O4NRS0/Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=N9bCwlClnlHDFDNFq
 pp3fD4D/m1EZqVMm4Nk97EMVP4=; b=OJnLt6TY6kCam8LNEYFbR/T7mvZzu4wK7
 1sWRZe/Fr4QRm2eA/WvuHdpBBUnBK7Rn3ne0Tsl/QS6CBIihHDOpynFyCHWaj5iZ
 LdtE9blBI4Jj/IC28ftdRkv8Ee2NhyUgjL79RGBlePeeMnai//T+o1p8qdtkI1nK
 4ollp69wj/eP1GGDGFDMaI9QSkBZiYO35UZJB44OOZjloDJPenXW9HkXW0+BOuf7
 UrxSj515tTkVYTntY07ax6N/rrQ6Wg78ajMHuanadlsHmTQRQKyf57EdA5qjC8VY
 /Ogz9fqZ+cI43zbGpIOqjHKJUUOg9YmMhhlb1ZYh2y2UWLmFxp1vA==
X-ME-Sender: <xms:OCbzXc72U_t_HP8zgA010MdlMcrN5yb79zyh1LvcM3g54GtOyiOfSg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudelkedgkeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
 dttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegrjhdr
 ihgurdgruheqnecuffhomhgrihhnpehoiihlrggsshdrohhrghenucfkphepvddtvddrke
 durddukedrfedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhi
 ugdrrghunecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:OCbzXXchM_kfHTJ5Stqe832G1lV_NHWdbOlsrIjY_UflTkYho9V7SQ>
 <xmx:OCbzXW4MF_QnmgpbnAZD8ORQy78NFNKDVrdaHA7_Lq52sMDI86cSzw>
 <xmx:OCbzXf1fxHvr7jxeXUEfrEApRRBz17PpCttQvJe1zexmJu0m7CqSKg>
 <xmx:OSbzXUvcO83-tFO_hbOGDsZ6JdiP1T0i_4TOdkwV-j9kxdce7QLXMA>
Received: from mistburn.au.ibm.com (bh02i525f01.au.ibm.com [202.81.18.30])
 by mail.messagingengine.com (Postfix) with ESMTPA id 1561E80063;
 Fri, 13 Dec 2019 00:48:37 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: qemu-arm@nongnu.org
Subject: [PATCH v3 0/4] Expose GT CNTFRQ as a CPU property to support AST2600
Date: Fri, 13 Dec 2019 16:19:47 +1030
Message-Id: <cover.ec85a2db47c3e10de70fba144e1bc75caf2f0a91.1576215453.git-series.andrew@aj.id.au>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 64.147.123.19
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
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org, philmd@redhat.com,
 clg@kaod.org, joel@jms.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

This is a v3 of the belated follow-up from a few of my earlier attempts to fix
up the ARM generic timer for correct behaviour on the ASPEED AST2600 SoC. The
AST2600 clocks the generic timer at the rate of HPLL, which is configured to
1125MHz.  This is significantly quicker than the currently hard-coded generic
timer rate of 62.5MHz and so we see "sticky" behaviour in the guest.

v2 can be found here:

https://patchwork.ozlabs.org/cover/1203474/

Changes since v2:

* Address some minor review comments from Philippe and add tags

Changes since v1:

* Fix a user mode build failure from partial renaming of gt_cntfrq_period_ns()
* Add tags from Cedric and Richard

Please review.

Andrew

Andrew Jeffery (4):
  target/arm: Remove redundant scaling of nexttick
  target/arm: Abstract the generic timer frequency
  target/arm: Prepare generic timer for per-platform CNTFRQ
  ast2600: Configure CNTFRQ at 1125MHz

 hw/arm/aspeed_ast2600.c |  3 ++-
 target/arm/cpu.c        | 65 ++++++++++++++++++++++++++++++++++++------
 target/arm/cpu.h        |  5 +++-
 target/arm/helper.c     | 24 ++++++++++++----
 4 files changed, 83 insertions(+), 14 deletions(-)

base-commit: 04c9c81b8fa2ee33f59a26265700fae6fc646062
-- 
git-series 0.9.1

