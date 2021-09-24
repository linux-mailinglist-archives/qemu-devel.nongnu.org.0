Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2625B416D24
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 09:53:04 +0200 (CEST)
Received: from localhost ([::1]:34832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTg10-0006gc-U8
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 03:53:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mTfe1-0004Fz-T8; Fri, 24 Sep 2021 03:29:17 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:53263)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mTfdz-0003zI-Tz; Fri, 24 Sep 2021 03:29:17 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 1C1D55C01A9;
 Fri, 24 Sep 2021 03:29:12 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Fri, 24 Sep 2021 03:29:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=qRZhtbZTmkElG/rEVN0tc9S8CuF
 TOePAJ9eAGRaUM+U=; b=SErMxDTXGzzPXsCiZdoUEJxUSdLpf0wStV+WivZ8LN2
 JhNV4ttBJKV/FUfgoKeOht/aJrXdGfdTStP67u2cChC+v6x+FjKc0m92s3rV9abr
 Y+8zC3jKaa8nUk3DYiNelg33P60Kn1t5675ijcqJDW6v20JVW0D4jUk/DFvyqmH6
 B5hLq95baq5vK7EU6jlz0DJHCdiwYpG1AHePdsi8+g8TOUc/YFtqDg01aN0To+dw
 hmcJv+eYOnwAVKB0vERDZY3Gvg0f1O3j31b5BFjF0tCLSFtF+JiHdR8w8A+JBEIF
 lobp2QUqXRnv/KNf/AlQTAMLTyR6esHAHDNYmefKcVQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=qRZhtb
 ZTmkElG/rEVN0tc9S8CuFTOePAJ9eAGRaUM+U=; b=gpYYrVwoi4zkwjU0hpnzBT
 /k8Z9qIDS9Vu9S5JR7bTGlzxlN3dYTVfwsZhv1A8KY3LFzJejPWL7UY9WytdbLDq
 iblY1YYCcgDbI3B3zHZYtJ9GLuhZ3jp0kCltlUhRtQWVdFkC6Ekr7Xs9LHryqRDY
 gFrJYAD2BvqUeUsrbArzoHvQDm/xVjEOibJnIlRh6390Y0X5YVeo3TkBT269Hdbm
 jXd2s30LS02w4zLkvtzmNoJRq+3G6F+6T+p0OYFEQP77WsJAd4Hdu9qGl2NFuKdW
 Oz9F+xhZjltjWCQMLbOUY3VzLGr9QmdWuy9/XEBdkVYgWjoxmDHnLQ3iOHdYVgEg
 ==
X-ME-Sender: <xms:R35NYVoQDZ84Ql836yWiht7hIrFFCqXtnQ2wsp8W1jdSlJsON_XuIg>
 <xme:R35NYXruLtxtlLmFFzxMzQcd63AMizy4ZuXdMDjjDwkcd4edFWyIhbyGa8yt-Dbc7
 D3JAqoRWOyV0oMb41w>
X-ME-Received: <xmr:R35NYSN-FYY9l00jHFUuu79rt3FYtZPrre8Y1kL6ALhBRS7xvUI7xLplnd0YJGdB5z76_G0YEr1iYlJNTlCd1YWK-QeFLOjKdgYNbMq6olVH9KNKzQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudejtddguddujecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjeegudffueeiteekieelkedvueelteevjeduieeludfffeejgeffhfduvddu
 ffeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:SH5NYQ6ToU0Mosz6pnSlYghcF-T47rjNm3rYhUvTQqRXqOIysahvWg>
 <xmx:SH5NYU71FSm62P_2AdHTOxilapKavo8W5kx3j2YrB4MsCzVdZcdsLg>
 <xmx:SH5NYYgijIFJWF-jPJ1uK7SMVhHXXzpi0KuFjuhHsQdbrJBHhB6nbw>
 <xmx:SH5NYSlR0xf1pCFKfZzzCHa0xpr0cAL-Ww0UV30Q3QQuGegR6j71-Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 24 Sep 2021 03:29:11 -0400 (EDT)
Date: Fri, 24 Sep 2021 09:29:09 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Hannes Reinecke <hare@suse.de>
Subject: Re: [PATCH] hw/nvme: reattach subsystem namespaces on hotplug
Message-ID: <YU1+RYYGMLTHtWZg@apples.localdomain>
References: <20210909094308.122038-1-hare@suse.de>
 <YTnmWUKhtlR2j3yI@apples.localdomain>
 <39666601-8d22-b051-2939-e2ccb96fb010@suse.de>
 <YUzfAP2BWSDJOLSO@apples.localdomain>
 <5ad5bace-07f6-13cd-906a-7b600441dd6d@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="815A11es3SDIfx5i"
Content-Disposition: inline
In-Reply-To: <5ad5bace-07f6-13cd-906a-7b600441dd6d@suse.de>
Received-SPF: pass client-ip=66.111.4.27; envelope-from=its@irrelevant.dk;
 helo=out3-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: Klaus Jensen <k.jensen@samsung.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--815A11es3SDIfx5i
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sep 24 08:05, Hannes Reinecke wrote:
> On 9/23/21 10:09 PM, Klaus Jensen wrote:
> > On Sep  9 13:37, Hannes Reinecke wrote:
> > > On 9/9/21 12:47 PM, Klaus Jensen wrote:
> > > > On Sep  9 11:43, Hannes Reinecke wrote:
> > > > > With commit 5ffbaeed16 ("hw/nvme: fix controller hot unplugging")
> > > > > namespaces get moved from the controller to the subsystem if one
> > > > > is specified.
> > > > > That keeps the namespaces alive after a controller hot-unplug, but
> > > > > after a controller hotplug we have to reconnect the namespaces
> > > > > from the subsystem to the controller.
> > > > >=20
> > > > > Fixes: 5ffbaeed16 ("hw/nvme: fix controller hot unplugging")
> > > > > Cc: Klaus Jensen <k.jensen@samsung.com>
> > > > > Signed-off-by: Hannes Reinecke <hare@suse.de>
> > > > > ---
> > > > >   hw/nvme/subsys.c | 8 +++++++-
> > > > >   1 file changed, 7 insertions(+), 1 deletion(-)
> > > > >=20
> > > > > diff --git a/hw/nvme/subsys.c b/hw/nvme/subsys.c
> > > > > index 93c35950d6..a9404f2b5e 100644
> > > > > --- a/hw/nvme/subsys.c
> > > > > +++ b/hw/nvme/subsys.c
> > > > > @@ -14,7 +14,7 @@
> > > > >   int nvme_subsys_register_ctrl(NvmeCtrl *n, Error **errp)
> > > > >   {
> > > > >       NvmeSubsystem *subsys =3D n->subsys;
> > > > > -    int cntlid;
> > > > > +    int cntlid, nsid;
> > > > >       for (cntlid =3D 0; cntlid < ARRAY_SIZE(subsys->ctrls); cntl=
id++) {
> > > > >           if (!subsys->ctrls[cntlid]) {
> > > > > @@ -29,12 +29,18 @@ int nvme_subsys_register_ctrl(NvmeCtrl *n, Er=
ror **errp)
> > > > >       subsys->ctrls[cntlid] =3D n;
> > > > > +    for (nsid =3D 0; nsid < ARRAY_SIZE(subsys->namespaces); nsid=
++) {
> > > > > +        if (subsys->namespaces[nsid]) {
> > > > > +            nvme_attach_ns(n, subsys->namespaces[nsid]);
> > > > > +        }
> > > >=20
> > > > Thanks Hannes! I like it, keeping things simple.
> > > >=20
> > > > But we should only attach namespaces that have the shared property =
or
> > > > have ns->attached =3D=3D 0. Non-shared namespaces may already be at=
tached to
> > > > another controller in the subsystem.
> > > >=20
> > >=20
> > > Well ... I tried to avoid that subject, but as you brought it up:
> > > There is a slightly tricky issue in fabrics, in that the 'controller'=
 is
> > > independent from the 'connection'.
> > > The 'shared' bit in the CMIC setting indicates that the subsystem may
> > > have more than one _controller_. It doesn't talk about how many
> > > _connections_ a controller may support; that then is the realm of
> > > dynamic or static controllers, which we don't talk about :-).
> > > Sufficient to say, linux only implements the dynamic controller model,
> > > so every connection will be to a different controller.
> > > But you have been warned :-)
> > >=20
> > > However, the 'CMIC' setting is independent on the 'NMIC' setting (ie =
the
> > > 'shared' bit in the namespace).
> > > Which leads to the interesting question on how exactly should one han=
dle
> > > non-shared namespaces in subsystems for which there are multiple
> > > controllers. Especially as the NSID space is per subsystem, so each
> > > controller will be able to figure out if there are blanked-out namesp=
aces.
> > > So to make this a sane setup I would propose to set the 'shared' opti=
on
> > > automatically whenever the controller has the 'subsys' option set.
> > > And actually, I would ditch the 'shared' option completely, and make =
it
> > > dependent on the 'subsys' setting for the controller.
> > > Much like we treat the 'CMIC' setting nowadays.
> > > That avoids lots of confusions, and also make the implementation _way_
> > > easier.
> > >=20
> >=20
> > I see your point. Unfortunately, there is no easy way to ditch shared=3D
> > now. But I think it'd be good enough to attach to shared automatically,
> > but not to "shared=3Doff".
> >=20
> > I've already ditched the shared parameter on my RFC refactor series and
> > always having the namespaces shared.
> >=20
>=20
> Okay.
>=20
> > > > However...
> > > >=20
> > > > The spec says that "The attach and detach operations are persistent
> > > > across all reset events.". This means that we should track those ev=
ents
> > > > in the subsystem and only reattach namespaces that were attached at=
 the
> > > > time of the "reset" event. Currently, we don't have anything mapping
> > > > that state. But the device already has to take some liberties with
> > > > regard to stuff that is considered persistent by the spec (SMART log
> > > > etc.) since we do not have any way to store stuff persistently acro=
ss
> > > > qemu invocations, so I think the above is an acceptable compromise.
> > > >=20
> > > Careful. 'attach' and 'detach' are MI (management interface) operatio=
ns.
> > > If and how many namespaces are visible to any given controllers is
> > > actually independent on that; and, in fact, controllers might not even
> > > implement 'attach' or 'detach'.
> > > But I do agree that we don't handle the 'reset' state properly.
> > >=20
> >=20
> > The Namespace Attachment command has nothing to do with MI? And the QEMU
> > controller does support attaching and detaching namespaces.
> >=20
>=20
> No, you got me wrong. Whether a not a namespace is attached is independent
> of any 'Namespace attachment' command.
> Case in point: the subsystem will be starting up with namespace already
> attached, even though no-one issued any namespace attachment command.
>=20

Right, understood.

> > > > A potential (as good as it gets) fix would be to keep a map/list of
> > > > "persistently" attached controllers on the namespaces and re-attach
> > > > according to that when we see that controller joining the subsystem
> > > > again. CNTLID would be the obvious choice for the key here, but pro=
blem
> > > > is that we cant really use it since we assign it sequentially from =
the
> > > > subsystem, which now looks like a pretty bad choice. CNTLID should =
have
> > > > been a required property of the nvme device when subsystems are
> > > > involved. Maybe we can fix up the CNTLID assignment to take the ser=
ial
> > > > into account (we know that is defined and *should* be unique) and n=
ot
> > > > reuse CNTLIDs. This limits the subsystem to NVME_MAX_CONTROLLERS un=
ique
> > > > controllers, but I think that is fair enough.
> > > >=20
> > > > Sigh. Need to think this through.
> > > >=20
> > > Well, actually there is an easy way out. I do agree that we need to m=
ake
> > > the 'cntlid' a property of the controller. And once it's set we can
> > > track it properly, eg by having per-cntlid nsid lists in the subsyste=
m.
> > > But if it's not set we can claim that we'll be allocating a new
> > > controller across reboots (which is actually what we're doing), making
> > > us spec compliant again :-)
> > >=20
> >=20
> > That is a decent solution, but we still can't track it across reboots. I
> > think we should just with your patch (but for now, only automatically
> > attach shared namespaces).
> >=20
> But that's the point.
> We don't _need_ to track it.
> We only need to track it when it's specified via a (yet-to-be-added) cntl=
id
> parameter, but then it's trivial.
> If it's not specified we will allocate a new one and don't need to track
> stuff. That's even permitted by the NVMe spec; v2.0 section 3.1.1 has:
>=20
> While allocation of static controllers to hosts are expected to be durable
> (so that hosts can expect to form associations to the same controllers
> repeatedly (e.g., after each host reboot)), the NVM subsystem may remove =
the
> host allocation of a controller that is not in use at any time for
> implementation specific reasons
> (e.g., controller resource reclamation, subsystem reconfiguration).
>=20

Awesome. Thanks for pointing me towards that wording.

> > Would that be acceptable to you? It would require your to add shared=3D=
on
> > on your single-namespace test set up since unfortunately, shared=3Don is
> > not the default. However, we can consider changing that default in 6.2.
> >=20
> Yes, for an interim solution it's okay.
> The important bit is to get hotplug up and running again for NVMe; we do
> have some testcases for patches in upstream linux which I would like to
> forward to our QA Team.
>=20

Cool. I've sent out a series with your patch and an additional patch
that changes the default for 'shared'.

--815A11es3SDIfx5i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmFNfkQACgkQTeGvMW1P
DekjNQf+NYjWVz7dwcl102w93r+uy62I0jcO/RTMZLECES6/nIUFuMAI8gwytXTs
WfsqGfqo1Xo+qsJMHwyKnbhsT0uYIoyyfHgtVX8+qxqt9Atghv/OlvHY3lIJsEQQ
hsgVciG+2gbKN3e7rWNRIZWBgI6gsX+qIU60Wlv9KCTZuxrfy9OalFb98HXxGdVe
W4lvuvK011rT66czTXIwMIYCuk2Ic4h8UWVVepwQuNP7qXSToop9mjAEY6h1GDIc
XFdkf1D111PSJUUNDEGFM/N6vXQJIbEqdihNnh7yXARTzrKoIRWL8RyVSXuNqHcd
eYDleRwqUcXs5HlfPrMnpdm6P/H95g==
=0TDB
-----END PGP SIGNATURE-----

--815A11es3SDIfx5i--

