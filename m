Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E014D2D3576
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 22:41:40 +0100 (CET)
Received: from localhost ([::1]:49462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmkjq-0007RS-VT
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 16:41:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kmjTQ-00031p-D8; Tue, 08 Dec 2020 15:20:36 -0500
Received: from wnew2-smtp.messagingengine.com ([64.147.123.27]:57557)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kmjTI-0002iu-CW; Tue, 08 Dec 2020 15:20:36 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 0786A9F6;
 Tue,  8 Dec 2020 15:20:24 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 08 Dec 2020 15:20:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=/mZLd1fy9kQGHo+fdmPVn2MY0uw
 ygvJ8ZOYTbHq4B4Q=; b=wDrkTAgNOkfQ/FPh7MgJ4aCJM+8n6wEJdeFxjxSWHXD
 Oj3mglJruaZ1FJ/iINPONVUnts/c1wLB2maAuKiAclKhpX7BeWfAg2h6jlFglvoY
 +tiGavAsmmcuh82lAnI/HJq2II/PhmGll7WRHCHpXPk0tWvWe0aeUXtfVW8C3yrj
 nm0G5o/wYmMwmS4b/7RGBNBn0q7dVj9fLxY/4e8OdlFUWRp3FvZ2gXrvYviOjG9d
 CGFVrZmKyoMNy0ym0+3idarLJmhq87+kIXVfCP2M7WoqA3I8zDKCt9gkdjAVSkzl
 W47gPgQSbel0kxb7Rp5ng8CPutgKiWX0252+LHRjg7A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=/mZLd1
 fy9kQGHo+fdmPVn2MY0uwygvJ8ZOYTbHq4B4Q=; b=czKAcci19P/GhvzqZJ/hRR
 /qpGJz379IyEbLLzIYV01Wvt38UyJsUvm2TQS/cp/xpTb8bI14mwMHaDFRJUqQtu
 u7/EsaoabzzOogOeP2HgDswj3R3zD8OkbcbseqghHpJlig0h47TOFqKB9OYIEgR1
 usGAzdc0PiBk3sNTnDUf1wCIoYxYubbQ40L42e5rZRewMh8dtbUY3PY4ZeLnFS3m
 piRiHx/I2MpSVbsJMpaxjIlw+DzOhyTHeZP9QDFA3OWmC//hb3kT5poochQINFQB
 CnCTLmI9v6XsHl+ud8j6YlUA6z97kolzA0X1GZJtA/i0vuCBDRCiojp7Qo1v2/Dw
 ==
X-ME-Sender: <xms:BuDPXyCu01JAXv132FyNyg9pC0JSpeVaVG70TFh4Lbe4vA4AL971Ow>
 <xme:BuDPX8j_BwDr_r8ZC5sZuZY7k4jS28BNM_TpgOseJgwjRWok-MT7qryJdYQrYj5m_
 9Xyf8EXMAVW82MYyZM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudejiedgudefiecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjeegudffueeiteekieelkedvueelteevjeduieeludfffeejgeffhfduvddu
 ffeknecukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:BuDPX1nw9WZ-wgZ-fxQOvTkbbgKV1f_JrS9v7BpQXydvBzO3uW8GBg>
 <xmx:BuDPXwy4ltFykUDWpRwTHVtGln6m6E4mM6rar2twDRxaEzu5rtbefQ>
 <xmx:BuDPX3Tp2vVI8tW621wSyffVxq7PveMjEah-KUWjJ152xUA0OIPqPQ>
 <xmx:CODPX2Je63g_9qV45orMY99a798EqQW9KThMpCakiLlNtK0a_g0n5UeunTE>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 12379240064;
 Tue,  8 Dec 2020 15:20:19 -0500 (EST)
Date: Tue, 8 Dec 2020 21:20:17 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Dmitry Fomichev <Dmitry.Fomichev@wdc.com>
Subject: Re: [PATCH v9 08/12] hw/block/nvme: Support Zoned Namespace Command
 Set
Message-ID: <X8/gAaMk2kTwwmuC@apples.localdomain>
References: <20201105025342.9037-1-dmitry.fomichev@wdc.com>
 <20201105025342.9037-9-dmitry.fomichev@wdc.com>
 <20201112193639.GA811486@apples.localdomain>
 <2ec4105f8bc5ade0727e6e9e860b052a83d93bc6.camel@wdc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Xa0smXgw49292Xs2"
Content-Disposition: inline
In-Reply-To: <2ec4105f8bc5ade0727e6e9e860b052a83d93bc6.camel@wdc.com>
Received-SPF: pass client-ip=64.147.123.27; envelope-from=its@irrelevant.dk;
 helo=wnew2-smtp.messagingengine.com
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
Cc: "fam@euphon.net" <fam@euphon.net>, Niklas Cassel <Niklas.Cassel@wdc.com>,
 Damien Le Moal <Damien.LeMoal@wdc.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "k.jensen@samsung.com" <k.jensen@samsung.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "mreitz@redhat.com" <mreitz@redhat.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "kbusch@kernel.org" <kbusch@kernel.org>, "kwolf@redhat.com" <kwolf@redhat.com>,
 "mlevitsk@redhat.com" <mlevitsk@redhat.com>,
 "philmd@redhat.com" <philmd@redhat.com>,
 Matias Bjorling <Matias.Bjorling@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--Xa0smXgw49292Xs2
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Dec  8 20:02, Dmitry Fomichev wrote:
> Hi Klaus,
>=20
> Thank you for your review! Please see replies below...
>=20
>=20
> On Thu, 2020-11-12 at 20:36 +0100, Klaus Jensen wrote:
> > Hi Dmitry,
> >=20
> > I know you posted v10, but my comments should be relevant to that as
> > well.
> >=20
> > On Nov  5 11:53, Dmitry Fomichev wrote:
> > > @@ -133,6 +300,12 @@ static Property nvme_ns_props[] =3D {
> > >      DEFINE_BLOCK_PROPERTIES(NvmeNamespace, blkconf),
> > >      DEFINE_PROP_UINT32("nsid", NvmeNamespace, params.nsid, 0),
> > >      DEFINE_PROP_UUID("uuid", NvmeNamespace, params.uuid),
> > > +    DEFINE_PROP_BOOL("zoned", NvmeNamespace, params.zoned, false),
> >=20
> > I disagree on this. Using the "magic" value ensures that only one
> > command set can be selected. We can do a custom property so we can set
> > `iocs=3Dzoned` as well as `iocs=3D0x2` if that makes it more user frien=
dly?
>=20
> I doubt that an average admin will even know what "iocs" really means, le=
ave
> alone for knowing any magic values. On the other hand, it would be trivial
> to add a check to prevent users from doing zoned=3Dtrue kv=3Dtrue, etc. I=
 don't
> see that as a big problem.
>=20

OK, I'm fine with this.

> >=20
> > > +    DEFINE_PROP_SIZE("zoned.zsze", NvmeNamespace, params.zone_size_b=
s,
> > > +                     NVME_DEFAULT_ZONE_SIZE),
> > > +    DEFINE_PROP_SIZE("zoned.zcap", NvmeNamespace, params.zone_cap_bs=
, 0),
> > > +    DEFINE_PROP_BOOL("zoned.cross_read", NvmeNamespace,
> > > +                     params.cross_zone_read, false),
> >=20
> > Same reason why I think we should just expose ozcs directly instead of
> > adding more parameters.
> >=20
> > We are already adding a bunch of new parameters - might as well keep the
> > number as low as possible.
>=20
> There is only RAZB that is defined in OZCS as of now and you will not be
> able to reduce the number of module parameters by exposing OZCS instead of
> RAZB. But telling the user what RAZB really means in the parameter name i=
s,
> IMO, a better choice.
>=20

The TP that shall not be named puts stuff in there but I'm OK with the
zoned.cross_read parameter.

> > > +static uint16_t nvme_zone_mgmt_recv(NvmeCtrl *n, NvmeRequest *req)
> > > +{
> > > +    NvmeCmd *cmd =3D (NvmeCmd *)&req->cmd;
> > > +    NvmeNamespace *ns =3D req->ns;
> > > +    /* cdw12 is zero-based number of dwords to return. Convert to by=
tes */
> > > +    uint32_t data_size =3D (le32_to_cpu(cmd->cdw12) + 1) << 2;
> > > +    uint32_t dw13 =3D le32_to_cpu(cmd->cdw13);
> > > +    uint32_t zone_idx, zra, zrasf, partial;
> > > +    uint64_t max_zones, nr_zones =3D 0;
> > > +    uint16_t ret;
> > > +    uint64_t slba;
> > > +    NvmeZoneDescr *z;
> > > +    NvmeZone *zs;
> > > +    NvmeZoneReportHeader *header;
> > > +    void *buf, *buf_p;
> > > +    size_t zone_entry_sz;
> > > +
> > > +    req->status =3D NVME_SUCCESS;
> > > +
> > > +    ret =3D nvme_get_mgmt_zone_slba_idx(ns, cmd, &slba, &zone_idx);
> > > +    if (ret) {
> > > +        return ret;
> > > +    }
> >=20
> > Zone Management Receive does not specify anything for the given SLBA.
> > Out-of-bounds is acceptable, just results in no descriptors being
> > returned.
>=20
> SLBA is an LBA in the lowest zone that is considered for reporting.
> The text in 4.4.1.1 a) says "report only zone descriptors for which
> the ZSLBA value is greater or equal to the ZSLBA value of the zone
> specified by the SLBA value in the command". The last part of this
> paragraph basically says that SLBA has to point to a zone, hence
> the error if it doesn't.
>=20

Hmm. I tend to disagree since nowhere does the spec define that an error
should be returned if the given ZSLBA does not resolve to a valid zone.

> > > +
> > > +        zone_idx++;
> > > +    }
> > > +
> > > +    if (!partial) {
> > > +        for (; zone_idx < ns->num_zones; zone_idx++) {
> > > +            zs =3D &ns->zone_array[zone_idx];
> > > +            if (nvme_zone_matches_filter(zrasf, zs)) {
> > > +                nr_zones++;
> > > +            }
> > > +        }
> > > +    }
> >=20
> > I did something like this as well (only counting matching zones from
> > given SLBA), but when looking at the spec now, it seems that this is a
> > remnant from an older version of the spec? Please correct me if wrong.
> >=20
> > On the Partial Report bit, the ratified specification just says that "If
> > this bit is cleared to '0', then the value in the Number of Zones field
> > indicates the number of zone descriptors that match the criteria in the
> > Zone Receive Action Specific field.".
> >=20
> > So, I think if !partial, the Number of Zones field should not consider
> > the SLBA and just count from 0.
>=20
> If Partial is 0, then the header contains the number of descriptors that
> can be potentially reported from SLBA until the end of LBA range if the
> buffer would be unlimited. If the Partial bit is 1, the same count is
> additionally limited by the number of descriptors that can fit to the
> provided buffer. Perhaps ZNS spec is not quite clear about this, but this
> is the way all other zoned devices work. The most clear description of
> this logic that I am aware of can be found in T13 ZAC-2, p. 5.2.10.6.2
> "ZONE LIST LENGTH field".
>=20

Looking again, the spec is actually clear. It says that it "indicates the
number of zones that match the criteria described in section 4.4.1.1".
And that includes the criteria that it only reports zones that have a
ZSLBA equal to or greater than the given SLBA. So it is sound.

--Xa0smXgw49292Xs2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAl/P3/wACgkQTeGvMW1P
DekDkAf/Wsjr8L5894y2jTMza6HY9F8i1AFYjfN4rloePkCcP9ASk1RemJR/nOU+
X9yE+/P3RIIUR429HHN4/vajvS/KnUzzOGjASgfAbrq8CbXY3X1GI8NazHUfTFM2
5403HKYZf0L/epIz0dJD6+HtonsKXHp6KqR2MK5RAUMmuNLt0EcO5l3qsfM9a72l
IuR3U9LjUV76XwJSPTHinrScZZKUKso8opmBgpANT78+GoA0fhUR+e4uR7nCOvQk
jvDm/eaLdeeSlpVyfnAArKX307H+6ja7i+E+o2wNcdc9JHPss19uxyLCbGEDLSZM
EsRrGhVvGMJskHxIkqat9dYaFFkZkA==
=e+vQ
-----END PGP SIGNATURE-----

--Xa0smXgw49292Xs2--

