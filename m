Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B4A236F66C
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 09:31:54 +0200 (CEST)
Received: from localhost ([::1]:50916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcNcv-0003Oi-CT
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 03:31:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lcNaC-0001dz-Hm; Fri, 30 Apr 2021 03:29:04 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:43405)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lcNaA-0001U4-9Z; Fri, 30 Apr 2021 03:29:04 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FWkWQ6CW9z9t0G; Fri, 30 Apr 2021 17:28:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1619767730;
 bh=gLPJgqKD8Jy0MZ43/eLWhxb9UN2yUXhRzMXzf/L4RqA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bkK4V86JuRTxdSdg1PNzLWfbnzF5aA3mWq9gSOaJ9zWZq/3VI/3Jamwq9QCbsHUtJ
 sINIc0FTwhcoOshvMl6yI6RiJdS8BkI5EfMoGSAmP7UqoR9wK6l+au5Aq8IdYJji8l
 kIHavOtWW6jfirQaLdmCPEPOwknnsqQYYdl1MOwQ=
Date: Fri, 30 Apr 2021 14:27:18 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH v4 0/3] nvdimm: Enable sync-dax property for nvdimm
Message-ID: <YIuHJkwkDiHONYwp@yekko>
References: <161966810162.652.13723419108625443430.stgit@17be908f7c1c>
 <YIrW4bwbR1R0CWm/@stefanha-x1.localdomain>
 <433e352d-5341-520c-5c57-79650277a719@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="l6FM2Up3jgp91K+8"
Content-Disposition: inline
In-Reply-To: <433e352d-5341-520c-5c57-79650277a719@linux.ibm.com>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_03_06=1.592,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_PASS=-0.001,
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
Cc: peter.maydell@linaro.org, Shivaprasad G Bhat <sbhat@linux.ibm.com>,
 mst@redhat.com, qemu-devel@nongnu.org, linux-nvdimm@lists.01.org,
 armbru@redhat.com, bharata@linux.vnet.ibm.com, haozhong.zhang@intel.com,
 ehabkost@redhat.com, richard.henderson@linaro.org, groug@kaod.org,
 kvm-ppc@vger.kernel.org, qemu-arm@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, imammedo@redhat.com,
 kwangwoo.lee@sk.com, xiaoguangrong.eric@gmail.com,
 shameerali.kolothum.thodi@huawei.com, shivaprasadbhat@gmail.com,
 qemu-ppc@nongnu.org, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--l6FM2Up3jgp91K+8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 29, 2021 at 10:02:23PM +0530, Aneesh Kumar K.V wrote:
> On 4/29/21 9:25 PM, Stefan Hajnoczi wrote:
> > On Wed, Apr 28, 2021 at 11:48:21PM -0400, Shivaprasad G Bhat wrote:
> > > The nvdimm devices are expected to ensure write persistence during po=
wer
> > > failure kind of scenarios.
> > >=20
> > > The libpmem has architecture specific instructions like dcbf on POWER
> > > to flush the cache data to backend nvdimm device during normal writes
> > > followed by explicit flushes if the backend devices are not synchrono=
us
> > > DAX capable.
> > >=20
> > > Qemu - virtual nvdimm devices are memory mapped. The dcbf in the guest
> > > and the subsequent flush doesn't traslate to actual flush to the back=
end
> > > file on the host in case of file backed v-nvdimms. This is addressed =
by
> > > virtio-pmem in case of x86_64 by making explicit flushes translating =
to
> > > fsync at qemu.
> > >=20
> > > On SPAPR, the issue is addressed by adding a new hcall to
> > > request for an explicit flush from the guest ndctl driver when the ba=
ckend
> > > nvdimm cannot ensure write persistence with dcbf alone. So, the appro=
ach
> > > here is to convey when the hcall flush is required in a device tree
> > > property. The guest makes the hcall when the property is found, inste=
ad
> > > of relying on dcbf.
> >=20
> > Sorry, I'm not very familiar with SPAPR. Why add a hypercall when the
> > virtio-nvdimm device already exists?
> >=20
>=20
> On virtualized ppc64 platforms, guests use papr_scm.ko kernel drive for
> persistent memory support. This was done such that we can use one kernel
> driver to support persistent memory with multiple hypervisors. To avoid
> supporting multiple drivers in the guest, -device nvdimm Qemu command-line
> results in Qemu using PAPR SCM backend. What this patch series does is to
> make sure we expose the correct synchronous fault support, when we back s=
uch
> nvdimm device with a file.
>=20
> The existing PAPR SCM backend enables persistent memory support with the
> help of multiple hypercall.
>=20
> #define H_SCM_READ_METADATA     0x3E4
> #define H_SCM_WRITE_METADATA    0x3E8
> #define H_SCM_BIND_MEM          0x3EC
> #define H_SCM_UNBIND_MEM        0x3F0
> #define H_SCM_UNBIND_ALL        0x3FC
>=20
> Most of them are already implemented in Qemu. This patch series implements
> H_SCM_FLUSH hypercall.

The overall point here is that we didn't define the hypercall.  It was
defined in order to support NVDIMM/pmem devices under PowerVM.  For
uniformity between PowerVM and KVM guests, we want to support the same
hypercall interface on KVM/qemu as well.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--l6FM2Up3jgp91K+8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCLhyUACgkQbDjKyiDZ
s5LgyhAAlNOzpM9+rzQIM9pfnH1Lo94q3+xqmzvHym9PAdeCUa+jekMI00mK5CRI
buhl3VZG783nan5KYvVEIfblxCN2ENHrcoKM/rVNF6QsGkIQGVfCo1kE2Se1kwZS
dDxcyXK/ASz+ryFQAIUvA5LA2/pyR3AsMVOqCcX9DgZjXm1JZt6dE2byZu8+CJXg
oNlXuJab1+vPwBsMV1tITKUic4Zn1WJQSXZ/sn59uEGW69gG1QK113LQtpLqO1r/
R10btoJgqHquWZMQl807XiDqtLzEs/L+UlKKpmR1uD+jZSRy3L/ir9Rf+QeM4DtL
eGsYndvYaDkxmuE4rtDCxBOMi2GNragtsPOHUuNUd4PaA4K/r0EWpNDHJbcKG04X
boMlF+wiM9EyNZyqa6vlULBkDTvgYA3y8MD0QO+jwHggAOsj8UyBIKn2XascQC+u
mWMJJgeEBgq+IiEhnNj3OfOh5GgJiEUHsRj4FomiAWu125NNN0aNK9uXthhd4DGO
RcekZfaPQOkPJh2WG+ZOAreNqdt6aEaJ95lVXD4l9yYh5Vn29wuon5BmvPEfCroW
wUFAbvJSBiXzIXEggoKnQzsPiG6VPenAHanBVTXvHXHN2InCqcNWdwTw5XgrAKn+
lfTdvqXV93uHpQqbjPiiGMzUGoFsFvQFkvZ6H8NnvOQAS78FXus=
=86vq
-----END PGP SIGNATURE-----

--l6FM2Up3jgp91K+8--

