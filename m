Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B5F33BB4FB
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 03:46:45 +0200 (CEST)
Received: from localhost ([::1]:59162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0Dh6-0006UU-6p
	for lists+qemu-devel@lfdr.de; Sun, 04 Jul 2021 21:46:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fthain@linux-m68k.org>)
 id 1m0DfU-0005iu-Ci
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 21:45:04 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:38739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fthain@linux-m68k.org>)
 id 1m0DfQ-0008MO-08
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 21:45:04 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 8F5CF5C0085;
 Sun,  4 Jul 2021 21:44:57 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Sun, 04 Jul 2021 21:44:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=ZDET7k
 p3N0jk24ATPOmm4emDPJ8CVHIRQwPJ7+1/M6w=; b=XgfYxyJo81ZxyXNvIMXRVx
 VQ+/fJACUYGJ7bAMPeLnSsE2j87YcJaxDbdEuhd/wSJ3h7l53wic4LV8WKqXp9Ev
 aic3a7rTmAIuqYEMvw7tDrip9mcpyV0Qj8sPZZXJXaIoK2LQDAVC8VpJl2c1VGtS
 X0+eNQzDIGzairfWIWczsdxWwf2xFxITja+1Low6S2oYQljpvd3Ns0dMJJ7x5VVO
 4jTxsj7E9jSu3fcisOaBgixOwB3wuEHFwb+dd0w1Hz/rc84VRBiy1d5EfbNE4ni3
 1aHzlb+V8h6BaVfRzCL/fgUVpd3T5XLFiNweOzfUHgyxw0Xq9qTXQcQ4qUwtymhQ
 ==
X-ME-Sender: <xms:GGTiYInYnVYct3vs-ots9JnAO5YMKLiE4eLIGBph-rJIS52h2VC0eg>
 <xme:GGTiYH1kAmZixh9uWXSBq6wwKa7YuQ3KPovPxWAvFLr4PQxXpi8scRZ_546qRLdcm
 oqSO3uGFmuR7QDSilc>
X-ME-Received: <xmr:GGTiYGpv6ZXKOhZYmNLyZV9DpPEPLMqYAGDeTNxNmI6EDB26_5CqTTvu8RiRobjLJ4sw1y7R6-jgkWSUNKeXvHde6rsuO_xD-8Y>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeejfedggeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffujgfkfhggtgesthdtredttddtvdenucfhrhhomhephfhinhhnucfv
 hhgrihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgheqnecuggftrfgrth
 htvghrnhepkeevvedtkeeftdefhfdvgfelleefhfdtfeeiteejjeevgffhudefjeekhefg
 uedunecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpe
 dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehfthhhrghinheslhhinhhugidqmheikehk
 rdhorhhg
X-ME-Proxy: <xmx:GGTiYEkYGXUTpafgVXaDSVNCU3Dg1S0SKWuYIRRMdJ_TBSvRBIEWOg>
 <xmx:GGTiYG2xEFXl6l3za0hVQDel8t5ebVKnzL0cWp5wfEd9aHpzfLvi4Q>
 <xmx:GGTiYLsV5s7W-YoCTvTOWfuQULK53bgmsjqw9uClZQl-B-YQrLNbRw>
 <xmx:GWTiYECf5WmcdU2aQcBF1gAIqx1BRsUpjXcyOsdZoFVFLU5NDURnDg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 4 Jul 2021 21:44:45 -0400 (EDT)
Date: Mon, 5 Jul 2021 11:44:24 +1000 (AEST)
From: Finn Thain <fthain@linux-m68k.org>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: Re: [PATCH v3] dp8393x: don't force 32-bit register access
In-Reply-To: <20210704152739.18213-1-mark.cave-ayland@ilande.co.uk>
Message-ID: <4f4d1643-85f7-fbbc-3a22-fff086362c32@linux-m68k.org>
References: <20210704152739.18213-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: none client-ip=66.111.4.26; envelope-from=fthain@linux-m68k.org;
 helo=out2-smtp.messagingengine.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_PASS=-0.001,
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
Cc: jasowang@redhat.com, f4bug@amsat.org, qemu-devel@nongnu.org,
 laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 4 Jul 2021, Mark Cave-Ayland wrote:

> Commit 3fe9a838ec "dp8393x: Always use 32-bit accesses" assumed that all accesses
> to the registers were 32-bit 

As I said, that assumption was not made there.

If commit 3fe9a838ec is deficient it is probably because I am unaware of 
the ability of the QEMU memory API to accomplish the desired result. 

That's not to say that the API can't do it, just that I don't know enough 
about the API.

> but this is actually not the case. The access size is determined by the 
> CPU instruction used and not the number of physical address lines.
> 

Again, that is an over-simplification. To explain: in Apple hardware at 
least, the access size that the SONIC chip sees is a consequence of bus 
sizing logic that is not part of the CPU and is not part of the SONIC chip 
either.

AIUI, this logic is what Philippe alluded to when he said about this 
patch, "This sounds to me like the 'QEMU doesn't model busses so we end 
using kludge to hide bugs' pattern".

> The big_endian workaround applied to the register read/writes was actually caused
> by forcing the access size to 32-bit when the guest OS was using a 16-bit access.
> Since the registers are 16-bit then we can simply set .impl.min_access and
> .impl.max_accessto 2 and then the memory API will automatically do the right thing
> for both 16-bit accesses used by Linux and 32-bit accesses used by the MacOS toolbox
> ROM.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Fixes: 3fe9a838ec ("dp8393x: Always use 32-bit accesses")

There is a 'fixes' tag here but it's unclear what bug is being fixed. I 
think this commit log entry would be more helpful if it mentioned the bug 
that was observed.

> ---
>  hw/net/dp8393x.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/net/dp8393x.c b/hw/net/dp8393x.c
> index 11810c9b60..d16ade2b19 100644
> --- a/hw/net/dp8393x.c
> +++ b/hw/net/dp8393x.c
> @@ -602,15 +602,14 @@ static uint64_t dp8393x_read(void *opaque, hwaddr addr, unsigned int size)
>  
>      trace_dp8393x_read(reg, reg_names[reg], val, size);
>  
> -    return s->big_endian ? val << 16 : val;
> +    return val;
>  }
>  
> -static void dp8393x_write(void *opaque, hwaddr addr, uint64_t data,
> +static void dp8393x_write(void *opaque, hwaddr addr, uint64_t val,
>                            unsigned int size)
>  {
>      dp8393xState *s = opaque;
>      int reg = addr >> s->it_shift;
> -    uint32_t val = s->big_endian ? data >> 16 : data;
>  
>      trace_dp8393x_write(reg, reg_names[reg], val, size);
>  
> @@ -694,8 +693,8 @@ static void dp8393x_write(void *opaque, hwaddr addr, uint64_t data,
>  static const MemoryRegionOps dp8393x_ops = {
>      .read = dp8393x_read,
>      .write = dp8393x_write,
> -    .impl.min_access_size = 4,
> -    .impl.max_access_size = 4,
> +    .impl.min_access_size = 2,
> +    .impl.max_access_size = 2,
>      .endianness = DEVICE_NATIVE_ENDIAN,
>  };
>  
> 

Again, this patch breaks my Linux/mipsel guest. Perhaps you did not 
receive my message about that regression? It did make it into the list 
archives... 
https://lore.kernel.org/qemu-devel/20210703141947.352295-1-f4bug@amsat.org/T/#m8ef6d91fd8e38b01e375083058902342970b8833

