Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91AD0454BB3
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 18:11:16 +0100 (CET)
Received: from localhost ([::1]:39692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnOSp-0001q1-LU
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 12:11:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mnOEA-0003Ov-Fu
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 11:56:06 -0500
Received: from [2a00:1450:4864:20::32c] (port=35338
 helo=mail-wm1-x32c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mnOE9-000382-05
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 11:56:06 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 77-20020a1c0450000000b0033123de3425so5377918wme.0
 for <qemu-devel@nongnu.org>; Wed, 17 Nov 2021 08:56:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=G5ch+iH4zBeFRagXioeGewUZxbSFMuouHmuoDul9Llo=;
 b=HKBZE1/6WqyC/SNOe1GUV/1S3uG+Vqely2Gx44aPSsjpPFByvf/PVsYwv4LeHS2DBy
 qqwAwnht75eH2P9KBjWgqtxzZBXdeBmwcaIFnG+nju8bFs6j2OTq0F/XMhcRuvlvOCXu
 EZecpCBLTeFT/ZbahkYj02r3GvlntbPS+vlrEyRRHrE0maEBe0V8A6CS985HpWObzrTC
 hba3kaPQ5W/haicOFAEGrmrIWiwyJqyeDlh5ujqaZF1Yd7fkweJTHyTx6yEfFM6sxnee
 p0b3OPB2beJAtAKSyTSFubayJ02fFGKIKoYpdo9Nyq5lERCk3eaV38lap+l0fORcPVMf
 wl9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=G5ch+iH4zBeFRagXioeGewUZxbSFMuouHmuoDul9Llo=;
 b=P30JiyJ5nqCnBjxVwTsDg3KMzYUypJRSCpsDlGT0icYC4aUQ+7JkH/T3MrrH/dEbI8
 PGxZub3p4BJtS4CpHPuH18wPAmGbYpaAGYXf0iuBN5ZFCnxrGQyEyqiMoMwmqV/jgHGX
 is0KrkBZIJkwmeXcQ4E59yjBvxIfj0Qkj/t87yeIAKLg3Rp7lfaVnOQkfx/O7zGp0FZW
 H/e0fV4xjekRzb/b71APujiLk+tubDXNf2bcZwmFV9oqWX+R5HF0vSrDQJWYKFSwpRAx
 nB22pk+QO52cBUTgUX4eVOf6NGX5bevJQxbPNYridA62Y47RFYTV8zj7QsBKGyC0gFpE
 wlZg==
X-Gm-Message-State: AOAM531sIUzQq1aNW8QvrQiY1D3Yvu4FrUwOgAcGvFVFuPo7dlHEyvFW
 5DzpP4aHRMiax+uaiD6Tg/A=
X-Google-Smtp-Source: ABdhPJw0PD9Jpe1xJL93yNwKHLCHVWoR01Isb1lLUoCB9sooTDkaeejtT5cHGbJbAqyN3XBURNMlhw==
X-Received: by 2002:a05:600c:4ed2:: with SMTP id
 g18mr1315542wmq.25.1637168163590; 
 Wed, 17 Nov 2021 08:56:03 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id t8sm207786wmn.44.2021.11.17.08.56.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Nov 2021 08:56:03 -0800 (PST)
Message-ID: <375dc57d-419a-8098-bb65-049ca6b0a781@amsat.org>
Date: Wed, 17 Nov 2021 17:56:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v5 16/17] meson: Move linux_user_ss to linux-user/
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211117160412.71563-1-richard.henderson@linaro.org>
 <20211117160412.71563-17-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211117160412.71563-17-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 laurent@vivier.eu, imp@bsdimp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

+Thomas/Paolo

On 11/17/21 17:04, Richard Henderson wrote:
> We have no need to reference linux_user_ss outside of linux-user.
> Go ahead and merge it directly into specific_ss.

The patch is correct, so:

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

But ...

> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  meson.build            | 3 ---
>  linux-user/meson.build | 4 ++++
>  2 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/meson.build b/meson.build
> index 9f59c57909..ecc181ea13 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -2363,7 +2363,6 @@ common_user_ss = ss.source_set()
>  crypto_ss = ss.source_set()
>  hwcore_ss = ss.source_set()
>  io_ss = ss.source_set()
> -linux_user_ss = ss.source_set()
>  qmp_ss = ss.source_set()
>  qom_ss = ss.source_set()
>  softmmu_ss = ss.source_set()
> @@ -2614,8 +2613,6 @@

... shouldn't it be cheaper for the build system to
avoid parsing linux-user machinery when we linux-user
is disabled, ...

+ if have_linux_user

subdir('linux-user')

+ endif

>  
>  specific_ss.add_all(when: 'CONFIG_BSD_USER', if_true: bsd_user_ss)
>  
> -specific_ss.add_all(when: 'CONFIG_LINUX_USER', if_true: linux_user_ss)
> -
>  common_user_ss = common_user_ss.apply(config_all, strict: false)
>  common_user = static_library('common-user',
>                               sources: common_user_ss.sources(),
> diff --git a/linux-user/meson.build b/linux-user/meson.build
> index fcf7d40f23..b89534c49c 100644
> --- a/linux-user/meson.build
> +++ b/linux-user/meson.build
> @@ -2,6 +2,8 @@ if not have_linux_user
>     subdir_done()
>  endif
>  
> +linux_user_ss = ss.source_set()
> +
>  common_user_inc += include_directories('host/' / config_host['ARCH'])
>  common_user_inc += include_directories('.')
>  
> @@ -42,3 +44,5 @@ subdir('sh4')
>  subdir('sparc')
>  subdir('x86_64')
>  subdir('xtensa')
> +
> +specific_ss.add_all(when: 'CONFIG_LINUX_USER', if_true: linux_user_ss)

... and add here unconditionally?

