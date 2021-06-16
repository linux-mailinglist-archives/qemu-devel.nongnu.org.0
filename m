Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9226E3AA444
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 21:25:28 +0200 (CEST)
Received: from localhost ([::1]:39500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltbAF-0000mb-CB
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 15:25:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltb8H-0006w1-PH; Wed, 16 Jun 2021 15:23:25 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:52805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltb8G-0005mi-6y; Wed, 16 Jun 2021 15:23:25 -0400
Received: by mail-wm1-x330.google.com with SMTP id n23so1899198wms.2;
 Wed, 16 Jun 2021 12:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=57QuwfNFQF45MeRmgEn2+QU+HZswI6iRsUmjkMXdpMQ=;
 b=fG+XMJLSb5qrpcLC2K/JRSzaXZl91VVQmuG6Y/NcNhOkfYwsqVrUiC057mYVrp02xt
 +Q011UdDDU7D/eEG4ygf1s3OosbdWFJj9CABvnMNZI5pSM3nlm8QaTCOC+Y07ED36xQH
 +Pn0oIrxQ6GF5zZfEUypN/NOzUqtlxWgj171KdTHdZsMy3+IU5rNrYKWlS5KK376y3vJ
 s4B6ogsuk7xiZqGCexqB0dEC8KyVp5miQe4MrQPS7L/q6hYNq/J1nBkfiZXTdnIWpqHz
 LKOr4MWra+ZXUNx/VF8GygOJgFbq3JJJhjtSxl+mXDaewYO5x6ojKL0/DUFBmZ4jkv0x
 919Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=57QuwfNFQF45MeRmgEn2+QU+HZswI6iRsUmjkMXdpMQ=;
 b=gOzuCBxZ2y/dulmHmgEXM7NX8ET5TV8ffQW5U0xNvsFZzkVCmYdfrtozWWP+oF4R9y
 aISas4/B01M/LvjVIGLc4wRZUoCDUrshEdYEUTBWyIQTUvOLqlpbgqrCr5p5+mT5XvHN
 6EBTa2Lgt9nfo1Mxvk84fumcdsUhn+Q/WqCqM1BTUIiQ06ut4x7bfvimXoEE4/bi+imS
 TcdQErG9ISkyGcpkFORWbbwGnbEu1+n4O164L6TbkhYWAIESFp5UC+yBgUxxiUlGmcpS
 BFAi8N12wDsAQlp5541vfhBaYOzd4rI8DZKHR+GQmtdbs2TTLZrtOlaUvJM+vw1X844y
 c/8w==
X-Gm-Message-State: AOAM531bVL43pYGYa9GJrMIbmcrVUwBpWRPPK7oYX8NLHxhccRtI6jsw
 ECzqJQPGyGn3QIH29rRtFnc0XT4Nj9WDrw==
X-Google-Smtp-Source: ABdhPJxD2UIJ3tTdAXgoUaBfYjXgvcuDXcfGQTeCzLVb7d7bSvLR+TLdG+HlHoc5rxpByTnC/kRlFA==
X-Received: by 2002:a7b:c25a:: with SMTP id b26mr631483wmj.31.1623871400829;
 Wed, 16 Jun 2021 12:23:20 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id p13sm1952080wrt.89.2021.06.16.12.23.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jun 2021 12:23:19 -0700 (PDT)
Subject: Re: [PATCH v3 01/13] hw/input/lm832x: Move lm832x_key_event()
 declaration to "lm832x.h"
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210616161418.2514095-1-f4bug@amsat.org>
 <20210616161418.2514095-2-f4bug@amsat.org>
 <ac4302f3-9dad-45e0-50dc-3114509448d5@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <44e354a8-92fc-23a3-3f46-6b700f5eaf4e@amsat.org>
Date: Wed, 16 Jun 2021 21:23:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <ac4302f3-9dad-45e0-50dc-3114509448d5@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.17,
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
Cc: Corey Minyard <cminyard@mvista.com>,
 "Signed-off-by : Frederic Konrad" <frederic.konrad@adacore.com>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/16/21 8:38 PM, Richard Henderson wrote:
> On 6/16/21 9:14 AM, Philippe Mathieu-Daudé wrote:
>> lm832x_key_event() is specific go LM832x devices, not to the
>> I2C bus API. Move it out of "i2c.h" to a new header.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>   include/hw/i2c/i2c.h      |  3 ---
>>   include/hw/input/lm832x.h | 26 ++++++++++++++++++++++++++
>>   hw/arm/nseries.c          |  1 +
>>   hw/input/lm832x.c         |  1 +
>>   MAINTAINERS               |  1 +
>>   5 files changed, 29 insertions(+), 3 deletions(-)
>>   create mode 100644 include/hw/input/lm832x.h
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> 
> 
>> +#ifndef HW_INPUT_LM832X
>> +#define HW_INPUT_L
> 
> You fix this error in the next patch, but better here.

Oops! I didn't noticed... Something got wrong while re-ordering
during rebase, thanks for telling me!

