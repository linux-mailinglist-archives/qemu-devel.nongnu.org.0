Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A3D53E4E7
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jun 2022 15:56:00 +0200 (CEST)
Received: from localhost ([::1]:45180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyDD5-0006JO-64
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 09:55:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nyD8m-0002cU-AO; Mon, 06 Jun 2022 09:51:32 -0400
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b]:34434)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nyD8j-0008Lz-Pv; Mon, 06 Jun 2022 09:51:31 -0400
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-f314077115so19234972fac.1; 
 Mon, 06 Jun 2022 06:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=zcxdthdbBdVYcdtAojVMwNxpHliSrjFPnYVzJ6Sm7wU=;
 b=XqzIFnzFkrfk1ZqWHCkLLfcSNFnj5aYtPoVKZlQc2FgmnZJycuBbb2N1Ejdd01cNWx
 hGKadSujyrv+BpsL4UhUWmj7wdRnyHlpFlTHeI1ebpTMWYUD6LzwKDFec+T/Erwhp0+e
 v2MlLogHBKFfgXbe838HxCbTuzmgNZxt/GMoH2wj+JfGIiHxUApFlGFQZKzQrIyJprxz
 iORJe9g7Zf3LhLvIxSvA3+jXJ0lFjveqEb8PmQJ1rIj63pmndUBh4jrOCTXm1weuG/iK
 bmtoIEryluRq7mMsclwLl9m+73rqT7W+ivVTk7XkY/3R0SyYUG9o25o6LzY2IOkGiC6+
 b24w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=zcxdthdbBdVYcdtAojVMwNxpHliSrjFPnYVzJ6Sm7wU=;
 b=dKdd7Do9Dm2AhqboUntQAMtc1/+Gu4T0lgyl2Li9BeeCVIi43tIniz3zgsEM8akVR3
 MgnrBc6qEIIY6bQTW38Bk4nMHg80xDoMUXSA6oLauw7lb/JC3VpNxHcIbYMJQQlRldlB
 te23kLbXM3DW4ORDBkzO/zoHM8DcEznrl+EyaCoEq+8IoBFQpxFYsa4aDU2Tg8VDJoD0
 NtAD7KFnSkygMvJMMNDdtaHLjU3DLX0TfWjsHBeYRDvgxXD87/AoOTKKm+3hkJQQOD9m
 FzYkfapFq5XRpiBaIxl/XN9HJ6VyPmycosmqqelphuLq8xKbXOMWqtpFUU89lEJqAfcK
 Uy/Q==
X-Gm-Message-State: AOAM5301ZeoUPg7waOBOR8mz2LJ6M9C6NNfvDMiTRRgqy5vGE9KbxpMl
 o7k8sQNkkZQ6kZpx7Cgzjl4=
X-Google-Smtp-Source: ABdhPJxy2P8PEH+tM7hMx3dLICBt2Z0ya08uHZ96XT34CHb0FKiAyTjxy6N3yof1zEuWvw67hxRbFg==
X-Received: by 2002:a05:6870:1601:b0:f2:5431:f116 with SMTP id
 b1-20020a056870160100b000f25431f116mr30586325oae.65.1654523486217; 
 Mon, 06 Jun 2022 06:51:26 -0700 (PDT)
Received: from [192.168.10.102] ([177.45.165.74])
 by smtp.gmail.com with ESMTPSA id
 e25-20020a056808111900b0032e73b538dasm2874407oih.52.2022.06.06.06.51.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jun 2022 06:51:25 -0700 (PDT)
Message-ID: <331f671a-a75d-741a-a42b-9571d7dc70cc@gmail.com>
Date: Mon, 6 Jun 2022 10:51:23 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] ppc: fix boot with sam460ex
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org
Cc: BALATON Zoltan <balaton@eik.bme.hu>, qemu-ppc@nongnu.org
References: <20220526224229.95183-1-mst@redhat.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220526224229.95183-1-mst@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::2b;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Michael,


I'll queue this patch with the commit msg proposed by Zoltan as follows:


Author: Michael S. Tsirkin <mst@redhat.com>
Date:   Thu May 26 18:43:43 2022 -0400

     ppc: fix boot with sam460ex
     
     Recent changes to pcie_host corrected size of its internal region to
     match what it expects: only the low 28 bits are ever decoded. Previous
     code just ignored bit 29 (if size was 1 << 29) in the address which does
     not make much sense.  We are now asserting on size > 1 << 28 instead,
     but PPC 4xx actually allows guest to configure different sizes, and some
     firmwares seem to set it to 1 << 29.
     
     This caused e.g. qemu-system-ppc -M sam460ex to exit with an assert when
     the guest writes a value to CFGMSK register when trying to map config
     space. This is done in the board firmware in ppc4xx_init_pcie_port() in
     roms/u-boot-sam460ex/arch/powerpc/cpu/ppc4xx/4xx_pcie.c
     
     It's not clear what the proper fix should be but for now let's force the
     size to 256MB, so anything outside the expected address range is
     ignored.
     


Is that ok with you?


Thanks,


Daniel


On 5/26/22 19:43, Michael S. Tsirkin wrote:
> Recent changes to pcie_host corrected size of its internal region to
> match what it expects - only the low 28 bits are ever decoded. Previous
> code just ignored bit 29 (if size was 1 << 29) in the address which does
> not make much sense.  We are now asserting on size > 1 << 28 instead,
> but it so happened that ppc actually allows guest to configure as large
> a size as it wants to, and current firmware set it to 1 << 29.
> 
> With just qemu-system-ppc -M sam460ex this triggers an assert which
> seems to happen when the guest (board firmware?) writes a value to
> CFGMSK reg:
> 
> (gdb) bt
> 
> This is done in the board firmware here:
> 
> https://git.qemu.org/?p=u-boot-sam460ex.git;a=blob;f=arch/powerpc/cpu/ppc4xx/4xx_pcie.c;h=13348be93dccc74c13ea043d6635a7f8ece4b5f0;hb=HEAD
> 
> when trying to map config space.
> 
> Note that what firmware does matches
> https://www.hardware.com.br/comunidade/switch-cisco/1128380/
> 
> So it's not clear what the proper fix should be.
> 
> However, allowing guest to trigger an assert in qemu is not good practice anyway.
> 
> For now let's just force the mask to 256MB on guest write, this way
> anything outside the expected address range is ignored.
> 
> Fixes: commit 1f1a7b2269 ("include/hw/pci/pcie_host: Correct PCIE_MMCFG_SIZE_MAX")
> Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>
> Tested-by: BALATON Zoltan <balaton@eik.bme.hu>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> ---
> 
> Affected system is orphan so I guess I will merge the patch unless
> someone objects.
> 
>   hw/ppc/ppc440_uc.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/hw/ppc/ppc440_uc.c b/hw/ppc/ppc440_uc.c
> index 993e3ba955..a1ecf6dd1c 100644
> --- a/hw/ppc/ppc440_uc.c
> +++ b/hw/ppc/ppc440_uc.c
> @@ -1180,6 +1180,14 @@ static void dcr_write_pcie(void *opaque, int dcrn, uint32_t val)
>       case PEGPL_CFGMSK:
>           s->cfg_mask = val;
>           size = ~(val & 0xfffffffe) + 1;
> +        /*
> +         * Firmware sets this register to E0000001. Why we are not sure,
> +         * but the current guess is anything above PCIE_MMCFG_SIZE_MAX is
> +         * ignored.
> +         */
> +        if (size > PCIE_MMCFG_SIZE_MAX) {
> +            size = PCIE_MMCFG_SIZE_MAX;
> +        }
>           pcie_host_mmcfg_update(PCIE_HOST_BRIDGE(s), val & 1, s->cfg_base, size);
>           break;
>       case PEGPL_MSGBAH:

