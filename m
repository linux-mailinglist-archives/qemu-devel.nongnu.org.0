Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D98D05AEE3C
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 16:56:26 +0200 (CEST)
Received: from localhost ([::1]:33300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVa01-0001db-Po
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 10:56:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oVZox-0001rW-3J
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 10:44:59 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:34430)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oVZou-0006A2-SS
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 10:44:58 -0400
Received: by mail-pl1-x634.google.com with SMTP id f24so11556608plr.1
 for <qemu-devel@nongnu.org>; Tue, 06 Sep 2022 07:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=B1WD/NowgS9dnuAj8HrHjgC+ntZYe0FIRb0JFCOnXOY=;
 b=VkaqfpfDJyGfzCscbrYY+y+ru4BxnB70dDDd5h91sv7EHSdMHDZvh8H1wjKPmXW1Eo
 Qku019EjHeJ577/W5m7mM/ALzAT3d2itUFXjn8x9ZvsIFbVCLsh1rAeFk8eJn8KClUHP
 bvBCvAft4vyPvx5fSzRt52Y9hT0E7mh9WtyAecD0RUpXj2HpxHwjD7/i6frLvF1Ho5ig
 oyo6B+76oAanNBDRoTGtfLbs8SYA/90Hw8bsYcaZR81M01IRn+X+TZ+TicnjfnZqUsQj
 tlkjnJ4ajZGhWu5J04AjSJmGgui9juAjGwMpHIlkFhG5JBh6H3ZPBTy2Y1WCsrqmR8Xn
 Dk1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=B1WD/NowgS9dnuAj8HrHjgC+ntZYe0FIRb0JFCOnXOY=;
 b=UAFLhRPaob+L/vmA5lGzAlrNHv03zL7JcFJVqqR8EHQnv1JhdDVi7VcQ4aDyWfOd1R
 zdQFb2XoQAqxzfDbAe7wYuj+7uukTK83Io/2rePqkRu1Uxe331qX8ARr+5frphQBPdOe
 miYm0vxILTfUS7SYXIGfQ7D2YHo5sGQP83Ex+RDcf2faFjmdw1LKXpT2lA+8RwrdkZlM
 Bi+qglrtJOB9irncltlOyDgjNjKtCZtoY3iQ15U5zMX6xMWEipAsUi/TJ1YOVctRbSmx
 w8P4NY6/LyXX/7B7WJgDVKU6Pl2h5bN1TjOBL3kJ/qi49POS/+er10nn72MjIp/cvKMM
 qDpA==
X-Gm-Message-State: ACgBeo3CZvbXhU7POzre3L1IaWVlU8kbts9mPNYWULDgGHvxh+i4GXa4
 CUl/bc3Zy9WHcLWuhl734XuOkVAVKDI=
X-Google-Smtp-Source: AA6agR7Eahk1bqLgS/Cg9AGjYarAYaH/l3o++J8jxiK1Cj3N8dLXAB9VpSPeTrJJlZ0HhnT8hTEesA==
X-Received: by 2002:a17:902:cf0c:b0:172:a41b:63a8 with SMTP id
 i12-20020a170902cf0c00b00172a41b63a8mr54202863plg.161.1662475495653; 
 Tue, 06 Sep 2022 07:44:55 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 k5-20020a635605000000b0041c0c9c0072sm8479038pgb.64.2022.09.06.07.44.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Sep 2022 07:44:55 -0700 (PDT)
Message-ID: <4b30617b-23f9-d228-e163-1a7721b20f3b@amsat.org>
Date: Tue, 6 Sep 2022 16:44:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH v2 03/23] target/i386: Remove cur_eip argument to
 gen_exception
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: pbonzini@redhat.com
References: <20220906100932.343523-1-richard.henderson@linaro.org>
 <20220906100932.343523-4-richard.henderson@linaro.org>
In-Reply-To: <20220906100932.343523-4-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x634.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.752,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 6/9/22 12:09, Richard Henderson wrote:
> All callers pass s->base.pc_next - s->cs_base, which we can just
> as well compute within the function.  Note the special case of
> EXCP_VSYSCALL in which s->cs_base didn't have the subtraction,
> but cs_base is always zero in 64-bit mode, when vsyscall is used.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/i386/tcg/translate.c | 26 +++++++++++++-------------
>   1 file changed, 13 insertions(+), 13 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

