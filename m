Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C793BE018
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 02:11:14 +0200 (CEST)
Received: from localhost ([::1]:53862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0v9l-0007ui-AT
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 20:11:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fthain@linux-m68k.org>)
 id 1m0uqw-0005fo-Af
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 19:51:47 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:54119)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fthain@linux-m68k.org>)
 id 1m0uqu-0006ox-29
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 19:51:46 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 3D15F5C0045;
 Tue,  6 Jul 2021 19:51:42 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 06 Jul 2021 19:51:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=pCtfT/
 HwgRbJTW90WfFGasDklQ3t+TXTkgWMEOsJvO4=; b=Jh9ZhF2WmQoU3c70x7x/Mm
 WKxMJkQ9IDliIA9ScM8eMgcSjayYgiR30hYHlN2mSijQAvxodnHn/gFhxGn7p9tM
 3YayzCj2kzsi4olx2zl+v4mnh5WxDxpafbeTKT3zXOwa9a5xjjdDKh4Dryoo688N
 Bh8juFMsIQ9htVItMl2tsh7JjpfGHy6+d0ljZcG0gp4ijw2W0V8zCTfS9+VH4/A7
 dco8HtO/8S50HN4sY6M9+pxz9ws+uAE2qZMR0/JhV8RzOopQT51oLojbFmAB9kls
 DeClJGheZn2bbuFwiHdKbVOB+hhjaHk476ee9P/MY99aXJYW6hVP11MZEL8iMxew
 ==
X-ME-Sender: <xms:jezkYHcUomF8zSFLAfjdlbU3NrH3qISnj0iiHLJopufmKQOQIIZ15w>
 <xme:jezkYNO8D4iiByPq5UgyXTbrV8r7LDGt3kQO_6ajZLrPfhpqSdNswo3V0M-8UYNRq
 6jUWTqY-t_NF5VcLzo>
X-ME-Received: <xmr:jezkYAhQPRYZIMp8mNOHtuG_h1WtgxyerPI1V7pH08cJXyOiszGdzBNqXjzcl6MABahdN69AE1BgvlSrcleKfQPaOS86GGbS4kE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrtddugddukecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvufgjkfhfgggtsehttdertddttddvnecuhfhrohhmpefhihhnnhcuvfhh
 rghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrghtth
 gvrhhnpeffudfhgeefvdeitedugfelueegheekkeefveffhfeiveetledvhfdtveffteeu
 udenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehfth
 hhrghinheslhhinhhugidqmheikehkrdhorhhg
X-ME-Proxy: <xmx:jezkYI-vRYrVz51Br4p3EDEraygUky345MGI0jnWxcHQ13MZ64ZhSQ>
 <xmx:jezkYDv-fZHyPYI3ogDLYWxK132meH3zeqfgmyf9boRyTkV4kCJf7g>
 <xmx:jezkYHHdWC5TrcsyW2Oqv8aa7jFkUasrfXEsqvmIXi5CQn8B6R1q1A>
 <xmx:juzkYM53diKsyu7rMrdYKVoPCmjUjSj6cHkiKWaQtLOE-PG-7CbegQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 6 Jul 2021 19:51:38 -0400 (EDT)
Date: Wed, 7 Jul 2021 09:51:36 +1000 (AEST)
From: Finn Thain <fthain@linux-m68k.org>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH 1/4] dp8393x: don't force 32-bit register access
In-Reply-To: <20210705214929.17222-2-mark.cave-ayland@ilande.co.uk>
Message-ID: <49104070-ee40-3bcf-f043-225f247a1de7@linux-m68k.org>
References: <20210705214929.17222-1-mark.cave-ayland@ilande.co.uk>
 <20210705214929.17222-2-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: none client-ip=66.111.4.26; envelope-from=fthain@linux-m68k.org;
 helo=out2-smtp.messagingengine.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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

On Mon, 5 Jul 2021, Mark Cave-Ayland wrote:

> Commit 3fe9a838ec "dp8393x: Always use 32-bit accesses" set .impl.min_access_size
> and .impl.max_access_size to 4 to try and fix the Linux jazzsonic driver which uses
> 32-bit accesses.
> 
> The problem with forcing the register access to 32-bit in this way is that since the
> dp8393x uses 16-bit registers, a manual endian swap is required for devices on big
> endian machines with 32-bit accesses.
> 
> For both access sizes and machine endians the QEMU memory API can do the right thing
> automatically: all that is needed is to set .impl.min_access_size to 2 to declare that
> the dp8393x implements 16-bit registers.
> 
> Normally .impl.max_access_size should also be set to 2, however that doesn't quite
> work in this case since the register stride is specified using a (dynamic) it_shift
> property which is applied during the MMIO access itself. The effect of this is that
> for a 32-bit access the memory API performs 2 x 16-bit accesses, but the use of
> it_shift within the MMIO access itself causes the register value to be repeated in both
> the top 16-bits and bottom 16-bits. The Linux jazzsonic driver expects the stride to be
> zero-extended up to access size and therefore fails to correctly detect the dp8393x
> device due to the extra data in the top 16-bits.
> 
> The solution here is to remove .impl.max_access_size so that the memory API will
> correctly zero-extend the 16-bit registers to the access size up to and including
> it_shift. Since it_shift is never greater than 2 than this will always do the right
> thing for both 16-bit and 32-bit accesses regardless of the machine endian, allowing
> the manual endian swap code to be removed.
> 

IIUC, this patch replaces an explicit word swap with an implicit byte 
swap. The explicit word swap was conditional on the big_endian flag.

This flag seems to work like the chip's BMODE pin which switches between 
Intel and Motorola bus modes (not just byte ordering but bus signalling in 
general). The BMODE pin or big_endian flag should effect a byte swap not a 
word swap so there must be a bug though it's not clear how that manifests.

Regardless of this patch, the big_endian flag also controls byte swapping 
during DMA by the device. IIUC, the flag is set to indicate that RAM is 
big_endian, so it's not actually a property of the dp8393x but of the 
RAM...

The Magnum hardware can run in big endian or little endian mode. But the 
SONIC chip must remain in little endian mode always because asserting 
BMODE would invoke Motorola signalling and that would contradict 
Philippe's datasheet which says that the SONIC device is attached to an 
"i386 compatible bus".

This seems contrary to mips_jazz_init(), which sets the dp8393x big_endian 
flag whenever TARGET_WORDS_BIGENDIAN is defined, i.e. risc/os guest. 

QEMU's dp8393x device has native endianness, so perhaps a big endian guest 
or a big endian host could trigger the bug that's being addressed in this 
patch.

Anyway, I think that this patch is heading in the right direction but 
can't it go further? Shouldn't the big_endian flag disappear altogether so 
that the memory API can also take care of the byte swapping needed by 
dp8393x_get() and dp8393x_put() for DMA?

> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Fixes: 3fe9a838ec ("dp8393x: Always use 32-bit accesses")
> ---
>  hw/net/dp8393x.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/net/dp8393x.c b/hw/net/dp8393x.c
> index 11810c9b60..44a1955015 100644
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
> @@ -691,11 +690,16 @@ static void dp8393x_write(void *opaque, hwaddr addr, uint64_t data,
>      }
>  }
>  
> +/*
> + * Since .impl.max_access_size is effectively controlled by the it_shift
> + * property, leave it unspecified for now to allow the memory API to
> + * correctly zero extend the 16-bit register values to the access size up to and
> + * including it_shift.
> + */
>  static const MemoryRegionOps dp8393x_ops = {
>      .read = dp8393x_read,
>      .write = dp8393x_write,
> -    .impl.min_access_size = 4,
> -    .impl.max_access_size = 4,
> +    .impl.min_access_size = 2,
>      .endianness = DEVICE_NATIVE_ENDIAN,
>  };
>  
> 

