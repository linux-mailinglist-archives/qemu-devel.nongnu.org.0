Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 812462FCED3
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 12:11:43 +0100 (CET)
Received: from localhost ([::1]:46802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2BOo-0006sd-CD
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 06:11:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>)
 id 1l2BNh-0006Em-Vd; Wed, 20 Jan 2021 06:10:33 -0500
Received: from smtpout1.mo804.mail-out.ovh.net ([79.137.123.220]:33795)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>)
 id 1l2BNe-0006zc-Qr; Wed, 20 Jan 2021 06:10:33 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.188])
 by mo804.mail-out.ovh.net (Postfix) with ESMTPS id CC40383E2AB9;
 Wed, 20 Jan 2021 12:10:26 +0100 (CET)
Received: from kaod.org (37.59.142.97) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Wed, 20 Jan
 2021 12:10:24 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G002a859b1f1-62b8-47dd-83cc-bb2dac4c4bde,
 BC30773A3D735F3651E1A72FF92628D33EE1AD8E) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Wed, 20 Jan 2021 12:10:22 +0100
From: Greg Kurz <groug@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH 1/1] spapr_caps.c: disable KVM specific caps when
 running with TCG
Message-ID: <20210120121022.682e96c8@bahia.lan>
In-Reply-To: <20210120002445.GA5174@yekko.fritz.box>
References: <20210119205824.2222801-1-danielhb413@gmail.com>
 <20210120002445.GA5174@yekko.fritz.box>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_//yLTba8v6RfJoI2SKcPTvqt";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG1EX2.mxp5.local (172.16.2.2) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: 8f135c0a-0ab2-480a-a7e6-879502a46676
X-Ovh-Tracer-Id: 1126462860783098336
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledruddvgddvjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkjghfofggtghisehgtderreertddvnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeelgffgfeeugedugeekveeiveevjeffhfduvdegffetkeeiveeufefgledtgfeiteenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdqphhptgesnhhonhhgnhhurdhorhhg
Received-SPF: pass client-ip=79.137.123.220; envelope-from=groug@kaod.org;
 helo=smtpout1.mo804.mail-out.ovh.net
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, RCVD_IN_SBL=0.141, SPF_HELO_NONE=0.001,
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_//yLTba8v6RfJoI2SKcPTvqt
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 20 Jan 2021 11:24:45 +1100
David Gibson <david@gibson.dropbear.id.au> wrote:

> On Tue, Jan 19, 2021 at 05:58:24PM -0300, Daniel Henrique Barboza wrote:
> > Commit 006e9d361869 added warning messages for cap-cfpc, cap-ibs and
> > cap-sbbc when enabled under TCG. Commit 8ff43ee404d3 did the same thing
> > when introducing cap-ccf-assist.
> >=20
> > These warning messages, although benign to the machine launch, can make
> > users a bit confused. E.g:
> >=20
> > $ sudo ./ppc64-softmmu/qemu-system-ppc64
> > qemu-system-ppc64: warning: TCG doesn't support requested feature, cap-=
cfpc=3Dworkaround
> > qemu-system-ppc64: warning: TCG doesn't support requested feature, cap-=
sbbc=3Dworkaround
> > qemu-system-ppc64: warning: TCG doesn't support requested feature, cap-=
ibs=3Dworkaround
> > qemu-system-ppc64: warning: TCG doesn't support requested feature, cap-=
ccf-assist=3Don
> >=20
> > We're complaining about "TCG doesn't support requested feature" when the
> > user didn't request any of those caps in the command line.
> >=20
> > Check if we're running with TCG and change the defaults in spapr_caps_i=
nit().
> > Note that this change doesn't impact backward compatibility or migration
> > to older QEMU versions because we never activated these caps with TCG
> > in the first place.
>=20
> Nack.  Changing those capabilities changes guest visible properties of
> the guest environment.  Silently altering guest visible
> characteristics based on whether or not we're running with KVM is not
> acceptable (we did it in the past and it caused a lot of grief).
>=20

I definitely agree with the nack, but I also agree with the
intention behind this patch. Since we know if a capability
was requested from the command line, the warning can be
restricted to this case with something like:

--- a/hw/ppc/spapr_caps.c
+++ b/hw/ppc/spapr_caps.c
@@ -243,7 +243,7 @@ static void cap_safe_cache_apply(SpaprMachineState *spa=
pr, >
     ERRP_GUARD();
     uint8_t kvm_val =3D  kvmppc_get_cap_safe_cache();
=20
-    if (tcg_enabled() && val) {
+    if (tcg_enabled() && val && spapr->cmd_line_caps[SPAPR_CAP_CFPC]) {
         /* TCG only supports broken, allow other values and print a warnin=
g */
         warn_report("TCG doesn't support requested feature, cap-cfpc=3D%s",
                     cap_cfpc_possible.vals[val]);

A further improvement would be to only issue these warnings at
machine init instead of printing them again and again at each
reboot. This should be possible in spapr_caps_init() because
the accelerator has been set and the capabilities have been
parsed already.

> >=20
> > Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> > ---
> >  hw/ppc/spapr_caps.c | 15 +++++++++++++++
> >  1 file changed, 15 insertions(+)
> >=20
> > diff --git a/hw/ppc/spapr_caps.c b/hw/ppc/spapr_caps.c
> > index 9341e9782a..53eea2b11e 100644
> > --- a/hw/ppc/spapr_caps.c
> > +++ b/hw/ppc/spapr_caps.c
> > @@ -781,6 +781,21 @@ void spapr_caps_init(SpaprMachineState *spapr)
> >      /* Compute the actual set of caps we should run with */
> >      default_caps =3D default_caps_with_cpu(spapr, MACHINE(spapr)->cpu_=
type);
> > =20
> > +   /*
> > +    * These are KVM specific caps that TCG doesn't support, but will
> > +    * throw an warning if enabled by default (see 006e9d361869 and
> > +    * 8ff43ee404d3). This behavior can make the user wonder why a warn=
ing
> > +    * is being shown for caps that the user didn't enable in the
> > +    * command line.
> > +    *
> > +    * Disable them for TCG. */
> > +    if (tcg_enabled()) {
> > +        default_caps.caps[SPAPR_CAP_CFPC] =3D SPAPR_CAP_BROKEN;
> > +        default_caps.caps[SPAPR_CAP_SBBC] =3D SPAPR_CAP_BROKEN;
> > +        default_caps.caps[SPAPR_CAP_IBS] =3D SPAPR_CAP_BROKEN;
> > +        default_caps.caps[SPAPR_CAP_CCF_ASSIST] =3D SPAPR_CAP_BROKEN;
> > +    }
> > +
> >      for (i =3D 0; i < SPAPR_CAP_NUM; i++) {
> >          /* Store the defaults */
> >          spapr->def.caps[i] =3D default_caps.caps[i];
>=20


--Sig_//yLTba8v6RfJoI2SKcPTvqt
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEtIKLr5QxQM7yo0kQcdTV5YIvc9YFAmAID54ACgkQcdTV5YIv
c9bFng/9GqQsrc6pe8cazPzvKDwFskSWh2bytkLUqH6DOP0mUOrba2bvNlTOIDC0
sMr5KSUkAE0yyp/5Gu7Y2aVPsuVHkhd9I4ec0JglBKul1wFlrT/pmngHdRzuzypT
hHCYKIaA4QOXdJOnSMroV+sy+uP/3Y4rLmiL3OiPQF0IKRUxCBKKYWpYpvk8ZxYG
Wo1qBbxkPgbuCVuPW3rjbFRG8triji33UDEmyk2QQPsS4YixYUO7TJvwmltFfOnC
L4okzi1DWDcbM7vSAix4z4jNaCHwLJ0icR0EhD2w26A5TJ2KTj4A+HGvPWvtRLTT
krp+i3BDSZPbU6nAzoPSBl+LbHxoTT0xIp87O9qyNi+LUbPZgnGuNA5mGXoqa26/
Qyd5xxv9A2GAnZr4kFs8tjsDyAMZ79AGKZ3D57X2qyY/JhvapxmjMeIiti7MTXLY
UMsLi5YQYkszxVvV+VY/jYkWSD/+goyMTvqF4sLQWKZLb9n1Tr/tAz8+UbNEzuGU
SEZIbTChzcFNZeNwv2D0Qn4asGm7IQxSGNB18Q43FuCpJyS2fKjpbGH1ymUcn4+S
PQuaZXFjG7TE1WK6RmOS1W+pKOFg3USrIIuj/8WCi3gcozufjEso6avcF0ufCEh7
CA1tn84x6T8DWLK9pLul+dRP6g6MMQJhROxUZr40VR9Xw8HbEX4=
=1wTI
-----END PGP SIGNATURE-----

--Sig_//yLTba8v6RfJoI2SKcPTvqt--

