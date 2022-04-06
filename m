Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B25F4F59CC
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Apr 2022 11:28:25 +0200 (CEST)
Received: from localhost ([::1]:36862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nc1xf-0003sV-VT
	for lists+qemu-devel@lfdr.de; Wed, 06 Apr 2022 05:28:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nc1mT-0008AR-DH
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 05:16:49 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:52727
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1nc1mO-0007U4-Jz
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 05:16:47 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4KYJmM49Htz4xYM; Wed,  6 Apr 2022 19:16:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1649236595;
 bh=9CO950XJarjSV1QuqN1orxTP1l3rSgVtLlCnDhfjxtk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VgR/K26HuzCVUtmShZawCyHIntm0aEcQ9GN9KqZ9qAD87zwpv4K9ssJ0o+J98tH2i
 Ca+P1IFE51023vXIWMnPdePaCsr5egI5UivsQsmSrzhnyN/HufJSbStvOAzJL7YKNx
 Jg5CjfbCRTyTf9KP4jS0/fzzQYRbJWrNHk7Inh5k=
Date: Wed, 6 Apr 2022 11:49:55 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [RFC PATCH 1/1] kvm-all.c: hint Valgrind that kvm_get_one_reg()
 inits memory
Message-ID: <Ykzxw4C1Za8Di5Wm@yekko>
References: <20220405130439.44253-1-danielhb413@gmail.com>
 <20220405130439.44253-2-danielhb413@gmail.com>
 <CAFEAcA-YkrrhFsGg0eWdQgU_VR4cSX5tLnHYCk8tK77cb-9Grg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="158IyPDkpUfY174J"
Content-Disposition: inline
In-Reply-To: <CAFEAcA-YkrrhFsGg0eWdQgU_VR4cSX5tLnHYCk8tK77cb-9Grg@mail.gmail.com>
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_06_12=1.543,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--158IyPDkpUfY174J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 05, 2022 at 03:30:26PM +0100, Peter Maydell wrote:
> On Tue, 5 Apr 2022 at 14:07, Daniel Henrique Barboza
> <danielhb413@gmail.com> wrote:
> >
> > There is a lot of Valgrind warnings about conditional jump depending on
> > unintialized values like this one (taken from a pSeries guest):
> >
> >  Conditional jump or move depends on uninitialised value(s)
> >     at 0xB011DC: kvmppc_enable_cap_large_decr (kvm.c:2544)
> >     by 0x92F28F: cap_large_decr_cpu_apply (spapr_caps.c:523)
> >     by 0x930C37: spapr_caps_cpu_apply (spapr_caps.c:921)
> >     by 0x955D3B: spapr_reset_vcpu (spapr_cpu_core.c:73)
> > (...)
> >   Uninitialised value was created by a stack allocation
> >     at 0xB01150: kvmppc_enable_cap_large_decr (kvm.c:2538)
> >
> > In this case, the alleged unintialized value is the 'lpcr' variable that
> > is written by kvm_get_one_reg() and then used in an if clause:
> >
> > int kvmppc_enable_cap_large_decr(PowerPCCPU *cpu, int enable)
> > {
> >     CPUState *cs =3D CPU(cpu);
> >     uint64_t lpcr;
> >
> >     kvm_get_one_reg(cs, KVM_REG_PPC_LPCR_64, &lpcr);
> >     /* Do we need to modify the LPCR? */
> >     if (!!(lpcr & LPCR_LD) !=3D !!enable) { <---- Valgrind warns here
> > (...)
> >
> > A quick fix is to init the variable that kvm_get_one_reg() is going to
> > write ('lpcr' in the example above). Another idea is to convince
> > Valgrind that kvm_get_one_reg() inits the 'void *target' memory in case
> > the ioctl() is successful. This will put some boilerplate in the
> > function but it will bring benefit for its other callers.
>=20
> Doesn't Valgrind have a way of modelling ioctls where it
> knows what data is read and written ? In general
> ioctl-using programs don't need to have special case
> "I am running under valgrind" handling, so this seems to
> me like valgrind is missing support for this particular ioctl.

I think that's true, but would obviously have a much larger lead time
- someone would need to figure out how to add support for this
specific ioctl() (handling any ambiguity about what type of fd we're
dealing with), get it merged then we'd need to update to the new
valgrind to get the benefits.

> More generally, how much use is running QEMU with KVM enabled
> under valgrind anyway? Valgrind has no way of knowing about
> writes to memory that the guest vCPUs do...

Those should be limited to the guest memory area though, which as
mmap()ed space would already be considered initialized, I believe.  If
there's some fancy data race checking tool for valgrind then that
might be a problem, but for just the normal memcheck tool, I don't
think it should be an issue.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--158IyPDkpUfY174J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmJM8b0ACgkQgypY4gEw
YSIOzQ/8C0iY9UfBkkSUmCttklfyjTRlJ7Kph0sPB/gQttq933PP/LcTCZOaqsav
AlGxfCTFsGMmpkAzpM5s2xyfTMUi1ZsnHEguSaCPp77TukcZS6f9eMccr66LGhvr
p9iw2vPqlG5IMCi4dbQNtJL7+csUV0RLdC/uhFTVZZD9REOOKAieNPhFnfYO3v/t
p9hMi5gETp/Y0hIU5J8yp1Gp06sUAETWWJC0sXIkA8UXzDvOR7Ks7/68Y0yaI7w9
QBEg0qJzbZ+PFSmdU3yJUrMdcmPqtoQOFZXgZI4SDy9nc/fZ6cvMuEqooJGs7Uhw
ZsMPC9rgucUz/Oyebko4WkPWkXticUMCMAnPojCf78V70J6g1gjiC+NNp3qaG2w9
CAhEpBAnZNdywMbM5NOicGQChlU9kF+YxIUq5nrGpRJmeWBwSEcf9giJpQx7AEdt
CN0A0KoqgT07w1/tFqz40YixYrB83bUIkBUQHmdjTXsKTIfCUmYVXIq2qSb/MUxr
30zWV8kIowONFxW/ku5ZBrKlEo3gP7YpuAti1hTWNjNXtY+0K02sZMxC+l+sA4E2
085m2/qQAJs/Tx4za6utBm0CRoNmMRBtvq07KKhUJnLbkSe9YDwlFv7hCYdG63z4
VkfKiXpnajf2xL0eLTzkOce/gflUyJdeCxw0v/8MNWdLVSQNqJk=
=rfyM
-----END PGP SIGNATURE-----

--158IyPDkpUfY174J--

