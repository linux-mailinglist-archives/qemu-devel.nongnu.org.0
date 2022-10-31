Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D29B6613A04
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 16:30:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opWiL-0001zK-UN; Mon, 31 Oct 2022 11:28:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opWiI-0001yL-5E
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 11:28:34 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opWiF-0008N5-Ex
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 11:28:33 -0400
Received: by mail-wr1-x42e.google.com with SMTP id g12so16470532wrs.10
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 08:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7doM4mzl+TxQGpsMC4jl51Y/4dnVis/924XPi13pLgI=;
 b=vytrUS46XA+Y4oP151GgvEfrmSmlgAMbTXmbdsjPYlc+ICAb8o7RAQHwcbnyYas04n
 okGuvxFs+C20YfXe57i7xi0a6xmCfVevPxjg63vdkutvFToTfhmdpf0dDMtR+0R219zx
 W95IjJhmSXlABwYNJxKqgGgydACJA3O1Myl7uCCw1dPKOcOJG0L91wTFC2dRqc4o9dRm
 WjOIygKO66BsDu0s/wnJHYFa0XmsyNamaFmdNjrj7PrNYHaReeZEOYNvZHm4dBbMSTkM
 YnWwnFS/vkLaG3v8MAU76flGiHM9ou2H0+qUtycMJerdAGCmRdr7WGS8smAMDVkiIqlv
 T3IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7doM4mzl+TxQGpsMC4jl51Y/4dnVis/924XPi13pLgI=;
 b=baYmYhkAyFVEo2RrOgFjYV9hHu++l8c8eQbhE7OqAhqmpgwfhxc05T3nyum7d9nJdN
 vpN+VBpwz8Bfm25ZzHFoCAJ1Y/nT/dN0r1IkXS2NTxbvDNQaiK/T1kbxouWpq+/7yLuW
 Gl3DARWTR+jpxW/lHuB/yAyRsnzHVkAngRReJ9pNcBHP3QXFLy1CAl06MKhWDrnZc7BZ
 qu7HxHR/8hraD6LhYx19xS6NWNiRpTrNNWCAZGXFIp8YYzi2OZ/R/wO0lifAl6A0zBJX
 4bdcF9zXn5Gr2FEug+kPgtPN44FpINCZFlygVDJr/b55lqJNHQOEcJOFwkEM36M1vfST
 NdDw==
X-Gm-Message-State: ACrzQf0wCKItRHK+67uYfh+r+MjsGaYRGkx6+2PJJgqZWjFHG6i60jKo
 rKM8fM4zVDx5T+H3IXA8BTv/ZBB5hXlX6w==
X-Google-Smtp-Source: AMsMyM4JNwUPfaGw7lyXjDNpQqCUApd83Gs0jJwVLPVMOmvmeNJ8YDiTmJqaJa9iFqpKSmmPNIiRWw==
X-Received: by 2002:adf:e504:0:b0:236:4882:e784 with SMTP id
 j4-20020adfe504000000b002364882e784mr8696133wrm.670.1667230109781; 
 Mon, 31 Oct 2022 08:28:29 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 ck1-20020a5d5e81000000b002366553eca7sm7422124wrb.83.2022.10.31.08.28.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Oct 2022 08:28:29 -0700 (PDT)
Message-ID: <438e8245-c61b-4066-bf10-44c43135ca90@linaro.org>
Date: Mon, 31 Oct 2022 16:28:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [RFC PATCH v5 2/6] hw/sd/sdhci: Map host controller interface in
 host endianess
Content-Language: en-US
To: qemu-devel@nongnu.org, Bernhard Beschow <shentey@gmail.com>
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-ppc@nongnu.org,
 Bin Meng <bin.meng@windriver.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org
References: <20221031115402.91912-1-philmd@linaro.org>
 <20221031115402.91912-3-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221031115402.91912-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

On 31/10/22 12:53, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/sd/sdhci.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
> index f9c5b58e6d..40f37694d5 100644
> --- a/hw/sd/sdhci.c
> +++ b/hw/sd/sdhci.c
> @@ -1341,7 +1341,7 @@ static const MemoryRegionOps sdhci_mmio_ops = {
>           .max_access_size = 4,
>           .unaligned = false
>       },
> -    .endianness = DEVICE_LITTLE_ENDIAN,
> +    .endianness = DEVICE_NATIVE_ENDIAN,
>   };

RFC because I was focusing on the SDHCI device and wanted some code
Bernhard could test. I expect something in the CCSR block doing the
endianness swapping.

