Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B445ADA7C
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 23:03:49 +0200 (CEST)
Received: from localhost ([::1]:33476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVJG0-0001VR-0O
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 17:03:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oVJCV-0008K9-Gx
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 17:00:11 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:33434)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oVJCS-0001Gg-Uf
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 17:00:10 -0400
Received: by mail-pf1-x42d.google.com with SMTP id y29so9526502pfq.0
 for <qemu-devel@nongnu.org>; Mon, 05 Sep 2022 14:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=cDu70A7ZyPQCN5LWidnCs1/VbZsH6akbgWNi2qMl1N4=;
 b=NmAk1cmd2vpwsT+SckG6f1Javconnaih3tKTAk5tKSOR0zVyD4Oo2SeNm5mF+xA63t
 Ql6QMBHurtLVqetf4D5SiALklovhUfLQszampqHHVKkep0bJE5IRckeyUnZ8dbQcCn/2
 hOaJCsCy5CMzuPk6XD/jHUKr/ILFRzxzDcvTGf4l2FBCQMyaYl9trjNzGdQySxbP1xnb
 zOGAK6ipcCwj8aqrM463KS6mdoLNg0qI7K5XFftUpf8YS4Y7zJdnctH00nJwdMxmEYk3
 Qs0wy5LRUSqz4x7MEdT3Xn8RUaN+R2yxtMACBxEOTeylhmgosgI503klOEeLbvLEBL/l
 r8tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=cDu70A7ZyPQCN5LWidnCs1/VbZsH6akbgWNi2qMl1N4=;
 b=QWEdL8eXkgHwgwwAfSPYTVK8JWBFCEjyCj8kbrgD0n/fRXrBV0qJdTwAJl3O8KfK7U
 qx2NiwKBWQUoDCqFuQXb3MRGsQ/jegYCxhbpXEhFSnehKSnKkKZF1wzDSAu78Pd0YT4P
 JOuyvZq6oOdBQvBKtCSiXbuh9GF1EMpwDdM/t6fPzF2uIo4yhV+HelDG6TeFK4ekU4e3
 /e1yQrlwXLEx/+7/WjFGDz/FRwN+hBuxqW9PLyXKmMpv5C8b+1UpjjojXN5MG2/W/p8F
 E2veQ6TINCX8dPHprsCOA96zWC1RZWkBX8KzNbm3PAkUdJ6Ms5UGJhI8R2nyAmVbioDZ
 LDCg==
X-Gm-Message-State: ACgBeo1MAjqsQWSkWDcfMeCRvZS6q8C6J5LIw1d+ouDxCbf2jkIqcahV
 u4cGAAQ5E3qqO7hlh+Ws5mY=
X-Google-Smtp-Source: AA6agR5FEfFQk7WZPLjltF6vNddn62EbUIpyyQQAejQ3rY6Crkhy2xKlDD+jaBL8QBEH3lCgh2SW1w==
X-Received: by 2002:a63:4f65:0:b0:42c:6044:83c1 with SMTP id
 p37-20020a634f65000000b0042c604483c1mr29982618pgl.560.1662411607375; 
 Mon, 05 Sep 2022 14:00:07 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 ot17-20020a17090b3b5100b001fb3522d53asm10968952pjb.34.2022.09.05.14.00.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Sep 2022 14:00:06 -0700 (PDT)
Message-ID: <42456c1e-160c-df46-2aac-836568f94b94@amsat.org>
Date: Mon, 5 Sep 2022 23:00:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH] linux-user: fix bug about missing signum convert of
 sigqueue
Content-Language: en-US
To: fanwj@mail.ustc.edu.cn, qemu-devel@nongnu.org
Cc: laurent@vivier.eu, =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <7819f62a.51d7c.182f21781c5.Coremail.fanwj@mail.ustc.edu.cn>
In-Reply-To: <7819f62a.51d7c.182f21781c5.Coremail.fanwj@mail.ustc.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.716,
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

On 31/8/22 06:10, fanwj@mail.ustc.edu.cn wrote:
>  From 4ebe8a67ed7c4b1220957b2b67a62ba60e0e80ec Mon Sep 17 00:00:00 2001
> From: fanwenjie <fanwj@mail.ustc.edu.cn>
> Date: Wed, 31 Aug 2022 11:55:25 +0800
> Subject: [PATCH] linux-user: fix bug about missing signum convert of 
> sigqueue
> 
> Signed-off-by: fanwenjie <fanwj@mail.ustc.edu.cn>
> ---
>   linux-user/syscall.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index f409121202..3e5ab4f0b2 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -9690,7 +9690,7 @@ static abi_long do_syscall1(CPUArchState *cpu_env, 
> int num, abi_long arg1,
>               }
>               target_to_host_siginfo(&uinfo, p);
>               unlock_user(p, arg3, 0);
> -            ret = get_errno(sys_rt_sigqueueinfo(arg1, arg2, &uinfo));
> +            ret = get_errno(sys_rt_sigqueueinfo(arg1, 
> target_to_host_signal(arg2), &uinfo));

Fixes: 66fb9763af ("basic signal handling")

Date:   Sun Mar 23 01:06:05 2003 +0000

!@#% ALMOST 20 YEARS %#!@#$

Cc'ing Alex for an entry in the oldest bug fixed table.

>       case TARGET_NR_rt_tgsigqueueinfo:
> @@ -9703,7 +9703,7 @@ static abi_long do_syscall1(CPUArchState *cpu_env, 
> int num, abi_long arg1,
>               }
>               target_to_host_siginfo(&uinfo, p);
>               unlock_user(p, arg4, 0);
> -            ret = get_errno(sys_rt_tgsigqueueinfo(arg1, arg2, arg3, 
> &uinfo));
> +            ret = get_errno(sys_rt_tgsigqueueinfo(arg1, arg2, 
> target_to_host_signal(arg3), &uinfo));

Fixes: cf8b8bfc50 ("linux-user: add support for rt_tgsigqueueinfo() 
system call")

>           }
>           return ret;
>   #ifdef TARGET_NR_sigreturn
> -- 
> 

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

