Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C62A60AF9E
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 17:53:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omyYA-000446-1U; Mon, 24 Oct 2022 10:35:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1omyXu-0003xR-46
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 10:35:22 -0400
Received: from wout3-smtp.messagingengine.com ([64.147.123.19])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1omyXr-0007kt-VD
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 10:35:17 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 16F2D320096D;
 Mon, 24 Oct 2022 10:35:12 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Mon, 24 Oct 2022 10:35:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :message-id:mime-version:reply-to:sender:subject:subject:to:to;
 s=fm1; t=1666622111; x=1666708511; bh=XMqhHTPXNp47zQ+IQDA1BQeRR
 hq+b6efrKcP0FLn2As=; b=MXfq9plby+Wm5yRIHYl9aMlhO6qXESg+PvPSRPgjb
 UEBVY4/4GDkosmr6Q2ZLQ+R/11f52HUVMWuvY5wUK3RhUYoMhYpc4U5wvSA1Rbvq
 zu20AUn3WyKTGbGyEeND7U7tEUvkAhfQO7OPwA3cfisDNTYv4BmLgi3lx4QV6rHv
 K/JfeATgjt6/L7xYcLJbh9wtcaksOCjr/foimWIS6tRUAUTBWCxY1ufLPfrSbnMl
 dEx6cUR1auRP1m0iZ9PMqQYehaveG7R89nYikK9WWhX3qSy+lq9/qNaT4vPiyIbQ
 gvORsnLcZgnlfYwNW78pDnJHfvDhWxtcKioo5AapGtvnA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
 1666622111; x=1666708511; bh=XMqhHTPXNp47zQ+IQDA1BQeRRhq+b6efrKc
 P0FLn2As=; b=Hr9rstMg5fw8RiUdFNL+7+0pcPfLWOMVq7JOt5mhaIG4/4G23iK
 82RiCZ2Rbwg4VqE2XqDR03iineIPR9jUvNjbHqkc8jrRHxfOmK13xmjwRP/uCOJN
 5acDgALf6P4iF+0Eqgy8y72AMkkOLjfJBxsYThKOxE4Xo+d0Zuho5v1o8alIOBsd
 G9Hkhf6jD8pxdtb0RU/Sva3M2X0sOgaUDku81s8YmDV5uMHqi0UJ3rNNUc86bc0w
 8Qp7gmetR3I+Zu9iHOVl8bFcsUbOJqSU7yHGFyxG4ThBsNtcN3NWJrbFhPMuEHi8
 ayboUjH2WmNRyS4w+02IKeu+osB/kdpxigA==
X-ME-Sender: <xms:n6JWY_uIo_au_vOGQ2cNlPz7UGftZo_YHCoTVbQv3JeyV8doSTW4tw>
 <xme:n6JWYwfxDCoPTh1l9f5iMc6G8kXopALbgJZ3urBrUE6FAqQQkymGspuAVuqIgv8Ta
 OJ2rKlTcaS7r5brs9s>
X-ME-Received: <xmr:n6JWYyxC48OVqLQe61vJ8L2TDTHK7K2AkTYdt6IrioaLl1vwcjCuCQdXZ-gr>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrgedtgedgjeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertd
 ertddtnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghnghes
 fhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhephfetuddtudevieeljeejte
 ffheeujeduhefgffejudfhueelleduffefgfffveeknecuvehluhhsthgvrhfuihiivgep
 tdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgoh
 grthdrtghomh
X-ME-Proxy: <xmx:n6JWY-MgqgJVFneJ1ikTGOz937PNSLyRoLtQ62gBHh6CIwB6MKRCaQ>
 <xmx:n6JWY_-2g2PnCS5m9B5zC0scIZo4gX90b9qcj05ckiTGjxbjrutNVA>
 <xmx:n6JWY-WgeAvfTxNCYusD7KNObkPOrB7IUDfeqmRKGQtwzGFKDuAroA>
 <xmx:n6JWY5lFgdtyc-2bSRT23NzeXnCil1nHqR5B5bVcT1kqHptX47Luzg>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 24 Oct 2022 10:35:10 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: f4bug@amsat.org
Cc: qemu-devel@nongnu.org,
	Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 0/2] hw/mips/boston: Initrd support
Date: Mon, 24 Oct 2022 15:35:04 +0100
Message-Id: <20221024143507.97477-1-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.19;
 envelope-from=jiaxun.yang@flygoat.com; helo=wout3-smtp.messagingengine.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi all,

Just a small addition to make boston board easier to use :-)

Thanks
- Jiaxun

Jiaxun Yang (2):
  mips/boston: Support initrd for ELF kernel
  hw/mips/boston: Pack fdt in fdt filter

 hw/mips/boston.c | 40 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

-- 
2.32.1 (Apple Git-133)


