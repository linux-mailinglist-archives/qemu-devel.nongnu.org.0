Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF1CF41403B
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 05:57:08 +0200 (CEST)
Received: from localhost ([::1]:40830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mStNb-0006PP-CK
	for lists+qemu-devel@lfdr.de; Tue, 21 Sep 2021 23:57:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mStMO-0005hL-4n
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 23:55:52 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:34428)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mStMM-0004Uv-Bl
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 23:55:51 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 on12-20020a17090b1d0c00b001997c60aa29so3054263pjb.1
 for <qemu-devel@nongnu.org>; Tue, 21 Sep 2021 20:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=NXf4HDmPNpgmG7LFWcHTwCgYV4pvD54xXt42dkiTfeA=;
 b=WowjsjNqCCY5zrGUTg9oHJFzXSgq+7L8WT+SnnlqUjDy/hsDExQy4e6TgAPSYVDI2d
 X6xwuDbXHm9PGYpo9sS917+DglcGuXYz+2t1Zdx/fhxG6dLrv6B2e9qufY5jHv+wQDAT
 NCSxKUhIMvCBMtcNPbkJzyYgRtIJMJiL/NRVHhAfbCHup7QTqluFzvBcoR6sThn6R+Tt
 ow3L19dfPX+dF4Sn9kgU5E5G16qoe+0TFIq7YVYEH687Unx2ZGH+O70jwT1TyS3wfx8w
 owI/Pay5EsC4KC/H3ErehPsAvEmUNs9koM9P68bdx+qFHUsWjWP5Kf9uYXPW/ssY4Tab
 UTbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NXf4HDmPNpgmG7LFWcHTwCgYV4pvD54xXt42dkiTfeA=;
 b=y0oCfrhInzoJ/wax7K5OYLV44dMXG2gqTiLzkRRH0ze7oOla8cwhUBxD4i9jLj/W4o
 WZ8dNX1GrCeByf+TbX0NqPvG0PFO7yV+MiqJ1JkFKazBLbp3Sf/P/ona7Yi2iQogc4FT
 nuFlvsgM3XOAFh47L4R3Esep8CTZqeZMuz8Sp+vJB117aoIf5DzhbKkTjf1y3BAKRN3s
 WonaT1/u0KQiTdgX7EHxg5+7cLC76TSQwvG1DaplMy/HQRZqTHhpkwFgxr8tKcqyZUNY
 HTVmluMdYeboWmkFlfX7iRmqFDRhrKaaAHuGzVoGTc0X0zvhDHzo/0785L1Cyw8gd5hp
 P3Rg==
X-Gm-Message-State: AOAM531Dop8ZIpynANhtNHlr4D593kQhgESKaRdj1e4iFMCsKhjhoU6+
 TsEwxrvCSiCGAA2OcgSVchlO7eoBK6laOw==
X-Google-Smtp-Source: ABdhPJywnVnCcWrRp5asVFTmmnz/mqtfeMp0zkQrWpj4MLIFdyhig3jz/WhvBJWrZtTuP4J2i+T0IQ==
X-Received: by 2002:a17:90a:354:: with SMTP id
 20mr8988568pjf.145.1632282948245; 
 Tue, 21 Sep 2021 20:55:48 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id v6sm567511pfv.83.2021.09.21.20.55.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Sep 2021 20:55:47 -0700 (PDT)
Subject: Re: [PATCH v2 03/30] tcg/loongarch64: Add the tcg-target.h file
To: WANG Xuerui <git@xen0n.name>, qemu-devel@nongnu.org
References: <20210921201915.601245-1-git@xen0n.name>
 <20210921201915.601245-4-git@xen0n.name>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e73b36c7-05c7-9f9d-0912-5f8d8517fe83@linaro.org>
Date: Tue, 21 Sep 2021 20:55:46 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210921201915.601245-4-git@xen0n.name>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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

On 9/21/21 1:18 PM, WANG Xuerui wrote:
> Signed-off-by: WANG Xuerui<git@xen0n.name>
> ---
>   tcg/loongarch64/tcg-target.h | 180 +++++++++++++++++++++++++++++++++++
>   1 file changed, 180 insertions(+)
>   create mode 100644 tcg/loongarch64/tcg-target.h

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

However...


> +#define TCG_TARGET_HAS_sub2_i32         0
> +#define TCG_TARGET_HAS_mulu2_i32        0
> +#define TCG_TARGET_HAS_muls2_i32        0
> +#define TCG_TARGET_HAS_muluh_i32        1
> +#define TCG_TARGET_HAS_mulsh_i32        1
> +#define TCG_TARGET_HAS_ext8s_i32        1
> +#define TCG_TARGET_HAS_ext16s_i32       1
> +#define TCG_TARGET_HAS_ext8u_i32        1
> +#define TCG_TARGET_HAS_ext16u_i32       1
> +#define TCG_TARGET_HAS_bswap16_i32      0

It might be better to enable these with the patch that adds the insns.

r~

