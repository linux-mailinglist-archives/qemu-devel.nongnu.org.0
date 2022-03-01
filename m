Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72A5B4C8BBC
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 13:36:26 +0100 (CET)
Received: from localhost ([::1]:55898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nP1js-0000fz-Vr
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 07:36:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nP1XJ-0002qv-Pz; Tue, 01 Mar 2022 07:23:25 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:44857)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nP1XG-0004dB-Qj; Tue, 01 Mar 2022 07:23:24 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 062785C017C;
 Tue,  1 Mar 2022 07:23:22 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Tue, 01 Mar 2022 07:23:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; bh=+3soqPys/wPoX6h+1SmI7CtRFP4GvF
 wFQueSQWws4aQ=; b=RIuudcCqQUiWOfOmuRmaP56sd3WXzwAfmgNxJN8UjDZNw/
 hBnzNPXjvWOKloP0EqO09maorbqB3hZICLrt6SOyFUVB0T67dnAtnb2nDA/gsx34
 KCjF8SRZCVXBjgjy9S2lHja5yn+jXEif8xznGPGU1dg7St5PnGGinrn8PLO+k34l
 NtJKQlVvrVP4NIOkewzGWkjv7czy4u2IZJ2H4PGSpz/tOfsu8P4M/txxdETMNKi+
 j0KTT2AwVJ1i6TYIpz/Sg4t4TG7yU2nBnRgEuIAm5bKSfTvHedThQrLUb4Qtf99u
 00oLlsd3tV+Gntb6LMRwIteXDVVD5LtDNMBe+5NA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=+3soqPys/wPoX6h+1
 SmI7CtRFP4GvFwFQueSQWws4aQ=; b=OlBGy/eJ9v/0daWZzQfvwXDd59WvbgaBt
 FqCe8GiRlxCip8N56t2uLQFysXGlqWL8xUf9WqAjPpnTVUc0Bn4zdKpnnnSj/7n0
 Uiee/aC/FjTKzjFzsxc1jIz4cv4Sz8RjVWC5w0rDn293t16+ZdP4P9QvQJSdxEDI
 M1fSXmtHn1BzRfo2xU/Enf4iDf9jcPx4C96nNIgJziCANu9htND2di5Qx19pJ0mu
 b/CK+L1z7xNc7AVcGQoRHChaXPAsihrXCCV0vUrftUWjKx1Td/q1UGo6oUOtcPEU
 /K2f9kdUwowYo40gqts3iQCtJ0GXmyr0IZZ8jApmry5xWfQqYP8Jw==
X-ME-Sender: <xms:ORAeYn3pZtmCZfL9jycHmubrV95tewYUexkAB1OEUmndbC6fGqLqZg>
 <xme:ORAeYmHUyfMyE15lWDKU1XQ3_s1fvK5y1VFUWz9djkru8luz-2pADAiJPZ5gOn5OO
 mXBvFP_4jtvqE1Yh4c>
X-ME-Received: <xmr:ORAeYn7rigA88lBktK77eeshe2AE7wCLEoOiQSwZBMuDwxmaAyvHDzK2m4vLOTDjMKHnkZJHneTCruGTgUY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddruddtvddgfeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:ORAeYs3kxKtCaDV75mXu_QJdCUboUvtTib34D1VhFvAc_JLydg3leQ>
 <xmx:ORAeYqFdpffhmhoTO4b_cXPDeUkFfxX9iuhbvFpa9H7z6_YWSWh5ug>
 <xmx:ORAeYt8f2nIC2a79Zs6Vo_yboCi0qeD2DDvhcL0I3ySfeGL2dDdCgQ>
 <xmx:OhAeYoav42U0x2Gn-a6o1VxRcO02xKoUY1DO1GequbFQQew0zyAv_g>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 1 Mar 2022 07:23:20 -0500 (EST)
Date: Tue, 1 Mar 2022 13:23:18 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Lukasz Maniak <lukasz.maniak@linux.intel.com>
Subject: Re: [PATCH v5 14/15] docs: Add documentation for SR-IOV and
 Virtualization Enhancements
Message-ID: <Yh4QNqgQ+jl+sZCC@apples>
References: <20220217174504.1051716-1-lukasz.maniak@linux.intel.com>
 <20220217174504.1051716-15-lukasz.maniak@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="V6IWJgBnCeO4k4T7"
Content-Disposition: inline
In-Reply-To: <20220217174504.1051716-15-lukasz.maniak@linux.intel.com>
Received-SPF: pass client-ip=66.111.4.29; envelope-from=its@irrelevant.dk;
 helo=out5-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-block@nongnu.org,
 =?utf-8?Q?=C5=81ukasz?= Gieryk <lukasz.gieryk@linux.intel.com>,
 qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Keith Busch <kbusch@kernel.org>,
 Klaus Jensen <k.jensen@samsung.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--V6IWJgBnCeO4k4T7
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Feb 17 18:45, Lukasz Maniak wrote:
> Signed-off-by: Lukasz Maniak <lukasz.maniak@linux.intel.com>

Please add a short commit description as well. Otherwise,

Reviewed-by: Klaus Jensen <k.jensen@samsung.com>

> ---
>  docs/system/devices/nvme.rst | 82 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 82 insertions(+)
>=20
> diff --git a/docs/system/devices/nvme.rst b/docs/system/devices/nvme.rst
> index b5acb2a9c19..aba253304e4 100644
> --- a/docs/system/devices/nvme.rst
> +++ b/docs/system/devices/nvme.rst
> @@ -239,3 +239,85 @@ The virtual namespace device supports DIF- and DIX-b=
ased protection information
>    to ``1`` to transfer protection information as the first eight bytes of
>    metadata. Otherwise, the protection information is transferred as the =
last
>    eight bytes.
> +
> +Virtualization Enhancements and SR-IOV (Experimental Support)
> +-------------------------------------------------------------
> +
> +The ``nvme`` device supports Single Root I/O Virtualization and Sharing
> +along with Virtualization Enhancements. The controller has to be linked =
to
> +an NVM Subsystem device (``nvme-subsys``) for use with SR-IOV.
> +
> +A number of parameters are present (**please note, that they may be
> +subject to change**):
> +
> +``sriov_max_vfs`` (default: ``0``)
> +  Indicates the maximum number of PCIe virtual functions supported
> +  by the controller. Specifying a non-zero value enables reporting of bo=
th
> +  SR-IOV and ARI (Alternative Routing-ID Interpretation) capabilities
> +  by the NVMe device. Virtual function controllers will not report SR-IO=
V.
> +
> +``sriov_vq_flexible``
> +  Indicates the total number of flexible queue resources assignable to a=
ll
> +  the secondary controllers. Implicitly sets the number of primary
> +  controller's private resources to ``(max_ioqpairs - sriov_vq_flexible)=
``.
> +
> +``sriov_vi_flexible``
> +  Indicates the total number of flexible interrupt resources assignable =
to
> +  all the secondary controllers. Implicitly sets the number of primary
> +  controller's private resources to ``(msix_qsize - sriov_vi_flexible)``.
> +
> +``sriov_max_vi_per_vf`` (default: ``0``)
> +  Indicates the maximum number of virtual interrupt resources assignable
> +  to a secondary controller. The default ``0`` resolves to
> +  ``(sriov_vi_flexible / sriov_max_vfs)``
> +
> +``sriov_max_vq_per_vf`` (default: ``0``)
> +  Indicates the maximum number of virtual queue resources assignable to
> +  a secondary controller. The default ``0`` resolves to
> +  ``(sriov_vq_flexible / sriov_max_vfs)``
> +
> +The simplest possible invocation enables the capability to set up one VF
> +controller and assign an admin queue, an IO queue, and a MSI-X interrupt.
> +
> +.. code-block:: console
> +
> +   -device nvme-subsys,id=3Dsubsys0
> +   -device nvme,serial=3Ddeadbeef,subsys=3Dsubsys0,sriov_max_vfs=3D1,
> +    sriov_vq_flexible=3D2,sriov_vi_flexible=3D1
> +
> +The minimum steps required to configure a functional NVMe secondary
> +controller are:
> +
> +  * unbind flexible resources from the primary controller
> +
> +.. code-block:: console
> +
> +   nvme virt-mgmt /dev/nvme0 -c 0 -r 1 -a 1 -n 0
> +   nvme virt-mgmt /dev/nvme0 -c 0 -r 0 -a 1 -n 0
> +
> +  * perform a Function Level Reset on the primary controller to actually
> +    release the resources
> +
> +.. code-block:: console
> +
> +   echo 1 > /sys/bus/pci/devices/0000:01:00.0/reset
> +
> +  * enable VF
> +
> +.. code-block:: console
> +
> +   echo 1 > /sys/bus/pci/devices/0000:01:00.0/sriov_numvfs
> +
> +  * assign the flexible resources to the VF and set it ONLINE
> +
> +.. code-block:: console
> +
> +   nvme virt-mgmt /dev/nvme0 -c 1 -r 1 -a 8 -n 1
> +   nvme virt-mgmt /dev/nvme0 -c 1 -r 0 -a 8 -n 2
> +   nvme virt-mgmt /dev/nvme0 -c 1 -r 0 -a 9 -n 0
> +
> +  * bind the NVMe driver to the VF
> +
> +.. code-block:: console
> +
> +   echo 0000:01:00.1 > /sys/bus/pci/drivers/nvme/bind
> \ No newline at end of file
> --=20
> 2.25.1
>=20

--=20
One of us - No more doubt, silence or taboo about mental illness.

--V6IWJgBnCeO4k4T7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmIeEDQACgkQTeGvMW1P
Denh8wf/WcwsJWwXOShyLqegnLHfk9CHdvUMOqfiW3ewhxAmgTZXtfXjwx6QANPa
1Rg0Vp8jmG6GkBbixN7NX5GwhdAoLOgJmoP7jxgUkSbL+hpZabV+DimxRhJlqYZ1
qc8RdrUtrXxfjU0dOltihVeWb4a8U+RP3R5Pqn7lBR17q/S94XNWkFdQ00CEj1Eg
BVucHWPTdDf7rrxyiJLlVjie2FFAjKzSvllPiK+HoSq/QM7YJY8hsZ5jfjsUm3jF
cSh7gRVBY2PPNtSVbGrTSYGspAdGAoBEAHR5Hz2qeQyBnW0wHTs1VJ/KjPfQO/ku
XsD8JrRAEjXPMB0lzAM41orp1OFafQ==
=dpux
-----END PGP SIGNATURE-----

--V6IWJgBnCeO4k4T7--

