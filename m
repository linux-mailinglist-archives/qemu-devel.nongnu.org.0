Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE61F517955
	for <lists+qemu-devel@lfdr.de>; Mon,  2 May 2022 23:40:41 +0200 (CEST)
Received: from localhost ([::1]:43320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nldma-0003fc-F8
	for lists+qemu-devel@lfdr.de; Mon, 02 May 2022 17:40:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nldl3-00028d-Mp
 for qemu-devel@nongnu.org; Mon, 02 May 2022 17:39:05 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:38857)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nldl2-0002e7-55
 for qemu-devel@nongnu.org; Mon, 02 May 2022 17:39:05 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 cx11-20020a17090afd8b00b001d9fe5965b3so527158pjb.3
 for <qemu-devel@nongnu.org>; Mon, 02 May 2022 14:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=zrdxsWih3LF/SUZTHUggfRXypJQLNqVQE75iUABYsj8=;
 b=MjPd6c8HQpc7sCwX4Djm0gEqp69s8kyBOMg2dm48WjGIzqA3pKkaEbxz3FDL4lsuCG
 Q9BXHcKtU7uQQERQPZPkVxMP/hDSscoPpvuVODSOsVDYo3a0IZ+szz/p+arIuZDuXR9R
 ztFenWGqCZkYEyqJ2myYYE7gkbJ1tSd3QmUy15+opIZHgnJAis6V7v3B1EWgjT+LLvT2
 AAbREljXm9jvbz6ivu2UM7nbve6WZ9swpd6/p290taOLSb4jb95RJT36K8qP7rY85dq1
 VVjiOHY4OWHc/IuF681TUzeQzixAdwq0veQk8lhxvnKAKFnt3fjhAZuK5IkkJa1gBteI
 tetw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=zrdxsWih3LF/SUZTHUggfRXypJQLNqVQE75iUABYsj8=;
 b=wuGPx0mpaX9GVzgV+EOBmLPuzY5IOs3nvXBGpalFHSfxk0Wv02sZInTxzRPmDyHigO
 WvnwZGR8Yw7WDyY9vKftrgyKExVjOptrBmRDr4yi4SBZfw58mjgWXa4Fzh9Jhd00zbxn
 qDncv1mjiRrH7knO8ckEzhVyH1M/PDxBcRHAdu7I0lCBxbXZUcJBCZvZfvRQ2/i0ZDQ5
 f07KV0lY2JPpcQMxn1zfV4j3UVjZTswwKkdHnc1f4YS2E79zA0QIi4F8U0GA6bf/0MTc
 hXK/m65LxOsiMhVqI6S9mEY4k6+j1j45K7yqrBo/LOjXG/OlHC8cML8jgpbQEUrgNHf8
 9cPw==
X-Gm-Message-State: AOAM530BhGQtCqMqeMhhkLDSmzxpJHt0h/rQnJMXIU36oY1dr+wVDpte
 k7HRmh6tKc1N8wnAa8zF7g3BKw==
X-Google-Smtp-Source: ABdhPJzzM8vRM/6geqLCFyd9r1AYgICd5FwjE1469f6PFjUGeezgcXB5xz8JRosX3xwPj6mn6JB9Ng==
X-Received: by 2002:a17:902:ef45:b0:155:cede:5a9d with SMTP id
 e5-20020a170902ef4500b00155cede5a9dmr13303023plx.93.1651527542106; 
 Mon, 02 May 2022 14:39:02 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 gb20-20020a17090b061400b001d9927ef1desm154161pjb.34.2022.05.02.14.39.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 May 2022 14:39:01 -0700 (PDT)
Message-ID: <51b5d3e2-2f4b-f004-7aad-fd607f793290@linaro.org>
Date: Mon, 2 May 2022 14:38:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 13/21] target/ppc: Remove msr_me macro
Content-Language: en-US
To: =?UTF-8?Q?V=c3=adctor_Colombo?= <victor.colombo@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, balaton@eik.bme.hu
References: <20220502143934.71908-1-victor.colombo@eldorado.org.br>
 <20220502143934.71908-14-victor.colombo@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220502143934.71908-14-victor.colombo@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 5/2/22 07:39, Víctor Colombo wrote:
> msr_me macro hides the usage of env->msr, which is a bad behavior
> Substitute it with FIELD_EX64 calls that explicitly use env->msr
> as a parameter.
> 
> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
> 
> ---
> 
> v2: Remove M_MSR_CM and use FIELD_EX64 instead
> Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
> ---
>   target/ppc/cpu.h        | 2 +-
>   target/ppc/mmu_common.c | 2 +-
>   target/ppc/mmu_helper.c | 2 +-
>   3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> index 294c61c9dc..8e652691cf 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h
> @@ -354,6 +354,7 @@ typedef enum {
>   #define MSR_RI   1  /* Recoverable interrupt                        1        */
>   #define MSR_LE   0  /* Little-endian mode                           1 hflags */
>   
> +FIELD(MSR, CM, MSR_CM, 1)

Patch title is wrong.


r~

