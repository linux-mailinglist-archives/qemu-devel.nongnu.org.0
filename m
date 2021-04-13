Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 352A735DF85
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 14:56:54 +0200 (CEST)
Received: from localhost ([::1]:55194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWIb7-00060M-74
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 08:56:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lWIT2-0001tR-0C; Tue, 13 Apr 2021 08:48:35 -0400
Received: from mail-eopbgr760113.outbound.protection.outlook.com
 ([40.107.76.113]:59118 helo=NAM02-CY1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lWISx-00022f-LT; Tue, 13 Apr 2021 08:48:31 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DRHJBDhovuXrzMRmh+vTxd67/qQHK2gs7dEM4cfvJMvqr40AOK5UqhFD0XGL2gw6VQMDXY78+Mj9GOtpP1hNTeSnNfWuZgxzjZ5LHJZPbLmrdVTacKKIiF2F29VOl6+CDFvVVJWOWWSU0YKMrxuGgf1FABOJgHIkmM7Hrzpdn9/sp4s0HS5uoC7n2IswXuXCrHu4/asZBJPUEJDvPOPK8xPMI+Xvn6HteGlzZN+sDNfPwrWFWydHUlNWyHTa62IfQfTgUshusZj1ku0lK0VR1S4m0+s4JzQHX07bBNAhFVUUrO8FhvMd+DxS5E7hlpIrTANnIhPPqEdeid8BWOVN3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OdYBFnb7UhhULRtWPpKj9JgyE+DVr0Yr9M3QM7zS7iw=;
 b=gniPYrGCqyECU47ldKsZ9VTb9v8a/oiKAwFF8W7LXMLd201Vgfil0D0aKBr2n8MjUFigyEYwk910XoVQNbGJtKRRVUqxKKqYnTMLwEMWxn4BwFcRQT8t+beBGq/1X9AYQowT8B9+XUVLM1+JUy2WsPVJdj7VT19d9ffSv8+jvFgWvJ2NhSoc+gYPDjU9L5i4LNIeqeXRYTK8IauUWjB3JSKqEJtR5Rq4GAcK0XKXUPPXZKM62+54Vi6LRhA4f0MmBVeyKJg7HYxC8C0zAuXpvScjubs0EdrOfNdgsOiCBCimufXjGaGrAXvQ0rPrAUSQMxo6+9sXrakX681xTPUefQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OdYBFnb7UhhULRtWPpKj9JgyE+DVr0Yr9M3QM7zS7iw=;
 b=b+D8YYvDPE2D2QZaHOcUJfajWBmGN5/DRTuDkRoInfVfDSTdN2YP1ws5sG5N3e25mA15uQDWBptaaI1OG4LJncgI6snCWl1qA6Q7+0a5VPoZAaRDIMRYfA0BBR9jbiTmmV2lTX0ipUYW58FVHiPLHh1LJf+S6D1IjzdGSHs24Km9pgzRX1mZ+lqlrZyZMlzmOX4B5fS+UrW+TyCUjPOUn9p3/r3hAtDI3be6cud38O2FASnuv19wbqxLBnQVsldV4tCqhGSB1zd1hDPpX0RIz1TK/kZUnbmK3p2N9GFwMc4a6SU18ZHrYwMgxug4RynwyQD/feV3GS5Uagws1Td6VQ==
Received: from CP2PR80MB4499.lamprd80.prod.outlook.com (2603:10d6:102:45::19)
 by CP2PR80MB4499.lamprd80.prod.outlook.com (2603:10d6:102:45::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.21; Tue, 13 Apr
 2021 12:48:20 +0000
Received: from CP2PR80MB4499.lamprd80.prod.outlook.com
 ([fe80::8c79:76c:3d1f:d59b]) by CP2PR80MB4499.lamprd80.prod.outlook.com
 ([fe80::8c79:76c:3d1f:d59b%7]) with mapi id 15.20.4020.022; Tue, 13 Apr 2021
 12:48:20 +0000
From: Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>
To: Fabiano Rosas <farosas@linux.ibm.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH] target/ppc: code motion from translate_init.c.inc to
 gdbstub.c
Thread-Topic: [PATCH] target/ppc: code motion from translate_init.c.inc to
 gdbstub.c
Thread-Index: AQHXL87Q1qYzseuE/ESlT6Ur8vWLkqqxXiqAgAD7YrY=
Date: Tue, 13 Apr 2021 12:48:20 +0000
Message-ID: <CP2PR80MB4499015423A3D0B49610C929C74F9@CP2PR80MB4499.lamprd80.prod.outlook.com>
References: <20210412190442.114467-1-bruno.larsen@eldorado.org.br>,
 <874kgb5ibs.fsf@linux.ibm.com>
In-Reply-To: <874kgb5ibs.fsf@linux.ibm.com>
Accept-Language: pt-BR, en-US
Content-Language: pt-BR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux.ibm.com; dkim=none (message not signed)
 header.d=none;linux.ibm.com; dmarc=none action=none
 header.from=eldorado.org.br;
x-originating-ip: [2804:14c:482:7ed1:f76e:bbb3:9eaa:b6e3]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cd2d22fc-4477-4552-d8f9-08d8fe7a6af5
x-ms-traffictypediagnostic: CP2PR80MB4499:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CP2PR80MB449979173F9BA867ED196460C74F9@CP2PR80MB4499.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QCfe74DLifjlOi2KhkwcCjmw9LR5PeGk/gWUYrgyB+itf+vXp7uT76T1Y5AFJKvAuZIlDe5ZBcSw7fgzwXPttB6Uv4hOEyhrShQ+0ipOcaAP57sY7158s2AzkDMA9IO0Sw42y7uv0ism6gMdT87vt9nTkz8SZW7UM3Y7K9/0iXKL5Zlrbmly4e8Wf217U0XzKuetPFwrARtCnFMeMbPRVsb/uxnhWz8NS/G9SRw40hnKqMCLcPmsXsGh5pmYKYE5MGIQnrRsW3Dc9buvgrgPd5PmJrStZSpGjcY6vhAOWdB4wKeBKFMs+uTWeYnmSBVmSo/6AgNl1Rcyi0ANqOIXlQhEL7WXZUvvvPUrIhS4XgvA1lVU3QH50v+QDXLBZmC9TYpJax50G4NdOFWCs1y7lmL0XDaJ/beKTqm1xmHRcDbBJ/6ms05OaAz+pKPwo9RCfMe96hnilPTDeLnnb82uR7tFN0R1OrtviAcwTB/A+c3UBFrF9xvEIs4Tv51CTfZU/b/B9zQ3Kb/chGfQbJtyHxoX7Gt7priumrV1UYfwozJVISyJagVp5WZ226uQmkYkndYeO0aJUHvtRfeoWTC8KnRfHA1c0Q2IB9XlEQ0777yRt9I0DkH5gQUaXrunAA22hhJSCeoabHI/8hWVYHSVvjxhhki7BT+ua7F34+EO6O5NUEsCLSmQ1X7jx5qoLblH
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CP2PR80MB4499.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39850400004)(366004)(346002)(136003)(396003)(376002)(166002)(52536014)(21615005)(478600001)(55016002)(316002)(54906003)(110136005)(186003)(71200400001)(5660300002)(33656002)(122000001)(4326008)(9686003)(76116006)(66946007)(66556008)(64756008)(38100700002)(66446008)(86362001)(6506007)(2906002)(66476007)(8936002)(7696005)(8676002)(19627405001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?ehHEAhKbWdYe1K7pr7sJP7oLk5j73FZc919omlmkwim4zCTBhh31FKK7xM?=
 =?iso-8859-1?Q?CepvdYqU8x3Tbf3FOKvpkyIOK0NZG/17hlNwNb7BoSL9/Ap5bjFrNc0JaF?=
 =?iso-8859-1?Q?fPaTXlfNoKKYPrjz/PcSHCf7Vi5apUwIN+gDjk2iyRJr8u1TPwFUMnZJ5t?=
 =?iso-8859-1?Q?H+lVFixfh0+EBllQ3CvyhAa50X1z/XgkUk3jVqzARfaX2CrDHcfBYr++jd?=
 =?iso-8859-1?Q?wWYz/obmPX1xe/nmTJz3L0Dmhy3euVL0FSRjkuzMVydvVjQPcGZ32eq0m+?=
 =?iso-8859-1?Q?yXUf7J4QLcQ3Sq/nwXeTwOJZSeyeai1CxJtrcQ1pKfd1LaUZ3sLrez3YLZ?=
 =?iso-8859-1?Q?60c1VxkmVppm5tYYQSTAdG5TnyjT/nOnSDLXiobx+Zfap6uUVb0qj0VMHy?=
 =?iso-8859-1?Q?ix+DCvVdc5Qt4kiU5+XRt2RkvN1YS9c6kB+ilN1hODiLtMUK8riSFkaSPu?=
 =?iso-8859-1?Q?dtaHUlTAMm4PmEuH3esItn7vJgBbjmXe9A2CNBhwJV3Pf83xK+QvbM/WSw?=
 =?iso-8859-1?Q?g3a9wAhY8ColGz/RhDBsWlf0jwO08AYiMNjYCPKvePxPiM0Sqz4o88KvW0?=
 =?iso-8859-1?Q?+U70ZtGwf6STFOJsnUTa1byw1JpIApuVCoFiNXh8HX8a67Jt+5dXflXi4k?=
 =?iso-8859-1?Q?gwLID2K0z+6rGeHL1nHtYmVTmLAdcTogO7RtYONZVK6F5/nq3DxZ77hfIn?=
 =?iso-8859-1?Q?0Z8yrSsTTkm+ChzPCBNe7RiL/gzOv9TMoiQJ5k9AiS25t+M6I8fw7ZleT7?=
 =?iso-8859-1?Q?gMYPsfWpKGsRFr+3rP1GTYv860qrdqXpan8nYA+tBxyBEjV/e+/bSkcc3P?=
 =?iso-8859-1?Q?yHhNO5pi9kj1Q+EcaroKJU1ZBkONYarYjgze6bb/B+GBa2hMgow+PFYzhU?=
 =?iso-8859-1?Q?qf1noLheck65WfmWrG9AdhjPbbogd0IGnqc54Q5+Xk5tx5TcO2gPU0ORZw?=
 =?iso-8859-1?Q?xF2wq9PVLQy39LlbpKv9qffBvZVq31WyFOqlZJ38vjyedlchU9/Cbc4Rrz?=
 =?iso-8859-1?Q?2vBHGz4jzhv/p1xOcBYRAlTocNlUW256RdPaxucVEHeQ7jVZMWcmrcATC9?=
 =?iso-8859-1?Q?HwPBwJD9FQkNhQK9iDFQwqkv/rOBEkIKaspyre3WU1Pc+rPIK7C1lagqIg?=
 =?iso-8859-1?Q?vovAdAMtUqYKdq7BVd1eYepSgKwjn1u4FeTXUq3MTt4HHTE+b8D0wR3p+z?=
 =?iso-8859-1?Q?E8lEVAM+/6xfpcdXQxpLnErDMF0kvD+uJNA+D9RWszEAgU+E6jcFaJeoHD?=
 =?iso-8859-1?Q?EfMeO9HHgm++3lcizyB1bUW7qwhyjqhp+/BhhDNO1tw+dkQEOmIxZozKmP?=
 =?iso-8859-1?Q?nOzr4gqC96BtrlZ4woaG634DM23whBHpLEfb2apaiSzIeXPFaU098DFaGV?=
 =?iso-8859-1?Q?nhF5XnujyOMlwnyiJ47ZR0FYPxbwU27rpUa4Sv3MgAwqAhv+IhXQs=3D?=
Content-Type: multipart/alternative;
 boundary="_000_CP2PR80MB4499015423A3D0B49610C929C74F9CP2PR80MB4499lamp_"
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CP2PR80MB4499.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd2d22fc-4477-4552-d8f9-08d8fe7a6af5
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Apr 2021 12:48:20.5867 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pwnM57nE6MHQK8h/yIT7h5nAfViBbfAHbgVVsEULp1aN1PPYb+3nVDvsXSpqa16lHktoP+VUEIxu8dGt92X0dzCo9pEXWhPmiw31dvJyEkY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP2PR80MB4499
Received-SPF: pass client-ip=40.107.76.113;
 envelope-from=bruno.larsen@eldorado.org.br;
 helo=NAM02-CY1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_KAM_HTML_FONT_INVALID=0.01 autolearn=ham autolearn_force=no
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
Cc: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>,
 Lucas Mateus Martins Araujo e Castro <lucas.araujo@eldorado.org.br>,
 Fernando Eckhardt Valle <fernando.valle@eldorado.org.br>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 Matheus Kowalczuk Ferst <matheus.ferst@eldorado.org.br>,
 "david@gibson.dropbear.id.au" <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--_000_CP2PR80MB4499015423A3D0B49610C929C74F9CP2PR80MB4499lamp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

All the code and git related feedback as been done, with the exception of

> > +gchar *ppc_gdb_arch_name(CPUState *cs);
> > +
> > +
> >  #endif /* PPC_CPU_H */
> > diff --git a/target/ppc/gdbstub.c b/target/ppc/gdbstub.c
> > index c28319fb97..0c016b8483 100644
> > --- a/target/ppc/gdbstub.c
> > +++ b/target/ppc/gdbstub.c
> > @@ -20,6 +20,10 @@
> >  #include "qemu/osdep.h"
> >  #include "cpu.h"
> >  #include "exec/gdbstub.h"
> > +#ifdef CONFIG_TCG
> > +#include "exec/helper-proto.h"
> > +#endif
> We still need to figure out where to move the vscr helpers so that both
> TCG and !TCG code can see them. But we cannot build without TCG
> currently anyway so I guess it's ok to leave the ifdef.

Actually, since we're moving the helpers away, I think it's better to remov=
e the ifdefs...
The helper-proto.h is here only for the vscr, so it's going away before we =
support the !tcg build anyway. Thoughts?

> > +
> > +void ppc_cpu_gdb_init(CPUState *cs, PowerPCCPUClass *pcc)
> > +{
> > +
> > +    if (pcc->insns_flags & PPC_FLOAT) {
> > +        gdb_register_coprocessor(cs, gdb_get_float_reg, gdb_set_float_=
reg,
> > +                                 33, "power-fpu.xml", 0);
> > +    }
> > +    if (pcc->insns_flags & PPC_ALTIVEC) {
> > +        gdb_register_coprocessor(cs, gdb_get_avr_reg, gdb_set_avr_reg,
> > +                                 34, "power-altivec.xml", 0);
> > +    }
> > +    if (pcc->insns_flags & PPC_SPE) {
> > +        gdb_register_coprocessor(cs, gdb_get_spe_reg, gdb_set_spe_reg,
> > +                                 34, "power-spe.xml", 0);
> > +    }
> > +    if (pcc->insns_flags2 & PPC2_VSX) {
> > +        gdb_register_coprocessor(cs, gdb_get_vsx_reg, gdb_set_vsx_reg,
> > +                                 32, "power-vsx.xml", 0);
> > +    }
> > +#ifndef CONFIG_USER_ONLY
> > +    gdb_register_coprocessor(cs, gdb_get_spr_reg, gdb_set_spr_reg,
> > +                             pcc->gdb_num_sprs, "power-spr.xml", 0);
> > +#endif
> > +}
>
> Same here.

This function was actually created by me, wasn't in the translate_init.c.in=
c. Since we're moving gdb fuinctions to gdbstub.c, I thought it made sense =
to hide the logic behind how to register coprocessors correctly as well. th=
at's why there is no removal of this function on the diff. Should I move it=
 back to ppc_cpu_realize or is this a good plan?



Bruno Piazera Larsen

Instituto de Pesquisas ELDORADO<http://clickemailmkt.eldorado.org.br/ls/cli=
ck?upn=3DUPoxpeIcHnAcbUZyo7TTaswyiVb1TXP3jEbQqiiJKKGsxOn8hBEs5ZsMLQfXkKuKXZ=
7MVDg0ij9eG8HV4TXI75dBzDiNGLxQ8Xx5PzCVNt6TpGrzBbU-2Biu0o69X5ce-2FW-2FOk1uUi=
puK0fZnWXJEgbRw-3D-3DJY4T_wWk-2BG6VvNBoa1YzxYjhCdFS9IfANIaBzDSklR1NyyrKOI1w=
j0P-2BdBFcuO4FnHcsA1MyHu0ly1Yt3oDMp7KKdJPM68iKuI2jiRH5v4B0d8wf3chU3qy5n5iXW=
nW1QjSaNFHOgELzxaP-2FnesTeBgJ5dFkjH4f279sVQpOtyjw5xAqj34M6pgNRAxVvuXif4IWDc=
VzXg1FzfYlEfkKzr9vvpA3Hg8kitwMtlU3zwbQUBCgL30fQoJPcRPMGKyOY8RmoAlXNqTJYDYIv=
qmfnI7KLUvw6vKB5R-2B5q1FJRAzX7H-2BmF0NnDET6jMLuIqtCcVIch>

Departamento Computa=E7=E3o Embarcada

Analista de Software Trainee

Aviso Legal - Disclaimer<https://www.eldorado.org.br/disclaimer.html>

--_000_CP2PR80MB4499015423A3D0B49610C929C74F9CP2PR80MB4499lamp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<span style=3D"font-size: 11pt; font-family: Calibri, Helvetica, sans-serif=
;">All the code and git related feedback as been done, with the exception o=
f</span></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size: 11pt; font-family: Calibri, Helv=
etica, sans-serif;">&gt; &gt; +gchar *ppc_gdb_arch_name(CPUState *cs);</spa=
n><span style=3D"font-size:11pt"><br>
</span><span style=3D"font-size: 11pt; font-family: Calibri, Helvetica, san=
s-serif;">&gt; &gt; +</span><span style=3D"font-size:11pt"><br>
</span><span style=3D"font-size: 11pt; font-family: Calibri, Helvetica, san=
s-serif;">&gt; &gt; +</span><span style=3D"font-size:11pt"><br>
</span><span style=3D"font-size: 11pt; font-family: Calibri, Helvetica, san=
s-serif;">&gt; &gt;&nbsp; #endif /* PPC_CPU_H */</span><span style=3D"font-=
size:11pt"><br>
</span><span style=3D"font-size: 11pt; font-family: Calibri, Helvetica, san=
s-serif;">&gt; &gt; diff --git a/target/ppc/gdbstub.c b/target/ppc/gdbstub.=
c</span><span style=3D"font-size:11pt"><br>
</span><span style=3D"font-size: 11pt; font-family: Calibri, Helvetica, san=
s-serif;">&gt; &gt; index c28319fb97..0c016b8483 100644</span><span style=
=3D"font-size:11pt"><br>
</span><span style=3D"font-size: 11pt; font-family: Calibri, Helvetica, san=
s-serif;">&gt; &gt; --- a/target/ppc/gdbstub.c</span><span style=3D"font-si=
ze:11pt"><br>
</span><span style=3D"font-size: 11pt; font-family: Calibri, Helvetica, san=
s-serif;">&gt; &gt; +++ b/target/ppc/gdbstub.c</span><span style=3D"font-si=
ze:11pt"><br>
</span><span style=3D"font-size: 11pt; font-family: Calibri, Helvetica, san=
s-serif;">&gt; &gt; @@ -20,6 +20,10 @@</span><span style=3D"font-size:11pt"=
><br>
</span><span style=3D"font-size: 11pt; font-family: Calibri, Helvetica, san=
s-serif;">&gt; &gt;&nbsp; #include &quot;qemu/osdep.h&quot;</span><span sty=
le=3D"font-size:11pt"><br>
</span><span style=3D"font-size: 11pt; font-family: Calibri, Helvetica, san=
s-serif;">&gt; &gt;&nbsp; #include &quot;cpu.h&quot;</span><span style=3D"f=
ont-size:11pt"><br>
</span><span style=3D"font-size: 11pt; font-family: Calibri, Helvetica, san=
s-serif;">&gt; &gt;&nbsp; #include &quot;exec/gdbstub.h&quot;</span><span s=
tyle=3D"font-size:11pt"><br>
</span><span style=3D"font-size: 11pt; font-family: Calibri, Helvetica, san=
s-serif;">&gt; &gt; +#ifdef CONFIG_TCG</span><span style=3D"font-size:11pt"=
><br>
</span><span style=3D"font-size: 11pt; font-family: Calibri, Helvetica, san=
s-serif;">&gt; &gt; +#include &quot;exec/helper-proto.h&quot;</span><span s=
tyle=3D"font-size:11pt"><br>
</span><span style=3D"font-size: 11pt; font-family: Calibri, Helvetica, san=
s-serif;">&gt; &gt; +#endif</span></font><br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<span></span>
<div><span style=3D"font-size: 11pt; font-family: Calibri, Helvetica, sans-=
serif;">&gt;
</span><font size=3D"2"><span style=3D"font-size: 11pt; font-family: Calibr=
i, Helvetica, sans-serif;">We still need to figure out where to move the vs=
cr helpers so that both</span><span style=3D"font-size:11pt"><br>
</span><span style=3D"font-size: 11pt; font-family: Calibri, Helvetica, san=
s-serif;">&gt; TCG and !TCG code can see them. But we cannot build without =
TCG</span><span style=3D"font-size:11pt"><br>
</span><span style=3D"font-size: 11pt; font-family: Calibri, Helvetica, san=
s-serif;">&gt; currently anyway so I guess it's ok to leave the ifdef.</spa=
n></font></div>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<span></span><br>
<span style=3D"font-size: 11pt; font-family: Calibri, Helvetica, sans-serif=
;">Actually, since we're moving the helpers away, I think it's better to re=
move the ifdefs...
<br>
</span></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<span style=3D"font-size: 11pt; font-family: Calibri, Helvetica, sans-serif=
;">The helper-proto.h is here only for the vscr, so it's going away before =
we support the !tcg build anyway. Thoughts?<br>
</span></div>
<div>
<div id=3D"Signature">
<div><br>
</div>
<div><font size=3D"2"><span style=3D"font-size:11pt"><font size=3D"2"><span=
 style=3D"font-family: Calibri, Helvetica, sans-serif;">&gt;
</span></font></span><span style=3D"font-size: 11pt; font-family: Calibri, =
Helvetica, sans-serif;">&gt; +</span><span style=3D"font-size:11pt"><br>
</span><span style=3D"font-size: 11pt; font-family: Calibri, Helvetica, san=
s-serif;">&gt;
</span><span style=3D"font-size:11pt"><font size=3D"2"><span style=3D"font-=
family: Calibri, Helvetica, sans-serif;">&gt;
</span></font></span><span style=3D"font-size: 11pt; font-family: Calibri, =
Helvetica, sans-serif;">+void ppc_cpu_gdb_init(CPUState *cs, PowerPCCPUClas=
s *pcc)</span><span style=3D"font-size:11pt"><br>
<font size=3D"2"><span style=3D"font-family: Calibri, Helvetica, sans-serif=
;">&gt; </span>
</font></span><span style=3D"font-size: 11pt; font-family: Calibri, Helveti=
ca, sans-serif;">&gt; +{</span><span style=3D"font-size:11pt"><br>
</span><span style=3D"font-size: 11pt; font-family: Calibri, Helvetica, san=
s-serif;">&gt;
</span><span style=3D"font-size:11pt"><font size=3D"2"><span style=3D"font-=
family: Calibri, Helvetica, sans-serif;">&gt;
</span></font></span><span style=3D"font-size: 11pt; font-family: Calibri, =
Helvetica, sans-serif;">+</span><span style=3D"font-size:11pt"><br>
<font size=3D"2"><span style=3D"font-family: Calibri, Helvetica, sans-serif=
;">&gt; </span>
</font></span><span style=3D"font-size: 11pt; font-family: Calibri, Helveti=
ca, sans-serif;">&gt; +&nbsp;&nbsp;&nbsp; if (pcc-&gt;insns_flags &amp; PPC=
_FLOAT) {</span><span style=3D"font-size:11pt"><br>
</span><span style=3D"font-size: 11pt; font-family: Calibri, Helvetica, san=
s-serif;">&gt;
</span><span style=3D"font-size:11pt"><font size=3D"2"><span style=3D"font-=
family: Calibri, Helvetica, sans-serif;">&gt;
</span></font></span><span style=3D"font-size: 11pt; font-family: Calibri, =
Helvetica, sans-serif;">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; gdb_reg=
ister_coprocessor(cs, gdb_get_float_reg, gdb_set_float_reg,</span><span sty=
le=3D"font-size:11pt"><br>
<font size=3D"2"><span style=3D"font-family: Calibri, Helvetica, sans-serif=
;">&gt; </span>
</font></span><span style=3D"font-size: 11pt; font-family: Calibri, Helveti=
ca, sans-serif;">&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 33, &quot=
;power-fpu.xml&quot;, 0);</span><span style=3D"font-size:11pt"><br>
<font size=3D"2"><span style=3D"font-family: Calibri, Helvetica, sans-serif=
;">&gt; </span>
</font></span><span style=3D"font-size: 11pt; font-family: Calibri, Helveti=
ca, sans-serif;">&gt; +&nbsp;&nbsp;&nbsp; }</span><span style=3D"font-size:=
11pt"><br>
</span><span style=3D"font-size: 11pt; font-family: Calibri, Helvetica, san=
s-serif;">&gt;
</span><span style=3D"font-size:11pt"><font size=3D"2"><span style=3D"font-=
family: Calibri, Helvetica, sans-serif;">&gt;
</span></font></span><span style=3D"font-size: 11pt; font-family: Calibri, =
Helvetica, sans-serif;">+&nbsp;&nbsp;&nbsp; if (pcc-&gt;insns_flags &amp; P=
PC_ALTIVEC) {</span><span style=3D"font-size:11pt"><br>
<font size=3D"2"><span style=3D"font-family: Calibri, Helvetica, sans-serif=
;">&gt; </span>
</font></span><span style=3D"font-size: 11pt; font-family: Calibri, Helveti=
ca, sans-serif;">&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; gdb_regis=
ter_coprocessor(cs, gdb_get_avr_reg, gdb_set_avr_reg,</span><span style=3D"=
font-size:11pt"><br>
</span><span style=3D"font-size: 11pt; font-family: Calibri, Helvetica, san=
s-serif;">&gt;
</span><span style=3D"font-size:11pt"><font size=3D"2"><span style=3D"font-=
family: Calibri, Helvetica, sans-serif;">&gt;
</span></font></span><span style=3D"font-size: 11pt; font-family: Calibri, =
Helvetica, sans-serif;">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 34, &qu=
ot;power-altivec.xml&quot;, 0);</span><span style=3D"font-size:11pt"><br>
<font size=3D"2"><span style=3D"font-family: Calibri, Helvetica, sans-serif=
;">&gt; </span>
</font></span><span style=3D"font-size: 11pt; font-family: Calibri, Helveti=
ca, sans-serif;">&gt; +&nbsp;&nbsp;&nbsp; }</span><span style=3D"font-size:=
11pt"><br>
</span><span style=3D"font-size: 11pt; font-family: Calibri, Helvetica, san=
s-serif;">&gt;
</span><span style=3D"font-size:11pt"><font size=3D"2"><span style=3D"font-=
family: Calibri, Helvetica, sans-serif;">&gt;
</span></font></span><span style=3D"font-size: 11pt; font-family: Calibri, =
Helvetica, sans-serif;">+&nbsp;&nbsp;&nbsp; if (pcc-&gt;insns_flags &amp; P=
PC_SPE) {</span><span style=3D"font-size:11pt"><br>
<font size=3D"2"><span style=3D"font-family: Calibri, Helvetica, sans-serif=
;">&gt; </span>
</font></span><span style=3D"font-size: 11pt; font-family: Calibri, Helveti=
ca, sans-serif;">&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; gdb_regis=
ter_coprocessor(cs, gdb_get_spe_reg, gdb_set_spe_reg,</span><span style=3D"=
font-size:11pt"><br>
</span><span style=3D"font-size: 11pt; font-family: Calibri, Helvetica, san=
s-serif;">&gt;
</span><span style=3D"font-size:11pt"><font size=3D"2"><span style=3D"font-=
family: Calibri, Helvetica, sans-serif;">&gt;
</span></font></span><span style=3D"font-size: 11pt; font-family: Calibri, =
Helvetica, sans-serif;">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 34, &qu=
ot;power-spe.xml&quot;, 0);</span><span style=3D"font-size:11pt"><br>
<font size=3D"2"><span style=3D"font-family: Calibri, Helvetica, sans-serif=
;">&gt; </span>
</font></span><span style=3D"font-size: 11pt; font-family: Calibri, Helveti=
ca, sans-serif;">&gt; +&nbsp;&nbsp;&nbsp; }</span><span style=3D"font-size:=
 11pt; font-family: Calibri, Helvetica, sans-serif;"><br>
</span><span style=3D"font-size: 11pt; font-family: Calibri, Helvetica, san=
s-serif;">&gt;
</span><span style=3D"font-size:11pt"><font size=3D"2"><span style=3D"font-=
family: Calibri, Helvetica, sans-serif;">&gt;
</span></font></span><span style=3D"font-size: 11pt; font-family: Calibri, =
Helvetica, sans-serif;">+&nbsp;&nbsp;&nbsp; if (pcc-&gt;insns_flags2 &amp; =
PPC2_VSX) {</span><span style=3D"font-size:11pt"><br>
<font size=3D"2"><span style=3D"font-family: Calibri, Helvetica, sans-serif=
;">&gt; </span>
</font></span><span style=3D"font-size: 11pt; font-family: Calibri, Helveti=
ca, sans-serif;">&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; gdb_regis=
ter_coprocessor(cs, gdb_get_vsx_reg, gdb_set_vsx_reg,</span><span style=3D"=
font-size:11pt"><br>
</span><span style=3D"font-size: 11pt; font-family: Calibri, Helvetica, san=
s-serif;">&gt;
</span><span style=3D"font-size:11pt"><font size=3D"2"><span style=3D"font-=
family: Calibri, Helvetica, sans-serif;">&gt;
</span></font></span><span style=3D"font-size: 11pt; font-family: Calibri, =
Helvetica, sans-serif;">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 32, &qu=
ot;power-vsx.xml&quot;, 0);</span><span style=3D"font-size:11pt"><br>
<font size=3D"2"><span style=3D"font-family: Calibri, Helvetica, sans-serif=
;">&gt; </span>
</font></span><span style=3D"font-size: 11pt; font-family: Calibri, Helveti=
ca, sans-serif;">&gt; +&nbsp;&nbsp;&nbsp; }</span><span style=3D"font-size:=
11pt"><br>
</span><span style=3D"font-size: 11pt; font-family: Calibri, Helvetica, san=
s-serif;">&gt;</span><span style=3D"font-size:11pt"><font size=3D"2"><span =
style=3D"font-family: Calibri, Helvetica, sans-serif;"> &gt;
</span></font></span><span style=3D"font-size: 11pt; font-family: Calibri, =
Helvetica, sans-serif;">+#ifndef CONFIG_USER_ONLY</span><span style=3D"font=
-size:11pt"><br>
</span><span style=3D"font-size: 11pt; font-family: Calibri, Helvetica, san=
s-serif;">&gt; &gt; +&nbsp;&nbsp;&nbsp; gdb_register_coprocessor(cs, gdb_ge=
t_spr_reg, gdb_set_spr_reg,</span><span style=3D"font-size:11pt"><br>
</span><span style=3D"font-size: 11pt; font-family: Calibri, Helvetica, san=
s-serif;">&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pcc-&gt;gdb_num_sprs, &quot;power-s=
pr.xml&quot;, 0);</span><span style=3D"font-size:11pt"><br>
</span><span style=3D"font-size: 11pt; font-family: Calibri, Helvetica, san=
s-serif;">&gt; &gt; +#endif</span><span style=3D"font-size:11pt"><br>
</span><span style=3D"font-size: 11pt; font-family: Calibri, Helvetica, san=
s-serif;">&gt; &gt; +}</span></font></div>
<div><font size=3D"2"><span style=3D"font-size: 11pt; font-family: Calibri,=
 Helvetica, sans-serif;">&gt;
</span></font><br>
</div>
<div><span style=3D"font-size:11pt;font-family:Calibri, Helvetica, sans-ser=
if">&gt; </span>
<font size=3D"2"><span style=3D"font-size:11pt;font-family:Calibri, Helveti=
ca, sans-serif">Same here.</span></font></div>
<div><br>
</div>
<div><span style=3D"font-size: 11pt; font-family: Calibri, Helvetica, sans-=
serif;">This function was actually created by me, wasn't in the translate_i=
nit.c.inc. Since we're moving gdb fuinctions to gdbstub.c, I thought it mad=
e sense to hide the logic behind how
 to register coprocessors correctly as well. that's why there is no removal=
 of this function on the diff. Should I move it back to ppc_cpu_realize or =
is this a good plan?</span><span style=3D"font-size: 11pt; font-family: Cal=
ibri, Helvetica, sans-serif;"><br>
</span></div>
<div><br>
</div>
<div><br>
</div>
<div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<p style=3D"margin:0cm; margin-bottom:.0001pt"><span style=3D"font-size:11p=
t; font-family:&quot;Calibri&quot;,sans-serif,serif,EmojiFont">Bruno Piazer=
a Larsen<span style=3D"color:#1F497D"></span></span></p>
<p style=3D"margin:0cm; margin-bottom:.0001pt"><span style=3D"font-size:11p=
t; font-family:&quot;Calibri&quot;,sans-serif,serif,EmojiFont"><a href=3D"h=
ttp://clickemailmkt.eldorado.org.br/ls/click?upn=3DUPoxpeIcHnAcbUZyo7TTaswy=
iVb1TXP3jEbQqiiJKKGsxOn8hBEs5ZsMLQfXkKuKXZ7MVDg0ij9eG8HV4TXI75dBzDiNGLxQ8Xx=
5PzCVNt6TpGrzBbU-2Biu0o69X5ce-2FW-2FOk1uUipuK0fZnWXJEgbRw-3D-3DJY4T_wWk-2BG=
6VvNBoa1YzxYjhCdFS9IfANIaBzDSklR1NyyrKOI1wj0P-2BdBFcuO4FnHcsA1MyHu0ly1Yt3oD=
Mp7KKdJPM68iKuI2jiRH5v4B0d8wf3chU3qy5n5iXWnW1QjSaNFHOgELzxaP-2FnesTeBgJ5dFk=
jH4f279sVQpOtyjw5xAqj34M6pgNRAxVvuXif4IWDcVzXg1FzfYlEfkKzr9vvpA3Hg8kitwMtlU=
3zwbQUBCgL30fQoJPcRPMGKyOY8RmoAlXNqTJYDYIvqmfnI7KLUvw6vKB5R-2B5q1FJRAzX7H-2=
BmF0NnDET6jMLuIqtCcVIch" target=3D"_blank" rel=3D"noopener noreferrer"><spa=
n style=3D"color:windowtext">Instituto
 de Pesquisas ELDORADO</span></a></span></p>
<p style=3D"margin:0cm; margin-bottom:.0001pt"><span style=3D"font-size:11p=
t; font-family:&quot;Calibri&quot;,sans-serif,serif,EmojiFont">Departamento=
 Computa=E7=E3o Embarcada<br>
</span></p>
<p style=3D"margin:0cm; margin-bottom:.0001pt"><span style=3D"font-size:11p=
t; font-family:&quot;Calibri&quot;,sans-serif,serif,EmojiFont">Analista de =
Software Trainee<br>
</span></p>
<p style=3D"margin:0cm; margin-bottom:.0001pt"><span style=3D"font-size:11p=
t; font-family:&quot;Calibri&quot;,sans-serif,serif,EmojiFont"><a href=3D"h=
ttps://www.eldorado.org.br/disclaimer.html" target=3D"_blank" rel=3D"noopen=
er noreferrer"><span style=3D"color:windowtext">Aviso
 Legal - Disclaimer</span></a></span></p>
</div>
</div>
</div>
</div>
<div id=3D"appendonsend"></div>
</body>
</html>

--_000_CP2PR80MB4499015423A3D0B49610C929C74F9CP2PR80MB4499lamp_--

