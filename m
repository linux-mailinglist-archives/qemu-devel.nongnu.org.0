Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D953BA5DC
	for <lists+qemu-devel@lfdr.de>; Sat,  3 Jul 2021 00:09:40 +0200 (CEST)
Received: from localhost ([::1]:55466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzRLv-0002cH-D4
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 18:09:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lzRKd-0001oP-1g; Fri, 02 Jul 2021 18:08:19 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:41654)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lzRKa-0003Ev-7n; Fri, 02 Jul 2021 18:08:18 -0400
Received: by mail-wr1-x429.google.com with SMTP id u8so14100628wrq.8;
 Fri, 02 Jul 2021 15:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0wD0iwGL1fHQ/2Qw8uprjxj0OgD6BFP8yWrSGG5/038=;
 b=gezTck0Y9XIljVqwjqMKsmX6UsEWzDAZ7grDLaDHkTBMdXnL3Qsa0dLQiTBAxv7wKK
 IH8wqxgXyrU7AdSHVEWZQv6KG7PJPgUc1PKVhA6GlTGNBR14I68TVRKm9O1Yu9q7YRGk
 Xy4KMiT/5k7v9jM1ccYSc9MEmKDrrMd3NL0hWljiOAeJ7QagQ4cl4t3c6dCakfwNc6tD
 1JXlhCM2YF5sBDLHTRajJxjob9rXvLZSptrVeb5/gwG3Nzh/NH/5hdroW75F2blAgBEZ
 gWyah7cdlg+JM61QM0QYqrFxHEnFKOb/nmTnHkHr+DWXQoCnVMJicgAnhNOY2wIRJeCp
 /6qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0wD0iwGL1fHQ/2Qw8uprjxj0OgD6BFP8yWrSGG5/038=;
 b=OSy5h2npkL6meqPNu3RjQD/OIBl32lN4YcRVclYq+vEVCrmbz60sz0eNXBGlauZxEz
 71NXkqUI1dyArsiy7qIL1KT2n6pmAwqGVcZEil5oM/NozhPl1pjHHOY+8WoQhlPSIBu9
 lwHXTcZFiPQhP6cdpvxvuZDCuifF4fjIbLekc+kqOQIRSQQ8ojEeQUC2nqSCQC8Y5rLw
 8ij/nIvaUXUZoD3JlrdBr5MqK81dOHSI0Qh5cwUBNuCk/r0IfZDXnqycH83vpX/cuHUR
 vuwknC8qWu7Ve1WF0IDTqzMq3MH8/MU0wJsR6eye0TA1WuYX1O0FluspqjK/dbiMEx44
 KaAA==
X-Gm-Message-State: AOAM532Z1z3EVScOtOl37ta/zq4k91O/KPST5rFmgk8hMerk7+Ny0Wwe
 7NCrZhepg02OswG8CviDSHQ=
X-Google-Smtp-Source: ABdhPJxuuk9HSKU8ktXUZoOX9qrH6c0jwxhrfYwtw9nD3xELVBEWzTcxoddF8LSGF3uW03GPkpyC3w==
X-Received: by 2002:adf:e607:: with SMTP id p7mr1948306wrm.80.1625263693280;
 Fri, 02 Jul 2021 15:08:13 -0700 (PDT)
Received: from [192.168.11.95] (pop.92-184-108-23.mobile.abo.orange.fr.
 [92.184.108.23])
 by smtp.gmail.com with ESMTPSA id x17sm5739783wrn.62.2021.07.02.15.08.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Jul 2021 15:08:12 -0700 (PDT)
Subject: Re: [PATCH] hw/sd: sdhci: Enable 64-bit system bus capability in the
 default SD/MMC host controller
To: Joanne Koong <joannekoong@gmail.com>, qemu-devel@nongnu.org
References: <20210623185921.24113-1-joannekoong@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <1858015e-b7ff-ac91-1d15-db2e079cc570@amsat.org>
Date: Sat, 3 Jul 2021 00:08:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210623185921.24113-1-joannekoong@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Bin Meng <bin.meng@windriver.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Joanne,

Next time I recommend you to Cc the maintainers, otherwise they
might miss your patch. See:
https://wiki.qemu.org/Contribute/SubmitAPatch#CC_the_relevant_maintainer

$ ./scripts/get_maintainer.pl -f hw/sd/sdhci-internal.h
"Philippe Mathieu-Daudé" <f4bug@amsat.org> (odd fixer:SD (Secure Card))
Bin Meng <bin.meng@windriver.com> (odd fixer:SD (Secure Card))
qemu-block@nongnu.org (open list:SD (Secure Card))
qemu-devel@nongnu.org (open list:All patches CC here)

On 6/23/21 8:59 PM, Joanne Koong wrote:
> The default SD/MMC host controller uses SD spec v2.00. 64-bit system bus capability
> was added in v2.
> 
> In this change, we arrive at 0x157834b4 by computing (0x057834b4 | (1ul << 28))
> where 28 represents the BUS64BIT SDHC_CAPAB field.
> 
> Signed-off-by: Joanne Koong <joannekoong@gmail.com>
> ---
>  hw/sd/sdhci-internal.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/sd/sdhci-internal.h b/hw/sd/sdhci-internal.h
> index e8c753d6d1..a76fc704e5 100644
> --- a/hw/sd/sdhci-internal.h
> +++ b/hw/sd/sdhci-internal.h
> @@ -316,16 +316,16 @@ extern const VMStateDescription sdhci_vmstate;
>   * - 3.3v and 1.8v voltages
>   * - SDMA/ADMA1/ADMA2
>   * - high-speed
> + * - 64-bit system bus
>   * max host controller R/W buffers size: 512B
>   * max clock frequency for SDclock: 52 MHz
>   * timeout clock frequency: 52 MHz
>   *
>   * does not support:
>   * - 3.0v voltage
> - * - 64-bit system bus
>   * - suspend/resume
>   */
> -#define SDHC_CAPAB_REG_DEFAULT 0x057834b4
> +#define SDHC_CAPAB_REG_DEFAULT 0x157834b4
>  
>  #define DEFINE_SDHCI_COMMON_PROPERTIES(_state) \
>      DEFINE_PROP_UINT8("sd-spec-version", _state, sd_spec_version, 2), \
> 

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

