Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BFDF35D38F
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 00:59:08 +0200 (CEST)
Received: from localhost ([::1]:55202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lW5WM-0005MR-QA
	for lists+qemu-devel@lfdr.de; Mon, 12 Apr 2021 18:59:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@aj.id.au>)
 id 1lW5Uo-0004XF-SU; Mon, 12 Apr 2021 18:57:31 -0400
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:33709)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@aj.id.au>)
 id 1lW5Uj-0001Hc-V4; Mon, 12 Apr 2021 18:57:30 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id CD20E16BC;
 Mon, 12 Apr 2021 18:57:20 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Mon, 12 Apr 2021 18:57:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type:content-transfer-encoding; s=fm2; bh=CCu78
 nP0OOFi3PiuiZ/cnK6E/3Z+4NIgLnGq+le2i2Y=; b=uPXD3lbinNVKM2lXXBeyM
 pmXeTOO2mpdfMTOFKNZv4I1JyhcrDM/CbyVlBaZrvZTj6RqhUbxqohNC+j0y5cE6
 gX5ZcAPs7Ary8MH1EPiaGaHFNWuHzGvJiL53mNoPdFoKWpkFtdcPNRfDLiULpKVX
 GJ8itEdmh2Qo3h/gViTLkO6X/ySWlfnVUwKSEHdIclhb0U/d5oD+nNDND1qbDgif
 87Wv9ByN5Zfe374JQ9S70ZbvoRdECNqUoD29ll0SyV1ga4DcwnqHKOKNlcS4pzoC
 vzdNc31pXtE7+AuUw5KH/I8WLSb4AUfwMXklcuNDFqeL7cz6VrI/zg5n0Qylz1kP
 w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=CCu78nP0OOFi3PiuiZ/cnK6E/3Z+4NIgLnGq+le2i
 2Y=; b=jNaTJ/M59X1XxxANZjliQ427D6hdsTYWklQOiOeKrbVdOaSdv4WNqzUDq
 JQBF83VecrdHrr2teD0gOe6l4QVIZwfxlMm4GK6ADtuXXCfLarnW4PKNpEsM1/IX
 u5rfD7A3ke7wwugsuX6KpG7M5bmHI2hAxw6e87iJCMEYC3vxPb2LUWlV/WI7zLph
 vH6n8CuJEloAt5JIT4Tm/zVoHBUE3U80+U765RXa3IixVUePScJW7VAC3iI2BwpP
 YuqNV0YIMeKhQn6+YK39WdFm7+vhmxDpk6ZQUssl0T1KUx+KqvWefkEUIQ0gK0eN
 wVkWN+XWayBsp0IqRqLSe5/JrEK1w==
X-ME-Sender: <xms:T9B0YFE9_WR0oZvSXkLZfxO7KhIXm4wVipsloif_b7zh6iqamqFIQA>
 <xme:T9B0YKX9i5FBrhxnoMGEIP2juQq2fnGlBfvAV_l3mQeCuEde_x7V7PvYZ1umXwl1d
 u4uzaMnLx4Qic5T1g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudekkedgudehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgfgsehtqhertderreejnecuhfhrohhmpedftehn
 ughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtf
 frrghtthgvrhhnpedvgeekheegfedvhfethefhudetteegueeggfeiieegueehkedugedt
 kefglefgheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:T9B0YHKV-Z-bxOR6KTNwEZdabdu9OjxPcR4S-q47Lr6tpyaNoo2DPA>
 <xmx:T9B0YLF5hD_PLDR68zaE2vRIhvYJRcOav-Ncst7LJ3hkhDtX9Ixfww>
 <xmx:T9B0YLWaLPqnePdq1QGUxVogjuqN3iJQ6ZuEXOJ8dsuB9Urg05AlxA>
 <xmx:UNB0YIhpyneXhaUcVbWCHJdxBQ0P0BLl3UMjuAbhqoPy-ZFzDUD5MA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 676C1A00492; Mon, 12 Apr 2021 18:57:19 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-273-g8500d2492d-fm-20210323.002-g8500d249
Mime-Version: 1.0
Message-Id: <66ef55f5-de03-46b1-ada0-089246e0dad1@www.fastmail.com>
In-Reply-To: <9c004931-648c-3215-6720-647fe35a50c7@kaod.org>
References: <20210304124316.164742-1-joel@jms.id.au>
 <9c004931-648c-3215-6720-647fe35a50c7@kaod.org>
Date: Tue, 13 Apr 2021 08:26:49 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 "Joel Stanley" <joel@jms.id.au>
Subject: Re: [PATCH] aspeed: Emulate the AST2600A3
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=64.147.123.19; envelope-from=andrew@aj.id.au;
 helo=wout3-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Cameron Esfahani via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On Tue, 13 Apr 2021, at 00:57, C=C3=A9dric Le Goater wrote:
> On 3/4/21 1:43 PM, Joel Stanley wrote:
> > This is the latest revision of the ASPEED 2600 SoC.
>=20
> Should we change all machines to use the new SoC ?=20
>=20
> I would prefer if we introduced an "ast2600-a3" Aspeed SoC, that we wo=
uld=20
> use for the newer rainier machine, and leave the tacoma-bmc and ast260=
0-evb=20
> machines as they are.

I think we just change them all. We're not going to see pre-A3 chips in=20=

production systems.

Andrew

