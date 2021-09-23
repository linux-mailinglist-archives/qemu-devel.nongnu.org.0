Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38EB9416673
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 22:14:42 +0200 (CEST)
Received: from localhost ([::1]:51884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTV7A-0001hW-Jg
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 16:14:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mTV2O-00073c-ER; Thu, 23 Sep 2021 16:09:44 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:56187)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mTV2L-0006wY-Vq; Thu, 23 Sep 2021 16:09:44 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 77A385C0197;
 Thu, 23 Sep 2021 16:09:39 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 23 Sep 2021 16:09:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=Nxagep3YabVXIhQwboZM4WCNs2V
 9utV9mqrzHRTsnNI=; b=l3n9If56uWZJjLpcSkPotL4rmyhs/YQUV8FxOfrYL9T
 rhqK6zGDNr6dBEsrtA9+T7l9DPTMyAL44mH44M/bLYnnu3mpEs7D3uSQaoyZX7t9
 LEIZfCKEcKzvdEgO2Es/u9b2jaPrhGIyr54Hce3UHMpxvBBDSGn/alkwyJ0v0Bad
 nayiIYftTZid6PNs64TTVFkRpT1+vJpIApXLr18VZ2KVsMxWzFTQIBZhPFclL7Jr
 5TPuXYCbmC80lNIedI6IaP8oNc5OglseBfuNnvEPMozwgas9bufNx/6YZz83VIWk
 1fPH+PGQtf+MhtHCtjsqdTPL6sLRKGL6XKChnd0cr4w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=Nxagep
 3YabVXIhQwboZM4WCNs2V9utV9mqrzHRTsnNI=; b=VOEZcU5L70fB7x87B2CDIt
 WNbpZQ5F3EpAs9Tf/Q1h4LsiM3TNR2Brb+e5wAVFOWA59XDPWiClT/c8JVO3z4NA
 L4/UjotzJDepHILzm6smzTLbD4VHxIPpFUUwbPGgR1qHBZ4XzTexS+Z1duDUR71l
 G7uAz6/q8/TwJeC2O29moNboLOwnKv8EWYsvogsWCKijY3jUSW+BveJVYjNHyMAd
 K/VCRPZrHQlceGPOaBLrZ8PcChuRHoVyyaEXk7ZBnBL4EJpedzFMddRwC7D/kxAa
 ss2YH5K+asqR8/ExE+xy9IWUsNaGV6AikMZ1PSQR504NArjUmV/HgaPohI/B+zCA
 ==
X-ME-Sender: <xms:At9MYTSz6WnDYiq4PEkpPYdgPQ0ZRfJ-2FgkIZIdbzzM790ksRmXKw>
 <xme:At9MYUwhaKO4XI_bXTbYBHXQz9ErzD0Kfdunj0STL3Pq0WTmh5CWK0-pzZ3wHriZu
 _tSQMNuClxzsneiv28>
X-ME-Received: <xmr:At9MYY3NsLKcVZVAV_jybvc0_GY0Bnx8mD3TdZuDVh9S6Lw2WnQvxCN7czVkTy_R_33Grl3SoQw1aTp500BHXuzWIahaIcBe2p0nKCkcvjVFe3M6xA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudeiledgudeghecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjeegudffueeiteekieelkedvueelteevjeduieeludfffeejgeffhfduvddu
 ffeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:At9MYTCf0_ZhcohZ05NCgY9KuNrc1ctXq8AdiwzAstvGti_Q1RH5UA>
 <xmx:At9MYciro9XK4CJIpwdqmoz7kn4BkiAA8wRYzKo0DWVNKxZafmhuSg>
 <xmx:At9MYXpwTFC6ULwZMhCV0j5VLufmC51j37Zgyvp5ySbTx839ev-u2A>
 <xmx:A99MYVurAMGoYxkDNB7JTUghjiC5XBQaDohpIWrs5ZuCgyjXQFD8UQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 23 Sep 2021 16:09:37 -0400 (EDT)
Date: Thu, 23 Sep 2021 22:09:36 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Hannes Reinecke <hare@suse.de>
Subject: Re: [PATCH] hw/nvme: reattach subsystem namespaces on hotplug
Message-ID: <YUzfAP2BWSDJOLSO@apples.localdomain>
References: <20210909094308.122038-1-hare@suse.de>
 <YTnmWUKhtlR2j3yI@apples.localdomain>
 <39666601-8d22-b051-2939-e2ccb96fb010@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="RNASAdUKhrqAVLWj"
Content-Disposition: inline
In-Reply-To: <39666601-8d22-b051-2939-e2ccb96fb010@suse.de>
Received-SPF: pass client-ip=66.111.4.28; envelope-from=its@irrelevant.dk;
 helo=out4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Klaus Jensen <k.jensen@samsung.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--RNASAdUKhrqAVLWj
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sep  9 13:37, Hannes Reinecke wrote:
> On 9/9/21 12:47 PM, Klaus Jensen wrote:
> > On Sep  9 11:43, Hannes Reinecke wrote:
> >> With commit 5ffbaeed16 ("hw/nvme: fix controller hot unplugging")
> >> namespaces get moved from the controller to the subsystem if one
> >> is specified.
> >> That keeps the namespaces alive after a controller hot-unplug, but
> >> after a controller hotplug we have to reconnect the namespaces
> >> from the subsystem to the controller.
> >>
> >> Fixes: 5ffbaeed16 ("hw/nvme: fix controller hot unplugging")
> >> Cc: Klaus Jensen <k.jensen@samsung.com>
> >> Signed-off-by: Hannes Reinecke <hare@suse.de>
> >> ---
> >>  hw/nvme/subsys.c | 8 +++++++-
> >>  1 file changed, 7 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/hw/nvme/subsys.c b/hw/nvme/subsys.c
> >> index 93c35950d6..a9404f2b5e 100644
> >> --- a/hw/nvme/subsys.c
> >> +++ b/hw/nvme/subsys.c
> >> @@ -14,7 +14,7 @@
> >>  int nvme_subsys_register_ctrl(NvmeCtrl *n, Error **errp)
> >>  {
> >>      NvmeSubsystem *subsys =3D n->subsys;
> >> -    int cntlid;
> >> +    int cntlid, nsid;
> >> =20
> >>      for (cntlid =3D 0; cntlid < ARRAY_SIZE(subsys->ctrls); cntlid++) {
> >>          if (!subsys->ctrls[cntlid]) {
> >> @@ -29,12 +29,18 @@ int nvme_subsys_register_ctrl(NvmeCtrl *n, Error *=
*errp)
> >> =20
> >>      subsys->ctrls[cntlid] =3D n;
> >> =20
> >> +    for (nsid =3D 0; nsid < ARRAY_SIZE(subsys->namespaces); nsid++) {
> >> +        if (subsys->namespaces[nsid]) {
> >> +            nvme_attach_ns(n, subsys->namespaces[nsid]);
> >> +        }
> >=20
> > Thanks Hannes! I like it, keeping things simple.
> >=20
> > But we should only attach namespaces that have the shared property or
> > have ns->attached =3D=3D 0. Non-shared namespaces may already be attach=
ed to
> > another controller in the subsystem.
> >=20
>=20
> Well ... I tried to avoid that subject, but as you brought it up:
> There is a slightly tricky issue in fabrics, in that the 'controller' is
> independent from the 'connection'.
> The 'shared' bit in the CMIC setting indicates that the subsystem may
> have more than one _controller_. It doesn't talk about how many
> _connections_ a controller may support; that then is the realm of
> dynamic or static controllers, which we don't talk about :-).
> Sufficient to say, linux only implements the dynamic controller model,
> so every connection will be to a different controller.
> But you have been warned :-)
>=20
> However, the 'CMIC' setting is independent on the 'NMIC' setting (ie the
> 'shared' bit in the namespace).
> Which leads to the interesting question on how exactly should one handle
> non-shared namespaces in subsystems for which there are multiple
> controllers. Especially as the NSID space is per subsystem, so each
> controller will be able to figure out if there are blanked-out namespaces.
> So to make this a sane setup I would propose to set the 'shared' option
> automatically whenever the controller has the 'subsys' option set.
> And actually, I would ditch the 'shared' option completely, and make it
> dependent on the 'subsys' setting for the controller.
> Much like we treat the 'CMIC' setting nowadays.
> That avoids lots of confusions, and also make the implementation _way_
> easier.
>=20

I see your point. Unfortunately, there is no easy way to ditch shared=3D
now. But I think it'd be good enough to attach to shared automatically,
but not to "shared=3Doff".

I've already ditched the shared parameter on my RFC refactor series and
always having the namespaces shared.

> > However...
> >=20
> > The spec says that "The attach and detach operations are persistent
> > across all reset events.". This means that we should track those events
> > in the subsystem and only reattach namespaces that were attached at the
> > time of the "reset" event. Currently, we don't have anything mapping
> > that state. But the device already has to take some liberties with
> > regard to stuff that is considered persistent by the spec (SMART log
> > etc.) since we do not have any way to store stuff persistently across
> > qemu invocations, so I think the above is an acceptable compromise.
> >=20
> Careful. 'attach' and 'detach' are MI (management interface) operations.
> If and how many namespaces are visible to any given controllers is
> actually independent on that; and, in fact, controllers might not even
> implement 'attach' or 'detach'.
> But I do agree that we don't handle the 'reset' state properly.
>=20

The Namespace Attachment command has nothing to do with MI? And the QEMU
controller does support attaching and detaching namespaces.

> > A potential (as good as it gets) fix would be to keep a map/list of
> > "persistently" attached controllers on the namespaces and re-attach
> > according to that when we see that controller joining the subsystem
> > again. CNTLID would be the obvious choice for the key here, but problem
> > is that we cant really use it since we assign it sequentially from the
> > subsystem, which now looks like a pretty bad choice. CNTLID should have
> > been a required property of the nvme device when subsystems are
> > involved. Maybe we can fix up the CNTLID assignment to take the serial
> > into account (we know that is defined and *should* be unique) and not
> > reuse CNTLIDs. This limits the subsystem to NVME_MAX_CONTROLLERS unique
> > controllers, but I think that is fair enough.
> >=20
> > Sigh. Need to think this through.
> >=20
> Well, actually there is an easy way out. I do agree that we need to make
> the 'cntlid' a property of the controller. And once it's set we can
> track it properly, eg by having per-cntlid nsid lists in the subsystem.
> But if it's not set we can claim that we'll be allocating a new
> controller across reboots (which is actually what we're doing), making
> us spec compliant again :-)
>=20

That is a decent solution, but we still can't track it across reboots. I
think we should just with your patch (but for now, only automatically
attach shared namespaces).

Would that be acceptable to you? It would require your to add shared=3Don
on your single-namespace test set up since unfortunately, shared=3Don is
not the default. However, we can consider changing that default in 6.2.

--RNASAdUKhrqAVLWj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmFM3vsACgkQTeGvMW1P
Denrhwf7Beqy/0R+lo1HXioTUVbVGjYO6B1KEhEv13LHObTngX0B7kplLvY9WIWw
9lI/rDN1HVVk0YViXQglPyrRoR2jSJV09CygEyVBG4AvECkupre8a0tI7rpDD3gv
0IHWV8MrM1FJXswiqgruHmX27FhW4JO/zLZ4nDqCbNa8ub3nuR/h0YDmGHFlgFmO
h7FdnYPfqLO5iNbHcqBd/Ugg6PbJVU0Sj3X0nCVMc08xbWmMFV30gT8ptIufIsUx
jkHBGpXzk3dnJxiK0VSByOTQi4Tqgx6dQncaHXjR8f6SZkeDR4AB87m4EWTs8Fmo
q4Tjf/aEHJA9cy5EjJX6GzyLH+N8xQ==
=AB1t
-----END PGP SIGNATURE-----

--RNASAdUKhrqAVLWj--

