Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B6B84DB046
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 14:02:56 +0100 (CET)
Received: from localhost ([::1]:50090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUTIk-0001Hy-NZ
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 09:02:54 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nUTEF-0006Q2-1N
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 08:58:15 -0400
Received: from [2607:f8b0:4864:20::631] (port=38559
 helo=mail-pl1-x631.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nUTED-0007UD-DF
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 08:58:14 -0400
Received: by mail-pl1-x631.google.com with SMTP id n18so1739143plg.5
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 05:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=/To8ZwHJ5BiJhdJVRXrO/4baCtiVFBM+q9RTFku5GXU=;
 b=iunh/DELIp5zXlCttV5MYERshx7J2/cuFGHkBGoPYwSQ34K5z40hdXJNQQVhQqFy70
 2YO7+U9qNyqRsg4uRwzr9Ng39U/awaWFyOk9kR3FIxZfd2eHOzlkbwe+7KezrPQ1SO0y
 noLJhVYTv2A6qiVvwWLjnS8uYnHeAHQIAgGC1yTbmhk0ramfLb5OJZiAxo0deIzu5MVs
 0ZVJTKMC8+nLojIvjvabYK1KygxlcaWk49E9MWOxPj3jcWtkm1y8aExsSg3FbORRQyQa
 L7nV2N+4+9H9Ao7aMOdmhLEXUZ6dY/Aa+08awMggfKPdi0t1jjKDtFyGFVQo7ANRrYP6
 GTEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/To8ZwHJ5BiJhdJVRXrO/4baCtiVFBM+q9RTFku5GXU=;
 b=mT5n+fo3CrbU6HFeO4L2HdpV14c1wr5t39PJdAbN8PFwFgqQKEVv0oPa7PuAsae631
 ehfGX7EhrEvBCfrdcdTEPCXmBzIWD5ZH0AXbPE3vuQdjWFRoncazMUcSgMHNR+51fMX3
 J7bY/gXmPe3TOFrDFXfF0a01Exe9NxsVRRYx2E3o3mVgmPHDz3W00OeSZgHgnTjE9BnW
 V4Jx//ac72w/NzpqJ6/Ux9GX5V3qoY/ZRs9nr9Uc/scme7WasU3QAO84z3EB3276R8fI
 vyt9amH5fbrhBbGSCKCXBzSf6OXFijZxkO8Mv8McPkaHcE+FWlZWAy9WbvxUYDJDLWAA
 G8oA==
X-Gm-Message-State: AOAM5312VUV71o7VWVM8Xj8EDcMi8VbRiJM4yVpn6ys4G86Q1aqmNiYA
 xQ+WTcj7tAU2/Xbo1NwwQdgFbukL7zU=
X-Google-Smtp-Source: ABdhPJwaNByaKQB2DQ+zBGoRZx/UcUXQBbJlx/3tS8CRJu+q1L6TsMGZOfHVf4wCvNocwZDxiT+A8A==
X-Received: by 2002:a17:903:2405:b0:153:31a5:d027 with SMTP id
 e5-20020a170903240500b0015331a5d027mr27275641plo.122.1647435491812; 
 Wed, 16 Mar 2022 05:58:11 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 v4-20020a056a00148400b004f9eaf80107sm3415109pfu.203.2022.03.16.05.58.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Mar 2022 05:58:11 -0700 (PDT)
Message-ID: <32497911-a335-66f0-9044-17f2d193a4dd@gmail.com>
Date: Wed, 16 Mar 2022 13:58:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH-for-7.0] qga/vss-win32: fix compilation with clang++
Content-Language: en-US
To: Helge Konetzka <hk@zapateado.de>, qemu-devel@nongnu.org
References: <240b4ac6-7f74-e959-ae81-73dbe3fa904e@zapateado.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <240b4ac6-7f74-e959-ae81-73dbe3fa904e@zapateado.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::631
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x631.google.com
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
Cc: Konstantin Kostiuk <kkostiuk@redhat.com>,
 Michael Roth <michael.roth@amd.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/3/22 13:31, Helge Konetzka wrote:
> Compiling with clang++ of msys2 toolchain clang64 leads to an error
> on initializing 'char*' variable nul with a 'const char*' value

Can you include the error message in the description? I.e.:

'''
This fixes:

  qga/vss-win32/install.cpp:49:24: error: cannot initialize a variable of
  type 'char *' with an rvalue of type 'const char *'
       char *msg = NULL, *nul = strchr(text, '(');
                          ^     ~~~~~~~~~~~~~~~~~
'''

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> Signed-off-by: Helge Konetzka <hk@zapateado.de>
> ---
> Compiling with clang++ of msys2 toolchain clang64 leads to
> 
> [1445/1747] Compiling C++ object 
> qga/vss-win32/qga-vss.dll.p/install.cpp.obj
> FAILED: qga/vss-win32/qga-vss.dll.p/install.cpp.obj
> ...
> qga/vss-win32/install.cpp:49:24: error: cannot initialize a variable of 
> type 'char *' with an rvalue of type 'const char *'
>      char *msg = NULL, *nul = strchr(text, '(');
>                         ^     ~~~~~~~~~~~~~~~~~
> 1 error generated.
> ninja: build stopped: subcommand failed.
> make: *** [Makefile:163: run-ninja] Error 1
> ==> ERROR: A failure occurred in build().
>      Aborting...
> ---
>   qga/vss-win32/install.cpp | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/qga/vss-win32/install.cpp b/qga/vss-win32/install.cpp
> index 8076efe3cb..b57508fbe0 100644
> --- a/qga/vss-win32/install.cpp
> +++ b/qga/vss-win32/install.cpp
> @@ -46,7 +46,8 @@ void errmsg(DWORD err, const char *text)
>        * If text doesn't contains '(', negative precision is given, 
> which is
>        * treated as though it were missing.
>        */
> -    char *msg = NULL, *nul = strchr(text, '(');
> +    char *msg = NULL;
> +    const char *nul = strchr(text, '(');
>       int len = nul ? nul - text : -1;
> 
>       FormatMessage(FORMAT_MESSAGE_ALLOCATE_BUFFER |


