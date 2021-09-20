Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D5B6411DF2
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 19:24:55 +0200 (CEST)
Received: from localhost ([::1]:55162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSN2E-0004dB-NN
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 13:24:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSN10-0003DV-GU
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 13:23:38 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:43834)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSN0y-0002sI-SE
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 13:23:38 -0400
Received: by mail-pg1-x536.google.com with SMTP id r2so18070146pgl.10
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 10:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=ufrLo4/4KwDazrW+Sq8XvXag+PG5hvx5nX3bk8T9s9Q=;
 b=jGdm8VrzmYOdz7Wm/+XrM7Px4NxVebVR0MfRhHTQwqDblBDVRpQ82tQVacEPuZabVS
 DZnBjLZGey0+bzI7axhfrYAY8v6lcyJK7t3dyBPdn80lLQ6wv8uXT1BCsSJ1LYpvToXm
 vgjQtqPvpCExclgw6ztbzVamySX6XDZ52KuSC84lRR7bLRzWzd5M0C7TP3fmcGxNve+N
 khSI/ynCa7FHMAzWzxvebGQVCNcTjwPWMu4k17KnAVkP8EKB2+RVGZEifxuO9OWWHoKw
 Px7c343MbCq689Zm6OooHWpRloJSs2/IZFvqN3HadhujcWdsqhfWZxcUvlCTSisbHWk2
 r1GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ufrLo4/4KwDazrW+Sq8XvXag+PG5hvx5nX3bk8T9s9Q=;
 b=v2pjZLt9jquYt6dh0z9WCIjO87q1/fJmZ1RE4d1+8jNOhQrzCj00/hq3GM2NaPsQ/3
 TVxgLn4yeTq4hJDdhykvr5QqFWub8MPy2AYvFHSIdqnvB/jCL6StGdXqQ57hiRnRZS79
 IajpGTzTSGsLrWpywuOz8fXyhF3xUp3ZYEiDuKZaFsZtKDecNKPoH5by9P28Zw8ZnQBv
 MGkDeR6CwXPVGLgYtqR5dwYjW3n6eyJ2EMNY8r/97KPd/cxcvu1UdiRFObRTf1IcJEyR
 BG/BM3M5esHGdZedtxBQ8D/zPfdLMkLA0qo7hXbq/wmDTBTO3e/2NamYKMPKE50XJlTe
 0aqA==
X-Gm-Message-State: AOAM532quXBnQs8RHz5wdbxNdMRFE6xnmQ9FDt9vgC7cVwjUMa3v0qJo
 DzcoNNNYOIEnsEQrl4wJSQ6HAC1Pe5jYDg==
X-Google-Smtp-Source: ABdhPJzvvTgUH4NuCWkK+zfpwXo+t9xaCxhqzWi+/FD5VWH4WBHrQF5nAqNNX0bSl+3kh8TR2PrisA==
X-Received: by 2002:a62:60c2:0:b0:446:b494:39cc with SMTP id
 u185-20020a6260c2000000b00446b49439ccmr13204153pfb.22.1632158615174; 
 Mon, 20 Sep 2021 10:23:35 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id t8sm61847pjt.39.2021.09.20.10.23.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Sep 2021 10:23:34 -0700 (PDT)
Subject: Re: [PATCH 28/30] configure, meson.build: Mark support for 64-bit
 LoongArch hosts
To: WANG Xuerui <git@xen0n.name>, qemu-devel@nongnu.org
References: <20210920080451.408655-1-git@xen0n.name>
 <20210920080451.408655-29-git@xen0n.name>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <de7efdfe-24ae-015c-015d-50acc245df1c@linaro.org>
Date: Mon, 20 Sep 2021 10:23:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210920080451.408655-29-git@xen0n.name>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/20/21 1:04 AM, WANG Xuerui wrote:
> Signed-off-by: WANG Xuerui <git@xen0n.name>
> ---
>   configure   | 4 +++-
>   meson.build | 4 +++-
>   2 files changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/configure b/configure
> index 1043ccce4f..f1bc85e71b 100755
> --- a/configure
> +++ b/configure
> @@ -659,6 +659,8 @@ elif check_define __arm__ ; then
>     cpu="arm"
>   elif check_define __aarch64__ ; then
>     cpu="aarch64"
> +elif check_define __loongarch64 ; then
> +  cpu="loongarch64"
>   else
>     cpu=$(uname -m)
>   fi
> @@ -667,7 +669,7 @@ ARCH=
>   # Normalise host CPU name and set ARCH.
>   # Note that this case should only have supported host CPUs, not guests.
>   case "$cpu" in
> -  ppc|ppc64|s390x|sparc64|x32|riscv32|riscv64)
> +  ppc|ppc64|s390x|sparc64|x32|riscv32|riscv64|loongarch64)
>     ;;
>     ppc64le)
>       ARCH="ppc64"
> diff --git a/meson.build b/meson.build
> index 2711cbb789..fb3befead5 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -57,7 +57,7 @@ python = import('python').find_installation()
>   
>   supported_oses = ['windows', 'freebsd', 'netbsd', 'openbsd', 'darwin', 'sunos', 'linux']
>   supported_cpus = ['ppc', 'ppc64', 's390x', 'riscv32', 'riscv64', 'x86', 'x86_64',
> -  'arm', 'aarch64', 'mips', 'mips64', 'sparc', 'sparc64']
> +  'arm', 'aarch64', 'loongarch64', 'mips', 'mips64', 'sparc', 'sparc64']
>   
>   cpu = host_machine.cpu_family()
>   targetos = host_machine.system()
> @@ -269,6 +269,8 @@ if not get_option('tcg').disabled()
>       tcg_arch = 's390'
>     elif config_host['ARCH'] in ['x86_64', 'x32']
>       tcg_arch = 'i386'
> +  elif config_host['ARCH'] == 'loongarch64'
> +    tcg_arch = 'loongarch'

Be consistent with loongarch or loongarch64 everywhere.

If there's no loongarch32, and never will be, then there's probably no point in keeping 
the '64' suffix.


r~

