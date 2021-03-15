Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3994333C574
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 19:21:55 +0100 (CET)
Received: from localhost ([::1]:35654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLrqk-00077l-5Y
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 14:21:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lLrY9-000218-SF
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 14:02:42 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:36420)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lLrY5-0000Qs-N4
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 14:02:41 -0400
Received: by mail-ej1-x62a.google.com with SMTP id e19so67909559ejt.3
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 11:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=WnJzA8Iy30hPj7pU5LRd0S4xGstMsa1oGli03doX7ug=;
 b=gkynSK3OsoKu5w3YM9qIAEoLfRF1hob74XtUEwFB21mcidnXTyyO5PckOjPy1qN16z
 D9DJCsmHZJbuJn9XFZL2vHs9RQpkMBD+npQ3fMLVGj72aTsynRd1kw4crW++/rnxBFY4
 gNsqpohH7ejakZyRScVh2teU9brqllwUuNtrj98W1qYrKLcE8JhHAMZ4gY1QHtljKoVk
 6uQX2n09j91QHjMRVeHK/g5Yu2uysHEOHSDfZXLZW/3ANEqkn4v6Q+cVa9iYDj50HaxF
 wPjTKG6iMLatLGR1+DumnDQmilXuZbA30X+pu0Qf3PgtVX/nHYJKRYJfl5/F0+tt6S0C
 M+hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=WnJzA8Iy30hPj7pU5LRd0S4xGstMsa1oGli03doX7ug=;
 b=F+r/lxP7SI85n0Twsmtt5ZBEeJOi8j4/eHSZ8mMy8E4+eLXCIiyxpxyvEWYciLQF+C
 LbKvXf3irniRRSTPsqHMVmYsKYbu3dFxQ2SC1LleldRvFg78RAnn8ooXqmIlb9W2zVIl
 mavKa3g/SI0PYgWqyGTdOVcvcTa0gwYYs8d/FF9PwoS0Tz2B09VUEKlwD0w2PJ/QvX/L
 07l5Js1lsPAVKWa/0qBoEjWHqB70hbfFkgC1qoCDo0m8ngxuBou8TdmJ8qaKatKWLYmi
 tlROtNR5Wz5qQ/FyAAOth/YJxT7WYveuQ0f1Q2AI/Nyup6e7/lwP5k4wC1j9HpY+RX+2
 qBrA==
X-Gm-Message-State: AOAM532zzsoPgRCAErkP4rcAOnPV+MrXOk+0pDN1l3Sp247lJuAbkyTd
 tLgfFcR2mqiBx5N21FhUVq9/aA==
X-Google-Smtp-Source: ABdhPJxDEFRWuz0+2r++S6E2N7hiSPqXIrRhQM9sSBwa5DDycLZjV4RcbT99GwkjFSQ3v46K+FCDzw==
X-Received: by 2002:a17:906:4cd6:: with SMTP id
 q22mr25285318ejt.469.1615831355947; 
 Mon, 15 Mar 2021 11:02:35 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id da17sm8717048edb.83.2021.03.15.11.02.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 11:02:34 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 059E11FF7E;
 Mon, 15 Mar 2021 18:02:34 +0000 (GMT)
References: <20210308135104.24903-1-alex.bennee@linaro.org>
 <20210308135104.24903-14-alex.bennee@linaro.org>
 <2bcd9ae8-b304-a9a1-9f14-d238a9b2f6a2@de.ibm.com>
 <e690a377-2f3e-0774-03f8-813f2631e4f0@redhat.com>
 <0edd9206-a77b-7bdf-6c9a-f3f395f58cf3@redhat.com>
 <1b9d8751-7e04-15a9-ad4f-6f8c34a6f915@de.ibm.com>
 <e8805fa7-2d3e-5801-1692-b588629060c9@redhat.com>
User-agent: mu4e 1.5.10; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PULL 13/18] hw/core: implement a guest-loader to support
 static hypervisor guests
Date: Mon, 15 Mar 2021 18:01:44 +0000
In-reply-to: <e8805fa7-2d3e-5801-1692-b588629060c9@redhat.com>
Message-ID: <87k0q88fd2.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62a.google.com
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> On 3/15/21 5:59 PM, Christian Borntraeger wrote:
>> On 15.03.21 17:51, Philippe Mathieu-Daud=C3=A9 wrote:
>>=20
>>> diff --git a/hw/core/Kconfig b/hw/core/Kconfig
>>> index fdf03514d7d..9397503656d 100644
>>> --- a/hw/core/Kconfig
>>> +++ b/hw/core/Kconfig
>>> @@ -11,6 +11,11 @@ config GENERIC_LOADER
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 default y
>>>
>>> +config GUEST_LOADER
>>> +=C2=A0=C2=A0=C2=A0 bool
>>> +=C2=A0=C2=A0=C2=A0 default y
>>> +=C2=A0=C2=A0=C2=A0 depends on TCG
>>> +
>>> =C2=A0 config OR_IRQ
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool
>>>
>>> diff --git a/hw/core/meson.build b/hw/core/meson.build
>>> index 9cd72edf513..59f1605bb07 100644
>>> --- a/hw/core/meson.build
>>> +++ b/hw/core/meson.build
>>> @@ -16,6 +16,7 @@
>>> =C2=A0 common_ss.add(files('cpu.c'))
>>> =C2=A0 common_ss.add(when: 'CONFIG_FITLOADER', if_true: files('loader-f=
it.c'))
>>> =C2=A0 common_ss.add(when: 'CONFIG_GENERIC_LOADER', if_true:
>>> files('generic-loader.c'))
>>> +common_ss.add(when: ['CONFIG_GUEST_LOADER', fdt], if_true:
>>> files('guest-loader.c'))
>>> =C2=A0 common_ss.add(when: 'CONFIG_OR_IRQ', if_true: files('or-irq.c'))
>>> =C2=A0 common_ss.add(when: 'CONFIG_PLATFORM_BUS', if_true:
>>> files('platform-bus.c'))
>>> =C2=A0 common_ss.add(when: 'CONFIG_PTIMER', if_true: files('ptimer.c'))
>>> @@ -37,8 +38,6 @@
>>> =C2=A0=C2=A0=C2=A0 'clock-vmstate.c',
>>> =C2=A0 ))
>>>
>>> -softmmu_ss.add(when: 'CONFIG_TCG', if_true: files('guest-loader.c'))
>>> -
>>> =C2=A0 specific_ss.add(when: 'CONFIG_SOFTMMU', if_true: files(
>>> =C2=A0=C2=A0=C2=A0 'machine-qmp-cmds.c',
>>> =C2=A0=C2=A0=C2=A0 'numa.c',
>>=20
>>=20
>> Also
>> Tested-by: Christian Borntraeger <borntraeger@de.ibm.com>
>
> Thanks Christian!

Can you send that to me as a proper patch (unless Christian wants to
take it through the s390 trees)?

--=20
Alex Benn=C3=A9e

