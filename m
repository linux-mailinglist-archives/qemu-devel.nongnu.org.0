Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3781C6A194C
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 11:00:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVUrT-0005KO-7Q; Fri, 24 Feb 2023 04:59:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVUrQ-0005Jr-Gw
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 04:59:28 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVUrO-0002GO-Rt
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 04:59:28 -0500
Received: by mail-pj1-x102f.google.com with SMTP id pt11so16538646pjb.1
 for <qemu-devel@nongnu.org>; Fri, 24 Feb 2023 01:59:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gbkSpVjcr4HHY/n2Jtehww2wQSJP+bzIlZmOCB9lhBo=;
 b=rUS3LamlYaBuxvQKYEY3NkakgnKsUWtEoH6CZYDk88B8d+SIY51P33Rn2kaY71+4MB
 zekRMmm0m/kJqXiaJHbD347zFF4WJZY1j33sSFmToHgM9NOGWCxy5aX5OtzwgNqBsrqx
 moc6QXpK+ZGUC5KMFywiAI7NSOPvevbRVmu0Cbhc07N18vgP8AfN0EEswVAvPzAWPZrO
 9JFc6jjPZbdRITFXjLjj5QbS1tG3gxrZdmfis42I4BXOwrR9cHtj6ZvbxLPNnGUpZtOX
 0w7+mJ/3Jmu/kXBpfVHLAbrZGypc+BhnlDEwjNq36xSLfLJbgnTdcN0Gofjcha+E18AS
 VEFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gbkSpVjcr4HHY/n2Jtehww2wQSJP+bzIlZmOCB9lhBo=;
 b=jYnMGi+4PvjY6z85amkABkPNYIUbBmU+gu4D6Fp3jbkekCWKolyk0otNr3Ehr8DGIe
 1CEjnP3x3JCn7Yg30v6VEPkbAeS+sMaTAEbIZb9YIP+2zpE3KVsYQh0D5yi/Y1z1xOzA
 DL4pT+Edst6SgtREwKQVNTEqf8vcVHS/iPwJh+BhP6tNZV1JAzS15/feRLBfzqSOMooI
 1mqg9CB9zM47MWVAIsTkbamNgyisMOzFac4zCpiLZOddgstCnkcsIxj6kDWK0awwT3Aw
 fO9hRlG4y6kz40HTWQUQ/JXaGo4L0YvTFwnwS2BYx3uaohZyDhSM0yC0Wgucq94KTXEA
 P2sw==
X-Gm-Message-State: AO0yUKVu2HsLM6V5TnmMjEwTKmrzn6M2gDFAIhdSYkZyiWd+9oPt4Ng/
 SuuBojVgOizVkJDOvYIE4ksfxV9hlthgb5d9QcmI4g==
X-Google-Smtp-Source: AK7set+onb5RXYdCd/30wQAQZqev7dX6FGbgM0uV6WI3UWrBqqdka7T65eQ5ej338wPnqT9sR16OCplbyNa6YFQjcl0=
X-Received: by 2002:a17:903:1313:b0:19a:b151:eb83 with SMTP id
 iy19-20020a170903131300b0019ab151eb83mr2708730plb.13.1677232765202; Fri, 24
 Feb 2023 01:59:25 -0800 (PST)
MIME-Version: 1.0
References: <20230222110104.3996971-1-alex.bennee@linaro.org>
 <dddae7d3-4c18-04d3-198b-803b4c128de1@linaro.org>
In-Reply-To: <dddae7d3-4c18-04d3-198b-803b4c128de1@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Feb 2023 09:59:13 +0000
Message-ID: <CAFEAcA8sxm7-TN89onqEaD5kpH5yoe5mTR-RPebqn64Frgj+-A@mail.gmail.com>
Subject: Re: [RFC PATCH] target/arm: properly document FEAT_CRC32
To: Richard Henderson <richard.henderson@linaro.org>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102f.google.com
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

On Thu, 23 Feb 2023 at 23:01, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 2/22/23 01:01, Alex Benn=C3=A9e wrote:
> > This is a mandatory feature for Armv8.1 architectures but we don't
> > state the feature clearly in our emulation list. While checking verify
> > our cortex-a76 model matches up with the current TRM by breaking out
> > the long form isar into a more modern readable FIELD_DP code.
> >
> > Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> > ---
> >   docs/system/arm/emulation.rst |  1 +
> >   target/arm/cpu64.c            | 29 ++++++++++++++++++++++++++---
> >   target/arm/cpu_tcg.c          |  2 +-
> >   3 files changed, 28 insertions(+), 4 deletions(-)
> >
> > diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.=
rst
> > index 2062d71261..2c4fde5eef 100644
> > --- a/docs/system/arm/emulation.rst
> > +++ b/docs/system/arm/emulation.rst
> > @@ -14,6 +14,7 @@ the following architecture extensions:
> >   - FEAT_BBM at level 2 (Translation table break-before-make levels)
> >   - FEAT_BF16 (AArch64 BFloat16 instructions)
> >   - FEAT_BTI (Branch Target Identification)
> > +- FEAT_CRC32 (CRC32 instruction)
> >   - FEAT_CSV2 (Cache speculation variant 2)
> >   - FEAT_CSV2_1p1 (Cache speculation variant 2, version 1.1)
> >   - FEAT_CSV2_1p2 (Cache speculation variant 2, version 1.2)
> > diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> > index 4066950da1..12e1a532ab 100644
> > --- a/target/arm/cpu64.c
> > +++ b/target/arm/cpu64.c
> > @@ -912,6 +912,8 @@ static void aarch64_a72_initfn(Object *obj)
> >   static void aarch64_a76_initfn(Object *obj)
> >   {
> >       ARMCPU *cpu =3D ARM_CPU(obj);
> > +    uint64_t t;
> > +    uint32_t u;
> >
> >       cpu->dtb_compatible =3D "arm,cortex-a76";
> >       set_feature(&cpu->env, ARM_FEATURE_V8);
> > @@ -928,7 +930,18 @@ static void aarch64_a76_initfn(Object *obj)
> >       cpu->ctr =3D 0x8444C004;
> >       cpu->dcz_blocksize =3D 4;
> >       cpu->isar.id_aa64dfr0  =3D 0x0000000010305408ull;
> > -    cpu->isar.id_aa64isar0 =3D 0x0000100010211120ull;
> > +
> > +    /* per r4p1 of the Cryptographic Extension TRM */
> > +    t =3D cpu->isar.id_aa64isar0;
> > +    t =3D FIELD_DP64(t, ID_AA64ISAR0, AES, 2);      /* FEAT_PMULL */
> > +    t =3D FIELD_DP64(t, ID_AA64ISAR0, SHA1, 1);     /* FEAT_SHA1 */
> > +    t =3D FIELD_DP64(t, ID_AA64ISAR0, SHA2, 1);     /* FEAT_SHA512 */
> > +    t =3D FIELD_DP64(t, ID_AA64ISAR0, CRC32, 1);    /* FEAT_CRC32 */
> > +    t =3D FIELD_DP64(t, ID_AA64ISAR0, ATOMIC, 2);   /* FEAT_LSE */
> > +    t =3D FIELD_DP64(t, ID_AA64ISAR0, RDM, 1);      /* FEAT_RDM */
> > +    t =3D FIELD_DP64(t, ID_AA64ISAR0, DP, 1);       /* FEAT_DotProd */
> > +    cpu->isar.id_aa64isar0 =3D t;
>
> Ok, so, this might be helpful for grepping, but it's not helpful for read=
ing the
> documentation, which on page B2-137 uses hex.

Agreed -- we write these functions and review them by looking
at the TRMs, and the TRMs specify the values of the ID registers
as straight hex values.

thanks
-- PMM

