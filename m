Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 484F62F28EE
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 08:32:51 +0100 (CET)
Received: from localhost ([::1]:50408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzEAc-000350-CE
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 02:32:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <remi@remlab.net>)
 id 1kzE7g-000218-1X; Tue, 12 Jan 2021 02:29:49 -0500
Received: from poy.remlab.net ([2001:41d0:2:5a1a::]:54780
 helo=ns207790.ip-94-23-215.eu)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <remi@remlab.net>)
 id 1kzE7e-0004Nf-EP; Tue, 12 Jan 2021 02:29:47 -0500
Received: from basile.remlab.net (dzyqn8ypzhx7l91mxjsvy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:a01a:be01:9434:f69e:d553:3be2])
 (Authenticated sender: remi)
 by ns207790.ip-94-23-215.eu (Postfix) with ESMTPSA id 0D8A75FCEF;
 Tue, 12 Jan 2021 08:29:44 +0100 (CET)
From: =?ISO-8859-1?Q?R=E9mi?= Denis-Courmont <remi.denis.courmont@huawei.com>
To: qemu-arm@nongnu.org
Subject: Re: [PATCH 14/18] target/arm: secure stage 2 translation regime
Date: Tue, 12 Jan 2021 09:29:43 +0200
Message-ID: <5671680.lOV4Wx5bFT@basile.remlab.net>
Organization: Huawei Technologies, Finland
In-Reply-To: <e46f18fc-8add-fea5-f598-c10570e7895c@linaro.org>
References: <3337797.iIbC2pHGDl@basile.remlab.net>
 <20201218103759.19929-14-remi.denis.courmont@huawei.com>
 <e46f18fc-8add-fea5-f598-c10570e7895c@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2001:41d0:2:5a1a::; envelope-from=remi@remlab.net;
 helo=ns207790.ip-94-23-215.eu
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le tiistaina 12. tammikuuta 2021, 2.20.31 EET Richard Henderson a =C3=A9cri=
t :
> On 12/18/20 12:37 AM, remi.denis.courmont@huawei.com wrote:
> > @@ -3586,10 +3586,10 @@ static void ats_write(CPUARMState *env, const
> > ARMCPRegInfo *ri, uint64_t value)>=20
> >              /* fall through */
> >         =20
> >          case 1:
> >              if (ri->crm =3D=3D 9 && (env->uncached_cpsr & CPSR_PAN)) {
> >=20
> > -                mmu_idx =3D (secure ? ARMMMUIdx_SE10_1_PAN
> > +                mmu_idx =3D (secure ? ARMMMUIdx_Stage1_SE1_PAN
> >=20
> >                             : ARMMMUIdx_Stage1_E1_PAN);
> >             =20
> >              } else {
> >=20
> > -                mmu_idx =3D secure ? ARMMMUIdx_SE10_1 :
> > ARMMMUIdx_Stage1_E1;
> > +                mmu_idx =3D secure ? ARMMMUIdx_Stage1_SE1 :
> > ARMMMUIdx_Stage1_E1;
> > >=20
> >              }
> >              break;
>=20
> Was this a bug that we weren't treating SE10 properly vs two-stage lookup=
?=20
> If so, it warrants mentioning in the patch description.

I don't think so. There was no Stage1_SE1 before this patch in the first pl=
ace.

=2D-=20
R=C3=A9mi Denis-Courmont



