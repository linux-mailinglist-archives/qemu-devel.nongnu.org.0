Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8ADA3486AF
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 02:53:36 +0100 (CET)
Received: from localhost ([::1]:46696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPFBn-00020B-FR
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 21:53:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lPFAp-00014S-GG; Wed, 24 Mar 2021 21:52:35 -0400
Received: from ozlabs.org ([203.11.71.1]:37757)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lPFAm-0007a6-Aa; Wed, 24 Mar 2021 21:52:35 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4F5Slt3rD2z9sWV; Thu, 25 Mar 2021 12:52:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1616637146;
 bh=578Al5e9M3P8A7FL9KWIj1AbQUSGPNviJmWDqgdKWhE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Sv4qKgf3tSVj4hyWiqB27jdFjwm+eu5rdCoZQ3lNNA2nUDlodru3ujxW1ncwJXAln
 O2CQrs2wZMzFPw8p36uqV8zTbcuRHjgsLNmWcXMlvz2NllvuZgdhLg3+xdV+XeZwbJ
 kUDByPSU24uc+W4xEsLHaS7ayK3fSmFffTwT8XPg=
Date: Thu, 25 Mar 2021 12:51:20 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH v3 2/3] spapr: nvdimm: Implement H_SCM_FLUSH hcall
Message-ID: <YFvsmKiXtb+h9HBO@yekko.fritz.box>
References: <161650723087.2959.8703728357980727008.stgit@6532096d84d3>
 <161650725183.2959.12071056430236337803.stgit@6532096d84d3>
 <YFqs8M1dHAFhdCL6@yekko.fritz.box>
 <19b5aa0b-df85-256d-d4c4-eacd0ea8312e@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="u8V1b6udCU1d3X2g"
Content-Disposition: inline
In-Reply-To: <19b5aa0b-df85-256d-d4c4-eacd0ea8312e@linux.ibm.com>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: ehabkost@redhat.com, Shivaprasad G Bhat <sbhat@linux.ibm.com>,
 mst@redhat.com, bharata@linux.vnet.ibm.com, linux-nvdimm@lists.01.org,
 groug@kaod.org, kvm-ppc@vger.kernel.org, qemu-devel@nongnu.org,
 shivaprasadbhat@gmail.com, qemu-ppc@nongnu.org, imammedo@redhat.com,
 sbhat@linux.vnet.ibm.com, xiaoguangrong.eric@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--u8V1b6udCU1d3X2g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 24, 2021 at 09:34:06AM +0530, Aneesh Kumar K.V wrote:
> On 3/24/21 8:37 AM, David Gibson wrote:
> > On Tue, Mar 23, 2021 at 09:47:38AM -0400, Shivaprasad G Bhat wrote:
> > > The patch adds support for the SCM flush hcall for the nvdimm devices.
> > > To be available for exploitation by guest through the next patch.
> > >=20
> > > The hcall expects the semantics such that the flush to return
> > > with H_BUSY when the operation is expected to take longer time along
> > > with a continue_token. The hcall to be called again providing the
> > > continue_token to get the status. So, all fresh requsts are put into
> > > a 'pending' list and flush worker is submitted to the thread pool.
> > > The thread pool completion callbacks move the requests to 'completed'
> > > list, which are cleaned up after reporting to guest in subsequent
> > > hcalls to get the status.
> > >=20
> > > The semantics makes it necessary to preserve the continue_tokens
> > > and their return status even across migrations. So, the pre_save
> > > handler for the device waits for the flush worker to complete and
> > > collects all the hcall states from 'completed' list. The necessary
> > > nvdimm flush specific vmstate structures are added to the spapr
> > > machine vmstate.
> > >=20
> > > Signed-off-by: Shivaprasad G Bhat <sbhat@linux.ibm.com>
> >=20
> > An overal question: surely the same issue must arise on x86 with
> > file-backed NVDIMMs.  How do they handle this case?
>=20
> On x86 we have different ways nvdimm can be discovered. ACPI NFIT, e820 m=
ap
> and virtio_pmem. Among these virio_pmem always operated with synchronous =
dax
> disabled and both ACPI and e820 doesn't have the ability to differentiate
> support for synchronous dax.

Ok.  And for the virtio-pmem case, how are the extra flushes actually
done on x86?

> With that I would expect users to use virtio_pmem when using using file
> backed NVDIMMS

So... should we prevent advertising an NVDIMM through ACPI or e820 if
it doesn't have sync-dax enabled?

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--u8V1b6udCU1d3X2g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmBb7JQACgkQbDjKyiDZ
s5LqoQ//foDYAQMsvdLPPSSbsp6PPud08mSNYDtj7rJc+hBLEtCTMviBZnOgnX50
CHqYTgEziP+UZDdlonHVrfWiZY0OGa8u9MZhKFUbaEoabFt1XX33PrVWNu8w9HsP
CiSpeDmqXvI/eSLqYYK4Z1SvW1OxiSzF0ylx6r7KJTSJvFNvNoyttOfw+ul0PB1e
nHajD2zgdlS/un7+V1nZfaRJoCbas4UpL813Ise2kv+FIBs3qpwlPeoaPuLCbeah
jE4MdCzTsiLxbpQuwpWA1UvQnXa/WEKU0tSxkA76t22wL5lyYjFqPGXCdvLgaqJ2
53tnXPYQthmZ1svoXfS6AK57AtYWtCFehgwv6BF5JusCTk3DBrpBZpXyT12ErLGi
LZo1noXW3QoppEj3a8V8KApRBkY8erNe6bPov3ERt2RNeD+q+HN6GOeeXsdVGKrN
YkeL5mAmjjbyvCL5EIYaqb+in45r29nJUncrfhUzizU7aHgFYc9J75YfAR3pXwQ+
mINgdAqN92+YcePz3iZuj6iFITXO7x13+S7SvD2Tf/vRPkhNzHCiDuV0qIt/Aoh7
b18oDs9FphX4lzVotPQkbUu5fcna//RqAebW2qSZsfEOQuD5nfLh6KHGYgBRP8UK
0/Q82yaiXhZ/FQpD54i6VdZqOO7N9vGy+yWzxJIGrCRlruqDVOI=
=zayB
-----END PGP SIGNATURE-----

--u8V1b6udCU1d3X2g--

