Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BACD44EA30A
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 00:39:41 +0200 (CEST)
Received: from localhost ([::1]:53558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYy1U-0001bD-RN
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 18:39:40 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nYxzy-0000oR-G0
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 18:38:09 -0400
Received: from [2607:f8b0:4864:20::102e] (port=37442
 helo=mail-pj1-x102e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nYxzw-0007QE-Ut
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 18:38:06 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 g9-20020a17090ace8900b001c7cce3c0aeso562290pju.2
 for <qemu-devel@nongnu.org>; Mon, 28 Mar 2022 15:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=FSJJiFvPfwQULKnC4YTvVCXDPe/fMphxeI8keO/aFfI=;
 b=ktIvLNEBS9V+VAtAzhxQrNlRq3XGKK7ug2iBOIPPmFWF+rGV5OpTASm5FHJhXPaeKk
 OnyAo/JIaMkWjshwcl3etEq1wzS2A5MZ+WVVAvlC5DNz6LPY/NITfqSOPv8i88Lz0PNi
 wRDKvZGRX3zZhKrZIE4tTI+KTiz9bVRyKQkBP6VLpx1VSRM3O6bgCEHdMH14qZhromRc
 /z2bTWcG26BlD2l1ki8ikDTUueP8Sgb0rmqYNY3E64Nm0GzxGLL361FFwajb5AuTjZQP
 Zm5vLgIxdrBlAuy5+cvl4TvrAhZNRVZ5bFW/gI8lftUgA05Nbg55XxcP+3J9jR/N+OCe
 Vjsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=FSJJiFvPfwQULKnC4YTvVCXDPe/fMphxeI8keO/aFfI=;
 b=1U6orzhz2AezIdbR/SfaKgOY4Ii8zOPOinbp5jWJSwVJ1ymo+LcKfoXAK7NcFVaAWG
 hzLLmsJ7Mhl3wnYz+fVedZaK1JPrHP/CfnnEx162h4ORNknAdc36U/tzudbnEzJr4Bjx
 fwSg+kurvMWqOLqQfClpG4fi6pKrrtQt8bDsshsIEJcoyaua/MHMV/ORDsfcEnuqOGo/
 G4AmO2xu0pfz/I0Kw/70NBxNXSfPp8kBT4D7GX5KG/znmcgyESy4TzwCUfqVfIy7SzoE
 grLvYa0GHCrJDS68oOoUUL7EtT6EcWPNS+EJTqAZ1m/gfMIK5EYn10oEEhzEgmFqdi1+
 7xGg==
X-Gm-Message-State: AOAM533E3/d6kiSeoQ8prKMnfUyUB1QJvTDdyYgQKFyEAiVF4jyXo5Py
 JgmQQXrZusDeUls3oKwApd8=
X-Google-Smtp-Source: ABdhPJxSxLhw8M0OQUOUb0eBxEZtn6VMozE00k1YzFeNjoSCmw0yDiSgFAbepgy8jPsFwAPBp3jOhA==
X-Received: by 2002:a17:902:d315:b0:156:1109:6e55 with SMTP id
 b21-20020a170902d31500b0015611096e55mr6938566plc.130.1648507083653; 
 Mon, 28 Mar 2022 15:38:03 -0700 (PDT)
Received: from ?IPV6:2600:70ff:f07f:0:3c84:1cd:456b:b750?
 ([2600:70ff:f07f:0:3c84:1cd:456b:b750])
 by smtp.gmail.com with ESMTPSA id
 c21-20020a637255000000b003822e80f132sm13796023pgn.12.2022.03.28.15.38.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Mar 2022 15:38:03 -0700 (PDT)
Message-ID: <5121832b-68c7-c8de-4099-d300f2d642b9@gmail.com>
Date: Tue, 29 Mar 2022 00:37:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH 10/15] tests/tcg: remove CONFIG_USER_ONLY from
 config-target.mak
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20220328140240.40798-1-pbonzini@redhat.com>
 <20220328140240.40798-11-pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220328140240.40798-11-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 28/3/22 16:02, Paolo Bonzini wrote:
> Just check the target name instead.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   tests/tcg/Makefile.target |  8 ++++----
>   tests/tcg/configure.sh    | 12 +++---------
>   2 files changed, 7 insertions(+), 13 deletions(-)

> diff --git a/tests/tcg/configure.sh b/tests/tcg/configure.sh
> index b09956c14d..a17db8ce64 100755
> --- a/tests/tcg/configure.sh
> +++ b/tests/tcg/configure.sh
> @@ -225,18 +225,12 @@ for target in $target_list; do
>     echo "TARGET_NAME=$arch" >> $config_target_mak
>     echo "target=$target" >> $config_target_mak
>     case $target in
> -    *-linux-user)
> -      echo "CONFIG_USER_ONLY=y" >> $config_target_mak
> -      echo "QEMU=$PWD/qemu-$arch" >> $config_target_mak
> -      ;;
> -    *-bsd-user)
> -      echo "CONFIG_USER_ONLY=y" >> $config_target_mak
> -      echo "QEMU=$PWD/qemu-$arch" >> $config_target_mak
> -      ;;
>       *-softmmu)
> -      echo "CONFIG_SOFTMMU=y" >> $config_target_mak
>         echo "QEMU=$PWD/qemu-system-$arch" >> $config_target_mak
>         ;;
> +    *)

Can we restrict to:

        *-user)

just in case?

> +      echo "QEMU=$PWD/qemu-$arch" >> $config_target_mak
> +      ;;
>     esac

With '*-user':
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>



