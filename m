Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 529573BE9F6
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 16:42:56 +0200 (CEST)
Received: from localhost ([::1]:55570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m18lL-0001ub-EP
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 10:42:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m18kG-0001FH-Gi
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 10:41:48 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:52116)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m18kE-0004LT-TT
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 10:41:48 -0400
Received: by mail-wm1-x32b.google.com with SMTP id n33so2025487wms.1
 for <qemu-devel@nongnu.org>; Wed, 07 Jul 2021 07:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rTaST49kUktD1IK8HpFZ4ra4vI3CBoHggUgtTTfy3Xw=;
 b=taUokPrY4uHBgmNVDFBmrd+iNHvye61lJh76V3Y25NHlWlFHL4Q02ghFr14uYr9PVc
 99ECpVgbkyc3M+fWD00YyryFkQXR0l/PEw5IM5jdMzmIF/x6DtXcP1TzI1NOHsrjRV30
 Nd5zCBaI9R9H4vOTQsgvRYV5zp5Apv7tlmtY1kFN6T5Jv+MKODRAvj9ck1vcf7mrA+Ml
 7qibc1EL7lWThhpR67y33cLn+2GepeAMHwwj/vqJ0ozhTBndXx57973TUVvKandQrgQi
 BvwvYW2LTb3YyGLsU692oC+aBIaxZ0aIz3tyjSu6A4Y3Zf0qjQXASgnVNbW+aaFCo82N
 dUzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rTaST49kUktD1IK8HpFZ4ra4vI3CBoHggUgtTTfy3Xw=;
 b=a2iAQsNu4RV/ANEaeosFM2hwbpdyiklcS3KT9Jvowl8ZTrPj8b7eZgRBTfwjCmFFXD
 H/iac5O5ch2Vu0dMX2KZzKgJJULPq1ovQqBFabVg2gulQhwVJyq6GTCP5b2kShU+vnbj
 CmaS8RSw5ktnldv+FSRyBH4mI/qOlb09FUOJL2IJE6xJwvRlcHW2k+nBMvoPQa/Y+7tS
 E7MrEUtLtbIaBvAAKdErTVjYOe0UC64phN/r4IbjAnzyagRV7cyecDoMcK6yZJmo7yeV
 yaOO0Axfetrxdge+gAqv6BTvpLt3cepNG08cv/qaNgvF5vT7M3mMhXPxBxCKMEd/qoMx
 X3Qw==
X-Gm-Message-State: AOAM530i2Kjkx//mqHZ9S8TitgqNHUsNNnpzp3ImJ23WCYxhUwwUTb4J
 6Z5o9Hy7DE65/TDo3yf4P5xZKCbZiVc=
X-Google-Smtp-Source: ABdhPJy3UOHaxKUjQOJPpAcgOr9AsHYKQuB2zBueJDe64/5kyMk26otjIBTHBRsdF7czJgIjLIRUwg==
X-Received: by 2002:a1c:4e0c:: with SMTP id g12mr7201501wmh.120.1625668904461; 
 Wed, 07 Jul 2021 07:41:44 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id 12sm7117820wme.28.2021.07.07.07.41.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Jul 2021 07:41:43 -0700 (PDT)
Subject: Re: [PATCH v1 17/39] tests/docker: fix mistakes in ubuntu package
 lists
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, berrange@redhat.com
References: <20210706145817.24109-1-alex.bennee@linaro.org>
 <20210706145817.24109-18-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <357c694a-8a67-3b9b-68af-87c794f52197@amsat.org>
Date: Wed, 7 Jul 2021 16:41:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210706145817.24109-18-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/6/21 4:57 PM, Alex Bennée wrote:
> From: Daniel P. Berrangé <berrange@redhat.com>
> 
> librados-dev is not required by QEMU directly, only librbd-dev.
> 
> glusterfs-common is not directly needed by QEMU.
> 
> QEMU uses ncursesw only on non-Windows hosts.
> 
> The clang package is clang 10.
> 
> flex and bison are not required by QEMU.

Doh, it was practical to cross-build Linux kernel images
while testing:

$ make O=/tmp/build ARCH=mips CROSS_PREFIX=mipsel-linux-gnu- jazz_defconfig
make[1]: Entering directory '/tmp/build'
  GEN     Makefile
  LEX     scripts/kconfig/lexer.lex.c
/bin/sh: 1: flex: not found
make[2]: *** [scripts/Makefile.host:9: scripts/kconfig/lexer.lex.c]
Error 127

But I agree it is not required by QEMU itself.

Should we have a different set of images, one to build QEMU, and
various for building images used to test the built QEMU?

Anyway it will come back soon:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg817164.html

> Standardize on nmap ncat implementation to match Fedora/CentOS.
> 
> Remove vim since it is not a build pre-requisite and no other containers
> include it.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20210623142245.307776-10-berrange@redhat.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  tests/docker/dockerfiles/ubuntu1804.docker |  3 ---
>  tests/docker/dockerfiles/ubuntu2004.docker | 10 ++--------
>  2 files changed, 2 insertions(+), 11 deletions(-)

