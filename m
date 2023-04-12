Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA4AB6DF192
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 12:05:18 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmXLN-0004YN-Di; Wed, 12 Apr 2023 06:04:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1pmXLI-0004WF-Mi; Wed, 12 Apr 2023 06:04:44 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1pmXLG-0005Mi-VD; Wed, 12 Apr 2023 06:04:44 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id A5FA632009A4;
 Wed, 12 Apr 2023 06:04:39 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Wed, 12 Apr 2023 06:04:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:content-type:content-type
 :date:date:from:from:in-reply-to:message-id:mime-version
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1681293879; x=
 1681380279; bh=oykyATCc+ST1R3R9O7qW8i4s8oC4d/stb6/We/AWL/M=; b=R
 O4wFKcvuP3zT2Kn/oEiz88dlQOEmE7tnxY9SHwsBUCvaBarssrLKF21thZG7zyEJ
 rZdhOLCeSaiL0m0A9pN4h6jfy06tLjoED+Z+ZRGwC9XNffxWYFlu6q45cIrYA44z
 n7ScWxMHn0Q81sovYF4fQfeJOfBzlfEpC3meCDBlQ09LTZQA8mFSooz2sS0dB8oc
 o5Ox7dVJ5ZxVzrV476HZbdnrCC7PQPDaLfi31SqHcZYre2dZCgg2097krO1MBRks
 oqIt+RjcdcjIO3tnyfLaymWZIudNitCKDdgSjo0igffezYxPkpkbu74++NQ4FYt4
 yqg73AnoH/pzSxKEdcclA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:message-id:mime-version:reply-to:sender
 :subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; t=1681293879; x=1681380279; bh=o
 ykyATCc+ST1R3R9O7qW8i4s8oC4d/stb6/We/AWL/M=; b=LcwgFNNgrFQkh+FUi
 sE+pv5BGh6d8+HRbs6Fx3kfLaVaajII1kAvtXgVpIrN3x9R2FLkOC3YvjqtPrlok
 qdD3r+6Qcy2l9modRmRjbrR1CK1kM5PhTMK+wROpnIs2cdaxmpxHog888Z324Z0k
 fstTymbRLQd5+J+W2ksaeK7GZwMSyn1P7QEKPtrjO5Tfh1XC1Myfq95eRWgM2Uqe
 TU4bK9NnPxtuCt64GEIRMT7ew5eR2SLrTfJsKz66YDzUQpSu/ca5sVsjvV1SmAG9
 L8mOvn9RWjgj8MKjuNu5RiXxDYzrxo/EhW5T/3JBgUPVmsyuVRyZmmbWhFTmGK8o
 By1Uw==
X-ME-Sender: <xms:N4I2ZJYTOoRfnC2zBp_bYRoF0hlI9g7IKWS3PV9KXrR6iNScHRuVWA>
 <xme:N4I2ZAY3keRkRn_T07TRQ6vVAt3iffou4ClrYGobEQy9SWmJSqUy5Mx1NqwgrenGO
 HOKr1PV8GC9scb_-XY>
X-ME-Received: <xmr:N4I2ZL8pLK5CBp3gxCTqwshnYRlcDFiBXplfTY5aCyQNpILQOIw1uZaw-voE6kgk0RyAg_qIGF2nchxgop1qv-6Sh3fAKYG5Z-Cy3T0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdekiedgvdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeetfeeihefhieejhffhuefghedvfeekhfeuudetuefgjefgheekffdtieejteff
 feenucffohhmrghinhepihhnfhhrrgguvggrugdrohhrghenucevlhhushhtvghrufhiii
 gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdr
 ughk
X-ME-Proxy: <xmx:N4I2ZHrMRjm7nAQyR0hPy8tS_pDL_O6VdaLE6IWNbf9JgHFanmML5w>
 <xmx:N4I2ZEpwlocjSs_DEFOcMF3kWtIIjv549k91VsZThaDsqCGFTPW7NQ>
 <xmx:N4I2ZNTnDhVAcaT2wmWhoyvTtFcLx0tCbsO4K-y_ISA7kKIkE8sWCw>
 <xmx:N4I2ZNmcKfo2qporLdUQXNkwB8-Yy8saHQxb7oCHaAz2n3_gPNGS-w>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 12 Apr 2023 06:04:37 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Cc: Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>
Subject: [PULL for-8.0 0/2] last minute hw/nvme coverity fixes
Date: Wed, 12 Apr 2023 12:04:34 +0200
Message-Id: <20230412100436.94038-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=901; i=k.jensen@samsung.com;
 h=from:subject; bh=hDdkExBb8NvE+HTXpQRUvw+sNNOXhLqfYKEN/OIQP28=;
 b=owJ4nJvAy8zAxej7cL1hrj/vS8bTakkMKWZNxgt/LFuQZiTDeS/tN/81W5s1b/n3dpus3brQN
 2+O22XxrCmdjMYsDIxcDLJiiixBGsarSh/debbIPe0AzCBWJpApDFycAjCRY5/Y/0cIGET0GhTu
 Kroz+fimBrN7O05YCzz1fPfeuv9aWEFtuKliUdqM1deblGuc7/FwTnDf+UGA1Wnzv9kKrhO8emy
 j9s5eLO67gf92rqHYzPPXqxVyAiL15692bNXj2XXFP6v1GYtJY8LWsxNCKnjjDVmjvb8ISO/OUT
 TeWGozfXH2E84s/3WZ3PF/btvsOHiLKVPcUOHBajPx5WmPzgWrNYXMNLGsfJFV4z1Fv8nAo4tNS
 aae5auKncYPHpEfe+UXx3HX33LR0ZR/ayK7afkptkciRe+v+T69riyrvCg6S85ohf9b5dJjR47I
 8KduNlobcNf8Q+oPc/lfHR7TY3vz7i55qHT5n9Z80XvdJecA7CKeog==
X-Developer-Key: i=k.jensen@samsung.com; a=openpgp;
 fpr=DDCA4D9C9EF931CC3468427263D56FC5E55DA838
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.21; envelope-from=its@irrelevant.dk;
 helo=wout5-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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

From: Klaus Jensen <k.jensen@samsung.com>

Hi Peter,

The following changes since commit 6c50845a9183610cfd4cfffd48dfc704cd340882:

  hw/i2c/allwinner-i2c: Fix subclassing of TYPE_AW_I2C_SUN6I (2023-04-11 14:13:29 +0100)

are available in the Git repository at:

  git://git.infradead.org/qemu-nvme.git tags/coverity-fixes-pull-request

for you to fetch changes up to 4b32319cdacd99be983e1a74128289ef52c5964e:

  hw/nvme: fix memory leak in nvme_dsm (2023-04-12 12:03:09 +0200)

----------------------------------------------------------------
hw/nvme coverity fixes

Fix two issues reported by coverity (CID 1451080 and 1451082).

----------------------------------------------------------------

Klaus Jensen (2):
  hw/nvme: fix memory leak in fdp ruhid parsing
  hw/nvme: fix memory leak in nvme_dsm

 hw/nvme/ctrl.c | 3 +++
 hw/nvme/ns.c   | 3 ++-
 2 files changed, 5 insertions(+), 1 deletion(-)

-- 
2.39.2


