Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C69302656
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 15:35:55 +0100 (CET)
Received: from localhost ([::1]:39614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l42yA-00085J-Kl
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 09:35:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l42x4-0007Ux-2k
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 09:34:46 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:35577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l42x2-0005qu-Ap
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 09:34:45 -0500
Received: by mail-wr1-x42e.google.com with SMTP id l12so12786238wry.2
 for <qemu-devel@nongnu.org>; Mon, 25 Jan 2021 06:34:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=R2Duzd8WnNjqTeTk3vrLuhkB1idtvW0UGTtd4880GX0=;
 b=hSBPRYGtsvQmXRI8cffMK8bE/5FUdoAvg+fl6plpsrXSM/OGgGchYPbZX+B0Qo6Uqf
 2YJPI3pKT5NclsE8+8Ld6mZgoH7BOsJ/LpHvF+Bd9Y7vlkzw9lwUtwWakTfIRVJsgMzc
 QY/VTGj/UUMqOIIqDcDYfFoRowqgoqz+9bf2689HAJJHHLWeZKENBZt7SMEQ+lR0nQsY
 AivKV3i53ay3NirNhi7e7VxoPgnOhW5t6Cv+DPLdu1H6JS1AXvxC4ah/CwG9bcBYCMXp
 Klvwl9wJKR5vUdeFG5HGByq5T5EsznE/VEjRCfMIa56mc+i2XlvAHitY1GF0clLu2t9s
 ZJVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=R2Duzd8WnNjqTeTk3vrLuhkB1idtvW0UGTtd4880GX0=;
 b=qfxlqbJr4GRmRjaykse5w2VW2eYB5hmPLwoCL6M+L/l/1ckvsNYLiw2yg3eMkIAMVc
 n6mRnn93lAvl8M04C3+orIyhr/kjtcnVDDFqG9wXCYUemTGFKvFmjCJ180jtRgdDCBFy
 tpWNqWzpxjcIpyKTKXt/TbY3n5sbiepzbwTezWuWn9D9oUFv51AnopnkQTIFRWJ/YfcB
 8BJvIHUr+e2MuTfja/4UUfFZUZWahxJTvxncAp3Ebj1QfYUV8UQ9S8cZh+q7Tu0iqi/R
 LfNlpUcZZBadhhZ5YQOqfUeDXxFwKcNEVzTee9EwGZNy22mSOMIVwl9TZ30hqXSzfttt
 JB/w==
X-Gm-Message-State: AOAM531B85DFxcifoms+951h2JKEXbTJHx0ikMDcHHyI0OzoKgPKWbNO
 RD1Lo54IcKFTIVGjUYg71rGuzg==
X-Google-Smtp-Source: ABdhPJyA/ICrHw2nwTngDmRrApQZjW4uN1DEbgky+1hL5JuMkci2uGJZNdZRkmCN2gLkHjhFVaNEWA==
X-Received: by 2002:a5d:4a11:: with SMTP id m17mr1276959wrq.39.1611585282696; 
 Mon, 25 Jan 2021 06:34:42 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r126sm22022194wma.48.2021.01.25.06.34.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jan 2021 06:34:41 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2871F1FF7E;
 Mon, 25 Jan 2021 14:34:40 +0000 (GMT)
References: <161105999349.694343.16096128094758045254.stgit@pasha-ThinkPad-X280>
 <288b2af5-94d5-36c8-9eb2-de31ff1de066@redhat.com>
 <d9f8e9d4-8aef-29b6-765d-014c782e4764@ispras.ru>
 <CABgObfaFnKztrjc7mpgTxEi9R7jXD-Qed5vVcPBSGcE_nexONg@mail.gmail.com>
 <87sg6pmcsz.fsf@linaro.org> <c2799acd-a3f0-daaf-f7e0-b9a3c398f1eb@suse.de>
 <ef64105c-7ae3-9495-45ed-8a9e31fc0d10@suse.de>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [PATCH] replay: fix replay of the interrupts
Date: Mon, 25 Jan 2021 14:26:08 +0000
In-reply-to: <ef64105c-7ae3-9495-45ed-8a9e31fc0d10@suse.de>
Message-ID: <87im7lkruo.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Claudio Fontana <cfontana@suse.de> writes:

> On 1/25/21 1:43 PM, Claudio Fontana wrote:
>> On 1/25/21 1:12 PM, Alex Benn=C3=A9e wrote:
>>>
>>> Paolo Bonzini <pbonzini@redhat.com> writes:
>>>
>>>> In general I agree, but !=3D means that rr disabled returns true. In g=
eneral
>>>> it seems to me that rr disabled should work more or less the same as r=
ecord
>>>> mode, because there is no replay log to provide the checkpoints.
>>>
>>> Is this not an argument to combine the mode and check into replay.h
>>> inline helpers with some clear semantic documentation and the call sites
>>> become self documenting?
>>>
>>> if (deadline =3D=3D 0 && replay_recording_or_checkpoint())
>>>
>>> which also makes things easier to compile away if replay isn't there?
>>=20
>>=20
>> Seems that the TCG build faces a similar issue to the issue I was facing=
 with the non-TCG build,
>> before the non-TCG build got functional again (for x86).
>>=20
>> We solved the non-TCG build problem, by not compiling replay at all for =
non-TCG, plus closing our nose and stubbing away what couldn't be completel=
y removed (yet).
>>=20
>> But the CONFIG_TCG build has the same legitimate requirement towards a n=
on-CONFIG_REPLAY build.
>>=20
>> ie, like we have tcg_enabled(), should we have replay_enabled()? Maybe i=
t could be reworked starting from replay_events_enabled()?
>>=20
>> And then when things are refactored properly for replay_enabled(), a non=
-REPLAY TCG build can basically ignore all the inner workings of replay.
>>=20
>
> I guess to summarize the above, should there be a CONFIG_REPLAY, dependen=
t on CONFIG_TCG, by default on,
> but which could be disabled with
>
> --disable-replay
>
> ?

I'm not sure - fundamentally having replay is one of those cool things
you can do when you have TCG and I suspect there is less pressure to
have a finely tuned TCG enabled build compared to our HW accelerated
brethren using hypervisors. TCG plugins are a configure option purely
because there is a small but non-marginal cost in having it enabled. I
doubt replay figures that much if you are not using it.

That said if it makes it easier to make sure our abstractions are clean
and the layering is good then maybe it is worth having a build that
allows us to check that. But if it's going to be super fiddly and
involve large amounts of code motion I doubt the "win" is big enough for
the effort.

Also I suspect the config option would be CONFIG_ICOUNT because replay
is just one of the features on the spectrum of:

 deterministic icount -> record/replay -> reverse debugging

which all require the base support for icount.

--=20
Alex Benn=C3=A9e

