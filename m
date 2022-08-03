Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E1D8588ABA
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Aug 2022 12:44:31 +0200 (CEST)
Received: from localhost ([::1]:44426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJBrZ-0001uN-Te
	for lists+qemu-devel@lfdr.de; Wed, 03 Aug 2022 06:44:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1oJBdv-00015b-Rb
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 06:30:25 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:49473)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1oJBdu-0003mo-6p
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 06:30:23 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 63C7F5C0181;
 Wed,  3 Aug 2022 06:30:18 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Wed, 03 Aug 2022 06:30:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :message-id:mime-version:reply-to:sender:subject:subject:to:to;
 s=fm1; t=1659522618; x=1659609018; bh=z1ajvREF0nx6a97szJkSoShta
 bCykHY4eJf409fzACc=; b=JheQWr+v6kYyemfpPIZA8uFligu61n+CMgvM9Vl2t
 UbrtjejdyswgTsxrRgnkaXguGTI2sOL2SK6wQOREefs4JOKp+u3AxAla6OfSGQlA
 9rp3G9pEpwPbSMNVwmXRLA+V0wVfRjy2oYoz9r1YSIhd0GllKhj2p73BkjKGgUxH
 igO2O5oYXEYAwQ5IWK8uxi2s2lplEYPzI8RoaOk+I3jqYl5m2tFkByX+qky+1zE1
 KygRlXMYLhSrwBT17yXFT2Q9Ihve3Fl4xF92JlHqG6KXxAVrpfaXveijJ59sXxut
 xRX6ZZfRr8QV3RI6SevZOfwBbQeObHCyYzvC3F9TcqXDQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
 1659522618; x=1659609018; bh=z1ajvREF0nx6a97szJkSoShtabCykHY4eJf
 409fzACc=; b=FQmrUmd2BzAoT93hU9XU09gEsnqlC9keumxaSq1h2Ew/SF04dy/
 d6eXooIyLKlOqGZocJ22OPqzUPOV1zuUt6pNaks6hpwLwBP1LTurAjAYSNXO9Wzl
 fVzHI95DGWTgztWfe9uFqXqcq+Wr4dnTv7AAYzNDBjvipBPOyna9ETCn53RVKMqU
 7VnWGXRTOt13d5w38/hXo0MGuD0MhKDoeUvrlzxJYLpv0qxm5K+1aKZnjmuJfiJF
 Fr+RDwxw7VOS0O3T2NxMWYhdiJh8DY8hVRDqNANyZtzehs7Ln1r+zirBvED2zqeM
 tMrdQQvhTnAY9KPvOOv8H9WMA3CG91tFRQQ==
X-ME-Sender: <xms:Ok7qYnijWIeBMUXsl_8xoV7nFrxVO7yW2B4in1g8vQZ4bXYqysR8IQ>
 <xme:Ok7qYkCGMU7BLmC2s2SoiT-WZKnsX-b1nrFBjwPSfFKJcYwxiF47jYHeJ8NDbjwhk
 0T8jTdxPIbXsamAvj4>
X-ME-Received: <xmr:Ok7qYnEBFATkdUZWddnH4yIGSgGiMWHBlZjbWsxSqXbRYot0-1OBsBppeV5yktlbnOSpUcTNipDHn52kDW4fpr4uhGN8u55Tvy81TKrWHFKlquqiScv6qhHy>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvddvjedgvdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertd
 ertddtnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghnghes
 fhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhephfetuddtudevieeljeejte
 ffheeujeduhefgffejudfhueelleduffefgfffveeknecuvehluhhsthgvrhfuihiivgep
 tdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgoh
 grthdrtghomh
X-ME-Proxy: <xmx:Ok7qYkSP30wso527klSACz7ApHShFgp2xczUDZVoWstDzUH1ohWB4w>
 <xmx:Ok7qYkzc2tx7eacDU63IPI6YQc_oJc3gtMfyRSKa99Rkg2lFH_6WxA>
 <xmx:Ok7qYq6wEiqx4j3zSnBZiiRous9YxGhE3tfZ6Rwn1LNSfgFnPWcoZg>
 <xmx:Ok7qYv-m0C5WUI_aDPtd0FmZf7mk_F8HkgCRs3UVboem7jFG0IK7Kw>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 3 Aug 2022 06:30:17 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: laurent@vivier.eu
Cc: f4bug@amsat.org, qemu-devel@nongnu.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v2 0/2] linux-user: AT_BASE_PLATFORM for MIPS
Date: Wed,  3 Aug 2022 11:30:07 +0100
Message-Id: <20220803103009.95972-1-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.32.1 (Apple Git-133)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.27; envelope-from=jiaxun.yang@flygoat.com;
 helo=out3-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Hi all,

This series properly filled AT_BASE_PLATFORM of MIPS.
There is a checkpatch error about braces after if statement,
I intentionally left it for style consistency.

v2: Commit meesage rewording (philmd)

Thanks.
- Jiaxun

Jiaxun Yang (2):
  linux-user: Introduce stubs for ELF AT_BASE_PLATFORM
  linux-user: Set ELF_BASE_PLATFORM for MIPS

 linux-user/elfload.c | 60 ++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 58 insertions(+), 2 deletions(-)

-- 
2.32.1 (Apple Git-133)


