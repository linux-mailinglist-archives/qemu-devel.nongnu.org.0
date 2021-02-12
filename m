Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE318319765
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 01:24:26 +0100 (CET)
Received: from localhost ([::1]:60990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAMG1-0005SW-AX
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 19:24:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lAMEg-0004zZ-1f
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 19:23:04 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:40744)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lAMEe-00009b-6J
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 19:23:01 -0500
Received: by mail-wm1-x332.google.com with SMTP id o24so7436942wmh.5
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 16:22:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=LB16y6IJjLXkIwl2BawYhE3rwlOP7kCIuaMMztBedVw=;
 b=nk/+rJmFpBQJplZdDSxRLeRxiOBsPnqTbdviQvHG5xq4b5aYu5vN+F+Xgzek568nGp
 hKlGfL5AzO/3NII6vXQGHTdhMVxR2wi8Y7ZILMbkxQKui94tmxk1JzQoGanWpk5S28ri
 4DZ2LhpbOZthSxT0rAv1Y2uZaHht0+NP2Cd7RGhypvOeb1W1NsOLwJ4TqNDB1LnHivQA
 ziKGckEEQu/zVkIx06J70BncBtsIscmLRva+H9OYG3zeEjd0KfVqMNGeVZPX3u51RRH0
 /8u32BvHjaB/PTw/ze3KIy+ygMlSgU9KiKNSWyB3cw2thsGBnhOBBFp4aRynT/Ah2/Ps
 lYAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LB16y6IJjLXkIwl2BawYhE3rwlOP7kCIuaMMztBedVw=;
 b=aiJAd7WmxF1Jnla4o8gkZ4cgYqiVgQ3b2rS3q0LPo+LGF9HJu7MFCE/IP7/QAXtCzE
 ugIsOscl0ZgGDBa+DuvsiFphE7K+hVBUe1iRZxxiLH/E0r76UD7GtPCQzMf6NrwT+70D
 07RY9wSABPcBrpi7/Qi0wNkQeEUxIanVoBr+ljHWl54KaFYiQ05rdq+JDB0SOKL7IdSh
 8KmIYdSvAKwit/g4w1qpO2H8cC2lzEmA9IBCMCYG1c9WdJrllG2XydzVLkjxNZ6Ygku2
 SsC7QuGCaLsRdkhydHeokDve5i59MsWwzBrzf7h42EVUQllz0s40+13lwfG0Owrjywfh
 YIIw==
X-Gm-Message-State: AOAM530Ayu988cPM7xdJlcjIaed8YOSf2HBhd4MpTZIYQwlUgi7MQC27
 geruhITfDRilg5GGWyfGb10=
X-Google-Smtp-Source: ABdhPJzjuUdPZc18UcY4NIo7O3g2oQf+FZOj7fH3rVYYtZsEbfpjLwu2F9RnzxLVP2TBrcCjw3kmEA==
X-Received: by 2002:a05:600c:4f07:: with SMTP id
 l7mr406534wmq.111.1613089377845; 
 Thu, 11 Feb 2021 16:22:57 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id d20sm6772304wrc.12.2021.02.11.16.22.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Feb 2021 16:22:57 -0800 (PST)
Subject: Re: [PATCH v8 26/35] Hexagon (target/hexagon) TCG generation
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1612763186-18161-1-git-send-email-tsimpson@quicinc.com>
 <1612763186-18161-27-git-send-email-tsimpson@quicinc.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <13a3eb3b-49e8-f62e-5222-e787911b69f8@amsat.org>
Date: Fri, 12 Feb 2021 01:22:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <1612763186-18161-27-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.119,
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

On 2/8/21 6:46 AM, Taylor Simpson wrote:
> Include the generated files and set up the data structures
> 
> Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
> ---
>  target/hexagon/genptr.h |  25 ++++
>  target/hexagon/genptr.c | 331 ++++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 356 insertions(+)
>  create mode 100644 target/hexagon/genptr.h
>  create mode 100644 target/hexagon/genptr.c
> 
> diff --git a/target/hexagon/genptr.h b/target/hexagon/genptr.h
> new file mode 100644
> index 0000000..c158005
> --- /dev/null
> +++ b/target/hexagon/genptr.h
> @@ -0,0 +1,25 @@
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
> +#ifndef HEXAGON_GENPTR_H
> +#define HEXAGON_GENPTR_H
> +
> +#include "insn.h"
> +
> +extern const SemanticInsn opcode_genptr[];
> +
> +#endif
> diff --git a/target/hexagon/genptr.c b/target/hexagon/genptr.c
> new file mode 100644
> index 0000000..7481f4c
> --- /dev/null
> +++ b/target/hexagon/genptr.c
> @@ -0,0 +1,331 @@
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
> +#define QEMU_GENERATE

Maybe move this ...

> +#include "qemu/osdep.h"
> +#include "qemu/log.h"
> +#include "cpu.h"
> +#include "internal.h"
> +#include "tcg/tcg-op.h"
> +#include "insn.h"
> +#include "opcodes.h"
> +#include "translate.h"

... here with a comment:

#define QEMU_GENERATE /* Used internally by macros.h */

> +#include "macros.h"

and undef?

#undef QEMU_GENERATE

> +#include "gen_tcg.h"
> +
> +static inline TCGv gen_read_preg(TCGv pred, uint8_t num)
> +{
> +    tcg_gen_mov_tl(pred, hex_pred[num]);
> +    return pred;
> +}
> +
> +static inline void gen_log_predicated_reg_write(int rnum, TCGv val, int slot)
> +{
> +    TCGv one = tcg_const_tl(1);
> +    TCGv zero = tcg_const_tl(0);
> +    TCGv slot_mask = tcg_temp_new();
> +
> +    tcg_gen_andi_tl(slot_mask, hex_slot_cancelled, 1 << slot);
> +    tcg_gen_movcond_tl(TCG_COND_EQ, hex_new_value[rnum], slot_mask, zero,
> +                           val, hex_new_value[rnum]);
> +#if HEX_DEBUG

Can you declare an 'bool hexagon_debug_enabled(void);' eventually
inlined, so we can get this code compiled (to avoid bitroting) using

  if (hexagon_debug_enabled()) {

> +    /* Do this so HELPER(debug_commit_end) will know */
> +    tcg_gen_movcond_tl(TCG_COND_EQ, hex_reg_written[rnum], slot_mask, zero,
> +                       one, hex_reg_written[rnum]);

  }

> +#endif
> +
> +    tcg_temp_free(one);
> +    tcg_temp_free(zero);
> +    tcg_temp_free(slot_mask);
> +}

Otherwise looks good.

Regards,

Phil.

