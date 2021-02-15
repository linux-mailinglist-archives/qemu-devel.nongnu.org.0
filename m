Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF07E31B906
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 13:21:24 +0100 (CET)
Received: from localhost ([::1]:53846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBcsW-0006xk-0C
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 07:21:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lBca6-0005Fl-4B
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 07:02:22 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:39946)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lBca2-0008CI-Im
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 07:02:21 -0500
Received: by mail-wm1-x336.google.com with SMTP id o24so9049664wmh.5
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 04:02:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=57uPlBSKfyRA2c3AHqsYNnwOJrVEMuXdNhntg7Akhls=;
 b=OGo/j+iJNAVAamBCODGtgZ44fOEuO1Q17Lo1wN9goMFUY2TP150hhVf7F1skK9zAcz
 V2yL3bklHgrMm7salYQEVqsnKm/lswAfrCT5U4RN5XvTSHjikHrVoLF1M0FRnB9u57Ve
 znJGKJ+cMcy31HsbeOoyWTblMr9tAnuIZaDZTWRZLDqCPo0TS3Iq0I4Qdx2rXrNnyAFy
 fGUyUH238wAlYnifIZK0UV/ElRx75s0dYOldFSWl6LRnQKhPIFik7tWfJiSFRn9BJGJr
 rXEhxhd9ki+6NONTQPfqwoL/qwjdO9VFwKiGxCPE0Vwo8BgmpYZxLh0EaL1QNNnWN5PZ
 TVdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=57uPlBSKfyRA2c3AHqsYNnwOJrVEMuXdNhntg7Akhls=;
 b=gmDYPZuAKLrWQGDTVRf2gUIJA4T3iZek0oOhEZi3XXoxwBzgalH03Ff4+XlgjRtrwi
 V4fU0bgQwGKbOq78lz3kPIBMa5VjjtYuCRagYSsZNALgLT3XVbA3ggoPKU+VI5OglAjL
 RkBqZFgznhvdO+5U9PCGe2PkLtRMb63Yaii7l2guQH18oHLiYWdNDHK9IYrUZWC7Vxw7
 YcVTPpbVCiVg4Gs5ZTF62In8EMuhHbXNREdf+SCw47JRjFvv+ckeIuWoaLyMSS5aU1x3
 NuZT/HD3R9uVZD+m4OjP5ZI0U5W2b1v30zmJOXRFWfg6n9oYEIoksYQ7Xjdq2dPLy1Lv
 Ut6g==
X-Gm-Message-State: AOAM53263GlXVjN0PcTVW0tFsjabh6MHRG5Gnk3ao9srSfRtkMnU8wB6
 4mo4uVdUD0qfG5mofMh42IdvWw==
X-Google-Smtp-Source: ABdhPJwQfQX5o4dWc6i1pjqXkddUQH0NLM/nQeLGD+ZkXiWX0KS3uJYkwrUEupE7/uG3q3TkF1bloA==
X-Received: by 2002:a1c:1bc4:: with SMTP id b187mr13815352wmb.18.1613390535607; 
 Mon, 15 Feb 2021 04:02:15 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o83sm25799934wme.37.2021.02.15.04.02.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Feb 2021 04:02:14 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9E0531FF7E;
 Mon, 15 Feb 2021 12:02:13 +0000 (GMT)
References: <20210117164813.4101761-1-f4bug@amsat.org>
 <20210117164813.4101761-5-f4bug@amsat.org>
 <fd7e64cd-d2cd-104f-ac1b-f5476e08b5a9@suse.de>
 <47f62c85-243c-ba70-56d6-0157afa5ae86@amsat.org>
 <35adfe42-6f89-1f48-7ed2-da1d2f4d7eb7@suse.de>
User-agent: mu4e 1.5.8; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [PATCH 4/6] accel/tcg: Declare missing cpu_loop_exit*() stubs
Date: Mon, 15 Feb 2021 12:01:02 +0000
In-reply-to: <35adfe42-6f89-1f48-7ed2-da1d2f4d7eb7@suse.de>
Message-ID: <874kidv8sa.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
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
 Huacai Chen <chenhuacai@kernel.org>, Eduardo Habkost <ehabkost@redhat.com>,
 Riku Voipio <riku.voipio@iki.fi>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Claudio Fontana <cfontana@suse.de> writes:

> On 1/18/21 10:39 AM, Philippe Mathieu-Daud=C3=A9 wrote:
>> On 1/18/21 10:29 AM, Claudio Fontana wrote:
>>> On 1/17/21 5:48 PM, Philippe Mathieu-Daud=C3=A9 wrote:
>>>> cpu_loop_exit*() functions are declared in accel/tcg/cpu-exec-common.c,
>>>> and are not available when TCG accelerator is not built. Add stubs so
>>>> linking without TCG succeed.
>>>
>>> The reason why stubs are needed here at all seems to be that that the c=
ode
>>> calling cpu_loop_exit is not refactored properly yet;
>>=20
>> I agree ...
>>=20
>>> if we look at the example of i386, after the refactoring moving tcg rel=
ated code into target/i386/tcg/,
>>> (and really even before that I think),
>>> the code calling cpu_loop_exit is not built for non-TCG at all, and so =
we don't need stubs.
>>>
>>> I am ok with this anyway, just wanted to convey that I think we should =
look at stubs as a necessary evil until all code stops mixing tcg, kvm and =
other accels...
>>>
>>> Thanks,
>>>
>>> Claudio
>>>
>>>>
>>>> Problematic files:
>>>>
>>>> - hw/semihosting/console.c in qemu_semihosting_console_inc()
>>>> - hw/ppc/spapr_hcall.c in h_confer()
>>>> - hw/s390x/ipl.c in s390_ipl_reset_request()
>>>> - hw/misc/mips_itu.c
>>=20
>> ... but I have no clue how to refactore these, as they
>> are used in both KVM and TCG.
>>=20
>> How would you do? I'm stuck with the semihosting code
>> dependency on ARM since 2 years...
>>=20
>> Phil.
>>=20
>
> Just naively looking at this, qemu_semihosting_console_inc seems called o=
nly by
> do_arm_semihosting in target/arm/arm-semi.c,
>
> which in turn is called by linux-user (TCG),
>
> target/arm/m_helper.c in arm_v7m_cpu_do_interrupt(),
> which I would assume is TCG only too, just waiting for the TCG/KVM refact=
oring in ARM, which I would assume would make cpu_tcg.c TCG-only,
>
> target/arm/helper.c in handle_semihosting, which is already wrapped in #i=
fdef CONFIG_TCG and is commented with:
>
> "
> * We only see semihosting exceptions in TCG only as they are not=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
> * trapped to the hypervisor in KVM.=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
> */
> "
>
> So am I wrong in my assumption that as soon as we are able to separate
> TCG vs KVM in target/arm/ , the issue of hw/semihosting/console.c
> would be solved?

I think it is - certainly for ARM. I don't know if real RiscV HW can
trap semihosting calls to the kernel/hypervisor.

--=20
Alex Benn=C3=A9e

