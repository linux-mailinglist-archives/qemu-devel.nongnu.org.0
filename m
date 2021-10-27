Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2978943C758
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 12:07:27 +0200 (CEST)
Received: from localhost ([::1]:36870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mffqA-0007oI-0e
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 06:07:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mffod-00074A-1T
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 06:05:51 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:51987)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mffoa-0004tf-5a
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 06:05:50 -0400
Received: by mail-wm1-x330.google.com with SMTP id z200so1242197wmc.1
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 03:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=TYkRkgEy0zMjBO2m+Q+M80WgbaGKyeDCUALrOyoknqA=;
 b=aq6+p7Lb9bxSTwf8iRHgtslz87XTZi+zbr8aRpIXuNuSv8jBA9n1M0i/7sZfcVOlYb
 JKI85UO6hYzUeaeE+C7ENipDi+O5P9JvfSd4TsaVGFNC2vnJ+bISWL/rM2v76YZugnEb
 h81iLCL/axIKyUFJU/UQAehY8Kk/ZAN+awgKpUL5lJNozHQIwWoJv2IphSK2DUDfCxtp
 Em9vsbt85gqlE3arDZZ0UoiULUZt/GUASjgOIKiVruyvmrGXvI74nVJ1MgdmtjTcPa4i
 4/85uKSmY1SORIow84HxCsx2V+5taGzoNBz7KOlO6J42JI0/YJupfP1PayFeIYDdvRi7
 3IbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=TYkRkgEy0zMjBO2m+Q+M80WgbaGKyeDCUALrOyoknqA=;
 b=Rrlgi3FaMS5yP8hrOZN7PntdPtUYVwsRKwxS9c8PwvJg27DfZ731Yud1bn/wI3NHO4
 bDYmL/SGiSdn0lcWUOLLVNHdY/dPdSo9rbs6n+N2Vu0jW9ZeqoU/bbS1pBsyUjK9pfJ1
 JP6w37Zl4CU/akR1bLmAsL9FvW6I32D9VvcSyavriM/4xahuwv1rmuveA5tZPMDeyZ0u
 sklnfMiiwxidaeOX9pvCl4/YZ3WeGglY3ZdJU6zp9C09pYbcipIAfc6JPujKEEIp02O3
 Y39M5m6MTiaeGydtkVkEdLNSNtz4QIZuduZhPIUnRq80DpXy3ubu2IxfDkoWeVaIWqul
 jEog==
X-Gm-Message-State: AOAM532nvYuTk6WXPHnBeFJ+2fyw/RNnLvVH4zFWbm135eze6P/nRmuf
 xhOgxfbbdaGD4OdrYOvjt3Q=
X-Google-Smtp-Source: ABdhPJwhd/Rrfj/Oc5u+eGrXyEE+BZttDzBPn4E8qUVU7KebQuRYo1EEQJlc3wf0gWOhnq1iMl4YIA==
X-Received: by 2002:a05:600c:350f:: with SMTP id
 h15mr4726444wmq.62.1635329146468; 
 Wed, 27 Oct 2021 03:05:46 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id p12sm23310237wrr.67.2021.10.27.03.05.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Oct 2021 03:05:45 -0700 (PDT)
Message-ID: <f29fffef-e583-b3c2-617d-9fe4059b6993@amsat.org>
Date: Wed, 27 Oct 2021 12:05:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] Fix tcg_out_vec_op argument type
Content-Language: en-US
To: Miroslav Rezanina <mrezanin@redhat.com>, qemu-devel@nongnu.org
References: <20211027085629.240704-1-mrezanin@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211027085629.240704-1-mrezanin@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.215,
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
Cc: richard.henderson@linaro.org, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/27/21 10:56, Miroslav Rezanina wrote:
> Newly defined tcg_out_vec_op (34ef767609 tcg/s390x: Add host vector framework)
> for s390x uses pointer argument definition.
> This fails on gcc 11 as original declaration uses array argument:
> 
> In file included from ../tcg/tcg.c:430:
> /builddir/build/BUILD/qemu-6.1.50/tcg/s390x/tcg-target.c.inc:2702:42: error: argument 5 of type 'const TCGArg *' {aka 'const long unsigned int *'} declared as a pointer [-Werror=array-parameter=]
>  2702 |                            const TCGArg *args, const int *const_args)
>       |                            ~~~~~~~~~~~~~~^~~~
> ../tcg/tcg.c:121:41: note: previously declared as an array 'const TCGArg[16]' {aka 'const long unsigned int[16]'}
>   121 |                            const TCGArg args[TCG_MAX_OP_ARGS],
>       |                            ~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~
> In file included from ../tcg/tcg.c:430:
> /builddir/build/BUILD/qemu-6.1.50/tcg/s390x/tcg-target.c.inc:2702:59: error: argument 6 of type 'const int *' declared as a pointer [-Werror=array-parameter=]
>  2702 |                            const TCGArg *args, const int *const_args)
>       |                                                ~~~~~~~~~~~^~~~~~~~~~
> ../tcg/tcg.c:122:38: note: previously declared as an array 'const int[16]'
>   122 |                            const int const_args[TCG_MAX_OP_ARGS]);
>       |                            ~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Fixing argument type to pass build.

Similarly to commit 5e8892db93f ("tcg: Fix prototypes for tcg_out_vec_op
and tcg_out_op"), fix the argument type.

> Signed-off-by: Miroslav Rezanina <mrezanin@redhat.com>
> ---
>  tcg/s390x/tcg-target.c.inc | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

