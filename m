Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 396AA322936
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 12:06:03 +0100 (CET)
Received: from localhost ([::1]:59216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEVVy-0003Ik-9n
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 06:06:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lEVUV-0002bI-IT
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 06:04:32 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:37162)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lEVUL-0002tP-Bv
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 06:04:31 -0500
Received: by mail-wr1-x429.google.com with SMTP id v15so22137682wrx.4
 for <qemu-devel@nongnu.org>; Tue, 23 Feb 2021 03:04:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=FsIVv20gkBiBXxeA1xI/FHq86YI7kbJ9LtNZyacrivo=;
 b=z1FIXntziB1MxCklPvMmwR5oIwDyOXt/EjtEs7+DZ1MyCM0u+3vZlsMFklsPFPAENn
 9dfbW8zElWhN5ZXtnGsVlUhaXfewui4g1qKhG06sLkDC/s8B1MWXaTlgo7LNTycysYA7
 Nw9lKB/IAg9NeW+rSVIwcVU2MDk+zfgpJ7yTxM7dV4SiYJdLKP2QhU9dUPOuok1qMHyT
 A/R96r3hYw6DJcC7i78c9ty/pVvf/SWobvGu2C2VQJIokE+Sdi/Hsoy11d8wzQ9iOWlt
 Z/6nDmmu7zKaHFpnavKAg9ZO7gDUycgxQM0BDWKVMbvRwQB8hlQzMqWY4h2Wuvi9NlF9
 UTng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=FsIVv20gkBiBXxeA1xI/FHq86YI7kbJ9LtNZyacrivo=;
 b=UrUk55PTgJWtU0nzIYyzyKcJ1GOgXukZIICzP37vlVrlpohAUNCFjtg7FZyypLSXtZ
 tGty26DE9C4gtanLUiUOKc2wErT4UqUwTHsOtlhQTRb6BSNG1NBAx2l9vDuMRPCS5zov
 GvOdycf7As+79kmXGJOb/BbF/9tqUp02kWklmwT/FNnxQKiSPrDdh8clfVxYVJHj0gD6
 q4VzQG2eaFmkC/XXiXzFthtEi83gJ6CyP7eodarKQY/l1ZePLo9e/ANnrh8p9zIiUozh
 3U7IR14WkiSLyAo50j4l/bp0uTpocmXvuKvW+Hki13OWQQi3hq/n1E3ApzVIU87ckiaV
 mM+g==
X-Gm-Message-State: AOAM533z/b+1Q9n/aXLiYGBFD8hNpeo+TYsKM9tuBE92LztTRdJu95bI
 +prYqeJwyeF67y4iIAU1IgpHtw==
X-Google-Smtp-Source: ABdhPJyAk2Mgp4TaxGvK23ujct+FX9RFPOlRHwhnx9LWuRtnLYkkwLuxXLMcOHPyyHjRv7VwLQIvNg==
X-Received: by 2002:adf:fe0d:: with SMTP id n13mr9693021wrr.224.1614078259740; 
 Tue, 23 Feb 2021 03:04:19 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id t15sm2226266wmi.48.2021.02.23.03.04.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Feb 2021 03:04:18 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6996B1FF7E;
 Tue, 23 Feb 2021 11:04:17 +0000 (GMT)
References: <20210221092449.7545-1-cfontana@suse.de>
 <20210221092449.7545-35-cfontana@suse.de> <87v9ak5cz0.fsf@linaro.org>
 <03502e51-99f5-239d-42a6-e57892faa297@suse.de>
User-agent: mu4e 1.5.8; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [RFC v1 34/38] target/arm: cpu: only initialize TCG gt timers
 under CONFIG_TCG
Date: Tue, 23 Feb 2021 11:01:33 +0000
In-reply-to: <03502e51-99f5-239d-42a6-e57892faa297@suse.de>
Message-ID: <87wnuz3v0u.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Claudio Fontana <cfontana@centriq4.arch.suse.de>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Roman Bolshakov <r.bolshakov@yadro.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-D?= =?utf-8?Q?aud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Claudio Fontana <cfontana@suse.de> writes:

> On 2/22/21 4:34 PM, Alex Benn=C3=A9e wrote:
>>=20
>> Claudio Fontana <cfontana@suse.de> writes:
>>=20
>>> From: Claudio Fontana <cfontana@centriq4.arch.suse.de>
>>>
>>> KVM has its own cpu->kvm_vtime.
>>>
>>> Adjust cpu vmstate by putting unused fields instead of the
>>> VMSTATE_TIMER_PTR when TCG is not available.
>>>
>>> Signed-off-by: Claudio Fontana <cfontana@suse.de>
>>> ---
>>>  target/arm/cpu.c     | 4 +++-
>>>  target/arm/machine.c | 5 +++++
>>>  2 files changed, 8 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
>>> index 1d81a1e7ac..b929109054 100644
>>> --- a/target/arm/cpu.c
>>> +++ b/target/arm/cpu.c
>>> @@ -1322,6 +1322,7 @@ static void arm_cpu_realizefn(DeviceState *dev, E=
rror **errp)
>>>          }
>>>      }
>>>=20=20
>>> +#ifdef CONFIG_TCG
>>>      {
>>>          uint64_t scale;
>>>=20=20
>>> @@ -1347,7 +1348,8 @@ static void arm_cpu_realizefn(DeviceState *dev, E=
rror **errp)
>>>          cpu->gt_timer[GTIMER_HYPVIRT] =3D timer_new(QEMU_CLOCK_VIRTUAL=
, scale,
>>>                                                    arm_gt_hvtimer_cb, c=
pu);
>>>      }
>>> -#endif
>>> +#endif /* CONFIG_TCG */
>>> +#endif /* !CONFIG_USER_ONLY */
>>>=20=20
>>>      cpu_exec_realizefn(cs, &local_err);
>>>      if (local_err !=3D NULL) {
>>> diff --git a/target/arm/machine.c b/target/arm/machine.c
>>> index 666ef329ef..13d7c6d930 100644
>>> --- a/target/arm/machine.c
>>> +++ b/target/arm/machine.c
>>> @@ -822,8 +822,13 @@ const VMStateDescription vmstate_arm_cpu =3D {
>>>          VMSTATE_UINT32(env.exception.syndrome, ARMCPU),
>>>          VMSTATE_UINT32(env.exception.fsr, ARMCPU),
>>>          VMSTATE_UINT64(env.exception.vaddress, ARMCPU),
>>> +#ifdef CONFIG_TCG
>>>          VMSTATE_TIMER_PTR(gt_timer[GTIMER_PHYS], ARMCPU),
>>>          VMSTATE_TIMER_PTR(gt_timer[GTIMER_VIRT], ARMCPU),
>>> +#else
>>> +        VMSTATE_UNUSED(sizeof(QEMUTimer *)),
>>> +        VMSTATE_UNUSED(sizeof(QEMUTimer *)),
>>> +#endif /* CONFIG_TCG */
>>=20
>> I'm not sure this is correct - VMSTATE_TIMER_PTR chases the links to
>> just expose expired time but QEMUTimer has more in it than that. Paolo
>
>
> I am not sure I follow can you state more precisely where the issue could=
 be?
>
> it's not a VMSTATE_TIMER, it's a VMSTATE_TIMER_PTR,
> it ends up in VMSTATE_POINTER where a single pointer is assigned;

Does it? I thought it ended up with the .expire_time (int64_t) which
will be bigger than sizeof(QemuTimer *) on a 32 bit system.

>
> so if we don't use gt_timer at all (as is the case with !CONFIG_TCG), we =
just
> need to ensure that an unused number is there to assign, migrating from o=
ld to new version?
>
>
>> suggested a straight VMSTATE_UNUSED(8) on IRC but I wonder if it would
>> be better to have a VMSTATE_UNUSED_TIMER?
>>=20
>> I don't think there is an impact for Xen because I'm fairly certain
>> migration isn't a thing we do - but I'll double check.
>>=20
>
> Thanks Alex, that would be helpful,
> if Xen uses gt_timer in any way I would not want to unwillingly break
> it.

Not for ARM no, currently there is no ARM specific machine emulated by
QEMU for Xen. All ARM guests are PV guests.

>
> Thanks,
>
> Claudio


--=20
Alex Benn=C3=A9e

