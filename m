Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D68F1318789
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 10:56:35 +0100 (CET)
Received: from localhost ([::1]:40734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lA8iA-00007z-LM
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 04:56:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lA8g2-0007PB-0J
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 04:54:22 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:39114)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lA8g0-0006Ab-8q
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 04:54:21 -0500
Received: by mail-wm1-x32e.google.com with SMTP id u14so5045027wmq.4
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 01:54:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=58zYQZtT3ys2Zb/6sX67SaoD4pzxEZR+sUoH4l3axo4=;
 b=FGsNzua//hd/z3eq4/Id+5om3LIwPT5t0qOdo9gtXzn75Iu+s0vWE6WGsEw9QUIoSQ
 ot2HXSfj3DAj8WTWipFCKBHvXh9o/B2GsZ8BstddfvdAp7uz7VNKZqm72u91jEOiw4UC
 Qo2fgVrt1ZexsGY061gtFfvKMCGm2GU9/9LhUZUlKnFgEtgWYzTLQmbadjWJ0e47AOZt
 3eszL0MGv3YRmJ2wOIMyoRzo1BqGkAuRHHl2PnzSl1Boay/bJ/gD2G0FzvEqTN+OBV3e
 z8sEykdAnNThxskdILcC4uOIveNP76LkebMP5vfI+tdcawXPpnc1ThznWr02RbzS/if0
 mEyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=58zYQZtT3ys2Zb/6sX67SaoD4pzxEZR+sUoH4l3axo4=;
 b=J+6/bKhDhE1ihn6Fm4q39+mIU4eBE6a8nHUzEN1Ln9iro1ZYmWlo70WSCZzMiOZiQx
 dp1A8NqP0d9qdox1x5J+W7Uw2yfr0K5bUQ3LvQp7JyPmAuWrMh9RJm/cYswVPjGQp75p
 qU6dxxm0qRrkl3kN6VHZ3mS2QK5/nipRfRo1q5FAOhV4KtDj7Mnva2gG9UsYQKOhFIGA
 7NUGpVATGxXxlbOOZ07AF/lT6IzoaA2I8eOdMIJVym/wZZAkPPDn64cGQWehqPnwA5sB
 1Va5XIigkQ+h2AUZnLb2DDIab9gjSEOxngC+SwVqyVXUTllqFqhIQHuEgRlNKVMTz41g
 S7dw==
X-Gm-Message-State: AOAM530zsX35uMbvd5GZbTXveGMB44zFu6XiTNx3LLlnpPfTx3WNQJB5
 bNltj4AjXTgSinqguAeebow=
X-Google-Smtp-Source: ABdhPJyzugvvrfvh9fgz/zQuLNsPt0z50QSlroh9/G109iJgG8M1OHwfuNdbKWgZ3Gr8QXeWdNQXEQ==
X-Received: by 2002:a05:600c:c6:: with SMTP id
 u6mr4323864wmm.176.1613037258203; 
 Thu, 11 Feb 2021 01:54:18 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id j185sm9773825wma.1.2021.02.11.01.54.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Feb 2021 01:54:17 -0800 (PST)
Subject: Re: [PATCH] MAINTAINERS: add myself maintainer for the clock framework
To: Luc Michel <luc@lmichel.fr>, qemu-devel@nongnu.org
References: <20210211085318.2507-1-luc@lmichel.fr>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <34327754-93cd-160d-c8a4-1a1cdc730fa8@amsat.org>
Date: Thu, 11 Feb 2021 10:54:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210211085318.2507-1-luc@lmichel.fr>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.211,
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/11/21 9:53 AM, Luc Michel wrote:

[if possible duplicate subject line]

> Also add Damien as a reviewer.
> 
> Signed-off-by: Luc Michel <luc@lmichel.fr>

Thanks guys for stepping in!

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  MAINTAINERS | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e6f1eca30f..67ad14ce14 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2850,10 +2850,21 @@ M: Bin Meng <bmeng.cn@gmail.com>
>  S: Supported
>  F: pc-bios/opensbi-*
>  F: .gitlab-ci.d/opensbi.yml
>  F: .gitlab-ci.d/opensbi/
>  
> +Clock framework
> +M: Luc Michel <luc@lmichel.fr>
> +R: Damien Hedde <damien.hedde@greensocs.com>
> +S: Maintained
> +F: include/hw/clock.h
> +F: include/hw/qdev-clock.h
> +F: hw/core/clock.c
> +F: hw/core/clock-vmstate.c
> +F: hw/core/qdev-clock.c
> +F: docs/devel/clocks.rst
> +
>  Usermode Emulation
>  ------------------
>  Overall usermode emulation
>  M: Riku Voipio <riku.voipio@iki.fi>
>  S: Maintained
> 

