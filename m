Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E7C2FB120
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 07:08:32 +0100 (CET)
Received: from localhost ([::1]:53322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1kBr-0006EW-TQ
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 01:08:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l1k7j-0005VR-JI; Tue, 19 Jan 2021 01:04:15 -0500
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:52181)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l1k7g-00084Y-Lf; Tue, 19 Jan 2021 01:04:15 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 25D72D50;
 Tue, 19 Jan 2021 01:04:08 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 19 Jan 2021 01:04:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=JQMXC7rz6mG5MsCH+gJgfPe7xJP
 XTdGeEk5XhiyifqQ=; b=Gxg/zZApUSpDMYjVINQRi8qcSH2UzfEhuepLmX80l8y
 NhDYo3pxV1cG5q8Cd+vIbvlmPC5/28B5BmmdrPfclCQACYFKqqWOs0bOxOLTd7Qd
 /1NC7lwTSj6GTC8dYO5Rqx7TPeVOmkATC1Ls9pOxU8ZPzSmsjeYIDzWzjp+Rz1c/
 D+qZusPTgH/vFLgGYxmmWY9FXXF7XMjNaLwq8qA7M820bNu4UJxMQPb8QWOtFpgL
 aUwKrXyf6i1nxkiUI83X8mKU6cr7FBuQOStR3SmXCz6IJHDZ1Pq2mtI45UNIVEJ1
 pCpr58cGh499MkEuGbXjIZzkHtlZRiz94YZKxGEq3Sw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=JQMXC7
 rz6mG5MsCH+gJgfPe7xJPXTdGeEk5XhiyifqQ=; b=pvxumKkAckp1UipKeHIZf5
 26jOOifbGpD1jvYSbzNWXqTos3protig0WSumoax3c52/ec3U9v1Nc0TyHp4aE2u
 EYVfh63g0WVWhAkYKjzF1xYeisnQ6r3ocZRG7d1Gw9rPMxIipDRRpMxLQ6b3Z8yT
 nLdMyW7QP8T3m6jV/8wt+9Ur4BBdXwiV5Ctu1jXrRVpLMDh30OX7mZhde27nYIkr
 mXXrAePR65JsT7ShEq9iX4D69W7S/ZjXadbnFgqEd/94VR3S40njxCZ70H6gljAV
 XUwJuuV62WNbQzQ9AgLTGGU5TVQq7JNTPvMbzUWzEl0l2zhK8J7vzfhWmXPO15kw
 ==
X-ME-Sender: <xms:V3YGYDjlkt0dePFfeTCExLBc_6AZJ_sUBvXfmCfHZptnHDyLCg8WQA>
 <xme:V3YGYAAFEnkCOSFOlkmi1sd1i4FN3eRLYw00Z_ezBhthHcj8ISDbzHDMR4nDN8K7j
 pAts5FIZCllx7qvA7o>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrtdelgdeklecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepheeghefgffegkeevfeettedukeehjefftdevvddugfffleelfedvffdtkefggfdu
 necuffhomhgrihhnpedvtdduledqtdekrdhorhhgnecukfhppeektddrudeijedrleekrd
 duledtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
 ihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:V3YGYDF5ilCMk3_UVmaEQFP1Pj1VnYc8lCXpVICsKkfsFxv1e2JLbg>
 <xmx:V3YGYAQM5y-ScJoQ7Af1MW-bWkXeV30axT7lWVkrDwSgPpdgQ2XxkQ>
 <xmx:V3YGYAx6H8Jz1vyNIqJ9FDdHYt43mevDRQgx3LoG-Bp4UTH5tj7rbA>
 <xmx:V3YGYKtxs_9FgWTag_sC0rZppZRwfYpurfmbuCCC_pZriXEQuPeGIA>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 59A13240057;
 Tue, 19 Jan 2021 01:04:06 -0500 (EST)
Date: Tue, 19 Jan 2021 07:04:04 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Minwoo Im <minwoo.im.dev@gmail.com>
Subject: Re: [RFC PATCH V2 00/11] hw/block/nvme: support multi-path for ctrl/ns
Message-ID: <YAZ2VOn3Dn26YE6R@apples.localdomain>
References: <20210117145341.23310-1-minwoo.im.dev@gmail.com>
 <YAX6RcpFiX9xthQI@apples.localdomain>
 <20210119032126.GD5939@localhost.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ovF8RA+hkSffvFEe"
Content-Disposition: inline
In-Reply-To: <20210119032126.GD5939@localhost.localdomain>
Received-SPF: pass client-ip=64.147.123.21; envelope-from=its@irrelevant.dk;
 helo=wout5-smtp.messagingengine.com
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
Cc: Keith Busch <kbusch@kernel.org>, Kevin Wolf <kwolf@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--ovF8RA+hkSffvFEe
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jan 19 12:21, Minwoo Im wrote:
> On 21-01-18 22:14:45, Klaus Jensen wrote:
> > On Jan 17 23:53, Minwoo Im wrote:
> > > Hello,
> > >=20
> > > This patch series introduces NVMe subsystem device to support multi-p=
ath
> > > I/O in NVMe device model.  Two use-cases are supported along with this
> > > patch: Multi-controller, Namespace Sharing.
> > >=20
> > > V1 RFC has been discussed with Klaus and Keith, I really appreciate t=
hem
> > > for this patch series to have proper direction [1].
> > >=20
> > > This patch series contains few start-up refactoring pathces from the
> > > first to fifth patches to make nvme-ns device not to rely on the nvme
> > > controller always.  Because nvme-ns shall be able to be mapped to the
> > > subsystem level, not a single controller level so that it should prov=
ide
> > > generic initialization code: nvme_ns_setup() with NvmeCtrl.  To do th=
at,
> > > the first five patches are to remove the NvmeCtrl * instance argument
> > > from the nvme_ns_setup().  I'd be happy if they are picked!
> > >=20
> > > For controller and namespace devices, 'subsys' property has been
> > > introduced to map them to a subsystem.  If multi-controller needed, we
> > > can specify 'subsys' to controllers the same.
> > >=20
> > > For namespace deivice, if 'subsys' is not given just like it was, it
> > > will have to be provided with 'bus' parameter to specify a nvme
> > > controller device to attach, it means, they are mutual-exlusive.  To
> > > share a namespace between or among controllers, then nvme-ns should h=
ave
> > > 'subsys' property to a single nvme subsystem instance.  To make a
> > > namespace private one, then we need to specify 'bus' property rather
> > > than the 'subsys'.
> > >=20
> > > Of course, this series does not require any updates for the run comma=
nd
> > > for the previos users.
> > >=20
> > > Plase refer the following example with nvme-cli output:
> > >=20
> > > QEMU Run:
> > >   -device nvme-subsys,id=3Dsubsys0 \
> > >   -device nvme,serial=3Dfoo,id=3Dnvme0,subsys=3Dsubsys0 \
> > >   -device nvme,serial=3Dbar,id=3Dnvme1,subsys=3Dsubsys0 \
> > >   -device nvme,serial=3Dbaz,id=3Dnvme2,subsys=3Dsubsys0 \
> > >   -device nvme-ns,id=3Dns1,drive=3Ddrv10,nsid=3D1,subsys=3Dsubsys0 \
> > >   -device nvme-ns,id=3Dns2,drive=3Ddrv11,nsid=3D2,bus=3Dnvme2 \
> > >   \
> > >   -device nvme,serial=3Dqux,id=3Dnvme3 \
> > >   -device nvme-ns,id=3Dns3,drive=3Ddrv12,nsid=3D3,bus=3Dnvme3
> > >=20
> > > nvme-cli:
> > >   root@vm:~/work# nvme list -v
> > >   NVM Express Subsystems
> > >=20
> > >   Subsystem        Subsystem-NQN                                     =
                                               Controllers
> > >   ---------------- --------------------------------------------------=
---------------------------------------------- ----------------
> > >   nvme-subsys1     nqn.2019-08.org.qemu:subsys0                      =
                                               nvme0, nvme1, nvme2
> > >   nvme-subsys3     nqn.2019-08.org.qemu:qux                          =
                                               nvme3
> > >=20
> > >   NVM Express Controllers
> > >=20
> > >   Device   SN                   MN                                   =
    FR       TxPort Address        Subsystem    Namespaces
> > >   -------- -------------------- -------------------------------------=
--- -------- ------ -------------- ------------ ----------------
> > >   nvme0    foo                  QEMU NVMe Ctrl                       =
    1.0      pcie   0000:00:06.0   nvme-subsys1 nvme1n1
> > >   nvme1    bar                  QEMU NVMe Ctrl                       =
    1.0      pcie   0000:00:07.0   nvme-subsys1 nvme1n1
> > >   nvme2    baz                  QEMU NVMe Ctrl                       =
    1.0      pcie   0000:00:08.0   nvme-subsys1 nvme1n1, nvme1n2
> > >   nvme3    qux                  QEMU NVMe Ctrl                       =
    1.0      pcie   0000:00:09.0   nvme-subsys3
> > >=20
> > >   NVM Express Namespaces
> > >=20
> > >   Device       NSID     Usage                      Format           C=
ontrollers
> > >   ------------ -------- -------------------------- ---------------- -=
---------------
> > >   nvme1n1      1        134.22  MB / 134.22  MB    512   B +  0 B   n=
vme0, nvme1, nvme2
> > >   nvme1n2      2        268.44  MB / 268.44  MB    512   B +  0 B   n=
vme2
> > >   nvme3n1      3        268.44  MB / 268.44  MB    512   B +  0 B   n=
vme3
> > >=20
> > > Summary:
> > >   - Refactored nvme-ns device not to rely on controller during the
> > >     setup.  [1/11 - 5/11]
> > >   - Introduced a nvme-subsys device model. [6/11]
> > >   - Create subsystem NQN based on subsystem. [7/11]
> > >   - Introduced multi-controller model. [8/11 - 9/11]
> > >   - Updated namespace sharing scheme to be based on nvme-subsys
> > >     hierarchy. [10/11 - 11/11]
> > >=20
> > > Since RFC V1:
> > >   - Updated namespace sharing scheme to be based on nvme-subsys
> > >     hierarchy.
> > >=20
> >=20
> > Great stuff Minwoo. Thanks!
> >=20
> > I'll pick up [01-05/11] directly since they are pretty trivial.
>=20
> Thanks! will prepare the next series based on there.
>=20
> > The subsystem model looks pretty much like it should, I don't have a lot
> > of comments.
> >=20
> > One thing that I considered, is if we should reverse the "registration"
> > and think about it as namespace attachment. The spec is about
> > controllers attaching to namespaces, not the other way around.
> > Basically, let the namespaces be configured first and register on the
> > subsystem (accumulating in a "namespaces" array), then have the
> > controllers register with the subsystem and attach to all "non-detached"
> > namespaces. This allows detached namespaces to "linger" in the subsystem
> > to be attached later on. If there are any private namespaces (like ns2
> > in your example above), it will be defined after the controller with the
> > bus=3DctrlX parameter like normal.
>=20
> Revisited spec. again.  5.19 says "The Namespace Attachment command is
> used to attach and detach controllers from a namespace.".  and 5.20 says
> "Host software uses the Namespace Attachment command to attach or detach
> a namespace to or from a controller. The create operation does not attach
> the namespace to a controller."
>=20

Yeah ok, that is pretty inconsistent.

> 	-device nvme-subsys,id=3Dsubsys0
> 	-device nvme-ns,id=3Dns1,drive=3D<drv>,nsid=3D1,subsys=3Dsubsys0
> 	-device nvme,id=3Dnvme0,serial=3Dfoo,subsys=3Dsubsys0
>=20
> In this case, the 'nvme0' controller will have no namespace at the
> initial time of the boot-up.  'nvme0' can be attached to the namespace
> 'ns1' with namespace attach command.  'nvme-ns' device is same as the
> 'create-ns' operation in a NVMe subsystem.  This makes sense as spec
> 5.19 says "from a namespace".
>=20
> 	-device nvme,id=3Dnvme1,serial=3Dbar,subsys=3Dsubsys0b
> 	-device nvme-ns,id=3Dns2,drive=3D<drv>,nsid=3D1,bus=3Dnvme1
>=20
> This case if for private namespace directly attached to controller.
> This makes sense as spec 5.20 says "to or from a controller".
>=20
> All looks fine to me, but one thing I an wondering is that how can we
> attach a controller to shared namespace(s) at the initial time?
>=20

Ok, nevermind. I think we can get 'detached' functionality in either
case, so no need to increase complexity by requiring a change of define
order.

Supporting CNS 0x12 and 0x13 (Identify, Controller List), we need the
controllers registered and stored in the subsystem anyway.

So, can we add a 'namespaces' array on the subsystem to keep a list of
namespaces and add a 'detached' parameter on the nvme-ns device? If that
parameter is given, the device is not registered with the controllers.

--ovF8RA+hkSffvFEe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmAGdlIACgkQTeGvMW1P
DenkNAf9FWcoAqmdxTLLG4E9ZXXGsxpfU2Lp266qQh/iKBTL6ObapzuuoujjCPoN
07vAfJZFqrNoc26klrezl/zmlC4bfNxSuYIN7oCjyz3VZvqjMjeeXyZWSkigoS2y
Co22rBu/11T39pQu+wXu170QBVJKNjdrgaOkGt8ZwpYsdFllMAw653yOMfedo/XO
JAvjD9FUe5xgEvm/jq2HyB2ib9vJwd/izl8nhHkkqZWFfuTvFm1qOV85LA5zKtHQ
gjhpsa+s5igJ++PYOwPJIYe6HZk5vamcia/WRmJvCUDPEF1QJ6QjBczjwgJr+2+c
cjhpUlRsSbDT8Hkmqe23ExNeDDxwrA==
=dMrq
-----END PGP SIGNATURE-----

--ovF8RA+hkSffvFEe--

