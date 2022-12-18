Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AAC364FE76
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Dec 2022 11:27:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6qt1-0002zy-Af; Sun, 18 Dec 2022 05:27:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <voltagex@voltagex.org>)
 id 1p6qsj-0002yC-C3
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 05:26:57 -0500
Received: from out3-smtp.messagingengine.com ([66.111.4.27])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <voltagex@voltagex.org>)
 id 1p6qsg-0004TQ-Vg
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 05:26:56 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id BA4655C0084
 for <qemu-devel@nongnu.org>; Sun, 18 Dec 2022 05:26:50 -0500 (EST)
Received: from imap44 ([10.202.2.94])
 by compute2.internal (MEProxy); Sun, 18 Dec 2022 05:26:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=voltagex.org; h=
 cc:content-type:date:date:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to; s=fm1; t=
 1671359210; x=1671445610; bh=HDcZ3ciKvbg74vd0tfcT/PoLZ5gJ18uX0Hz
 FveNgABQ=; b=NU8npfeS7XRgOJVNwPVpOBYpMvu+sMuFeC2w2e+Zu37ktPjZaOD
 Ubm8N1VKdnCNSP7gQ2phlXtH1bKDNQcvItgJuSsmo8Ve0/c4exvXmedXcRmS1BUS
 SpvcnxPw1TjySVpdV1gdnFstNkL1uZnCYeiXDQ0jSx/O7T52h4FXTJ2cTFi/vPTx
 WJZPH88i/bWimSt9XWFaXCo929am1DU28+Qap6+znnBoL2o1iPeEEDPd5730KheI
 hOxjnbkJbSKJnUi8lSDXbueUb80OORH1h457FtgJ0pGwmA5O4GBMcqyrUA/Ee2r7
 gTybw0b3Q9zUKqIGyxG/J2IdB5ucEM3alRg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:message-id:mime-version
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1671359210; x=
 1671445610; bh=HDcZ3ciKvbg74vd0tfcT/PoLZ5gJ18uX0HzFveNgABQ=; b=b
 oejJ8U0Qu9La8E9IV3dXgNEec7qLp+03PD8C/1NRpTWVcoJHHRDMNdGM3dL9zLA/
 HfLcCl6tuuC13nGhaJIr1T+EZzrgKzBviChg7TmiRgHXjUFDeGIvcAPEGhNPmAxp
 elK3QgcbzKeqEt1rMd27Rc4azJ1fiB+oeIpYL8xqjsOtqChTvONDLw5Hz9CTie+s
 30VaHTlaFiP8MltrfCOUotyJuyM5FpqnsGztxeKkAaPbIL2JtQ0OeS5gt/jrz/RH
 0K36XbKgruWWR3PrE1pGSrtdvHGyrNQBktukRy+HSRYHiirMqHv/uFdmCsxLg7+6
 gs8BfRLziebfnKjPq9A+Q==
X-ME-Sender: <xms:6uqeY4ZsKpdGQQzy2h1YSXlrHcydYW_B5jwUnHq7O5tz0Mgrwxf8pw>
 <xme:6uqeYza1DgLoU40oylczpD16Ews2T4XWp-YreKzg1mo8Z1eo7KCYeBYsKoA2JcqNH
 jEGPS48UN74oRPatw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrgedugdduiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhepofgfggfkfffhvffutgesthdtredtre
 ertdenucfhrhhomhepfdetuggrmhcuuegrgihtvghrfdcuoehvohhlthgrghgvgiesvhho
 lhhtrghgvgigrdhorhhgqeenucggtffrrghtthgvrhhnpedtueeiteduleeigeelhfeggf
 fhgfduteeivefgfeeitefgieduvdeguddtgeekhfenucevlhhushhtvghrufhiiigvpedt
 necurfgrrhgrmhepmhgrihhlfhhrohhmpehvohhlthgrghgvgiesvhholhhtrghgvgigrd
 horhhg
X-ME-Proxy: <xmx:6uqeYy8EOvArE1KaGGdB-Asd_TRoGm_Vh_bpC5Z8-jU0LgGJY9QANw>
 <xmx:6uqeYypurUq_RwSne7IG-0MaBw3iKB_Wi3B4XmrOXM1v6JKhft1A0Q>
 <xmx:6uqeYzpozdN3kWlXWxvaWR8KAfDDY7zcL7qBqJ2QBoNFTt4zt4njuQ>
 <xmx:6uqeYw2ijUuqgP6absfj6lewaZO1eM6GeUKv5OA-V0P4elAlHo5xjA>
Feedback-ID: i48c147ae:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 89D7D36A0073; Sun, 18 Dec 2022 05:26:50 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1185-g841157300a-fm-20221208.002-g84115730
Mime-Version: 1.0
Message-Id: <f1516cb9-153a-4eb8-ad6a-1b11db692a00@app.fastmail.com>
Date: Sun, 18 Dec 2022 21:26:28 +1100
From: "Adam Baxter" <voltagex@voltagex.org>
To: qemu-devel@nongnu.org
Subject: Assistance needed, GitLab #677 and #1360
Content-Type: text/plain
Received-SPF: pass client-ip=66.111.4.27; envelope-from=voltagex@voltagex.org;
 helo=out3-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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

Hi,
I've been looking into #677 and #1360 over on the GitLab issue tracker but I need some help to either get a full patch (I think the one in #677 is just a workaround?) and/or to understand what's happening better.

It's really tricky to debug in that environment (needs a mingw64 gdb, but to somehow launch in the context of WSL2)

Could I please get some help?


Sidenote: IMO the bug tracker should cc this list, at least for the initial issue message.


Thanks,
Adam

