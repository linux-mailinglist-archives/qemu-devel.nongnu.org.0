Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 284CF6461FD
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Dec 2022 21:01:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p30a9-0007Mv-5s; Wed, 07 Dec 2022 14:59:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1p30a6-0007Mj-Au
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 14:59:50 -0500
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1p30a4-0004ls-KE
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 14:59:49 -0500
Received: by mail-yb1-xb2d.google.com with SMTP id 7so24094046ybp.13
 for <qemu-devel@nongnu.org>; Wed, 07 Dec 2022 11:59:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eU6xK0DorVPJnpkOPuvJxHOHAbi8J4cuMpD7ZnejfrI=;
 b=EusGQzkqgGAiwe62dWyZ2VQuZVTlbPWBr/1evvtPocGBX+ZNkvo0pZrtyxB5yWHwRH
 /q7eicsroXWH5LwJBc2yeVvoklNXwr+pZKo0+2qgV6PGoXX1pkYETjQbhXhN7AG/Zj82
 gh2JjDuE1+V5kyTqmWMuWJFXU2+k4GjRAiV861pj14zcZ9KeS5PFsfEvkY4G7dx0163q
 jk1wygEWVKTVlX1b+EakgFwMsxnogp803RPk5syQ8eJcPL8zWR/t1INHHvMTVwReguOr
 nKxORIYK2+WpGu+zYZRVUilQPkNYobvuQjkmgr0lklIIRuW07ae36+tnh/dSrQzgYdSS
 0ZwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eU6xK0DorVPJnpkOPuvJxHOHAbi8J4cuMpD7ZnejfrI=;
 b=i4PF4hdeSBxuFx0yJMmj/CS6CX8fzhHTjm6/5sQg7U6M5mrUUxVHkIQkf/NlMde/1K
 Aol81pp/Y9uHega2J3jqG/eFbnQa36HRa80wbQ92MUk+A+q73kqGlIeaZuhM8Acoo8fe
 fsIqSopDRzIrK/3hrhhYyf4x0dBANYk9boVisBPyTnM8D4RhjKVP/uLLTSeLNUwPkClL
 XB96HahJBij+w5XMzhWY64zERNr3b0VLmwjUeqPdEEWxMhDxrXyLGrTS5xc8wZ1wKfa2
 1hgYvwZDhvsCia6b3F+zSJex80F+g0Ldp/mcqsjAKKL/e/s63LPQkKrg9WsJD0RyAyqR
 f3Lw==
X-Gm-Message-State: ANoB5pmyfj6PRPX/92cteaVMSwPLjigDxLlHwhkzGDGYobWEVE67smKr
 QZXs29YwBXWngidiNQ6ar7fwmfskI9BbezjwB7c=
X-Google-Smtp-Source: AA0mqf6kpeiPwiOcFrKxpDrGzAYckqoXtdtouTmEVBbj2sNOPcfsxOV9qdljXiZ+o0D2z8B514WJ5lb6cLpWpjodtm8=
X-Received: by 2002:a25:4c85:0:b0:701:6660:4386 with SMTP id
 z127-20020a254c85000000b0070166604386mr12351257yba.366.1670443187320; Wed, 07
 Dec 2022 11:59:47 -0800 (PST)
MIME-Version: 1.0
References: <20221207132439.635402-1-eric.auger@redhat.com>
 <f8a36758-cff2-3df3-3e30-083175e47131@redhat.com>
 <CAJSP0QXo0p5E_G9rqLO0wqC=NDQzMhoJOJDb0ShV+7OetFMMbg@mail.gmail.com>
 <6a39520b-5445-bda4-951f-998675d6e045@redhat.com>
 <0828040a-c297-46b0-68b7-4761583f1ceb@linaro.org>
 <3aab489e-9d90-c1ad-0b6b-b2b5d80db723@redhat.com>
 <b0afb1f7-1156-9b4a-a87b-f56c72f753c0@weilnetz.de>
In-Reply-To: <b0afb1f7-1156-9b4a-a87b-f56c72f753c0@weilnetz.de>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Wed, 7 Dec 2022 14:59:34 -0500
Message-ID: <CAJSP0QXZrpN_2+0nO=4RB9FCi=nd=uhgUFDiQ3V5CDhAQNPOXA@mail.gmail.com>
Subject: Re: [PATCH for 7.2?] target/i386: Remove compilation errors when
 -Werror=maybe-uninitialized
To: Stefan Weil <sw@weilnetz.de>
Cc: eric.auger@redhat.com,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 eric.auger.pro@gmail.com, pbonzini@redhat.com, richard.henderson@linaro.org, 
 paul@nowt.org, qemu-devel@nongnu.org, peter.maydell@linaro.org, 
 Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb2d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

On Wed, 7 Dec 2022 at 14:11, Stefan Weil <sw@weilnetz.de> wrote:
>
> Am 07.12.22 um 19:22 schrieb Eric Auger:
> >
> > On 12/7/22 17:55, Philippe Mathieu-Daud=C3=A9 wrote:
> >> On 7/12/22 15:33, Eric Auger wrote:
> >>> On 12/7/22 15:09, Stefan Hajnoczi wrote:
> >>>> On Wed, 7 Dec 2022 at 08:31, Eric Auger <eric.auger@redhat.com> wrot=
e:
> >>>>> On 12/7/22 14:24, Eric Auger wrote:
> >>>>>> Initialize r0-3 to avoid compilation errors when
> >>>>>> -Werror=3Dmaybe-uninitialized is used
> >>>>>>
> >>>>>> ../target/i386/ops_sse.h: In function =E2=80=98helper_vpermdq_ymm=
=E2=80=99:
> >>>>>> ../target/i386/ops_sse.h:2495:13: error: =E2=80=98r3=E2=80=99 may =
be used
> >>>>>> uninitialized in this function [-Werror=3Dmaybe-uninitialized]
> >>>>>>    2495 |     d->Q(3) =3D r3;
> >>>>>>         |     ~~~~~~~~^~~~
> >>>>>> ../target/i386/ops_sse.h:2494:13: error: =E2=80=98r2=E2=80=99 may =
be used
> >>>>>> uninitialized in this function [-Werror=3Dmaybe-uninitialized]
> >>>>>>    2494 |     d->Q(2) =3D r2;
> >>>>>>         |     ~~~~~~~~^~~~
> >>>>>> ../target/i386/ops_sse.h:2493:13: error: =E2=80=98r1=E2=80=99 may =
be used
> >>>>>> uninitialized in this function [-Werror=3Dmaybe-uninitialized]
> >>>>>>    2493 |     d->Q(1) =3D r1;
> >>>>>>         |     ~~~~~~~~^~~~
> >>>>>> ../target/i386/ops_sse.h:2492:13: error: =E2=80=98r0=E2=80=99 may =
be used
> >>>>>> uninitialized in this function [-Werror=3Dmaybe-uninitialized]
> >>>>>>    2492 |     d->Q(0) =3D r0;
> >>>>>>         |     ~~~~~~~~^~~~
> >>>>>>
> >>>>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> >>>>>> Fixes: 790684776861 ("target/i386: reimplement 0x0f 0x3a, add AVX"=
)
> >>>>>>
> >>>>>> ---
> >>>>>>
> >>>>>> Am I the only one getting this? Or anything wrong in my setup.
>
> Hi Eric,
>
> no, you are not the only one. I regularly build with higher warning
> levels, for example with -Weverything on macOS, and get a much longer
> list which includes the mentioned warnings (see below).
>
> The warnings for ops_sse.h are false positives, so I think no fix is
> needed for 7.2. The compiler is not clever enough to see that the switch
> statements handle all possible cases. It should be sufficient to replace
> `case 3` by `default` to help the compiler and fix the warning. Your fix
> might produce new compiler warnings because setting the variables to 0
> has no effect.

Eric: do you want to try the switch "default" approach for 8.0?

Thanks,
Stefan

