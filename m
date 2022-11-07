Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1BE761FAC6
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Nov 2022 18:05:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1os5Wm-0007Bu-4o; Mon, 07 Nov 2022 12:03:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1os5W6-00071e-Gr
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 12:02:37 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1os5Vx-0000BR-FE
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 12:02:34 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 p13-20020a05600c468d00b003cf8859ed1bso7561077wmo.1
 for <qemu-devel@nongnu.org>; Mon, 07 Nov 2022 09:02:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Lha7ygvtln3HVSjQNu++Uu9HpJkKT0rk2G+3UkklXOQ=;
 b=aXRRtUrKgXqdEUUUjAcAANKcv/PCEjsbIKfqs9VUSr9KzEpJbFROF7MukCa9SrByhH
 rpPbOlqEn7KIOeA1YJbck+GkI23KkOG27w4YK+zxhLUlVE9JJyRjFEHDZnzp35B3qODD
 7LRl5/tNbwSqgpL2GctLiUBV4bsSXQAUMRRlJqZ5yuCqyiPhIBj0hQr2GbaOMAkeDiNt
 kV6Br3AI8aavgw3il8klKCRdwlNYEjMcpHwx9HFWBQoG8fZq1X1ht4blKa7UQBeFrDcm
 17jDflITmf7jajFTLv9I14sKBDtU+0xjgtgsiRduUNJ5x9FyObD0Ok/d1BzH9boYhd0v
 aeDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Lha7ygvtln3HVSjQNu++Uu9HpJkKT0rk2G+3UkklXOQ=;
 b=TrvgdD5xf9XrIv289Uob0QZA721IpyuhKLrxza736GBa3tfCLzbMdlgywmyg80I3H4
 7/kCxpAWJOL4R46lmIl5cG3ii43RK1WwGD4Ri+A/jH1f10H4FXnIaTyPwMpRva6cQ/B7
 mcUV+Z885IsSfnuDao/VexQTmVCR7dUtpKQ9PRt4BzQ8/cW5foslTxBk0W6F51W9tYUp
 IhfrAnnM/NzLpVhr6hI9+UwR78N7Ot6SeytIapqEnfxhug3FdeVuO3Q5M3D+D2b8ohSE
 3fZorNiTUcLeWnOrWoYO/SAQ6iv14sL1+V1f2ftZTtpGTMkX9FWek4Ry5k23nT3gjdme
 JgJw==
X-Gm-Message-State: ANoB5plUNg6rxotFif6wXGsa4652+Zs9A7V5/i+h/4U0z0rlUwmAmmNe
 3SKAB5X9UOwymKoB3xhCXnpb1g==
X-Google-Smtp-Source: AA0mqf4rDm5/4UwTRW6gXLPIZGslaYHQyFCbhFF7WZkv500E1Bg7QVXfa2+/nKOkG/IzXudHd3ho3A==
X-Received: by 2002:a05:600c:4f44:b0:3cf:b5dd:46f7 with SMTP id
 m4-20020a05600c4f4400b003cfb5dd46f7mr250268wmq.73.1667840543046; 
 Mon, 07 Nov 2022 09:02:23 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 5-20020a05600c26c500b003b50428cf66sm8362631wmv.33.2022.11.07.09.02.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Nov 2022 09:02:22 -0800 (PST)
Message-ID: <ba915fd0-c542-cd7d-eb53-e4c2959429ad@linaro.org>
Date: Mon, 7 Nov 2022 18:02:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [RFC PATCH] tests/docker: allow user to override check target
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20221107145227.1210499-1-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221107145227.1210499-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 7/11/22 15:52, Alex Bennée wrote:
> This is useful when trying to bisect a particular failing test behind
> a docker run. For example:
> 
>    make docker-test-clang@fedora \
>      TARGET_LIST=arm-softmmu \
>      CHECK_TARGET="meson test qtest-arm/qos-test" \
>      J=9 V=1
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/docker/Makefile.include | 2 ++
>   tests/docker/common.rc        | 6 +++---
>   2 files changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
> index c87f14477a..ece0aa77df 100644
> --- a/tests/docker/Makefile.include
> +++ b/tests/docker/Makefile.include
> @@ -184,6 +184,7 @@ docker:
>   	@echo '    TARGET_LIST=a,b,c    Override target list in builds.'
>   	@echo '    EXTRA_CONFIGURE_OPTS="..."'
>   	@echo '                         Extra configure options.'
> +	@echo '    CHECK_TARGET="..."   Override the default `make check` target '

s/target /target./

>   	@echo '    IMAGES="a b c ..":   Restrict available images to subset.'
>   	@echo '    TESTS="x y z .."     Restrict available tests to subset.'
>   	@echo '    J=[0..9]*            Overrides the -jN parameter for make commands'
> @@ -230,6 +231,7 @@ docker-run: docker-qemu-src
>   			$(if $(NETWORK),$(if $(subst $(NETWORK),,1),--net=$(NETWORK)),--net=none) \
>   			-e TARGET_LIST=$(subst $(SPACE),$(COMMA),$(TARGET_LIST))	\
>   			-e EXTRA_CONFIGURE_OPTS="$(EXTRA_CONFIGURE_OPTS)" \
> +			-e CHECK_TARGET="$(CHECK_TARGET)" 		\
>   			-e V=$V -e J=$J -e DEBUG=$(DEBUG)		\
>   			-e SHOW_ENV=$(SHOW_ENV) 			\
>   			$(if $(NOUSER),,				\
> diff --git a/tests/docker/common.rc b/tests/docker/common.rc
> index e6f8cee0d6..f2769c1ff6 100755
> --- a/tests/docker/common.rc
> +++ b/tests/docker/common.rc
> @@ -63,12 +63,12 @@ check_qemu()
>   {
>       # default to make check unless the caller specifies
>       if [ $# = 0 ]; then
> -        INVOCATION="check"
> +        INVOCATION="${CHECK_TARGET:-make $MAKEFLAGS check}"

Why pass MAKEFLAGS here?

>       else
> -        INVOCATION="$@"
> +        INVOCATION="make $MAKEFLAGS $@"
>       fi
>   
> -    make $MAKEFLAGS $INVOCATION
> +    $INVOCATION
>   }
>   
>   test_fail()


