Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F01A65987B
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Dec 2022 13:56:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pBEtG-0002Ii-IB; Fri, 30 Dec 2022 07:53:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pBEtD-0002DM-Go
 for qemu-devel@nongnu.org; Fri, 30 Dec 2022 07:53:35 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pBEtC-00063M-05
 for qemu-devel@nongnu.org; Fri, 30 Dec 2022 07:53:35 -0500
Received: by mail-wr1-x433.google.com with SMTP id co23so19854768wrb.4
 for <qemu-devel@nongnu.org>; Fri, 30 Dec 2022 04:53:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=w15lGMK7vfjvgcyYsOSpW0zopNf8iBSn51jKli2B8qc=;
 b=t2HUwtTHWBG8I7aOnGpanz50uxd9vkX3al4xbFUZ0UXKcX3DSQ6BIktw8Cv0zWfScl
 6qOKkV8j2I/YkYG1GavmWmaS5EWp+pc2qnrW2p6IJG8hN1w+fC6/klGdGQznUg9nPtyb
 At15r/DGBfdEgAsCPL2YhEtsY8pn4WlYhXntGbjjletpBF54zSFueK0/iZHOQiXoc1vp
 wYwmoomF1ppOgZuFxc7+9yMb2XNB0HmzzxvIFBTza2l2hIZY/1ybzsbXXoDiUTOnyTAB
 Zpxn4iF64h4vdn9gsQdSkBAAF5yDt6nPrkVJBI0yTZ7ZpibHgvRODqyIotAFQjeHPy8I
 d6Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=w15lGMK7vfjvgcyYsOSpW0zopNf8iBSn51jKli2B8qc=;
 b=3xougwdmxXtE7m0pEL3eCZZ72U+kP+Vg3UVTscRYu2xFc4Gvqtj1CV67nzzuxXSCNd
 We1uD9jwpvYLV9Pt44oEeeK6hvwMeu8HqFNldmfZCO3NLgGE6Wqv+qeO+ykG5LdYrnTZ
 Su77gV/68Mv5KfKKEDLoQs0WHvw3lRYsviy8ewMwyQNrpHSIsN+Dw/mIgkx+JvFnm+HP
 w/BsThAIWsSVEz/kv7hC6vtye62alhd1z6WPdQYcwCBYeJESsxuNe5YxZghX+eRrZeSM
 AXP36RlGdHcrMGRDTE7awmS0CokrXerVfCtFjEsljFa2JkCLxEdcVwXbF/RROAM/X5P9
 TvUg==
X-Gm-Message-State: AFqh2krcLDQ3UmT/EOWbb/AHDx33Tjg5K0M2YcTpLbzYOq1ZqOP9sedr
 KHvzQORpl1vfEzXNXG1nykTUTogIOJNcLXfz
X-Google-Smtp-Source: AMrXdXtoySxPelT8wmHYG1//VUQ6GhBRhu8GvAsiY6mGPFOSf0QNavYWvIez0dT5Po6Pr/X1ukL9dA==
X-Received: by 2002:a5d:4387:0:b0:26f:2fb:7f88 with SMTP id
 i7-20020a5d4387000000b0026f02fb7f88mr19455124wrq.33.1672404812390; 
 Fri, 30 Dec 2022 04:53:32 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 i1-20020adfb641000000b002425787c5easm20679342wre.96.2022.12.30.04.53.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Dec 2022 04:53:32 -0800 (PST)
Message-ID: <f30ad0ad-a16d-c48d-e555-cc22f75a9204@linaro.org>
Date: Fri, 30 Dec 2022 13:53:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v4 07/11] hw/riscv: write bootargs 'chosen' FDT after
 riscv_load_kernel()
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Bin Meng <bmeng@tinylab.org>
References: <20221229181135.270661-1-dbarboza@ventanamicro.com>
 <20221229181135.270661-8-dbarboza@ventanamicro.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221229181135.270661-8-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
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

On 29/12/22 19:11, Daniel Henrique Barboza wrote:
> The sifive_u, spike and virt machines are writing the 'bootargs' FDT
> node during their respective create_fdt().
> 
> Given that bootargs is written only when '-append' is used, and this
> option is only allowed with the '-kernel' option, which in turn is
> already being check before executing riscv_load_kernel(), write
> 'bootargs' in the same code path as riscv_load_kernel().
> 
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Bin Meng <bmeng@tinylab.org>
> ---
>   hw/riscv/sifive_u.c | 11 +++++------
>   hw/riscv/spike.c    |  9 +++++----
>   hw/riscv/virt.c     | 11 +++++------
>   3 files changed, 15 insertions(+), 16 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


