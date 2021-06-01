Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 864AB396BE2
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 05:29:48 +0200 (CEST)
Received: from localhost ([::1]:51688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lnv6B-0002qL-KV
	for lists+qemu-devel@lfdr.de; Mon, 31 May 2021 23:29:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lnv4I-0001RE-Ij
 for qemu-devel@nongnu.org; Mon, 31 May 2021 23:27:50 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:53817)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lnv4H-0001we-1L
 for qemu-devel@nongnu.org; Mon, 31 May 2021 23:27:50 -0400
Received: by mail-wm1-x32c.google.com with SMTP id h3so7213838wmq.3
 for <qemu-devel@nongnu.org>; Mon, 31 May 2021 20:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=R7HFh4WT9k00aPUnvz/MM67Uo1fjsObx9Sgz2bPkf+g=;
 b=LAukbKx6GrQF1OZr8l+jR/cDDJlWS0iGzm6dmm1XquU4Ut1j5TIwx74J1ZkNlL/esf
 YtDBQxa9V9bxmM5gowtbQOvMHAEnWrxvYtXNVak8Slp0N9WySLyM7VG4disynjCI0bQt
 ivIp2sJYjiTOfXPYkw0ZZdXaYZnkgSbcYifC1tOdKLZ+XGQIPmdmMJBG5h70EeJx4l9g
 o9tUqn92FM2Mlzc+XqqsCifmzBQZAjjyT/qXVh+n15n2sjGD8z+SsQ6HrSae/RrGsqBJ
 y8zF03Zo+LprrPlmN2fdV0hvWzpZ27EFG83gJS52kSoPycd1sBba/BQw/GbJAvssIh1z
 /hNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=R7HFh4WT9k00aPUnvz/MM67Uo1fjsObx9Sgz2bPkf+g=;
 b=EuLdblnkdhZ+BLkZyetl555gFQoXNhqxTT2WqpLR6kf3ohesAIFENxcGsBpALxSuQb
 b8XZlauVEMnXzTLbhCC9oVYlIeGOfxyMwCcyQZcxM04q8SGQUchmYAatodfmEGRAGhvN
 +K5ypbhVYq1Z23E7nJSNTH4cMfqESXoNuWHfc1bdEKvvCj4WdC5HiRhHNhYno0J5Ka4S
 XFcbd9qW7Yhta+oj6WWxyarsWKfcs3G5oiYWqY51HDhsdLEV8RolHHfFlZX8G0vm/n27
 MdwIxz7SJ/ZZsX1MJSLE5kNDnyhBH6QhM9JZPFpTcBnAkk1xyrFHKWfQSXc6BubcPuYL
 l9og==
X-Gm-Message-State: AOAM531M+K5NIZeECtYGZ4DawhxFe/uoDqnVr6S3sQRdxsoh+9b90kku
 2FCBR3+IqLwU5ubZSse75Bc=
X-Google-Smtp-Source: ABdhPJyH/TuOGIam+mnNkuTBIZABv41bE2Bcwsaa6yw9lFz3Agrc4qiisS6+WYS9X5oNJxjiju+H5g==
X-Received: by 2002:a05:600c:1913:: with SMTP id
 j19mr1909250wmq.167.1622518067425; 
 Mon, 31 May 2021 20:27:47 -0700 (PDT)
Received: from [192.168.1.36] (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id f14sm1518577wry.40.2021.05.31.20.27.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 May 2021 20:27:46 -0700 (PDT)
Subject: Re: [PATCH 09/11] target/mips: Drop inline markers from msa_helper.c
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210527041405.391567-1-richard.henderson@linaro.org>
 <20210527041405.391567-10-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <13fd5411-5ea7-20d5-5eeb-9d0b5a7a06fe@amsat.org>
Date: Tue, 1 Jun 2021 05:27:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210527041405.391567-10-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.591,
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
Cc: mmorrell@tachyum.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/27/21 6:14 AM, Richard Henderson wrote:
> Some of these functions are quite large.
> Let the compiler decide whether to inline.
> 
> Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/mips/tcg/msa_helper.c | 262 ++++++++++++++++-------------------
>  1 file changed, 121 insertions(+), 141 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

