Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B8A623C54
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 08:07:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ot1d0-0003lM-0N; Thu, 10 Nov 2022 02:05:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1ot1cw-0003kU-LE; Thu, 10 Nov 2022 02:05:30 -0500
Received: from out2-smtp.messagingengine.com ([66.111.4.26])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1ot1cu-0007CO-I1; Thu, 10 Nov 2022 02:05:30 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 35A505C0136;
 Thu, 10 Nov 2022 02:05:27 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Thu, 10 Nov 2022 02:05:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:message-id:mime-version:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1668063927; x=1668150327; bh=0J
 f3dyDEn2LcP2Wh/LLWWcqEOibrXZrlxOZHM//B3FY=; b=OelTjyIXj6K8s0U5up
 OTnTAVxn5+5A2A90wvxLAqNP7oakFAHaY0ne15mUhqAwoRp9Kycu5qaU2eI3Ev8O
 g1+EtGBFnjKWMW68pCO/tzMeoJMEZvvHwzy8HT/hDcYAyoFxgz/+O48z6rujy7QR
 D0LpV0/mR3ih0jrcCG1gqWFps0w66iCL2TmbxBFpQ5RWswQAJXJF+rXfKFkyZwrP
 RrLod0scmr9B86nYSLZliT2VH3LwiZC/986enRUc1k2j4fK8JtZserViqy9A3gYh
 fosmMMrEcG8TqqdjyAb3D6CFjWmRJPUhcFthY5OVSHWcO5PIK4Fb8cwedIqkH0TA
 OQ3w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1668063927; x=1668150327; bh=0Jf3dyDEn2LcP
 2Wh/LLWWcqEOibrXZrlxOZHM//B3FY=; b=YixU4DchVY8blfvNsR6QC/KJbOLAo
 LJCNQdOjJGhWFsxivF3Ig+aQnFBBBbNcQBEVwXoEDY044ozkBH9dXgXtHAE6kUbA
 2fisuV8jsxtuStyjNgF+51+34k96+I1BjPB9UyMUsy0ZdPRbeBW2CO4VPEaLczh9
 87BpI9ecXGUenoYVZxGD5W6A4ELjPz8+lhQNKjzN0YTuiRJZ10OdvrX8IWw8GutG
 QgKGh/MVPqKGzJRTpHzmlzQ6GtM1+RlVSpuaKxRN+txCdtLZKrPIVeASC1YPRGbd
 s/vwM3nxDHwoGfKQq4FL560l3mUXSqIadSKlRpfeH/V4xBINPcbu//ydg==
X-ME-Sender: <xms:tqJsYxFbtXHKHxNWoS4C66stqRqix2ZBTC4JihCR1nU6-YTfcHLjIQ>
 <xme:tqJsY2Uoq1MWWixwGTWBa_NsPxT3rq6_RseEqXHjjL_reyPHHBMsQQzS3GUIZ3Xyp
 bSZXmoCg3Yu7CGzFYA>
X-ME-Received: <xmr:tqJsYzJJpzCA5zW73uqmnL6mivbSigGET1L4xYt6HjVK09rABeFDCCoC7PVXIseWyhbnVCOKKww6LVRO_OGm3YxrWfR5GrpshvaIzQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrfeefgddutdehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgtggfgsehtkeertdertdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpedukedvgfeujedvgfdvfefffffhheeitdeijeekleefvdfhgedvvddtfeeukefg
 ueenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:tqJsY3GC-B2hY_4WAte1OhS-EIFKqdH-d95fvqxhTCXxq6XbrvsNdA>
 <xmx:tqJsY3XUcIKX8pXzM_qcii474Q0S2HzNtAl7ugR_rXxxUJBTkK57FA>
 <xmx:tqJsYyMwrrvgKubWdHpyOxiVbhvh5xgFL0h5IyfXb-eQ-yDlPPw1kw>
 <xmx:t6JsYyRXEflNaNRWLL75w4dEd6Ga8cXkb0qmvtzlLg_2Vc_we0Fz8Q>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 10 Nov 2022 02:05:25 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Keith Busch <kbusch@kernel.org>,
 Klaus Jensen <its@irrelevant.dk>, Klaus Jensen <k.jensen@samsung.com>
Subject: [PATCH for-7.2 v2 0/6] hw/nvme: misc fixes
Date: Thu, 10 Nov 2022 08:05:17 +0100
Message-Id: <20221110070523.36290-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.38.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=677; i=k.jensen@samsung.com;
 h=from:subject; bh=0NuEOApBQc4bZrer9owLN0KV9mtC1eVlGT4oua0QPlE=;
 b=owJ4nAFtAZL+kA0DAAoBTeGvMW1PDekByyZiAGNsorKot70y1aiNrP49uoAYxBhKQUNom+UHYQFZ
 noeAwSSkXIkBMwQAAQoAHRYhBFIoM6p14tzmokdmwE3hrzFtTw3pBQJjbKKyAAoJEE3hrzFtTw3pLz
 8H/RBCys3Uv2t2gNMX+nFBAdpQYSjXWmlNghSyaOxo18PndBAtdXuVfHAFL1lkzHEvuFinlMsIshg7
 Rv9mEPGr2TpIkupvzyTk5Vn2ekhh+dvXCmigavJB68lBpvWe25gwCS51w9kU7pXZZZ5vE/yX7pI8E6
 SrbiCpyjKRx9rkY9uuJ2g31vl/GNyO6e8jJwr4egYEmU6E/D6wCY/PfhEPdZCNUeKf9Zr0QklTuNvR
 2w7/vYA8C5I520W4RdYervHa0U7Q5/NS4207T6orVWaxL9MIq1u727zmq5HEDBzxn8huY0Oi+SDmP3
 3Tm0dFuYsG4NADls5MFRcAAjNcgeEfkofnYK5x
X-Developer-Key: i=k.jensen@samsung.com; a=openpgp;
 fpr=DDCA4D9C9EF931CC3468427263D56FC5E55DA838
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.26; envelope-from=its@irrelevant.dk;
 helo=out2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Dmitrys fix (nvme-next commit "hw/nvme: add missing return statement") for dsm
prompted me to audit the flush, dsm and zone reset code. That resulted in the
discovery of some bugs relating to correct cancellation.

Klaus Jensen (6):
  hw/nvme: fix accidental reintroduction of redundant code
  hw/nvme: fix cancellation of format operations
  hw/nvme: fix flush cancel
  hw/nvme: fix cancellation handling in zone reset
  hw/nvme: fix cancellation handling in dsm
  hw/nvme: fix numzrwa handling

 hw/nvme/ctrl.c | 50 ++++++++++++++++++++------------------------------
 hw/nvme/ns.c   |  4 ++--
 2 files changed, 22 insertions(+), 32 deletions(-)

-- 
2.38.1


