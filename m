Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A68450709
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 15:32:36 +0100 (CET)
Received: from localhost ([::1]:56104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmd2B-0004Yx-4K
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 09:32:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mmczO-0001ZF-1l
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 09:29:42 -0500
Received: from [2a00:1450:4864:20::431] (port=46764
 helo=mail-wr1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mmczL-0004Q9-Eg
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 09:29:41 -0500
Received: by mail-wr1-x431.google.com with SMTP id u1so31101047wru.13
 for <qemu-devel@nongnu.org>; Mon, 15 Nov 2021 06:29:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=N21rXShm/YwCKeG/aTaeRxJKtdVChZE0KnWPtj4HEK0=;
 b=fx32E7LStIh0dl3OCIqqmRgOWYPX2njlRK4/9fTQlG9LkoHMZAcFTzH8PSmfuRs2Iw
 Vm9433mKCDB1ScHsep7UxNi3CoR2h7MgnFK9kJ2S/GYekJwKpC0VgV7bWHxVgeQpPk7e
 5qk7N77XNwsfZSU84/y3g3ItIH+ZM3WVdjRafXe9GhluRYa1HNXJkAmmFd3KcA+0nMru
 ZFhenoZGPDX7osHqIzT4dnFgtBXX1TK4KaF/dd0w1XMK6hBE0OZ8fDU2DLLi4GCNpV3R
 HY2Fcqtj8YOwfQ2U/ZQmKETN/nqsEp0H/xNRV3gtiTvaAWMuIYjmO3scokGf4l47ewc0
 oggg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=N21rXShm/YwCKeG/aTaeRxJKtdVChZE0KnWPtj4HEK0=;
 b=Ec+KRWijoDt1BJnUtHnPe46AoUKPIvveLlnNA2YbliRyJ/W1fOo1iso3snUXn6hzNL
 2d6DaC/sAx+XMacbliQtE1Zj/mnCxaTGH7mGHXFMju7b7kDM5dQtcE8LIZE4a+haxrm4
 2tO5C4Hi7D3uZROjeAnxd4ow47RIFpv38OySaPvQmXkPKt/bJ5a5xPb3nUFE5JrZ3nP8
 OApnIEIWgfYDxMH7jgKFdHaSRGtmK/mi1t1JE3ylpjCXMrobmHiXV+DJfEU9kcz5FyjN
 JEhS1IOnazpR16hrvHaKqxpXa3MnYOADV3VxFLj4OnhT9d3KTKPXXXdD0lfJdv2NnmBp
 uYww==
X-Gm-Message-State: AOAM530UaxyjSGFb4p1TEsjQONGhLpvkA8gnKzkyBzuacx/92kuxVrIy
 9GWuubV3Yn5ipWWqT0lgYKc=
X-Google-Smtp-Source: ABdhPJxIT8LxpAUa0q2z0gJwn8x/osb6GyAntkUNySMKP4Mm67KaSoSfYmjp0BuwNRQPmCg/+qXXng==
X-Received: by 2002:a5d:6447:: with SMTP id d7mr48984436wrw.118.1636986576642; 
 Mon, 15 Nov 2021 06:29:36 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id r62sm2125347wmr.35.2021.11.15.06.29.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Nov 2021 06:29:36 -0800 (PST)
Message-ID: <cba3524e-00d2-08b1-582f-1f31163fecf0@amsat.org>
Date: Mon, 15 Nov 2021 15:29:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] gitlab-ci: Test compilation on Windows with MSYS2
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20211115140623.104116-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211115140623.104116-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::431
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-2.278,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Yonggang Luo <luoyonggang@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/15/21 15:06, Thomas Huth wrote:
> Gitlab also provides runners with Windows, we can use them to
> test compilation with MSYS2, in both, 64-bit and 32-bit.
> 
> However, it takes quite a long time to set up the VM, so to
> stay in the 1h time frame, we can only compile and check one
> target here.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  "make check" recently broke on MSYS2, and nobody noticed since apparently
>  hardly anybody looks at the cirrus-CI output ... so here's another try
>  to get some more test coverage in this area in the gitlab-CI instead.
>  Patch needs to be applied after the "tests/unit/test-smp-parse:
>  Make an unified name for the tested machine" patch to get "make check"
>  fixed first.
> 
>  RFC -> v1:
>  - Use cache to speed up installation a little bit
>  - Add a 32-bit builder, too
> 
>  .gitlab-ci.d/qemu-project.yml |  1 +
>  .gitlab-ci.d/windows.yml      | 98 +++++++++++++++++++++++++++++++++++
>  2 files changed, 99 insertions(+)
>  create mode 100644 .gitlab-ci.d/windows.yml
> 
> diff --git a/.gitlab-ci.d/qemu-project.yml b/.gitlab-ci.d/qemu-project.yml
> index b3d79bc429..871262fe0e 100644
> --- a/.gitlab-ci.d/qemu-project.yml
> +++ b/.gitlab-ci.d/qemu-project.yml
> @@ -11,3 +11,4 @@ include:
>    - local: '/.gitlab-ci.d/static_checks.yml'
>    - local: '/.gitlab-ci.d/custom-runners.yml'
>    - local: '/.gitlab-ci.d/cirrus.yml'
> +  - local: '/.gitlab-ci.d/windows.yml'
> diff --git a/.gitlab-ci.d/windows.yml b/.gitlab-ci.d/windows.yml
> new file mode 100644
> index 0000000000..309f7e7fb8
> --- /dev/null
> +++ b/.gitlab-ci.d/windows.yml
> @@ -0,0 +1,98 @@
> +.shared_msys2_builder:
> +  tags:
> +  - shared-windows
> +  - windows
> +  - windows-1809
> +  cache:
> +    key: "${CI_JOB_NAME}-cache"

It would be nice to cache the shared 'before_script' part,
but it doesn't seems trivial; meanwhile this patch works and
is KISS, so:

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> +    paths:
> +      - ${CI_PROJECT_DIR}/msys64/var/cache
> +  needs: []
> +  stage: build
> +  timeout: 70m
> +  before_script:
> +  - If ( !(Test-Path -Path msys64\var\cache ) ) {
> +      mkdir msys64\var\cache
> +    }
> +  - If ( !(Test-Path -Path msys64\var\cache\msys2.exe ) ) {
> +      Invoke-WebRequest
> +      "https://github.com/msys2/msys2-installer/releases/download/2021-07-25/msys2-base-x86_64-20210725.sfx.exe"
> +      -outfile "msys64\var\cache\msys2.exe"
> +    }
> +  - msys64\var\cache\msys2.exe -y
> +  - ((Get-Content -path .\msys64\etc\\post-install\\07-pacman-key.post -Raw)
> +      -replace '--refresh-keys', '--version') |
> +     Set-Content -Path ${CI_PROJECT_DIR}\msys64\etc\\post-install\\07-pacman-key.post
> +  - .\msys64\usr\bin\bash -lc "sed -i 's/^CheckSpace/#CheckSpace/g' /etc/pacman.conf"
> +  - .\msys64\usr\bin\bash -lc 'pacman --noconfirm -Syuu'  # Core update
> +  - .\msys64\usr\bin\bash -lc 'pacman --noconfirm -Syuu'  # Normal update
> +  - taskkill /F /FI "MODULES eq msys-2.0.dll"
> +
> +msys2-64bit:
> +  extends: .shared_msys2_builder
> +  script:
> +  - .\msys64\usr\bin\bash -lc "pacman -Sy --noconfirm --needed
> +      diffutils git grep make sed
> +      mingw-w64-x86_64-capstone
[...]

