Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 948C14B8045
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 06:40:41 +0100 (CET)
Received: from localhost ([::1]:38320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKD3Q-0005Ub-En
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 00:40:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nKCQi-0003wX-06; Wed, 16 Feb 2022 00:00:40 -0500
Received: from [2404:9400:2221:ea00::3] (port=50299 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nKCQf-0004Zl-Nr; Wed, 16 Feb 2022 00:00:39 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4Jz5PW1sJ7z4xmx; Wed, 16 Feb 2022 16:00:31 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1644987631;
 bh=UzGGp+C2ieyJYHwEExDKvDa4IZNtHEfWRlR8ZVp+Sms=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ta4kwsPfNnothF3pBAc6E+ZO1uz/d/k8pVxUoRbScInMz8m73Thun1XAEud9IY0nD
 zSBGZuSsPeKU679Gt89PupUSm4FKtzfkue1Htj58xJgg1mGIxr7lQr/mOfXwrlya71
 47oBf6oIx+gcRODtHgq+z2OPzO2TNOr7ZpJ2Yc38=
Date: Wed, 16 Feb 2022 15:58:34 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 2/2] target/ppc/kvm: Use KVM_CAP_PPC_AIL_MODE_3 to
 determine cap-ail-mode-3 support
Message-ID: <YgyEehoxHyNQyfJc@yekko>
References: <20220214111749.1542196-1-npiggin@gmail.com>
 <20220214111749.1542196-2-npiggin@gmail.com>
 <87sfsllhez.fsf@linux.ibm.com>
 <1644878889.dc8nyl60bz.astroid@bobo.none>
 <87tud0xqvb.fsf@linux.ibm.com>
 <1644975678.e05ill5mjj.astroid@bobo.none>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="cQRKO6j9ux8JwjfT"
Content-Disposition: inline
In-Reply-To: <1644975678.e05ill5mjj.astroid@bobo.none>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2404:9400:2221:ea00::3
 (failed)
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RDNS_NONE=0.793, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 qemu-ppc@nongnu.org, =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--cQRKO6j9ux8JwjfT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

>On Wed, Feb 16, 2022 at 11:46:58AM +1000, Nicholas Piggin wrote:
> Excerpts from Fabiano Rosas's message of February 15, 2022 10:21 pm:
> > Nicholas Piggin <npiggin@gmail.com> writes:
> >=20
> >> Excerpts from Fabiano Rosas's message of February 14, 2022 11:13 pm:
> >>> Nicholas Piggin <npiggin@gmail.com> writes:
> >>>=20
> >>>> Use KVM_CAP_PPC_AIL_MODE_3 to determine cap-ail-mode-3 support for K=
VM
> >>>> guests. Keep the fallback heuristic for KVM hosts that pre-date this
> >>>> CAP.
> >>>>
> >>>> This is only proposed the KVM CAP has not yet been allocated. I will
> >>>> ask to merge the new KVM cap when there are no objections on the QEMU
> >>>> side.
> >>>>
> >>>> not-yet-Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> >>>> ---
> >>>>  hw/ppc/spapr_caps.c       |  2 +-
> >>>>  linux-headers/linux/kvm.h |  1 +
> >>>>  target/ppc/kvm.c          | 18 +++++++++++++++++-
> >>>>  target/ppc/kvm_ppc.h      |  4 ++--
> >>>>  4 files changed, 21 insertions(+), 4 deletions(-)
> >>>>
> >>>> diff --git a/hw/ppc/spapr_caps.c b/hw/ppc/spapr_caps.c
> >>>> index 5fd4a53c33..5cc80776d0 100644
> >>>> --- a/hw/ppc/spapr_caps.c
> >>>> +++ b/hw/ppc/spapr_caps.c
> >>>> @@ -619,7 +619,7 @@ static void cap_ail_mode_3_apply(SpaprMachineSta=
te *spapr,
> >>>>      ERRP_GUARD();
> >>>> =20
> >>>>      if (kvm_enabled()) {
> >>>> -        if (!kvmppc_supports_ail_3()) {
> >>>> +        if (!kvmppc_has_cap_ail_3()) {
> >>>>              error_setg(errp, "KVM implementation does not support c=
ap-ail-mode-3");
> >>>>              error_append_hint(errp, "Try appending -machine cap-ail=
-mode-3=3Doff\n");
> >>>>              return;
> >>>> diff --git a/linux-headers/linux/kvm.h b/linux-headers/linux/kvm.h
> >>>> index 02c5e7b7bb..d91f578200 100644
> >>>> --- a/linux-headers/linux/kvm.h
> >>>> +++ b/linux-headers/linux/kvm.h
> >>>> @@ -1130,6 +1130,7 @@ struct kvm_ppc_resize_hpt {
> >>>>  #define KVM_CAP_BINARY_STATS_FD 203
> >>>>  #define KVM_CAP_EXIT_ON_EMULATION_FAILURE 204
> >>>>  #define KVM_CAP_ARM_MTE 205
> >>>> +#define KVM_CAP_PPC_AIL_MODE_3 210
> >>>> =20
> >>>>  #ifdef KVM_CAP_IRQ_ROUTING
> >>>> =20
> >>>> diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
> >>>> index 128bc530d4..d0d0bdaac4 100644
> >>>> --- a/target/ppc/kvm.c
> >>>> +++ b/target/ppc/kvm.c
> >>>> @@ -90,6 +90,7 @@ static int cap_ppc_nested_kvm_hv;
> >>>>  static int cap_large_decr;
> >>>>  static int cap_fwnmi;
> >>>>  static int cap_rpt_invalidate;
> >>>> +static int cap_ail_mode_3;
> >>>> =20
> >>>>  static uint32_t debug_inst_opcode;
> >>>> =20
> >>>> @@ -154,6 +155,7 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
> >>>>      }
> >>>> =20
> >>>>      cap_rpt_invalidate =3D kvm_vm_check_extension(s, KVM_CAP_PPC_RP=
T_INVALIDATE);
> >>>> +    cap_ail_mode_3 =3D kvm_vm_check_extension(s, KVM_CAP_PPC_AIL_MO=
DE_3);
> >>>>      kvm_ppc_register_host_cpu_type();
> >>>> =20
> >>>>      return 0;
> >>>> @@ -2563,10 +2565,24 @@ int kvmppc_has_cap_rpt_invalidate(void)
> >>>>      return cap_rpt_invalidate;
> >>>>  }
> >>>> =20
> >>>> -int kvmppc_supports_ail_3(void)
> >>>> +int kvmppc_has_cap_ail_3(void)
> >>>>  {
> >>>>      PowerPCCPUClass *pcc =3D kvm_ppc_get_host_cpu_class();
> >>>> =20
> >>>> +    if (cap_ail_mode_3) {
> >>>> +        return 1;
> >>>> +    }
> >>>> +
> >>>> +    if (kvm_ioctl(kvm_state, KVM_CHECK_EXTENSION, KVM_CAP_PPC_AIL_M=
ODE_3) =3D=3D 0) {
> >>>> +        return 0;
> >>>> +    }
> >>>=20
> >>> This is not needed here it seems.
> >>
> >> This is to test whether the capability is recognised by the HV.=20
> >> kvm_vm_check_extension() treats ioctl error as 0 capability but we wan=
t=20
> >> to do this extra heuristic.
> >=20
> > Do you intend to make the KVM capability return < 0 in case AIL_3 is not
> > supported?
>=20
> No it should return 0 in that case.
>=20
> > AFAICS the unknown capability won't result in an ioctl error
> > as kvm_vm_ioctl_check_extension always returns >=3D 0.
>=20
> Oh. There is no way to tell that a host does not recognise a cap? :(

Not short of giving it all non-zero values when you create the new cap.

> Great for the purity test, unknown cap =3D=3D unsupported. For a practica=
l=20
> point of view to catch such bugs and oversights there should have been
> some way to handle it.

Yeah :(.

> I'm not sure what to do then. Try some even worse hack and leave that
> in for a couple of years to give upstream KVM a chance to trickle down.
>=20
> Thanks,
> Nick
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--cQRKO6j9ux8JwjfT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmIMhHAACgkQgypY4gEw
YSI7CxAAqF3Wm6aAcykMmJLiGtDxvqRyN4TNXP2RLYAjwFlJfGdN9wEFA3+bqs8i
l/9mZEnKQbJFPsniItPVfplt2blWFX3/XvWKyHfiy7gz/PxR6SDw/Yfjo9E7lPpe
Q5iC7qeIOiweaKe6IThaNcEnlZrLxz7aBk9dH0ibtC1u2HTdFTvWzwS8LFBvWCHY
jFpOlXIKSY+H5gwIA5mCOLN4tyGv/oS6rIUkN/+Z24RgsoCfsBVRqBDWzWt91VMa
Ny8y1eLTrunSDm6Duza6iJ7a1ALYT0ilFyy6IuVo79FQY2eWt5JyyroZquqY2Emm
ZDOrzrCpvBkEvyik69JI+Ri4xWKk5e+g6cIS+TCkAcVuNndRn7Ql8w1uPI8tLNW1
peiktD8h2ILK7zFKs5bjnHMncPlYUOSkzeLeVen0kbtlFTP8b2DtVBhYwuWudmvj
0lDXg+VrfaCwPXETEF/IvMZKJJBhXbhNqdw0NsM2D6NTxZaq0DANVsDWEsXP4iWj
Tl+E0nhwIYI+IKASyXiR80LbIKN+sADWEinvbwNmMVz7e/wXmUDaFJSVnmOawoye
PTg4xVy3VmeA05o7mFA8jktQ+ZtStrCjTMtjx8S/HzDKE0HxSOyoZOhBR4M5TMEZ
Y2YDWwPdUAycguDKz0iCFYYXahY/IS2yCNKq4jwNW2dPvHCoLlI=
=0ztb
-----END PGP SIGNATURE-----

--cQRKO6j9ux8JwjfT--

