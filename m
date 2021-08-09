Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5925E3E442C
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 12:49:07 +0200 (CEST)
Received: from localhost ([::1]:38810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD2q5-0005se-4J
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 06:49:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mD2lN-0002VR-BZ; Mon, 09 Aug 2021 06:44:09 -0400
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:38719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mD2lL-0007x3-IW; Mon, 09 Aug 2021 06:44:09 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id C4104580D78;
 Mon,  9 Aug 2021 06:44:04 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Mon, 09 Aug 2021 06:44:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=On35wC3bmwZKs9VsdtyPRPFix8w
 fUv1pA0CvbS7D1HA=; b=FpFOvlD/9gA0ofPAaKaLOhjazhcwwBhfYNAslba7dy1
 8oHFCz3aQHCRjsQpdZGY8fyqk58YFPqa4qcmhx9dP1npkNrOOngQrY1vAOLnrJKn
 88mlMdmebNiDo7D//4wY0bW/mLr/YsjE8jXtGKrYIQraJT566iSlw60RF1qsfkFW
 p1stzb3BZjtfQDAk7fOF2q538GD/V7+wXmDN+ZlPGeb3tCbcRX3AKaYfQ36ZKw3U
 rDYSqcQk0FuthVQAkYugC3nNVPYhhOULtenUe6k3dGREOU4IcCdjQaFyRLxI61CJ
 DvdPkjEPnM720hvc2nRlixkEQ5u0HSvs66CAr7L5j2w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=On35wC
 3bmwZKs9VsdtyPRPFix8wfUv1pA0CvbS7D1HA=; b=S+gifIDTd4fvYU4RS+fALr
 li4/O5caIhPVRmdHEanp39AvoFYbbud2G7IbabqFREaNLG9e5B7BkWcC9SbSCDsf
 k+bgLnkY0ojNooVZz+VZT7yGI7Y2kXvi91ORbIh+hTqlvMvc3sy+pJ492GesYQJ4
 agJnUDZk6TtLKEyperM77bnHkuiIDDMaFDEsLuftmo7Ace+ub2JRbSUxN5PriaFV
 cYVogLX3dDAD5rQtVG3DtcWpimFyLsZa3XUJpHVvN9Wg4u4DzmBRPO7u8aRLabgs
 64qjOE2rWJ/pMmY+kuiyPq+Z33XUVbgZ0Vhi/GP/L3eLNWto7UOk19e73fkmgdbg
 ==
X-ME-Sender: <xms:8wYRYU8lhdd7W72DnrKqEWD_lBzDhUD1ZqtTcaAm4z9fBmcO5AsVRw>
 <xme:8wYRYcv4_5G_FgLuEco0W-4daKQUxymFse6QqNAl5jGbsJc5Buu8L_aIr7iVOrBD9
 mzFOIhfZRAd-3Jmv2o>
X-ME-Received: <xmr:8wYRYaCoB4Bog8ampmzMh6HfGKY-Iz9ibdFd8PkRR8qOtGqWHi6zw_pYqd7kzYPJ0s9v8nOdIyb9n8i40bp3yCv3ffUluIxdU4t7SejsowEWFkkq7A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrjeejgdefvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepfeefgfdvleeitdehhfevffegleduieffgfdujeeuhfeluddthffgjeegkefhkedt
 necuffhomhgrihhnpehuuhhiugdruggrthgrnecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:8wYRYUf4Jd21V7J9DISg0dPsk4S6W3hzgWv-TJzqw6TAwCZvWQNDOw>
 <xmx:8wYRYZNE8vU9dDSQv8AYrb_C2JIavs1-J03Jfdw6kbUey9giKD1jww>
 <xmx:8wYRYengLZQXDBjmHgq2ytI2VqCc5Im4NkZwFjF5dl-VgUKxo7XDcg>
 <xmx:9AYRYen_kYP5Y1B-GtTuESoYsTSFFIEWbT0XPs3buPqTYCiJr7Nz9A>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 9 Aug 2021 06:44:01 -0400 (EDT)
Date: Mon, 9 Aug 2021 12:44:00 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL 06/23] hw/nvme: namespace parameter for EUI-64
Message-ID: <YREG8BuwApcdqUKu@apples.localdomain>
References: <20210629184743.230173-1-its@irrelevant.dk>
 <20210629184743.230173-7-its@irrelevant.dk>
 <CAFEAcA-Xodpue0bUBbG++-CcRPV-+EJh=qw_23aGPEh3sAk0Ow@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Fsr34rThe80btTmW"
Content-Disposition: inline
In-Reply-To: <CAFEAcA-Xodpue0bUBbG++-CcRPV-+EJh=qw_23aGPEh3sAk0Ow@mail.gmail.com>
Received-SPF: pass client-ip=66.111.4.229; envelope-from=its@irrelevant.dk;
 helo=new3-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 QEMU Developers <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Klaus Jensen <k.jensen@samsung.com>,
 Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--Fsr34rThe80btTmW
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Aug  9 11:18, Peter Maydell wrote:
> On Tue, 29 Jun 2021 at 19:48, Klaus Jensen <its@irrelevant.dk> wrote:
> >
> > From: Heinrich Schuchardt <xypron.glpk@gmx.de>
> >
> > The EUI-64 field is the only identifier for NVMe namespaces in UEFI dev=
ice
> > paths. Add a new namespace property "eui64", that provides the user the
> > option to specify the EUI-64.
>=20
> Hi; Coverity complains about some uses of uninitialized data in this
> code (CID 1458835 1459295 1459580). I think the bug was present in
> the previous version of this function, but this was the last change
> to touch it...
>=20
> > diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
> > index 7dea64b72e6a..762bb82e3cac 100644
> > --- a/hw/nvme/ctrl.c
> > +++ b/hw/nvme/ctrl.c
> > @@ -4426,19 +4426,19 @@ static uint16_t nvme_identify_ns_descr_list(Nvm=
eCtrl *n, NvmeRequest *req)
> >      NvmeIdentify *c =3D (NvmeIdentify *)&req->cmd;
> >      uint32_t nsid =3D le32_to_cpu(c->nsid);
> >      uint8_t list[NVME_IDENTIFY_DATA_SIZE] =3D {};
> > -
> > -    struct data {
> > -        struct {
> > -            NvmeIdNsDescr hdr;
> > -            uint8_t v[NVME_NIDL_UUID];
> > -        } uuid;
> > -        struct {
> > -            NvmeIdNsDescr hdr;
> > -            uint8_t v;
> > -        } csi;
> > -    };
> > -
> > -    struct data *ns_descrs =3D (struct data *)list;
> > +    uint8_t *pos =3D list;
> > +    struct {
> > +        NvmeIdNsDescr hdr;
> > +        uint8_t v[NVME_NIDL_UUID];
> > +    } QEMU_PACKED uuid;
> > +    struct {
> > +        NvmeIdNsDescr hdr;
> > +        uint64_t v;
> > +    } QEMU_PACKED eui64;
> > +    struct {
> > +        NvmeIdNsDescr hdr;
> > +        uint8_t v;
> > +    } QEMU_PACKED csi;
>=20
> Here we define locals 'uuid', 'eui64', 'csi', without an initializer.
>=20
> >      trace_pci_nvme_identify_ns_descr_list(nsid);
> >
> > @@ -4452,17 +4452,29 @@ static uint16_t nvme_identify_ns_descr_list(Nvm=
eCtrl *n, NvmeRequest *req)
> >      }
> >
> >      /*
> > -     * Because the NGUID and EUI64 fields are 0 in the Identify Namesp=
ace data
> > -     * structure, a Namespace UUID (nidt =3D 3h) must be reported in t=
he
> > -     * Namespace Identification Descriptor. Add the namespace UUID her=
e.
> > +     * If the EUI-64 field is 0 and the NGUID field is 0, the namespac=
e must
> > +     * provide a valid Namespace UUID in the Namespace Identification =
Descriptor
> > +     * data structure. QEMU does not yet support setting NGUID.
> >       */
> > -    ns_descrs->uuid.hdr.nidt =3D NVME_NIDT_UUID;
> > -    ns_descrs->uuid.hdr.nidl =3D NVME_NIDL_UUID;
> > -    memcpy(&ns_descrs->uuid.v, ns->params.uuid.data, NVME_NIDL_UUID);
> > +    uuid.hdr.nidt =3D NVME_NIDT_UUID;
> > +    uuid.hdr.nidl =3D NVME_NIDL_UUID;
> > +    memcpy(uuid.v, ns->params.uuid.data, NVME_NIDL_UUID);
>=20
> Here we fill in some fields of uuid, but we don't touch uuid.hdr.rsvd2[],
> which remains thus 2 bytes of uninitialized junk from our stack.
>=20
> > +    memcpy(pos, &uuid, sizeof(uuid));
>=20
> Here we copy all of uuid to a buffer which we're going to hand
> to the guest, so we've just given it two bytes of QEMU stack data
> that it shouldn't really be able to look at.
>=20
> > +    pos +=3D sizeof(uuid);
>=20
> >
> > -    ns_descrs->csi.hdr.nidt =3D NVME_NIDT_CSI;
> > -    ns_descrs->csi.hdr.nidl =3D NVME_NIDL_CSI;
> > -    ns_descrs->csi.v =3D ns->csi;
> > +    if (ns->params.eui64) {
> > +        eui64.hdr.nidt =3D NVME_NIDT_EUI64;
> > +        eui64.hdr.nidl =3D NVME_NIDL_EUI64;
> > +        eui64.v =3D cpu_to_be64(ns->params.eui64);
> > +        memcpy(pos, &eui64, sizeof(eui64));
> > +        pos +=3D sizeof(eui64);
> > +    }
> > +
> > +    csi.hdr.nidt =3D NVME_NIDT_CSI;
> > +    csi.hdr.nidl =3D NVME_NIDL_CSI;
> > +    csi.v =3D ns->csi;
> > +    memcpy(pos, &csi, sizeof(csi));
> > +    pos +=3D sizeof(csi);
>=20
> We do the same thing for the rsvd2[] bytes in csi.hdr and eui64.hdr.
>=20
> >      return nvme_c2h(n, list, sizeof(list), req);
> >  }
>=20
> Explicitly zero-initializing uuid, csi, eui64 with "=3D { }" would
> be the most robust fix. If you think it's worth avoiding "zero
> init and then overwrite 90% of the fields anyway" then you could
> explicitly zero the .hdr.rsvd2 bytes.
>=20

Thanks Peter,

Fix posted!

--Fsr34rThe80btTmW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmERBuoACgkQTeGvMW1P
Den33QgAkaToWtakbo8HxW0EPIfAmJyvYkTNv5qkhkOmwa0wzMmHvgIV5skYpECr
4CBJiW/g9xIvlc8XfNy+Xm9xKM11b9xvI9+nRmUKqYcP0ZNt/uAlW28wdcDwt1Uu
p2SGmkXNffvAfR0PPxE6JfpkwsL7UoJt+x9BqNk0snqydAC+2tc0UENgXu7qWLYl
prHoQolDRsn4j01dRrN9dWo6hRAd0fa0mJ5aMsJFMv8coo4Xa98Zp/3WP3Zwq61u
WE4b8X83Uc5f/l+6o2pqOuUOpoNl3yrJGCKgUvwehaN6KwxO8WQh0Xxe2sDQ1tFe
fEjnvD80h8hvYUbP0MpD0DU3YFK6bQ==
=5BAO
-----END PGP SIGNATURE-----

--Fsr34rThe80btTmW--

