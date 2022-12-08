Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0698A646A93
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Dec 2022 09:32:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3CIk-0004LN-6Z; Thu, 08 Dec 2022 03:30:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1p3CIC-0004KR-2W; Thu, 08 Dec 2022 03:30:08 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1p3CI8-0003Nf-GZ; Thu, 08 Dec 2022 03:30:07 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 7A4AD5C0159;
 Thu,  8 Dec 2022 03:30:00 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Thu, 08 Dec 2022 03:30:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:message-id:mime-version:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1670488200; x=1670574600; bh=ss
 0KJjmLOsP77UsFI/omxohBYWaaQf4wFiQL12hx338=; b=ZaDr+Nwp/1qLDmp4k5
 TtZIngy/9q9J9BZGF1uWre1QTqEhoCdqWFy64xq9s+1ZQQx7Ff+wBzcv1N1MU2OI
 Y16qoIcgk86uXzIpXAiizhTtNDXE0GuqLhw5w/TGgBDuitr90hgXv8lalY3DnYy3
 /c0OQcK7ep2SpZCwgeWnyslJR2x10DhsfpeRIOnIUk2CPLvl+0HKeygN05h8ngyX
 jQX4xtV0jthbel5y4V/MXpg8BA++X3raslSRKTXSfODfiH51NmOV0cYq53Yke6mU
 0nDks5zLm2dgdcxKyyQLniIYIr2uBDsjS5TXi33rSYoId1RmcyQT6hWeEI9JGtGP
 JqHw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1670488200; x=1670574600; bh=ss0KJjmLOsP77
 UsFI/omxohBYWaaQf4wFiQL12hx338=; b=XziVzpc224xPE5VuTgkqQveWU8agh
 a9/5TNDZ1S6rHgdYOEJ0uTkXmlY/FNU63nGeY/lXmAZ6054QDtOU31+bkagZOcMB
 LUQjZlc8zpQKb14mkn+kdyioqp55Zm6Gk4AOs/ukZ8v3yJPVw/W/TQhp89pe/xPn
 x25dSL6Tvpb3zST0vyZCY+DPOH+wb1BK3Qe84uqLOPNe+lOeGhVnubsXyna5BBXA
 k2RLf13x48vs/xRx17UaRsqBWpxnZg0wyjRK/6+exLnD0sPxvWGUaM9CZRTFPCVK
 8mudwkdYxb9/a0ZDVlfgKjlk+XnIdfUrZGIfo4FV+AwQO7yMZlrDIJ1hA==
X-ME-Sender: <xms:hqCRYz_mzUesU7g9qWYIf744RT4HOm-FW3j6JXYBEbgKdWMrRFjbQw>
 <xme:hqCRY_u-kbs1_FpDWIGf3REzgPsU1fCyltgAvkcSa-Iv5KVDpxuaZ9sbWeqWo3CtM
 gO-0V1dEpfIoHyALrM>
X-ME-Received: <xmr:hqCRYxAraH_O3CAo1WXF11v43zj1lVI2pldZPcQK_B1tvbPOq-9dssgHv4i4SxOaVIHttaxBalDoNpmiyziPzFbogfQDS6kmLeTE2w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudelgdduvdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgtggfgsehtkeertdertdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeiffeujeegteduleejtdefveeiueekleffffeltddvvdehveegudetudeftddt
 veenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:h6CRY_chrq1UnXq0RRvfp0OEaQYq07bfdx0uXOGJGy9DzM2ouizTww>
 <xmx:h6CRY4MkoCPwG9ynWSqyPR23BMZ_vFDK_2FikhtlmYK56bkPvTq_cw>
 <xmx:h6CRYxnap8__DD3Oi0QSVZt_rl0C9LA1q-9nZLP-mvQqROSyMt1L4Q>
 <xmx:iKCRY32hjCmX8FesyLOAqGMthqYQfVwXzdwVNeHdGSeBEo5XTyITfw>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 8 Dec 2022 03:29:57 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Cc: Keith Busch <kbusch@kernel.org>, qemu-block@nongnu.org,
 Jinhao Fan <fanjinhao21s@ict.ac.cn>, Klaus Jensen <its@irrelevant.dk>,
 Guenter Roeck <linux@roeck-us.net>, Klaus Jensen <k.jensen@samsung.com>
Subject: [PATCH 0/1] hw/nvme: shadow doorbells broken on riscv64
Date: Thu,  8 Dec 2022 09:29:54 +0100
Message-Id: <20221208082955.51732-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.38.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=577; i=k.jensen@samsung.com;
 h=from:subject; bh=kkPhZqkdSLGvGGbExfdJRY5uD3U4WaJALU7KZMKidOk=;
 b=owJ4nAFtAZL+kA0DAAoBTeGvMW1PDekByyZiAGORoIMXWAo8ouQgA+h5KNYXNBS8kpyfq4BWy5Ec
 6yBTqVHeb4kBMwQAAQoAHRYhBFIoM6p14tzmokdmwE3hrzFtTw3pBQJjkaCDAAoJEE3hrzFtTw3pv6
 sIAKDcSHu+/upx8r8QBgwG62TDATjWOmgG6fXhWgfJPK9jboVPTaoFDvQm5Sg/n9vb6F0mA8JW+0we
 AW+Sd8sKnstnTazqvJR0wVCPs3Fg3a0dJcxlbQ9Yf7x6TUpRYKf+HanSctwQXsF2tJiJs5lxBLE8OP
 6I6F2gccuZ2MZZIocsMwX8UBKXG4kq8ZQCjY0nMNdeW2IQtTXlT4qQNePpSDGnZPTEc4RMxP83cqyg
 LelV4IJQGTWsmgHGpconrZqBtcHcOjF84P3AH6n7o56+1FwyiFJ3JY3Uz0feqzQT6zcXHRVqqb7Egp
 c3LjNnnO8fNFACfNpvoN5m8HFDfjtsrUgXladg
X-Developer-Key: i=k.jensen@samsung.com; a=openpgp;
 fpr=DDCA4D9C9EF931CC3468427263D56FC5E55DA838
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.28; envelope-from=its@irrelevant.dk;
 helo=out4-smtp.messagingengine.com
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

Guenter reports[1] that hw/nvme is broken on riscv64.

This is a regression since 7.1, so this does not warrent an rc5 for 7.2.
I'm sure Guenter can carry this patch in his tree, and maybe we can get
this out in a stable release.

I really wonder why this issue only shows up on riscv64. We have not
observed this on other platforms (yet).

  [1]: https://lore.kernel.org/qemu-devel/20221207174918.GA1151796@roeck-us.net/

Klaus Jensen (1):
  hw/nvme: fix missing cq eventidx update

 hw/nvme/ctrl.c | 8 ++++++++
 1 file changed, 8 insertions(+)

-- 
2.38.1


