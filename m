Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA9F02F0421
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Jan 2021 23:42:40 +0100 (CET)
Received: from localhost ([::1]:44588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyMwR-00064D-Ee
	for lists+qemu-devel@lfdr.de; Sat, 09 Jan 2021 17:42:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kyMvf-0005dk-O0
 for qemu-devel@nongnu.org; Sat, 09 Jan 2021 17:41:51 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:39085)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kyMvd-0001ys-RD
 for qemu-devel@nongnu.org; Sat, 09 Jan 2021 17:41:51 -0500
Received: by mail-wr1-x430.google.com with SMTP id c5so12430504wrp.6
 for <qemu-devel@nongnu.org>; Sat, 09 Jan 2021 14:41:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+Ek30evsZkta/5F/5YqGQdsxRuWcgHFdWmvkeQMXCrA=;
 b=U2Jwsre0b/lIbsWWXk0ie5pYfG85wLcLsB075yGEyIP5Z70nn99P0UnOencKWvCjku
 Z2Tm1OrXDQUSbOByFSTFAoANa8jVTwvbWiBk3Cd78TlCPBvSQljUL6UNR5ENMeimoXde
 KbVWtiz+mmmMsuSRDlNXYOT1CInquxYeOPwV1GLdzLmpFUJe4X5uTnALsPSvhqe5APVB
 AigwPiQS7hU+JGImgMbLPCdnqGXTrOV6o3KTkxMBE5PLl6NhOyLrVfL27I/T6r4Q1q9V
 NhDlEn43B9l7mmN85KRtU89hYoUgy6Hq/5LZxYaWrTVu9OgZBKcw+DSkEJwB3AschMhi
 L9dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+Ek30evsZkta/5F/5YqGQdsxRuWcgHFdWmvkeQMXCrA=;
 b=fS9VFsh++2HW4EoHD/rk7wOOQIkO/0Op5IidmB6HbObIea9JEUYmP0lxQ25ZWkz2F9
 tpYZzxClD62NoBEnQIHRASehYIbI/rBVSL+tfBhHcdOL0RM9FDAm3mPMqA/Q9T0wTAKD
 Y5/DO60iFefFOry0tFzxgUl/aiSQtEDIXN52fRUY9T0amnGc6wB9BjxwBTTxfo0OOP0w
 fr5sus6EmOBmOt2NWtkGyq5JMi5SH27kEaZYvLwyqdOTURLufgSxTOwZyWhGjLD7bvie
 S6+Ui1R+kikhTVJnmA6U4wQX5Eas4PhABlD/nLobyv76HX53362ES5LpGgjnfKHBZ/Ur
 KV2A==
X-Gm-Message-State: AOAM530B+tyacBqDXgVzn5WpNpbYAIcBVGIASEE3koU4nTVpvOzRBRs+
 0tVOXbL0gxrQ9N9B+R3SPP0=
X-Google-Smtp-Source: ABdhPJxvddLWyD2+sONLXbi/r08gftcsQt4fDELk8Xi1NKTzUo7Vq0mGk/YLuMd2nOqtXPGJQPMJmw==
X-Received: by 2002:a05:6000:1043:: with SMTP id
 c3mr9514912wrx.34.1610232107824; 
 Sat, 09 Jan 2021 14:41:47 -0800 (PST)
Received: from [192.168.1.36] (129.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.129])
 by smtp.gmail.com with ESMTPSA id m18sm18642546wrw.43.2021.01.09.14.41.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Jan 2021 14:41:46 -0800 (PST)
Subject: Re: [PATCH v6 14/35] Hexagon (target/hexagon) instruction printing
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1610080146-14968-1-git-send-email-tsimpson@quicinc.com>
 <1610080146-14968-15-git-send-email-tsimpson@quicinc.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <3f82176f-7e18-ebab-f9cd-7c6909e0375f@amsat.org>
Date: Sat, 9 Jan 2021 23:41:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <1610080146-14968-15-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.255,
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
Cc: ale@rev.ng, bcain@quicinc.com, richard.henderson@linaro.org,
 laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Taylor,

On 1/8/21 5:28 AM, Taylor Simpson wrote:
> Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
> ---
>  target/hexagon/printinsn.h |  28 ++++++++
>  target/hexagon/printinsn.c | 158 +++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 186 insertions(+)
>  create mode 100644 target/hexagon/printinsn.h
>  create mode 100644 target/hexagon/printinsn.c
> 
> diff --git a/target/hexagon/printinsn.h b/target/hexagon/printinsn.h
> new file mode 100644
> index 0000000..0e629b2
> --- /dev/null
> +++ b/target/hexagon/printinsn.h
> @@ -0,0 +1,28 @@
> +/*
> + *  Copyright(c) 2019-2020 Qualcomm Innovation Center, Inc. All Rights Reserved.

(Again, 2019-2021, SPDX).

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
> +#ifndef HEXAGON_PRINTINSN_H
> +#define HEXAGON_PRINTINSN_H
> +
> +#include "qemu/osdep.h"
> +#include "insn.h"
> +
> +extern void snprint_a_pkt_disas(char *buf, int n, Packet *pkt, uint32_t *words,
> +                                target_ulong pc);
> +extern void snprint_a_pkt_debug(char *buf, int n, Packet *pkt);
> +
> +#endif
> diff --git a/target/hexagon/printinsn.c b/target/hexagon/printinsn.c
> new file mode 100644
> index 0000000..8315d56
> --- /dev/null
> +++ b/target/hexagon/printinsn.c
...

> +void snprint_a_pkt_disas(char *buf, int n, Packet *pkt, uint32_t *words,
> +                         target_ulong pc)
> +{
> +    char tmpbuf[128];
> +    buf[0] = '\0';
> +    bool has_endloop0 = false;
> +    bool has_endloop1 = false;
> +    bool has_endloop01 = false;
> +
> +    for (int i = 0; i < pkt->num_insns; i++) {
> +        if (pkt->insn[i].part1) {
> +            continue;
> +        }
> +
> +        /* We'll print the endloop's at the end of the packet */
> +        if (pkt->insn[i].opcode == J2_endloop0) {
> +            has_endloop0 = true;
> +            continue;
> +        }
> +        if (pkt->insn[i].opcode == J2_endloop1) {
> +            has_endloop1 = true;
> +            continue;
> +        }
> +        if (pkt->insn[i].opcode == J2_endloop01) {
> +            has_endloop01 = true;
> +            continue;
> +        }
> +
> +        snprintf(tmpbuf, 127, "0x" TARGET_FMT_lx "\t", words[i]);
> +        strncat(buf, tmpbuf, n);
> +
> +        if (i == 0) {
> +            strncat(buf, "{", n);
> +        }
> +
> +        snprintinsn(tmpbuf, 127, &(pkt->insn[i]));
> +        strncat(buf, "\t", n);
> +        strncat(buf, tmpbuf, n);
> +
> +        if (i < pkt->num_insns - 1) {
> +            /*
> +             * Subinstructions are two instructions encoded
> +             * in the same word. Print them on the same line.
> +             */
> +            if (GET_ATTRIB(pkt->insn[i].opcode, A_SUBINSN)) {
> +                strncat(buf, "; ", n);
> +                snprintinsn(tmpbuf, 127, &(pkt->insn[i + 1]));
> +                strncat(buf, tmpbuf, n);
> +                i++;
> +            } else if (pkt->insn[i + 1].opcode != J2_endloop0 &&
> +                       pkt->insn[i + 1].opcode != J2_endloop1 &&
> +                       pkt->insn[i + 1].opcode != J2_endloop01) {
> +                pc += 4;
> +                snprintf(tmpbuf, 127, "\n0x" TARGET_FMT_lx ":  ", pc);
> +                strncat(buf, tmpbuf, n);
> +            }
> +        }
> +    }
> +    strncat(buf, " }", n);
> +    if (has_endloop0) {
> +        strncat(buf, "  :endloop0", n);
> +    }
> +    if (has_endloop1) {
> +        strncat(buf, "  :endloop1", n);
> +    }
> +    if (has_endloop01) {
> +        strncat(buf, "  :endloop01", n);
> +    }
> +    strncat(buf, "\n", n);
> +}
> +
> +void snprint_a_pkt_debug(char *buf, int n, Packet *pkt)
> +{
> +    char tmpbuf[128];
> +    buf[0] = '\0';
> +    int slot, opcode;
> +
> +    if (pkt->num_insns > 1) {
> +        strncat(buf, "\n{\n", n);
> +    }
> +
> +    for (int i = 0; i < pkt->num_insns; i++) {
> +        if (pkt->insn[i].part1) {
> +            continue;
> +        }
> +        snprintinsn(tmpbuf, 127, &(pkt->insn[i]));
> +        strncat(buf, "\t", n);
> +        strncat(buf, tmpbuf, n);
> +
> +        if (GET_ATTRIB(pkt->insn[i].opcode, A_SUBINSN)) {
> +            strncat(buf, " //subinsn", n);
> +        }
> +        if (pkt->insn[i].extension_valid) {
> +            strncat(buf, " //constant extended", n);
> +        }
> +        slot = pkt->insn[i].slot;
> +        opcode = pkt->insn[i].opcode;
> +        snprintf(tmpbuf, 127, " //slot=%d:tag=%s", slot, opcode_names[opcode]);
> +        strncat(buf, tmpbuf, n);
> +
> +        strncat(buf, "\n", n);
> +    }
> +    if (pkt->num_insns > 1) {
> +        strncat(buf, "}\n", n);
> +    }
> +}

Nowadays we prefer to use the GString rather than <string.h>.

Patch looks good, so:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

