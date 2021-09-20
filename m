Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19EF44118B3
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 17:58:25 +0200 (CEST)
Received: from localhost ([::1]:37422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSLgV-0005ae-KP
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 11:58:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSLe4-0004tM-6c
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 11:55:53 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:37380)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSLe2-0006eC-Fb
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 11:55:51 -0400
Received: by mail-pg1-x531.google.com with SMTP id 17so17800342pgp.4
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 08:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=2RphacPp5fHdr7CCdoSui0f8voOJJBLe2T4je8FxlLs=;
 b=QWjNBGvLUtztzW3SQ9Xl8Um+8eSHlpscza61Pm3FdBRyyXOa++jSrobnKasHlq6wXV
 7WaPC2/WPMG1SMPn3iA/qjisL4gufsQCo/EIznZ+jMHZJDj/gnrA4qCiz8LKkbAJQN5s
 mPlS1eogLXkv6NZDEIaInU65YU3VBPc4FKH1UgllKpueScFBQ4x4p2rBGqrsSR7yP26d
 4vW8Vsv07nF4yOh+MhTQZo25a18DF3GkM0yVLkG8FiGnuzJirJpcx39fRCl6oFjJbyYt
 R/Zdmx6ZQj0p7e9h8FsRaNtZFNlbAkvt34urXyRGJp2yULDNybaFAe4Wy6T9nnyCp6i0
 mpEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2RphacPp5fHdr7CCdoSui0f8voOJJBLe2T4je8FxlLs=;
 b=fRbU9LvpMLNe7pQ4Vv35sz6Dv/pz0CGWOfweXnekpcwSyrU0UOmlwQ0eAtxoSAsHGV
 awXjRWn9f3I/Mw/vHnSc634XMzRw5cyr7ZmiJvScWuFFzNXMLaoN9nhsOys83Jgr/ZIu
 QXZZUTACHEYCrL273c5KR9wYlh7eZUqbghYXa6juD9qbtFASv6LQwY9lU2q16K1H+YYF
 b+RFXn3w2dppSyMtQF1shqpcn7cPjxz0/F+aHngMkgMUdNJ9wWvDU3AG2iqXFFoEH7kT
 IdRKaWH9yLopvDuXzJc1OaSZJ9gFMvFsremL3adqdmjMUlwgI5UphZzrK4WGjVAkIiCW
 P/Xg==
X-Gm-Message-State: AOAM530HsX8jGhMJ3z/7eD5ZHlgoGlDdUa7ACRo6IrY3rQ3uPlF1ltA/
 K5wJcm6CLwQOdxAIMB9/m6p2ZG/yZOP6LQ==
X-Google-Smtp-Source: ABdhPJy+/owB5Aa41iKxGlmCESeXs3cN4ygoJ6/izu9mjdEVyPfqEa9nPAfZhCXYzsVIdeq2wSaojg==
X-Received: by 2002:aa7:954e:0:b0:438:a1c2:340d with SMTP id
 w14-20020aa7954e000000b00438a1c2340dmr26241365pfq.30.1632153348439; 
 Mon, 20 Sep 2021 08:55:48 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id b2sm15131623pfr.58.2021.09.20.08.55.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Sep 2021 08:55:48 -0700 (PDT)
Subject: Re: [PATCH 04/30] tcg/loongarch: Add generated instruction opcodes
 and encoding helpers
To: WANG Xuerui <git@xen0n.name>, qemu-devel@nongnu.org
References: <20210920080451.408655-1-git@xen0n.name>
 <20210920080451.408655-5-git@xen0n.name>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7f94f992-8d7d-ac50-2ab7-88c2b9cbb18f@linaro.org>
Date: Mon, 20 Sep 2021 08:55:46 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210920080451.408655-5-git@xen0n.name>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/20/21 1:04 AM, WANG Xuerui wrote:
> Signed-off-by: WANG Xuerui<git@xen0n.name>
> ---
>   tcg/loongarch/tcg-insn-defs.c.inc | 1080 +++++++++++++++++++++++++++++
>   1 file changed, 1080 insertions(+)
>   create mode 100644 tcg/loongarch/tcg-insn-defs.c.inc
> 
> diff --git a/tcg/loongarch/tcg-insn-defs.c.inc b/tcg/loongarch/tcg-insn-defs.c.inc
> new file mode 100644
> index 0000000000..413f7ffc12
> --- /dev/null
> +++ b/tcg/loongarch/tcg-insn-defs.c.inc
> @@ -0,0 +1,1080 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * LoongArch instruction formats, opcodes, and encoders for TCG use.
> + *
> + * Code generated by genqemutcgdefs from
> + *https://github.com/loongson-community/loongarch-opcodes,
> + * from commit bb5234081663faaefb6b921a7848b18e19519890.
> + * DO NOT EDIT.
> + */
> +

Acked-by: Richard Henderson <richard.henderson@linaro.org>


> +static int32_t encode_d_slot(LoongArchInsn opc, uint32_t d)
> +    __attribute__((unused));
> +
> +static int32_t encode_d_slot(LoongArchInsn opc, uint32_t d)

Just an FYI: you can add the attribute directly to the function definition like so

static int32_t __attribute__((unused))
encode_d_slot(LoongArchInsn opc, uint32_t d)
{
    ...
}


r~

