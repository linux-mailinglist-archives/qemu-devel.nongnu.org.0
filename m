Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A0336B859
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 19:51:33 +0200 (CEST)
Received: from localhost ([::1]:33238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lb5OO-000142-UC
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 13:51:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lb5MI-00074m-C0
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 13:49:23 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:39435)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lb5MG-0008K9-EB
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 13:49:22 -0400
Received: by mail-wr1-x435.google.com with SMTP id q9so2616829wrs.6
 for <qemu-devel@nongnu.org>; Mon, 26 Apr 2021 10:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=0+AO0c1+zbaRXFv76dFj+ON4Nz8qKtyTuFXKIIhNFig=;
 b=nXfycpxagKWQVw4EIsdjBpd+gN1QAcR8NsQtRYoP4iZYtCUmPPIsqa2D9NwTXZDJUM
 S7dBzDiLgD3cfpFq1tGIxFMfXfD0X1NOCTpcVyg2+FS1UX12IDuJhbfUWKP+jpHt3mr6
 LEz/nYefpPLOxxaAWfT4mjM/oFLYnoWsXWnujiVTQXALKw+ibTdjQtawXA5oqQmXh2P0
 HUhFqNqDZqn0tREBjiw5MIEJPhWc39HgIYHNiro8JFY9XVk2PBH5D8cc42+CLYUVlXSq
 Pzg0i6Jro+3D/MchN1Pu8K8Uy0S+SYs/NGc/1vvIj54LnOVu3/W8oIX5e2zrZ53M4rRi
 debA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=0+AO0c1+zbaRXFv76dFj+ON4Nz8qKtyTuFXKIIhNFig=;
 b=P1IHljpJMe+6ROnRy5sGxK3l8qO89qCa+y9KhZV1iEXWZR8GSaHy0Lf4zpI5NZJ0mh
 iCSOdxUbCVnYmYkHrKYJppMVknMUkX+HxEE1Ua2o9/QJfoABz2XFqoHYhfiKqgqiozfM
 p36v18b/U5jE2ctrjYkif5yAJuoeq5mHa/1Tz6ETCsItiPKQzAoFgMZN+go+Nqn84D+Q
 js076WvthInr7s6lPZysoMRYPMQ7ZZHHhHUhzqZWsnxnJBcXvWL7Y+0ZAXsKwofcpUfC
 xwpcXr05NfWdpRqExAx0381GWuEaAtEPt5/qum6QlRtD8A9UlSMVBc0Ikto13Vak5VZU
 /fhg==
X-Gm-Message-State: AOAM530CCtNJJCeXvCEyj57ooS/F7NkPP/9CPDRNo1/i4tFP9sKfEY8X
 P2LqjNcKPuGVn6rglXuQxisQjXx8lHTYvg==
X-Google-Smtp-Source: ABdhPJz0pFFIBOl3V89X6SUPHK3yrP7zmruoOkOkgD4u7KcF7qih4BBq00tBY6KVAOVafviPKgAquA==
X-Received: by 2002:a5d:4533:: with SMTP id j19mr25321343wra.111.1619459357221; 
 Mon, 26 Apr 2021 10:49:17 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id s16sm181006wmh.11.2021.04.26.10.49.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Apr 2021 10:49:16 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E2A8C1FF7E;
 Mon, 26 Apr 2021 18:49:15 +0100 (BST)
References: <CAJyG1bOR659y=6oP5-XFyVv-xLq-C-m4cdsdRP2D+ZVQqyJnqg@mail.gmail.com>
 <87a6pp6lit.fsf@linaro.org> <2E8FB56E-AA11-46A1-8072-C43E8A5A854E@uci.edu>
User-agent: mu4e 1.5.12; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Min-Yih Hsu <minyihh@uci.edu>
Subject: Re: [RFC] tcg plugin: Additional plugin interface
Date: Mon, 26 Apr 2021 18:42:51 +0100
In-reply-to: <2E8FB56E-AA11-46A1-8072-C43E8A5A854E@uci.edu>
Message-ID: <87o8e1rl5w.fsf@linaro.org>
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
Cc: Aaron Lindsay <aaron@os.amperecomputing.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Min-Yih Hsu <minyihh@uci.edu> writes:

> Hi Alex,
>
>> On Apr 23, 2021, at 8:44 AM, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>>=20
>>=20
>> Min-Yih Hsu <minyihh@uci.edu> writes:
>>=20
>>> Hi Alex and QEMU developers,
>>>=20
>>> Recently I was working with the TCG plugin. I found that `qemu_plugin_c=
b_flags` seems to reserve the functionality to
>>> read / write CPU register state, I'm wondering if you can share some
>>> roadmap or thoughts on this feature?
>>=20
>> I think reading the CPU register state is certainly on the roadmap,
>> writing registers presents a more philosophical question of if it opens
>> the way to people attempting a GPL bypass via plugins. However reading
>> registers would certainly be a worthwhile addition to the API.
>
> Interesting=E2=80=A6I=E2=80=99ve never thought about this problem before.
>
>>=20
>>> Personally I see reading the CPU register state as (kind of) low-hangin=
g fruit. The most straightforward way to implement
>>> it will be adding another function that can be called by insn_exec call=
backs to read (v)CPU register values. What do you
>>> think about this?
>>=20
>> It depends on your definition of low hanging fruit ;-)
>>=20
>> Yes the implementation would be a simple helper which could be called
>> from a callback - I don't think we need to limit it to just insn_exec. I
>> think the challenge is proving a non-ugly API that works cleanly across
>> all the architectures. I'm not keen on exposing arbitrary gdb register
>> IDs to the plugins.
>>=20
>> There has been some discussion previously on the list which is probably
>> worth reviewing:
>>=20
>>  Date: Mon, 7 Dec 2020 16:03:24 -0500
>>  From: Aaron Lindsay <aaron@os.amperecomputing.com>
>>  Subject: Plugin Register Accesses
>>  Message-ID: <X86YnHhHMpQBr2/G@strawberry.localdomain>
>>=20
>> But in short I think we need a new subsystem in QEMU where frontends can
>> register registers (sic) and then provide a common API for various
>> users. This common subsystem would then be the source of data for:
>>=20
>>  - plugins
>>  - gdbstub
>>  - monitor (info registers)
>>  - -d LOG_CPU logging
>>=20
>> If you are interested in tackling such a project I'm certainly happy to
>> provide pointers and review.
>
> Thank you! Yeah I=E2=80=99m definitely going to scratch a prototype for t=
his
> register reading plugin interface. I=E2=80=99ll take a look at related em=
ail
> discussions.

Awesome - please CC me on any patches you come up with (as well as
qemu-devel of course ;-).

>
> Best,
> -Min
>
>>=20
>>>=20
>>> Thank you
>>> -Min
>>=20
>>=20
>> --=20
>> Alex Benn=C3=A9e


--=20
Alex Benn=C3=A9e

