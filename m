Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D80337BB3
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 19:05:39 +0100 (CET)
Received: from localhost ([::1]:56448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKPgn-0001XQ-Hq
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 13:05:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>)
 id 1lKPdx-00009h-6m; Thu, 11 Mar 2021 13:02:41 -0500
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:40737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>)
 id 1lKPdu-0006WI-D4; Thu, 11 Mar 2021 13:02:40 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.17])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 2BFAB8EFDBF4;
 Thu, 11 Mar 2021 19:02:33 +0100 (CET)
Received: from kaod.org (37.59.142.100) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Thu, 11 Mar
 2021 19:02:31 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R003535302b3-1c8a-484d-9181-2a4939b00a6d,
 58A3AAFCCF725AA0952C8F912993319916779E2B) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Thu, 11 Mar 2021 19:02:30 +0100
From: Greg Kurz <groug@kaod.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PULL 00/20] ppc-for-6.0 queue 20210310
Message-ID: <20210311190230.62cd0a3e@bahia.lan>
In-Reply-To: <20210311165423.5c3165cc@bahia.lan>
References: <20210310041002.333813-1-david@gibson.dropbear.id.au>
 <503c3c5e-3dd2-adba-2d2c-2e5f8618fc3a@vmfacility.fr>
 <YEl2rC3TOetSiqh8@yekko.fritz.box>
 <e6bee42f-661b-a5a6-bb45-0b93167fb227@vmfacility.fr>
 <YEmjDwpfYwLOaVe/@yekko.fritz.box>
 <af7ed746-a1f3-5740-cdab-99baf683047c@linaro.org>
 <20210311165423.5c3165cc@bahia.lan>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG3EX1.mxp5.local (172.16.2.21) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: c0c763e2-5aa3-434b-82f1-3661a8658be9
X-Ovh-Tracer-Id: 6573285134555453734
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledruddvtddguddtkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkjghfofggtgfgihesthhqredtredtjeenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepkedvkeejieejheeugffggfeihfefffejudelieeuheeihedvvdegieetvdehtdehnecuffhomhgrihhnpehgihhtlhgrsgdrtghomhenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddttdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtohepuggrvhhiugesghhisghsohhnrdgurhhophgsvggrrhdrihgurdgruh
Received-SPF: pass client-ip=178.32.125.2; envelope-from=groug@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Ivan Warren <ivan@vmfacility.fr>, peter.maydell@linaro.org,
 qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 11 Mar 2021 16:54:23 +0100
Greg Kurz <groug@kaod.org> wrote:

> On Thu, 11 Mar 2021 07:31:40 -0600
> Richard Henderson <richard.henderson@linaro.org> wrote:
>=20
> > On 3/10/21 10:56 PM, David Gibson wrote:
> > >>  =C2=A0=C2=A0=C2=A0=C2=A0 *pc =3D env->nip;
> > >> -=C2=A0=C2=A0=C2=A0 *cs_base =3D 0;
> > >> -=C2=A0=C2=A0=C2=A0 *flags =3D env->hflags;
> > >> +=C2=A0=C2=A0=C2=A0 *cs_base =3D env->hflags;
> > >> +=C2=A0=C2=A0=C2=A0 *flags =3D 0;
> > >>  =C2=A0}
> > >=20
> > > Ah, that one.  It caused a regression, so I dropped it. I pinged
> > > Richard Henderson about it, but I don't think I even had a reply.
> > >=20
> > > I'm afraid I don't have the knowledge or the time to debug this
> > > myself.
> >=20
> > I missed the regression email, sorry.  Do you recall what it was?
> >=20
> > r~
>=20
> This was:
>=20
> Message-ID: <20210210043453.GI4450@yekko.fritz.box>
>=20
> On Wed, 10 Feb 2021 15:34:53 +1100
> David Gibson <david@gibson.dropbear.id.au> wrote:
>=20
> > Well, I don't know why, but somehow this patch is breaking one of the
> > acceptance tests:
> >=20
> >  (043/134) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test=
_ppc64_e500: INTERRUPTED: Test interrupted by SIGTERM\nRunner error occurre=
d: Timeout reached\nOriginal status: ERROR\n{'name': '043-tests/acceptance/=
boot_linux_console.py:BootLinuxConsole.test_ppc64_e500', 'logdir': '/home/d=
wg/src/qemu/build/normal/tests/results/job-2021-02-10T15.04... (90.26 s)
> >=20
> > From that timeout, I'm guessing something about this is causing the
> > boot to wedge.
> >=20
> > So, I've removed this from my tree for now, I'll need a fixed version
> > to proceed with.
>=20

If this can help, I have run two gitlab CI pipelines against current
master (371983c1f).

The one without the patch passes:

https://gitlab.com/gkurz/qemu/-/pipelines/269023228

The one with the patch breaks:

https://gitlab.com/gkurz/qemu/-/pipelines/269077760

> Cheers,
>=20
> --
> Greg
>=20


