Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD050649E24
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 12:49:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4hEN-0005yo-V6; Mon, 12 Dec 2022 06:44:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1p4hEG-0005wp-LD; Mon, 12 Dec 2022 06:44:18 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1p4hED-0003Lc-Az; Mon, 12 Dec 2022 06:44:16 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 3630E5C0113;
 Mon, 12 Dec 2022 06:44:12 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 12 Dec 2022 06:44:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:message-id:mime-version:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1670845452; x=1670931852; bh=0A
 ShId48Mq0yxZu5VLr7qUuEFk5jlDlvs3nLXSW1P/g=; b=n2GFpUUYLZHcawVcQR
 L0mY+Daco31Ug5t5J1pHxZbo9dsKCyTqxU/HbeShB6y+mTXQaYghMdusK4euMOI0
 WLFb+LSL8ulDNTuOzXZksAwhhV6nFCADtW+mAmCaRlCnVL9oKQMZvjfEOsmQ++BS
 PP4sF2Dnhhp5gzrKB8PPmtF1O1dZdNZbPvEV9Z1NHINb/TI+xIkc9xWxqfvQsVxQ
 tkij4QFgof1Y3Zr6/AkKhmoYOrIaJ5CZDuyM38De6J6AUYDBw0BceztDT8hYvAsr
 DPPCtI2Vce0pRVciHSgzFzz3t73r8o+seS4eJUjSJxKmHvbzh4sO/qje60c9wpE8
 QW4Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1670845452; x=1670931852; bh=0AShId48Mq0yx
 Zu5VLr7qUuEFk5jlDlvs3nLXSW1P/g=; b=QP3uF8zH+KLWtdyfRmFyGnmGY5FKp
 nroNrRAAYvnXHFe42JfdIeqkLllmkTqB6n94Iz/7ygFm79V7TYf7kckcM/ToGgCT
 +NrDeBwv2ToGdC8W4CE8Sf8RdkRK0jw+xShqV/ogGkueF1mPhCjADa5h9QancH1L
 qR7A9QXe0WDj0PB/11oTlm+w9yslKaaRLGgqOP+PJa5yVcSu0eAMTKmTWT608hgB
 pJJEk6W/QsZI1a1DtuxST5YgA1Vcto37END9VTiVZ1y0DTGtSt/bP+fbCVJpsYG/
 0oqi7OZr/P3ZclJu20Ro0QM4EqgZS9+WhQpGAJ83YMe1Xec+KkxFxSkPQ==
X-ME-Sender: <xms:CxSXY_VpnBtOz67jSPCwDE_1HQuyzUWJ4ywuv5uY0jzcL3pSLhrqqg>
 <xme:CxSXY3lXnbTr8SuUuqiTCGB8SHEj9BdvFWyexGG5R-Z_9NkRy8Iup1POBRXqzHknE
 MvmtxVr3rwyCZ-Kd1o>
X-ME-Received: <xmr:CxSXY7ZMgczSflQSrcg0Qu8JLLl8l6dyekl7_S2WAZd0H_WRUjJ8XYRe2fyuN1cfkSaffehb20wNxr1EoT9MUARwOncousePiLl1ng>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdekgddtkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvfevufffkffogggtgfesthekredtredtjeenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepheetfedtgeekueeltefgudfgtddtleeflefgjefgueeggffgvddvhefhleeuhefh
 necuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:CxSXY6WZpA6RfcwrOMPARkVbD4pBYZHRt3tbdqC4skTthvhDw13PHg>
 <xmx:CxSXY5ltfxQByLd2r5hn0H5BCmYOZsWgpmk_lstktd1ZSuU375whZg>
 <xmx:CxSXY3e8q25IiPOaX3e6A466l8NSvydVIIy4d1UiE5x-9r9xT1_-wQ>
 <xmx:DBSXY8vpBjilD_RzzMcsyjVP_r1zfEvXay34DlrHKuJDtV3TEikfyA>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 12 Dec 2022 06:44:10 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Klaus Jensen <its@irrelevant.dk>,
 Keith Busch <kbusch@kernel.org>, Jinhao Fan <fanjinhao21s@ict.ac.cn>,
 Guenter Roeck <linux@roeck-us.net>, Klaus Jensen <k.jensen@samsung.com>
Subject: [PATCH v4 0/4] hw/nvme: fix broken shadow doorbells on some platforms
Date: Mon, 12 Dec 2022 12:44:05 +0100
Message-Id: <20221212114409.34972-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=1420; i=k.jensen@samsung.com;
 h=from:subject; bh=Gzt7Eur5tzyOMdU1rwypib05vx5YxAsHA8dnwhlvrK0=;
 b=owJ4nAFtAZL+kA0DAAoBTeGvMW1PDekByyZiAGOXFAgs7eIwG+hS4D7exT/I6hXsUR2ejx20S1I3
 g5wpEfHdBIkBMwQAAQoAHRYhBFIoM6p14tzmokdmwE3hrzFtTw3pBQJjlxQIAAoJEE3hrzFtTw3pqb
 IH/inTOr48cun7ruf//xrLZQW7SNWGvNbxTX/D+I6PCx0dHl8vJks1/nhOA+PoecovP+s46wz8Hcgo
 LuxNPe/Lp0nsb7Oe8u7ncBFKGIhvtwlbAGnE4A3KrzSYn/Ruk42JfotrkMfyT3YfPcjiITQaLrXZiH
 8rcNmRjWi1dGJqRG4+dW1+mCpMBTwrlfJA4Cci+SSLzJ6uPjss1MWwP8EUA90VZCMwmeYqZZCsq1N5
 XmdZPnbTR57PT8jy7xoH337rcsjgIDX2zJ1sOcR5OHcOSqDCjpcpoaBlPqc/wkf1RSOCuEGsKOTPaV
 6k5kXDu3Zc9tGwp2GI6XluR8bY91M5gzHpi6qe
X-Developer-Key: i=k.jensen@samsung.com; a=openpgp;
 fpr=DDCA4D9C9EF931CC3468427263D56FC5E55DA838
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.29; envelope-from=its@irrelevant.dk;
 helo=out5-smtp.messagingengine.com
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

Guenter reports that hw/nvme is broken on riscv64[1] and big endian
platforms[2].

This is a regression since 7.1, so this does not warrent an rc5 for 7.2.
I'm sure Guenter can carry this patch in his tree, and maybe we can get
this out in a stable release.

On riscv, the issue is a missing cq eventidx update. I really wonder why
this issue only shows up on riscv64. We have not observed this on other
platforms (yet).

Further, Guenter also reported problems on big-endian platforms. The
issue here is missing endian conversions which patch 3 addresses. This
also requires a fix for the Linux kernel that I am posting separately
(can't link to it, chicken and egg problem).

  [1]: https://lore.kernel.org/qemu-devel/20221207174918.GA1151796@roeck-us.net/
  [2]: https://lore.kernel.org/qemu-devel/20221209110022.GA3396194@roeck-us.net/

v4:
 - screwed up the rebase (Philippe)

v3:
 - add patch to fix big-endian platforms

v2:
 - use QOM accessor (Philippe)
 - added some cleanup patches in front

Klaus Jensen (4):
  hw/nvme: use QOM accessors
  hw/nvme: rename shadow doorbell related trace events
  hw/nvme: fix missing endian conversions for doorbell buffers
  hw/nvme: fix missing cq eventidx update

 hw/nvme/ctrl.c       | 121 ++++++++++++++++++++++++++-----------------
 hw/nvme/trace-events |   8 +--
 2 files changed, 78 insertions(+), 51 deletions(-)

-- 
2.38.1


