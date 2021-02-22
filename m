Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82BDC321981
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 14:56:16 +0100 (CET)
Received: from localhost ([::1]:47520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEBh9-000065-JT
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 08:56:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lEBUt-00037f-IP
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 08:43:35 -0500
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:44702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lEBUr-00048B-2I
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 08:43:34 -0500
Received: by mail-ed1-x52f.google.com with SMTP id g3so21915725edb.11
 for <qemu-devel@nongnu.org>; Mon, 22 Feb 2021 05:43:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1V5ZpPIv1u4mut3ifi9j6Hhk7Y3ADPhgNOJ5fr718jQ=;
 b=vYG0xYr5o6Zc1krSCf3Y2+ZoIzgdENkcwljiFtx2qKPsj3uiJOHnVxd85xBilRbfrp
 81kkfIRLp3qbygi//ia7URaa6aLbyA+15S/oXTPtjSBHR9RIthetYt6qEAiZWdPXG45r
 HcB0YIP6FXeN6OPSqCyQ2VtsFGIaxSAauXpbbUriPMk/8Er9UiPJizcJ7zb91mN4Xc0+
 HOL8e8FMgRJcYENlBSgSFv5PRvxWw2FtHV7hmJf/SmsrNqW1ANI5GzUFmow2hlbqsjkl
 tKn46zYnlJvHIMzIzJQuvsapg6gWLpiXu8Jo80RtVOKAK1K5hizIq/EGOcpN/4NpaS/v
 dB8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1V5ZpPIv1u4mut3ifi9j6Hhk7Y3ADPhgNOJ5fr718jQ=;
 b=fGVGwIgJkiqbVHLJKFbaDKzY95yaToJmj210cTqgE9ff5S2p3cIPHYgx4UhC7sTeFn
 X17BWcljbR7xPHxUj3t/8xkcWvzVqrHH2/8KR2Q2PO5et6f+OUmsnU5aM1ZXRJg1zBJu
 SBnPLeXAoMKlDpDtEp4rodAplS8xR6JY/S82nQG/kNHu9k0Qb9wBL6Xf2C4lL7l79dEk
 NiBnwKNN16OeNY95UelOdKsE/Hy7zq37UXbO0td6wrqTc0HnDMKPM7hRwVTu53HM8Jvo
 dFyEgIUUoatHbZxQRd9WH7fmaWc0H/KwCwweg56L84SbLgiD2LPUCa/xyRnS6X/yhGc9
 zSIg==
X-Gm-Message-State: AOAM532+Bsh44sE4C/095vwFPyDVazD9qczW33/uLSjYkcB05Vt/GSwc
 qkd6Cs1tmJfzWEebSV3l6Fz97ypZ7lA=
X-Google-Smtp-Source: ABdhPJyL2AI3WQ9Q4puFAWd4Wjruf+YABBT089E3t6gKqHuTzM5hMpD3aFMHq+Or2KO4LgnWiux90Q==
X-Received: by 2002:aa7:cd75:: with SMTP id ca21mr1455815edb.199.1614001411122; 
 Mon, 22 Feb 2021 05:43:31 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id ia25sm8744226ejc.44.2021.02.22.05.43.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Feb 2021 05:43:30 -0800 (PST)
Subject: Re: [PATCH v21 06/17] meson: add target_user_arch
To: Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210222133634.2235-1-cfontana@suse.de>
 <20210222133634.2235-7-cfontana@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <391a2bc9-fb92-20a9-dea1-ddc5729ba74d@amsat.org>
Date: Mon, 22 Feb 2021 14:43:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210222133634.2235-7-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/22/21 2:36 PM, Claudio Fontana wrote:
> the lack of target_user_arch makes it hard to fully leverage the
> build system in order to separate user code from softmmu code.
> 
> Provide it, so that we can avoid the proliferation of #ifdef
> in target code.
> 
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>

---

> 
> [claudio: added changes for new target hexagon]
> ---


>  meson.build                   | 5 +++++
>  target/alpha/meson.build      | 3 +++
>  target/arm/meson.build        | 2 ++
>  target/cris/meson.build       | 3 +++
>  target/hexagon/meson.build    | 3 +++
>  target/hppa/meson.build       | 3 +++
>  target/i386/meson.build       | 2 ++
>  target/m68k/meson.build       | 3 +++
>  target/microblaze/meson.build | 3 +++
>  target/mips/meson.build       | 3 +++
>  target/nios2/meson.build      | 3 +++
>  target/openrisc/meson.build   | 3 +++
>  target/ppc/meson.build        | 3 +++
>  target/riscv/meson.build      | 3 +++
>  target/s390x/meson.build      | 3 +++
>  target/sh4/meson.build        | 3 +++
>  target/sparc/meson.build      | 3 +++
>  target/tilegx/meson.build     | 3 +++
>  target/tricore/meson.build    | 3 +++
>  target/xtensa/meson.build     | 3 +++
>  20 files changed, 60 insertions(+)
> 
> diff --git a/meson.build b/meson.build
> index 05a67c20d9..5be4e5f38c 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1735,6 +1735,7 @@ modules = {}
>  hw_arch = {}
>  target_arch = {}
>  target_softmmu_arch = {}
> +target_user_arch = {}
>  
>  ###############
>  # Trace files #
> @@ -2132,6 +2133,10 @@ foreach target : target_dirs
>      abi = config_target['TARGET_ABI_DIR']
>      target_type='user'
>      qemu_target_name = 'qemu-' + target_name
> +    t = target_user_arch[arch].apply(config_target, strict: false)
> +    arch_srcs += t.sources()
> +    arch_deps += t.dependencies()
> +
>      if 'CONFIG_LINUX_USER' in config_target
>        base_dir = 'linux-user'
>        target_inc += include_directories('linux-user/host/' / config_host['ARCH'])

I agree with Richard about a later
s/target_softmmu_arch/target_system_arch/ cleanup.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

