Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2718E30DC61
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 15:14:40 +0100 (CET)
Received: from localhost ([::1]:53754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7IvX-0003nK-6J
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 09:14:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l7Irh-0000UY-Uv; Wed, 03 Feb 2021 09:10:42 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:37697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l7Irg-00028k-IB; Wed, 03 Feb 2021 09:10:41 -0500
Received: by mail-ej1-x632.google.com with SMTP id jj19so8269588ejc.4;
 Wed, 03 Feb 2021 06:10:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=dK7AVcJ4m46Q6XA6yIpWbk7thygZwSTA6DRZJfXmi88=;
 b=S3OtN6+WAHG8AFts3k7MVswnGDgDhoZFTg4x+e8MKnrRkTBOEyCAIdDwZpMzu9P//g
 tw/Va9gJ3fXMO3YaEk3Z66vLb874XU+ftZYT3c7l1DQqt5urw5XMjT34sAPX+/sToZOz
 BsVQ0yP/1Rfk2fFZ+V7fDSz4CM++FOR8LR+oa6PUxfz817Qn/7XwHWXj4jukxZAw7724
 /iiHbYzyvaPpFEw3G3mEjkmmJJGgAMMnRdrYnFLHMwFXRcLKaTX2XSrehlaVxbSzi2Ob
 hAZiowIbMLI/0mrvrEPA0vLsch3PndTMlQ2Mi4WiN9yQe4n1gc20IjiPZ+YkqHWn0Lqo
 Myww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dK7AVcJ4m46Q6XA6yIpWbk7thygZwSTA6DRZJfXmi88=;
 b=bk/UtRhcX/ewgzwEqqWVNNSbXjwkEQyQ/8GpbkMj+CS+Vf4djuKtmGddNJPLztdddI
 8DzaC2+8LJ7IRRyu6QwwmsTsXxKuy6wknb0zSP8fhKEfYwXbUAsXT31W4HhmfpdOxJqi
 e79kxTpOr+Ro+5pV7365b9BKrPS7gK1NAP3MyGoRaIv7TtguBb+TjsWwBk52UfKvzjCu
 dqX72Gv5cWcXkcqYZQ16P545RZTKwYVPbhP1JrojtfZeuOBFK6leTOpl6r0MIDbppqdA
 vsuHGuJ42tlLlWy98/hV8mM2A2ozz5n4zq2THgvUA6P+qoW5MLuXSlZ896FzhludKOQS
 qFeQ==
X-Gm-Message-State: AOAM530jdRFv0HTVKf5CNmJhtQagW8S77eBxlejHSSLftOq5MMIDmbsV
 x1Im00kgQpwG370cFRYM/e8dQ5/zYBs=
X-Google-Smtp-Source: ABdhPJyOiSpUUE7+J+7vpz7Zlj0NmE6xkOnCLGSWqC8O8yxBVI+C50TMG9rLpWzfaWE/WzOLogiYnA==
X-Received: by 2002:a17:906:798:: with SMTP id
 l24mr3452878ejc.92.1612361438665; 
 Wed, 03 Feb 2021 06:10:38 -0800 (PST)
Received: from [192.168.1.36] (107.red-83-59-163.dynamicip.rima-tde.net.
 [83.59.163.107])
 by smtp.gmail.com with ESMTPSA id m19sm932582edq.81.2021.02.03.06.10.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Feb 2021 06:10:33 -0800 (PST)
Subject: Re: [PATCH 1/2] hw/ppc: e500: Use a macro for the platform clock
 frequency
To: Bin Meng <bmeng.cn@gmail.com>, David Gibson
 <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
References: <1612360893-4624-1-git-send-email-bmeng.cn@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <f1f34302-9cc1-8ccd-c662-d6542c4f2528@amsat.org>
Date: Wed, 3 Feb 2021 15:10:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <1612360893-4624-1-git-send-email-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x632.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.178,
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
Cc: Bin Meng <bin.meng@windriver.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/3/21 3:01 PM, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> At present the platform clock frequency is using a magic number.
> Convert it to a macro and use it everywhere.
> 
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
> 
>  hw/ppc/e500.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
> index c64b5d0..672ccd5 100644
> --- a/hw/ppc/e500.c
> +++ b/hw/ppc/e500.c
> @@ -74,6 +74,8 @@
>  #define MPC8544_I2C_IRQ            43
>  #define RTC_REGS_OFFSET            0x68
>  
> +#define PLATFORM_CLK_FREQ          400000000

Consider 1/ using unit in variable name and 2/ decompose:

#define PLATFORM_CLK_FREQ_HZ          (400 * 1000 * 1000)

Regardless:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


