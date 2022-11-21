Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E83EF633087
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 00:12:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxFwM-0005Yi-3w; Mon, 21 Nov 2022 18:11:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oxFw9-0005Xl-7P
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 18:10:49 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oxFw7-0000YD-A2
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 18:10:48 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 c65-20020a1c3544000000b003cfffd00fc0so10001980wma.1
 for <qemu-devel@nongnu.org>; Mon, 21 Nov 2022 15:10:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NcMmMntvGtdRgWhORRV4LUrqrypQj3iL0L0msri+304=;
 b=CKQMdRZ3NjZukl9Sb6xirW6UzsPGp1YHszw3z0SdCT/wLIYEnePfC+AZ8thSqwOEX8
 uSAfupHSKlar/a04TCgkGC2PAy60UJ/CamooYScEzl5kdj8dVnuyaQ0GIk5xJP8QtdzX
 Rhs1OaAOs/cHtLHrgMtrTn//tQ/A/+3E4lcicYcqPN62gTwPTKUDVOBPrw0vYVqzKAOs
 xkj686rewYSc+xO78FKV5oQPqUrv7hS5v6blP6y3xsqX1G9HcPHmQhMIgxXPAT7Pkr1Z
 5zorpKBh6d6t0zO9rOWzRsfXQC2RM7L8fvydmBq+kbfQXIDL1Xhb70w/VFjWW2havpmD
 uekg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NcMmMntvGtdRgWhORRV4LUrqrypQj3iL0L0msri+304=;
 b=lbN8/lAdxmIeOTcHeQTYBMJfOLAnfGYQzHHfsgLYbBa53/0k5r5vnc9cQmy52cuW7P
 9K66ja7HrS52I9wdwFk/0bwAJuajEMVOoFUWMBHLDPu+KaE4O5R1xayfrcAqsd3lQq8I
 Z9sTS+T0too8cL1hvcRXF2+n5TGFLblywp7MFZLpkZ3M1ZaMyAEN+CSDQxEj63XJXBRq
 UVJ7ojrXcJ4JHfgiRN+dBvPnw4NQEXGqjVnqBxTJcNyTiBhhWEzXyebAwBTESBEOOYQS
 /ATZIbehuHz2MIANLkygrpVzgDRq5NtwlDpSQd64byfUDEBopz4usdd3ClWdM0C7vmBK
 l3tQ==
X-Gm-Message-State: ANoB5pmPprbF8OQ9Hr+arjosXtV2Ia17hMZwJrzdNQ39JBbj/Unq9vU1
 wC0KK787ZlbzxqLuWrfe+bInYw==
X-Google-Smtp-Source: AA0mqf7NQpwZa/axHz9xuIdxWG2MhPAUutVm2GxBnwzk3X5i5jS3dv8r1xIwAJRFQ3A9gRq0060VeQ==
X-Received: by 2002:a05:600c:3ca0:b0:3cf:615f:54fb with SMTP id
 bg32-20020a05600c3ca000b003cf615f54fbmr7526962wmb.76.1669072244476; 
 Mon, 21 Nov 2022 15:10:44 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 n21-20020a05600c4f9500b003cfd64b6be1sm25819469wmq.27.2022.11.21.15.10.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Nov 2022 15:10:43 -0800 (PST)
Message-ID: <1708fd03-d7ab-99f0-2c7d-25f582dac6ea@linaro.org>
Date: Tue, 22 Nov 2022 00:10:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH for-8.0 17/29] tcg/aarch64: Add have_lse, have_lse2
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20221118094754.242910-1-richard.henderson@linaro.org>
 <20221118094754.242910-18-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221118094754.242910-18-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
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

On 18/11/22 10:47, Richard Henderson wrote:
> Notice when the host has additional atomic instructions.
> The new variables will also be used in generated code.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/aarch64/tcg-target.h     |  3 +++
>   tcg/aarch64/tcg-target.c.inc | 10 ++++++++++
>   2 files changed, 13 insertions(+)


> diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
> index 001a71bbc0..cf5ee6f742 100644
> --- a/tcg/aarch64/tcg-target.c.inc
> +++ b/tcg/aarch64/tcg-target.c.inc
> @@ -13,6 +13,8 @@
>   #include "../tcg-ldst.c.inc"
>   #include "../tcg-pool.c.inc"
>   #include "qemu/bitops.h"
> +#include <asm/hwcap.h>

This doesn't build on Darwin:

In file included from ../../tcg/tcg.c:426:
tcg/aarch64/tcg-target.c.inc:16:10: fatal error: 'asm/hwcap.h' file not 
found
#include <asm/hwcap.h>
          ^~~~~~~~~~~~~

In file included from ../../accel/tcg/cputlb.c:1656:
../../accel/tcg/ldst_atomicity.c.inc:269:21: warning: value size does 
not match register size specified by the constraint and modifier 
[-Wasm-operand-widths]
             : "=&r"(r.u), "=&r"(fail) : "Q"(*p));
                     ^
../../accel/tcg/ldst_atomicity.c.inc:266:22: note: use constraint 
modifier "w"
         asm("0: ldxp %0, %R0, %2\n\t"
                      ^~
                      %w0

../../accel/tcg/ldst_atomicity.c.inc:902:9: error: invalid operand in 
inline asm: '0: ldxp $2, ${2:R}, $0	bic $2, $2, $4	bic ${2:R}, ${2:R}, 
${4:R}	orr $2, $2, $3	orr ${2:R}, ${2:R}, ${3:R}	stxp ${1:w}, $2, 
${2:R}, $0	cbnz ${1:w}, 0b'
     asm("0: ldxp %[t], %R[t], %[mem]\n\t"
         ^
../../accel/tcg/ldst_atomicity.c.inc:902:9: error: invalid operand in 
inline asm: '0: ldxp $2, ${2:R}, $0	bic $2, $2, $4	bic ${2:R}, ${2:R}, 
${4:R}	orr $2, $2, $3	orr ${2:R}, ${2:R}, ${3:R}	stxp ${1:w}, $2, 
${2:R}, $0	cbnz ${1:w}, 0b'
../../accel/tcg/ldst_atomicity.c.inc:902:9: error: invalid operand in 
inline asm: '0: ldxp $2, ${2:R}, $0	bic $2, $2, $4	bic ${2:R}, ${2:R}, 
${4:R}	orr $2, $2, $3	orr ${2:R}, ${2:R}, ${3:R}	stxp ${1:w}, $2, 
${2:R}, $0	cbnz ${1:w}, 0b'
../../accel/tcg/ldst_atomicity.c.inc:902:9: error: invalid operand in 
inline asm: '0: ldxp $2, ${2:R}, $0	bic $2, $2, $4	bic ${2:R}, ${2:R}, 
${4:R}	orr $2, $2, $3	orr ${2:R}, ${2:R}, ${3:R}	stxp ${1:w}, $2, 
${2:R}, $0	cbnz ${1:w}, 0b'
../../accel/tcg/ldst_atomicity.c.inc:902:9: error: invalid operand in 
inline asm: '0: ldxp $2, ${2:R}, $0	bic $2, $2, $4	bic ${2:R}, ${2:R}, 
${4:R}	orr $2, $2, $3	orr ${2:R}, ${2:R}, ${3:R}	stxp ${1:w}, $2, 
${2:R}, $0	cbnz ${1:w}, 0b'
../../accel/tcg/ldst_atomicity.c.inc:902:9: error: invalid operand in 
inline asm: '0: ldxp $2, ${2:R}, $0	bic $2, $2, $4	bic ${2:R}, ${2:R}, 
${4:R}	orr $2, $2, $3	orr ${2:R}, ${2:R}, ${3:R}	stxp ${1:w}, $2, 
${2:R}, $0	cbnz ${1:w}, 0b'
../../accel/tcg/ldst_atomicity.c.inc:902:9: error: invalid operand in 
inline asm: '0: ldxp $2, ${2:R}, $0	bic $2, $2, $4	bic ${2:R}, ${2:R}, 
${4:R}	orr $2, $2, $3	orr ${2:R}, ${2:R}, ${3:R}	stxp ${1:w}, $2, 
${2:R}, $0	cbnz ${1:w}, 0b'
../../accel/tcg/ldst_atomicity.c.inc:902:9: error: invalid operand in 
inline asm: '0: ldxp $2, ${2:R}, $0	bic $2, $2, $4	bic ${2:R}, ${2:R}, 
${4:R}	orr $2, $2, $3	orr ${2:R}, ${2:R}, ${3:R}	stxp ${1:w}, $2, 
${2:R}, $0	cbnz ${1:w}, 0b'
../../accel/tcg/ldst_atomicity.c.inc:902:9: error: unknown token in 
expression
<inline asm>:1:15: note: instantiated into assembly here
         0: ldxp x13, , [x9]
                      ^
In file included from ../../accel/tcg/cputlb.c:1656:
../../accel/tcg/ldst_atomicity.c.inc:902:9: error: invalid operand
     asm("0: ldxp %[t], %R[t], %[mem]\n\t"
         ^
<inline asm>:1:15: note: instantiated into assembly here
         0: ldxp x13, , [x9]
                      ^
In file included from ../../accel/tcg/cputlb.c:1656:
../../accel/tcg/ldst_atomicity.c.inc:903:32: error: unknown token in 
expression
         "bic %[t], %[t], %[m]\n\t"
                                ^
<inline asm>:3:6: note: instantiated into assembly here
         bic , ,
             ^
In file included from ../../accel/tcg/cputlb.c:1656:
../../accel/tcg/ldst_atomicity.c.inc:902:9: error: invalid operand in 
inline asm: '0: ldxp $2, ${2:R}, $0	bic $2, $2, $4	bic ${2:R}, ${2:R}, 
${4:R}	orr $2, $2, $3	orr ${2:R}, ${2:R}, ${3:R}	stxp ${1:w}, $2, 
${2:R}, $0	cbnz ${1:w}, 0b'
     asm("0: ldxp %[t], %R[t], %[mem]\n\t"
         ^
../../accel/tcg/ldst_atomicity.c.inc:902:9: error: invalid operand in 
inline asm: '0: ldxp $2, ${2:R}, $0	bic $2, $2, $4	bic ${2:R}, ${2:R}, 
${4:R}	orr $2, $2, $3	orr ${2:R}, ${2:R}, ${3:R}	stxp ${1:w}, $2, 
${2:R}, $0	cbnz ${1:w}, 0b'
../../accel/tcg/ldst_atomicity.c.inc:902:9: error: invalid operand in 
inline asm: '0: ldxp $2, ${2:R}, $0	bic $2, $2, $4	bic ${2:R}, ${2:R}, 
${4:R}	orr $2, $2, $3	orr ${2:R}, ${2:R}, ${3:R}	stxp ${1:w}, $2, 
${2:R}, $0	cbnz ${1:w}, 0b'
fatal error: too many errors emitted, stopping now [-ferror-limit=]


