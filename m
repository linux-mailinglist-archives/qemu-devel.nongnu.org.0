Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E7C4895EA
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 11:01:46 +0100 (CET)
Received: from localhost ([::1]:35990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6rUn-0007Ra-NW
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 05:01:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n6rRv-0005uY-9F
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 04:58:47 -0500
Received: from [2a00:1450:4864:20::330] (port=54166
 helo=mail-wm1-x330.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n6rRt-0000gd-MN
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 04:58:46 -0500
Received: by mail-wm1-x330.google.com with SMTP id l4so8326836wmq.3
 for <qemu-devel@nongnu.org>; Mon, 10 Jan 2022 01:58:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=dutaW1OS7NToCKOlG8lM1NeE5rFPHGO1QLS1OrvuoA8=;
 b=GGdnFP0uqQOHwigy3/JUlioS46Uz0Wjss7GeIj4+Ql2E5Td5qJyyRZnSzYoGs9eSlu
 w57srtI7OvXli5+EcJmj1fNVXqcTcUPU7KK7nninX3nPG2EWUIXfAq1wMTPT3aT35Ykr
 DLLfO5XTCzrvshKd0XXDS6KGizwCehmcr/IygMTGOxeZlHf4ohdr3/oXV9YaBueNVBrO
 2raA7K3aZLMy5IFY/v6OIC9kEYOj7Yr3vlqb5JWAHM6/vVO1qtlLbEgM6XOrbkeLi2NL
 iaOr3bqvNPpSPsfreGfVwsUry5iu9o4v6QIII5xSC2bgG8+1huk6pbTziwUpitOIrxST
 84MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=dutaW1OS7NToCKOlG8lM1NeE5rFPHGO1QLS1OrvuoA8=;
 b=0aXTexXsehIXEeUGwDQWtAj7Y2ISSLLQnZgFStgdYtSFRk0+4pVeLVqN8EACmo1cAp
 Z/pJ7mKtJNlfBKuizkmDBZzFQchSvvVQJZKblmoZfBQlfnasOuUqzjDeAo6kJKdDK6Z8
 jnphU2xLFxfq3xcurKH20ep3GklJ4cnDeihBaqyoXLqgB0IxuF2vl5WhrFeUhP1m+7Bu
 iJEsimbYjzbAoo3y8b8CmHcG/FBITWSrUq5yUKxTsN33tn1sEanB0FVie20VjB0N1+OQ
 et7e3nnzsN2jJh7MtJMAxTo7rsF/FgWAJh2WKDI9dSID2S9AxxuFOhF4VcXxSGlnmn0v
 pgPw==
X-Gm-Message-State: AOAM532xyfZElhMCTlOzE0V1fCx2xThNZkmpuQbj1tqtZxgH3kbt71Y1
 AWTVCiRk/9NsFjZt2mQesQo=
X-Google-Smtp-Source: ABdhPJxBzsYzFr+MFiVpCK4mPZej7r7w/ns91/UH7m05lopHQeQGqhtO4e/EA0CGxTNXtb9Px0HweQ==
X-Received: by 2002:a05:600c:3b19:: with SMTP id
 m25mr21161605wms.100.1641808722510; 
 Mon, 10 Jan 2022 01:58:42 -0800 (PST)
Received: from [192.168.1.40] (83.red-83-50-87.dynamicip.rima-tde.net.
 [83.50.87.83])
 by smtp.gmail.com with ESMTPSA id q14sm6413311wro.58.2022.01.10.01.58.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jan 2022 01:58:42 -0800 (PST)
Message-ID: <33137c92-576f-3ee1-d4b5-2673c09f4ef3@amsat.org>
Date: Mon, 10 Jan 2022 10:58:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v1 19/34] tests/tcg: use CONFIG_LINUX_USER, not
 CONFIG_LINUX
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, Warner Losh <imp@bsdimp.com>
References: <20220105135009.1584676-1-alex.bennee@linaro.org>
 <20220105135009.1584676-20-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20220105135009.1584676-20-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::330
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: fam@euphon.net, Eduardo Habkost <eduardo@habkost.net>, berrange@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

+Warner

On 1/5/22 14:49, Alex Bennée wrote:
> From: Paolo Bonzini <pbonzini@redhat.com>
> 
> The two more or less overlap, because CONFIG_LINUX is a requirement for Linux
> user-mode emulation.  However, CONFIG_LINUX is technically a host symbol
> that applies even to system emulation.  Defining CONFIG_LINUX_USER, and
> CONFIG_BSD_USER for eventual future use, is cleaner.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20211210084836.25202-1-pbonzini@redhat.com>
> ---
>  tests/tcg/configure.sh              | 8 +++++++-
>  tests/tcg/multiarch/Makefile.target | 2 +-
>  tests/tcg/x86_64/Makefile.target    | 2 +-
>  3 files changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/tcg/configure.sh b/tests/tcg/configure.sh
> index 8eb4287c84..309335a2bd 100755
> --- a/tests/tcg/configure.sh
> +++ b/tests/tcg/configure.sh
> @@ -225,8 +225,14 @@ for target in $target_list; do
>    echo "TARGET_NAME=$arch" >> $config_target_mak
>    echo "target=$target" >> $config_target_mak
>    case $target in
> -    *-linux-user | *-bsd-user)
> +    *-linux-user)
>        echo "CONFIG_USER_ONLY=y" >> $config_target_mak
> +      echo "CONFIG_LINUX_USER=y" >> $config_target_mak
> +      echo "QEMU=$PWD/qemu-$arch" >> $config_target_mak
> +      ;;
> +    *-bsd-user)
> +      echo "CONFIG_USER_ONLY=y" >> $config_target_mak
> +      echo "CONFIG_BSD_USER=y" >> $config_target_mak
>        echo "QEMU=$PWD/qemu-$arch" >> $config_target_mak
>        ;;
>      *-softmmu)
> diff --git a/tests/tcg/multiarch/Makefile.target b/tests/tcg/multiarch/Makefile.target
> index a83efb4a9d..dec401e67f 100644
> --- a/tests/tcg/multiarch/Makefile.target
> +++ b/tests/tcg/multiarch/Makefile.target
> @@ -10,7 +10,7 @@ MULTIARCH_SRC=$(SRC_PATH)/tests/tcg/multiarch
>  # Set search path for all sources
>  VPATH 	       += $(MULTIARCH_SRC)
>  MULTIARCH_SRCS =  $(notdir $(wildcard $(MULTIARCH_SRC)/*.c))
> -ifneq ($(CONFIG_LINUX),)
> +ifneq ($(CONFIG_LINUX_USER),)
>  VPATH 	       += $(MULTIARCH_SRC)/linux
>  MULTIARCH_SRCS += $(notdir $(wildcard $(MULTIARCH_SRC)/linux/*.c))
>  endif
> diff --git a/tests/tcg/x86_64/Makefile.target b/tests/tcg/x86_64/Makefile.target
> index d7a7385583..4a8a464c57 100644
> --- a/tests/tcg/x86_64/Makefile.target
> +++ b/tests/tcg/x86_64/Makefile.target
> @@ -8,7 +8,7 @@
>  
>  include $(SRC_PATH)/tests/tcg/i386/Makefile.target
>  
> -ifneq ($(CONFIG_LINUX),)
> +ifneq ($(CONFIG_LINUX_USER),)
>  X86_64_TESTS += vsyscall
>  TESTS=$(MULTIARCH_TESTS) $(X86_64_TESTS) test-x86_64
>  else

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

