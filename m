Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4361302430
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 12:23:47 +0100 (CET)
Received: from localhost ([::1]:58942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3zyE-0006m1-2u
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 06:23:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l3zxJ-0006If-QM
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 06:22:49 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:54589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l3zxH-0005X3-Ku
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 06:22:49 -0500
Received: by mail-wm1-x329.google.com with SMTP id u14so3740104wml.4
 for <qemu-devel@nongnu.org>; Mon, 25 Jan 2021 03:22:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=4xqT4jrEco9hP0He042u6Zoy9Ivu5S4rM88/ML63Nps=;
 b=fdb4vUm9+02rK9elFzRfYxLtgtX1zGDQzjzffFzcRACKks4EM/GNvAjI2TXMTlIpJG
 3XSYcl8RoUyFfSZqWJhDp6k0Z6OwHdaBuyQHGU7Y+g+gO2uziVgMGkYWk/jNXZvHGF+U
 BGr6vwQBlul9bR58/zn/oDiQ3uklsPmIeDVVpjXChQ9DmMlRDeLj9QBFDIbdoxCIojgd
 HMBH8d/6rSElf5nhc7FIfaqJ8oCD/GDRAhaOdfoOhBN6s+B+tc2aCETF6y71zALky8LN
 AzBZpi64UkMphwtu2Swyh/psouDVRU1SCUEKtMQx0ESYy3w8P1Ch6/fyIKe94Jm00yZd
 gNBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=4xqT4jrEco9hP0He042u6Zoy9Ivu5S4rM88/ML63Nps=;
 b=kohkuz9g5JL8YpwH6+sJdylmrJSBij9ww8KSt3+NCYL8j7peMjxkb8N2wR4ccoByyE
 sdmHGwlj0CkJoO5MJCiOjKIMTF9cLj0L5aw2PiM6brjy5zQgg63mayJ23KWkkes9qzwE
 rsUGfaM3IIrahP32Inwz0xAo+9j1+9wymXDM86JX33kY5mfJ+ewyST5lMBNrETv0TX7M
 MASOrDEPGSzUL+JFtn6t/wRXVhHDjV8OQ/2KQUnCz7LXqwzI6L27Eu5GOG86cWp5uZFa
 tB+LMvhfZYhHX5q1WqzcTcoBPcEDqNCp4OFjWQFajh/ts2XUwCB/mkKifOA1JERXJoBb
 aeXw==
X-Gm-Message-State: AOAM530Z6AY6vPHdcGUpb9tfr7C7sBHjs1QkI+Uciu8Br3dLn8CGx8W8
 VdkjQxKzA7Zj6ZPwH2060xC9IA==
X-Google-Smtp-Source: ABdhPJycsiKoB5IOtWMgcuG5G1upL+hRTgq+gtfYbDSchA9oXehHt+0VI8Kk7vFWo2YjNXhSU8V13g==
X-Received: by 2002:a1c:356:: with SMTP id 83mr3087872wmd.31.1611573765642;
 Mon, 25 Jan 2021 03:22:45 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id h23sm20522910wmi.26.2021.01.25.03.22.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jan 2021 03:22:44 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 99BD61FF7E;
 Mon, 25 Jan 2021 11:22:43 +0000 (GMT)
References: <161130982491.1038646.15688151175539344664.stgit@pasha-ThinkPad-X280>
 <87y2glry84.fsf@linaro.org>
 <56ff4770-3e01-ef72-e054-fdc93533a3b3@ispras.ru>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Subject: Re: [PATCH] util/log: flush TB cache when log level changes
Date: Mon, 25 Jan 2021 11:09:09 +0000
In-reply-to: <56ff4770-3e01-ef72-e054-fdc93533a3b3@ispras.ru>
Message-ID: <87y2ghmfb0.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
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
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru> writes:

> On 22.01.2021 14:42, Alex Benn=C3=A9e wrote:
>>=20
>> Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru> writes:
>>=20
>>> Sometimes we need to collect the translation logs starting
>>> from some point of the execution. Some TB listings may
>>> be missed in this case, when blocks were translated before.
>>> This patch clears TB cache to allow re-translation of such
>>> code blocks.
>>>
>>> Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
>>> ---
>>>   accel/tcg/translate-all.c |    8 ++++++++
>>>   include/sysemu/tcg.h      |    1 +
>>>   stubs/meson.build         |    1 +
>>>   stubs/tcg.c               |   12 ++++++++++++
>>>   util/log.c                |    3 +++
>>>   5 files changed, 25 insertions(+)
>>>   create mode 100644 stubs/tcg.c
>>>
>>> diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
>>> index e9de6ff9dd..3acb227c57 100644
>>> --- a/accel/tcg/translate-all.c
>>> +++ b/accel/tcg/translate-all.c
>>> @@ -1461,6 +1461,14 @@ void tb_flush(CPUState *cpu)
>>>       }
>>>   }
>>>=20=20=20
>>> +void tb_flush_all(void)
>>> +{
>>> +    CPUState *cpu;
>>> +    CPU_FOREACH(cpu) {
>>> +        tb_flush(cpu);
>>> +    }
>>> +}
>>> +
>>=20
>> This isn't needed - tb_flush flushes all translations although it does
>> need to be executed in a CPU context to do so.
>>=20
>>>   /*
>>>    * Formerly ifdef DEBUG_TB_CHECK. These debug functions are user-mode=
-only,
>>>    * so in order to prevent bit rot we compile them unconditionally in =
user-mode,
>>> diff --git a/include/sysemu/tcg.h b/include/sysemu/tcg.h
>>> index 00349fb18a..7415f11022 100644
>>> --- a/include/sysemu/tcg.h
>>> +++ b/include/sysemu/tcg.h
>>> @@ -9,6 +9,7 @@
>>>   #define SYSEMU_TCG_H
>>>=20=20=20
>>>   void tcg_exec_init(unsigned long tb_size, int splitwx);
>>> +void tb_flush_all(void);
>>>=20=20=20
>>>   #ifdef CONFIG_TCG
>>>   extern bool tcg_allowed;
>>> diff --git a/stubs/meson.build b/stubs/meson.build
>>> index 80b1d81a31..95e70f8542 100644
>>> --- a/stubs/meson.build
>>> +++ b/stubs/meson.build
>>> @@ -38,6 +38,7 @@ stub_ss.add(files('set-fd-handler.c'))
>>>   stub_ss.add(files('sysbus.c'))
>>>   stub_ss.add(files('target-get-monitor-def.c'))
>>>   stub_ss.add(files('target-monitor-defs.c'))
>>> +stub_ss.add(files('tcg.c'))
>>>   stub_ss.add(files('tpm.c'))
>>>   stub_ss.add(files('trace-control.c'))
>>>   stub_ss.add(files('uuid.c'))
>>> diff --git a/stubs/tcg.c b/stubs/tcg.c
>>> new file mode 100644
>>> index 0000000000..775a748c77
>>> --- /dev/null
>>> +++ b/stubs/tcg.c
>>> @@ -0,0 +1,12 @@
>>> +/*
>>> + * TCG stubs
>>> + *
>>> + * This work is licensed under the terms of the GNU GPL, version 2 or =
later.
>>> + * See the COPYING file in the top-level directory.
>>> + */
>>> +
>>> +#include "sysemu/tcg.h"
>>> +
>>> +void tb_flush_all(void)
>>> +{
>>> +}
>>> diff --git a/util/log.c b/util/log.c
>>> index 2ee1500bee..2ff342a91b 100644
>>> --- a/util/log.c
>>> +++ b/util/log.c
>>> @@ -26,6 +26,7 @@
>>>   #include "trace/control.h"
>>>   #include "qemu/thread.h"
>>>   #include "qemu/lockable.h"
>>> +#include "sysemu/tcg.h"
>>>=20=20=20
>>>   static char *logfilename;
>>>   static QemuMutex qemu_logfile_mutex;
>>> @@ -84,6 +85,8 @@ void qemu_set_log(int log_flags)
>>>   #ifdef CONFIG_TRACE_LOG
>>>       qemu_loglevel |=3D LOG_TRACE;
>>>   #endif
>>> +    tb_flush_all();
>>> +
>>=20
>> I would call tb_flush(current_cpu) or first_cpu here. But two things:
>>=20
>>   - I'm not sure you have a CPU at all times qemu_set_log is called
>>   - It seems overly aggressive to throw away all translations every time
>>     the log level is changed. I would define a mask in log.h and have
>>     something like:
>
> Do you propose removing the parameter from tb_flush or omitting the loop
> from tb_flush_all?

No tb_flush should keep the CPU interface. In normal usage from the
emulation we always have a CPU to call. However for qemu_set_log you
will need to find a CPU to call or bail out if you can't. Maybe
something like:

  CPUStatus *cpu =3D current_cpu || first_cpu;
  if (cpu) {
      tb_flush(cpu);
  }

my only worry is if qemu_set_log is called from outside a CPU context
(current_cpu will always be NULL) while first_cpu is in a exclusive
region. We could extend cpu_in_exclusive_context to be:

  cpu =3D=3D current_cpu && cpu->in_exclusive_context

but that seems a little icky to me. Paolo, any thoughts?

>
>>    if (log_flags & LOG_TRANSLATION) {
>>        tb_flush();
>>    }
>>=20
>>>       /*
>>>        * In all cases we only log if qemu_loglevel is set.
>>>        * Also:
>>=20
>>=20


--=20
Alex Benn=C3=A9e

