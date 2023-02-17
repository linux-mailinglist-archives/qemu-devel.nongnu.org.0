Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 925AE69AFB9
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 16:46:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pT2vO-0007pL-US; Fri, 17 Feb 2023 10:45:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pT2vK-0007op-Bk
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 10:45:22 -0500
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pT2vI-0003bh-5Y
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 10:45:22 -0500
Received: by mail-oi1-x22d.google.com with SMTP id bg20so1117518oib.9
 for <qemu-devel@nongnu.org>; Fri, 17 Feb 2023 07:45:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9zayra838Yie6KN+r0BYDlvm93hWztDg7msmRUTD1gE=;
 b=meQ+sjPJhbX/JmXO0WRKXS+pWy8DMlA/u2F14ZGFo/tWx/pWZ0jbKW6GPwkr7gU6Kd
 FnGW6wPR/OQXDNW3Ykk/gRH+lXo3JVR7rneITPqrO/Ok5gUrrjH2OQjq5K5hnQABri1J
 dD+V6LZf5+xdCyZUFjUaFszNIjD3qFrVUQkg4+z/NqzqiCWGaNdjnuz9qugeeAfhlxxk
 2hNaSctvxsGjPSMqqfjw+yLHN0kCd5qteWBYu92UV4mgYSYNVzR+ZUuSeSUArGkgJmNN
 nlSyWvcaKxxY+7+JKfhVTS8/RjPS1Pz4sc/jLfWb2Dgt9WrbHtrSKApXWeicAE8Z8IIm
 ascg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9zayra838Yie6KN+r0BYDlvm93hWztDg7msmRUTD1gE=;
 b=t5LDVD3froccYstAMPJ/f6QReY+sLHYBT0HhL30op6bZC7t3+jqFnkATaimompwZWF
 lprewjQhThmcdj6OhOGW3puTpKnwwGKwAW1oYsQHsMLtLkPEjLd7Z4jrkr56tcICcJK1
 LPZM/Cv26OddviIcJAwJ2/VcC6z+kaHdyVODnq5xz7CXXqKFiFe9OlONe90d36RarcmC
 Eb5mYcnB8965GQWLZFsBZlDCnfhpORpsv8ET6hZ32RLwDQzLDwys6uXLdPv/CVrBDh6g
 3y8s9wHALJIcs1E5TbUANMGvfEZX5vR6U7AplHu+qBTQ0XQ293lMrVlShUXqG62xbaVP
 SJnA==
X-Gm-Message-State: AO0yUKWeWW/wScdtDs+Tt+AE8tg7hUtmYZObSp9nplxIDp2B3ZRqVEGt
 wqwWPxQ0eYmH1ir2RsCe0+Lizw==
X-Google-Smtp-Source: AK7set83xznkB4byFVB9bXmuhfz7BHY1h3u6c/S/r52tevl9R65OpIQnPRY1ldjGFxetDFoNa+qfkg==
X-Received: by 2002:a54:4505:0:b0:378:8312:c0b8 with SMTP id
 l5-20020a544505000000b003788312c0b8mr597046oil.19.1676648717688; 
 Fri, 17 Feb 2023 07:45:17 -0800 (PST)
Received: from [192.168.68.107] ([191.19.40.109])
 by smtp.gmail.com with ESMTPSA id
 i11-20020aca3b0b000000b0037d80581a35sm1885176oia.34.2023.02.17.07.45.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Feb 2023 07:45:17 -0800 (PST)
Message-ID: <4acbf2e9-ce6d-7d02-0435-485ecf3184b0@ventanamicro.com>
Date: Fri, 17 Feb 2023 12:45:14 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH] [PATCH] disas/riscv Fix ctzw disassemble
Content-Language: en-US
To: Ivan Klokov <ivan.klokov@syntacore.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Alistair.Francis@wdc.com, palmer@dabbelt.com
References: <20230217151459.54649-1-ivan.klokov@syntacore.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230217151459.54649-1-ivan.klokov@syntacore.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22d;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x22d.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.256,
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



On 2/17/23 12:14, Ivan Klokov wrote:
> Due to typo in opcode list, ctzw is disassembled as clzw instruction.
> 

The code was added by 02c1b569a15b4b06a so I believe a "Fixes:" tag is in
order:

Fixes: 02c1b569a15b ("disas/riscv: Add Zb[abcs] instructions")

> Signed-off-by: Ivan Klokov <ivan.klokov@syntacore.com>
> ---
>   disas/riscv.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/disas/riscv.c b/disas/riscv.c
> index ddda687c13..d0639cd047 100644
> --- a/disas/riscv.c
> +++ b/disas/riscv.c
> @@ -1644,7 +1644,7 @@ const rv_opcode_data opcode_data[] = {
>       { "minu", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
>       { "max", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
>       { "maxu", rv_codec_r, rv_fmt_rd_rs1_rs2, NULL, 0, 0, 0 },
> -    { "clzw", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
> +    { "ctzw", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
>       { "clzw", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },


Does the order matter here? This patch is putting ctzw before clzw, but 20 lines
or so before we have "clz" after "ctz".

If the order doesn't matter I think it would be nice to put ctzw after clzw.



Thanks,


Daniel

>       { "cpopw", rv_codec_r, rv_fmt_rd_rs1, NULL, 0, 0, 0 },
>       { "slli.uw", rv_codec_i_sh5, rv_fmt_rd_rs1_imm, NULL, 0, 0, 0 },

