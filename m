Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 137495BFA4F
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 11:12:18 +0200 (CEST)
Received: from localhost ([::1]:38630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oavmC-0006o3-7d
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 05:12:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1oavik-0003sW-N0; Wed, 21 Sep 2022 05:08:42 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:42963)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1oavii-0005T0-49; Wed, 21 Sep 2022 05:08:42 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 2B1A15C00C3;
 Wed, 21 Sep 2022 05:08:36 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Wed, 21 Sep 2022 05:08:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1663751316; x=1663837716; bh=je
 l/MIBUqKnevRJxbXY2BbBPDkxjhxC4ES72jcyzK1w=; b=zFK230fJfzW25PcjKd
 rBpRMplOL+NsYZuRFO/TYEvIJL0/X3IWBw/bCASK/kT1h3MJOxuIJZtsBE0Fo/X9
 xDwIcW32VDH31Tm+q/RTK7Y4HQMj1DCvFtJiKWY74nO5+uRslsrF3CmrZu5S39Ri
 olig+F50S4mNdW/hGWD6LGHVQbPidG/9aFPC1HUAftvClGJxoWKX9PoB7oL72A1w
 wXHT732L9tjMn2EuJMdnGRoZJaccUVrGmIIydSiu14o8pmKAfOjgfLtkNY6qbJxK
 YyuVo/XvcdztCyH0/S6vuJOBhJQZYcm37jpP1CHAtEyvOne2ZN2UfXp6lslyb6tT
 PYBw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1663751316; x=1663837716; bh=jel/MIBUqKnevRJxbXY2BbBPDkxj
 hxC4ES72jcyzK1w=; b=l90rb5i6INuZGHhxdtpjJs2KQDBzsnQ4VJsLFzQ8F8VM
 1c9VVPQVHdSRIXcD0poB+OM1QQtEs/CMgZvFj+wZnmNhGkwryCjEWwtgPX0HXXPc
 ezUxTiF3tbHIfdSYkw3ndP2HcW9QZSduudt8hDxK4sbRu1AxACCV3uAAUiyLdMga
 7NGZrOpa/0WsPZADVYGCeOoVlaTSMVeYWHW0k0pFhEPhBHOG6W0U22SrnKsc0gVK
 nJYlsYtsbHHW8ADJZ9N6Ddf1HUuSQd6MxrNFsbGPC2Vj8RqwL/NPLUi1nG88sxEk
 rfxaSO10diwe4Gu2GEMgKYW02gAIOwIgUhBzcWGiuA==
X-ME-Sender: <xms:ktQqY7OVrx-QPdoeYxS7J2eP3_AZTkQL_jrC33eBA5W8sEAbkqRi3Q>
 <xme:ktQqY1-rO8H1I-qsOl5nwp-LIiMewsXYOn4u-Kb-1x7Jh1_34UMtE-3LzEAq36eQD
 Mhnx1Opx6lpkP7_nlo>
X-ME-Received: <xmr:ktQqY6SpUzf5qJpJy9IYat9mU8aT4G1CGbMC6mT9cEsYPR5ogLJ7ZgZBwMCBQoiDJAI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeefuddgudegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjefgjeefffdvuefhieefhffggfeuleehudekveejvedtuddugeeigeetffff
 jeevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:ktQqY_v-G5kSOvux9Td1T_bvaV5vmz3vPv6U6QkwxQZY7l0NEJz0tw>
 <xmx:ktQqYzfXqE3LUqbXPRm9pI3fncyeabJ6gV8kEbvfCK5ob4n-F50Ytw>
 <xmx:ktQqY72o2VvnQBUHrYuSORM9qd89rM2hrE8Q5QSKsdVSPd-KRpCXdg>
 <xmx:lNQqYx021n7J9dPOZW147vAVzU_1DPVHqcySQMS-xdpFEtAvk7BDGA>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 21 Sep 2022 05:08:32 -0400 (EDT)
Date: Wed, 21 Sep 2022 11:08:30 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Cc: Sam Li <faithilikerun@gmail.com>, qemu-devel@nongnu.org,
 dmitry.fomichev@wdc.com, Markus Armbruster <armbru@redhat.com>,
 Eric Blake <eblake@redhat.com>, qemu-block@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 hare@suse.de, Hanna Reitz <hreitz@redhat.com>,
 Pankaj Raghav <p.raghav@samsung.com>
Subject: Re: [PATCH v9 3/7] block: add block layer APIs resembling Linux
 ZonedBlockDevice ioctls
Message-ID: <YyrUjo2OL6igT8Z/@cormorant.local>
References: <20220910052759.27517-1-faithilikerun@gmail.com>
 <20220910052759.27517-4-faithilikerun@gmail.com>
 <Yyl/AC9X7uHyeTCu@apples>
 <10fa1e0b-032a-b82a-80e1-4232d1c6a965@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="dsJoVYOPmWX/qXQO"
Content-Disposition: inline
In-Reply-To: <10fa1e0b-032a-b82a-80e1-4232d1c6a965@opensource.wdc.com>
Received-SPF: pass client-ip=66.111.4.26; envelope-from=its@irrelevant.dk;
 helo=out2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--dsJoVYOPmWX/qXQO
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sep 21 13:44, Damien Le Moal wrote:
> On 9/20/22 17:51, Klaus Jensen wrote:
> > On Sep 10 13:27, Sam Li wrote:
> > > Add a new zoned_host_device BlockDriver. The zoned_host_device option
> > > accepts only zoned host block devices. By adding zone management
> > > operations in this new BlockDriver, users can use the new block
> > > layer APIs including Report Zone and four zone management operations
> > > (open, close, finish, reset).
> > >=20
> > > Qemu-io uses the new APIs to perform zoned storage commands of the de=
vice:
> > > zone_report(zrp), zone_open(zo), zone_close(zc), zone_reset(zrs),
> > > zone_finish(zf).
> > >=20
> > > For example, to test zone_report, use following command:
> > > $ ./build/qemu-io --image-opts -n driver=3Dzoned_host_device, filenam=
e=3D/dev/nullb0
> > > -c "zrp offset nr_zones"
> > >=20
> > > Signed-off-by: Sam Li <faithilikerun@gmail.com>
> > > Reviewed-by: Hannes Reinecke <hare@suse.de>
> > > ---
> > >   block/block-backend.c             | 145 ++++++++++++++
> > >   block/file-posix.c                | 323 +++++++++++++++++++++++++++=
++-
> > >   block/io.c                        |  41 ++++
> > >   include/block/block-io.h          |   7 +
> > >   include/block/block_int-common.h  |  21 ++
> > >   include/block/raw-aio.h           |   6 +-
> > >   include/sysemu/block-backend-io.h |  17 ++
> > >   meson.build                       |   1 +
> > >   qapi/block-core.json              |   8 +-
> > >   qemu-io-cmds.c                    | 143 +++++++++++++
> > >   10 files changed, 708 insertions(+), 4 deletions(-)
> > >=20
> > > +/*
> > > + * zone management operations - Execute an operation on a zone
> > > + */
> > > +static int coroutine_fn raw_co_zone_mgmt(BlockDriverState *bs, Block=
ZoneOp op,
> > > +        int64_t offset, int64_t len) {
> > > +#if defined(CONFIG_BLKZONED)
> > > +    BDRVRawState *s =3D bs->opaque;
> > > +    RawPosixAIOData acb;
> > > +    int64_t zone_sector, zone_sector_mask;
> > > +    const char *zone_op_name;
> > > +    unsigned long zone_op;
> > > +    bool is_all =3D false;
> > > +
> > > +    zone_sector =3D bs->bl.zone_sectors;
> > > +    zone_sector_mask =3D zone_sector - 1;
> > > +    if (offset & zone_sector_mask) {
> > > +        error_report("sector offset %" PRId64 " is not aligned to zo=
ne size "
> > > +                     "%" PRId64 "", offset, zone_sector);
> > > +        return -EINVAL;
> > > +    }
> > > +
> > > +    if (len & zone_sector_mask) {
> > > +        error_report("number of sectors %" PRId64 " is not aligned t=
o zone size"
> > > +                      " %" PRId64 "", len, zone_sector);
> > > +        return -EINVAL;
> > > +    }
> >=20
> > These checks impose a power-of-two constraint on the zone size. Can they
> > be changed to divisions to lift that constraint? I don't see anything in
> > this patch set that relies on power of two zone sizes.
>=20
> Given that Linux will only expose zoned devices that have a zone size that
> is a power of 2 number of LBAs, this will work as is and avoid divisions =
in
> the IO path. But given that zone management operations are not performance
> critical, generalizing the code should be fine.
>=20

Aight. That's fine, we can relax the constraint later. But I don't see why.

> However, once we start adding the code for full zone emulation on top of a
> regular file or qcow image, sector-to-zone conversions requiring divisions
> will hurt. So I really would prefer the code be left as-is for now.
>=20

Block driver based zone emulation would not hit the above code path
anyway (there would be no iotcl to call), so I don't think that is an
argument for keeping it as-is.

On the sector-to-zone convertions. Yes, they may potentially hurt, but
it would be emulation after all. Why would we care about optimizing
those conversions at the expense of not being able to emulate all valid
geometries? The performance option (which this series enables) is to use
an underlying zoned device through virtio (or, potentially, hw/nvme).
What would be the usecase for deploying a performance sensitive emulated
zoned device?

--dsJoVYOPmWX/qXQO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmMq1IoACgkQTeGvMW1P
DemZdAf/ZfkibE6hZAjoXzOblzUyLzK8BbBY3nI9ZcI+NhWx9VA3btCJFLRr8YSq
g7y6BdXscQu473nmZYTFiSvYOgSngdjIRqciEx4zAJ4EhORtW12MppqKWDWVVjSU
odwXyjo+7HOn5qXxeLcwejVRvkr6gao1ocIAVAcEz0eky75Wk+mo4gdk0Oh0P1AH
H9stiBBJT66oGH7DfnQv45Wk7Mqv8NEbYoJU6/csZ+kVN2LRNi836MFjDNKwksPf
cUYmRvX0f2yL74epyhAfcxi4TmYvzes8q97rI9H0Sk6+CClCcBmoLjU9HFF6lLE1
ZCgDEXIsh8xLlTnLhiCpO8SuVQKLKw==
=1Wjs
-----END PGP SIGNATURE-----

--dsJoVYOPmWX/qXQO--

