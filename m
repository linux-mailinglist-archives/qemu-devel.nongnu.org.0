Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2917C54692B
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 17:10:45 +0200 (CEST)
Received: from localhost ([::1]:39430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzgHc-0007rq-2D
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 11:10:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzgEr-0005K1-HS
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 11:07:53 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:37681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzgEq-0006Vd-21
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 11:07:53 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 3-20020a17090a174300b001e426a02ac5so2537270pjm.2
 for <qemu-devel@nongnu.org>; Fri, 10 Jun 2022 08:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=wljcM0bPKUmdGSGZ8rnh5wyWL4FuPQQVFqt0/8JHvrE=;
 b=iokSziiAdr3zcpZcVQMniD8B48/4tH4BVivckJGkkn16A+FZnbcrliTc/ffNPGk68o
 Hp1anz84tsw1z3ygoyWhYDIqJqR+Z3p+cofRLFKHZkxgaPDeM4AZTL99XaOB263d3hZT
 KYZoJUINurG4xsU292kJyN4DfDdfxPWlQhBF2MLGuYEd6Bt/2RQIlqtlIUgENDsUoJZR
 P/BJ48O73CmfKkSIsZQcv21AlxBEyGUr8o63wtv3La4L5QdYCE9pVvBekhgHlCuOsPnU
 3/oADtR/HskwxtLg0ty/ocQtghiwXEYexdefIH5FLA4zMHhxVTq5sOd6aPG0jo8t5B+4
 bPGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=wljcM0bPKUmdGSGZ8rnh5wyWL4FuPQQVFqt0/8JHvrE=;
 b=pKQ0l9WS2eji7c5qXmX+9sFcGA349NNDRjrGKKgC7iALsfes6rV5imS4hcIbMVfu3I
 S2c+f+WN0xYgAcavW69R638dGgbPvh83kPCw7ZSkE6NGm4i82o5ebqkLR1VVaVNJM55d
 wqjYeXpQmwBR/AJVoCB9jTRiJbqCf0sdPkQzx0ymouYM+1XnOe03+ZfKzjWHWULov9uX
 7mAlza/ZKVwWCx+RrvriEXZQny9LXbixJ3wL/WfmlG624RxTOPngduuSAUf3joFGgvYF
 HGa92wa94cT3JTjYKV1SPpyUHORPCImF5x0v9W0JQZRZCmFVNkN8di7Hj886H9tXNGqu
 IPvw==
X-Gm-Message-State: AOAM5301RNOMFQ7O4sWL6iPdMDJY8yXWkh94k9S5f5V5zuHwhSNXcRdr
 fp3AFulcuF3xRfLkiI/bZrg=
X-Google-Smtp-Source: ABdhPJzULSq9wP4KFQ0Fl5RWAXX2BVTA3whJ6rWoQX4zOhVvppknyFjryYe8sqYWLHy6EhIvrUOAHg==
X-Received: by 2002:a17:90a:e7d2:b0:1e8:97ac:da0b with SMTP id
 kb18-20020a17090ae7d200b001e897acda0bmr203587pjb.242.1654873670867; 
 Fri, 10 Jun 2022 08:07:50 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 bq8-20020a056a000e0800b0051b95c76752sm14949800pfb.153.2022.06.10.08.07.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jun 2022 08:07:50 -0700 (PDT)
Message-ID: <affd6807-b5c6-0ce9-0a02-3efb6c7a3767@amsat.org>
Date: Fri, 10 Jun 2022 17:07:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH v4 01/11] target/mips: Use an exception for semihosting
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220608051945.802339-1-richard.henderson@linaro.org>
 <20220608051945.802339-2-richard.henderson@linaro.org>
In-Reply-To: <20220608051945.802339-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102f.google.com
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

On 8/6/22 07:19, Richard Henderson wrote:
> Within do_interrupt, we hold the iothread lock, which
> is required for Chardev access for the console, and for
> the round trip for use_gdb_syscalls().
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/mips/cpu.h                         |  3 ++-
>   target/mips/tcg/tcg-internal.h            |  2 ++
>   target/mips/tcg/sysemu_helper.h.inc       |  2 --
>   target/mips/tcg/exception.c               |  1 +
>   target/mips/tcg/sysemu/mips-semi.c        |  4 ++--
>   target/mips/tcg/sysemu/tlb_helper.c       |  4 ++++
>   target/mips/tcg/translate.c               | 12 ++----------
>   target/mips/tcg/micromips_translate.c.inc |  6 +++---
>   target/mips/tcg/mips16e_translate.c.inc   |  2 +-
>   target/mips/tcg/nanomips_translate.c.inc  |  4 ++--
>   10 files changed, 19 insertions(+), 21 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


