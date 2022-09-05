Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A715ADAA6
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 23:08:19 +0200 (CEST)
Received: from localhost ([::1]:39514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVJKM-0004Hf-6H
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 17:08:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oVJHO-0001mi-Vu
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 17:05:16 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:46021)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oVJHM-00020E-2M
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 17:05:14 -0400
Received: by mail-pl1-x631.google.com with SMTP id u22so9365006plq.12
 for <qemu-devel@nongnu.org>; Mon, 05 Sep 2022 14:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=7HwI3u9jVukFdjOfvNxmSjtPX6n9gnwiWP/6QFc3giQ=;
 b=SHpFDECNgmu1LxTOvpgLbKbBDM+PIvhLpgdpGezeKWAfr3dOtlL1ofwIzhfZ+HFu8p
 ukE4YtoeCoPqjbS42MH/mUUa8/lPCDYiK+KmLvrBk3yEhS6KADKOfv3zUuQLwI8nP8W3
 alBwpB5o3VuXg32Doj6+HkK0U6RHy2EZygL0yCpRK18z81PnqM+UizKeHvj/795lQ3YY
 WOsMaXLUquGJdMQXgDLYcrQBT0TaPfMolp1/m0DsIemgmhzPyQmEsMJZGDJphxJCClF2
 oX9Nq6xXczQquaTGHSq9zzn9Jqsn1XmTlPPsgO8ziiENmVLa0Ct9+RmWsjtAhJ0YeKgm
 6CvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=7HwI3u9jVukFdjOfvNxmSjtPX6n9gnwiWP/6QFc3giQ=;
 b=EBrCkpR+gwpref7H1lDfQRqBlO9yXEtimoNise3fcUpBGg3qvayklvrT5whnohLS55
 G6h0IRU18ocCSBV+t2+0DNepblZOqe0OyEAyr/PNHW8wMMAg9h2c8HSqdfsSwQ1rmoDU
 rBBZis5aIFbJqa25NxofrMzhza37G//EA+pNchZOm2SBcHjmkAx+X9yXSbStrourry+2
 QbWWEezLki7dxr8vVdgFHaNAdHsNjTABMIadQBfyHqImrj+PpIj9rFcEB4SOmI4JRqMS
 itoYW3TapS8uqWOmEhEi3X2emcmrz3wRPPbSIPA4OZvuUwhfiCqPTp2M22qshskvhA//
 fq+Q==
X-Gm-Message-State: ACgBeo15q/+7orl+uRnBsLSphATU5G/v/jFROUlM3Upimwss6jHfZDHC
 NzspjexRBPWbUFuCcKyQL2A=
X-Google-Smtp-Source: AA6agR7+xP8Wo8c3MZOx8GlHd6Tr7ar0cR70wI45N2X5OzEPffD18on0ih13GEfI9eWEu/nXH9oOZQ==
X-Received: by 2002:a17:90b:4ac3:b0:1fd:ded0:ea80 with SMTP id
 mh3-20020a17090b4ac300b001fdded0ea80mr20960190pjb.142.1662411910737; 
 Mon, 05 Sep 2022 14:05:10 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 p12-20020a170902bd0c00b001745919b197sm7927960pls.243.2022.09.05.14.05.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Sep 2022 14:05:10 -0700 (PDT)
Message-ID: <f6e2f054-6ddc-0c1d-1d0a-7a8433465007@amsat.org>
Date: Mon, 5 Sep 2022 23:05:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH] build: Regenerate meson-buildoptions.sh
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: xieyongji@bytedance.com, pbonzini@redhat.com, stefanha@redhat.com
References: <20220905204114.208969-1-richard.henderson@linaro.org>
In-Reply-To: <20220905204114.208969-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x631.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.716,
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 5/9/22 22:41, Richard Henderson wrote:
> Regeneration was missed by the previous update.
> 
> Fixes: 2a2359b84407 ("vduse-blk: Implement vduse-blk export")
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   scripts/meson-buildoptions.sh | 13 +++++++------
>   1 file changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
> index 359b04e0e6..300ba8b212 100644
> --- a/scripts/meson-buildoptions.sh
> +++ b/scripts/meson-buildoptions.sh
> @@ -42,12 +42,13 @@ meson_options_help() {
>     printf "%s\n" '  --enable-trace-backends=CHOICES'
>     printf "%s\n" '                           Set available tracing backends [log] (choices:'
>     printf "%s\n" '                           dtrace/ftrace/log/nop/simple/syslog/ust)'
> -  printf "%s\n" '  --firmwarepath=VALUES    search PATH for firmware files [share/qemu-firmware]'
> +  printf "%s\n" '  --firmwarepath=VALUES    search PATH for firmware files [share/qemu-'
> +  printf "%s\n" '                           firmware]'

This path split is not very handy to copy/paste.

>     printf "%s\n" '  --iasl=VALUE             Path to ACPI disassembler'
>     printf "%s\n" '  --includedir=VALUE       Header file directory [include]'
>     printf "%s\n" '  --interp-prefix=VALUE    where to find shared libraries etc., use %M for'
>     printf "%s\n" '                           cpu name [/usr/gnemul/qemu-%M]'
> -  printf "%s\n" '  --libdir=VALUE           Library directory [lib64]'
> +  printf "%s\n" '  --libdir=VALUE           Library directory [lib/x86_64-linux-gnu]'

This patch seems distro-specific (previous to this patch).

Anyhow:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

