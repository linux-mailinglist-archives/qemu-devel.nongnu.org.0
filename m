Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE29F4A9D91
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 18:19:58 +0100 (CET)
Received: from localhost ([::1]:36116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nG2FZ-0000Uk-PJ
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 12:19:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nG1sI-00031I-Ry
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 11:55:54 -0500
Received: from [2a00:1450:4864:20::429] (port=34580
 helo=mail-wr1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nG1sG-0003Kx-UG
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 11:55:54 -0500
Received: by mail-wr1-x429.google.com with SMTP id f17so12523922wrx.1
 for <qemu-devel@nongnu.org>; Fri, 04 Feb 2022 08:55:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=C/pwQ/CYdi1NBmOAg9FmarPLO+r0l8O6zGRqPHHgqPs=;
 b=ZWRzHGMEaCQN88gsAtmbfCWRU6SI/YQmgm4n7ez7AoDJXJWt4fInh6/S5a70jlx2F2
 38DOLWXLFZ9s/1A4RF/qLQZSm3TsqP8IZXJURGRGlQEL6LFGYLZ/K/tDARMFIV+qzj65
 zAznCzm8P4mVmh/x1Hr09Hm2Y2yhFrX9OI4E6zlaxVZzUz4pul2G0v4AHDIeVcxlZxk+
 rA5uNzfCzmw2xzIcx/r4IlZieXAOnnkqqES1wLAbnjso7zp1pLuJvukFllW5TIenMsAj
 Y3cunfHjZNB5DzvU/EnnhyA9kBzWIHsDDLjBPktVzGK05qSqbad4Ylmpupl9rJudkDUh
 VaGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=C/pwQ/CYdi1NBmOAg9FmarPLO+r0l8O6zGRqPHHgqPs=;
 b=pCs8YyFLlGPDIpJIdJXZY0LWRRi9syq2oU7B1a0AI/L1bEIx85gre7jeGAMarLyLwc
 kp16w6ktNbnzOb/wKF/4bc6C8wwG6ZnIuqxpNuIPR/89FZaaJNwaiKqd4pP6iw0S/ECq
 AluDeMPRupberK31L41rKtaObqBJcC/YDP30E+RuqBh8Uf3LBgUj0s8Wl0Wg4u9Qfe0L
 ETV+T5VWVSuRMg3qcvX0J9U03ZyW5hlAlJROockmFthO57mdCPbg2ZKfR4zgWungZu11
 jnSspDmLXTzRM3z6kT0aOx1h/iexuM5nJNC56MoOxxWvxutdFwGjVNkwjirUh+zm/gLp
 c9IA==
X-Gm-Message-State: AOAM533RIC/A53u/rU8WMUYmGUpV3eZFASFiNeandh093TUCkixmb/38
 w+CeHiunyibCKQXVUQ4F3yI=
X-Google-Smtp-Source: ABdhPJxboxLp16j0P/68lDaNp98R0YZV+FMw8ohph6TOu76AuCCMcgAr7lMEUF4kYpmhK8WWOINZRA==
X-Received: by 2002:a5d:6381:: with SMTP id p1mr3165271wru.549.1643993744321; 
 Fri, 04 Feb 2022 08:55:44 -0800 (PST)
Received: from ?IPV6:2001:b07:add:ec09:c399:bc87:7b6c:fb2a?
 ([2001:b07:add:ec09:c399:bc87:7b6c:fb2a])
 by smtp.googlemail.com with ESMTPSA id r2sm2633792wra.57.2022.02.04.08.55.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Feb 2022 08:55:43 -0800 (PST)
Message-ID: <bc21a46a-4164-eb11-5a90-99d7951de53c@redhat.com>
Date: Fri, 4 Feb 2022 17:55:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/4] configure: Restrict TCG to emulation
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220204152924.6253-1-f4bug@amsat.org>
 <20220204152924.6253-2-f4bug@amsat.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220204152924.6253-2-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::429
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/4/22 16:29, Philippe Mathieu-Daudé via wrote:
> If we don't need to emulate any target, we certainly don't need TCG.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   configure | 12 ++++++++++--
>   1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/configure b/configure
> index 9f40d60196..4002f81ac9 100755
> --- a/configure
> +++ b/configure
> @@ -370,7 +370,7 @@ slirp="auto"
>   default_devices="true"
>   
>   # 3. Automatically enable/disable other options
> -tcg="enabled"
> +tcg="auto"
>   cfi="false"
>   
>   # 4. Detection partly done in configure
> @@ -1777,7 +1777,7 @@ EOF
>     fi
>   fi
>   
> -if test "$tcg" = "enabled"; then
> +if test "$tcg" != "disabled"; then
>       git_submodules="$git_submodules tests/fp/berkeley-testfloat-3"
>       git_submodules="$git_submodules tests/fp/berkeley-softfloat-3"
>   fi

This should be in patch 2, and it should at the same time move this "if" 
after auto is changed to "disabled/enabled" below.

Paolo

> @@ -1819,6 +1819,14 @@ case " $target_list " in
>     ;;
>   esac
>   
> +if test "$tcg" = "auto"; then
> +  if test -z "$target_list"; then
> +    tcg="disabled"
> +  else
> +    tcg="enabled"
> +  fi
> +fi

>   feature_not_found() {
>     feature=$1
>     remedy=$2


