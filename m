Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4413B31B959
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 13:36:19 +0100 (CET)
Received: from localhost ([::1]:60490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBd6w-0005e6-AR
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 07:36:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lBd47-00040e-6w
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 07:33:23 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:41032)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lBd45-0004C2-4d
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 07:33:22 -0500
Received: by mail-wr1-x435.google.com with SMTP id n6so8643212wrv.8
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 04:33:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=qjMQu5c7jIBaj/NTkxmnL8qFbUXbqdZo/N3/vpUaGZg=;
 b=SzJeofCkp9rJY/0Vmhcu8rV3FIfuanpS1dz5pprWfdBMI/bIh8zZmlX9OYb4Pv+DMV
 84gUm6Csi/Ug14XDmrudwG7EF0Ki7R72eIibhf3eS+83kG7QeU65zi6UlfuD81yJND8P
 nuwr9ajLdT+OBgED9rM2CIUoFbIPkMq8L39vHBx8ZfzKSz7zw0HhtNxDDD2pqqDh7fdD
 OCnq4Q7XKEgvPBYw1y2bP14aMvILGRQv/2Jjs/IyTZE9F4Ux35MmNESUAuacc17cWcyW
 OZyokkhxaZMPm5tFlL08B0qTMQT3ZPWytneIhFxVNr/OEk/l3io6FSpt9uycCQXgfZLx
 XqfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=qjMQu5c7jIBaj/NTkxmnL8qFbUXbqdZo/N3/vpUaGZg=;
 b=WFaCj+b7W6LfQRmDUqf75YkTKvy/5jWQP0GiwevKkFF6K/pRz7Ug9UxBtBdisX9T+S
 44KNQsVWacTV3LlVbDfLvOE4hp6rPA4SldFNrMocm22v1gRUtoPht6cS57HfH4ChySxE
 nMQmScMdVrTxD3MmxszyZH9aj12bcuknmDhRfDirKoqK36qZeJSiQz5wyT2vmg4l8zeT
 Hm7V2rutw4m4rEmtanGQEH7lN0LRjjw03Dl6798H3TYO3+2Kk4KFFa/UW4Pjo99L4knB
 7CbGSOJ5liLnhKdZsR+v8oeVj0ssEPt8aQaEgaus35o1hXBdFEpnzFgokinJN5VW+4Xt
 7GVg==
X-Gm-Message-State: AOAM533MqlDuWrC1yw/Gz+AH3fqlnrCivifAu3q+c16IaeKnLVXR0J8R
 bEYDltPc0OmtA7FYSqTjSqwxvw==
X-Google-Smtp-Source: ABdhPJxu2xcsy+ARIz3Audb+HTQx4RG80c/gp/vxk59POCbSzlzWjUpBreJdxmOdvb9Ox8iKOcRV6Q==
X-Received: by 2002:adf:f089:: with SMTP id n9mr18983687wro.98.1613392399476; 
 Mon, 15 Feb 2021 04:33:19 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id y2sm23862912wmg.13.2021.02.15.04.33.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Feb 2021 04:33:18 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BB50D1FF7E;
 Mon, 15 Feb 2021 12:33:17 +0000 (GMT)
References: <20210212123622.15834-1-cfontana@suse.de>
 <20210212123622.15834-9-cfontana@suse.de>
 <b6b053ef-998e-08ef-4354-27cdcfb331e9@suse.de>
User-agent: mu4e 1.5.8; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [RFC v18 08/15] i386: split smm helper (softmmu)
Date: Mon, 15 Feb 2021 12:32:35 +0000
In-reply-to: <b6b053ef-998e-08ef-4354-27cdcfb331e9@suse.de>
Message-ID: <87y2fptss2.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Roman Bolshakov <r.bolshakov@yadro.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?M?= =?utf-8?Q?athieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Claudio Fontana <cfontana@suse.de> writes:

> On 2/12/21 1:36 PM, Claudio Fontana wrote:
>> smm is only really useful for softmmu, split in two modules
>> around the CONFIG_USER_ONLY, in order to remove the ifdef
>> and use the build system instead.
>>=20
>> Signed-off-by: Claudio Fontana <cfontana@suse.de>
>> ---
>>  target/i386/helper.h                       |  4 ++++
>>  target/i386/tcg/seg_helper.c               |  2 ++
>>  target/i386/tcg/{ =3D> softmmu}/smm_helper.c | 19 ++-----------------
>>  target/i386/tcg/translate.c                |  2 ++
>>  target/i386/tcg/meson.build                |  1 -
>>  target/i386/tcg/softmmu/meson.build        |  1 +
>>  6 files changed, 11 insertions(+), 18 deletions(-)
>>  rename target/i386/tcg/{ =3D> softmmu}/smm_helper.c (98%)
>>=20
>> diff --git a/target/i386/helper.h b/target/i386/helper.h
>> index c2ae2f7e61..8ffda4cdc6 100644
>> --- a/target/i386/helper.h
>> +++ b/target/i386/helper.h
>> @@ -70,7 +70,11 @@ DEF_HELPER_1(clac, void, env)
>>  DEF_HELPER_1(stac, void, env)
>>  DEF_HELPER_3(boundw, void, env, tl, int)
>>  DEF_HELPER_3(boundl, void, env, tl, int)
>> +
>> +#ifndef CONFIG_USER_ONLY
>>  DEF_HELPER_1(rsm, void, env)
>> +#endif /* !CONFIG_USER_ONLY */
>> +
>>  DEF_HELPER_2(into, void, env, int)
>>  DEF_HELPER_2(cmpxchg8b_unlocked, void, env, tl)
>>  DEF_HELPER_2(cmpxchg8b, void, env, tl)
>> diff --git a/target/i386/tcg/seg_helper.c b/target/i386/tcg/seg_helper.c
>> index 180d47f0e9..f0cb1bffe7 100644
>> --- a/target/i386/tcg/seg_helper.c
>> +++ b/target/i386/tcg/seg_helper.c
>> @@ -1351,7 +1351,9 @@ bool x86_cpu_exec_interrupt(CPUState *cs, int inte=
rrupt_request)
>>      case CPU_INTERRUPT_SMI:
>>          cpu_svm_check_intercept_param(env, SVM_EXIT_SMI, 0, 0);
>>          cs->interrupt_request &=3D ~CPU_INTERRUPT_SMI;
>> +#ifndef CONFIG_USER_ONLY
>>          do_smm_enter(cpu);
>> +#endif
>>          break;
>>      case CPU_INTERRUPT_NMI:
>>          cpu_svm_check_intercept_param(env, SVM_EXIT_NMI, 0, 0);
>> diff --git a/target/i386/tcg/smm_helper.c b/target/i386/tcg/softmmu/smm_=
helper.c
>> similarity index 98%
>> rename from target/i386/tcg/smm_helper.c
>> rename to target/i386/tcg/softmmu/smm_helper.c
>> index 62d027abd3..ee53b26629 100644
>> --- a/target/i386/tcg/smm_helper.c
>> +++ b/target/i386/tcg/softmmu/smm_helper.c
>> @@ -1,5 +1,5 @@
>>  /*
>> - *  x86 SMM helpers
>> + *  x86 SMM helpers (softmmu-only)
>>   *
>>   *  Copyright (c) 2003 Fabrice Bellard
>>   *
>> @@ -18,27 +18,14 @@
>>   */
>>=20=20
>>  #include "qemu/osdep.h"
>> -#include "qemu/main-loop.h"
>>  #include "cpu.h"
>>  #include "exec/helper-proto.h"
>>  #include "exec/log.h"
>> -#include "helper-tcg.h"
>> +#include "tcg/helper-tcg.h"
>>=20=20
>>=20=20
>>  /* SMM support */
>>=20=20
>> -#if defined(CONFIG_USER_ONLY)
>> -
>> -void do_smm_enter(X86CPU *cpu)
>> -{
>> -}
>> -
>> -void helper_rsm(CPUX86State *env)
>> -{
>> -}
>> -
>> -#else
>> -
>>  #ifdef TARGET_X86_64
>>  #define SMM_REVISION_ID 0x00020064
>>  #else
>> @@ -330,5 +317,3 @@ void helper_rsm(CPUX86State *env)
>>      qemu_log_mask(CPU_LOG_INT, "SMM: after RSM\n");
>>      log_cpu_state_mask(CPU_LOG_INT, CPU(cpu), CPU_DUMP_CCOP);
>>  }
>> -
>> -#endif /* !CONFIG_USER_ONLY */
>> diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
>> index af1faf9342..5075ac4830 100644
>> --- a/target/i386/tcg/translate.c
>> +++ b/target/i386/tcg/translate.c
>> @@ -8321,7 +8321,9 @@ static target_ulong disas_insn(DisasContext *s, CP=
UState *cpu)
>>              goto illegal_op;
>>          gen_update_cc_op(s);
>>          gen_jmp_im(s, s->pc - s->cs_base);
>> +#ifndef CONFIG_USER_ONLY
>>          gen_helper_rsm(cpu_env);
>> +#endif /* CONFIG_USER_ONLY */
>>          gen_eob(s);
>>          break;
>
> Hello Alex,
>
> this is something I wanted to bring in the foreground:
>
> while before we were generating an empty helper call for CONFIG_USER_ONLY,
> now we are not generating anything.

Surely that says we only generate the helper call when we are not
CONFIG_USER_ONLY?


>
>
>
>>      case 0x1b8: /* SSE4.2 popcnt */
>> diff --git a/target/i386/tcg/meson.build b/target/i386/tcg/meson.build
>> index 68fa0c3187..ec5daa1edc 100644
>> --- a/target/i386/tcg/meson.build
>> +++ b/target/i386/tcg/meson.build
>> @@ -8,7 +8,6 @@ i386_ss.add(when: 'CONFIG_TCG', if_true: files(
>>    'misc_helper.c',
>>    'mpx_helper.c',
>>    'seg_helper.c',
>> -  'smm_helper.c',
>>    'svm_helper.c',
>>    'tcg-cpu.c',
>>    'translate.c'), if_false: files('tcg-stub.c'))
>> diff --git a/target/i386/tcg/softmmu/meson.build b/target/i386/tcg/softm=
mu/meson.build
>> index 4ab30cc32e..35ba16dc3d 100644
>> --- a/target/i386/tcg/softmmu/meson.build
>> +++ b/target/i386/tcg/softmmu/meson.build
>> @@ -1,3 +1,4 @@
>>  i386_softmmu_ss.add(when: ['CONFIG_TCG', 'CONFIG_SOFTMMU'], if_true: fi=
les(
>>    'tcg-cpu.c',
>> +  'smm_helper.c',
>>  ))
>>=20


--=20
Alex Benn=C3=A9e

