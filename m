Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C1134757DC
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 12:36:16 +0100 (CET)
Received: from localhost ([::1]:45220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxSZz-00086x-4Z
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 06:36:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mxSHq-000440-Mw; Wed, 15 Dec 2021 06:17:30 -0500
Received: from [2a00:1450:4864:20::32d] (port=36811
 helo=mail-wm1-x32d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mxSHf-0003gP-Gx; Wed, 15 Dec 2021 06:17:28 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 i8-20020a7bc948000000b0030db7b70b6bso18246776wml.1; 
 Wed, 15 Dec 2021 03:17:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=c6i8uJvFoNbdF5ABRXzfcrmH8ywleb3rAwfZHpuxWKE=;
 b=A+Cq+KnSKZ+AHa6yUt+u6p4laf2MNe7jpmP+wRhPxleMBgEsA/YxCKFjIXjYHk/sOX
 Abme4NhDbqo63Y5NjAhqFE1B9PJlPrtAzelGBgTD4sDGbVYZ+Plhq7xI9ehZpvjMgAOq
 P6QrEMdV1rsltDJSsCvF3H9u0k9EPqxyCh4CknBLfiErSLp0W0lL5dWVSFADerUiF1x8
 SlkkZL0XcGEssf3k4HERfmzGt/6ow0cBj0sYV0Rs5Ufszcl0PORZVvH81zaOLpVQEcXU
 XG6n4M2QpURhiTKy/mlTTXocX6yNC00LNtOSUcIYlky5Ky4I27DLzeaOKfXX7a6YC4DZ
 SXvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=c6i8uJvFoNbdF5ABRXzfcrmH8ywleb3rAwfZHpuxWKE=;
 b=2VNO3RpehFAujMruBiLF449G8I9W8O+HxPzRfgPPxB90sKW2Wysss7BkUjE6Ulbwxf
 Ezo9Z8D1mnsfAbp82avnyTNPhP1hj2gf33PLN+mboPK02jv/Y6a4KD5if7XGOqoNbr1Y
 OQw1GnMvmL4QUXxHogZbifEJdAQxeuBMTE6558UgjyBS4E4UmmFbBIG5X+3ZLQInqQxj
 iP61pUH9eouEk3+zAULO/CUkFTcecVx/Ez7cPpE9TM7Mfp0KGnVC5z1sHbzAJoxJJ2Gt
 WzzgybU/wASJ0fis40HoCSGpCz1WKzNTdP7OoN3LvCPB2OZ/RR89C6E963KW7uQSDFYt
 OKhw==
X-Gm-Message-State: AOAM530qFCKCsnVulnKiv4umn9pGAnsQS8gJkvVEPM94L3hYIwjKQCJ7
 jgPISo2Q/6MgQHFPVz+l+pY=
X-Google-Smtp-Source: ABdhPJwUjSWJWC5rqjOpx46c0lGT6Sw+0T9HCxtiaaP45lwHF/PoEKNSMSMsCAozWZC2n4WTq3hsqQ==
X-Received: by 2002:a7b:cbc3:: with SMTP id n3mr4141425wmi.90.1639567029676;
 Wed, 15 Dec 2021 03:17:09 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id j18sm6165655wmq.44.2021.12.15.03.17.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Dec 2021 03:17:09 -0800 (PST)
Message-ID: <fb033cf6-ab9b-3f85-e95d-0093715de48f@amsat.org>
Date: Wed, 15 Dec 2021 12:17:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] linux-user: Remove the deprecated ppc64abi32 target
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>
References: <20211215084958.185214-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211215084958.185214-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.64,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, Greg Kurz <groug@kaod.org>,
 qemu-ppc@nongnu.org, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/15/21 09:49, Thomas Huth wrote:
> It's likely broken, and nobody cared for picking it up again
> during the deprecation phase, so let's remove this now.
> 
> Since this is the last entry in deprecated_targets_list, remove
> the related code in the configure script, too.

Can we keep that part to keep the gate open to deprecate more
targets / features?

> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  .gitlab-ci.d/buildtest.yml                    | 27 -----------------
>  configs/targets/ppc64abi32-linux-user.mak     |  8 -----
>  configure                                     | 29 +------------------
>  docs/about/deprecated.rst                     |  7 -----
>  docs/about/removed-features.rst               |  8 +++++
>  docs/user/main.rst                            |  1 -
>  linux-user/elfload.c                          |  4 +--
>  linux-user/ppc/signal.c                       | 11 ++-----
>  linux-user/ppc/target_syscall.h               |  4 +--
>  linux-user/syscall_defs.h                     |  6 ++--
>  .../dockerfiles/debian-ppc64el-cross.docker   |  2 +-
>  tests/tcg/configure.sh                        |  2 +-
>  12 files changed, 21 insertions(+), 88 deletions(-)
>  delete mode 100644 configs/targets/ppc64abi32-linux-user.mak

> diff --git a/configure b/configure
> index 48c21775f3..da34ab0e12 100755
> --- a/configure
> +++ b/configure
> @@ -1295,8 +1295,6 @@ if [ "$ARCH" = "unknown" ]; then
>  fi
>  
>  default_target_list=""
> -deprecated_targets_list=ppc64abi32-linux-user
> -deprecated_features=""
>  mak_wilds=""
>  
>  if [ "$softmmu" = "yes" ]; then
> @@ -1309,16 +1307,6 @@ if [ "$bsd_user" = "yes" ]; then
>      mak_wilds="${mak_wilds} $source_path/configs/targets/*-bsd-user.mak"
>  fi
>  
> -# If the user doesn't explicitly specify a deprecated target we will
> -# skip it.
> -if test -z "$target_list"; then
> -    if test -z "$target_list_exclude"; then
> -        target_list_exclude="$deprecated_targets_list"
> -    else
> -        target_list_exclude="$target_list_exclude,$deprecated_targets_list"
> -    fi
> -fi
> -
>  for config in $mak_wilds; do
>      target="$(basename "$config" .mak)"
>      if echo "$target_list_exclude" | grep -vq "$target"; then
> @@ -1337,11 +1325,9 @@ Standard options:
>    --prefix=PREFIX          install in PREFIX [$prefix]
>    --interp-prefix=PREFIX   where to find shared libraries, etc.
>                             use %M for cpu name [$interp_prefix]
> -  --target-list=LIST       set target list (default: build all non-deprecated)
> +  --target-list=LIST       set target list (default: build all)
>  $(echo Available targets: $default_target_list | \
>    fold -s -w 53 | sed -e 's/^/                           /')
> -$(echo Deprecated targets: $deprecated_targets_list | \
> -  fold -s -w 53 | sed -e 's/^/                           /')
>    --target-list-exclude=LIST exclude a set of targets from the default target-list
>  
>  Advanced options (experts only):
> @@ -1827,13 +1813,6 @@ else
>      done
>  fi
>  
> -for target in $target_list; do
> -    # if a deprecated target is enabled we note it here
> -    if echo "$deprecated_targets_list" | grep -q "$target"; then
> -        add_to deprecated_features $target
> -    fi
> -done
> -
>  # see if system emulation was really requested
>  case " $target_list " in
>    *"-softmmu "*) softmmu=yes
> @@ -4017,12 +3996,6 @@ else
>    fi
>  fi
>  
> -if test -n "${deprecated_features}"; then
> -    echo "Warning, deprecated features enabled."
> -    echo "Please see docs/about/deprecated.rst"
> -    echo "  features: ${deprecated_features}"
> -fi
> -

