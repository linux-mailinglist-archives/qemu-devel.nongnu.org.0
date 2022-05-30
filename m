Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C92D538095
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 16:24:20 +0200 (CEST)
Received: from localhost ([::1]:55784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvgJf-0005VD-4K
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 10:24:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvgDJ-0006m5-So
 for qemu-devel@nongnu.org; Mon, 30 May 2022 10:17:46 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:35533)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvgDI-0006Or-B8
 for qemu-devel@nongnu.org; Mon, 30 May 2022 10:17:45 -0400
Received: by mail-pl1-x632.google.com with SMTP id c2so10453043plh.2
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 07:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=JgqYqm9yEQ7lN1Jl2NPxURKikphqMlTiT7Ll4ForkUk=;
 b=AzmBZBq3QSYDZPbg8xjhsu/j8fJo13uq8ppwt9Dd2xbrbTSK/1IcRZ5sw8nTI6LCkX
 Ex16AfvDg/fFz/pbmI4JJ/V4JjOvAk2Fc9lb6urYenn2jbxMu8R9f1U4+7EIjpmvHkXT
 M4yRR68SPKNnYXa/gA8HJp4+ueZIxBObdrdDADE9TnPaUCvBSN7FnQQDwVUSOAZIZlcv
 pOeGq1bXvJlVgwq5oSFfyLJt5NBxb/81O1l5kwGr9CYxgISV5Sz6pz3MeV9LeOLy1NMa
 nZNLZC1ZYHsU4ytCVp33HphFGYwIcp+7MlwxC83E9WCkAGEbCuZvE9+/Kxl2Xh6aXHnR
 +nug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=JgqYqm9yEQ7lN1Jl2NPxURKikphqMlTiT7Ll4ForkUk=;
 b=IP9kWYUEXD2Kxfa0pXQVScoMcP9bch2fdW2QERDCcqAJqNdtsUYlWFpfKjC1PlUOXs
 I1vTFaGbk8h4TybMrl8JwiFI9wgJLPkPTiQNlrt7wf/hXi2D5TyRhGMDlceyjIHVZAIp
 S0iecr2zuRQMncnrsGn9LhWO4I8Ip/6yH6iG+cByV1MXsIOLCsKkasn0ZPx2tPpu6azz
 Dgsz+cXPqCQ4DRQ6XpvmqI4OCXoBwA2Sa0EpniNrs8xCNejwG6aEZXTkxxJzNucZI9Vc
 8eUCv19zMaYw/1GOnpxEAipB/gp+Mc4tbodpb9jDGOvY490Mtk308Oi3l01knkrrcmMD
 20UA==
X-Gm-Message-State: AOAM533N2/B/VmKrkSvXIkz3EvAz81gNBHQuxJCl56XUYdDp7wZBx2g3
 FXnqXWg3wTgm6miKHTJN5LmS/e3ZOTU=
X-Google-Smtp-Source: ABdhPJzsUYu9cM037bg9Qj9hKeHQj7qDnCpRqrteWf67e18I2psFEAnK6kCpNsbAwjbjfBWprXdJcw==
X-Received: by 2002:a17:902:cf05:b0:156:9d:ca01 with SMTP id
 i5-20020a170902cf0500b00156009dca01mr55954926plg.111.1653920261516; 
 Mon, 30 May 2022 07:17:41 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 a10-20020a17090a480a00b001e29a2a4abesm5251729pjh.31.2022.05.30.07.17.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 May 2022 07:17:40 -0700 (PDT)
Message-ID: <e35b5332-7bc5-1f44-d8c5-2193718ad592@amsat.org>
Date: Mon, 30 May 2022 16:17:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.1
Subject: Re: [PATCH] target/mips: Fix store adress of high 64bit in
 helper_msa_st_b()
Content-Language: en-US
To: nihui <shuizhuyuanluo@126.com>, qemu-devel@nongnu.org
References: <20220504023319.12923-1-shuizhuyuanluo@126.com>
In-Reply-To: <20220504023319.12923-1-shuizhuyuanluo@126.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x632.google.com
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

On 4/5/22 04:33, nihui wrote:
> This patch fix the issue that helper_msa_st_b() write high 64bit
> data to where the low 64bit resides, leaving high 64bit undefined.
> 
> Signed-off-by: Ni Hui <shuizhuyuanluo@126.com>
> ---
>   target/mips/tcg/msa_helper.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/mips/tcg/msa_helper.c b/target/mips/tcg/msa_helper.c
> index 4dde5d639a..736283e2af 100644
> --- a/target/mips/tcg/msa_helper.c
> +++ b/target/mips/tcg/msa_helper.c
> @@ -8329,7 +8329,7 @@ void helper_msa_st_b(CPUMIPSState *env, uint32_t wd,
>   
>       /* Store 8 bytes at a time.  Vector element ordering makes this LE.  */
>       cpu_stq_le_data_ra(env, addr + 0, pwd->d[0], ra);
> -    cpu_stq_le_data_ra(env, addr + 0, pwd->d[1], ra);
> +    cpu_stq_le_data_ra(env, addr + 8, pwd->d[1], ra);
>   }
>   
>   void helper_msa_st_h(CPUMIPSState *env, uint32_t wd,

Fixes: 68ad9260e0 ("target/mips: Use 8-byte memory ops for msa load/store")

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Queued to mips-next.

