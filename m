Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AC79444130
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 13:18:26 +0100 (CET)
Received: from localhost ([::1]:58094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miFDk-0003JY-S9
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 08:18:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1miF6v-0008Nb-DS; Wed, 03 Nov 2021 08:11:21 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:44065)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1miF6t-0002Px-IL; Wed, 03 Nov 2021 08:11:21 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 7CCCE5C0195;
 Wed,  3 Nov 2021 08:11:18 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Wed, 03 Nov 2021 08:11:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=aKS82DAnRZWJ973lqAjyUf5x/wK
 xMq237GZu6n7TXHc=; b=XerFhaEHrSd7nrxNSQV7bO1Ryyy52ZNrPQXsGbxFm/1
 H+h3wXeG8xXOfmN74+Y5SMVWrC20mXGGJ+J7u2nIx64Mzi3iLYULD/ngv2ThhQwM
 rowO1EKVCTD948rOWwmP3ud45mT+aXqhJU8HvoyJVvsJgr9oOjjej+V0EEIXXXWN
 lhSj51GHlk5ThF2WZIh3VYOOS884iQS2udgNQkfR69VqzcDL4mQZJ0oBeurckFTz
 pj6yuY0U1QmLTpmUCbYNFOsB7lNJRF7us0kjSEXqTnevua7jtc4aAjHRP9CWb31t
 AAX8aE7tiP4LWzRbm3liiP8OAjdOLaJQnq4EGbPmxLQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=aKS82D
 AnRZWJ973lqAjyUf5x/wKxMq237GZu6n7TXHc=; b=T8wdzrb3YVRTUWwk3C/BnY
 zxkbLgzQQId7I1AxsiIcIivmimVqfC/t1zvAHxruiXtI9Aq7IkTj14kPSyON2ugf
 Ams2ksU+8SoEGNvOrEanV0162VkF6XmlksT+rYbmzBGSFF4sfgsxcXXmN2OQ3Ywp
 +g+uwKoJpLUkl6ioP3TGGSbUVLS45bu00+jXy1Y7K1hieEjfB6dbOGRQKOD48KNa
 4oooI8Iot/zauZoVfrdhux6GzlGBdlP9MIp1DJ6xgOIY+M79TWpF17Is2Uci2eeh
 83mKtLdd5YfJjxlfbwyw3ZfYKRlwAnuQIok9wdYF4ufoOTvN/x5zXkjcM45NonDw
 ==
X-ME-Sender: <xms:ZnyCYTskOari0HtblcAgCWFMjrnhezWpOzXVL6JBhwNMtwbTfhrCCg>
 <xme:ZnyCYUeLO6narmzwvsbA3HFuaBK-8xj71Q8T4Ah3nM4MsZ1svbqftJAincVYsWt6G
 dz3S4knpp_U2UJUOFQ>
X-ME-Received: <xmr:ZnyCYWxvUHw1st1WL7FfenWvzM0egJTRJML-WyqNw2LRb8nZGsDAPjaG1PX11QoztgvpUUCtECfaDLrD-YHb1mzIRioweakiH0j2_HMmoA2gPPbNdQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrtddvgdefjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepjeegudffueeiteekieelkedvueelteevjeduieeludfffeejgeffhfduvdduffek
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepihhtsh
 esihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:ZnyCYSPlzdbKbP0m5rsBhZS8YtPg1MiagCR0686XR9DpoX3VeRpTNQ>
 <xmx:ZnyCYT_GD0T4raS8l_2UJTncZHf0aJlMU8s-KTFVzII63ISQ9Ulsbg>
 <xmx:ZnyCYSWfzguyqx8ASst627HOWklFxVJT0kf6Fl5mpl9EWp5FyhuOQw>
 <xmx:ZnyCYfaCj_3cxm9ABJuGURGeQ4HoT-Gcb2s_xHJa7lmVP0uyJC1-8A>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 3 Nov 2021 08:11:17 -0400 (EDT)
Date: Wed, 3 Nov 2021 13:11:15 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: =?utf-8?Q?=C5=81ukasz?= Gieryk <lukasz.gieryk@linux.intel.com>
Subject: Re: [PATCH 10/15] hw/nvme: Make max_ioqpairs and msix_qsize
 configurable in runtime
Message-ID: <YYJ8Y/a2bXWsQP3l@apples.localdomain>
References: <20211007162406.1920374-1-lukasz.maniak@linux.intel.com>
 <20211007162406.1920374-11-lukasz.maniak@linux.intel.com>
 <YXBonn0gwolecWnp@apples.localdomain>
 <20211021134012.GA30845@lgieryk-VirtualBox>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="rknbIBNxmnFJmhSW"
Content-Disposition: inline
In-Reply-To: <20211021134012.GA30845@lgieryk-VirtualBox>
Received-SPF: pass client-ip=66.111.4.25; envelope-from=its@irrelevant.dk;
 helo=out1-smtp.messagingengine.com
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
Cc: Keith Busch <kbusch@kernel.org>,
 Lukasz Maniak <lukasz.maniak@linux.intel.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--rknbIBNxmnFJmhSW
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Oct 21 15:40, =C5=81ukasz Gieryk wrote:
> On Wed, Oct 20, 2021 at 09:06:06PM +0200, Klaus Jensen wrote:
> > On Oct  7 18:24, Lukasz Maniak wrote:
> > > From: =C5=81ukasz Gieryk <lukasz.gieryk@linux.intel.com>
> > >=20
> > > The Nvme device defines two properties: max_ioqpairs, msix_qsize. Hav=
ing
> > > them as constants is problematic for SR-IOV support.
> > >=20
> > > The SR-IOV feature introduces virtual resources (queues, interrupts)
> > > that can be assigned to PF and its dependent VFs. Each device, follow=
ing
> > > a reset, should work with the configured number of queues. A single
> > > constant is no longer sufficient to hold the whole state.
> > >=20
> > > This patch tries to solve the problem by introducing additional
> > > variables in NvmeCtrl=E2=80=99s state. The variables for, e.g., manag=
ing queues
> > > are therefore organized as:
> > >=20
> > >  - n->params.max_ioqpairs =E2=80=93 no changes, constant set by the u=
ser.
> > >=20
> > >  - n->max_ioqpairs - (new) value derived from n->params.* in realize(=
);
> > >                      constant through device=E2=80=99s lifetime.
> > >=20
> > >  - n->(mutable_state) =E2=80=93 (not a part of this patch) user-confi=
gurable,
> > >                         specifies number of queues available _after_
> > >                         reset.
> > >=20
> > >  - n->conf_ioqpairs - (new) used in all the places instead of the =E2=
=80=98old=E2=80=99
> > >                       n->params.max_ioqpairs; initialized in realize()
> > >                       and updated during reset() to reflect user=E2=
=80=99s
> > >                       changes to the mutable state.
> > >=20
> > > Since the number of available i/o queues and interrupts can change in
> > > runtime, buffers for sq/cqs and the MSIX-related structures are
> > > allocated big enough to handle the limits, to completely avoid the
> > > complicated reallocation. A helper function (nvme_update_msixcap_ts)
> > > updates the corresponding capability register, to signal configuration
> > > changes.
> > >=20
> > > Signed-off-by: =C5=81ukasz Gieryk <lukasz.gieryk@linux.intel.com>
> >=20
> > Instead of this, how about adding new parameters, say, sriov_vi_private
> > and sriov_vq_private. Then, max_ioqpairs and msix_qsize are still the
> > "physical" limits and the new parameters just reserve some for the
> > primary controller, the rest being available for flexsible resources.
>=20
> Compare your configuration:
>=20
>     max_ioqpairs     =3D 26
>     sriov_max_vfs    =3D 4
>     sriov_vq_private =3D 10
>=20
> with mine:
>=20
>     max_ioqpairs        =3D 10
>     sriov_max_vfs       =3D 4
>     sriov_max_vq_per_vf =3D 4
>=20
> In your version, if I wanted to change max_vfs but keep the same number
> of flexible resources per VF, then I would have to do some math and
> update max_ioparis. And then I also would have to adjust the other
> interrupt-related parameter, as it's also affected. In my opinion
> it's quite inconvenient.

True, that is probably inconvenient, but we have tools to do this math
for us. I very much prefer to be explicit in these parameters.

Also, see my comment on patch 12. If we keep this meaning of
max_ioqpairs, then we have reasonable defaults for the number of private
resources (if no flexible resources are required) and I think we can
control all parameters in the capabilities structures (with a little
math).

> =20
> Now, even if I changed the semantic of params, I would still need most
> of this patch. (Let=E2=80=99s keep the discussion regarding if max_* fiel=
ds are
> necessary in the other thread).
>=20
> Without virtualization, the maximum number of queues is constant. User
> (i.e., nvme kernel driver) can only query this value (e.g., 10) and
> needs to follow this limit.
>=20
> With virtualization, the flexible resources kick in. Let's continue with
> the sample numbers defined earlier (10 private + 16 flexible resources).
>=20
> 1) The device boots, all 16 flexible queues are assigned to the primary
>    controller.
> 2) Nvme kernel driver queries for the limit (10+16=3D26) and can create/u=
se
>    up to this many queues.=20
> 3) User via the virtualization management command unbinds some (let's
>    say 2) of the flexible queues from the primary controller and assigns
>    them to a secondary controller.
> 4) After reset, the Physical Function Device reports different limit
>    (24), and when the Virtual Device shows up, it will report 1 (adminQ
>    consumed the other resource).=20
>=20
> So I need additional variable in the state to store the intermediate
> limit (24 or 1), as none of the existing params has the correct value,
> and all the places that validate limits must work on the value.
>=20

I do not contest that you need additional state to keep track of
assigned resources. That seems totally reasonable.

--rknbIBNxmnFJmhSW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmGCfGEACgkQTeGvMW1P
DemRvQgAjz4KyW6rucWSl9FOkJWCwlws86vosaA5mC/I1FXvmBm7GhHTmVHc/ZJ5
Arq4q3KHU0zrJxoQklRiJxqkqBJf8RbFI8TEKVvB1llGc5pjuYJc3ACq4H7tkBz9
duoQi2gYwarVXMV6NMqKRLxJsFzQ5Hq+DMyuFM4comx4G7KJHlMTGL6a1vuu1IJZ
QQOJoyjAeIWFa+li/xAq7fBuplBhb2MYCrwabDRGtJpU2uDfW7JuZ2LteeXIfslv
AmEBrZP6cpoHl4jSVw8beJc6F8AAlnamXcqtT+sZYjqou4rzmsdJKRUARH0+vKhW
F73+sEoE2UeS/H1PVjHnu0VscfUHhg==
=by9g
-----END PGP SIGNATURE-----

--rknbIBNxmnFJmhSW--

