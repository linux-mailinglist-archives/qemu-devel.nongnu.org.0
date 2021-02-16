Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15DD631C900
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 11:44:00 +0100 (CET)
Received: from localhost ([::1]:49128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBxpn-0008Pm-6S
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 05:43:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBxp3-00080m-OH
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 05:43:13 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:33755)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBxp2-0004KK-52
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 05:43:13 -0500
Received: by mail-wr1-x429.google.com with SMTP id 7so12394437wrz.0
 for <qemu-devel@nongnu.org>; Tue, 16 Feb 2021 02:43:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XBF3Zt3dCDLfZo8ULXi8L9YXCD3KR7OGZVrM08a4U8E=;
 b=KD/h7B6HulSCcVaR8YHAk4wRnFTtDUB77RkbTWyfEjtXlacVDTavUnBvWt1Ogh8fLX
 K9U3wj7l9NpUlkwwnhFrdyk1rWUU+uGdYFVMQrIM/TrhLP4UxGLrqcERi2bjb1iFYMof
 fCNj3rloUFB88d1X9gjkU7YOA4wGGfR8JXNFjJFxod4C3JAq/R2b/Zgo7LMm/KcB4Umm
 PCJSwPL5bV3Phv3aCgl801gKJHFn/uJ4AvZJNeAyxNFGDZPXh9/gMCmI/F4HwhTcG5ut
 RArJ/UvB01gv7psUiCY1LxySMLQGI5o4ZVGqarlBx0wD32up1Dm95Vb2HRr5hsJ93M4o
 qJqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XBF3Zt3dCDLfZo8ULXi8L9YXCD3KR7OGZVrM08a4U8E=;
 b=TvT2KxkYkGV9RCxFfmqBh79kVLlcZ5b0MAsMqTeVhUg2x9cmM56TpPNTROAnM+jwzJ
 rq5iMH5/wHpe71EvziYEVzHhkGQ/bUEuBtviQaPgpFCvJ55kmOMfWWdiVJgvu70QpXN/
 pLN6d9itCqTzcLgdBczkTaPpsPal/uKtCtsD9x+mH9UyRl/mzkxAu2AHG8Epg6KANcY3
 gmjAiAKigMFd367rR8WYvR18EkOatK4nCsurj/WpyP8VTW+tE1xTCEfRCODwtQTxdYIZ
 HLUq55sVdOQIDYyl9DC102yybaelbB3EhH+wLkcDADRCGUbJw24rMIYekLSS2i7GVBYe
 YK3g==
X-Gm-Message-State: AOAM533yVy4c1nm/fmOhYNRBshr/rq4YTmEgFJf8pa03Orp7WM0Xx6tj
 m8intqa939VZnj3+qE4RBF8=
X-Google-Smtp-Source: ABdhPJyy3M5byhbOKHfoBEYdPnQVM4TCX1KCvxuYHDWdMIifBVXT6Gn7L7Gx+yHSmFA09gchP+dvTQ==
X-Received: by 2002:adf:a1d6:: with SMTP id v22mr23095981wrv.372.1613472190683; 
 Tue, 16 Feb 2021 02:43:10 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id b2sm27653738wrv.73.2021.02.16.02.43.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Feb 2021 02:43:10 -0800 (PST)
Subject: Re: [PATCH v2] meson.build: expose TCG cross compiler information in
 summary
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210216102522.6279-1-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <714083ae-0ede-c4f1-5828-6ccc53211e66@amsat.org>
Date: Tue, 16 Feb 2021 11:43:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210216102522.6279-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
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
Cc: pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/16/21 11:25 AM, Alex Bennée wrote:
> Blink and you miss the cross TCG compiler stuff so lets display it
> with the rest of the compiler information.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> 
> ---
> v2
>   - use target_dirs/fs.exists() instead of find
> ---
>  meson.build            | 18 ++++++++++++++++++
>  tests/tcg/configure.sh |  8 --------
>  2 files changed, 18 insertions(+), 8 deletions(-)
> 
> diff --git a/meson.build b/meson.build
> index a923f249d8..4462e7279e 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -2508,6 +2508,24 @@ endif
>  summary_info += {'strip binaries':    get_option('strip')}
>  summary_info += {'sparse':            sparse.found() ? sparse.full_path() : false}
>  summary_info += {'mingw32 support':   targetos == 'windows'}
> +
> +# snarf the cross-compilation information for tests
> +foreach target: target_dirs
> +  tcg_mak = meson.current_build_dir() / 'tests/tcg' / 'config-' + target + '.mak'
> +  if fs.exists(tcg_mak)
> +    config_cross_tcg = keyval.load(tcg_mak)
> +    target = config_cross_tcg['TARGET_NAME']
> +    compiler = ''
> +    if 'DOCKER_CROSS_CC_GUEST' in config_cross_tcg
> +      summary_info += {target + ' tests': config_cross_tcg['DOCKER_CROSS_CC_GUEST'] +
> +                                          ' via ' + config_cross_tcg['DOCKER_IMAGE']}
> +    elif 'CROSS_CC_GUEST' in config_cross_tcg
> +      summary_info += {target + ' tests'
> +                                : config_cross_tcg['CROSS_CC_GUEST'] }
> +    endif
> +   endif
> +endforeach
> +
>  summary(summary_info, bool_yn: true, section: 'Compilation')

Testing on top of "Reintroduce the R5900 CPU":
https://www.mail-archive.com/qemu-devel@nongnu.org/msg782449.html

  Compilation
    ...
    CFI support                  : NO
    strip binaries               : NO
    sparse                       : /usr/bin/cgcc
    mingw32 support              : NO
    mipsel tests                 : mipsel-linux-gnu-gcc via
debian-mipsel-cross
    r5900o32el tests             : mipsr5900el-unknown-linux-gnu-gcc via
gentoo-mipsr5900el-cross
    mips64el tests               : mips64el-linux-gnuabi64-gcc via
debian-mips64el-cross

  Targets and accelerators
    TCG support                  : YES
    TCG backend                  : native (x86_64)
    TCG debug enabled            : YES
    target list                  : mipsel-linux-user
r5900o32el-linux-user mips64el-linux-user

Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

