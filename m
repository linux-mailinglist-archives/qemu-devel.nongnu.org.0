Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA4B538C91
	for <lists+qemu-devel@lfdr.de>; Tue, 31 May 2022 10:13:45 +0200 (CEST)
Received: from localhost ([::1]:48244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvx0a-0001aF-D7
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 04:13:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvwwc-0007Bh-UR
 for qemu-devel@nongnu.org; Tue, 31 May 2022 04:09:38 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:46629)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvwwX-00042f-1u
 for qemu-devel@nongnu.org; Tue, 31 May 2022 04:09:34 -0400
Received: by mail-pg1-x52d.google.com with SMTP id j21so12118036pga.13
 for <qemu-devel@nongnu.org>; Tue, 31 May 2022 01:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:cc:from:in-reply-to
 :content-transfer-encoding;
 bh=oJ4gKt7Ci+YHDgvPxg/nKqAtUxoWSTmcTJBoeAxJqQM=;
 b=dOcFJXwxYAPHGwTSu+Au+AH6DjJYlxBTTcFtVrLQIy4Rjs++rWt80K/jwoKmDx0JCv
 fW4uvBmOpnHba81/ONb9GxBgYb0MNoAeKoQ/w/p/AfhyrKkmGDTj6wqpdB1eeFtjC3D4
 60YxBBqca9OcfdCFY1v4Qas/l0uTreb86q2ETwuESbnNKPoK14c07Z4MqgCdhDEMiaZB
 WWROPCZ2VbUmFU4JRTfr/5csvIC0hmdc99jtzpOimTNSFJ/ur2I1a2OIAQmmmGrHQMbR
 aiENg1kYfnty/iEnPAPDpw5ZCo5dLF4jlqtow01r6cLEIPnQxO7f8/GCFI1vg7jDuKMO
 O2HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:cc:from:in-reply-to
 :content-transfer-encoding;
 bh=oJ4gKt7Ci+YHDgvPxg/nKqAtUxoWSTmcTJBoeAxJqQM=;
 b=uJJQ+KT+0PkH6zRYSm4dIFfDPJWOFIAgBeyEIGj2aGSBeEqS4GVVvNK8k8Jw0O9RKS
 iWAxEcxhaKooT8MXkYnYQPjNxhRV6URQyNiSp+W8dDlKtNNaVWnIKT9oDu/GVvaDWm1n
 R0vaBQ5fFarpKKgU8ipqsl2TAiAYImXpMP50ZSmDCl9ED9jIf7knJHC51xdaqKa/ljTu
 x6Ql2AX+CQVYiuL8CaC1z/5OAEqnh097Dhy3wrr9AisH7EyYvsp9obnCv12rshoxhiLj
 PPBHPbetom3gWX0inAUWojUKcmUqPsW0h4ctEQooWWZiWtta+KSkL4hPh+u5fhyGE5Ew
 ajZg==
X-Gm-Message-State: AOAM532CSSJu3GKvJ7gWpuM8b9wZCICvue8X1USydZIak49rk/Nl7wwh
 xjtJ0g8pFuGrVHlMxOQpDho4N8p1ies=
X-Google-Smtp-Source: ABdhPJxJ1CgyjEBXBOATev53VcgxkeNvkfmkXSvhCCnme/1UG6tp5Hb4313JDB947vLs+Cncv/25qg==
X-Received: by 2002:a63:834a:0:b0:3fc:5536:20c2 with SMTP id
 h71-20020a63834a000000b003fc553620c2mr2150047pge.27.1653984571294; 
 Tue, 31 May 2022 01:09:31 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 r22-20020a635d16000000b003db580384d6sm9641106pgb.60.2022.05.31.01.09.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 May 2022 01:09:30 -0700 (PDT)
Message-ID: <53fe7f0b-9dae-029b-f282-75be1fea1e83@amsat.org>
Date: Tue, 31 May 2022 10:09:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.1
Subject: Re: [PATCH 4/4] target/mips: Do not treat msa INSERT as NOP when wd
 is zero
Content-Language: en-US
To: nihui <shuizhuyuanluo@126.com>, qemu-devel@nongnu.org
References: <20220503130708.272850-1-shuizhuyuanluo@126.com>
 <20220503130708.272850-4-shuizhuyuanluo@126.com>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
In-Reply-To: <20220503130708.272850-4-shuizhuyuanluo@126.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 3/5/22 15:07, nihui wrote:
> From: Ni Hui <shuizhuyuanluo@126.com>
> 
> Only for msa COPY_U/COPY_S with wd zero, we treat it as NOP.
> 
> Move this special rule into COPY_U and COPY_S trans function.

Fixes: 97fe675519 ("target/mips: Convert MSA COPY_S and INSERT opcodes 
to decodetree")

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> Signed-off-by: Ni Hui <shuizhuyuanluo@126.com>
> ---
>   target/mips/tcg/msa_translate.c | 15 ++++++++++-----
>   1 file changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/target/mips/tcg/msa_translate.c b/target/mips/tcg/msa_translate.c
> index 92ccc6f921..0b3dd0957c 100644
> --- a/target/mips/tcg/msa_translate.c
> +++ b/target/mips/tcg/msa_translate.c
> @@ -603,11 +603,6 @@ static bool trans_msa_elm_fn(DisasContext *ctx, arg_msa_elm_df *a,
>           return true;
>       }
>   
> -    if (a->wd == 0) {
> -        /* Treat as NOP. */
> -        return true;
> -    }
> -
>       gen_msa_elm[a->df](cpu_env,
>                          tcg_constant_i32(a->wd),
>                          tcg_constant_i32(a->ws),
> @@ -624,6 +619,11 @@ static bool trans_msa_elm_fn(DisasContext *ctx, arg_msa_elm_df *a,
>   
>   static bool trans_COPY_U(DisasContext *ctx, arg_msa_elm_df *a)
>   {
> +    if (a->wd == 0) {
> +        /* Treat as NOP. */
> +        return true;
> +    }
> +
>       static gen_helper_piii * const gen_msa_copy_u[4] = {
>           gen_helper_msa_copy_u_b, gen_helper_msa_copy_u_h,
>           NULL_IF_MIPS32(gen_helper_msa_copy_u_w), NULL
> @@ -634,6 +634,11 @@ static bool trans_COPY_U(DisasContext *ctx, arg_msa_elm_df *a)
>   
>   static bool trans_COPY_S(DisasContext *ctx, arg_msa_elm_df *a)
>   {
> +    if (a->wd == 0) {
> +        /* Treat as NOP. */
> +        return true;
> +    }
> +
>       static gen_helper_piii * const gen_msa_copy_s[4] = {
>           gen_helper_msa_copy_s_b, gen_helper_msa_copy_s_h,
>           gen_helper_msa_copy_s_w, NULL_IF_MIPS32(gen_helper_msa_copy_s_d)


