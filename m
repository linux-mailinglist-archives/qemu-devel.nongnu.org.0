Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C71492500
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 12:35:24 +0100 (CET)
Received: from localhost ([::1]:41152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9mln-0002uM-DT
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 06:35:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n9ma5-0000WG-5u
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 06:23:17 -0500
Received: from [2a00:1450:4864:20::334] (port=51110
 helo=mail-wm1-x334.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n9ma2-0007tQ-Da
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 06:23:16 -0500
Received: by mail-wm1-x334.google.com with SMTP id w26so26914523wmi.0
 for <qemu-devel@nongnu.org>; Tue, 18 Jan 2022 03:23:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=zMaScuEshPAHSAQHFUt8xVrt9iJqUlMPBe4eNxy5qmQ=;
 b=BNHKeDX1ECUev5prUAINF8FdouDv5F914/XiZdFP3Ibzd/2MaxpfDSdMLHqud6BNpv
 3HlI9NhxgOZV1Y2/SSSIz5x1W5J5q25HfqMgjZpRFIgMgVtRku3P1zjpkwMnI5NZghZM
 AvgHgkHa8C8h4NjGfIuQwXeMRGuI5UA3ILHsXviDQeieTO9nWvuM1+fjASTN7u3hIDf1
 MnfjdLuvd+7yMUh70dOfFVrPEpwn9+s7fQjE0dR1GNtegMjxGO3VODwRShsSED9UBArh
 HfDiWX3Zg05pqwRyOdVP+KMXtqQllKqfC+2O6gBYGqIgwkXxNc4cTWv8KiKMY090ppbD
 Ma8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=zMaScuEshPAHSAQHFUt8xVrt9iJqUlMPBe4eNxy5qmQ=;
 b=HSYUKR902/7W3+FNs7iJkQF6sfja9fMMq2HSqohyfCA+Q0HL8TCu/57yoedqD5oufs
 Vtqm8aytkAYMwSPFQpRnnJS09CdMMc6lB1+MaHgy00xcgncM3fn+0uxAP3NYEGJJiCeP
 K27sjIfFnOiAuvW7GJGYi+OkeoBTFRM7j6av8yLhW1numTe4gOxWtW5dbukBJ+n9VfvX
 yJ0ncbjXRvfvDw6qstiV8hlKWlNP510p+Lkyc8i072NS3kzpO0XN9Z6FOPlZHWxmvVks
 7Rr445vcX6wmAB8eOUmC/RRQt0C/0QszxgZnm1Jr8eJqZ1JFq1VCuTukTg5oETLaCRxO
 qG9Q==
X-Gm-Message-State: AOAM5324c1bZeuCw8+XYGce+W5xH6PUR4KiHwqRRYdjvDLi9aUm5Ug2o
 U7a3KIPpbcIULm1p7XDVqPyK2W+b4g386WApruO5fg==
X-Google-Smtp-Source: ABdhPJw2vP4qyxcxUoWEm442SMXVKe57wuj5zzwlc+oSlrVIpaHw9wEdSBFbdEUQeDGl5FSIt+aRhrwdV0VTS7ViBMQ=
X-Received: by 2002:adf:e907:: with SMTP id f7mr23705311wrm.319.1642504992816; 
 Tue, 18 Jan 2022 03:23:12 -0800 (PST)
MIME-Version: 1.0
References: <20220118104150.1899661-1-clg@kaod.org>
 <20220118104150.1899661-2-clg@kaod.org>
 <c9e94bfc-a648-7f3d-fefb-73ecdeb3c54e@eldorado.org.br>
In-Reply-To: <c9e94bfc-a648-7f3d-fefb-73ecdeb3c54e@eldorado.org.br>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 18 Jan 2022 11:23:01 +0000
Message-ID: <CAFEAcA8LKXAC=KNOt5Tc92yhiEJgef1aW2yHLg4HnpOTmgDwpQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] target/ppc: Remove last user of .load_state_old
To: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::334
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Greg Kurz <groug@kaod.org>, David Gibson <david@gibson.dropbear.id.au>,
 qemu-ppc@nongnu.org, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 18 Jan 2022 at 11:18, Matheus K. Ferst
<matheus.ferst@eldorado.org.br> wrote:
>
> On 18/01/2022 07:41, C=C3=A9dric Le Goater wrote:
> > This breaks migration compatibility from (very) old versions of
> > QEMU. This should not be a problem for the pseries machine for which
> > migration is only supported on recent QEMUs ( > 2.x). There is no
> > clear status on what is supported or not for the other machines. Let's
> > move forward and remove the .load_state_old handler.
> >
> > Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> > ---
> >   target/ppc/machine.c | 112 ------------------------------------------=
-
> >   1 file changed, 112 deletions(-)
> >
> > diff --git a/target/ppc/machine.c b/target/ppc/machine.c
> > index 756d8de5d8dd..df547385ff1e 100644
> > --- a/target/ppc/machine.c
> > +++ b/target/ppc/machine.c
> > @@ -23,117 +23,6 @@ static void post_load_update_msr(CPUPPCState *env)
> >       pmu_update_summaries(env);
> >   }
> >
> > -static int cpu_load_old(QEMUFile *f, void *opaque, int version_id)
> > -{
> > -    PowerPCCPU *cpu =3D opaque;
>
> <snip>
>
> > -
> >   static int get_avr(QEMUFile *f, void *pv, size_t size,
> >                      const VMStateField *field)
> >   {
> > @@ -808,7 +697,6 @@ const VMStateDescription vmstate_ppc_cpu =3D {
> >       .version_id =3D 5,
> >       .minimum_version_id =3D 5,
> >       .minimum_version_id_old =3D 4,
> > -    .load_state_old =3D cpu_load_old,
>
> According to docs/devel/migration.rst, .minimum_version_id_old is
> ignored if no load_state_old handler is provided, I think we can drop it
> too.

Yes; the migration code only checks the field if load_state_old is non-NULL=
.

-- PMM

