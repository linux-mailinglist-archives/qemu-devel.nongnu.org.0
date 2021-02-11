Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33238318A2D
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 13:15:56 +0100 (CET)
Received: from localhost ([::1]:35712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAAt1-0004mb-7f
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 07:15:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lAAno-0003Ae-Sq
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 07:10:32 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:37042)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lAAnm-0004h1-ME
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 07:10:31 -0500
Received: by mail-ed1-x52a.google.com with SMTP id q2so6706875edi.4
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 04:10:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=N4d3YhUbzk5wSPJdDYATvEcDR/mxZWulaZ0Ln+70e7U=;
 b=udEwYOmO6NvpbE02ihoIxjbTYGD+kd1AvdzBR59A6SQtD7cmVD9UUaaPt67XAuKYwM
 H3HAKHV4DbPxajD17TrU555Ixmf4vjj16Fp/Ro3zzAFlq+EpZ7upmVsBSD9E6oo4+31v
 GWfK4jEA82XOe5W2WQ1SEs7lCMKBCwU3atyEUYIt4iidWBqm8AQrdNAtLilQIAwhss68
 AfiI9Ku01LGLwtl5kTD1cKcElWOXzMDEZGW+xpbmcjNsMUpHNMGcmpV1t47fAED/s50e
 T9b4e0iBYg87GBZwTnezkzl/tXPkwR+LsUzYvccxf6wOAvc3K9tlPF5YLGkdeDXTrmAZ
 HKKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=N4d3YhUbzk5wSPJdDYATvEcDR/mxZWulaZ0Ln+70e7U=;
 b=q25eaHom9HHUn2OQkf0AXxmoZRyU4+EYnVNX3hJaRRyLdEz3gn0TTA8mHaxQi6MY/1
 AEdf6StlKUFEZT30iGorqN2c3vQp8m59RhsP/9Rwq77//e9UVZLJ95RiVv3Nvixyot7c
 e8MCwBQ3JXrwsPthKSE3EL0tjHDTtUN/eDioXh0bVF9J5X5E8bRykcVbI32DMtaaH2KT
 wahXO90OKDcyIf1xk/3FCHkGGk50wnJ8vz1V/y+AYdjUCM+me3hydttbJOzs4odR3ziM
 TVTHVtI8WUjGyZCRP/s6WvXFTZ4yQjgmony1udYrjdJ/NfxjLhkj95yhmOO77fnLnsCu
 sNRQ==
X-Gm-Message-State: AOAM532b50odU+NY73hB+Uhx1u24379erU6S60+vm/pOdfItYeaJ/v5B
 Y9Mdj0Y4hIMts74QZtmO6L8=
X-Google-Smtp-Source: ABdhPJyihpIfv+ZtWCd72jyRB+yFYAwc9MUB+v60sJ2oeoB4fqaidTBrNE44+29lvZACBIJLx1bZsA==
X-Received: by 2002:a05:6402:6c7:: with SMTP id
 n7mr8161822edy.289.1613045428789; 
 Thu, 11 Feb 2021 04:10:28 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id i18sm3855896eds.19.2021.02.11.04.10.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Feb 2021 04:10:28 -0800 (PST)
Subject: Re: [PATCH v2 1/1] tricore: fixed faulty conditions for extr and imask
To: David Brenken <david.brenken@efs-auto.org>, qemu-devel@nongnu.org
References: <20210211115329.8984-1-david.brenken@efs-auto.org>
 <20210211115329.8984-2-david.brenken@efs-auto.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <fdd6bbdb-a943-3e38-3b83-9c4af95ff6fd@amsat.org>
Date: Thu, 11 Feb 2021 13:10:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210211115329.8984-2-david.brenken@efs-auto.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.211,
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
Cc: kbastian@mail.uni-paderborn.de, David Brenken <david.brenken@efs-auto.de>,
 Georg Hofstetter <georg.hofstetter@efs-auto.de>,
 Andreas Konopik <andreas.konopik@efs-auto.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi David and Andreas,

On 2/11/21 12:53 PM, David Brenken wrote:
> From: Andreas Konopik <andreas.konopik@efs-auto.de>

Here is a good place to explain why you need this change,
how did you noticed it (example of opcode and conditions
reaching this issue) - eventually provide a reproducer
(asm dump could be enough) - and also eventually a reference
to the manual (chapter, table) justifying your change.

See also:
https://tbaggery.com/2008/04/19/a-note-about-git-commit-messages.html
https://chris.beams.io/posts/git-commit/#why-not-how

> 
> Signed-off-by: Andreas Konopik <andreas.konopik@efs-auto.de>
> Signed-off-by: Georg Hofstetter <georg.hofstetter@efs-auto.de>
> Signed-off-by: David Brenken <david.brenken@efs-auto.de>
> ---
>  target/tricore/translate.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/target/tricore/translate.c b/target/tricore/translate.c
> index 7752630ac1..ebeddf8f4a 100644
> --- a/target/tricore/translate.c
> +++ b/target/tricore/translate.c
> @@ -5777,8 +5777,8 @@ static void decode_rcpw_insert(DisasContext *ctx)
>      switch (op2) {
>      case OPC2_32_RCPW_IMASK:
>          CHECK_REG_PAIR(r2);
> -        /* if pos + width > 31 undefined result */
> -        if (pos + width <= 31) {
> +        /* if pos + width > 32 undefined result */
> +        if (pos + width <= 32) {
>              tcg_gen_movi_tl(cpu_gpr_d[r2+1], ((1u << width) - 1) << pos);
>              tcg_gen_movi_tl(cpu_gpr_d[r2], (const4 << pos));
>          }
> @@ -6999,7 +6999,7 @@ static void decode_rrpw_extract_insert(DisasContext *ctx)
>  
>      switch (op2) {
>      case OPC2_32_RRPW_EXTR:
> -        if (pos + width <= 31) {
> +        if (pos + width <= 32) {
>              /* optimize special cases */
>              if ((pos == 0) && (width == 8)) {
>                  tcg_gen_ext8s_tl(cpu_gpr_d[r3], cpu_gpr_d[r1]);
> @@ -7021,7 +7021,7 @@ static void decode_rrpw_extract_insert(DisasContext *ctx)
>          break;
>      case OPC2_32_RRPW_IMASK:
>          CHECK_REG_PAIR(r3);
> -        if (pos + width <= 31) {
> +        if (pos + width <= 32) {
>              tcg_gen_movi_tl(cpu_gpr_d[r3+1], ((1u << width) - 1) << pos);
>              tcg_gen_shli_tl(cpu_gpr_d[r3], cpu_gpr_d[r2], pos);
>          }
> 


