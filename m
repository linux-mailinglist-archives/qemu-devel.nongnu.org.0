Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B722FEB62
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 14:18:00 +0100 (CET)
Received: from localhost ([::1]:47566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2ZqZ-0004PV-60
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 08:17:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l2Zn0-00031A-TW
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 08:14:18 -0500
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:37556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l2Zmv-0005Uc-DP
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 08:14:18 -0500
Received: by mail-ed1-x52d.google.com with SMTP id g1so2414540edu.4
 for <qemu-devel@nongnu.org>; Thu, 21 Jan 2021 05:14:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=X1SsQj85L6Kl8LhrkTN75VtchQxF/GKnR+/VXWkENo4=;
 b=odBIWH8aQKCK21E9Pd46Ili/p+ThvP6giDksNLyTixVCzJKkOBBtmQzZ6KrTi94DpI
 MBJ8+8/VDQaCgKEzX7BJgAw2uqZJ3RFQkeO953qjGdBHcHfkcTmZ42sRb84wWcjTUSYu
 USMT4Ro6rz+w7OPqsX5f+QaU3qZTM+Y77xb9y9bbEYo0+lT6wwxudEQqEgeR63SuaB7S
 S2NeiTptuIyBHKvE7YVeVRuqgFJW8AG9WjbqlbKLutF5IpMvXyA2+x2FIZtU49NjSTwu
 jmTvUi2dMAljx9TPiLr4rRwergLMUOKw8lXvZ+Udh3QWpWBJ67dH+xOHM4g1aI2tmVsA
 Ogag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=X1SsQj85L6Kl8LhrkTN75VtchQxF/GKnR+/VXWkENo4=;
 b=pRhXwVbUnq3DfgiRCric4CpDBZKFqhw3UysmAeTJ6igLKeWpyTJXCGsgsjDcFzKAtH
 WjO5l0SGGUHQJlG9WLepWu8tF/+AkXSjmrGmnCHQCa/sMQ6Gyocs81ApA5TWpV1Xoscc
 tPJ+v8Tv/x0OMYOO/ICUjbiNIRGDxdBo0tXgWPKNak3Cp75LblyS3i8/HoWbLp2FuEmy
 r5gilKcwP0Y6nU1ok0wUxxp9/t3LWlg/Q4146NmfwOSwMxD3YY1xZVFQR52CIxLfMmC5
 ll+/fJO1Ph8ghHXq1e34HUm8NuRHSJcMcLDLq1zajLaIGNtb15kjcy/a1S4kBddSPenD
 Ks1w==
X-Gm-Message-State: AOAM5317fVrLIHrjSt/tKdp3qzuwdGT46/GP/WJKKCbJoJxnbdMbpSb8
 m8fXVGYnlh5KNo7J0oGRIyM=
X-Google-Smtp-Source: ABdhPJxrMUn69oIsvdnzpeojDwV3tkzbDgOq4370ivg955Az7S0i7IoRYJnTxLJLpTnibR1WKeMF+Q==
X-Received: by 2002:a50:bacb:: with SMTP id x69mr11039713ede.39.1611234850704; 
 Thu, 21 Jan 2021 05:14:10 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id w11sm2828733edj.8.2021.01.21.05.14.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Jan 2021 05:14:09 -0800 (PST)
Subject: Re: [PATCH] gitlab-ci: Test building linux-user targets on CentOS 7
To: qemu-devel@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <20210121121505.1523156-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <59ac8f67-4e8b-f308-1308-497df09a1363@amsat.org>
Date: Thu, 21 Jan 2021 14:14:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210121121505.1523156-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/21/21 1:15 PM, Philippe Mathieu-Daudé wrote:
> Add a configuration tested by Peter Maydell (see [1] and [2])
> but not covered in our CI [3]:
> 
>   [705/2910] Compiling C object libqemu-arm-linux-user.fa.p/linux-user_strace.c.o
>   FAILED: libqemu-arm-linux-user.fa.p/linux-user_strace.c.o
>   ../linux-user/strace.c: In function 'do_print_sockopt':
>   ../linux-user/strace.c:2831:14: error: 'IPV6_ADDR_PREFERENCES' undeclared (first use in this function)
>            case IPV6_ADDR_PREFERENCES:
>                 ^
> 
> [1] https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg05086.html
> [2] https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg05379.html
> [3] https://gitlab.com/philmd/qemu/-/jobs/977408284:
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  .gitlab-ci.yml | 7 +++++++
>  1 file changed, 7 insertions(+)

> +build-user-centos7:
> +  <<: *native_build_job_definition
> +  variables:
> +    IMAGE: centos7
> +    CONFIGURE_ARGS: --disable-system --disable-tools --disable-docs
> +    MAKE_CHECK_ARGS: check-tcg

check-tcg calls build-tcg which fails:

  BUILD   TCG tests for x86_64-softmmu
  BUILD   x86_64-softmmu guest-tests with cc
/usr/bin/ld: hello: warning: allocated section `.notes' not in segment
/usr/bin/ld: memory: warning: allocated section `.notes' not in segment
  BUILD   TCG tests for x86_64-linux-user
  BUILD   x86_64-linux-user guest-tests with cc
/usr/bin/ld: cannot find -lpthread
/usr/bin/ld: cannot find -lc
collect2: error: ld returned 1 exit status
make[2]: *** [threadcount] Error 1
make[1]: *** [cross-build-guest-tests] Error 2
make: *** [build-tcg-tests-x86_64-linux-user] Error 2

Apparently this is due to the -static flag:

$ gcc  -Wall -Werror -O0 -g -fno-strict-aliasing -m64
tests/tcg/multiarch/threadcount.c -o threadcount  -static -lpthread
/usr/bin/ld: cannot find -lpthread
/usr/bin/ld: cannot find -lc
collect2: error: ld returned 1 exit status

Do we need to install these packages?

glibc-static.i686 : C library static libraries for -static linking.
glibc-static.x86_64 : C library static libraries for -static linking.

Or simply ignore testing?

Thanks,

Phil.

