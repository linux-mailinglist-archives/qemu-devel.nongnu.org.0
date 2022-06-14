Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 956F754A934
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 08:05:47 +0200 (CEST)
Received: from localhost ([::1]:49250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0zgQ-0004JH-3p
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 02:05:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o0zcJ-0002Uk-2e
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 02:01:31 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:41736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o0zcB-0006zc-5q
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 02:01:29 -0400
Received: by mail-pf1-x434.google.com with SMTP id i64so7691567pfc.8
 for <qemu-devel@nongnu.org>; Mon, 13 Jun 2022 23:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ciHvjy/9TWmnjoKhcV42mjHitDEt3JxUAw4A3EoFkJM=;
 b=rH6GuvqLMmJDFbghTiUrHvOtSMdVWgaqBcvDOBL7TR+0czwn3x4n7DldYD+CA7SyUQ
 GUoPmg2CU/Zs9+zmlyY44ZX7umDglkuIHqXMEz5laNXsrSSP5pzku9d3zg357dsPQeJ7
 sATAHs7x3zmB38Fhou8S/w1hprBCIzNyadpYD+3ThzRGe/QjuX9jJ2nxXSu070CP/0oP
 VCcvawpsWKThX7+tOgHh61D12JPmL2jNhWaZsAXttl3H7PFp1Z1Gn+blJSdkWxGuZS8l
 Hema0uYW40H6+lxWktBgQUdoJXDmSfNbBMe9M2TVkczNvW7ofbngkMp5Lt9dYi9t3Gsj
 nSvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ciHvjy/9TWmnjoKhcV42mjHitDEt3JxUAw4A3EoFkJM=;
 b=mVm1pFqKYdQyf2xE0hiQCfYNsUsLeuHbAPX3pz/+qHeoXg49bIjhQIqDJsqbMWf6bB
 vOk24/lQmMcrTIjgCj17jTZtYxYiruQ52ebV4FYg5jCaktiT51eQR4z4tBea8slZFvKj
 hxoQZ1iTdISyaTV+zMzdIWVkEX0n6OiA3vQo4LX1FQl+XIjFC4ERR/h6X0QQHCG/ikXf
 Jtz+guNx5EHmd39RJK8uqJX5reUvyGFcUF7ATtHXxvWup01r2B/wf1oTtGKEqGWaJAwV
 bGqm9G5S9xXsMFtYBwjHhm03vx/zsTmdc7+AJPnk0/XQ07ZGadvHbYhVE5wj+sLXPwUl
 Iw9g==
X-Gm-Message-State: AOAM5305fEL/l9U0t0Hno3ICYmTZZ/Z2z4C/pSKCPGiuj7q3KcF4EBch
 AVNqI93ZkWlfg+oL1/45HUD7vg==
X-Google-Smtp-Source: ABdhPJxPvwKWc1nkFR92sHgxdjl9DTSnSSUgMAVQpwbnfaeboaQW7D1GR9S2kzAzSMWmbjPWAfbO9A==
X-Received: by 2002:a63:5412:0:b0:408:84a9:9562 with SMTP id
 i18-20020a635412000000b0040884a99562mr3128111pgb.600.1655186479837; 
 Mon, 13 Jun 2022 23:01:19 -0700 (PDT)
Received: from [192.168.159.227] ([50.208.55.229])
 by smtp.gmail.com with ESMTPSA id
 v3-20020aa799c3000000b0051bc538baadsm6459560pfi.184.2022.06.13.23.01.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jun 2022 23:01:19 -0700 (PDT)
Message-ID: <87b11180-7e44-8e58-e5f4-6cdda7bf2525@linaro.org>
Date: Mon, 13 Jun 2022 23:01:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PULL 0/7] testing/next (docker, gitlab,tcg)
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org
References: <20220614004209.1970284-1-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220614004209.1970284-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 6/13/22 17:42, Alex Bennée wrote:
> The following changes since commit dcb40541ebca7ec98a14d461593b3cd7282b4fac:
> 
>    Merge tag 'mips-20220611' of https://github.com/philmd/qemu into staging (2022-06-11 21:13:27 -0700)
> 
> are available in the Git repository at:
> 
>    https://github.com/stsquad/qemu.git tags/pull-testing-next-140622-1
> 
> for you to fetch changes up to b56d1ee9514be227854a589b4e11551bed4448a0:
> 
>    .gitlab: use less aggressive nproc on our aarch64/32 runners (2022-06-14 00:15:06 +0100)
> 
> ----------------------------------------------------------------
> Various testing fixes:
> 
>    - fix compiler abi for test-armv6m-undef
>    - fix isns suffixes for i386 tcg tests
>    - fix gitlab cfi jobs
>    - fix makefile docker invocation
>    - don't enable xtensa-linux-user builds with system compiler
>    - fix CIRRUS_nn var checking
>    - don't spam the aarch64/32 runners with too many jobs at once

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~


> 
> ----------------------------------------------------------------
> Alex Bennée (2):
>        tests/docker: fix the IMAGE for build invocation
>        .gitlab: use less aggressive nproc on our aarch64/32 runners
> 
> Daniel P. Berrangé (1):
>        gitlab: compare CIRRUS_nn vars against 'null' not ""
> 
> Paolo Bonzini (1):
>        tests/tcg: disable xtensa-linux-user again
> 
> Richard Henderson (2):
>        test/tcg/arm: Use -mfloat-abi=soft for test-armv6m-undef
>        tests/tcg/i386: Use explicit suffix on fist insns
> 
> Thomas Huth (1):
>        gitlab-ci: Fix the build-cfi-aarch64 and build-cfi-ppc64-s390x jobs
> 
>   configure                                          |  5 ++++-
>   tests/tcg/i386/test-i386-fp-exceptions.c           | 24 +++++++++++-----------
>   tests/tcg/i386/test-i386.c                         |  2 +-
>   .gitlab-ci.d/base.yml                              |  2 +-
>   .gitlab-ci.d/buildtest.yml                         | 22 +++++++++-----------
>   .../custom-runners/ubuntu-20.04-aarch32.yml        |  4 ++--
>   .../custom-runners/ubuntu-20.04-aarch64.yml        | 24 +++++++++++-----------
>   tests/docker/Makefile.include                      |  2 +-
>   tests/tcg/arm/Makefile.softmmu-target              |  2 +-
>   9 files changed, 44 insertions(+), 43 deletions(-)
> 


