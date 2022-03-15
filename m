Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 887F54D9B5B
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 13:37:12 +0100 (CET)
Received: from localhost ([::1]:59552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU6QJ-0003AV-5R
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 08:37:11 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nU6Kx-00010J-TY; Tue, 15 Mar 2022 08:31:41 -0400
Received: from [2607:f8b0:4864:20::435] (port=36542
 helo=mail-pf1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nU6Kt-0003nT-O7; Tue, 15 Mar 2022 08:31:39 -0400
Received: by mail-pf1-x435.google.com with SMTP id z16so19436900pfh.3;
 Tue, 15 Mar 2022 05:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=XxgXFFdysbfYbYzd4ACTJnemyMWhUDbxdBW5pvBAIvM=;
 b=TyZSvxdmU0ysT7OTDOKWsfJPPVHBEMNt7tkd4YX7grmK24nnPfm91nA5CJLRU5/+WT
 Jc7KxJIrxWCF+boHKjuoo0VzfYZHGV78FPZbtwBSY+ADFyjJ3ND+Ng2o7oNabWPi0I72
 hNjapYskHSkXpJIgE/up9tj6aisSxo0wJTJR3wlGdW6wB3QyAql5gMkxyRRtRWz2KqUN
 efAiREuu5nDazVDGZQk5UiHFHkfAHTdxbnQvphTZjyrGgQXOW7qCG5ueUm6ryU6u3Y9y
 C0ZNwffvbgxqVAHxEjQc31WeqeFIzb40Hm7enACPP+33iHmn5aEPOraNUyc6lmkhK6x5
 UuWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=XxgXFFdysbfYbYzd4ACTJnemyMWhUDbxdBW5pvBAIvM=;
 b=nMBe7bZJ3pipKNRDDyltQgm9GXVEiDeu6NPPgy++kg+uJFymA7FrGKUgODNgbQ4j6Z
 4Z2HZdEAoV8Wv6zi6TxiZfw2e6iPqP7CApSpxNdCTbkUqz4UssiVDxtrr+NzobuGwBu/
 ChOsbo0vYR+pm0Np5WL2p9rCBGiLocySSn4t/6H55CXj7ssIMNYAtcV/5yCDKjRzmMlA
 lpzE1bGsJo0FT//psg1DyfzKfrf2t8Dkq0bMDPYPH95JP0Bk5/kULteO3s3v4548seoZ
 v9bqsUbXeO3dqQeV3bb4wZQayAsJVHNviDYAHH1jRsD+3cFPfMSPPU1tGqjGZhdOzr9Q
 8MoA==
X-Gm-Message-State: AOAM530T9+TQENvyZnjcBiVQnTGq369srCVnSCyVOB/UXTH9NYttngPD
 NeptSOf2+KRsdbA/OlJsif0=
X-Google-Smtp-Source: ABdhPJxH6BQO9KW262SnIfZcHJH0MeVAmcqYv16KaMJV6H5xnNyAFm6co8ESXxOwalUWnJbQmZP7Ng==
X-Received: by 2002:a63:5051:0:b0:374:5fd0:f131 with SMTP id
 q17-20020a635051000000b003745fd0f131mr24356679pgl.431.1647347493247; 
 Tue, 15 Mar 2022 05:31:33 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 a38-20020a056a001d2600b004f72acd4dadsm24366525pfx.81.2022.03.15.05.31.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Mar 2022 05:31:32 -0700 (PDT)
Message-ID: <6c7bdb98-ad58-e48e-caa5-a9747b8ad90b@gmail.com>
Date: Tue, 15 Mar 2022 13:31:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH v1 7/8] semihosting: clean up handling of expanded argv
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20220315121251.2280317-1-alex.bennee@linaro.org>
 <20220315121251.2280317-8-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220315121251.2280317-8-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::435
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x435.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: fam@euphon.net, berrange@redhat.com, sw@weilnetz.de,
 richard.henderson@linaro.org, f4bug@amsat.org, qemu-arm@nongnu.org,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15/3/22 13:12, Alex Bennée wrote:
> Another cleanup patch tripped over the fact we weren't being careful
> in our casting. Fix the casts, allow for a non-const and switch from
> g_realloc to g_renew.
> 
> The whole semihosting argument handling could do with some tests
> though.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   semihosting/config.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/semihosting/config.c b/semihosting/config.c
> index 137171b717..50d82108e6 100644
> --- a/semihosting/config.c
> +++ b/semihosting/config.c
> @@ -51,7 +51,7 @@ typedef struct SemihostingConfig {
>       bool enabled;
>       SemihostingTarget target;
>       Chardev *chardev;
> -    const char **argv;
> +    char **argv;
>       int argc;
>       const char *cmdline; /* concatenated argv */
>   } SemihostingConfig;
> @@ -98,8 +98,8 @@ static int add_semihosting_arg(void *opaque,
>       if (strcmp(name, "arg") == 0) {
>           s->argc++;
>           /* one extra element as g_strjoinv() expects NULL-terminated array */
> -        s->argv = g_realloc(s->argv, (s->argc + 1) * sizeof(void *));
> -        s->argv[s->argc - 1] = val;
> +        s->argv = g_renew(char *, s->argv, s->argc + 1);
> +        s->argv[s->argc - 1] = g_strdup(val);

Why strdup()?

>           s->argv[s->argc] = NULL;
>       }
>       return 0;


