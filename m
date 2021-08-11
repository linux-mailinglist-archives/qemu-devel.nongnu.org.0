Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EEFB3E8A2C
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Aug 2021 08:21:59 +0200 (CEST)
Received: from localhost ([::1]:52780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDhcj-0001XD-RQ
	for lists+qemu-devel@lfdr.de; Wed, 11 Aug 2021 02:21:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mDhbX-0000p7-Rl
 for qemu-devel@nongnu.org; Wed, 11 Aug 2021 02:20:44 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:41617)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mDhbV-0005OB-VU
 for qemu-devel@nongnu.org; Wed, 11 Aug 2021 02:20:43 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 m28-20020a05600c3b1cb02902b5a8c22575so1182053wms.0
 for <qemu-devel@nongnu.org>; Tue, 10 Aug 2021 23:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=flc3BXbBh0xvJQcsMhzcs7zSAqbMhACEoVjKvmR1GMg=;
 b=hsVHTWbnl4MxeqtpsRM7Idrjdra4+Vf25u17+4VOHZtkVkJEiruprNrIiEW5g0PaCp
 YTZp00ErR/snxdwBc4SI9mpdGREc6VLdy71G5lkqXpHFqPwy+oOtOHxxUllDEbbJnJh2
 9v8KtLF9x4dFdb1gX5boyIfC6SdK/KFyv6WZ+WN2oxDM8ReRg+oPWf9LKyRQ/qDuTAnO
 xMVaiK0xjq7UT6JzmZuXaxiW2UNSgF3MOsMChITohWzAWLHh/SHMjmTnXJB1Hhef6VIx
 Y+oP5RwQP/Eg5PaSA/R99Y0MLF8O5mjgQvtpi0wapDj7P3pIXgzVGx5RdnoAA2jXpW9A
 Xxww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=flc3BXbBh0xvJQcsMhzcs7zSAqbMhACEoVjKvmR1GMg=;
 b=TOoR85wdP1eCiymovxAtVGqIgu4zSvhmW8RoXtZSiDyRxq9xUfmASZmq4lbtAujzSP
 lIl7umhgsuvPeb/5oPxWPQx/s3z3mDetzbQUNBnXVewJcu4QGjy1kVhEvq2Cr+4T+afZ
 lljZ/3R03pp+qwMiBxbPZk/UkywUWsO8FmNdxAZTSVxMeJf8IN2pbl3pYWlbYn+EmdZy
 Fgd7Bx87v+yCARdgl9yS8VGFR0ZIQlr3/eaBIK64/dStbtOYzdpvNkD3e9CMasMVr4fi
 vxEMcQPMsTx+ecKRQzLYBk+PVpVqHkyqhHSKIbxtpywIzLnJgy3IKUqDXR5W8ScF9gWV
 s95g==
X-Gm-Message-State: AOAM533iYozBm14VkGl8IpgK/pn+TjhETXdS4ajMSHYvDh0Ca9LyUQsy
 MWO0F28dzuqj3UOjdwugLUk=
X-Google-Smtp-Source: ABdhPJz/WqDXZMePggs+pNpLvLGgK0Jvsvzdkqv5rErkUpCSie4MTI+OTBkHdkUwvP/VEGDKHKVUtA==
X-Received: by 2002:a05:600c:1c89:: with SMTP id
 k9mr25889210wms.78.1628662839902; 
 Tue, 10 Aug 2021 23:20:39 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id t1sm4975040wma.25.2021.08.10.23.20.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Aug 2021 23:20:38 -0700 (PDT)
Subject: Re: [PATCH 2/2] gitlab: skip many more targets in windows cross builds
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20210810140653.3969823-1-berrange@redhat.com>
 <20210810140653.3969823-3-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <1a43f8c6-24f8-9aee-d321-04f5a8ecc6ee@amsat.org>
Date: Wed, 11 Aug 2021 08:20:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210810140653.3969823-3-berrange@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
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
Cc: Willian Rampazzo <willianr@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/10/21 4:06 PM, Daniel P. Berrangé wrote:
> The windows cross builds still take way too long in gitlab CI, so need
> more targets to be skipped. We don't want to hurt coverage of other
> cross builds more though, so we let jobs fine tune with a new env
> variale $CROSS_SKIP_TARGETS.
> 
> We take the set of targets that are considered relatively niche or
> very old architectures, and skip approx half of them in win32 builds
> and the other half of them in win64.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  .gitlab-ci.d/crossbuild-template.yml | 2 +-
>  .gitlab-ci.d/crossbuilds.yml         | 2 ++
>  2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/.gitlab-ci.d/crossbuild-template.yml b/.gitlab-ci.d/crossbuild-template.yml
> index cfb576b54c..10d22dcf6c 100644
> --- a/.gitlab-ci.d/crossbuild-template.yml
> +++ b/.gitlab-ci.d/crossbuild-template.yml
> @@ -10,7 +10,7 @@
>          --disable-user --target-list-exclude="arm-softmmu cris-softmmu
>            i386-softmmu microblaze-softmmu mips-softmmu mipsel-softmmu
>            mips64-softmmu ppc-softmmu riscv32-softmmu sh4-softmmu
> -          sparc-softmmu xtensa-softmmu"
> +          sparc-softmmu xtensa-softmmu $CROSS_SKIP_TARGETS"
>      - make -j$(expr $(nproc) + 1) all check-build $MAKE_CHECK_ARGS
>      - if grep -q "EXESUF=.exe" config-host.mak;
>        then make installer;
> diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
> index 4ff3aa3cfc..a5f9dbcbeb 100644
> --- a/.gitlab-ci.d/crossbuilds.yml
> +++ b/.gitlab-ci.d/crossbuilds.yml
> @@ -160,6 +160,7 @@ cross-win32-system:
>      job: win32-fedora-cross-container
>    variables:
>      IMAGE: fedora-win32-cross
> +    CROSS_SKIP_TARGETS: or1k-softmmu rx-softmmu sh4eb-softmmu sparc64-softmmu tricore-softmmu xtensaeb-softmmu
>    artifacts:
>      paths:
>        - build/qemu-setup*.exe
> @@ -170,6 +171,7 @@ cross-win64-system:
>      job: win64-fedora-cross-container
>    variables:
>      IMAGE: fedora-win64-cross
> +    CROSS_SKIP_TARGETS: alpha-softmmu avr-softmmu hppa-softmmu m68k-softmmu microblazeel-softmmu mips64el-softmmu nios2-softmmu

It looks you inverted the lists. We expect more Win64 users, and these
are the targets of interest. I'd keep here (skipping in Win32):

alpha-softmmu avr-softmmu hppa-softmmu m68k-softmmu microblazeel-softmmu
mips64el-softmmu sparc64-softmmu

And skip (keep them in win32):

or1k-softmmu rx-softmmu sh4eb-softmmu nios2-softmmu tricore-softmmu
xtensaeb-softmmu

>    artifacts:
>      paths:
>        - build/qemu-setup*.exe
> 

