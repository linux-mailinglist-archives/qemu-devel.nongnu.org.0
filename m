Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF643A7577
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 05:57:24 +0200 (CEST)
Received: from localhost ([::1]:41004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lt0CZ-0008Hx-VM
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 23:57:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lt0Bf-0007cS-Cp
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 23:56:27 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:40205 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lt0Bc-0005Z8-CL
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 23:56:26 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4G3vcy2PL2z9sW8; Tue, 15 Jun 2021 13:56:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1623729378;
 bh=CEJh1FIgiET4rGjA8MVjjoOYIbqcBVERc5vw1EkOkbM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ku3KMVfpMUu7zBsrS7SH3jaViBCV95HgRCB9Y6v1i2BGT36JBLSJvPx6ThZ33hrZJ
 ti2HzQPqjDjUbWEZkb/hC3brdlHkSJeQxopvEB+VwuG0ekJytiMDXGIFs9YYJm1w3g
 a9G4TnfKschUavC180iOIVJimb3ccCyPQBjNLgS4=
Date: Tue, 15 Jun 2021 12:08:05 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: John Snow <jsnow@redhat.com>
Subject: Re: [RFC] GitLab issue tracker labeling process: arch/target, os,
 and accel labels
Message-ID: <YMgLha7YL8XYrShS@yekko>
References: <0a19af15-2f34-4934-c6c9-113e49f5f1f2@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="wbTKwkjuWAE5gAor"
Content-Disposition: inline
In-Reply-To: <0a19af15-2f34-4934-c6c9-113e49f5f1f2@redhat.com>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>, Max Filippov <jcmvbkbc@gmail.com>,
 Taylor Simpson <tsimpson@quicinc.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Marek Vasut <marex@denx.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Kamil Rytarowski <kamil@netbsd.org>, Reinoud Zandijk <reinoud@netbsd.org>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Michael Rolnik <mrolnik@gmail.com>, Stafford Horne <shorne@gmail.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Chris Wulff <crwulff@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--wbTKwkjuWAE5gAor
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 14, 2021 at 01:32:11PM -0400, John Snow wrote:
> Hi, I'd like to work out our collective preferences for how we triage iss=
ues
> that concern the execution environment; namely the arch (now "target", os,
> and accel labels.
>=20
> If you're CC'd on this mail, you're either listed as a TCG maintainer, a
> target maintainer, or have been heavily involved in the GitLab issue trac=
ker
> migration process. You might care about how we triage and file these issu=
es.
>=20
> I'm sending the mail because I've been (so far) responsible for a lot of =
the
> labeling as we move over from Launchpad. I'll need to change my process to
> accommodate what our maintainers want to see. (And to encourage others to
> join in on the triage process.)
>=20
> As of right now, there's no formal process or document for how we use any=
 of
> the labels -- Thomas and I had been only informally collaborating in our
> usage of them as we migrated from Launchpad. Thomas has a script he uses =
to
> move the bugs, so I usually don't edit these labels until I give him a he=
ads
> up so I don't break his script.
>=20
> Let's discuss what changes we need to make and collaborate on when and how
> we'll make them.

In general, what's the convention when a bug is independent of (say)
the accel: does it get none of the accel tags, or all of them?
Likewise with OS and the other categories.

> # Accel
>=20
> Currently "accel: XXX", for HAX, HVF, KVM, TCG, WHPX and Xen.
>=20
> https://gitlab.com/qemu-project/qemu/-/labels?subscribed=3D&search=3Dacce=
l%3A
>=20
> Multiple accel labels can be applied to an issue, not just one. The intent
> was to allow for issues that may impact multiple accelerators, though that
> case may be rare.
>=20
> I think these are reasonably straightforward and unambiguous, though for
> some qemu-system reports it's not always evident which accelerator applies
> right away without more info. The accel tag is often omitted because of t=
his
> uncertainty.
>=20
> I'd like to keep the mapping here 1:1 against ACCEL_CLASS_NAME if I can. =
It
> makes the mapping from CLI to accel tag fairly straightforward.
>=20
> We technically lack a "qtest" accel tag for that parity. It could be adde=
d,
> but it's likely not actually useful versus the "tests" label. It's not
> really a user-facing accelerator.
>=20
> I see we also have a new "nvmm" accelerator, too, which should now be add=
ed
> here.
>=20
> RTH raises the issue of the "TCI" subsystem of TCG, which is not a full
> accelerator in its own right, but (I think) a special case of TCG. If I k=
eep
> the 1:1 mapping to ACCEL_CLASS_NAME, "accel: TCI" is inappropriate.
>=20
> Some suggestions:
> - "TCI" by itself, simple enough.
> - "TCG-TCI" or "TCG: TCI" or "TCG/TCI" or similar, so that it shows up in
> label search when you search for 'tcg'.
> - "accel: TCG:TCI". Similar to above but uses the "accel:" prefix too.
>=20
> My only concern here is completeness of the label: this one seems like it=
's
> at particular risk of being forgotten or lost. It works perfectly well as=
 an
> organizational bucket for people working on TCI, but I wonder if it will
> work well as an "issue inbox". Intended use begins to matter here. Your
> thoughts, Stefan?
>=20
>=20
> # OS
>=20
> Currently "os: XXX" for BSD, Linux, Windows, and macOS.
>=20
> https://gitlab.com/qemu-project/qemu/-/labels?subscribed=3D&search=3Dos%3A
>=20
> Multiple OS labels can be applied to an issue.
>=20
> Originally, we kept this label somewhat vague and have been using it to
> identify both the host AND guest involved with an issue.
>=20
> Stefan Weil has requested that we refactor this to separate the concerns =
so
> that he can identify issues where Windows is the host without wading thro=
ugh
> numerous reports where Windows is merely the guest. Reasonable request.
>=20
> Shall we split it into "host: XXX" and "guest: XXX" for {BSD, Linux,
> Windows, macOS}?

I think that would be a good idea.  Except maybe "host-os" and
"guest-os", because "host" in particular is ambiguous with host
architecture. (not relevant that often, but sometimes).

> This isn't too hard to do at initial triage time, but we'll need to sift
> through the bugs we've labeled so far and re-label them. Help on this wou=
ld
> be appreciated. I would prefer we create a *new* set of labels and then d=
raw
> down on the old labels instead of just renaming them. That way, the old
> label can be used as a re-triage queue.

That seems like the right way to do it to me.

> # arch/target
>=20
> Currently "target: XXX" for alpha, arm, avr, cris, hexagon, hppa, i386,
> m68k, microblaze, mips, nios2, openrisc, ppc, riscv, rx, s390x, sh4, spar=
c,
> tricore, xtensa.
>=20
> https://gitlab.com/qemu-project/qemu/-/labels?subscribed=3D&search=3Dtarg=
et%3A
>=20
> The names map 1:1 to the directories in target/.
> The names in [square brackets] in the label descriptions correspond 1:1 w=
ith
> the SysEmuTarget QAPI enum defined in qapi/machine.json.
>=20
> Multiple target labels can be applied to an issue. Originally, this was
> named "arch", so this was to allow multiple architectures to be specified=
 to
> cover the host/guest environment. If we disentangle this, we may still wa=
nt
> to allow multiple labels to cover bugs that might affect multiple targets,
> though that case might be rare.

Agreed.  I think mixing host and guest properties together is a bad
idea.  These are relatively rarely related to each other.
Bugs affecting multiple, but not all targets are uncommon, but not
super rare (mostly due to chunks of code shared across several target
archs, like ACPI and device tree).

> Recently, we renamed this from "arch: XXX" to "target: XXX", though the
> label had been being used for both the host and guest architecture, so th=
is
> will need to be re-audited to remove cases where the label had been appli=
ed
> for the host architecture.

Oops.

> We probably want to keep a set of labels that apply to the host
> architecture. These are useful for build failures, environment setup issu=
es,
> or just documenting the exact environment on which an issue was observed.

Ah.. that's another general question.  Are the labels supposed to
document where the problem has been definitely observed, or a best
estimate at where it will appear.  It would be very common for a bug
to be observed initially on only one, but quickly turn out to be
independent of host and/or target arch.

> We won't likely require the full set of targets to be duplicated for this
> purpose: possibly just the most common ones. I assume those are:
>=20
> arm, i386, ppc, s390x
>=20
> How should we tag those? "host-arch: XXX"?
>=20
> What I would like to avoid is creating labels like "host: windows-i386"
> where the cross matrix of ({host,guest} X OS x ARCH) starts to require
> ever-increasing specificity of initial triage labels and may increase the
> risk of overly-specified bugs going unnoticed. Maybe my concern is
> unfounded, but I think the over-specificity will hurt more than help at t=
his
> stage.
>=20
>=20
> # Current Plan
>=20
> - Add "accel: NVVM" label
> - Don't add "accel: qtest".
> - Add "host: {Windows, BSD, Linux, macOS}" and "guest: {Windows, BSD, Lin=
ux,
> macOS}" labels.

Again, I suggest "host-os" and "guest-os"

> - Migrate "os: XXX" labels to the above split. Help wanted.
> - Remove the "os: XXX" labels when the above is done.
> - Re-audit "target: XXX" labels and remove usages that applied to the host
> instead of the guest. Help wanted. Possibly assign new host-arch labels.
> - Create a document in /docs/devel/gitlab-process.rst based on the outcome
> of this thread to formalize our decisions and reasonings. Future patches =
to
> this doc can serve as the discussion point for changing that process. The=
re
> are other topics to discuss beyond these labels as well, but these three
> topics felt like the most pressing to address given where we are in our
> Launchpad migration process.
>=20
>=20
> Less sure:
>=20
> - Create host-arch: XXX labels (Unsure of name, which platforms are
>   important to track? see above.)

Maybe leave and see if looks like it would be useful?

> - Create "TCG: TCI" label (Unsure of naming)
>=20
>=20
> Thanks,
> --js
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--wbTKwkjuWAE5gAor
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmDIC4MACgkQbDjKyiDZ
s5INORAA1kglrmalYTRrWI0r8bNF7D04NOLgd8aOE+mdILbLYlbXV1BS5Q/PIcsF
zDQJ8Va+U5W1yEKr/YYCXgTzq6JGujSqFqE3+v+dAsPb1sfRcicvUXXJlU8YoTIW
IulvxX4q/vx5//UmcXI9LBxNDJaWQyH+kPGbNjUGR/+z13PZnE/ytbtxSh2gUxWB
nJZFzerjwoFjE9IfCpiRDylvgCCSvuLlBOuorUeb4q1JGRWCFNqOcYmzB8ZMC4Is
exo11iIz/kQHM+YAF1rkkRpOziCvsfXBRg4hVsVSSqA5p/w078btjbK9IXCBYfXP
CJn0RQozVO/bSxn2kJTdTDefly0jhuKIFKS7F0+o1PLuSsphWxpeCeCsm3JwwHcn
fBiy6TUwAHeT1YehmzkZmiyZpOhm2aW5yVcrZu4kTSeYkwmUN4XUUR/Z1Vs5a9ji
Kv2wo5i9/3M5PHMj+YZrq5/2ueWD8wSrlqqMhXSTfXQszfcBJnJDjJ2337JVW6Zk
KdTQmTUuKvy7LPnORO3LT1uZ70lr8WB9VM9grUUWpk764sm9khxIJNNwGcxx+eOI
ufpZzQyJdCecA2hTj0Rp/vNf1/En3dNs3982MT7Fd75+80RYegXRv+hQ+l1+Bfjd
D4iSvATN3pEPkhE8ORNKzS6V5111Qz8CR/N+HnJ8tzUcoMMLEoU=
=ELBs
-----END PGP SIGNATURE-----

--wbTKwkjuWAE5gAor--

