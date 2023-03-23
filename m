Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81B156C6469
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Mar 2023 11:06:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfHph-0007MJ-RC; Thu, 23 Mar 2023 06:06:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pfHpe-0007MB-Eu
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 06:06:06 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pfHpa-0000MQ-Ij
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 06:06:05 -0400
Received: by mail-wr1-x431.google.com with SMTP id v1so13695679wrv.1
 for <qemu-devel@nongnu.org>; Thu, 23 Mar 2023 03:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679565960;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0+qlDTyVHID7x6TY4fLgZg45q8hipaMrE6xn0SkJPK4=;
 b=TvFTKkOqCUmUEWK0PfIQwzDV+OF9SWR1YZHTOQJ0EVYFLBHRmU3YOwXkyA4QP7nRDP
 OuR5R+B+h32IWACKjyt+mPRu6oIww+nS/ckgpQsQ6oeG1POETMraIeatsgukvdvo5FDA
 YuEN+zSLk59cW6t99sGI8cEj8WdU83KDMnKRbAeVzdbqSk2wu72XuCiuVTHhRTGYTCSJ
 OsomsU0cvWF3t/vK93MPiJJtluCW2ET7WkJZAX77Q4/5SmnI5dvysRG1SRtN4i61wIwN
 Pv2XSJNWTNpPRtqKFjOwnC8dga7xM2FPO6rAv42htBf4U8V3lj6iqWFHn+DeJ41lpRmN
 +dqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679565960;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0+qlDTyVHID7x6TY4fLgZg45q8hipaMrE6xn0SkJPK4=;
 b=X/dWUWBbES0H1CZt1Wq1jpkt9lFjFLvyyqk/TgdOItt7xxpau731IWXeRRJxIjslxB
 S26OP9pxgVi49CLi9bwQyLJgLkXPisj8xr1hz2cLflqj/TKDf92B4Pyx7vmtSibJl/UP
 6KEVFcEc9S2XGXl4BQTUA+6VPrFEl/s73LAJaGyhw/5pbmtVOtZnFdMkt69yy3gxJ7ZX
 62o0SL8Sfl7M+Km6SYQ9u9veI4KX19i82lR3M9QvhSDyj3z4+fF1x5SdS3bj0G5F8XvU
 8RQGmc2Cbj9bI/w93iK01ySxGNdZE2hHcJVcXAxcNfyNjp6PW3LzuwoGe5dl4ab7IPHb
 zUKg==
X-Gm-Message-State: AAQBX9eUrX0bOEkTW86u1hYzmXPSKfo5VFpwovCh3uHXjV+RaXt7o+fH
 A59v5wYVUsltTUAio75+ZPEUaw==
X-Google-Smtp-Source: AKy350afoRNkmnpYoyIwf6kHthDzyFW7n7S8/QVsBLoqIgSKp0e5vBlRqosAZT0A0Rlp+mwStUXC6g==
X-Received: by 2002:adf:ed06:0:b0:2db:cabb:7000 with SMTP id
 a6-20020adfed06000000b002dbcabb7000mr1202088wro.9.1679565960435; 
 Thu, 23 Mar 2023 03:06:00 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 p5-20020a5d4e05000000b002d75909c76esm8903505wrt.73.2023.03.23.03.05.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Mar 2023 03:06:00 -0700 (PDT)
Message-ID: <f0cda165-69c2-9f3b-44cf-df55a9a71967@linaro.org>
Date: Thu, 23 Mar 2023 11:05:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PULL 22/30] gdbstub: only compile gdbstub twice for whole build
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Cc: peter.maydell@linaro.org, Richard Henderson <richard.henderson@linaro.org>
References: <20230307212139.883112-1-alex.bennee@linaro.org>
 <20230307212139.883112-23-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230307212139.883112-23-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Alex, Paolo,

On 7/3/23 22:21, Alex Bennée wrote:
> Now we have removed any target specific bits from the core gdbstub
> code we only need to build it twice. We have to jump a few meson hoops
> to manually define the CONFIG_USER_ONLY symbol but it seems to work.
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20230302190846.2593720-23-alex.bennee@linaro.org>
> Message-Id: <20230303025805.625589-23-richard.henderson@linaro.org>
> 
> diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
> index e264ed04e7..d9e9bf9294 100644
> --- a/gdbstub/gdbstub.c
> +++ b/gdbstub/gdbstub.c
> @@ -39,9 +39,7 @@
>   
>   #include "sysemu/hw_accel.h"
>   #include "sysemu/runstate.h"
> -#include "exec/exec-all.h"
>   #include "exec/replay-core.h"
> -#include "exec/tb-flush.h"
>   #include "exec/hwaddr.h"
>   
>   #include "internals.h"
> @@ -1612,7 +1610,7 @@ static const GdbCmdParseEntry gdb_gen_query_table[] = {
>           .cmd_startswith = 1,
>           .schema = "s:l,l0"
>       },
> -#if defined(CONFIG_USER_ONLY) && defined(CONFIG_LINUX_USER)
> +#if defined(CONFIG_USER_ONLY) && defined(CONFIG_LINUX)
>       {
>           .handler = gdb_handle_query_xfer_auxv,
>           .cmd = "Xfer:auxv:read::",
> diff --git a/gdbstub/meson.build b/gdbstub/meson.build
> index c876222b9c..d679c7ab86 100644
> --- a/gdbstub/meson.build
> +++ b/gdbstub/meson.build
> @@ -4,13 +4,35 @@
>   # types such as hwaddr.
>   #
>   
> -specific_ss.add(files('gdbstub.c'))
> +# We need to build the core gdb code via a library to be able to tweak
> +# cflags so:
> +
> +gdb_user_ss = ss.source_set()
> +gdb_softmmu_ss = ss.source_set()
> +
> +# We build two versions of gdbstub, one for each mode
> +gdb_user_ss.add(files('gdbstub.c', 'user.c'))
> +gdb_softmmu_ss.add(files('gdbstub.c', 'softmmu.c'))
> +
> +gdb_user_ss = gdb_user_ss.apply(config_host, strict: false)
> +gdb_softmmu_ss = gdb_softmmu_ss.apply(config_host, strict: false)
> +
> +libgdb_user = static_library('gdb_user',
> +                             gdb_user_ss.sources() + genh,
> +                             name_suffix: 'fa',
> +                             c_args: '-DCONFIG_USER_ONLY')

FYI building configured as '--disable-user --disable-tcg' I still see:

[13/810] Compiling C object gdbstub/libgdb_user.fa.p/gdbstub.c.o

> +libgdb_softmmu = static_library('gdb_softmmu',
> +                                gdb_softmmu_ss.sources() + genh,
> +                                name_suffix: 'fa')
> +
> +gdb_user = declare_dependency(link_whole: libgdb_user)
> +user_ss.add(gdb_user)

Later we have:

common_ss.add_all(when: 'CONFIG_USER_ONLY', if_true: user_ss)

Also:

config_all += {
   'CONFIG_SOFTMMU': have_system,
   'CONFIG_USER_ONLY': have_user,
   'CONFIG_ALL': true,
}

Why is libgdb_user.fa built while using --disable-user
(have_user=false)?

> +gdb_softmmu = declare_dependency(link_whole: libgdb_softmmu)
> +softmmu_ss.add(gdb_softmmu)
>   
>   # These have to built to the target ABI
>   specific_ss.add(files('syscalls.c'))
>   
> -softmmu_ss.add(files('softmmu.c'))
> -user_ss.add(files('user.c'))
> -
>   # The user-target is specialised by the guest
>   specific_ss.add(when: 'CONFIG_USER_ONLY', if_true: files('user-target.c'))


