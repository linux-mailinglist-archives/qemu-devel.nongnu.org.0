Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B827E457CC9
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Nov 2021 11:07:39 +0100 (CET)
Received: from localhost ([::1]:46254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1moNHW-000636-Bn
	for lists+qemu-devel@lfdr.de; Sat, 20 Nov 2021 05:07:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1moNGF-0005FT-Sd
 for qemu-devel@nongnu.org; Sat, 20 Nov 2021 05:06:19 -0500
Received: from [2a00:1450:4864:20::335] (port=50726
 helo=mail-wm1-x335.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1moNGD-00042m-Fr
 for qemu-devel@nongnu.org; Sat, 20 Nov 2021 05:06:19 -0500
Received: by mail-wm1-x335.google.com with SMTP id 133so10699599wme.0
 for <qemu-devel@nongnu.org>; Sat, 20 Nov 2021 02:06:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=k6cdR4vuZiE7Myq1Bj2aLIpIlk7Vp6poJYIfrC8xqN8=;
 b=E/eQJJDEJ+dMa8RnitD2VEuKibkk5s5Y+RgBBLJfZ5cmgOFcbQLJQ1PUZ9b3tU9XYY
 MLyaq3paL3DzJFeghcqsqJ9S+FG2adzewYJwrbITnqg18D4jWDJ2M2p2QaF+fq0Ux0n9
 1Olbo7thvXmWfXLA/C9lINI4kXRhM3mlny/jQrCjcFVSVM6sHArHOXzwlMjpppKpoQop
 aE5DVbcLqJUzrfvdGOpf/tc1L0d2UaGlK8xQwo0eug2vJZDQ30/KosG4Eecsz/p5LyxH
 3eLnYYHOx9CX1yPURC5GlBCzGUyeh2gk4WJbG08ZOFzPSCeF9dJjtIVwqHsbrPqCDto0
 3ibg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=k6cdR4vuZiE7Myq1Bj2aLIpIlk7Vp6poJYIfrC8xqN8=;
 b=kGDazir43u0EuN1Z6KySis9FC19QjZ/l8e0N9CMX7IY4S+56302ijCOgaVIKxZrT28
 EywxYwZ1Q9m37v3J90b5qnnguwRrPgrWHWPgJzEs3yRKiFhh7q4hP19oKxQ0bNizPAGN
 /eakveKJ9OQDopbSXYGV7RXTizvhNZ2ooNk2+d+Gmt2Ma4KrrMpUnQoWLrSgPy2nlAay
 86wFgNYdKxfdT3Kw+Pcg4Au1M7W/wEqonUbrTCkHHJ8WMkEE9MPeKSrhZd8rk/bM46CW
 OT+gDd5Uf44Kw/8QuSGYROJDkHTCs6ev6lQZPNzZiHB0Y4O4oRqa6R7V3aQgQBJm8jSN
 FAHA==
X-Gm-Message-State: AOAM532/vFUv3Qw9yMVUzYCWrKBUj1OOnx2J/fI1UgKEc3weX+Q/ySyk
 1LmWqlwSnzrOHpcXPL8Z1VByAw==
X-Google-Smtp-Source: ABdhPJxdGHCufbfbkF89XCmmIenkJOqszsEsaVJG8t84WHsAaZKSuHoLVLzbaN8fU5NUiyAWgrjdcw==
X-Received: by 2002:a05:600c:1987:: with SMTP id
 t7mr8593377wmq.24.1637402775822; 
 Sat, 20 Nov 2021 02:06:15 -0800 (PST)
Received: from [192.168.8.104] (9.red-95-126-194.staticip.rima-tde.net.
 [95.126.194.9])
 by smtp.gmail.com with ESMTPSA id z18sm2335658wrq.11.2021.11.20.02.06.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 20 Nov 2021 02:06:15 -0800 (PST)
Subject: Re: [PATCH v11 18/26] linux-user: Add LoongArch specific structures
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <1637302410-24632-1-git-send-email-gaosong@loongson.cn>
 <1637302410-24632-19-git-send-email-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <228e4abf-6137-3e44-ed1d-918fbe2e0d6b@linaro.org>
Date: Sat, 20 Nov 2021 11:06:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <1637302410-24632-19-git-send-email-gaosong@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::335
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.625,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Xiaojuan Yang <yangxiaojuan@loongson.cn>, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/19/21 7:13 AM, Song Gao wrote:
> Signed-off-by: Song Gao <gaosong@loongson.cn>
> Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
> ---
>   linux-user/loongarch64/target_structs.h | 48 +++++++++++++++++++++++++++++++++
>   1 file changed, 48 insertions(+)
>   create mode 100644 linux-user/loongarch64/target_structs.h
> 
> diff --git a/linux-user/loongarch64/target_structs.h b/linux-user/loongarch64/target_structs.h
> new file mode 100644
> index 0000000..cc7928a
> --- /dev/null
> +++ b/linux-user/loongarch64/target_structs.h
> @@ -0,0 +1,48 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * LoongArch specific structures for linux-user
> + *
> + * Copyright (c) 2021 Loongson Technology Corporation Limited
> + */
> +
> +#ifndef LOONGARCH_TARGET_STRUCTS_H
> +#define LOONGARCH_TARGET_STRUCTS_H
> +
> +struct target_ipc_perm {
> +    abi_int __key;                      /* Key.  */
> +    abi_uint uid;                       /* Owner's user ID.  */
> +    abi_uint gid;                       /* Owner's group ID.  */
> +    abi_uint cuid;                      /* Creator's user ID.  */
> +    abi_uint cgid;                      /* Creator's group ID.  */
> +    abi_uint mode;                      /* Read/write permission.  */
> +    abi_ushort __seq;                   /* Sequence number.  */
> +    abi_ushort __pad1;
> +    abi_ulong __unused1;
> +    abi_ulong __unused2;
> +};

We should most definitely create a generic version of this file before we do any more 
replication.

The aarch64 version is generic, with copies in cris, hexagon, i386, m68k, microblaze, 
nios2, openrisc, riscv, and sh4.


r~

