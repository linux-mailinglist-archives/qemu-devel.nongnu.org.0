Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21494456BC8
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 09:41:46 +0100 (CET)
Received: from localhost ([::1]:36698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnzSq-0002iO-UC
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 03:41:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fthain@linux-m68k.org>)
 id 1mnzQY-0001Yk-EU; Fri, 19 Nov 2021 03:39:24 -0500
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:44915)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fthain@linux-m68k.org>)
 id 1mnzQV-0005zj-Pp; Fri, 19 Nov 2021 03:39:22 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 700BA3200E5C;
 Fri, 19 Nov 2021 03:39:13 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 19 Nov 2021 03:39:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=VsqZbW
 WFnp3vYE098x8+5+q+ep0neDV/5ypCxAfPo8k=; b=ngpQj5ahnnJfn0ug9daJ+N
 A5BoaTjUUHei5I0fsCnppHZVUWx0a3tYBQ1gBtY5wulfSs9pCe6EbdsqPTTf+i8b
 lFxqpQHc+f6lLtkfHc+kNaKwGlOHz3fS470qP5XEhvyEQisrTshTpLGNBJ8T5Awx
 iP3wsvqQu6J2N1CqQvKZHAWvOiB5z5kOTqO6xkJHYtAs/mzA84EniJhJR1SWa1we
 6+ZgJjoK+ut91hhbxawD4YtdrDR+i03dhzJvyzNWZoEgkJ6EateIEdDUo/Y7lG2y
 Zdtj04/VAfYamUxyQrbPR63aql0m9bsJex0//22nu0bry0YtnUfYUoBC98c6s8Ag
 ==
X-ME-Sender: <xms:sGKXYbpxUSjeUCbGZmf9VTuE4SLsOZujPRvky-k2T6-zdCgONB8qzA>
 <xme:sGKXYVqkSMLHBnoqJtE31E55H1fk3a4oH7_5CqnuPEtRKFBd9g9yyFyz3rlM6xhqW
 3FdLTXTxDA6RXUaJUw>
X-ME-Received: <xmr:sGKXYYMu74LzeiBw9LK7O3JIJynyPiUFFeO-W3lsUTVaby41VqlxLzZ4c7YFhPhyn9--dLVq0POGAYnDW-w1bj1p0HdrXTsxD9I>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrfeejgdduvdduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffujgfkfhggtgesthdtredttddtvdenucfhrhhomhephfhinhhnucfv
 hhgrihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgheqnecuggftrfgrth
 htvghrnhephedvuefggeejvdejjeejudfhvdevvdeuteffhfeivdetffejfeekgfdvkeek
 vedtnecuffhomhgrihhnpehgihhthhhusgdrtghomhdpghhithhlrggsrdgtohhmnecuve
 hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepfhhthhgrihhn
 sehlihhnuhigqdhmieekkhdrohhrgh
X-ME-Proxy: <xmx:sGKXYe7rR2NhOCYaBa8KqpBTiX03FJYECuadDpDSLWpSe5Q__mm0fQ>
 <xmx:sGKXYa4MQwOVBfJWNexwmi-CwqJmCMjkdF0b0kKZbeMCQq8gnpD14g>
 <xmx:sGKXYWhWP7bVtW1wO1JXwDJ5VYyRM88cNTlGsDy2H5eKj_Mb3wQ_Nw>
 <xmx:sWKXYQkhhc9AireEJK2fJ2fhuHW-An6EX0795XTvWhkJfRGmm8CxRQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 19 Nov 2021 03:39:10 -0500 (EST)
Date: Fri, 19 Nov 2021 19:39:10 +1100 (AEDT)
From: Finn Thain <fthain@linux-m68k.org>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: Re: [PATCH v1 0/9] hw/mos6522: VIA timer emulation fixes and
 improvements
In-Reply-To: <2fb3d9f8-0f20-082d-d9f1-ab2984356866@ilande.co.uk>
Message-ID: <ad537ce9-ec40-b5e4-bb32-5f53e42db29@linux-m68k.org>
References: <cover.1632437396.git.fthain@linux-m68k.org>
 <e0411348-abd7-3db9-b5bd-8f1d52c1226f@linux-m68k.org>
 <2fb3d9f8-0f20-082d-d9f1-ab2984356866@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: none client-ip=64.147.123.24; envelope-from=fthain@linux-m68k.org;
 helo=wout1-smtp.messagingengine.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>, qemu-ppc@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 18 Nov 2021, Mark Cave-Ayland wrote:

> 
> Hi Finn,
> 
> I've not forgotten about this series - we're now in 6.2 freeze, but it's 
> on my TODO list to revisit in the next development cycle this along with 
> the ESP stress-ng changes which I've also been looking at. As mentioned 
> in my previous reviews the patch will need some further analysis: 
> particularly the logic in mos6522_read() that can generate a spurious 
> interrupt on a register read needs to be removed,

If mos6522 fails to raise its IRQ then the counter value observed by the 
guest will not make sense. This relationship was explained in the 
description of patch 8. If you have a problem with that patch, please 
reply there so that your misapprehension can be placed in context.

> and also testing is required to ensure that these changes don't affect 
> the CUDA clock warping which allows OS X to boot under qemu-system-ppc.
> 

I'm not expecting any issues. What is required in order to confirm this?
Would it be sufficient to boot a Mac OS X 10.4 installer DVD?

> I'm confident that qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) is monotonic, 

As I mentioned, it is monotonic here.

> since if it were not then there would be huge numbers of complaints from 
> QEMU users. It appears that Linux can potentially alter the ticks in 
> mac_read_clk() at 
> https://github.com/torvalds/linux/blob/master/arch/m68k/mac/via.c#L624 
> which suggests the issue is related to timer wraparound. I'd like to 
> confirm exactly which part of your series fixes the specific problem of 
> the clock jumping backwards before merging these changes.
> 

You really only need a good datasheet to review these patches. You don't 
need a deep understanding of any particular guest, and you shouldn't be 
targetting any particular guest.

One of the purposes of this patch series is to allow the guest to change 
to better exploit actual, physical hardware. Since QEMU regression testing 
is part of the kernel development process, regressions need to be avoided.

That means QEMU's shortcomings hinder Linux development.

Therefore, QEMU should not target the via timer driver in Linux v2.6 or 
the one in v5.15 or the one in NetBSD etc. QEMU should target correctness 
-- especially when that can be had for cheap. Wouldn't you agree?

QEMU deviates in numerous ways from the behaviour of real mos6522 timer. 
This patch series does not address all of these deviations (see patch 8).  
Instead, this patch series addresses only the most aggregious ones, and 
they do impact existing guests.

> I realized that I could easily cross-compile a 5.14 kernel to test this 
> theory with the test root image and .config you supplied at 
> https://gitlab.com/qemu-project/qemu/-/issues/611 using the QEMU 
> docker-m68k-cross image to avoid having to build a complete toolchain by 
> hand. The kernel builds successfully using this method, but during boot 
> it hangs sending the first SCSI CDB to the ESP device, failing to send 
> the last byte using PDMA.
> 
> Are there known issues cross-compiling an m68k kernel on an x86 host? 

Not that I'm aware of.

> Or are your current kernels being built from a separate branch outside 
> of mainline Linux git?
> 

I use mainline Linux when testing QEMU. I provided a mainline build, 
attached to the same bug report, so you don't have to build it.

