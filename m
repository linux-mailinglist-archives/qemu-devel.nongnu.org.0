Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75C65622BA1
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 13:34:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oskHV-0008Fb-9i; Wed, 09 Nov 2022 07:34:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1oskHS-0008ED-Eo; Wed, 09 Nov 2022 07:34:10 -0500
Received: from wout5-smtp.messagingengine.com ([64.147.123.21])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1oskHP-0004jP-75; Wed, 09 Nov 2022 07:34:09 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 106073200065;
 Wed,  9 Nov 2022 07:34:02 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Wed, 09 Nov 2022 07:34:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1667997242; x=1668083642; bh=XF
 mWv0JgrG4RknVWJP4lFQt+MuRAzhI08NSkivEyx/8=; b=GbERFIV7w//fitUyN9
 oldn4j9lK0vfjrYVmu0lG/L9UVguGCdpz76I3WtAlMR8WsTGspckIUPzZCFORdXM
 pT12yCOldglxDBTeNDupYiXJIE7CKCV/XUqKiX/K3Ssv+jvyqKarA/WW+K6KY4qI
 jmPBvsYShcP4xfL0+RiXvwp+nGjFV+xbyW2yEvwfdcgTjfvp3k7El3N6qcnA4LFY
 GRb1A+tV1meYLrg1QlqA5tdWwTRmjfsgYvCB84c0dN8Pi5YA88TcSiSD7iV0ic7v
 PUPK15vIP7LiwtRCDrTxsW/q39yRmiRwf1b5Jy/IyWhmbM8ZnE9/c81XwfWhdCyJ
 5YrA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1667997242; x=1668083642; bh=XFmWv0JgrG4RknVWJP4lFQt+MuRA
 zhI08NSkivEyx/8=; b=vcOT1Cdzm3esGuiV3DYSGt+4VUrEx9UPpX7lWDUHksXC
 INlfO/qF1bZE/O3eU/Cs2PeqzTjhLx62Dg7ObgQ6+CWZ5etdvVSB8juClIhTRzMQ
 +MhipH8wfM/XAe4gHMBlSQbLyqSpAMns1K54LVMKo9zSY7VvLbiO8cURrXM1RgTi
 FRlrWz2Ghz9Ab7BdTjP/A9ll430oyjq9dfpfbxhlKN0bzbSetDqdeVbqWOGERmM6
 PB8aFOgVG40RtaIpQArkbYy1ZIZCVlFpP84BN+1PjexgNBV1d0NUIDD2oZ8Ua7FQ
 hHRssA5TP+/W2YgMMFNHTNdKInpbONScXqcVRRSq8g==
X-ME-Sender: <xms:Op5rYyjRdyuDmD5uAoltvfJWnfq0H4y38oc6DR84k6kEhZNfqHXPGA>
 <xme:Op5rYzAaxPAegsrpqgYn9GS_9tS84Lh-w6T2zC8O7V089bnomKH4VWBUeANg91jAm
 zL1Tt88L7xdqbV97C8>
X-ME-Received: <xmr:Op5rY6Gepm6ByEqpN63zEXhmYl95TfdCMLf9VVuJ_D9Qk2zCIetT3vg1YJbDx2NTgtA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrfedvgdegudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgfejfeffvdeuhfeifefhgffgueelhedukeevjeevtdduudegieegteffffej
 veenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:Op5rY7Scxe4q1gv0mwteIqroSZIvssY_Noz-6BmXNAmNSksolvkUEQ>
 <xmx:Op5rY_w0If8Nmj3JWZdIKfNONWUzx2ZFs13EQovwZfrbsGUYhch50w>
 <xmx:Op5rY56T9FdmpV16jrLo8OLgU5Oi58LAPbtEFYDX2w7Wj6vNfoZ44A>
 <xmx:Op5rYxucAVLZkAERxzzk9N1JS9GJJvzGwrMIU1eGwgKm_1iFdUkUFg>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 9 Nov 2022 07:34:00 -0500 (EST)
Date: Wed, 9 Nov 2022 13:33:59 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <k.jensen@samsung.com>
Subject: Re: [PATCH 1/2] hw/nvme: fix incorrect use of errp/local_err
Message-ID: <Y2ueN3dXBSg+GTDh@cormorant.local>
References: <20221109105357.30430-1-its@irrelevant.dk>
 <20221109105357.30430-2-its@irrelevant.dk>
 <87wn84nwf3.fsf@pond.sub.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="WhRm6s0rk4Gjq+mi"
Content-Disposition: inline
In-Reply-To: <87wn84nwf3.fsf@pond.sub.org>
Received-SPF: pass client-ip=64.147.123.21; envelope-from=its@irrelevant.dk;
 helo=wout5-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--WhRm6s0rk4Gjq+mi
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Nov  9 13:29, Markus Armbruster wrote:
> Klaus Jensen <its@irrelevant.dk> writes:
>=20
> > From: Klaus Jensen <k.jensen@samsung.com>
> >
> > Make nvme_check_constraints() return an int and fix incorrect use of
> > errp/local_err.
> >
> > Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> > ---
> >  hw/nvme/ctrl.c | 48 +++++++++++++++++++++++-------------------------
> >  1 file changed, 23 insertions(+), 25 deletions(-)
> >
> > diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
> > index ac3885ce5079..4cc6ae753295 100644
> > --- a/hw/nvme/ctrl.c
> > +++ b/hw/nvme/ctrl.c
> > @@ -7035,7 +7035,7 @@ static const MemoryRegionOps nvme_cmb_ops =3D {
> >      },
> >  };
> > =20
> > -static void nvme_check_constraints(NvmeCtrl *n, Error **errp)
> > +static int nvme_check_params(NvmeCtrl *n, Error **errp)
>=20
> I prefer bool true on success, false on failure.  I use int only when it
> lets me return additional information, such as a non-negative value on
> success, or a negative error code on failure.  nvme_init_pci() is an
> example of the latter (although its caller doesn't care).
>=20
> Local consistency with nvme_init_subsys() is desirable.  You could
> convert it to bool, along with nvme_init_pci().  Or you keep all three
> int.  Up to you.
>=20
> >  {
> >      NvmeParams *params =3D &n->params;
> > =20
> > @@ -7049,38 +7049,38 @@ static void nvme_check_constraints(NvmeCtrl *n,=
 Error **errp)
> >      if (n->namespace.blkconf.blk && n->subsys) {
> >          error_setg(errp, "subsystem support is unavailable with legacy=
 "
> >                     "namespace ('drive' property)");
> > -        return;
> > +        return -1;
> >      }
> > =20
> >      if (params->max_ioqpairs < 1 ||
> >          params->max_ioqpairs > NVME_MAX_IOQPAIRS) {
> >          error_setg(errp, "max_ioqpairs must be between 1 and %d",
> >                     NVME_MAX_IOQPAIRS);
> > -        return;
> > +        return -1;
> >      }
> > =20
> >      if (params->msix_qsize < 1 ||
> >          params->msix_qsize > PCI_MSIX_FLAGS_QSIZE + 1) {
> >          error_setg(errp, "msix_qsize must be between 1 and %d",
> >                     PCI_MSIX_FLAGS_QSIZE + 1);
> > -        return;
> > +        return -1;
> >      }
> > =20
> >      if (!params->serial) {
> >          error_setg(errp, "serial property not set");
> > -        return;
> > +        return -1;
> >      }
> > =20
> >      if (n->pmr.dev) {
> >          if (host_memory_backend_is_mapped(n->pmr.dev)) {
> >              error_setg(errp, "can't use already busy memdev: %s",
> >                         object_get_canonical_path_component(OBJECT(n->p=
mr.dev)));
> > -            return;
> > +            return -1;
> >          }
> > =20
> >          if (!is_power_of_2(n->pmr.dev->size)) {
> >              error_setg(errp, "pmr backend size needs to be power of 2 =
in size");
> > -            return;
> > +            return -1;
> >          }
> > =20
> >          host_memory_backend_set_mapped(n->pmr.dev, true);
> > @@ -7089,64 +7089,64 @@ static void nvme_check_constraints(NvmeCtrl *n,=
 Error **errp)
> >      if (n->params.zasl > n->params.mdts) {
> >          error_setg(errp, "zoned.zasl (Zone Append Size Limit) must be =
less "
> >                     "than or equal to mdts (Maximum Data Transfer Size)=
");
> > -        return;
> > +        return -1;
> >      }
> > =20
> >      if (!n->params.vsl) {
> >          error_setg(errp, "vsl must be non-zero");
> > -        return;
> > +        return -1;
> >      }
> > =20
> >      if (params->sriov_max_vfs) {
> >          if (!n->subsys) {
> >              error_setg(errp, "subsystem is required for the use of SR-=
IOV");
> > -            return;
> > +            return -1;
> >          }
> > =20
> >          if (params->sriov_max_vfs > NVME_MAX_VFS) {
> >              error_setg(errp, "sriov_max_vfs must be between 0 and %d",
> >                         NVME_MAX_VFS);
> > -            return;
> > +            return -1;
> >          }
> > =20
> >          if (params->cmb_size_mb) {
> >              error_setg(errp, "CMB is not supported with SR-IOV");
> > -            return;
> > +            return -1;
> >          }
> > =20
> >          if (n->pmr.dev) {
> >              error_setg(errp, "PMR is not supported with SR-IOV");
> > -            return;
> > +            return -1;
> >          }
> > =20
> >          if (!params->sriov_vq_flexible || !params->sriov_vi_flexible) {
> >              error_setg(errp, "both sriov_vq_flexible and sriov_vi_flex=
ible"
> >                         " must be set for the use of SR-IOV");
> > -            return;
> > +            return -1;
> >          }
> > =20
> >          if (params->sriov_vq_flexible < params->sriov_max_vfs * 2) {
> >              error_setg(errp, "sriov_vq_flexible must be greater than o=
r equal"
> >                         " to %d (sriov_max_vfs * 2)", params->sriov_max=
_vfs * 2);
> > -            return;
> > +            return -1;
> >          }
> > =20
> >          if (params->max_ioqpairs < params->sriov_vq_flexible + 2) {
> >              error_setg(errp, "(max_ioqpairs - sriov_vq_flexible) must =
be"
> >                         " greater than or equal to 2");
> > -            return;
> > +            return -1;
> >          }
> > =20
> >          if (params->sriov_vi_flexible < params->sriov_max_vfs) {
> >              error_setg(errp, "sriov_vi_flexible must be greater than o=
r equal"
> >                         " to %d (sriov_max_vfs)", params->sriov_max_vfs=
);
> > -            return;
> > +            return -1;
> >          }
> > =20
> >          if (params->msix_qsize < params->sriov_vi_flexible + 1) {
> >              error_setg(errp, "(msix_qsize - sriov_vi_flexible) must be"
> >                         " greater than or equal to 1");
> > -            return;
> > +            return -1;
> >          }
> > =20
> >          if (params->sriov_max_vi_per_vf &&
> > @@ -7154,7 +7154,7 @@ static void nvme_check_constraints(NvmeCtrl *n, E=
rror **errp)
> >              error_setg(errp, "sriov_max_vi_per_vf must meet:"
> >                         " (sriov_max_vi_per_vf - 1) %% %d =3D=3D 0 and"
> >                         " sriov_max_vi_per_vf >=3D 1", NVME_VF_RES_GRAN=
ULARITY);
> > -            return;
> > +            return -1;
> >          }
> > =20
> >          if (params->sriov_max_vq_per_vf &&
> > @@ -7163,9 +7163,11 @@ static void nvme_check_constraints(NvmeCtrl *n, =
Error **errp)
> >              error_setg(errp, "sriov_max_vq_per_vf must meet:"
> >                         " (sriov_max_vq_per_vf - 1) %% %d =3D=3D 0 and"
> >                         " sriov_max_vq_per_vf >=3D 2", NVME_VF_RES_GRAN=
ULARITY);
> > -            return;
> > +            return -1;
> >          }
> >      }
> > +
> > +    return 0;
> >  }
> > =20
> >  static void nvme_init_state(NvmeCtrl *n)
> > @@ -7564,7 +7566,6 @@ static void nvme_realize(PCIDevice *pci_dev, Erro=
r **errp)
> >  {
> >      NvmeCtrl *n =3D NVME(pci_dev);
> >      NvmeNamespace *ns;
> > -    Error *local_err =3D NULL;
> >      NvmeCtrl *pn =3D NVME(pcie_sriov_get_pf(pci_dev));
> > =20
> >      if (pci_is_vf(pci_dev)) {
> > @@ -7576,9 +7577,7 @@ static void nvme_realize(PCIDevice *pci_dev, Erro=
r **errp)
> >          n->subsys =3D pn->subsys;
> >      }
> > =20
> > -    nvme_check_constraints(n, &local_err);
> > -    if (local_err) {
> > -        error_propagate(errp, local_err);
> > +    if (nvme_check_params(n, errp)) {
>=20
> If you stick to int, then please use
>=20
>        if (nvme_check_params(n, errp) < 0) {
>=20
> Here's why.
>=20
> A bool-valued function that returns false on error we check like
>=20
>        if (!foo()) {
>=20
> A pointer-valued function that returns null on error we also check like
>=20
>        if (!foo()) {
>=20
> In both cases, convention makes it obvious we're testing for failure.
>=20
> If you check an int-valued function that returns negative on error like
>=20
>        if (foo() < 0) {
>=20
> it's again obvious.
>=20
> However, if you exploit the fact that it returns zero on success in the
> check like
>=20
>        if (foo()) {
>=20
> then convention is of no help to readers.  They need to look up what
> foo() returns to see whether this is checking for success or for
> failure.
>=20
> Makes sense?
>=20

Makes total sense. hw/nvme has traditionally used int return values, but
I definitely agree with your argument.

I'll fix that up (and probably do this across all of hw/nvme for
consistency).

--WhRm6s0rk4Gjq+mi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmNrnjYACgkQTeGvMW1P
DemChQgAq5cC0QUS2XbptAVkOGMHMdfV/nZUYt8Va41Scishycm6lL3RrY6/ab/+
jSkFlNy9AJ9Cj77qmpsuDWTr+DN30ZpmLLByBMhhv16Kww2/U6zLVgUG+1D15/7b
IEDsJPl/HERwRUj7zvxXGZ4AVWBkEQbSmXM3h6VOehA2WVZ9klR/AwDy3g72tN3d
XWCf0gkRkz+VNrNo/O29QNOPT8fP/2q4QRxwwU88R/sutvOzw9Is7wIMqdwgavtn
HLStuxNnCiqbVa1jeZ+aAupVy0hH+WAJJJVQoGiRGOkcLkOxhuD61vVxxFpyjCWf
ymUVYhUFik1Loop4/TJM7crvDNMePQ==
=YYgb
-----END PGP SIGNATURE-----

--WhRm6s0rk4Gjq+mi--

