Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC412F4549
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 08:37:16 +0100 (CET)
Received: from localhost ([::1]:57002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzaiR-0007qQ-GA
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 02:37:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kzaMh-0007Um-7z
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 02:14:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kzaMd-00042V-1b
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 02:14:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610522082;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9VD82qPsvcWIAHc+SJHx4nRPUkevViEj0gqG97O6wik=;
 b=g2lEMplftfASrKvEraKZ5EGrRlpPbTX4Wi6mXCbUcjxRXLbpVESI5qIvN4elD5F/Go01Gx
 0O53JzbFSfXQ+EwLvJEg1SjPWwLjB9FXJoXzqQ1YjrHOY1HWq2yiEOoP2QV02TcYbmR8nr
 extIGFljvz1gy0O3LCsP64nWn5SMZoc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-263-qfcBkt8DNMyXiHzS-8zmaA-1; Wed, 13 Jan 2021 02:14:38 -0500
X-MC-Unique: qfcBkt8DNMyXiHzS-8zmaA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B5CE48066E1;
 Wed, 13 Jan 2021 07:14:36 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-122.ams2.redhat.com [10.36.112.122])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9F39E5C276;
 Wed, 13 Jan 2021 07:14:29 +0000 (UTC)
Subject: Re: [PATCH 5/9] elf2dmp: Rename PAGE_SIZE to ELF2DMP_PAGE_SIZE
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-devel@nongnu.org,
 QEMU Trivial <qemu-trivial@nongnu.org>
References: <20201221005318.11866-1-jiaxun.yang@flygoat.com>
 <20201221005318.11866-6-jiaxun.yang@flygoat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <775cdc44-99ca-d195-4eb6-6873872ed2ed@redhat.com>
Date: Wed, 13 Jan 2021 08:14:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201221005318.11866-6-jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
>   contrib/elf2dmp/addrspace.c |  4 ++--
>   contrib/elf2dmp/addrspace.h |  6 +++---
>   contrib/elf2dmp/main.c      | 18 +++++++++---------
>   3 files changed, 14 insertions(+), 14 deletions(-)
> 
> diff --git a/contrib/elf2dmp/addrspace.c b/contrib/elf2dmp/addrspace.c
> index 8a76069cb5..53ded17061 100644
> --- a/contrib/elf2dmp/addrspace.c
> +++ b/contrib/elf2dmp/addrspace.c
> @@ -207,8 +207,8 @@ int va_space_rw(struct va_space *vs, uint64_t addr,
>           void *buf, size_t size, int is_write)
>   {
>       while (size) {
> -        uint64_t page = addr & PFN_MASK;
> -        size_t s = (page + PAGE_SIZE) - addr;
> +        uint64_t page = addr & ELF2DMP_PFN_MASK;
> +        size_t s = (page + ELF2DMP_PAGE_SIZE) - addr;
>           void *ptr;
>   
>           s = (s > size) ? size : s;
> diff --git a/contrib/elf2dmp/addrspace.h b/contrib/elf2dmp/addrspace.h
> index d87f6a18c6..00b44c1218 100644
> --- a/contrib/elf2dmp/addrspace.h
> +++ b/contrib/elf2dmp/addrspace.h
> @@ -10,9 +10,9 @@
>   
>   #include "qemu_elf.h"
>   
> -#define PAGE_BITS 12
> -#define PAGE_SIZE (1ULL << PAGE_BITS)
> -#define PFN_MASK (~(PAGE_SIZE - 1))
> +#define ELF2DMP_PAGE_BITS 12
> +#define ELF2DMP_PAGE_SIZE (1ULL << ELF2DMP_PAGE_BITS)
> +#define ELF2DMP_PFN_MASK (~(ELF2DMP_PAGE_SIZE - 1))
>   
>   #define INVALID_PA  UINT64_MAX
>   
> diff --git a/contrib/elf2dmp/main.c b/contrib/elf2dmp/main.c
> index ac746e49e0..20b477d582 100644
> --- a/contrib/elf2dmp/main.c
> +++ b/contrib/elf2dmp/main.c
> @@ -244,8 +244,8 @@ static int fill_header(WinDumpHeader64 *hdr, struct pa_space *ps,
>       WinDumpHeader64 h;
>       size_t i;
>   
> -    QEMU_BUILD_BUG_ON(KUSD_OFFSET_SUITE_MASK >= PAGE_SIZE);
> -    QEMU_BUILD_BUG_ON(KUSD_OFFSET_PRODUCT_TYPE >= PAGE_SIZE);
> +    QEMU_BUILD_BUG_ON(KUSD_OFFSET_SUITE_MASK >= ELF2DMP_PAGE_SIZE);
> +    QEMU_BUILD_BUG_ON(KUSD_OFFSET_PRODUCT_TYPE >= ELF2DMP_PAGE_SIZE);
>   
>       if (!suite_mask || !product_type) {
>           return 1;
> @@ -281,14 +281,14 @@ static int fill_header(WinDumpHeader64 *hdr, struct pa_space *ps,
>       };
>   
>       for (i = 0; i < ps->block_nr; i++) {
> -        h.PhysicalMemoryBlock.NumberOfPages += ps->block[i].size / PAGE_SIZE;
> +        h.PhysicalMemoryBlock.NumberOfPages += ps->block[i].size / ELF2DMP_PAGE_SIZE;
>           h.PhysicalMemoryBlock.Run[i] = (WinDumpPhyMemRun64) {
> -            .BasePage = ps->block[i].paddr / PAGE_SIZE,
> -            .PageCount = ps->block[i].size / PAGE_SIZE,
> +            .BasePage = ps->block[i].paddr / ELF2DMP_PAGE_SIZE,
> +            .PageCount = ps->block[i].size / ELF2DMP_PAGE_SIZE,
>           };
>       }
>   
> -    h.RequiredDumpSpace += h.PhysicalMemoryBlock.NumberOfPages << PAGE_BITS;
> +    h.RequiredDumpSpace += h.PhysicalMemoryBlock.NumberOfPages << ELF2DMP_PAGE_BITS;
>   
>       *hdr = h;
>   
> @@ -379,7 +379,7 @@ static int pe_get_pdb_symstore_hash(uint64_t base, void *start_addr,
>       size_t pdb_name_sz;
>       size_t i;
>   
> -    QEMU_BUILD_BUG_ON(sizeof(*dos_hdr) >= PAGE_SIZE);
> +    QEMU_BUILD_BUG_ON(sizeof(*dos_hdr) >= ELF2DMP_PAGE_SIZE);
>   
>       if (memcmp(&dos_hdr->e_magic, e_magic, sizeof(e_magic))) {
>           return 1;
> @@ -509,10 +509,10 @@ int main(int argc, char *argv[])
>       }
>       printf("CPU #0 IDT[0] -> 0x%016"PRIx64"\n", idt_desc_addr(first_idt_desc));
>   
> -    KernBase = idt_desc_addr(first_idt_desc) & ~(PAGE_SIZE - 1);
> +    KernBase = idt_desc_addr(first_idt_desc) & ~(ELF2DMP_PAGE_SIZE - 1);
>       printf("Searching kernel downwards from 0x%016"PRIx64"...\n", KernBase);
>   
> -    for (; KernBase >= 0xfffff78000000000; KernBase -= PAGE_SIZE) {
> +    for (; KernBase >= 0xfffff78000000000; KernBase -= ELF2DMP_PAGE_SIZE) {
>           nt_start_addr = va_space_resolve(&vs, KernBase);
>           if (!nt_start_addr) {
>               continue;
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


