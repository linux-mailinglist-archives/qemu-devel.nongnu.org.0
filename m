Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 779894E9BB4
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Mar 2022 17:55:03 +0200 (CEST)
Received: from localhost ([::1]:39614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYrht-0000Co-V2
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 11:55:02 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nYrgN-0007WH-Kj
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 11:53:27 -0400
Received: from [2001:4860:4864:20::2c] (port=33239
 helo=mail-oa1-x2c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nYrgL-00068q-VA
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 11:53:27 -0400
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-de3eda6b5dso15701524fac.0
 for <qemu-devel@nongnu.org>; Mon, 28 Mar 2022 08:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=BmNGj/baLDgSMRZ5uyubaqpahfd/KgaIVO2gvHgwyU8=;
 b=PtY0zV/3NPPi25tWa5SJNeYwDwzUt8mO3X1jhud5KpBhnGnfB/IV8U/D7docowHbzk
 uynXbNpTmw3eeID4grvmraoX7QDxO5BOVDbipzCZLPh/efkpScixbPbN7A70ZXA0Iu7O
 O4Fpve0WLE8wc6yAXuuFGuCilQFuboSP3voOVWFKOI+N3KcXFtlHGbMX6rNcB+uwXRxY
 m8tsvQXIr0SZCSFFxJZ95EXHtxfs297c9K6gqU11RrrCL1288wtEemxUyrDY2Ve2zC4p
 W0V76Y3ddEdBJXxb1Ahd8k3DbXoR2IpWZrZTnZtxL3qWxvhS8ctfKhhqx2wd4GggFZuY
 sk4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=BmNGj/baLDgSMRZ5uyubaqpahfd/KgaIVO2gvHgwyU8=;
 b=4YQLURKKVPuwQqgrrfz83paeVDP5Y2LpBa5cWE8tvZ3NEZO8+M5SS3uKpktkKtRR5J
 F1/3MVBXw/63axvmjTwQFaaqjV0mUugZriUDKB1lzrlCfOI31aVu6uwRB+zQki2ExTUl
 mLIatoXcVaV/6htuwYfZdqQr4Se15ioh6P5i2PgbVEa549NmAitx8AUMbPwVVwA/h6kj
 k7XLp9zd3adDgy43AJqciqEQjfBrErVVC2rpXgtplS9ukzPTvGuuWRn53Hwq0RXdRiVj
 KdLc3u0Nf+kOpUnNy4YmFEsmDGyB73qJvNySTkxZaPlGhtX2h10IQBHnGx0yBjjuacT1
 p75Q==
X-Gm-Message-State: AOAM533pXutDtHqy1zMX1Kvh9ZNZHqF2lHxu/cEXgrDVToAhO1bJmAVl
 t7hlolcBll04BPBBrmpIkOMt2g==
X-Google-Smtp-Source: ABdhPJxtd21sr5tKjeOqRua4kUJU+sBnIUFHIR5ySsNH8XqoxmGT21sO7SC4AaCufBr4XEq52c/QrQ==
X-Received: by 2002:a05:6870:c18d:b0:de:27ca:c657 with SMTP id
 h13-20020a056870c18d00b000de27cac657mr10678501oad.258.1648482804756; 
 Mon, 28 Mar 2022 08:53:24 -0700 (PDT)
Received: from [172.24.1.26] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168]) by smtp.gmail.com with ESMTPSA id
 t15-20020a056808158f00b002e331356c87sm7165224oiw.39.2022.03.28.08.53.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Mar 2022 08:53:24 -0700 (PDT)
Message-ID: <0f1e3a7a-291b-cb82-5385-28c5ab195406@linaro.org>
Date: Mon, 28 Mar 2022 09:53:21 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 00/15] tests/docker and tests/tcg cleanup and diet
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20220328140240.40798-1-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220328140240.40798-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:4860:4864:20::2c
 (failed)
Received-SPF: pass client-ip=2001:4860:4864:20::2c;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/28/22 08:02, Paolo Bonzini wrote:
> This is also a first step towards moving the cross-compilation
> infrastructure from tests/tcg to all of QEMU, so that it can be
> used to build firmware binaries.

Yay!

However, the tricore special cases broke:

/home/rth/qemu/src/tests/docker/docker.py --engine auto build -t qemu/debian-tricore-cross 
-f /home/rth/qemu/src/tests/docker/dockerfiles/debian-tricore-cross.docker   --registry 
registry.gitlab.com/qemu-project/qemu --add-current-user
Image is up to date.
make -C tests/tcg/tricore-softmmu -f ../Makefile.target 
DOCKER_SCRIPT="/home/rth/qemu/src/tests/docker/docker.py --engine auto" 
TARGET="tricore-softmmu" SRC_PATH="/home/rth/qemu/src"
make[1]: Entering directory '/home/rth/qemu/bld/tests/tcg/tricore-softmmu'
cc -E -o test_abs.pS /home/rth/qemu/src/tests/tcg/tricore/test_abs.S
/home/rth/qemu/src/tests/docker/docker.py --engine auto cc --cc  -i 
qemu/debian-tricore-cross -s /home/rth/qemu/src --  -o test_abs.o test_abs.pS
usage: docker.py <subcommand> ... cc [-h] [--quiet] --image IMAGE [--cc CC] [--source-path 
[PATHS [PATHS ...]]]
docker.py <subcommand> ... cc: error: argument --cc: expected one argument
make[1]: *** [/home/rth/qemu/src/tests/tcg/tricore/Makefile.softmmu-target:23: test_abs.o] 
Error 2


r~

