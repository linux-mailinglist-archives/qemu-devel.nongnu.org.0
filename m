Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82D2D3FD16B
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 04:38:36 +0200 (CEST)
Received: from localhost ([::1]:58140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLG95-00086R-Je
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 22:38:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fthain@linux-m68k.org>)
 id 1mLFrq-0004Tp-UN; Tue, 31 Aug 2021 22:20:48 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:32899)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fthain@linux-m68k.org>)
 id 1mLFro-0005wp-Qw; Tue, 31 Aug 2021 22:20:46 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id BDBB05C01D5;
 Tue, 31 Aug 2021 22:20:42 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Tue, 31 Aug 2021 22:20:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=E5T45o
 +B1AL+H0Hw+sH0IyFCEoCYZLIkJJwqrEcYp+c=; b=e4Tp5FqLWEVU2YTIqR6k+S
 h0TrKuJ9x/0FXP00b1HN5aF5z9PKNcDgxE2YDi1xKlgAgZhoB4R5e35PBPZUTWKV
 HkYla4eKQa2u9gLCUnYL23bkKY/qTPWF+Qxz1Qr8f78BVJOEjaClzDKFJyNs9tQ6
 63tt7cSn63oUHmSV5ZEa7Azbdbaj9+dOORpWeYu8FimQ8RiVSKnkKTsQvSr8x5v2
 TFHBGLCTugjW2gQEMOrt0z6P7N6418r1RewOgjQp5OE4FW5ngVrZRSuFjDeBzAmp
 co+b8TgawSX7JASybzqe2jvUrBhfUw+ij/CdbuY7a1tC319XGHYvbvKhBrUFqU+w
 ==
X-ME-Sender: <xms:eOMuYXxX9XwOfjb4m1MBHYwl78hTgrIR_zCrh6yjLAD3bFMp-Y05hA>
 <xme:eOMuYfTDVRcAFYCCW-DZ2lvUBeJdqPbQ6A876aa7CUPhmMKM1y70Va5IUiRgQ0yzZ
 hLa1fRM-DqcXYY_yqE>
X-ME-Received: <xmr:eOMuYRX_4TGRvfQovgFrOU49QwUo8Jpn8PmQHGu2Ew7XJHNTPLXtVnqcpUN5etvQkH6v704_Z7bPsUAHgUweh_zN8vdsIVCdrqku7Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddvvddgheejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffujgfkfhggtgesthdtredttddtvdenucfhrhhomhephfhinhhnucfv
 hhgrihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgheqnecuggftrfgrth
 htvghrnhepffduhfegfedvieetudfgleeugeehkeekfeevfffhieevteelvdfhtdevffet
 uedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepfh
 hthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgh
X-ME-Proxy: <xmx:eeMuYRjmpeopSir8-5q-i6hDVuCWzxS_KLbySMjHmRnsNGlSw5N0Kg>
 <xmx:eeMuYZBMwB9prUviS6r-0kIDUhs9ids7LuAWV1dbjyPLLfqwaji08w>
 <xmx:eeMuYaKVUD9KKc6YySynPX3RLPB4g3OELeZVQBcL01FNnuSJbthEVw>
 <xmx:euMuYc77i0PTmz8AQcS9feHxhcplg85L9umrBzCj7nZY8O3izwAb9Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 31 Aug 2021 22:20:37 -0400 (EDT)
Date: Wed, 1 Sep 2021 12:20:32 +1000 (AEST)
From: Finn Thain <fthain@linux-m68k.org>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: Re: [RFC 00/10] hw/mos6522: VIA timer emulation fixes and improvements
In-Reply-To: <4da39536-1acb-05c3-755c-9a30d82d6ace@ilande.co.uk>
Message-ID: <6c8edbbb-1d2-ee8f-6550-ace8dea36599@linux-m68k.org>
References: <cover.1629799776.git.fthain@linux-m68k.org>
 <283af572-2157-77c6-2594-8e9e92497346@amsat.org>
 <fb42cb6-117c-c138-c18a-3af7f1d9be6a@linux-m68k.org>
 <4da39536-1acb-05c3-755c-9a30d82d6ace@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: none client-ip=66.111.4.27; envelope-from=fthain@linux-m68k.org;
 helo=out3-smtp.messagingengine.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Greg Kurz <groug@kaod.org>,
 qemu-ppc@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 31 Aug 2021, Mark Cave-Ayland wrote:

> You mentioned that the OS may compensate for the fact that the 6522 
> doesn't have an overflow flag: can you explain more as to how this works 
> in Linux?

When running on real hardware, Linux/mac68k does so by

 - Elevating the interrupt priority of VIA 1 so that other drivers do not 
   interfere with timekeeping

 - Constraining intervals during which the IPL is kept elevated (i.e. 
   local_irq_disable/enable).

When runing on QEMU, none of that is sufficient and the Linux/mac68k 
kernel can do very little to influence interrupt latency.

Linux ports to other platforms typically have multiple timers and counters 
with which to implement reliable clocksource devices.

When running on other virtualization platforms, Linux may solve the 
problem using a paravirtual clock device. Please see 
CONFIG_PARAVIRT_CLOCK, arch/x86/include/asm/pvclock-abi.h, 
arch/x86/kernel/pvclock.c, arch/x86/include/asm/vdso/gettimeofday.h 
arch/x86/xen/time.c and so on.

