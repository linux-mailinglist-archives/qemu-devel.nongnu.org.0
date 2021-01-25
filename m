Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA34F30278E
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 17:14:46 +0100 (CET)
Received: from localhost ([::1]:37644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l44Vp-0001ks-Q1
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 11:14:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l44Tg-0000oq-N3
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 11:12:32 -0500
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:37002)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l44Te-0005gL-1R
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 11:12:32 -0500
Received: by mail-ed1-x535.google.com with SMTP id g1so16063358edu.4
 for <qemu-devel@nongnu.org>; Mon, 25 Jan 2021 08:12:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+GTqdiXrkwABuO9MFTvUmNBT2HQ8zEm3jBiealtw/os=;
 b=m09osZxVjZtaiiUvnYPEO/TFp+lpWzLfaASEBjydtq46RTd5u3vIUedsADc3NVB9ET
 zOCZkjEdE0Z05khoC6ubc9z0jS6C5JwJtEvG7xkjpJgDrbia0dUdD4I/dSCzu04mFaZ3
 egYERNswv9UXk/S6rD/RFohAq3b4X/nR4Of56Rht2wvReStVwEiQhbgfx9HBRY/srTMb
 xwznub+D7JGKtArRz4K7H3z/6D52iRI4VIjtu4iGkjpIbT9rqu71QFykJBbSX20tL/Nr
 Gpm9MQpRLoHOTsK78lEcIss18NmHU/MLZcjwOLgW/0t+F7tkds7sDI/eSF5xznjW/sYm
 zGFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+GTqdiXrkwABuO9MFTvUmNBT2HQ8zEm3jBiealtw/os=;
 b=YHOJEyyNPK2uZEz79sQoqL1KT9PehfFsHp65C/3vWjkr5A5VJJuPELtJEDi00Z1MZo
 ua205KAgVZRSNzPsO/Lia3Og7gJA5zIFbyHcFgUsVMQd42vXR3bzbcFNh59VSznaEtZJ
 MmpujSEQKOSzLySHaar+Feoh6YzdviOXvtV0vfFrAoTW6fOq100J13Cg4IDZA04AZ9Nr
 95+eCKNVtM1JQLs0hHHQNUBV5li6LQHhHv2WIkXoxamOvCdSReTLvN8557BJCWyre9JQ
 6l0JAYuCZQ+tN9+fASE5TMluVzn9sCzdHRAu9WpdFLb/QJVSgcWgE5id2UnEVJHzR94j
 oYbw==
X-Gm-Message-State: AOAM531t17CFzwPNvHrTQm0TPBTsukXpl/yZMPTiYVN+pAMrxlfXbcOO
 NmGY7Om9pNVCbEELwCISo28=
X-Google-Smtp-Source: ABdhPJwvZckXyiSKW/H/e1Hl1cvj0uyZCzL+GuRiwzkeTgCllu7SlKU8k5mvqcEEeGw7/S8/Pw9V3A==
X-Received: by 2002:a05:6402:1c0b:: with SMTP id
 ck11mr1091269edb.35.1611591148233; 
 Mon, 25 Jan 2021 08:12:28 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id p27sm8562439ejd.72.2021.01.25.08.12.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Jan 2021 08:12:27 -0800 (PST)
Subject: Re: [PATCH] nsis: adjust for new MinGW paths
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210121134813.1002946-1-pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <65517661-cc63-8b98-4d7b-70969322cb6f@amsat.org>
Date: Mon, 25 Jan 2021 17:12:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210121134813.1002946-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x535.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: Stefan Weil <sw@weilnetz.de>, Joshua Watt <jpewhacker@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Forgot to Cc the maintainer, doing it now:

./scripts/get_maintainer.pl -f qemu.nsi
Stefan Weil <sw@weilnetz.de> (maintainer:W32, W64)

On 1/21/21 2:48 PM, Paolo Bonzini wrote:
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  qemu.nsi | 42 ++++--------------------------------------
>  1 file changed, 4 insertions(+), 38 deletions(-)
> 
> diff --git a/qemu.nsi b/qemu.nsi
> index 1a0112265b..c3df8c9d3b 100644
> --- a/qemu.nsi
> +++ b/qemu.nsi
> @@ -35,11 +35,6 @@
>  !define OUTFILE "qemu-setup.exe"
>  !endif
>  
> -; Optionally install documentation.
> -!ifndef CONFIG_DOCUMENTATION
> -!define CONFIG_DOCUMENTATION
> -!endif
> -
>  ; Use maximum compression.
>  SetCompressor /SOLID lzma
>  
> @@ -116,26 +111,13 @@ Section "${PRODUCT} (required)"
>      ; Set output path to the installation directory.
>      SetOutPath "$INSTDIR"
>  
> -    File "${SRCDIR}\Changelog"
>      File "${SRCDIR}\COPYING"
>      File "${SRCDIR}\COPYING.LIB"
>      File "${SRCDIR}\README.rst"
>      File "${SRCDIR}\VERSION"
>  
> -    File "${BINDIR}\*.bmp"
> -    File "${BINDIR}\*.bin"
> -    File "${BINDIR}\*.dtb"
> -    File "${BINDIR}\*.fd"
> -    File "${BINDIR}\*.img"
> -    File "${BINDIR}\*.lid"
> -    File "${BINDIR}\*.ndrv"
> -    File "${BINDIR}\*.rom"
> -    File "${BINDIR}\openbios-*"
> -
>      File /r "${BINDIR}\keymaps"
> -!ifdef CONFIG_GTK
>      File /r "${BINDIR}\share"
> -!endif
>  
>  !ifdef W64
>      SetRegView 64
> @@ -176,21 +158,11 @@ SectionEnd
>  
>  !ifdef CONFIG_DOCUMENTATION
>  Section "Documentation" SectionDoc
> -    SetOutPath "$INSTDIR"
> -    File "${BINDIR}\index.html"
> -    SetOutPath "$INSTDIR\interop"
> -    FILE /r "${BINDIR}\interop\*.*"
> -    SetOutPath "$INSTDIR\specs"
> -    FILE /r "${BINDIR}\specs\*.*"
> -    SetOutPath "$INSTDIR\system"
> -    FILE /r "${BINDIR}\system\*.*"
> -    SetOutPath "$INSTDIR\tools"
> -    FILE /r "${BINDIR}\tools\*.*"
> -    SetOutPath "$INSTDIR\user"
> -    FILE /r "${BINDIR}\user\*.*"
> +    SetOutPath "$INSTDIR\doc"
> +    File /r "${BINDIR}\doc"
>      SetOutPath "$INSTDIR"
>      CreateDirectory "$SMPROGRAMS\${PRODUCT}"
> -    CreateShortCut "$SMPROGRAMS\${PRODUCT}\User Documentation.lnk" "$INSTDIR\index.html" "" "$INSTDIR\index.html" 0
> +    CreateShortCut "$SMPROGRAMS\${PRODUCT}\User Documentation.lnk" "$INSTDIR\doc\index.html" "" "$INSTDIR\doc\index.html" 0
>  SectionEnd
>  !endif
>  
> @@ -238,13 +210,7 @@ Section "Uninstall"
>      Delete "$INSTDIR\qemu-io.exe"
>      Delete "$INSTDIR\qemu.exe"
>      Delete "$INSTDIR\qemu-system-*.exe"
> -    Delete "$INSTDIR\index.html"
> -    RMDir /r "$INSTDIR\interop"
> -    RMDir /r "$INSTDIR\specs"
> -    RMDir /r "$INSTDIR\system"
> -    RMDir /r "$INSTDIR\tools"
> -    RMDir /r "$INSTDIR\user"
> -    RMDir /r "$INSTDIR\keymaps"
> +    RMDir /r "$INSTDIR\doc"
>      RMDir /r "$INSTDIR\share"
>      ; Remove generated files
>      Delete "$INSTDIR\stderr.txt"
> 


