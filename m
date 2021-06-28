Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9401C3B68A3
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 20:42:36 +0200 (CEST)
Received: from localhost ([::1]:45020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxwDL-00075G-92
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 14:42:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lxwBs-0006CQ-9U
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 14:41:04 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:53907)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lxwBp-0002Bs-Ts
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 14:41:04 -0400
Received: by mail-wm1-x334.google.com with SMTP id w13so12138573wmc.3
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 11:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=P550SQkLN5vgj1U404fUaOZOmxyS4J49Ga3CoTuRzFA=;
 b=mc0D0VuC5228GSQ749EuGeF6B4t+8/FkvKzD+sKMZQg2Os9PS/rWZcWypgkhSrc/fO
 hP2fUsMZDE9Aheuv7CYMxs/AtwfWXpE7z4YYFvFzq0i/iQ2VhjPrXeLdGD3tk6l6t0Qr
 D2VG3RdKzLv70Tdmrr0UzvZe4IdFFHolsej+qjZ+MD+RKvnj4r7ZvoOGrQCvbrbECF5d
 9j+8fyXjnn3lgtJCZ3tWSQyrZoiAzXxIErhOfUgSSE6Dj+akuXG0IHPJSriBiV7cBzea
 VPsAmuV/5TinitsttlNU4qboQussqy76km1ec3vcHxbZUixMLFVLnlPM9WgrBjQOhZhh
 4VyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=P550SQkLN5vgj1U404fUaOZOmxyS4J49Ga3CoTuRzFA=;
 b=hglnWQtIEGPv85wTg4YAzRpZr+TRKonmp2Foq01r1vpse1hwl6+oHFM6IA5IKPWSQO
 NlhSCnAac9qZmkCsLbeCJKsVNO1OAIc06m/lcsF9+OoFKrGsm3Sf8zYDnahtfHjKyUPr
 DsNbqqu5FzHEgJx/A5reh9QijWJh0INYRBmyidBK5f7vUrNZwcjjTC2h19jG5ovnoENM
 1zPzFoYVd6JeIuH5i5lqHgYPTXbFyGZAOeIgyO2Z6/hIc7eQhCf8iSoFqhA5i6iq0fGF
 WtWWCja9ImUvzL8lWmGIyISeDe3WDyMixLmz4PN1u30KfWdS/rrdnDhIH/wx2CQU5BjH
 ILlQ==
X-Gm-Message-State: AOAM531BYRZ9MdYbMnN1AkEoM9iadsJQOfV8xbnLebUWZiIbtlBNHFwk
 OyCzeUVxsIhyDSW6IMSahnI=
X-Google-Smtp-Source: ABdhPJyr1h5DKPjUh9wc45A5lVyCvvBUsTdmlLmoGDUbBdxFisQdI6CSK3rZwg+r6fwB73hACBmJYg==
X-Received: by 2002:a1c:cc02:: with SMTP id h2mr27450571wmb.39.1624905660230; 
 Mon, 28 Jun 2021 11:41:00 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id x25sm324042wmj.23.2021.06.28.11.40.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jun 2021 11:40:59 -0700 (PDT)
Subject: Re: [PATCH 01/20] target/loongarch: Add README
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <1624881885-31692-1-git-send-email-gaosong@loongson.cn>
 <1624881885-31692-2-git-send-email-gaosong@loongson.cn>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <f97feb5c-42ef-2ce0-a8c9-4ecc32222841@amsat.org>
Date: Mon, 28 Jun 2021 20:40:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1624881885-31692-2-git-send-email-gaosong@loongson.cn>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, richard.henderson@linaro.org,
 laurent@vivier.eu, maobibo@loongson.cn, alistair.francis@wdc.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/28/21 2:04 PM, Song Gao wrote:
> This patch give an introduction to the LoongArch target.
> 
> Signed-off-by: Song Gao <gaosong@loongson.cn>
> ---
>  MAINTAINERS             |  5 +++++
>  target/loongarch/README | 16 ++++++++++++++++
>  2 files changed, 21 insertions(+)
>  create mode 100644 target/loongarch/README
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3ff56f5..f207805 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -209,6 +209,11 @@ F: disas/hppa.c
>  F: hw/net/*i82596*
>  F: include/hw/net/lasi_82596.h
>  
> +LoongArch TCG CPUS
> +M: Song Gao <gaosong@loongson.cn>
> +S: Maintained
> +F: target/loongarch/
> +
>  M68K TCG CPUs
>  M: Laurent Vivier <laurent@vivier.eu>
>  S: Maintained
> diff --git a/target/loongarch/README b/target/loongarch/README
> new file mode 100644
> index 0000000..0addfc7
> --- /dev/null
> +++ b/target/loongarch/README
> @@ -0,0 +1,16 @@
> +LoongArch is the general processor architecture of Loongson.
> +
> +The following versions of the LoongArch core are supported
> +    core: 3A5000
> +    https://github.com/loongson/LoongArch-Documentation/releases/download/LoongArch-Vol1-v3/LoongArch-Vol1-v1.00-EN.pdf
> +
> +There are several code directories
> +
> +    1 qemu/target/loongarch
> +        This is the instruction emulation directory
> +    2 qemu/linux-user/loongarch64
> +        Linux-user simulation
> +    3 qemu/hw/loongarch
> +        System simulation
> +    4 qemu/tests/tcg/loongarch
> +        Linux-user test

No qemu/ prefix.

