Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F30C76137E6
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 14:26:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opUnf-0006SG-Vd; Mon, 31 Oct 2022 09:26:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1opUnQ-0006K4-Dz
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 09:25:46 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1opUnO-0007jU-Rb
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 09:25:44 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 55F9B5C010F;
 Mon, 31 Oct 2022 09:25:40 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Mon, 31 Oct 2022 09:25:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :message-id:mime-version:reply-to:sender:subject:subject:to:to;
 s=fm1; t=1667222740; x=1667309140; bh=1IZJ/6JnUND6i4p/bEPz/d420
 2MdBxJBW3BNxk5tfr8=; b=f8VmtoCyEb5jDB/I+wGnu8D8AVP8dIP9O7AvPD3mt
 w0CWeX3bqkLd3JrprXgvscBYJ24gn++f9mLb5FobUNx25hnuMwHp6VeHti9Mh5Wy
 E34hz9qoUxz4pvxIIxig/uhULiG56cPl8N6WhbDvnMvVSlqMhRSCuw6QP39pChND
 U360rep3KJe1GVEmIXCpBuVhPQ2zUSe5cWkTWfZtSNbGypay+u/NjdxhIF5bfuyi
 3Z92xoo2ibSr20x7gBBsyG2SwlynrVU6UBIr51TH/ljiXkdzNT5YMh+TNOT7YVy1
 2jxAGZjlbKiaUwWSzNSeBrwbEm6Jevy6K/nzzn3buy2Dg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
 1667222740; x=1667309140; bh=1IZJ/6JnUND6i4p/bEPz/d4202MdBxJBW3B
 Nxk5tfr8=; b=BQw/9DMIQgsX0YbrYa76xmZ2hrSATpvlz3dD5s96RiUrOjeup+l
 tRsgm8SksPYVuOhtq3wcvR40CI/wl8PQn9CI0Q0Chr92a5aB2bOtn8LzRtyRg8c0
 k9r4MbJ0hRrJPMmG7912W/VqTuUnoAj8INAf4Kkf4jLCqHXomTL7K0bUBd9R56w6
 b63OlUwUGByqGQ94ZmJfuPFDEgYwwUs3TLuLWFiPHt3tpc/9hu1fEGerYaPGOKFq
 mVClCabiGdyOx4WHtrAvmoPVJWyI/9pscfkjWJvsxgaWXUWiYjTa4iKpk1u9maek
 n1O5Y7miGa8nn6RCr49WnUdulNlIIiZneFA==
X-ME-Sender: <xms:08xfYy9Nn78kl4Teps0XcOB2C0VtRQvpwbdpXZiR5EEA7LLZJMeI-Q>
 <xme:08xfYyszdudxtVt-NEn68mfWLmRynNMD_oyJrjAeei0ds1jsR6MuBkyR7istew4Kh
 njHAOp1N-Hjs09vICA>
X-ME-Received: <xmr:08xfY4DDUCy98GlvlFkl2oIvHbD277VHcBKsKT3Cb4_MUDRETVGmytms5Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrudefgdehudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgggfestdekredtre
 dttdenucfhrhhomheplfhirgiguhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehf
 lhihghhorghtrdgtohhmqeenucggtffrrghtthgvrhhnpeehieduieevteevhedthfette
 ekgfdvvdelveekjeeiieegieevueefueeutdejvdenucffohhmrghinhepghhithhlrggs
 rdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:08xfY6ep6-wbHdtQ94sv2NFNPKf_G-mPF8rAariD-ugcl9EmGpWW8g>
 <xmx:08xfY3MK-w5PYENBiFjv7PERk_b0RtSlLsf5mpCu5ezjsPJS4uMwvQ>
 <xmx:08xfY0lhMcmuVaVkaj7BXSPazYlIV_IBoQxCtK3fkp28NbTtyCY_zw>
 <xmx:1MxfYwbTQ4YwHebvgW7Og3Ci681AFm2JBV9GKUUB_0S6TWcmzYDtRQ>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 31 Oct 2022 09:25:39 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: qemu-devel@nongnu.org
Cc: f4bug@amsat.org, pavel.dovgalyuk@ispras.ru,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v2 0/3] MIPS system emulation miscellaneous fixes
Date: Mon, 31 Oct 2022 13:25:28 +0000
Message-Id: <20221031132531.18122-1-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.26; envelope-from=jiaxun.yang@flygoat.com;
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

Hi all,

I was trying to build a MIPS VirtIO board[1] for QEMU that is able
to work with all processors we support.

When I was bring up varoius CPUs on that board I noticed some issues
with the system emulation code that I'm fixing in this series.

Thanks.

- Jiaxun
[1]: https://gitlab.com/FlyGoat/qemu/-/tree/mips-virt

v2: Address review comments

Jiaxun Yang (3):
  target/mips: Set CP0St_{KX, SX, UX} for Loongson-2F
  target/mips: Cast offset field of Octeon BBIT to int16_t
  target/mips: Disable DSP ASE for Octeon68XX

 target/mips/cpu-defs.c.inc    | 4 ++--
 target/mips/cpu.c             | 6 ++++++
 target/mips/tcg/octeon.decode | 2 +-
 3 files changed, 9 insertions(+), 3 deletions(-)

-- 
2.34.1


