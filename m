Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0DBF64F268
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 21:33:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6HNl-0006DY-IX; Fri, 16 Dec 2022 15:32:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6HNZ-0006CF-OK
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 15:32:26 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6HNX-0000kO-Tk
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 15:32:25 -0500
Received: by mail-ej1-x634.google.com with SMTP id t17so8860186eju.1
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 12:32:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zsJU7+qv99Qf7IDkCcA3nxZ5EeWP7uv6mPU0NhXKpFU=;
 b=t/sfPk7luqfZU60Zm6fc6I49cvcAgXoR4ipXoRtg5qgiQT9E8upMxxoq6nIjkdfIPY
 RPubvkjZmXwr6XAxWkYzzvF08dywyJS/iSmkKYwTEZ+bV3ZwaCeGNoaqy5sKXFRvyN7C
 dT1Zdr5SDLgh4l8b3XC9GUwEoBZCGtGlzHYUbI/jJgLgyU9RMqR2poN8NNGIPxGLI64b
 8KkIJxPkx2WIzgkoEu924YPXSEwYaHC4UUeAi6x25aCkeXsO+9bkJL+8kYNY8Q78DTw8
 z4NhqYHhJ4ozVBxcqUajMt/reve9P1PwKOciocyrchU6ZxwcZAWBrnauFtd7UbAoB+uU
 hV8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zsJU7+qv99Qf7IDkCcA3nxZ5EeWP7uv6mPU0NhXKpFU=;
 b=tBN0YiDjM1qaiLZC+MPFG1WTPzDQXsKO3Xg3XhbPV8Tn+QynlE+nP9iltUgoE/8+rs
 AnLvJulWzFGW+2tK6791ssPv4IrIOvFW6t3o7+dWyjqJd4jZZaC1+34HLffQ6QlO5uSR
 sqw/Ajyy+G2OAr+sfQeQLns4L7WsW/tnUWF+2PLz3ffk7JPYI8LowwcALOuma3KsSlYQ
 A6yArGZv7FKiMKIhyIWDTwksleeuD3tiKvZlVx3odm5AS2iSBe9DsdUjD/ZQ4aU3ALr8
 UMlUAhpwtEeJfBAdqbF5oFMDgsOt3SCQihgyabX5GpL434KLxYihLpcef2KFPd6xxmHf
 NcJQ==
X-Gm-Message-State: ANoB5pnBtl+W5pJFDwlo5axPrI5emA6xeDmsvi+TO0/HVTEcF9/S8fzS
 pNsnnMlukh2DclJdOh2Nl4bdRg==
X-Google-Smtp-Source: AA0mqf6XPgoSukG/2yuoViSwNPzbE4LP8vSeGtOmiMO4y1j39HP3iLSAAUO3duOZOQS8ARJlsIDfgQ==
X-Received: by 2002:a17:906:1e42:b0:7ad:e52c:12e6 with SMTP id
 i2-20020a1709061e4200b007ade52c12e6mr27420953ejj.41.1671222740770; 
 Fri, 16 Dec 2022 12:32:20 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 c15-20020a17090654cf00b00741a251d9e8sm1233027ejp.171.2022.12.16.12.32.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Dec 2022 12:32:20 -0800 (PST)
Message-ID: <6aef3061-cb81-bcb7-cad5-294e4cc88651@linaro.org>
Date: Fri, 16 Dec 2022 21:32:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH-for-8.0 0/4] ppc: Clean up few headers to make them target
 agnostic
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-ppc@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
 kvm@vger.kernel.org, Alexey Kardashevskiy <aik@ozlabs.ru>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, Greg Kurz
 <groug@kaod.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
References: <20221213123550.39302-1-philmd@linaro.org>
 <b5e03afa-0ab0-8b8c-e803-76848dce9034@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <b5e03afa-0ab0-8b8c-e803-76848dce9034@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 16/12/22 17:54, Daniel Henrique Barboza wrote:
> 
> 
> On 12/13/22 09:35, Philippe Mathieu-Daudé wrote:
>> Few changes in hw/ & target/ to reduce the target specificity
>> of some sPAPR headers.
>>
>> Philippe Mathieu-Daudé (4):
>>    target/ppc/kvm: Add missing "cpu.h" and "exec/hwaddr.h"
>>    hw/ppc/vof: Do not include the full "cpu.h"
>>    hw/ppc/spapr: Reduce "vof.h" inclusion
>>    hw/ppc/spapr_ovec: Avoid target_ulong spapr_ovec_parse_vector()
> 
> Patches 1-3 queued in https://gitlab.com/danielhb/qemu/tree/ppc-next.

Thanks!

> Patch 4 can use a few more comments.

Yes, I'm not sure yet how to improve it, but I'll work on it.

Regards,

Phil.

