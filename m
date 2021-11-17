Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D8B454275
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 09:14:05 +0100 (CET)
Received: from localhost ([::1]:56664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnG4y-0001Zm-93
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 03:14:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mnG2y-0000rz-Rr
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 03:12:00 -0500
Received: from [2a00:1450:4864:20::32f] (port=44988
 helo=mail-wm1-x32f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mnG2w-0008If-P3
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 03:12:00 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 c71-20020a1c9a4a000000b0032cdcc8cbafso1391925wme.3
 for <qemu-devel@nongnu.org>; Wed, 17 Nov 2021 00:11:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=uaNUgfE8A7fhnbvPNdDUJPRDNAJSBITgH4IoQmeR0aU=;
 b=UDbS9pd78greEFCVTfGOOag/PSDRYlvtt04PVFe9BeX0C4Tfj5EvPU8j1ALdOjT0I4
 JPiejtokLFF0f7Wah8i9D0DJnXPsZffjrKiaMKX6GF5BLO/WYoVODPaR8JBeVerRq5PM
 yM415/NObKoTVCTnY/Y8VlbLa36Sv5sNdylLjwgPVQVDZUCamXyDyPyvxs19pJWBfVP7
 NR6lHvr4Z2xkKj8ScStxEermYSfw2PZT8YifPShVgBwxlpk/KxK9flgTT/n82w1nU8R2
 SJh47uXcM7RoLAU63HoakWtopzIC4hzYLB89AVPOFzCQdNIm/vv5hX/QOe8+yrUDInf2
 ihYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=uaNUgfE8A7fhnbvPNdDUJPRDNAJSBITgH4IoQmeR0aU=;
 b=3cCNaMCk9BVGaDSwFfCDKX+3Gb1bLokua52Tky3aeoV0VFKDv+PqOun8C9y2YfVFhT
 +AQbi2yzGfzMe8hEsmwR9UXfDLR0M9GENGkrfIN3L/q9wHahzegd9OhtHe8jEKO/RtQS
 K7D1dkaqw0yC9P0JQ7RHHYG5GHhVLusUle2GJLpvG8xC+JxLJlYZ3wHU9GD+JOiiWGN1
 wR2UwLYRlKHo5iI+yJVnfYJhnHwwZLl+7RLGyYzBvOqHVAlsja5Rtj/okMWNqcmyEMk2
 JusiO2tQb2GLrJhu3sg10RtLvE71y0g0c5+NjXsdvWY0xKZh3OHs6i/X1nbhCvp0kzHW
 BJMQ==
X-Gm-Message-State: AOAM53357KMwhOan14zilwCXUp1a3GWYEem/pK5zJxW3+cTGXSIGw+2L
 4DFb511qDdx2KL0Zo13l5TY=
X-Google-Smtp-Source: ABdhPJwr1XinH/0kaLLdAeo4Lj+ioDWzKs47FSx2Xt7wQyimTwu/qW33quOFi7wViYHdv0gCSJ3xUw==
X-Received: by 2002:a1c:4c04:: with SMTP id z4mr3968362wmf.11.1637136716173;
 Wed, 17 Nov 2021 00:11:56 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id j40sm5330417wms.19.2021.11.17.00.11.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Nov 2021 00:11:55 -0800 (PST)
Message-ID: <57cf3430-74ec-48f4-cbeb-3f2a1d97a298@amsat.org>
Date: Wed, 17 Nov 2021 09:11:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 3/9] linux-user/safe-syscall.inc.S: Move to common-user
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20211116110256.365484-1-richard.henderson@linaro.org>
 <20211116110256.365484-4-richard.henderson@linaro.org>
 <CANCZdfoaw3X=ArOz2+tdZJ+gLRS7Wizzyc7MFHXrJyGH0nPVww@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <CANCZdfoaw3X=ArOz2+tdZJ+gLRS7Wizzyc7MFHXrJyGH0nPVww@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.009,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/16/21 22:03, Warner Losh wrote:
> On Tue, Nov 16, 2021 at 4:03 AM Richard Henderson
> <richard.henderson@linaro.org <mailto:richard.henderson@linaro.org>> wrote:
> 
>     From: Warner Losh <imp@bsdimp.com <mailto:imp@bsdimp.com>>
> 
>     Move all the safe_syscall.inc.S files to common-user. They are almost
>     identical between linux-user and bsd-user to re-use.
> 
>     Signed-off-by: Warner Losh <imp@bsdimp.com <mailto:imp@bsdimp.com>>
>     Reviewed-by: Richard Henderson <richard.henderson@linaro.org
>     <mailto:richard.henderson@linaro.org>>
>     Message-Id: <20211113045603.60391-4-imp@bsdimp.com
>     <mailto:20211113045603.60391-4-imp@bsdimp.com>>
>     Signed-off-by: Richard Henderson <richard.henderson@linaro.org
>     <mailto:richard.henderson@linaro.org>>
>     ---
>      meson.build                                                 | 1 +
>      {linux-user => common-user}/host/aarch64/hostdep.h          | 0
>      {linux-user => common-user}/host/arm/hostdep.h              | 0
>      {linux-user => common-user}/host/i386/hostdep.h             | 0
>      {linux-user => common-user}/host/ppc64/hostdep.h            | 0
>      {linux-user => common-user}/host/riscv/hostdep.h            | 0
>      {linux-user => common-user}/host/s390x/hostdep.h            | 0
>      {linux-user => common-user}/host/x86_64/hostdep.h           | 0
>      {linux-user => common-user}/host/aarch64/safe-syscall.inc.S | 0
>      {linux-user => common-user}/host/arm/safe-syscall.inc.S     | 0
>      {linux-user => common-user}/host/i386/safe-syscall.inc.S    | 0
>      {linux-user => common-user}/host/ppc64/safe-syscall.inc.S   | 0
>      {linux-user => common-user}/host/riscv/safe-syscall.inc.S   | 0
>      {linux-user => common-user}/host/s390x/safe-syscall.inc.S   | 0
>      {linux-user => common-user}/host/x86_64/safe-syscall.inc.S  | 0
>      15 files changed, 1 insertion(+)
>      rename {linux-user => common-user}/host/aarch64/hostdep.h (100%)
>      rename {linux-user => common-user}/host/arm/hostdep.h (100%)
>      rename {linux-user => common-user}/host/i386/hostdep.h (100%)
>      rename {linux-user => common-user}/host/ppc64/hostdep.h (100%)
>      rename {linux-user => common-user}/host/riscv/hostdep.h (100%)
>      rename {linux-user => common-user}/host/s390x/hostdep.h (100%)
>      rename {linux-user => common-user}/host/x86_64/hostdep.h (100%)
>      rename {linux-user => common-user}/host/aarch64/safe-syscall.inc.S
>     (100%)
>      rename {linux-user => common-user}/host/arm/safe-syscall.inc.S (100%)
>      rename {linux-user => common-user}/host/i386/safe-syscall.inc.S (100%)
>      rename {linux-user => common-user}/host/ppc64/safe-syscall.inc.S (100%)
>      rename {linux-user => common-user}/host/riscv/safe-syscall.inc.S (100%)
>      rename {linux-user => common-user}/host/s390x/safe-syscall.inc.S (100%)
>      rename {linux-user => common-user}/host/x86_64/safe-syscall.inc.S
>     (100%)
> 
>     diff --git a/meson.build b/meson.build
>     index ccc6cefc25..ec22cf05c1 100644
>     --- a/meson.build
>     +++ b/meson.build
>     @@ -2878,6 +2878,7 @@ foreach target : target_dirs
>          if 'CONFIG_LINUX_USER' in config_target
>            base_dir = 'linux-user'
>            target_inc += include_directories('linux-user/host/' /
>     config_host['ARCH'])
>     +      target_inc += include_directories('common-user/host/' /
>     config_host['ARCH'])
>          endif
>          if 'CONFIG_BSD_USER' in config_target
>            base_dir = 'bsd-user'
> 
> 
> I had to add this:
> 
> diff --git a/meson.build b/meson.build
> index 0a88bff8d2..349e7a988f 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -2880,6 +2880,8 @@ foreach target : target_dirs
>      endif
>      if 'CONFIG_BSD_USER' in config_target
>        base_dir = 'bsd-user'
> +      target_inc += include_directories('bsd-user/host/' /
> config_host['ARCH'])
> +      target_inc += include_directories('common-user/host/' /
> config_host['ARCH'])
>        target_inc += include_directories('bsd-user/' / targetos)
>        dir = base_dir / abi
>        arch_srcs += files(dir / 'target_arch_cpu.c')
> 
> to get bsd-user compiling.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

