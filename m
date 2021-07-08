Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DDF63BF2F9
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 02:54:29 +0200 (CEST)
Received: from localhost ([::1]:35962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1IJ9-0000O4-R8
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 20:54:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fthain@linux-m68k.org>)
 id 1m1IHJ-0007aQ-Ni
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 20:52:33 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:45709)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fthain@linux-m68k.org>)
 id 1m1IHH-0006wF-N0
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 20:52:33 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 25B703200564;
 Wed,  7 Jul 2021 20:52:28 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 07 Jul 2021 20:52:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=4Y+w/I
 nVlqpnsqTWekvUdy8UT6uDHdZjYb7lhquQd88=; b=W3RYDe7Y/8+esgDd7GPHdS
 xVjra+WigmBqKQTHm6kgO5mTwnE13JGPcz0zVYJtGdaUjr5hgZaPm/KeTEq56I15
 lLgDrZzq3alG0CVGyf3vf2Ngr6IbCBnF0iRjCf/T7Sba72Ku9e+Sn8As1NkQXVBS
 5yo7bkUDoN1ikBx529IeT7UO9ne8q6sYDJvYGqD88DxH2RgO//5eOrJ4g7wo1/yu
 5MlbPn3OLvwueh3w/KJqsfhDNsAqmX6AMWhaxm8digg2uetfu/TFy1wWERIP8suU
 htwe29lPF8Kc0INVxK3lCYV1czAySfcI16QgCdt/MlOO1YaFak72cIZ3qA7vZ02w
 ==
X-ME-Sender: <xms:SkzmYNbZIDcwrAlM0b_rG54clcd9UVUvafWESiy6oWH5aRMIeiOXxA>
 <xme:SkzmYEYg8anOK63MsKnqJQ_RiFK6I9wr_rce-85wuQKo3JDNOqR6xayHxgxGvvPRN
 0CUes573GFzYRaNjd8>
X-ME-Received: <xmr:SkzmYP_5kWoNKTZpkxZ7yPTt6_OGzjwaOvLH1kN98K4pBMn4QV3XRrIDjKblmkQTAaEpTGkPeCFQ6zExydTPB07NiyfS3cvEJtU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrtdefgddviecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvufgjkfhfgggtsehttdertddttddvnecuhfhrohhmpefhihhnnhcuvfhh
 rghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrghtth
 gvrhhnpeffudfhgeefvdeitedugfelueegheekkeefveffhfeiveetledvhfdtveffteeu
 udenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehfth
 hhrghinheslhhinhhugidqmheikehkrdhorhhg
X-ME-Proxy: <xmx:SkzmYLr3uWRaBJO-ifWabQpdxsIBSZ7DuLz6PeB0Lveu7v2ZvBirhw>
 <xmx:SkzmYIpae9-ymybBUUOFVaGUlru5R0lWhht-NEBgvA0_B0kyHGY6ug>
 <xmx:SkzmYBQl_J4GQ2H8ftt27LFFxnKwROZw-u_dk3nQV-SSfJCoufS5Dw>
 <xmx:S0zmYP1u3_QM9AfDFPme5_xaG06eysMWjkW-I3zpIlURuYHAmSzG_A>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 Jul 2021 20:52:25 -0400 (EDT)
Date: Thu, 8 Jul 2021 10:52:22 +1000 (AEST)
From: Finn Thain <fthain@linux-m68k.org>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH 1/4] dp8393x: don't force 32-bit register access
In-Reply-To: <7b74db54-6afd-d20c-bd10-85bb6c3621cc@ilande.co.uk>
Message-ID: <f21cfe37-872-67a6-983a-65664214aaf0@linux-m68k.org>
References: <20210705214929.17222-1-mark.cave-ayland@ilande.co.uk>
 <20210705214929.17222-2-mark.cave-ayland@ilande.co.uk>
 <49104070-ee40-3bcf-f043-225f247a1de7@linux-m68k.org>
 <7b74db54-6afd-d20c-bd10-85bb6c3621cc@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: none client-ip=64.147.123.25; envelope-from=fthain@linux-m68k.org;
 helo=wout2-smtp.messagingengine.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: jasowang@redhat.com, qemu-devel@nongnu.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 7 Jul 2021, Mark Cave-Ayland wrote:

> However this conflicts with what you mention above that the SONIC is 
> hard-coded into little-endian mode, in which case we would still need to 
> keep it.
> 

If you want to fully implement BMODE in QEMU then you'll need to abandon 
native endiannes for the device implementation. I was not proposing this 
as it implies more byte swapping.

In a real Magnum the SONIC chip is connected to a bus that's not modelled 
by QEMU. It follows that BMODE serves different purposes than big_endian. 

I pointed out several semantic differences between BMODE and big_endian, 
but I think the most significant of those was that endianness is already a 
property of the memory device being accessed for DMA. Yet big_endian is a 
property of the dp8393x device.

> Certainly we can look to improve things in the future, but without 
> anyone having a working big-endian MIPS image to test against, I don't 
> think it's worth guessing what changes are required as we can easily 
> double the length of this thread and still have no idea if any changes 
> we've made are correct.
> 

That argument can be applied to other patches in this series also.

Anyway, if we agree that the aim is ultimately to remove the big_endian 
flag then patch 4/4 should probably be re-evaluated in light of that.

