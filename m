Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF2F865986B
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Dec 2022 13:48:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pBEli-0002eY-Tb; Fri, 30 Dec 2022 07:45:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pBElg-0002cD-9y
 for qemu-devel@nongnu.org; Fri, 30 Dec 2022 07:45:48 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pBEle-0004J8-D1
 for qemu-devel@nongnu.org; Fri, 30 Dec 2022 07:45:48 -0500
Received: by mail-wm1-x32e.google.com with SMTP id ay40so15146398wmb.2
 for <qemu-devel@nongnu.org>; Fri, 30 Dec 2022 04:45:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0ZWeB0ie5NzqNBABybHGYcU1LRjphNBabgv6HNeQ3Q0=;
 b=FCoKn94LU75KOeYwzGdsSNLRLATTUgSiyTHhRlQUDmKP5VmrvdyPvDJTPLqJV9h0wp
 Od2H4dDAb3JpBMJ/lxrVnYPH/hzQyULVgB49/zax9B5c9Rv02zFldJ6h17LS4nBBeKp2
 Kkhr8c1QmwTO0w8bE5Rx1lwb2v/E8pag/43uVAvfvR/TSII/Eb4vDzu4KABTIHdnZytO
 VPcP1ApgmXtSNiU+vnovBoVRBv7NPhBQ5vVmO6zg2hVcgfN1bWhVoBN6S/kkPf9PKILT
 FRXlwdZYBbLK0Gghe7SCtWigfZ9Hg04uGa4+bDYRexrsqQIT23iSsZ2MDQZp0x74/GBM
 Tibw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0ZWeB0ie5NzqNBABybHGYcU1LRjphNBabgv6HNeQ3Q0=;
 b=fpMsp4rS0yhU+ZirtLhT25OP86e7q0A3zeuP6gGi/zgUcCYOMfP/gyDPqkq3qPdABi
 deUOuWrkUlYqw625BU/Eg2fFBzpDSmB9BdSihCBmwKK5WGEtWf1tnRvPmBs0GsPUzehY
 cXIhOqJ09LlNjj3E6jv87jj0GR+MBD2z6J8X0jUcWGjbFBw8Z0iXDMpbxtmepx192HYT
 A7ONcdJZomc3+u/ydOGSbfiVSfjftRzvopBRR1sv7qYSMseCSKdJyeNKjA/g1qawgXrb
 B8wAZlLyDIWZC6s3tHWfdEBMGfelTsYjPjM7/xBse2e3xLMx9gMOJbovJt0T4ueFVi/Q
 6sfQ==
X-Gm-Message-State: AFqh2krzVEfYl/BsVz6lCxYuWOPRNvIPZRSmDRxzeGmwXuXTPSimJCvh
 cG5SPLaEDx44BfccIq9KHm0fdA==
X-Google-Smtp-Source: AMrXdXvxlcACtxgkT0l1X6PL2Kkxcy4UnrBEvTVQAoXDCyWEW4spz+E0dnhAM3bfThEKrAP9TaGHcw==
X-Received: by 2002:a05:600c:4193:b0:3c6:e60f:3f4f with SMTP id
 p19-20020a05600c419300b003c6e60f3f4fmr22118873wmh.6.1672404344864; 
 Fri, 30 Dec 2022 04:45:44 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 l6-20020a05600c4f0600b003d9780466b0sm21943040wmq.31.2022.12.30.04.45.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Dec 2022 04:45:44 -0800 (PST)
Message-ID: <98d25c1c-c978-96a7-116a-c491b82650ff@linaro.org>
Date: Fri, 30 Dec 2022 13:45:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v4 3/3] hw/intc/loongarch_pch: Change default irq number
 of pch irq controller
Content-Language: en-US
To: Tianrui Zhao <zhaotianrui@loongson.cn>, qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, gaosong@loongson.cn, maobibo@loongson.cn
References: <20221230095950.2217103-1-zhaotianrui@loongson.cn>
 <20221230095950.2217103-4-zhaotianrui@loongson.cn>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221230095950.2217103-4-zhaotianrui@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.146,
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

On 30/12/22 10:59, Tianrui Zhao wrote:
> Change the default irq number of pch pic to 32, so that the irq
> number of pch msi is 224(256 - 32), and move the 'PCH_PIC_IRQ_NUM'
> macro to pci-host/ls7a.h and add prefix 'VIRT' on it to keep standard
> format.
> 
> Signed-off-by: Tianrui Zhao <zhaotianrui@loongson.cn>
> ---
>   hw/intc/loongarch_pch_pic.c         | 3 ++-
>   hw/loongarch/virt.c                 | 2 +-
>   include/hw/intc/loongarch_pch_msi.h | 6 +++---
>   include/hw/intc/loongarch_pch_pic.h | 1 -
>   include/hw/pci-host/ls7a.h          | 1 +
>   5 files changed, 7 insertions(+), 6 deletions(-)


> diff --git a/include/hw/intc/loongarch_pch_msi.h b/include/hw/intc/loongarch_pch_msi.h
> index c5a52bc327..a1172f56ff 100644
> --- a/include/hw/intc/loongarch_pch_msi.h
> +++ b/include/hw/intc/loongarch_pch_msi.h
> @@ -8,10 +8,10 @@
>   #define TYPE_LOONGARCH_PCH_MSI "loongarch_pch_msi"
>   OBJECT_DECLARE_SIMPLE_TYPE(LoongArchPCHMSI, LOONGARCH_PCH_MSI)
>   
> -/* Msi irq start start from 64 to 255 */
> -#define PCH_MSI_IRQ_START   64
> +/* Msi irq start start from 32 to 255 */

s/Msi/MSI/

Otherwise,

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


