Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D14969EA35
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 23:33:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUbCM-0000Rs-6H; Tue, 21 Feb 2023 17:33:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUbCK-0000Rk-Qd
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 17:33:20 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUbCI-0000Ma-Rf
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 17:33:20 -0500
Received: by mail-wr1-x431.google.com with SMTP id t15so6101502wrz.7
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 14:33:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jzhs0wgAM9Jc5NqHZvSxpJb9rIGrF2/O5kKwwX9lr1U=;
 b=WezV8Q6MmLeaia+2khhexvSjqeccd34imelZaGlYrEGVA2LDOYR5pSncsVadiLLaG2
 jR4Y2/yU0Cmb9+PkSAAyfcq0Opr6ZijGc6UZXToQkutC51ZYh2vvNYhyiiLZlyDRdAbU
 hMDhnBS45eWcsV+k0mrfKKQ39DGnb+fmBniciWwyGmz2+0W9GmeOrIi4N023mladC6/t
 oXjElCUJeDiMH9OFpnFjpAunZey5aGMKtnh8lHTweXi8jKo5nkt0aZfsxgAjjrI3lBPZ
 C3+ToVSMF29B8QqJTPed4euWy3amkh9tnMaxKFvjnm1Y+XkCIsAgBHqjJEhULAUeWd5i
 l5iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jzhs0wgAM9Jc5NqHZvSxpJb9rIGrF2/O5kKwwX9lr1U=;
 b=P2fPUh51aidtjpS5awSiemgXu6jRK3qEZM6VmEOaY//CxfHTdFGOMBPxR9I+/nUELJ
 pkXOyIWIO1E7lZu4JnUxL6urW/y7y5vQrBjKX3juE/3f5yMznhLXR/x3VASpulHqwbG4
 z0C/NuI5D7DvNfdcWBlVRGLNq1HC0USkIvu8BxGBrb75oNQGPgpyi+rH8pBHBCjrT5jQ
 k7v5Ab3Z3uSzT5Pcs15h2XYC2SggHctmy2ppbRSYXtK3k5RC+Spxd113M6EUwFTqxUSb
 3wftgQrF/upRMRtjmNvdv5j46RPLd+IMukWLgZY+BngbN/dsCTZs/UwzfZQcsYM1nW0v
 6hRA==
X-Gm-Message-State: AO0yUKUBmMpD8kaTfV3EDcySUhyaz0C05XEIUGRP4utNhBmBAbm80xBW
 e9mvnVURAWJ+ecB3YKokVGCY9w==
X-Google-Smtp-Source: AK7set8//mroLBdJNgQoPmv6dRQWiGcH7Ib+K+B1vVE3/OAtqVCPROXVuP0DB5BEisXoMNAfvXdO8w==
X-Received: by 2002:a5d:4206:0:b0:2c3:ea8b:2724 with SMTP id
 n6-20020a5d4206000000b002c3ea8b2724mr5847066wrq.21.1677018796636; 
 Tue, 21 Feb 2023 14:33:16 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 g4-20020a056000118400b002c5544b3a69sm2567368wrx.89.2023.02.21.14.33.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Feb 2023 14:33:16 -0800 (PST)
Message-ID: <d02c267e-ccfb-05c2-6eda-8de21a2793d8@linaro.org>
Date: Tue, 21 Feb 2023 23:33:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v3 2/2] hw/cxl: Multi-Region CXL Type-3 Devices (Volatile
 and Persistent)
Content-Language: en-US
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>, qemu-devel@nongnu.org,
 Michael Tsirkin <mst@redhat.com>
Cc: Ben Widawsky <bwidawsk@kernel.org>, linux-cxl@vger.kernel.org,
 linuxarm@huawei.com, Ira Weiny <ira.weiny@intel.com>,
 Gregory Price <gourry.memverge@gmail.com>,
 Mike Maslenkin <mike.maslenkin@gmail.com>, Dave Jiang
 <dave.jiang@intel.com>,
 "reviewer:Incompatible changes" <libvir-list@redhat.com>
References: <20230221140023.9315-1-Jonathan.Cameron@huawei.com>
 <20230221140023.9315-3-Jonathan.Cameron@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230221140023.9315-3-Jonathan.Cameron@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.095,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 21/2/23 15:00, Jonathan Cameron wrote:
> From: Gregory Price <gourry.memverge@gmail.com>
> 
> This commit enables each CXL Type-3 device to contain one volatile
> memory region and one persistent region.
> 
> Two new properties have been added to cxl-type3 device initialization:
>      [volatile-memdev] and [persistent-memdev]
> 
> The existing [memdev] property has been deprecated and will default the
> memory region to a persistent memory region (although a user may assign
> the region to a ram or file backed region). It cannot be used in
> combination with the new [persistent-memdev] property.
> 
> Partitioning volatile memory from persistent memory is not yet supported.
> 
> Volatile memory is mapped at DPA(0x0), while Persistent memory is mapped
> at DPA(vmem->size), per CXL Spec 8.2.9.8.2.0 - Get Partition Info.
> 
> Signed-off-by: Gregory Price <gregory.price@memverge.com>
> Reviewed-by: Davidlohr Bueso <dave@stgolabs.net>
> Reviewed-by: Fan Ni <fan.ni@samsung.com>
> Tested-by: Fan Ni <fan.ni@samsung.com>
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> 
> ---
> v3:
> - Don't set the DVSEC range register base address
> v2:
> - Fixed an off by one in address space selection.
> - Gather tags.
> ---
>   docs/system/devices/cxl.rst    |  49 ++++--
>   hw/cxl/cxl-mailbox-utils.c     |  26 +--
>   hw/mem/cxl_type3.c             | 294 +++++++++++++++++++++++++--------
>   include/hw/cxl/cxl_device.h    |  11 +-
>   tests/qtest/bios-tables-test.c |   8 +-
>   tests/qtest/cxl-test.c         |  76 +++++++--
>   6 files changed, 353 insertions(+), 111 deletions(-)
> 
> diff --git a/docs/system/devices/cxl.rst b/docs/system/devices/cxl.rst
> index f25783a4ec..89a41cff73 100644
> --- a/docs/system/devices/cxl.rst
> +++ b/docs/system/devices/cxl.rst
> @@ -300,7 +300,7 @@ Example topology involving a switch::
>   
>   Example command lines
>   ---------------------
> -A very simple setup with just one directly attached CXL Type 3 device::
> +A very simple setup with just one directly attached CXL Type 3 Persistent Memory device::
>   
>     qemu-system-aarch64 -M virt,gic-version=3,cxl=on -m 4g,maxmem=8G,slots=8 -cpu max \
>     ...
> @@ -308,7 +308,28 @@ A very simple setup with just one directly attached CXL Type 3 device::
>     -object memory-backend-file,id=cxl-lsa1,share=on,mem-path=/tmp/lsa.raw,size=256M \
>     -device pxb-cxl,bus_nr=12,bus=pcie.0,id=cxl.1 \
>     -device cxl-rp,port=0,bus=cxl.1,id=root_port13,chassis=0,slot=2 \
> -  -device cxl-type3,bus=root_port13,memdev=cxl-mem1,lsa=cxl-lsa1,id=cxl-pmem0 \
> +  -device cxl-type3,bus=root_port13,persistent-memdev=cxl-mem1,lsa=cxl-lsa1,id=cxl-pmem0 \
> +  -M cxl-fmw.0.targets.0=cxl.1,cxl-fmw.0.size=4G
> +
> +A very simple setup with just one directly attached CXL Type 3 Volatile Memory device::
> +
> +  qemu-system-aarch64 -M virt,gic-version=3,cxl=on -m 4g,maxmem=8G,slots=8 -cpu max \
> +  ...
> +  -object memory-backend-ram,id=vmem0,share=on,size=256M \
> +  -device pxb-cxl,bus_nr=12,bus=pcie.0,id=cxl.1 \
> +  -device cxl-rp,port=0,bus=cxl.1,id=root_port13,chassis=0,slot=2 \
> +  -device cxl-type3,bus=root_port13,volatile-memdev=vmem0,id=cxl-vmem0 \
> +  -M cxl-fmw.0.targets.0=cxl.1,cxl-fmw.0.size=4G
> +
> +The same volatile setup may optionally include an LSA region::
> +
> +  qemu-system-aarch64 -M virt,gic-version=3,cxl=on -m 4g,maxmem=8G,slots=8 -cpu max \
> +  ...
> +  -object memory-backend-ram,id=vmem0,share=on,size=256M \
> +  -object memory-backend-file,id=cxl-lsa0,share=on,mem-path=/tmp/lsa.raw,size=256M \
> +  -device pxb-cxl,bus_nr=12,bus=pcie.0,id=cxl.1 \
> +  -device cxl-rp,port=0,bus=cxl.1,id=root_port13,chassis=0,slot=2 \
> +  -device cxl-type3,bus=root_port13,volatile-memdev=vmem0,lsa=cxl-lsa0,id=cxl-vmem0 \
>     -M cxl-fmw.0.targets.0=cxl.1,cxl-fmw.0.size=4G
>   
>   A setup suitable for 4 way interleave. Only one fixed window provided, to enable 2 way
> @@ -328,13 +349,13 @@ the CXL Type3 device directly attached (no switches).::
>     -device pxb-cxl,bus_nr=12,bus=pcie.0,id=cxl.1 \
>     -device pxb-cxl,bus_nr=222,bus=pcie.0,id=cxl.2 \
>     -device cxl-rp,port=0,bus=cxl.1,id=root_port13,chassis=0,slot=2 \
> -  -device cxl-type3,bus=root_port13,memdev=cxl-mem1,lsa=cxl-lsa1,id=cxl-pmem0 \
> +  -device cxl-type3,bus=root_port13,persistent-memdev=cxl-mem1,lsa=cxl-lsa1,id=cxl-pmem0 \
>     -device cxl-rp,port=1,bus=cxl.1,id=root_port14,chassis=0,slot=3 \
> -  -device cxl-type3,bus=root_port14,memdev=cxl-mem2,lsa=cxl-lsa2,id=cxl-pmem1 \
> +  -device cxl-type3,bus=root_port14,persistent-memdev=cxl-mem2,lsa=cxl-lsa2,id=cxl-pmem1 \
>     -device cxl-rp,port=0,bus=cxl.2,id=root_port15,chassis=0,slot=5 \
> -  -device cxl-type3,bus=root_port15,memdev=cxl-mem3,lsa=cxl-lsa3,id=cxl-pmem2 \
> +  -device cxl-type3,bus=root_port15,persistent-memdev=cxl-mem3,lsa=cxl-lsa3,id=cxl-pmem2 \
>     -device cxl-rp,port=1,bus=cxl.2,id=root_port16,chassis=0,slot=6 \
> -  -device cxl-type3,bus=root_port16,memdev=cxl-mem4,lsa=cxl-lsa4,id=cxl-pmem3 \
> +  -device cxl-type3,bus=root_port16,persistent-memdev=cxl-mem4,lsa=cxl-lsa4,id=cxl-pmem3 \
>     -M cxl-fmw.0.targets.0=cxl.1,cxl-fmw.0.targets.1=cxl.2,cxl-fmw.0.size=4G,cxl-fmw.0.interleave-granularity=8k
>   
>   An example of 4 devices below a switch suitable for 1, 2 or 4 way interleave::
> @@ -354,15 +375,23 @@ An example of 4 devices below a switch suitable for 1, 2 or 4 way interleave::
>     -device cxl-rp,port=1,bus=cxl.1,id=root_port1,chassis=0,slot=1 \
>     -device cxl-upstream,bus=root_port0,id=us0 \
>     -device cxl-downstream,port=0,bus=us0,id=swport0,chassis=0,slot=4 \
> -  -device cxl-type3,bus=swport0,memdev=cxl-mem0,lsa=cxl-lsa0,id=cxl-pmem0,size=256M \
> +  -device cxl-type3,bus=swport0,persistent-memdev=cxl-mem0,lsa=cxl-lsa0,id=cxl-pmem0,size=256M \
>     -device cxl-downstream,port=1,bus=us0,id=swport1,chassis=0,slot=5 \
> -  -device cxl-type3,bus=swport1,memdev=cxl-mem1,lsa=cxl-lsa1,id=cxl-pmem1,size=256M \
> +  -device cxl-type3,bus=swport1,persistent-memdev=cxl-mem1,lsa=cxl-lsa1,id=cxl-pmem1,size=256M \
>     -device cxl-downstream,port=2,bus=us0,id=swport2,chassis=0,slot=6 \
> -  -device cxl-type3,bus=swport2,memdev=cxl-mem2,lsa=cxl-lsa2,id=cxl-pmem2,size=256M \
> +  -device cxl-type3,bus=swport2,persistent-memdev=cxl-mem2,lsa=cxl-lsa2,id=cxl-pmem2,size=256M \
>     -device cxl-downstream,port=3,bus=us0,id=swport3,chassis=0,slot=7 \
> -  -device cxl-type3,bus=swport3,memdev=cxl-mem3,lsa=cxl-lsa3,id=cxl-pmem3,size=256M \
> +  -device cxl-type3,bus=swport3,persistent-memdev=cxl-mem3,lsa=cxl-lsa3,id=cxl-pmem3,size=256M \
>     -M cxl-fmw.0.targets.0=cxl.1,cxl-fmw.0.size=4G,cxl-fmw.0.interleave-granularity=4k
>   
> +Deprecations
> +------------
> +
> +The Type 3 device [memdev] attribute has been deprecated in favor of the
> +[persistent-memdev] attributes. [memdev] will default to a persistent memory
> +device for backward compatibility and is incapable of being used in combination
> +with [persistent-memdev].
> +

Probably worth mentioning & referring this in docs/about/deprecated.rst.

