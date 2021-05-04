Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E178437244A
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 03:45:30 +0200 (CEST)
Received: from localhost ([::1]:45684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldk7t-0005FO-Fc
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 21:45:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ldk6T-0004Xm-NF; Mon, 03 May 2021 21:44:01 -0400
Received: from ozlabs.org ([203.11.71.1]:59411)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ldk6R-0005oy-BS; Mon, 03 May 2021 21:44:01 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FZ2gY2NM6z9sT6; Tue,  4 May 2021 11:43:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1620092633;
 bh=3anFEGHjKRDBJBpGN0aquHD3mJDsI32H2+VnbPLeVOM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=P6eZGfba00ncrgKhQYsT9pbqX5+fN+lfIhBajc4eYRtRhC+zBvHTJHxp1ONL2GWvv
 vL/QusApiUEvubSUSiWvtnxRfO096j++RjpxQ48qp615QNLj3iQSXBpRDrtcHYdweN
 m2o+noyZ5mUla3ZFvFQ/TuEQXMKerGhdCrtOj+kM=
Date: Tue, 4 May 2021 11:21:13 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH v4 1/3] spapr: nvdimm: Forward declare and move the
 definitions
Message-ID: <YJChiYgt6AAjhnIe@yekko>
References: <161966810162.652.13723419108625443430.stgit@17be908f7c1c>
 <161966811094.652.571342595267518155.stgit@17be908f7c1c>
 <f33dfff6-a1f7-244f-531e-ef0d93ad0c3d@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="rqO14lpZiRldN/l1"
Content-Disposition: inline
In-Reply-To: <f33dfff6-a1f7-244f-531e-ef0d93ad0c3d@redhat.com>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: peter.maydell@linaro.org, Shivaprasad G Bhat <sbhat@linux.ibm.com>,
 mst@redhat.com, qemu-devel@nongnu.org, linux-nvdimm@lists.01.org,
 aneesh.kumar@linux.ibm.com, armbru@redhat.com, bharata@linux.vnet.ibm.com,
 haozhong.zhang@intel.com, ehabkost@redhat.com, richard.henderson@linaro.org,
 groug@kaod.org, kvm-ppc@vger.kernel.org, qemu-arm@nongnu.org,
 stefanha@redhat.com, imammedo@redhat.com, kwangwoo.lee@sk.com,
 xiaoguangrong.eric@gmail.com, shameerali.kolothum.thodi@huawei.com,
 shivaprasadbhat@gmail.com, qemu-ppc@nongnu.org, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--rqO14lpZiRldN/l1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 03, 2021 at 01:23:47PM -0500, Eric Blake wrote:
> On 4/28/21 10:48 PM, Shivaprasad G Bhat wrote:
> > The subsequent patches add definitions which tend to
> > get the compilation to cyclic dependency. So, prepare
> > with forward declarations, move the defitions and clean up.
>=20
> definitions
>=20
> >=20
> > Signed-off-by: Shivaprasad G Bhat <sbhat@linux.ibm.com>
> > ---
> >  hw/ppc/spapr_nvdimm.c         |   12 ++++++++++++
> >  include/hw/ppc/spapr_nvdimm.h |   14 ++------------
> >  2 files changed, 14 insertions(+), 12 deletions(-)
> >=20
> > diff --git a/hw/ppc/spapr_nvdimm.c b/hw/ppc/spapr_nvdimm.c
> > index b46c36917c..8cf3fb2ffb 100644
> > --- a/hw/ppc/spapr_nvdimm.c
> > +++ b/hw/ppc/spapr_nvdimm.c
> > @@ -31,6 +31,18 @@
> >  #include "qemu/range.h"
> >  #include "hw/ppc/spapr_numa.h"
> > =20
> > +/*
> > + * The nvdimm size should be aligned to SCM block size.
> > + * The SCM block size should be aligned to SPAPR_MEMORY_BLOCK_SIZE
> > + * inorder to have SCM regions not to overlap with dimm memory regions.
>=20
> And while at it, even though it is code motion...

It looks like the patch no longer applies clear to ppc-for-6.1, so can
you rebase and fix up Eric's nitpicks at the same time?

>=20
> > + * The SCM devices can have variable block sizes. For now, fixing the
> > + * block size to the minimum value.
> > + */
> > +#define SPAPR_MINIMUM_SCM_BLOCK_SIZE SPAPR_MEMORY_BLOCK_SIZE
>=20
> > +++ b/include/hw/ppc/spapr_nvdimm.h
> > @@ -11,19 +11,9 @@
> >  #define HW_SPAPR_NVDIMM_H
> > =20
> >  #include "hw/mem/nvdimm.h"
> > -#include "hw/ppc/spapr.h"
> > =20
> > -/*
> > - * The nvdimm size should be aligned to SCM block size.
> > - * The SCM block size should be aligned to SPAPR_MEMORY_BLOCK_SIZE
> > - * inorder to have SCM regions not to overlap with dimm memory regions.
>=20
> ... this should be "in order"
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--rqO14lpZiRldN/l1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCQoYcACgkQbDjKyiDZ
s5K2XhAAnKMU4fHKY8zYm2UkdJJMJZJlnQtfgO1iJQLrmfFszhFekavJzaRx/xT0
gudfIWjcqRomM3jzQQq5LbEr/XH4w8ws+PF1kPTetjO7gSQepyO9krepcPmiciJ7
My58zSnBNmyNDAgMHzRc2fYNBFxr/XSXxo2ZZidUavG8fZS2h2ftIz8JlTepY9pN
NBOURrUtwcT+gAvpbE7saAVKLFMlRRFN3vU3Aj/vt/1P5gBg7dOEsYhTleDFDske
njhUdtDB8qy0NZba6Mz0Um6hiUZU/xH+YMS7S1ZZcqA8ne08kTELW5cKzjks1NST
/AAIlrHuFckRzGo3xHeTNeBoU76rZCUWXNe8TxmCswUHOlQQELLspIqbMW2/BgNP
XccFpegH/H/qEwe2ZXVM86aOHuSaIwmKmrF96N5sD0WZMLgRA1XXDSc40p+NV67h
p6uGnKotunrlyHIztASEd+/hwenV6nGAAePeuBP2NLQbD+ZaQRDkzMrTmujN1SRj
u68z8XYYO/pSk77mWO0oh9Ao42EVZVLEOHnRqyjsdc/YD3iLm0QP4hDXe6Q9c39Q
sHXBju4en2BPVJme+8yZzobJzHYXKA3E7wJ0PVx57Ra9KToZf7mZdiL7pHffHI1c
XtqKim8cz5xm4OnCloZTghId9DHNgO9maAHFP+xnroRosQwzD4s=
=tiiy
-----END PGP SIGNATURE-----

--rqO14lpZiRldN/l1--

