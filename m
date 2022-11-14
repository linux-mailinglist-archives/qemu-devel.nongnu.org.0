Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD007628DBB
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 00:53:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouiot-00011X-4N; Mon, 14 Nov 2022 18:24:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ouig2-000389-9l
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:15:43 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ouWMH-0002Cu-1j
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 05:06:30 -0500
Received: by mail-pj1-x102e.google.com with SMTP id
 c15-20020a17090a1d0f00b0021365864446so10143227pjd.4
 for <qemu-devel@nongnu.org>; Mon, 14 Nov 2022 02:06:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LbXul+PU6pL42Fsl6Wyc78F8fuex80+WE1jwHDJ7FzE=;
 b=Dpryn6k2jDcveKKccFLX0XGqb680Rnrn5CTRbe6BFixECtQJH4X7ZP7pcWuriRulKN
 441EVhrowSuu3zoeo97LvpqZnzH5K//cdXIml9m8gGmXJpUi5vdb/dXVwa69maY8FSxx
 Mv/2If0vX+HR6o8JD/7U+CViXP+j7Hee+0bUBgBYJZxJvi9Rit/rBSHFQFHsbzyuuzBK
 gxxU+0FNhxSIUysno31K0MIRwu8RBoW/lY12WKkN3bmiLdKMq5PqN2utuEBS+w1PA2bm
 Lx0zRDt1vPEvJB/nknMSkWo3oYQk2WvqNaTfYhZ2l3KFbEsnU0Skgi8NBpQ+6f9i0NjU
 mUrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LbXul+PU6pL42Fsl6Wyc78F8fuex80+WE1jwHDJ7FzE=;
 b=7IG2t5qvLfffBukJvixAIHtxaArJgzfQb34c62QwyaNu6PGDhRi+cxTxa6llHcs60k
 /lm72s1C2FoRVtSJOX5rsS+Zj2JJr7wTctdxDapszy0UKsT73VZDO/BmeWI6xz0pazHJ
 QXNIDQ3l/DvK+xY1C0Iwnrcm1HSuh67lfIr0lG0JrcjICJz/0/j5GITRMrBVAGk6KTPg
 Gf3RZA1OoftJc5Jixl5e2/Ztb+6+eVeXmVlh+C725dUZltkkUEMfUKCDQPJ7fYhFjciV
 8CK6VZr8AvEPUR8lIdrbsnYFLA/NBACoekjXiQiA3zD9QDH3KWtnoAw6YHPEPnYhiN0a
 +TuA==
X-Gm-Message-State: ANoB5pl/VMLjomSGoBO+LcpZmmgpSIf9L+mF8UrLzNiDOYTuibGoMI5K
 eu2xLSSwwpIVYInh9wOgZckq485hTh6UVrBI4r0qmw==
X-Google-Smtp-Source: AA0mqf75OQPz2QigGhbWoizk6AC6Kovo2+MqMuwXeQgpLu68JGiWr2yZ84gAdgPUdctJEt+VTVGYb8IseWFZuFRYbwI=
X-Received: by 2002:a17:902:c702:b0:186:9295:2012 with SMTP id
 p2-20020a170902c70200b0018692952012mr12808805plp.19.1668420386964; Mon, 14
 Nov 2022 02:06:26 -0800 (PST)
MIME-Version: 1.0
References: <20220927141504.3886314-1-alex.bennee@linaro.org>
 <20220927141504.3886314-2-alex.bennee@linaro.org>
 <769e0e8a-7787-b02b-9e26-87eca955666b@linaro.org>
 <CAFEAcA-0zoNS0nWrYu6hM1=8tG4i4GkjHLL2v4OMmJv5GaDAMg@mail.gmail.com>
 <87r0znlnmm.fsf@linaro.org>
 <CAFEAcA8Ft_YAC2TRCSErUJxY8_kZOQdF7Qa6oM6VF2RpAeHrBA@mail.gmail.com>
 <b1a845ca-0972-1800-0c58-03f68d0c94a0@linaro.org>
 <CAFEAcA-jvg4t1O-wE+19rJgzdiSZqF+X-XmEDLnrJYZCo233Sw@mail.gmail.com>
 <cb28a138-a82d-0604-a8cf-b302493ff286@linaro.org>
In-Reply-To: <cb28a138-a82d-0604-a8cf-b302493ff286@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 14 Nov 2022 10:06:15 +0000
Message-ID: <CAFEAcA-Rwuh9s0EoD-B7zgQPhcgZqBOmgK46S-Vd=vRYE1a1Bg@mail.gmail.com>
Subject: Re: [PATCH v3 01/15] hw: encode accessing CPU index in MemTxAttrs
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Peter Xu <peterx@redhat.com>, Jason Wang <jasowang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Fri, 11 Nov 2022 at 13:23, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> On 31/10/22 14:03, Peter Maydell wrote:
> > On Mon, 31 Oct 2022 at 12:08, Philippe Mathieu-Daud=C3=A9 <philmd@linar=
o.org> wrote:
> >>
> >> On 4/10/22 16:54, Peter Maydell wrote:
> >>> On Tue, 4 Oct 2022 at 14:33, Alex Benn=C3=A9e <alex.bennee@linaro.org=
> wrote:
> >>>>
> >>>>
> >>>> Peter Maydell <peter.maydell@linaro.org> writes:
> >>>>> The MSC is in the address map like most other stuff, and thus there=
 is
> >>>>> no restriction on whether it can be accessed by other things than C=
PUs
> >>>>> (DMAing to it would be silly but is perfectly possible).
> >>>>>
> >>>>> The intent of the code is "pass this transaction through, but force
> >>>>> it to be Secure/NonSecure regardless of what it was before". That
> >>>>> should not involve a change of the requester type.
> >>>>
> >>>> Should we assert (or warn) when the requester_type is unspecified?
> >>>
> >>> Not in the design of MemTxAttrs that's currently in git, no:
> >>> in that design it's perfectly fine for something generating
> >>> memory transactions to use MEMTXATTRS_UNSPECIFIED (which defaults
> >>> to meaning a bunch of things including "not secure").
> >>
> >> In tz_mpc_handle_block():
> >>
> >> static MemTxResult tz_mpc_handle_block(TZMPC *s, hwaddr addr, MemTxAtt=
rs
> >> attrs)
> >> {
> >>       /* Handle a blocked transaction: raise IRQ, capture info, etc */
> >>       if (!s->int_stat) {
> >>
> >>           s->int_info1 =3D addr;
> >>           s->int_info2 =3D 0;
> >>           s->int_info2 =3D FIELD_DP32(s->int_info2, INT_INFO2, HMASTER=
,
> >>                                     attrs.requester_id & 0xffff);
> >>           s->int_info2 =3D FIELD_DP32(s->int_info2, INT_INFO2, HNONSEC=
,
> >>                                     ~attrs.secure);
> >>           s->int_info2 =3D FIELD_DP32(s->int_info2, INT_INFO2, CFG_NS,
> >>                                     tz_mpc_cfg_ns(s, addr));
> >>
> >>
> >> Should we check whether the requester is MTRT_CPU?
> >
> > That code is basically assuming that the requester_id is the AMBA AHB
> > 'HMASTER' field (i.e. something hopefully unique to all things that
> > send out transactions, not necessarily limited only to CPUs), which is =
a
> > somewhat bogus assumption given that it isn't currently any such thing.=
..
> >
> > I'm not sure if/how this patchset plans to model generic "ID of transac=
tion
> > generator".
>
> Does your 'generic "ID of transaction generator"' fit into MTRT_MACHINE
> described as "for more complex encoding":
>
>    'MACHINE indicates a machine specific encoding which needs further
>     processing to decode into its constituent parts.'
>
> ?

Not really, because "generic ID of a transaction generator" is a
superset of "ID per CPU", not something separate that sits
alongside it...

-- PMM

