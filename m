Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3205307A70
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 17:14:49 +0100 (CET)
Received: from localhost ([::1]:53464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l59wW-00073x-UE
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 11:14:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l59vA-0006OU-Ua
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 11:13:24 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:35095)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l59v9-0000kZ-3a
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 11:13:24 -0500
Received: by mail-wr1-x434.google.com with SMTP id l12so5987170wry.2
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 08:13:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=GYZyO00VQjHzmjg2hIqpnizUZVG0y7RGFc0p6NRR2Jk=;
 b=f/IPuVbt/0vnYFha6orgM69FmtN2WGnEEW8uGbc+CT0qLirM/oXeOIhtFf0fCgnpWk
 nLY+4gcZv+wRZuZn769UxBB99T5c0yRbipVs9a9LpOFEBrEtxbqx78aNJU46Q6TnrPhE
 I1u8axtuvpYoVP7leZfcJR9A/rT0sVkkm0HuFa9wwwGjQHbhJocTUdErOC/eT4AbuBhx
 6MMGy2pWQ4HJLPssJDEUwo0fW7nVr513KI2H/B1WFf4z/js0qEGWz24R3luivh551DAu
 Y3fDr6gBYFLBMWs7hhSlyh2oY6U3iABeK9bDesuQ4koZLEfdCRpGvFwFqrXvOFKYmiho
 SKsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=GYZyO00VQjHzmjg2hIqpnizUZVG0y7RGFc0p6NRR2Jk=;
 b=gg0IeBxmDJXU3sBBhtUkm++sQ7oPgoe0Fryh9mT5VhFNrirFS2XD6pEf1Clcv+2l5I
 pcxQz9nHcKbwTb6MjWAI34oxcx6s95TdMV69JPU9QO69NGi1w4FIR8Ym+WwzD+TeP1f4
 87FFkOpq5u5kb8bS2DmU+nsZW1FwgALLd1anjr/98f3V3tYwC5cvCtXjIt3DMStXYUZr
 YbF95MY/uS4Fj4xD1KrYjMGSDt4Lm7FNEHf4XDaP+KKPnJPhx727ldpzzK5Wg5ierVYU
 bZn/uGG2mvIvZGpkA/TklT1/Wogu+DH4PZXIjvPRgzbjDhWQGkFNZ0zkxP42eobLzKht
 xcnQ==
X-Gm-Message-State: AOAM531miYM5ArloDYK7fAeMjjR0BycL/p3pUQoov9pZAltWZCu3SNN7
 8SF4xPxSGQWyeywVb0fJpigVQw==
X-Google-Smtp-Source: ABdhPJy1vEL4lNHTC2pkRv4pZ9SiGjfuqEMmX6qD7LFmt6wVCf8DQzIZqsMV1fQvQbpf38MLPDtv/A==
X-Received: by 2002:adf:9e47:: with SMTP id v7mr16884184wre.185.1611850401251; 
 Thu, 28 Jan 2021 08:13:21 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id y63sm6576685wmd.21.2021.01.28.08.13.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 08:13:19 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B0AC71FF7E;
 Thu, 28 Jan 2021 16:13:18 +0000 (GMT)
References: <20210128092814.8676-1-cfontana@suse.de>
 <20210128092814.8676-19-cfontana@suse.de>
 <64d8385c-db22-b647-2402-3840b0e0e9b5@redhat.com>
 <9a51a203-f6a8-686f-7859-475537b3607a@suse.de>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [PATCH v14 18/22] accel: introduce AccelCPUClass extending
 CPUClass
Date: Thu, 28 Jan 2021 16:08:48 +0000
In-reply-to: <9a51a203-f6a8-686f-7859-475537b3607a@suse.de>
Message-ID: <878s8dujj5.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
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
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Claudio Fontana <cfontana@suse.de> writes:

> On 1/28/21 2:03 PM, Philippe Mathieu-Daud=C3=A9 wrote:
>> On 1/28/21 10:28 AM, Claudio Fontana wrote:
<snip>
>>> +
>>> +#define TYPE_ACCEL_CPU "accel-" CPU_RESOLVING_TYPE
>>> +#define ACCEL_CPU_NAME(name) (name "-" TYPE_ACCEL_CPU)
>>> +typedef struct AccelCPUClass AccelCPUClass;
>>> +DECLARE_CLASS_CHECKERS(AccelCPUClass, ACCEL_CPU, TYPE_ACCEL_CPU)
>>> +
>>> +typedef struct AccelCPUClass {
>>> +    /*< private >*/
>>> +    ObjectClass parent_class;
>>> +    /*< public >*/
>>> +
>>> +    void (*cpu_class_init)(CPUClass *cc);
>>> +    void (*cpu_instance_init)(CPUState *cpu);
>>> +    void (*cpu_realizefn)(CPUState *cpu, Error **errp);
>>=20
>> If we want callers to check errp, better have the prototype return
>> a boolean.
>
> Good point, the whole errp thing is worth revisiting in the series,
> there are many cases (which are basically reproduced in the refactoring f=
rom existing code),
> where errp is passed but is really unused.
>
> I am constantly internally debating whether to remove the parameter altog=
ether, or to keep it in there.
>
> What would you suggest?

I think it really depends on if we can expect the realizefn to usefully
return an error message that can be read and understood by the user. I
guess this comes down to how much user config is going to be checked at
the point we realize the CPU?

The bool returning realizefn with Error is a fairly common pattern.

>
>>=20
>>> +} AccelCPUClass;
>>=20
>>=20
>
> Thanks for looking at this,
>
> Claudio


--=20
Alex Benn=C3=A9e

