Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 309AB3894DE
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 19:58:26 +0200 (CEST)
Received: from localhost ([::1]:54814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljQSf-0003aM-8U
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 13:58:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ljQR4-0001lA-Mr; Wed, 19 May 2021 13:56:46 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:42983)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ljQR1-00046t-PQ; Wed, 19 May 2021 13:56:45 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 f75-20020a1c1f4e0000b0290171001e7329so3796576wmf.1; 
 Wed, 19 May 2021 10:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=l2WMgSS2Hi3pHW0kyRJ5D9AQK7t5YV81Z089LMT/YRw=;
 b=Rw/FdpALP2x+d9AZkmyIA/LvnWK5E7mYVDTbeb8RTgD0jmRWcZJuH5l5UKfZRQoCQR
 GeXNqIwir3gH5lHfIT3ApP9m5I/Igt7Gc9Ubz+nmQwIkypYKQ6qwshAAzmLgsEeTGApd
 PFKEmWBceEP/tKgmSenh9eHmvIrVIL7FBnhciQ/Hi84IEmLz+hlTxOeozqP5HB0WEf/6
 w3NguQwkL6x/muXKCNEr13BPMzGRV62C1RXPjkZz+67/YSyIkct/XuIAW3U0WdDFFrkf
 aSc8uor8qTqX5nGV7mkBsHUh/XHbP6vyrQ86xqYpDDgqWsR3okHCppiBYfM+HH3XqpLq
 YlaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=l2WMgSS2Hi3pHW0kyRJ5D9AQK7t5YV81Z089LMT/YRw=;
 b=EX3DXczANBa6MENmLqzuNnbDnMvgYfaNitS6BfSN5+S2+JWwfmBDcATFR+aMTdPfh1
 cEbh3/C+NccKBRij6YRw1cORlzxK6Yv50UyMcSZmV0/fcmj2s8CJzHJNGX3CkxNtwt1O
 +lN7Bv5PngEHRtKzUfZmVYMNNe06l9FFuQCz/wIaCaJxttMQTBgklQQuXrPUtvnA9ZiB
 BwCYw1CJacUh1nbeYBF02p5n3d0g0auXB07O+gMSppfTTkokQYqfMebcgwtuxsG7SwlK
 /c+yzRwMx78Cyqhy4CEndU1BM2oHLaN7QeVmS6g2b/v7Fwtg0p4ytXC2ze03QpkX7XTN
 Ma2w==
X-Gm-Message-State: AOAM530ZWJ+r3/7G1i+RkIw9giooCjc9HKgfuqoZAZAeH4WTIlC8IBkY
 /YlCR46/6PWlkNMN5jiazSVV+voXz1osUg==
X-Google-Smtp-Source: ABdhPJyCDS83uiqJrv6xsisR9Hznzn4ZDY9vu2E8labt7Bh6t8ylRcsrGMDvQBILijY4P/dJPZE2HQ==
X-Received: by 2002:a1c:6503:: with SMTP id z3mr64116wmb.72.1621447001710;
 Wed, 19 May 2021 10:56:41 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id k6sm73372wrh.61.2021.05.19.10.56.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 May 2021 10:56:41 -0700 (PDT)
Subject: Re: [PATCH 1/3] adc: Move the zynq-xadc file to the adc directories
To: minyard@acm.org, qemu-devel@nongnu.org, Titus Rwantare <titusr@google.com>
References: <20210519000331.3690536-1-minyard@acm.org>
 <20210519000331.3690536-2-minyard@acm.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <656069a4-08d6-e1fc-9cb3-68f3d2189d7b@amsat.org>
Date: Wed, 19 May 2021 19:56:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210519000331.3690536-2-minyard@acm.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 Corey Minyard <cminyard@mvista.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/19/21 2:03 AM, minyard@acm.org wrote:
> From: Corey Minyard <cminyard@mvista.com>
> 
> It's an ADC, put it where it belongs.
> 
> Cc: Edgar E. Iglesias <edgar.iglesias@gmail.com>
> Cc: Alistair Francis <alistair@alistair23.me>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: qemu-arm@nongnu.org
> Signed-off-by: Corey Minyard <cminyard@mvista.com>
> ---
>  MAINTAINERS                          | 6 ++++--
>  hw/adc/meson.build                   | 1 +
>  hw/{misc => adc}/zynq-xadc.c         | 2 +-
>  hw/arm/xilinx_zynq.c                 | 2 +-
>  hw/misc/meson.build                  | 2 +-
>  include/hw/{misc => adc}/zynq-xadc.h | 0
>  6 files changed, 8 insertions(+), 5 deletions(-)
>  rename hw/{misc => adc}/zynq-xadc.c (99%)
>  rename include/hw/{misc => adc}/zynq-xadc.h (100%)

Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

