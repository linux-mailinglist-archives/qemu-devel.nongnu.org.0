Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B5BA6F07A5
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 16:41:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ps2n3-0005Ij-3M; Thu, 27 Apr 2023 10:40:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1ps2my-0005Hs-3w
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 10:40:04 -0400
Received: from rev.ng ([5.9.113.41])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1ps2mu-0005w4-UB
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 10:40:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:
 Cc:To:Subject:Reply-To:MIME-Version:Date:Message-ID:Sender:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ipxAvyfIh9XPFum/q33CDyWGpqoYTq0fKV7GXcBl2nE=; b=pRv2MOrtiST/N7oy3EuK4LSnF4
 o++xubfkcwj3pb2sGt/o0ubDGwbW4uvkgy1BQ9LwN78pBHRMhS0Lw8j7jDUGzPo9ObRD9+pRYOlrR
 1i640YqHEDArOva7gcNXqt0yswuPY4sNbJlq23oHzgT5ghzNek478slgAxBWDhDjwxok=;
Message-ID: <25c56b1b-6b9a-d04f-c70e-5e111ae148bb@rev.ng>
Date: Thu, 27 Apr 2023 16:39:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH 7/9] Hexagon (tests/tcg/hexagon) Add v69 HVX tests
Content-Language: en-US
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, philmd@linaro.org, ale@rev.ng,
 bcain@quicinc.com, quic_mathbern@quicinc.com
References: <20230426023018.1742266-1-tsimpson@quicinc.com>
 <20230426023018.1742266-8-tsimpson@quicinc.com>
Organization: rev.ng
In-Reply-To: <20230426023018.1742266-8-tsimpson@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=5.9.113.41; envelope-from=anjo@rev.ng; helo=rev.ng
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-to:  anjo@rev.ng
X-ACL-Warn: ,  Anton Johansson <anjo@rev.ng>
From:  Anton Johansson via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


On 4/26/23 04:30, Taylor Simpson wrote:
> The following instructions are tested
>      V6_vasrvuhubrndsat
>      V6_vasrvuhubsat
>      V6_vasrvwuhrndsat
>      V6_vasrvwuhsat
>      V6_vassign_tmp
>      V6_vcombine_tmp
>      V6_vmpyuhvs
>
> Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
> ---
>   tests/tcg/hexagon/v69_hvx.c       | 318 ++++++++++++++++++++++++++++++
>   tests/tcg/hexagon/Makefile.target |   3 +
>   2 files changed, 321 insertions(+)
>   create mode 100644 tests/tcg/hexagon/v69_hvx.c
>
> diff --git a/tests/tcg/hexagon/v69_hvx.c b/tests/tcg/hexagon/v69_hvx.c
> new file mode 100644
> index 0000000000..051e5420df
> --- /dev/null
> +++ b/tests/tcg/hexagon/v69_hvx.c
> @@ -0,0 +1,318 @@
> +/*
> + *  Copyright(c) 2023 Qualcomm Innovation Center, Inc. All Rights Reserved.
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
> +#include <stdio.h>
> +#include <stdint.h>
> +#include <stdbool.h>
> +#include <string.h>
> +#include <limits.h>
> +
> +int err;
> +
> +#include "hvx_misc.h"
> +
> +#define fVROUND(VAL, SHAMT) \
> +    ((VAL) + (((SHAMT) > 0) ? (1LL << ((SHAMT) - 1)) : 0))
> +
> +#define fVSATUB(VAL) \
> +    ((((VAL) & 0xffLL) == (VAL)) ? \
> +        (VAL) : \
> +        ((((int32_t)(VAL)) < 0) ? 0 : 0xff))
> +
> +#define fVSATUH(VAL) \
> +    ((((VAL) & 0xffffLL) == (VAL)) ? \
> +        (VAL) : \
> +        ((((int32_t)(VAL)) < 0) ? 0 : 0xffff))
> +
> +static void test_vasrvuhubrndsat(void)
> +{
> +    void *p0 = buffer0;
> +    void *p1 = buffer1;
> +    void *pout = output;
> +
> +    memset(expect, 0xaa, sizeof(expect));
> +    memset(output, 0xbb, sizeof(output));
> +
> +    for (int i = 0; i < BUFSIZE / 2; i++) {
> +        asm("v4 = vmem(%0 + #0)\n\t"
> +            "v5 = vmem(%0 + #1)\n\t"
> +            "v6 = vmem(%1 + #0)\n\t"
> +            "v5.ub = vasr(v5:4.uh, v6.ub):rnd:sat\n\t"
> +            "vmem(%2) = v5\n\t"
> +            : : "r"(p0), "r"(p1), "r"(pout)
> +            : "v4", "v5", "v6", "memory");
> +        p0 += sizeof(MMVector) * 2;
> +        p1 += sizeof(MMVector);
> +        pout += sizeof(MMVector);
> +
> +        for (int j = 0; j < MAX_VEC_SIZE_BYTES / 2; j++) {
> +            int shamt;
> +            uint8_t byte0;
> +            uint8_t byte1;
> +
> +            shamt = buffer1[i].ub[2 * j + 0] & 0x7;
> +            byte0 = fVSATUB(fVROUND(buffer0[2 * i + 0].uh[j], shamt) >> shamt);
> +            shamt = buffer1[i].ub[2 * j + 1] & 0x7;
> +            byte1 = fVSATUB(fVROUND(buffer0[2 * i + 1].uh[j], shamt) >> shamt);
> +            expect[i].uh[j] = (byte1 << 8) | (byte0 & 0xff);
> +        }
> +    }
> +
> +    check_output_h(__LINE__, BUFSIZE / 2);
> +}
> +
> +static void test_vasrvuhubsat(void)
> +{
> +    void *p0 = buffer0;
> +    void *p1 = buffer1;
> +    void *pout = output;
> +
> +    memset(expect, 0xaa, sizeof(expect));
> +    memset(output, 0xbb, sizeof(output));
> +
> +    for (int i = 0; i < BUFSIZE / 2; i++) {
> +        asm("v4 = vmem(%0 + #0)\n\t"
> +            "v5 = vmem(%0 + #1)\n\t"
> +            "v6 = vmem(%1 + #0)\n\t"
> +            "v5.ub = vasr(v5:4.uh, v6.ub):sat\n\t"
> +            "vmem(%2) = v5\n\t"
> +            : : "r"(p0), "r"(p1), "r"(pout)
> +            : "v4", "v5", "v6", "memory");
> +        p0 += sizeof(MMVector) * 2;
> +        p1 += sizeof(MMVector);
> +        pout += sizeof(MMVector);
> +
> +        for (int j = 0; j < MAX_VEC_SIZE_BYTES / 2; j++) {
> +            int shamt;
> +            uint8_t byte0;
> +            uint8_t byte1;
> +
> +            shamt = buffer1[i].ub[2 * j + 0] & 0x7;
> +            byte0 = fVSATUB(buffer0[2 * i + 0].uh[j] >> shamt);
> +            shamt = buffer1[i].ub[2 * j + 1] & 0x7;
> +            byte1 = fVSATUB(buffer0[2 * i + 1].uh[j] >> shamt);
> +            expect[i].uh[j] = (byte1 << 8) | (byte0 & 0xff);
> +        }
> +    }
> +
> +    check_output_h(__LINE__, BUFSIZE / 2);
> +}
> +
> +static void test_vasrvwuhrndsat(void)
> +{
> +    void *p0 = buffer0;
> +    void *p1 = buffer1;
> +    void *pout = output;
> +
> +    memset(expect, 0xaa, sizeof(expect));
> +    memset(output, 0xbb, sizeof(output));
> +
> +    for (int i = 0; i < BUFSIZE / 2; i++) {
> +        asm("v4 = vmem(%0 + #0)\n\t"
> +            "v5 = vmem(%0 + #1)\n\t"
> +            "v6 = vmem(%1 + #0)\n\t"
> +            "v5.uh = vasr(v5:4.w, v6.uh):rnd:sat\n\t"
> +            "vmem(%2) = v5\n\t"
> +            : : "r"(p0), "r"(p1), "r"(pout)
> +            : "v4", "v5", "v6", "memory");
> +        p0 += sizeof(MMVector) * 2;
> +        p1 += sizeof(MMVector);
> +        pout += sizeof(MMVector);
> +
> +        for (int j = 0; j < MAX_VEC_SIZE_BYTES / 2; j++) {
> +            int shamt;
> +            uint16_t half0;
> +            uint16_t half1;
> +
> +            shamt = buffer1[i].uh[2 * j + 0] & 0xf;
> +            half0 = fVSATUH(fVROUND(buffer0[2 * i + 0].w[j], shamt) >> shamt);
> +            shamt = buffer1[i].uh[2 * j + 1] & 0xf;
> +            half1 = fVSATUH(fVROUND(buffer0[2 * i + 1].w[j], shamt) >> shamt);
> +            expect[i].w[j] = (half1 << 16) | (half0 & 0xffff);

I think we want MAX_VEC_SIZE_BYTES / 4 as the upper bound for this loop, 
we currently
overflow since we're accessing words.

> +        }
> +    }
> +
> +    check_output_w(__LINE__, BUFSIZE / 2);
> +}
> +
> +static void test_vasrvwuhsat(void)
> +{
> +    void *p0 = buffer0;
> +    void *p1 = buffer1;
> +    void *pout = output;
> +
> +    memset(expect, 0xaa, sizeof(expect));
> +    memset(output, 0xbb, sizeof(output));
> +
> +    for (int i = 0; i < BUFSIZE / 2; i++) {
> +        asm("v4 = vmem(%0 + #0)\n\t"
> +            "v5 = vmem(%0 + #1)\n\t"
> +            "v6 = vmem(%1 + #0)\n\t"
> +            "v5.uh = vasr(v5:4.w, v6.uh):sat\n\t"
> +            "vmem(%2) = v5\n\t"
> +            : : "r"(p0), "r"(p1), "r"(pout)
> +            : "v4", "v5", "v6", "memory");
> +        p0 += sizeof(MMVector) * 2;
> +        p1 += sizeof(MMVector);
> +        pout += sizeof(MMVector);
> +
> +        for (int j = 0; j < MAX_VEC_SIZE_BYTES / 2; j++) {
> +            int shamt;
> +            uint16_t half0;
> +            uint16_t half1;
> +
> +            shamt = buffer1[i].uh[2 * j + 0] & 0xf;
> +            half0 = fVSATUH(buffer0[2 * i + 0].w[j] >> shamt);
> +            shamt = buffer1[i].uh[2 * j + 1] & 0xf;
> +            half1 = fVSATUH(buffer0[2 * i + 1].w[j] >> shamt);
> +            expect[i].w[j] = (half1 << 16) | (half0 & 0xffff);
Same here.

Otherwise,

Reviewed-by: Anton Johansson <anjo@rev.ng>


