Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A04653CEF92
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 01:09:56 +0200 (CEST)
Received: from localhost ([::1]:45088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5cOZ-0006uj-Nf
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 19:09:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m5cNe-0006F8-P3
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 19:08:58 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:35484)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m5cNd-0002dq-5k
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 19:08:58 -0400
Received: by mail-wr1-x42e.google.com with SMTP id m2so23965255wrq.2
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 16:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=98pEHeyIKL4mJJvAFiXcfa/lgjCJ0zphIwCdT5eGy2Y=;
 b=D9Q7MhInksA4w6i4JXeVFpdeQruXSO5q+1sWGdlibLJgd2z/yM4xrHDrZ1iHREWqKM
 XfAuyi5l0MMsc5ABxznr1DgetXaz1RCU+ihpcwgOc9W+TIBgF6fy5vH5EkeYItXS2rR0
 MYggavKP/FT9nhZDuCxdn2jDOCmS0BSscKC0ab3M/lXYjoC35tFoFJjmRMV9CmJ67QaJ
 EhCpUGnuUZQUv46HvP3Q9ZQ492qn/29lPwh9D5HHAgMubycGOULMtndTfSfnLD7KHsYT
 hHot1Lql/T9ulEWFresh0dJ1mLAssIGZ7dH0yvksDAdAM+BbBsWyy790kLIz1d7VXgf0
 bNzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=98pEHeyIKL4mJJvAFiXcfa/lgjCJ0zphIwCdT5eGy2Y=;
 b=b0X2a1rKwM8+IkBXAfN+SL00TuwMBnQOuP6If1tG8ieD6K4cYc1POYvE2pPxxhRJeM
 QY1IchBggPgT1k//2qa0sK7I+KPNRDeATlhOEgpvlXafLZF+/meqSZXliBv3ER3crguj
 1hjdJMnxu7ObDXv9ut0/WLHYIJTlHQCrlCzwA/hkA9aLCpE40n78Eph0M+QkWjXl9MDQ
 IsFmzVGKUI1AGp3JTP3hmxdTmYs+y2JXCgStYkwJDTvzqgpg/nZWygQ7iMcWZS3Pqo7y
 sDA2+tlNob5YVP4eGlczTOjlwl/ghnz1iW9O25LmhRvqJe9znJw8C/5ec5Cq8SMiCTms
 fc0Q==
X-Gm-Message-State: AOAM533q4vm53fqPFHgtX820yULa1W2HXYpwKQwzp5I9LbaxB49kCovM
 UtDQWc/52cqvNhMv2cbhTKquUNXOhTb3TgSz
X-Google-Smtp-Source: ABdhPJwLm4tl3vzMo1nNwa7MCKuLQ8ib2D3n17f2Qg7rlNTuSgCj88yFlRFjNCl5GrbHdLbVnxgDWg==
X-Received: by 2002:a5d:67d0:: with SMTP id n16mr7408755wrw.266.1626736135396; 
 Mon, 19 Jul 2021 16:08:55 -0700 (PDT)
Received: from [192.168.43.238] (126.red-95-127-153.staticip.rima-tde.net.
 [95.127.153.126])
 by smtp.gmail.com with ESMTPSA id l22sm714785wmp.41.2021.07.19.16.08.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Jul 2021 16:08:54 -0700 (PDT)
Subject: Re: [PATCH v1 1/2] hw/tricore: fix inclusion of tricore_testboard
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210719195002.6753-1-alex.bennee@linaro.org>
 <20210719195002.6753-2-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <14956cf5-dbbc-c670-39bb-f9eb4a8dc8e7@amsat.org>
Date: Tue, 20 Jul 2021 01:09:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210719195002.6753-2-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/19/21 9:50 PM, Alex Bennée wrote:
> We inadvertently added a symbol clash causing the build not to include
> the testboard needed for check-tcg.
> 
> Fixes: f4063f9c31 ("meson: Introduce target-specific Kconfig")

Sorry for the mess, I remember having tested this carefully.

OK, so my patch was sent/tested first:

commit f4063f9c319e3924b0c6d09dfe43e94d01253ee0
    Message-Id: <20210131111316.232778-6-f4bug@amsat.org>

but got merged *after* Bastian's series:

commit 582079c9d27fc8cfff9f495072300416e0e4aafe
    Message-Id: <20210305170045.869437-4-kbastian@mail.uni-paderborn.de>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  configs/devices/tricore-softmmu/default.mak | 1 +
>  hw/tricore/Kconfig                          | 3 +--
>  hw/tricore/meson.build                      | 4 ++--
>  3 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/configs/devices/tricore-softmmu/default.mak b/configs/devices/tricore-softmmu/default.mak
> index 5cc91cebce..724cb85de7 100644
> --- a/configs/devices/tricore-softmmu/default.mak
> +++ b/configs/devices/tricore-softmmu/default.mak
> @@ -1 +1,2 @@
> +CONFIG_TRITEST=y
>  CONFIG_TRIBOARD=y
> diff --git a/hw/tricore/Kconfig b/hw/tricore/Kconfig
> index 506e6183c1..a1b2438d99 100644
> --- a/hw/tricore/Kconfig
> +++ b/hw/tricore/Kconfig
> @@ -1,9 +1,8 @@
> -config TRICORE
> +config TRITEST
>      bool
>  
>  config TRIBOARD
>      bool
> -    select TRICORE
>      select TC27X_SOC
>  
>  config TC27X_SOC
> diff --git a/hw/tricore/meson.build b/hw/tricore/meson.build
> index 47e36bb077..692a4708ba 100644
> --- a/hw/tricore/meson.build
> +++ b/hw/tricore/meson.build
> @@ -1,6 +1,6 @@
>  tricore_ss = ss.source_set()
> -tricore_ss.add(when: 'CONFIG_TRICORE', if_true: files('tricore_testboard.c'))
> -tricore_ss.add(when: 'CONFIG_TRICORE', if_true: files('tricore_testdevice.c'))
> +tricore_ss.add(when: 'CONFIG_TRITEST', if_true: files('tricore_testboard.c'))
> +tricore_ss.add(when: 'CONFIG_TRITEST', if_true: files('tricore_testdevice.c'))
>  tricore_ss.add(when: 'CONFIG_TRIBOARD', if_true: files('triboard.c'))
>  tricore_ss.add(when: 'CONFIG_TC27X_SOC', if_true: files('tc27x_soc.c'))
>  
> 


