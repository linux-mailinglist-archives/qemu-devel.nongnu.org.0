Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36DC33AF68D
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 22:02:54 +0200 (CEST)
Received: from localhost ([::1]:56228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvQ8D-00007R-94
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 16:02:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lvQ6q-0007b4-KM
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 16:01:28 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:33537)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lvQ6p-0005uV-3n
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 16:01:28 -0400
Received: by mail-wr1-x431.google.com with SMTP id d11so18630592wrm.0
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 13:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zMv4HpV47AEt2wGl+8xUTp29cn5MG7c+PIC5Tn9a84Q=;
 b=fTuMLzZ7HkuTpy0CLHrGJkyWEPlZhz2gBSJZWdXZE5AzbIarCGDbWm/rNiZLmL9Kcq
 JHJ2XIfTIalC5F4zkm+pgeXLlhTHABPzuX/XeQSl5pdR3Dgx75BBaNR7wUNVdrakgQjw
 IWENT5l2LwYWW4uhKA9grnYT1RjXm2d3LIEoMkDDw2R8B/TU2RYzB1jZoUAbvFg74EHb
 i8Mc/m9wKo3UlNr5TRl3Dc2+Gli+R8kMvV1UBsqKWmOofMa1lk7QZgWuL1BKd9+rdtU/
 MPwy9LhFVPaIOy24fMBLQCSzIHGe5ir5PlSWhzOA0gzaMV+TfShYbN8pTwFr6uPGqNdV
 7ulQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zMv4HpV47AEt2wGl+8xUTp29cn5MG7c+PIC5Tn9a84Q=;
 b=qcD0xDCNYGbXfOuaVPRCpP+Gp5FLxR33sj0XCFTNO+wwz4kUbFIte9P3QlkMjcpdjw
 Vg1jEdKzQ29A2MbW4Hm8sJVArBKrpxriGzuUVbGML1Eq9ZS+VVGGs/KjpDoPZvUSGiOr
 hhM+BFRa2p4xYR6rAoiaAfRPUV9uXtYuGm4CalN8Tqv5vlrXeefji6//B4rluZG+4u7b
 0Mde8le8oyhx2gVUj5K7ozUmu2ebbkDLj5/zzS99sgSh/g3OzY3Pb9opPgsyfcMFR+TJ
 K/PMIyuGyiLgG1rJBvOuAwVZDWXyGb5071f8KyHv5mKFiDfxZAua0+WmQ271SQcgW7Ex
 Fs2Q==
X-Gm-Message-State: AOAM531btbhgAts7MDvc6xCy+sLRHNInoAzmS8w6wiyUwg+ngbS+hcJa
 bcCqRlmnaPi44ekqmTZs64c=
X-Google-Smtp-Source: ABdhPJzwJztWPro9VNpNkKa77BvcL6sPJyC15XXnucRgWrY/VLQV/Qt7HkPoUPpV5zbSTKZiC/rGig==
X-Received: by 2002:adf:f68a:: with SMTP id v10mr145265wrp.366.1624305685748; 
 Mon, 21 Jun 2021 13:01:25 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id r1sm88446wmn.10.2021.06.21.13.01.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Jun 2021 13:01:24 -0700 (PDT)
Subject: Re: [PATCH v2 02/11] target/cris: Replace DISAS_TB_JUMP with
 DISAS_NORETURN
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210620213249.1494274-1-richard.henderson@linaro.org>
 <20210620213249.1494274-3-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <42a219d5-8ca3-b15b-7b79-2d57fd23cdf5@amsat.org>
Date: Mon, 21 Jun 2021 22:01:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210620213249.1494274-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Cc: edgar.iglesias@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/20/21 11:32 PM, Richard Henderson wrote:
> The only semantic of DISAS_TB_JUMP is that we've done goto_tb,
> which is the same as DISAS_NORETURN -- we've exited the tb.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/cris/translate.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/target/cris/translate.c b/target/cris/translate.c
> index bed7a7ed10..2ff4319dd1 100644
> --- a/target/cris/translate.c
> +++ b/target/cris/translate.c
> @@ -55,7 +55,6 @@
>  /* is_jmp field values */
>  #define DISAS_JUMP    DISAS_TARGET_0 /* only pc was modified dynamically */
>  #define DISAS_UPDATE  DISAS_TARGET_1 /* cpu state was modified dynamically */
> -#define DISAS_TB_JUMP DISAS_TARGET_2 /* only pc was modified statically */
>  #define DISAS_SWI     DISAS_TARGET_3

Can we #define DISAS_SWI DISAS_TARGET_2 in the same commit?

