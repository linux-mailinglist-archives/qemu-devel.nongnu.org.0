Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B857A2F457D
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 08:46:58 +0100 (CET)
Received: from localhost ([::1]:42364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzarp-000648-Ps
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 02:46:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kzaOg-0000vr-UZ
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 02:16:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kzaOW-0004wj-0A
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 02:16:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610522197;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5QI01U/Sn8jXYFcypzrx+Uzp6GT1H5HkA3ClrziD+zM=;
 b=HrDBXAVVdsWewdTHmwan4BO6fQlHm/DYZZH3tAV6Q2BlPGFajSul3r2LHVcHrpbw9TK572
 LsQ+L9s5zA5dWDIu1Ic7Y4w7jk8rHk9Eqq0SNkQU2MdJyntr+9C/RGZupkMUfivbMrZJpK
 mcYoJS4RvKWxvU9pBfaIMlFsDoj8qhU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-295-0RApVqFLMyOb6O_2KK5x_A-1; Wed, 13 Jan 2021 02:16:35 -0500
X-MC-Unique: 0RApVqFLMyOb6O_2KK5x_A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A6ED2425C8;
 Wed, 13 Jan 2021 07:16:33 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-122.ams2.redhat.com [10.36.112.122])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B653A5D9DC;
 Wed, 13 Jan 2021 07:16:26 +0000 (UTC)
Subject: Re: [PATCH 6/9] hw/block/nand: Rename PAGE_SIZE to NAND_PAGE_SIZE
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-devel@nongnu.org,
 QEMU Trivial <qemu-trivial@nongnu.org>
References: <20201221005318.11866-1-jiaxun.yang@flygoat.com>
 <20201221005318.11866-7-jiaxun.yang@flygoat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <72cf8a20-e379-53c4-de76-a31002746ac5@redhat.com>
Date: Wed, 13 Jan 2021 08:16:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201221005318.11866-7-jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 kvm@vger.kernel.org, Viktor Prutyanov <viktor.prutyanov@phystech.edu>,
 Laurent Vivier <lvivier@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Alistair Francis <alistair@alistair23.me>, Greg Kurz <groug@kaod.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21/12/2020 01.53, Jiaxun Yang wrote:
> As per POSIX specification of limits.h [1], OS libc may define
> PAGE_SIZE in limits.h.
> 
> To prevent collosion of definition, we rename PAGE_SIZE here.
> 
> [1]: https://pubs.opengroup.org/onlinepubs/7908799/xsh/limits.h.html
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>   hw/block/nand.c | 40 ++++++++++++++++++++--------------------
>   1 file changed, 20 insertions(+), 20 deletions(-)
> 
> diff --git a/hw/block/nand.c b/hw/block/nand.c
> index 1d7a48a2ec..17645667d8 100644
> --- a/hw/block/nand.c
> +++ b/hw/block/nand.c
> @@ -114,24 +114,24 @@ static void mem_and(uint8_t *dest, const uint8_t *src, size_t n)
>   # define NAND_IO
>   
>   # define PAGE(addr)		((addr) >> ADDR_SHIFT)
> -# define PAGE_START(page)	(PAGE(page) * (PAGE_SIZE + OOB_SIZE))
> +# define PAGE_START(page)	(PAGE(page) * (NAND_PAGE_SIZE + OOB_SIZE))
>   # define PAGE_MASK		((1 << ADDR_SHIFT) - 1)
>   # define OOB_SHIFT		(PAGE_SHIFT - 5)
>   # define OOB_SIZE		(1 << OOB_SHIFT)
>   # define SECTOR(addr)		((addr) >> (9 + ADDR_SHIFT - PAGE_SHIFT))
>   # define SECTOR_OFFSET(addr)	((addr) & ((511 >> PAGE_SHIFT) << 8))
>   
> -# define PAGE_SIZE		256
> +# define NAND_PAGE_SIZE     256
>   # define PAGE_SHIFT		8
>   # define PAGE_SECTORS		1
>   # define ADDR_SHIFT		8
>   # include "nand.c"
> -# define PAGE_SIZE		512
> +# define NAND_PAGE_SIZE     512
>   # define PAGE_SHIFT		9
>   # define PAGE_SECTORS		1
>   # define ADDR_SHIFT		8
>   # include "nand.c"
> -# define PAGE_SIZE		2048
> +# define NAND_PAGE_SIZE		2048
>   # define PAGE_SHIFT		11
>   # define PAGE_SECTORS		4
>   # define ADDR_SHIFT		16
> @@ -661,7 +661,7 @@ type_init(nand_register_types)
>   #else
>   
>   /* Program a single page */
> -static void glue(nand_blk_write_, PAGE_SIZE)(NANDFlashState *s)
> +static void glue(nand_blk_write_, NAND_PAGE_SIZE)(NANDFlashState *s)
>   {
>       uint64_t off, page, sector, soff;
>       uint8_t iobuf[(PAGE_SECTORS + 2) * 0x200];
> @@ -681,11 +681,11 @@ static void glue(nand_blk_write_, PAGE_SIZE)(NANDFlashState *s)
>               return;
>           }
>   
> -        mem_and(iobuf + (soff | off), s->io, MIN(s->iolen, PAGE_SIZE - off));
> -        if (off + s->iolen > PAGE_SIZE) {
> +        mem_and(iobuf + (soff | off), s->io, MIN(s->iolen, NAND_PAGE_SIZE - off));
> +        if (off + s->iolen > NAND_PAGE_SIZE) {
>               page = PAGE(s->addr);
> -            mem_and(s->storage + (page << OOB_SHIFT), s->io + PAGE_SIZE - off,
> -                            MIN(OOB_SIZE, off + s->iolen - PAGE_SIZE));
> +            mem_and(s->storage + (page << OOB_SHIFT), s->io + NAND_PAGE_SIZE - off,
> +                            MIN(OOB_SIZE, off + s->iolen - NAND_PAGE_SIZE));
>           }
>   
>           if (blk_pwrite(s->blk, sector << BDRV_SECTOR_BITS, iobuf,
> @@ -713,7 +713,7 @@ static void glue(nand_blk_write_, PAGE_SIZE)(NANDFlashState *s)
>   }
>   
>   /* Erase a single block */
> -static void glue(nand_blk_erase_, PAGE_SIZE)(NANDFlashState *s)
> +static void glue(nand_blk_erase_, NAND_PAGE_SIZE)(NANDFlashState *s)
>   {
>       uint64_t i, page, addr;
>       uint8_t iobuf[0x200] = { [0 ... 0x1ff] = 0xff, };
> @@ -725,7 +725,7 @@ static void glue(nand_blk_erase_, PAGE_SIZE)(NANDFlashState *s)
>   
>       if (!s->blk) {
>           memset(s->storage + PAGE_START(addr),
> -                        0xff, (PAGE_SIZE + OOB_SIZE) << s->erase_shift);
> +                        0xff, (NAND_PAGE_SIZE + OOB_SIZE) << s->erase_shift);
>       } else if (s->mem_oob) {
>           memset(s->storage + (PAGE(addr) << OOB_SHIFT),
>                           0xff, OOB_SIZE << s->erase_shift);
> @@ -751,7 +751,7 @@ static void glue(nand_blk_erase_, PAGE_SIZE)(NANDFlashState *s)
>   
>           memset(iobuf, 0xff, 0x200);
>           i = (addr & ~0x1ff) + 0x200;
> -        for (addr += ((PAGE_SIZE + OOB_SIZE) << s->erase_shift) - 0x200;
> +        for (addr += ((NAND_PAGE_SIZE + OOB_SIZE) << s->erase_shift) - 0x200;
>                           i < addr; i += 0x200) {
>               if (blk_pwrite(s->blk, i, iobuf, BDRV_SECTOR_SIZE, 0) < 0) {
>                   printf("%s: write error in sector %" PRIu64 "\n",
> @@ -772,7 +772,7 @@ static void glue(nand_blk_erase_, PAGE_SIZE)(NANDFlashState *s)
>       }
>   }
>   
> -static void glue(nand_blk_load_, PAGE_SIZE)(NANDFlashState *s,
> +static void glue(nand_blk_load_, NAND_PAGE_SIZE)(NANDFlashState *s,
>                   uint64_t addr, int offset)
>   {
>       if (PAGE(addr) >= s->pages) {
> @@ -786,7 +786,7 @@ static void glue(nand_blk_load_, PAGE_SIZE)(NANDFlashState *s,
>                   printf("%s: read error in sector %" PRIu64 "\n",
>                                   __func__, SECTOR(addr));
>               }
> -            memcpy(s->io + SECTOR_OFFSET(s->addr) + PAGE_SIZE,
> +            memcpy(s->io + SECTOR_OFFSET(s->addr) + NAND_PAGE_SIZE,
>                               s->storage + (PAGE(s->addr) << OOB_SHIFT),
>                               OOB_SIZE);
>               s->ioaddr = s->io + SECTOR_OFFSET(s->addr) + offset;
> @@ -800,23 +800,23 @@ static void glue(nand_blk_load_, PAGE_SIZE)(NANDFlashState *s,
>           }
>       } else {
>           memcpy(s->io, s->storage + PAGE_START(s->addr) +
> -                        offset, PAGE_SIZE + OOB_SIZE - offset);
> +                        offset, NAND_PAGE_SIZE + OOB_SIZE - offset);
>           s->ioaddr = s->io;
>       }
>   }
>   
> -static void glue(nand_init_, PAGE_SIZE)(NANDFlashState *s)
> +static void glue(nand_init_, NAND_PAGE_SIZE)(NANDFlashState *s)
>   {
>       s->oob_shift = PAGE_SHIFT - 5;
>       s->pages = s->size >> PAGE_SHIFT;
>       s->addr_shift = ADDR_SHIFT;
>   
> -    s->blk_erase = glue(nand_blk_erase_, PAGE_SIZE);
> -    s->blk_write = glue(nand_blk_write_, PAGE_SIZE);
> -    s->blk_load = glue(nand_blk_load_, PAGE_SIZE);
> +    s->blk_erase = glue(nand_blk_erase_, NAND_PAGE_SIZE);
> +    s->blk_write = glue(nand_blk_write_, NAND_PAGE_SIZE);
> +    s->blk_load = glue(nand_blk_load_, NAND_PAGE_SIZE);
>   }
>   
> -# undef PAGE_SIZE
> +# undef NAND_PAGE_SIZE
>   # undef PAGE_SHIFT
>   # undef PAGE_SECTORS
>   # undef ADDR_SHIFT
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


