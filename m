Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4669147B18F
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 17:45:40 +0100 (CET)
Received: from localhost ([::1]:47834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzLn9-0008Gu-3y
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 11:45:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mzKTQ-0002gZ-9M; Mon, 20 Dec 2021 10:21:14 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:49705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mzKT4-0007gj-F6; Mon, 20 Dec 2021 10:21:00 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 545165C00BC;
 Mon, 20 Dec 2021 02:12:10 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 20 Dec 2021 02:12:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=0LDCv//ltKea064/b9PeuVDcGfm
 CiWsMMBtn9DZMnLM=; b=E/VNOWeTVNcb9Gjru2HUv92gpku1CMbhAZW5e/A0Sts
 vLV/StoAzvub4rDxhLSRI5jBv+wAa7gdL+mO2TIYjk4QtPfdG9rCg10P11nTS+YL
 xwUiwJb0PKWzzHmKNdzifN3S+SCfREBSN3+r88sktDcGpGzNSd1Vj6FcHzCURcJr
 PKuM3nDOQB0jhrpuKOp+8YCIUZvk6gZCQAegYDZqhufaOFu6pWKTZEjCuNke5fQB
 Zf6emTxZvF5Vv96Rod73FPJyyUHjSdmIkZVTNxU4tVBuSx7eycWb+qokOGaqdd+N
 Hoo4W5K9CWg79jO4yT5hLGCx67qVRmqcihwOd4RzBwA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=0LDCv/
 /ltKea064/b9PeuVDcGfmCiWsMMBtn9DZMnLM=; b=eFtMGW5zP4OxPJOymOJVi9
 EkFwxfe12i6ExHBDDgaNbWnKInuXVFPsvyoYHsQvIZFtlxlpSzYUPUGZJZiGoO0F
 qm6MgflBUp5DBKtts23FtlPMK5U0hctZScI1a9wDE/rkmzJARTI8eHUI8Gpw4dJp
 dgwi/C1FwT+4BLxKFsjbxjGgaD/RxcBij4bOm874j+IZxwZo2eQuZGI0lMOrO2Nv
 Db/Qm0zXe+tDGbSHw2pJft0Dx8ICNSYARBv7WCkcHZmkijnxpYJqdyeLR4cv9IR1
 P3FKqyhW1kc6k1pfQmbXBSbMb2rhU5/wgY/3DrM9QBxolTaUl9I3WXJ3ImVF5NIQ
 ==
X-ME-Sender: <xms:ySzAYQWxEDqhw_Sp4pkSSsT60ecTEbmSEI9jfljMEhZGSBfhCRjzUA>
 <xme:ySzAYUn5t4Ydr0_YXafXCBtJAh1CBq38D5NQ7stwRuae72smcaCPHxnRwdfdX_TB6
 TtG_x_1t_k-Ejxipto>
X-ME-Received: <xmr:ySzAYUYS-bpKzHHWZh3KL0QSi-mjI5XygnklplRACPlnxt-zEVC10DrrGnGYVzJ0NKF4DHuKMFeqV6R3e7PktxbrhLGdZhoO2A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddruddtuddguddtiecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepudegfeevgeefudfhueeludfgueefteehuefhueffjeeglefggfdtfeefuddv
 tdevnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpe
 dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:ySzAYfUX4zMxxjZ89e7n2jzReRRN1LHurMgEUg_2e2XblJ_0x2uxDQ>
 <xmx:ySzAYakVV-fvtzUBNfc5Ak4JgVbwOvWB9gNt6zvEm_CPi3seJkrHpA>
 <xmx:ySzAYUerPMTnEQX5kKzoKELSvCe9dOgsK3BWebhqwLnJVTeAEh8oKg>
 <xmx:yizAYbDO10-yZta2q7hRXUd_tI_rHQ2QxZdrckTYXxT1Z_RKK89D-g>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 20 Dec 2021 02:12:08 -0500 (EST)
Date: Mon, 20 Dec 2021 08:12:06 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: =?utf-8?Q?=C5=81ukasz?= Gieryk <lukasz.gieryk@linux.intel.com>
Subject: Re: [PATCH v2 00/15] hw/nvme: SR-IOV with Virtualization Enhancements
Message-ID: <YcAsxmA2gG1yET2S@apples>
References: <20211116153446.317143-1-lukasz.gieryk@linux.intel.com>
 <YZ3xurkIxozrTbqu@apples.localdomain>
 <20211125141534.GA28269@lgieryk-VirtualBox>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="xpibQy1regq7Ssn1"
Content-Disposition: inline
In-Reply-To: <20211125141534.GA28269@lgieryk-VirtualBox>
Received-SPF: pass client-ip=66.111.4.29; envelope-from=its@irrelevant.dk;
 helo=out5-smtp.messagingengine.com
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
Cc: kbusch@kernel.org, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Lukasz Maniak <lukasz.maniak@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--xpibQy1regq7Ssn1
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Nov 25 15:15, =C5=81ukasz Gieryk wrote:
> On Wed, Nov 24, 2021 at 09:03:06AM +0100, Klaus Jensen wrote:
> > Hi Lukasz,
> >=20
> > I've been through this. I have a couple of review comments, but overall
> > looks good for inclusion in nvme-next. Would be nice to get this in
> > early in the cycle so it can mature there for 7.0.
>=20
> We (I=E2=80=99m speaking on behalf of the other Lukasz) are really happy =
to
> read that. We will do our best to make it happen.
>=20

Keith, do you have any comments on this series - otherwise I'd like to
stage this for nvme-next come January.

> >=20
> > I'd like that we mark this support experimental, so we can easily do
> > some changes to how parameters work since I'm not sure we completely
> > agree on that yet.
> >=20
> > By the way, in the future, please add me and Keith as CCs on the entire
> > series so we get CC'ed on replies to the cover-letter ;)
> >=20
>=20
> > > List of known gaps and nice-to-haves:
> > >=20
> > > 1) Interaction of secondary controllers with namespaces is not 100%
> > > following the spec
> > >=20
> > > The limitation: VF has to be visible on the PCI bus first, and only t=
hen
> > > such VF can have a namespace attached.
> > >=20
> >=20
> > Looking at the spec I'm not even sure what the expected behavior is
> > supposed to be, can you elaborate? I rebased this on latest, and with
> > Hannes changes, shared namespaces will be attached by default, which
> > seems to be reasonable.
>=20
> An example flow:
>=20
> # Release flexible resources from PF (assuming it=E2=80=99s /dev/nvme0)
> nvme virt-mgmt -c 0 -r 0 -n 0 -a 1 /dev/nvme0
> nvme virt-mgmt -c 0 -r 1 -n 0 -a 1 /dev/nvme0
> echo 1 > /sys/class/nvme/nvme0/reset_controller
> # Bind sane minimums to VF1 (cntlid=3D1) and set it online
> nvme virt-mgmt -c 1 -r 0 -n 5 -a 8 /dev/nvme0
> nvme virt-mgmt -c 1 -r 1 -n 5 -a 8 /dev/nvme0
> nvme virt-mgmt -c 1 -a 9 /dev/nvme0
> # Enable 2 VFs
> echo 2 > /sys/bus/pci/devices/<PF=E2=80=99s id>/sriov_numvfs
> # PF, VF1 and VF2 are visible on PCI
> lspci | grep Non-Volatile
> # The NVMe driver is bound to PF and VF1 (the only online VF)
> nvme list -v
> # VFs shall eventually not support Ns Management/Attachment commands,
> # and namespaces should be attached to VFs (i.e., their secondary
> # controllers) through the PF.
> # A namespace can be attached to VF1, VF2
> nvme attach-ns /dev/nvme0 -c 1 -n X
> nvme attach-ns /dev/nvme0 -c 2 -n X
> # According to the spec this should also succeed, but today it won=E2=80=
=99t
> nvme attach-ns /dev/nvme0 -c 3 -n X
>=20
> VF3=E2=80=99s NvmeCtrl object is not yet allocated, so today there=E2=80=
=99s nothing
> for nvme_subsys_ctrl() to return for cntlid=3D3, besides NULL (the
> current behavior) or SUBSYS_SLOT_RSVD.
>=20
> Relevant use cases:
>  - admin can configure disabled VFs,
>  - information about attached ns persists when VFs are disabled,
> are not that critical, but of course it=E2=80=99s a discrepancy from what=
 a
> real device can handle.
>=20
> In my opinion, to handle the cases correctly, information about attached
> namespaces could be moved to subsystem. Could you share your thoughts
> whether such approach would make sense?
>=20

Thanks for the explaination.

I actually already had this sort-of conversation with Hannes[1].
Different issue, but same solution (that is, having a per-CNTLID
namespace list maintained in the subsystem).

I have a refactor series coming up that will address this, so for now, I
don't worry about this not being implemented exactly as the spec defines.

  [1]: https://lore.kernel.org/all/20210909094308.122038-1-hare@suse.de/t/#u

--xpibQy1regq7Ssn1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmHALMQACgkQTeGvMW1P
DemMDgf/TuO3yLvCmt3Q6oKURxszEoMXO1i3ukJARffYUYL7TPase6y243Vqz8/p
NCTyxdmm4oEJH52R4HPA6Vx8CPxURbw9onk0Fo+oe/EI2pI14esPBAwbnYblq6yZ
B6cz/TvDv+NGvMaznq8SuDaV/TxsI3iLY+0luvVcgT/vIX/xjxZTZEuk5lxX6bWD
WLJlNqaN96/o/KE783ardNhoGhqejVCPTwffjAzU9DN6kFYoSrk7WCOcF8g3nLM3
yHwmJqqLZAkUkGhdZ0JAlCsbWi3mR2tzXOhh31kbPCZCkWrRjI9D/11CKFEar/8P
GzVTxmRubz2IUib2ZiDXKK0ZFOM3aQ==
=7Cv+
-----END PGP SIGNATURE-----

--xpibQy1regq7Ssn1--

