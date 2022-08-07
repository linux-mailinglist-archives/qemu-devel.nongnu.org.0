Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4E658BAAE
	for <lists+qemu-devel@lfdr.de>; Sun,  7 Aug 2022 13:49:51 +0200 (CEST)
Received: from localhost ([::1]:53916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oKen0-0003pu-2u
	for lists+qemu-devel@lfdr.de; Sun, 07 Aug 2022 07:49:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elliot@nunn.io>) id 1oKekp-0002NZ-El
 for qemu-devel@nongnu.org; Sun, 07 Aug 2022 07:47:35 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:36731)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elliot@nunn.io>) id 1oKekk-0007Uq-1c
 for qemu-devel@nongnu.org; Sun, 07 Aug 2022 07:47:31 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id DC0295C00A7;
 Sun,  7 Aug 2022 07:47:27 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Sun, 07 Aug 2022 07:47:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nunn.io; h=cc:cc
 :content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1659872847; x=
 1659959247; bh=6AaaNWeFbi0ggZoBl0aN2Byp8f0nVOUrVN2KcnQgG5Y=; b=t
 jsyCzdqI6pSwxTglTvvv42S6c4SWOl44/MqDp0Rd6VxBhfHSMr27roEu2NyI4sy/
 Rti4zpfGDndxLFtBy0WIMSHKBOLi6F9Zkd5LtbBxpCx7x0ZkHIlyK7+1U7B/Q//3
 vGXFBtTI/mErHIlfzry1qWWW03yWwzyufF1TDxoGsxk8aahVqeg7uuX6WuPgxqF9
 FGftU0yqj+gwrHTmStf0igGXhiSwrs4SC6NgDiKXY8QZ7tGjIvkGgJQw8rdZR5jh
 DrtGeCk2Y8a+o3lH19Xr46+1WHWYPE/WbqYJKn8NMMUEOt/Mo7Nn3l+1IYeM+sDl
 8iXwn2OtzT20UQEvaODWA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1659872847; x=
 1659959247; bh=6AaaNWeFbi0ggZoBl0aN2Byp8f0nVOUrVN2KcnQgG5Y=; b=b
 M926a309bxkgR3rAOICtQ1x4QitfqvD/+k4ksL3hX47dvAx9hD6oVAVkOU2CKpyu
 ISDuhMoVqPTIzrzi+3QQU29TFlxAI5XT3iyXxP4J4Fo6ZAv53wIWBxLFHdpXwten
 5OFJHIQ3Y0KS7uBYWyosKfyzuEpBc56WDUiz0hc0p4xn/eqlgyZ9C1Ev95Fh/dWd
 3uzSwcN8Kyzs3aO7coQiktaGYK/WRHa5LRIhvb1TJceZp1nHjNHP1X6mwleNQatK
 ad0MbIKETvgO/4rrmYGqAnzNZJ/BPbu5zE0aSZiBWWX2Zw8mXk4DoDJ+Ig4DNzmc
 zfVXnFunrqnpdFaXPbYEQ==
X-ME-Sender: <xms:TqbvYip4F9cnmzr6qOaIOZcHkvplk_HkMJC51U-dm0HISW88bvZSzg>
 <xme:TqbvYgoCoiXIWVzv56k6Sb5PJflmRgbOYuOjm8dQ9sRFF8tEOE95DRmyhfAqBrtqB
 XYXEsVZu8NbQoimzQ>
X-ME-Received: <xmr:TqbvYnMyaBg_dxFZiIeAW1wSQJohmIPzDOqZkd1cxj-8lPlNVerJeffdp-tpnqxuqfXXCnAq0v2AUkDqZNgsbaCbqeXQV4NdaX9IYQZUzw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdefiedggeeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurheptggguffhjgffvefgkfhfvffosehtqhhmtdhhtddvnecuhfhrohhmpefglhhl
 ihhothcupfhunhhnuceovghllhhiohhtsehnuhhnnhdrihhoqeenucggtffrrghtthgvrh
 hnpeegteduieeivdejhfdtiefgteeifeetjeekjeefveduhfetudehieevfeejjefhjeen
 ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegvlhhlih
 hothesnhhunhhnrdhioh
X-ME-Proxy: <xmx:T6bvYh45mIK3lZs3pQHo7qsgwGdD-TolRP_6hknTvuCQYKgFQLs3IQ>
 <xmx:T6bvYh4KDUZBeHj2WZuLjkCmLT_FS2zLvPw3KyZFJ22CGrb6Zpz02Q>
 <xmx:T6bvYhjfMmObtNAIR60u6hJDwyYuGuXOVjB_UVWxbOWcHlRZvhztlQ>
 <xmx:T6bvYrkPP2793pBlHBDLPKztdhPwnXZ3UVXy-EdcaHKWp3jfI86AkA>
Feedback-ID: i6a78429f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 7 Aug 2022 07:47:24 -0400 (EDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.40.0.1.81\))
Subject: Re: VGA hardware cursor query
From: Elliot Nunn <elliot@nunn.io>
In-Reply-To: <4513db25-fc55-5884-f345-36d1510ff175@ilande.co.uk>
Date: Sun, 7 Aug 2022 19:47:19 +0800
Cc: qemu-devel@nongnu.org, kraxel@redhat.com,
 BALATON Zoltan <balaton@eik.bme.hu>, hsp.cat7@gmail.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <939C7085-9CA8-426B-A00B-DD059F845161@nunn.io>
References: <9A92120A-46B5-48A4-9424-8E606143291F@nunn.io>
 <4513db25-fc55-5884-f345-36d1510ff175@ilande.co.uk>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
X-Mailer: Apple Mail (2.3693.40.0.1.81)
Received-SPF: pass client-ip=66.111.4.28; envelope-from=elliot@nunn.io;
 helo=out4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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

>> I want to give Mac OS 9 clients access to hardware cursor support, to =
improve
>> responsiveness in absolute-cursor mode.
>> Would it be acceptable to add a hardware cursor interface to the VGA =
device?
>> And if so, can anyone advise on an appropriate register layout?
>> This is an example of such a patch. Because it alters the Bochs VBE =
interface
>> it is ONLY an example, NOT fit for acceptance. I have omitted the =
changes to
>> the binary driver qemu_vga.ndrv.
>> Kind regards,
>> Elliot Nunn
> Nice work! Have you been in contact with the Bochs developers to see =
what their thoughts are to your proposed changes? Generally QEMU prefers =
to implement documented specifications, so this would be the best route =
to go.

Thanks! I don't think it would be appropriate to update the Bochs =
standard with a feature that they don't use. And on reflection, perhaps =
the compatibility-oriented VGA device is big enough already.

My plan is to write a Mac OS 9/X "ndrv" targeting virtio-gpu. All going =
this well, this might become the default mac99 GPU until ati-vga is =
ready.

But virtio-gpu is not compiled into qemu-system-ppc by default. What is =
the difference between CONFIG_VIRTIO_(GPU|PCI|VGA)? And is =
configs/devices/ppc-softmmu/default.mak the correct place to declare =
them?=

