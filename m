Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E10D626622
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Nov 2022 02:03:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otevP-0002xK-VO; Fri, 11 Nov 2022 20:03:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1otevJ-0002x1-6b
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 20:03:08 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1otevD-0004Q7-Ju
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 20:03:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1bZmVWaZfi9HVw4SqnEF432tOGGgBp/iRJEfYIx8K9E=; b=dxWq0UyvQB5qbIzY+AQ1umq8TZ
 T7ob6KaM0cUeI6RWl3OBBoiAoX3dIlRPZ2ZiqPafLLkjOSsBW73qzAHC8zteMeogGkk1CiHVVTcQw
 4HEx1Rd6I5i48MugJ6ZnmpbILNDUU+PsrRE1UaNo08hf3QjJ+jio/zT2B3OQY7qdM3ny9zJZTAz7a
 XTi3jttBrYrxRJDjXe7zJbTO4/2aY3esH8Gny9c9LqluME/OdysIIq6TFZjANsQixy2scqx5aIIRE
 dcJqwzitFz0DIB7Fs9qjBaTWF83II9sN6zp/sHIXaQb8uKmtpAzT22C2KFACCnXTl3VqVtNV+2xjg
 hJX21pc4l5BxUe3sGfO9H8JllZ4Z+RrKMtUJRc2hAnGi9MBr7MCGDBiFy1DThkOhxEEZ5VYwbmoFx
 pvID1mkCh8BvLnIezCzMx+vlzkE54SGKEQv8J/cmhlWYaKrm5+A/8RNeGMTD38RgPNaJh4azhZu0j
 2k3CEWt8/hvCKUak5hEC7TUHzoNS+S6VR37b5DWqxX10AmEEROKg9jhKIMHEK07J73GBBB3vtDiFs
 clmlJU7hRKtsbV/NMbbHLYOMKiDVyBCY4tI6yWKDqxt0y4hNJiWimJMhkdRTQawt8jd894KiqwIhN
 IaIpx1MTuJxvHGVB9SNusrPULU1wpioeKfggQ69Mo=;
Received: from [2a00:23c4:8ba9:3700:6d79:9193:91dc:35ee]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1otev3-00013o-VM; Sat, 12 Nov 2022 01:02:54 +0000
Message-ID: <ffa6316c-ad87-eac5-ad13-92dd42492fb9@ilande.co.uk>
Date: Sat, 12 Nov 2022 01:02:52 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: f4bug@amsat.org, Artyom Tarasenko <atar4qemu@gmail.com>
References: <20221111182535.64844-1-alex.bennee@linaro.org>
 <20221111182535.64844-12-alex.bennee@linaro.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20221111182535.64844-12-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba9:3700:6d79:9193:91dc:35ee
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v5 11/20] target/sparc: initialise MemTxAttrs for CPU
 access
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 11/11/2022 18:25, Alex Bennée wrote:

> Both of the TLB fill functions and the cpu_sparc_get_phys_page deal
> with CPU based access. Use the new MEMTXATTRS_CPU constructor to
> ensure the correct CPU id is filled in should it ever be needed by any
> devices later.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   target/sparc/mmu_helper.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/target/sparc/mmu_helper.c b/target/sparc/mmu_helper.c
> index 919448a494..eeb52b5ee6 100644
> --- a/target/sparc/mmu_helper.c
> +++ b/target/sparc/mmu_helper.c
> @@ -212,7 +212,7 @@ bool sparc_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>       target_ulong vaddr;
>       target_ulong page_size;
>       int error_code = 0, prot, access_index;
> -    MemTxAttrs attrs = {};
> +    MemTxAttrs attrs = MEMTXATTRS_CPU(cs);
>   
>       /*
>        * TODO: If we ever need tlb_vaddr_to_host for this target,
> @@ -771,7 +771,7 @@ bool sparc_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>       target_ulong vaddr;
>       hwaddr paddr;
>       target_ulong page_size;
> -    MemTxAttrs attrs = {};
> +    MemTxAttrs attrs = MEMTXATTRS_CPU(cs);
>       int error_code = 0, prot, access_index;
>   
>       address &= TARGET_PAGE_MASK;
> @@ -890,7 +890,7 @@ static int cpu_sparc_get_phys_page(CPUSPARCState *env, hwaddr *phys,
>   {
>       target_ulong page_size;
>       int prot, access_index;
> -    MemTxAttrs attrs = {};
> +    MemTxAttrs attrs = MEMTXATTRS_CPU(env_cpu(env));
>   
>       return get_physical_address(env, phys, &prot, &access_index, &attrs, addr,
>                                   rw, mmu_idx, &page_size);

Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


ATB,

Mark.

