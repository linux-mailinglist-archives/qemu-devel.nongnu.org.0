Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C204A6A14
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 03:44:04 +0100 (CET)
Received: from localhost ([::1]:33074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nF5co-0004rl-IY
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 21:44:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nF3hs-0005pU-Ac
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 19:41:08 -0500
Received: from [2607:f8b0:4864:20::52f] (port=44628
 helo=mail-pg1-x52f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nF3ho-0001Lu-BV
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 19:41:07 -0500
Received: by mail-pg1-x52f.google.com with SMTP id h23so16888740pgk.11
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 16:41:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Zce2SMUKbtdD1y5xBxhXJxIMDbbTO3D8mJY4KfPRq9k=;
 b=QKzLWM1kQxyrNgwBUQ1QrlIqHxbAR/kk+Hy8tca++SYv994UrV/JJslG4r9gO4tLQ6
 uJ094K+l4wUjWpkeIC2UIo3wzccI6HFQrJvbdM2sRLemDGIVuxaEEWrWHbRKNFEf/azS
 Cckz/JEALqiVP8oOjlMSDRN0L+pD/GMiv7U1gjpPJUdsADdZEpOXP/r9DdYDTgxeMPWg
 4mwXP2r5dwOb2a70hGUTKsphOkCqUChuhjmabfj2w/bQmyFzJ9iAHOe2w35+hEv5MATF
 Cm6689o50iirgYBBMilf1KxhryonoGmQTj7cfyOCAFls34NioRtyRkcFFKEocNUBHalW
 AgnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Zce2SMUKbtdD1y5xBxhXJxIMDbbTO3D8mJY4KfPRq9k=;
 b=gaBUs1R051sxNox8AbOkGNSf7l/7qFRUKJpMT3YJFw6NOb6e/1IHwCu8x6/4Kv2ccI
 ZHHH5t2owGONONBzOsUQVGaO3hiE/GWmQHQ008fpMtGAYK15ROuB9G3JWkWcyR1dI9gN
 FYsgoPoRWOUx86a2TtBsPZFgy73eux2QxMHlORMjH6j/yJRp92JStkHbDC2+YoMz9u6V
 vqr6cIjdhoxyRgEIMsux0+nOdzWGKJnTS6+5L6KIynVqvg4k9R4aeNh4MDsEreJZL/eZ
 tVdnd+LZ+P560JNEA2tFGcCNmR6zJLxsaV/e8uboLzttt8W7Ibk1QtOXfux7DhUaC45g
 bYRg==
X-Gm-Message-State: AOAM532Ozy6h0+be3CmODXi2v/EuDfuSx6KNkAuvCvsrIeLUp0v4kKeP
 0PTAyBPJnoI/pvhffzOO2ZwRwNeeYV/XobQb
X-Google-Smtp-Source: ABdhPJwsCiyw0Mnr3moXSe1bdHtCWeIZEdJfKNe+dwdjPi6MvKhOf+ZpaphslIZx/Ql6UMMLFN9R1A==
X-Received: by 2002:a63:87c3:: with SMTP id
 i186mr14103056pge.122.1643762460696; 
 Tue, 01 Feb 2022 16:41:00 -0800 (PST)
Received: from ?IPV6:2001:8003:3a49:fd00:91e3:5d6a:70ac:f94c?
 ([2001:8003:3a49:fd00:91e3:5d6a:70ac:f94c])
 by smtp.gmail.com with ESMTPSA id a3sm22637644pfk.73.2022.02.01.16.40.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Feb 2022 16:41:00 -0800 (PST)
Message-ID: <8a94cab6-599b-579d-dadd-6761f55b446f@linaro.org>
Date: Wed, 2 Feb 2022 11:40:55 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v5 6/7] target/riscv: Add XVentanaCondOps custom extension
Content-Language: en-US
To: Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Alistair Francis <alistair23@gmail.com>
References: <20220131110201.2303275-1-philipp.tomsich@vrull.eu>
 <20220131110201.2303275-7-philipp.tomsich@vrull.eu>
 <CAKmqyKPo+fk0piXOoifbCpNvGZahRpKaKPsEqBEOQWQDGg2+Yw@mail.gmail.com>
 <CAAeLtUApihoyOa1wmx-LN_OZtu5YaM_x0e+2ETFjBCKMD+z+Lg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAAeLtUApihoyOa1wmx-LN_OZtu5YaM_x0e+2ETFjBCKMD+z+Lg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Greg Favor <gfavor@ventanamicro.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Kito Cheng <kito.cheng@sifive.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/1/22 19:36, Philipp Tomsich wrote:
>>> +static bool gen_condmask(DisasContext *ctx, arg_r *a, TCGCond cond)
>>
>> This should also have a vendor prefix
> 
> This one is a static helper function inside a file
> ..._xventanacondops..._ and not visible outside the compilation unit.
> Do we really want to prefix such functions that have local scope as well?

This file is included, therefore the compilation unit is larger than you think.


r~

