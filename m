Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C46D2F03DD
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Jan 2021 22:38:47 +0100 (CET)
Received: from localhost ([::1]:40970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyLwc-0004Yt-BQ
	for lists+qemu-devel@lfdr.de; Sat, 09 Jan 2021 16:38:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kyLvq-00049P-Pk
 for qemu-devel@nongnu.org; Sat, 09 Jan 2021 16:37:58 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:35605)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kyLvp-0004vf-09
 for qemu-devel@nongnu.org; Sat, 09 Jan 2021 16:37:58 -0500
Received: by mail-wr1-x434.google.com with SMTP id r3so12403455wrt.2
 for <qemu-devel@nongnu.org>; Sat, 09 Jan 2021 13:37:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=HRlVPzJN8pqMFpsV1GZTKdVNWOLEireFa8gqtgX48O8=;
 b=FDHCr/X/g0gDlanquKtXRrd6gT7PtiZzGV0FlJLeUxVPKDMCZljMV9l/uX6sdbmcvR
 NGQxAHuvtDsQuSlnfi8uspLjyOd5DRR6qx2B/QX7bQs6xlLZPSTYKGqFGt8AXSqsWNLH
 2EYkfh3rP/L1DhJ5chgcH0xRKTG7AKxDL7Dt/F45PvomwPgCHEXDtKyyug2w9/YShcwD
 dKQX9Oo5YgrXW663eO1/g02WO6RvxYgzKlaHW5QyiRBVj3Ua6nC+Ep6pG5aVpy9AyiSp
 WUw0ooTWutunT38UAjT29jdxpTTa23O3SWD4+ogLo1r1aWV9CBTKwAvEPFqdMMZlZi+k
 lg4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HRlVPzJN8pqMFpsV1GZTKdVNWOLEireFa8gqtgX48O8=;
 b=IdxPvKLClrV1n0bl1sY6L6jsPdVu0bCu1PvDa3xcJjR4q+otdmBGZiGFksFF0hZdEN
 EwiIs1bvhgh/pbubW5kF7ovXgX6aJMdyvCVTQmTkyK53SiSkAFAn3OdtvFHkg8B46MV/
 vQTc+W/p1KNXyBB08HZQg6rCprK02y3mLjn/iB4S6Fvf/5d/kLxMVQQqja0o4iuB9Usq
 OHuLG+9GWSyXa73UTEb1Wu06kjPIlkgRmeJ7Qci2pB+kCQ2+nNMNas8eQC91UhUFbrut
 x/UDHs7SWwyH90t5JtUT939AWQubtHksvtTXS0eLzkHhQi+441ea+NHFvPdzgx1Wmtsp
 ET3g==
X-Gm-Message-State: AOAM533aL3qG4lUUWGHN0R4IqGdWNH7zdOjsJHBh9hxsm4ipxaheNR8w
 t0eQjV0sUdydKGwlIAcdNrE=
X-Google-Smtp-Source: ABdhPJyZAR3Ys4MrRuepKThq6zj5EgJLBZXodeekxJkcS+WACPS6cm9IUIQINOqIkjRtwzQCGbePqQ==
X-Received: by 2002:a5d:5704:: with SMTP id a4mr9611270wrv.37.1610228274974;
 Sat, 09 Jan 2021 13:37:54 -0800 (PST)
Received: from [192.168.1.36] (129.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.129])
 by smtp.gmail.com with ESMTPSA id g192sm16637006wme.48.2021.01.09.13.37.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Jan 2021 13:37:54 -0800 (PST)
Subject: Re: [PATCH v6 05/35] Hexagon (disas) disassembler
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1610080146-14968-1-git-send-email-tsimpson@quicinc.com>
 <1610080146-14968-6-git-send-email-tsimpson@quicinc.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <6da5929b-1c66-1e08-7998-1823aa716c60@amsat.org>
Date: Sat, 9 Jan 2021 22:37:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <1610080146-14968-6-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
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
> Add hexagon to disas/meson.build
> Add disas/hexagon.c
> Add hexagon to include/disas/dis-asm.h
> 
> Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
> ---
>  include/disas/dis-asm.h |  1 +
>  disas/hexagon.c         | 68 +++++++++++++++++++++++++++++++++++++++++++++++++
>  disas/meson.build       |  1 +
>  3 files changed, 70 insertions(+)
>  create mode 100644 disas/hexagon.c
> 
> diff --git a/include/disas/dis-asm.h b/include/disas/dis-asm.h
> index 2164762..1f54fc0 100644
> --- a/include/disas/dis-asm.h
> +++ b/include/disas/dis-asm.h
> @@ -459,6 +459,7 @@ int print_insn_xtensa           (bfd_vma, disassemble_info*);
>  int print_insn_riscv32          (bfd_vma, disassemble_info*);
>  int print_insn_riscv64          (bfd_vma, disassemble_info*);
>  int print_insn_rx(bfd_vma, disassemble_info *);
> +int print_insn_hexagon(bfd_vma, disassemble_info *);
>  
>  #ifdef CONFIG_CAPSTONE
>  bool cap_disas_target(disassemble_info *info, uint64_t pc, size_t size);
> diff --git a/disas/hexagon.c b/disas/hexagon.c
> new file mode 100644
> index 0000000..968f11c
> --- /dev/null
> +++ b/disas/hexagon.c
> @@ -0,0 +1,68 @@
> +/*
> + *  Copyright(c) 2019-2020 Qualcomm Innovation Center, Inc. All Rights Reserved.

2019-2021 :)

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

If possible please also include the SPDX identifier (or simply it):

SPDX-License-Identifier: GPL-2.0-or-later

> + */
> +
> +/*
> + * QEMU Hexagon Disassembler
> + */
> +
> +#include "qemu/osdep.h"
> +#include "disas/dis-asm.h"
> +#include "target/hexagon/cpu_bits.h"
> +
> +/*
> + * We will disassemble a packet with up to 4 instructions, so we need
> + * a hefty size buffer.
> + */
> +#define PACKET_BUFFER_LEN                   1028
> +
> +int print_insn_hexagon(bfd_vma memaddr, struct disassemble_info *info)
> +{
> +    uint32_t words[PACKET_WORDS_MAX];
> +    bool found_end = false;
> +    char buf[PACKET_BUFFER_LEN];
> +    int i;
> +
> +    for (i = 0; i < PACKET_WORDS_MAX && !found_end; i++) {
> +        int status = (*info->read_memory_func)(memaddr + i * sizeof(uint32_t),
> +                                               (bfd_byte *)&words[i],
> +                                               sizeof(uint32_t), info);
> +        if (status) {
> +            if (i > 0) {
> +                break;
> +            }
> +            (*info->memory_error_func)(status, memaddr, info);
> +            return status;
> +        }
> +        if (is_packet_end(words[i])) {
> +            found_end = true;
> +        }
> +    }
> +
> +    if (!found_end) {
> +        (*info->fprintf_func)(info->stream, "<invalid>");
> +        return PACKET_WORDS_MAX * 4;

I suppose 4 is sizeof(uint32_t), right?

> +    }
> +
> +    int len = disassemble_hexagon(words, i, memaddr, buf, PACKET_BUFFER_LEN);
> +    int slen = strlen(buf);

Per QEMU's CODING_STYLE.rst:

  Declarations
  ============

  Mixed declarations (interleaving statements and declarations within
  blocks) are generally not allowed; declarations should be at the
  beginning of blocks.

> +    if (buf[slen - 1] == '\n') {
> +        buf[slen - 1] = '\0';
> +    }
> +    (*info->fprintf_func)(info->stream, "%s", buf);
> +
> +    return len;
> +}
> diff --git a/disas/meson.build b/disas/meson.build
> index 09a8527..b7b659b 100644
> --- a/disas/meson.build
> +++ b/disas/meson.build
> @@ -6,6 +6,7 @@ common_ss.add(when: 'CONFIG_ARM_A64_DIS', if_true: files('arm-a64.cc'))
>  common_ss.add_all(when: 'CONFIG_ARM_A64_DIS', if_true: libvixl_ss)
>  common_ss.add(when: 'CONFIG_ARM_DIS', if_true: files('arm.c'))
>  common_ss.add(when: 'CONFIG_CRIS_DIS', if_true: files('cris.c'))
> +common_ss.add(when: 'CONFIG_HEXAGON_DIS', if_true: files('hexagon.c'))
>  common_ss.add(when: 'CONFIG_HPPA_DIS', if_true: files('hppa.c'))
>  common_ss.add(when: 'CONFIG_I386_DIS', if_true: files('i386.c'))
>  common_ss.add(when: 'CONFIG_LM32_DIS', if_true: files('lm32.c'))
> 

Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

With comments addressed:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

