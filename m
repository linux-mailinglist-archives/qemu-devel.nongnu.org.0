Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E39328409
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 17:30:16 +0100 (CET)
Received: from localhost ([::1]:51766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGlR1-00030M-5y
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 11:30:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lGlO5-0000EC-Ub
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 11:27:15 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:55475)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lGlO3-0008UB-9j
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 11:27:13 -0500
Received: by mail-wm1-x334.google.com with SMTP id w7so14055353wmb.5
 for <qemu-devel@nongnu.org>; Mon, 01 Mar 2021 08:27:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=5mVAY2ZIPlvw1FZUfsekUxp4yjTwBWTc2uxf1fERe0o=;
 b=brscSX96QvWyTs79Wy3lnOjWCNZcx78PWDElydRqYNZR78h6okp70PBBk4PKW6DEDn
 9/HOn7BKrq/Os7ApM3Ly7C1CVfUCPtJduXxig5orYt6oAJYUL0hssO0WVAPXQddS5aGM
 i4T4QZ1JqDyCKOXVV0LjWOv+Zj3QSbgdp6+Fsde5nOppBPqdtNCXrrmn7UerrwMpIl14
 Fkayym1QNwvoBqc01VJIv1Np8061wIwKE0iLbe9raBWwEHqnZZAXeR3aKDAQtSQj2WTB
 jJaamlWNxORd2d3EXvZVnt5sIg6qRfaVhdCbmKZV/SAp+QM50bXNjvzSQ+fk6Pqac695
 Idxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=5mVAY2ZIPlvw1FZUfsekUxp4yjTwBWTc2uxf1fERe0o=;
 b=ffGdBTNNhpkw/JZvkcflJcnj1SiaSeA+MqMdw6FcASZpqKyXkyg+OqPqt/LwmBjeEE
 Q4u110h2nTWLADmYqkZkfiMuayyNjFpbGudUtfx0JaRrZ53RsVObDK/k12vhx9j2KAtd
 MgNtLx6aV38VVxCVAiLGDQxVLGXBFEDlPCdkHj5H8cNuikE5UssAkkEVvkcJhia6LuQ0
 ZWQguWO7z+yPjCvcoK5Lu6NMCFlJuZ3kafFDpqEmqWqiAFdDc+MAJKuhVidFyC7HD2+f
 P8KYQpVsYfwHNsJ0y7+mYe8IsXKYmj6jxf2p85jbRhBf7ivljIrqCkcC2PeNNPFNtxVa
 ZmqA==
X-Gm-Message-State: AOAM530RceNAQGb6j+4WSlSznpBLoC4BHg++Rpx9cU0Gm5ZwWGC8GwcT
 29+TorcLahpex6MWxzaNPRHzUg==
X-Google-Smtp-Source: ABdhPJx0ZdnQffrOsmD0prnofphMLrm9gFPW1BZRmmujObjQYlNmSHB1iwnAsYEzSDPDbzmCz1glKQ==
X-Received: by 2002:a1c:1d82:: with SMTP id d124mr15909143wmd.1.1614616029369; 
 Mon, 01 Mar 2021 08:27:09 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id w16sm12519804wrk.41.2021.03.01.08.27.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Mar 2021 08:27:08 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2D77F1FF7E;
 Mon,  1 Mar 2021 16:27:07 +0000 (GMT)
References: <20210221092449.7545-1-cfontana@suse.de>
 <875z2k53mn.fsf@linaro.org>
 <a3ed4064-6dec-24c6-8138-ce8301f01e1e@redhat.com>
 <63847c79-93c2-5ee3-d568-9091fedf325c@suse.de>
User-agent: mu4e 1.5.8; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [RFC v1 00/38] arm cleanup experiment for kvm-only build
Date: Mon, 01 Mar 2021 16:23:06 +0000
In-reply-to: <63847c79-93c2-5ee3-d568-9091fedf325c@suse.de>
Message-ID: <87a6rmkffo.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
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
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Roman Bolshakov <r.bolshakov@yadro.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Claudio Fontana <cfontana@suse.de> writes:

> On 2/23/21 10:18 AM, Philippe Mathieu-Daud=C3=A9 wrote:
>> On 2/22/21 8:00 PM, Alex Benn=C3=A9e wrote:
>>>
>>> Claudio Fontana <cfontana@suse.de> writes:
>>>
>>>> Hi all,
>>>>
>>>> this is an experiment, a cleanup based on and requiring the series
>>>> "i386 cleanup PART 2":
>>>>
>>>> https://lists.gnu.org/archive/html/qemu-devel/2021-02/msg05935.html
>>>>
>>>> The goal is to split the code between TCG-only and non-TCG code,
>>>> fixing the KVM-only build (configure --disable-tcg),
>>>>
>>>> and laying the ground for further cleanups and the use of the
>>>> new accel objects in the hierarchy to specialize the cpu
>>>> according to the accelerator.
>>>>
>>>> This is known to be an early state, with probably a lot of work
>>>> still needed.
>>>
>>> Well early work is looking pretty good:
>>>
>>>   18:59:22 [alex@idun:~/l/q/b/default] review/arm-cleanup-rfc1|=E2=80=
=A6 =C2=B1 ls -lh qemu-system-aarch64
>>>   -rwxr-xr-x 1 alex alex 107M Feb 22 18:08 qemu-system-aarch64*
>>>   18:59:29 [alex@idun:~/l/q/b/default] review/arm-cleanup-rfc1|=E2=80=
=A6 =C2=B1 ls -lh ../disable.tcg/qemu-system-aarch64
>>>   -rwxr-xr-x 1 alex alex 76M Feb 22 17:47 ../disable.tcg/qemu-system-aa=
rch64*
>>=20
>> :~)
>>=20
>>>
>>> and I've tested the KVM side works well enough with a basic image.
>>=20
>>=20
>
> I am working on the next version, one thing I noticed among others as I g=
et close to the v2,
> is the fact that tests/ for arm require tcg in many cases.

I think in a lot of cases they are historical because developers
generally weren't running on native hardware. That said off the top of
my head:

  tests/tcg - linux-user, so implies TCG
  tests/tcg/system - use semihosting (at least for arm/aarch64) - which imp=
lies TCG
  tests/acceptance/[replay_kernel/reverse_debugging/tcg_plugins] - all need=
 TCG features

I don't think there is any reason the others can't run with KVM - and
probably should on real hardware.

>
> So there is even more cleanup needed to discern which are actually tcg-on=
ly, and how to tweak the others into working also with only kvm available..
>
> Ciao,
>
> Claudio


--=20
Alex Benn=C3=A9e

