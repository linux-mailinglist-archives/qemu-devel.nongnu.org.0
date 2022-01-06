Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F304864E9
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 14:07:26 +0100 (CET)
Received: from localhost ([::1]:38716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5SUG-0004H1-Df
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 08:07:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1n5SPP-0002UO-9H
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 08:02:23 -0500
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:27119)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1n5SPM-0001cL-DL
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 08:02:22 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-117-ewq8aOBMPRiF0ZrxstTuag-1; Thu, 06 Jan 2022 08:02:08 -0500
X-MC-Unique: ewq8aOBMPRiF0ZrxstTuag-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8B2E9835E26;
 Thu,  6 Jan 2022 13:02:04 +0000 (UTC)
Received: from bahia (unknown [10.39.192.98])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8F1F97E653;
 Thu,  6 Jan 2022 13:02:02 +0000 (UTC)
Date: Thu, 6 Jan 2022 14:02:01 +0100
From: Greg Kurz <groug@kaod.org>
To: =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>
Subject: Re: [RFC PATCH] target/ppc: Remove xscmpnedp instruction
Message-ID: <20220106140201.5237cb05@bahia>
In-Reply-To: <722ded34-a09a-b94a-3182-64686ad0150c@kaod.org>
References: <20220106112318.13864-1-victor.colombo@eldorado.org.br>
 <722ded34-a09a-b94a-3182-64686ad0150c@kaod.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=207.211.30.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: danielhb413@gmail.com, qemu-devel@nongnu.org,
 =?UTF-8?B?VsOtY3Rvcg==?= Colombo <victor.colombo@eldorado.org.br>,
 qemu-ppc@nongnu.org, matheus.ferst@eldorado.org.br,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 6 Jan 2022 13:21:46 +0100
C=C3=A9dric Le Goater <clg@kaod.org> wrote:

> On 1/6/22 12:23, V=C3=ADctor Colombo wrote:
> > xscmpnedp was added in ISA v3.0 but removed in v3.0B. This patch
> > removes this instruction as it was not in the final version of v3.0.
> >=20
> > RFC to know if you think this is the correct approach.
>=20
> Usually we deprecate a feature for a minimum of two releases before
> removing it. It might be overkill for this case since the P9 processor
> implementation is based on v3.0B.
>=20
> I would simply remove the instruction since it never existed on any
> supported HW. I will wait for some more feedback.
>=20

I don't think it makes sense to keep this instruction if it only
existed in pre-GA HW.

Acked-by: Greg Kurz <groug@kaod.org>

> Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
>=20
> Thanks,
>=20
> C.
>=20
>=20
> > Signed-off-by: V=C3=ADctor Colombo <victor.colombo@eldorado.org.br>
> > ---
> >   target/ppc/fpu_helper.c             | 1 -
> >   target/ppc/helper.h                 | 1 -
> >   target/ppc/translate/vsx-impl.c.inc | 1 -
> >   target/ppc/translate/vsx-ops.c.inc  | 1 -
> >   4 files changed, 4 deletions(-)
> >=20
> > diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
> > index e5c29b53b8..f030858cf9 100644
> > --- a/target/ppc/fpu_helper.c
> > +++ b/target/ppc/fpu_helper.c
> > @@ -2270,7 +2270,6 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt,=
                             \
> >   VSX_SCALAR_CMP_DP(xscmpeqdp, eq, 1, 0)
> >   VSX_SCALAR_CMP_DP(xscmpgedp, le, 1, 1)
> >   VSX_SCALAR_CMP_DP(xscmpgtdp, lt, 1, 1)
> > -VSX_SCALAR_CMP_DP(xscmpnedp, eq, 0, 0)
> >  =20
> >   void helper_xscmpexpdp(CPUPPCState *env, uint32_t opcode,
> >                          ppc_vsr_t *xa, ppc_vsr_t *xb)
> > diff --git a/target/ppc/helper.h b/target/ppc/helper.h
> > index f9c72dcd50..8f02cabaf5 100644
> > --- a/target/ppc/helper.h
> > +++ b/target/ppc/helper.h
> > @@ -400,7 +400,6 @@ DEF_HELPER_5(xsnmsubdp, void, env, vsr, vsr, vsr, v=
sr)
> >   DEF_HELPER_4(xscmpeqdp, void, env, vsr, vsr, vsr)
> >   DEF_HELPER_4(xscmpgtdp, void, env, vsr, vsr, vsr)
> >   DEF_HELPER_4(xscmpgedp, void, env, vsr, vsr, vsr)
> > -DEF_HELPER_4(xscmpnedp, void, env, vsr, vsr, vsr)
> >   DEF_HELPER_4(xscmpexpdp, void, env, i32, vsr, vsr)
> >   DEF_HELPER_4(xscmpexpqp, void, env, i32, vsr, vsr)
> >   DEF_HELPER_4(xscmpodp, void, env, i32, vsr, vsr)
> > diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate=
/vsx-impl.c.inc
> > index c08185e857..fbef496257 100644
> > --- a/target/ppc/translate/vsx-impl.c.inc
> > +++ b/target/ppc/translate/vsx-impl.c.inc
> > @@ -1092,7 +1092,6 @@ GEN_VSX_HELPER_X1(xstsqrtdp, 0x14, 0x06, 0, PPC2_=
VSX)
> >   GEN_VSX_HELPER_X3(xscmpeqdp, 0x0C, 0x00, 0, PPC2_ISA300)
> >   GEN_VSX_HELPER_X3(xscmpgtdp, 0x0C, 0x01, 0, PPC2_ISA300)
> >   GEN_VSX_HELPER_X3(xscmpgedp, 0x0C, 0x02, 0, PPC2_ISA300)
> > -GEN_VSX_HELPER_X3(xscmpnedp, 0x0C, 0x03, 0, PPC2_ISA300)
> >   GEN_VSX_HELPER_X2_AB(xscmpexpdp, 0x0C, 0x07, 0, PPC2_ISA300)
> >   GEN_VSX_HELPER_R2_AB(xscmpexpqp, 0x04, 0x05, 0, PPC2_ISA300)
> >   GEN_VSX_HELPER_X2_AB(xscmpodp, 0x0C, 0x05, 0, PPC2_VSX)
> > diff --git a/target/ppc/translate/vsx-ops.c.inc b/target/ppc/translate/=
vsx-ops.c.inc
> > index c974324c4c..67fa7b2e41 100644
> > --- a/target/ppc/translate/vsx-ops.c.inc
> > +++ b/target/ppc/translate/vsx-ops.c.inc
> > @@ -197,7 +197,6 @@ GEN_XX3FORM_NAME(xsnmsubdp, "xsnmsubmdp", 0x04, 0x1=
7, PPC2_VSX),
> >   GEN_XX3FORM(xscmpeqdp, 0x0C, 0x00, PPC2_ISA300),
> >   GEN_XX3FORM(xscmpgtdp, 0x0C, 0x01, PPC2_ISA300),
> >   GEN_XX3FORM(xscmpgedp, 0x0C, 0x02, PPC2_ISA300),
> > -GEN_XX3FORM(xscmpnedp, 0x0C, 0x03, PPC2_ISA300),
> >   GEN_XX3FORM(xscmpexpdp, 0x0C, 0x07, PPC2_ISA300),
> >   GEN_VSX_XFORM_300(xscmpexpqp, 0x04, 0x05, 0x00600001),
> >   GEN_XX2IFORM(xscmpodp,  0x0C, 0x05, PPC2_VSX),
> >=20
>=20


