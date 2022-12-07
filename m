Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1675645C1F
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Dec 2022 15:10:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2v7D-0007fS-6d; Wed, 07 Dec 2022 09:09:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1p2v7A-0007ep-OV
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 09:09:36 -0500
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1p2v79-00037F-4x
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 09:09:36 -0500
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-3704852322fso187122907b3.8
 for <qemu-devel@nongnu.org>; Wed, 07 Dec 2022 06:09:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u/qbLOFfFAhTx7eCj5aNiAi67f9r4/jU5fD3kszg+ZA=;
 b=Epzwg2eMTcHBRY4Xgmy8A2ZCTGVRGAe082kPPdS9OQjlAMx4jBJGh8ppSzH7QSYgQw
 9I9E1dcAmjtb7lBhi4PHSOe2Smd8FF7FTe0W+u7fh/86Ga7aJa0njVpb8mrfI2HrioR7
 V/9eCDooRWkSavVFMyD6Nn1L8VaNaPN2NEFEVjiwGTtaXvQnGYPnVuXN/HVfzujOyYIS
 /W0hNgEyhD0F4TaAx/NxrClGlxhsSlxZ3yOYgJ9reCBbkQIY7vh5OrgseLfD8YdCDeKO
 AlxRLkro8Ny+z6UKGJG56hBK18IA/AU8MIQkrTxu7Y8SeQViIUu4GYyZInRnGRWAC0nJ
 qsgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u/qbLOFfFAhTx7eCj5aNiAi67f9r4/jU5fD3kszg+ZA=;
 b=MZSIhZjiE9Ko7qFjgnhtrb4el7u9O6UCW8qcK/IZoylim7DOOmyk5Kz82bwIHfl3rn
 UpSKP2biIjyJe+9c5REeu3YIqchgk3k70GTspKE5Gh/HtiGHh+3opj3/eX0iMCxhzr6H
 6e3521hoVxc8Y23A2TqRTjBE8oC5U/PKtmjiL4FvS0iNrsQKhtiKBX3gfd2loGkNdeJf
 IZgd1RViHh65xFfccBACddB4Mp55nIBeuee3JAO7gWh/ldMf6Nt1CknvjOkhjwuxgMFp
 iTYOx/hTvzKhoEzsTFDoNytGnEbYw036vV8aMP8JOJ234vfxQ//HnYSosM14ttEzBdLG
 n9ew==
X-Gm-Message-State: ANoB5pmIjZGchMms1IBn5fXO8clllpRMFyApKQAETjeiasHldr+X27nW
 mFxfPr0i3zHA/aHCVjyvQtJrVEBolwxUorcfDCk=
X-Google-Smtp-Source: AA0mqf4PuZ/t/piunp6jcaGks1S7rzcVSPG2oKa+y+NDh/6yVlekwuR0WbtDl4w6qnTVfUEH53SLIf7Ns93IGlWIPpg=
X-Received: by 2002:a0d:d4c3:0:b0:3c1:a858:cf2f with SMTP id
 w186-20020a0dd4c3000000b003c1a858cf2fmr46672080ywd.336.1670422173732; Wed, 07
 Dec 2022 06:09:33 -0800 (PST)
MIME-Version: 1.0
References: <20221207132439.635402-1-eric.auger@redhat.com>
 <f8a36758-cff2-3df3-3e30-083175e47131@redhat.com>
In-Reply-To: <f8a36758-cff2-3df3-3e30-083175e47131@redhat.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Wed, 7 Dec 2022 09:09:21 -0500
Message-ID: <CAJSP0QXo0p5E_G9rqLO0wqC=NDQzMhoJOJDb0ShV+7OetFMMbg@mail.gmail.com>
Subject: Re: [PATCH for 7.2?] target/i386: Remove compilation errors when
 -Werror=maybe-uninitialized
To: eric.auger@redhat.com
Cc: eric.auger.pro@gmail.com, pbonzini@redhat.com, 
 richard.henderson@linaro.org, paul@nowt.org, qemu-devel@nongnu.org, 
 peter.maydell@linaro.org, Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1129;
 envelope-from=stefanha@gmail.com; helo=mail-yw1-x1129.google.com
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

On Wed, 7 Dec 2022 at 08:31, Eric Auger <eric.auger@redhat.com> wrote:
> On 12/7/22 14:24, Eric Auger wrote:
> > Initialize r0-3 to avoid compilation errors when
> > -Werror=3Dmaybe-uninitialized is used
> >
> > ../target/i386/ops_sse.h: In function =E2=80=98helper_vpermdq_ymm=E2=80=
=99:
> > ../target/i386/ops_sse.h:2495:13: error: =E2=80=98r3=E2=80=99 may be us=
ed uninitialized in this function [-Werror=3Dmaybe-uninitialized]
> >  2495 |     d->Q(3) =3D r3;
> >       |     ~~~~~~~~^~~~
> > ../target/i386/ops_sse.h:2494:13: error: =E2=80=98r2=E2=80=99 may be us=
ed uninitialized in this function [-Werror=3Dmaybe-uninitialized]
> >  2494 |     d->Q(2) =3D r2;
> >       |     ~~~~~~~~^~~~
> > ../target/i386/ops_sse.h:2493:13: error: =E2=80=98r1=E2=80=99 may be us=
ed uninitialized in this function [-Werror=3Dmaybe-uninitialized]
> >  2493 |     d->Q(1) =3D r1;
> >       |     ~~~~~~~~^~~~
> > ../target/i386/ops_sse.h:2492:13: error: =E2=80=98r0=E2=80=99 may be us=
ed uninitialized in this function [-Werror=3Dmaybe-uninitialized]
> >  2492 |     d->Q(0) =3D r0;
> >       |     ~~~~~~~~^~~~
> >
> > Signed-off-by: Eric Auger <eric.auger@redhat.com>
> > Fixes: 790684776861 ("target/i386: reimplement 0x0f 0x3a, add AVX")
> >
> > ---
> >
> > Am I the only one getting this? Or anything wrong in my setup.
>
> With Stefan's correct address. Forgive me for the noise.

When is -Wmaybe-uninitialized used? QEMU's build system doesn't set
it. Unless it's automatically set by meson this must be a manual
--extra-cflags=3D option you set.

If you added it manually then let's fix this in 8.0 since it's not
tested/supported and very few people will see this issue.

Stefan

