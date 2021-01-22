Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5287E300AA2
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 19:11:05 +0100 (CET)
Received: from localhost ([::1]:54612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l30tk-0003ns-5B
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 13:11:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l30rz-00038w-PV
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 13:09:15 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:40041)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l30ry-0003TC-4o
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 13:09:15 -0500
Received: by mail-ej1-x633.google.com with SMTP id gx5so8937947ejb.7
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 10:09:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=OkyIsnDn/pawPrczEzdzL2PNyHlc7d4sbv6S8gbr0Hk=;
 b=p4oTIlrJCKXHdbbNtA8Zpn5QavPPN4YK0ZDsx4DZ7+hQ0OBPe3nxt0KPVMD9NGGSr1
 EJL6RZsGPjWxoPwZ0suVfykQfFZSfRhHq1W+f1gzJc0VesN7LpzAYdaIO6FDd9NXgam9
 wLATvLKpGYjMZszPwgsmhy99XG10mQE0J7FBhGarS4jLQ0dvBF6JDfIifK8SeHAyQxnq
 Ul+CEGDN8xqibYJRyBa3YO8IZynqrDWhX/ups4EQt1UWD2X6ZHmhSZNVtefLqaBtR8d6
 T1PcQX+zPxSggtevaKHMBIihkqK1hJtmqHOlPTK0zwOXIIfcYo2DJ/HwwIFaMWwg5ISc
 QyyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OkyIsnDn/pawPrczEzdzL2PNyHlc7d4sbv6S8gbr0Hk=;
 b=EoC+8S5LeQ/fmVXQicdsAGdeB3BGwr51zmz1V619Tw19beVsnfrLEE/z2BS85gWGrQ
 fQ9Lwjl+JAejsrwMKNnQIZjj23nRRNWAvyHKvvAr1vbqDncgjyVPoTjbQ98VFdGMX4E2
 uei+M1e+Y3u/bkjjpaFwW2B/19jAjJBSNl/7ce3yJDBZcq1z4HRldje69291+QFYuPjJ
 nAfOwBhqDckr/F7m2q3QTdnQZ8fzdaKe/esmPkW9or/xGgCga6kxAhepd1SkICLn7Gg1
 xxunjRWbY1DbU+kR4p7A6Gm3AztxWYSF+WEY/Un2PXXY3LU7EyPxIDyLgOI4Y8xUtEgR
 5+Ag==
X-Gm-Message-State: AOAM530ESJgnoVMePKEF1wYLW5AytcM7/js6j806YAXlsH5ZhqI8f1el
 gJGdu9AB9+/ZD1FCo249qVE=
X-Google-Smtp-Source: ABdhPJxUpQjfoaKkcGOepDfSaiS9SXEFJnzW0N3jYKBMmxEbuDtapbOlwOfwGMk0ZIXcWUm50wQYfA==
X-Received: by 2002:a17:906:2681:: with SMTP id
 t1mr3796627ejc.29.1611338952492; 
 Fri, 22 Jan 2021 10:09:12 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id h12sm5641325edb.16.2021.01.22.10.09.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Jan 2021 10:09:11 -0800 (PST)
Subject: Re: [PATCH v7 15/35] Hexagon (target/hexagon/arch.[ch]) utility
 functions
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1611113349-24906-1-git-send-email-tsimpson@quicinc.com>
 <1611113349-24906-16-git-send-email-tsimpson@quicinc.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <8e41b920-e7de-a7da-bba1-f8a649006955@amsat.org>
Date: Fri, 22 Jan 2021 19:09:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <1611113349-24906-16-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x633.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.221,
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
Cc: ale@rev.ng, alex.bennee@linaro.org, richard.henderson@linaro.org,
 laurent@vivier.eu, bcain@quicinc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Taylor,

On 1/20/21 4:28 AM, Taylor Simpson wrote:
> Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
> ---
>  target/hexagon/arch.h |  35 ++++++
>  target/hexagon/arch.c | 294 ++++++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 329 insertions(+)
>  create mode 100644 target/hexagon/arch.h
>  create mode 100644 target/hexagon/arch.c
> 
> diff --git a/target/hexagon/arch.h b/target/hexagon/arch.h
> new file mode 100644
> index 0000000..a8374a3
> --- /dev/null
> +++ b/target/hexagon/arch.h

Maybe rename "arch_utils.[ch]"?

> @@ -0,0 +1,35 @@
> +/*
> + *  Copyright(c) 2019-2021 Qualcomm Innovation Center, Inc. All Rights Reserved.
> + *
> + *  This program is free software; you can redistribute it and/or modify
> + *  it under the terms of the GNU General Public License as published by
> + *  the Free Software Foundation; either version 2 of the License, or
> + *  (at your option) any later version.
> + *
> + *  This program is distributed in the hope that it will be useful,
> + *  but WITHOUT ANY WARRANTY; without even the implied warranty of
> + *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + *  GNU General Public License for more details.
> + *
> + *  You should have received a copy of the GNU General Public License
> + *  along with this program; if not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#ifndef HEXAGON_ARCH_H
> +#define HEXAGON_ARCH_H
> +
> +#include "qemu/osdep.h"
> +#include "qemu/int128.h"
> +
> +extern uint64_t interleave(uint32_t odd, uint32_t even);
> +extern uint64_t deinterleave(uint64_t src);
> +extern uint32_t carry_from_add64(uint64_t a, uint64_t b, uint32_t c);
> +extern int32_t conv_round(int32_t a, int n);
> +extern void arch_fpop_start(CPUHexagonState *env);
> +extern void arch_fpop_end(CPUHexagonState *env);
> +extern int arch_sf_recip_common(float32 *Rs, float32 *Rt, float32 *Rd,
> +                                int *adjust, float_status *fp_status);
> +extern int arch_sf_invsqrt_common(float32 *Rs, float32 *Rd, int *adjust,
> +                                  float_status *fp_status);

(Again, no need for 'extern').

> +
> +#endif
> diff --git a/target/hexagon/arch.c b/target/hexagon/arch.c
> new file mode 100644
> index 0000000..c59cad5
> --- /dev/null
> +++ b/target/hexagon/arch.c
...

> +#define RAISE_FP_EXCEPTION \
> +    do {} while (0)            /* Not modelled in qemu user mode */

I don't understand why... Can you explain please?

> +
> +#define SOFTFLOAT_TEST_FLAG(FLAG, MYF, MYE) \
> +    do { \
> +        if (flags & FLAG) { \
> +            if (GET_USR_FIELD(USR_##MYF) == 0) { \
> +                SET_USR_FIELD(USR_##MYF, 1); \
> +                if (GET_USR_FIELD(USR_##MYE)) { \
> +                    RAISE_FP_EXCEPTION; \
> +                } \
> +            } \
> +        } \
> +    } while (0)
...

