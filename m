Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 669942FAC74
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 22:20:06 +0100 (CET)
Received: from localhost ([::1]:58786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1bwS-0006Oy-Nh
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 16:20:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l1brQ-0005fl-JP; Mon, 18 Jan 2021 16:14:52 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:48115)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l1brO-0006x5-DX; Mon, 18 Jan 2021 16:14:52 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id D343B5C00C6;
 Mon, 18 Jan 2021 16:14:48 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 18 Jan 2021 16:14:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=XdGfe1h3eeYguWybZrtd9kWZ/vU
 3VbNczWdxx5J8XyE=; b=QldKby9LJ4+/iRHzFT071y7P0K08OGQhjy6LKmLCVoE
 pfeBvbGghj//T7l/j48TzLc3MKgB+sR+jwxTeXVGABj2YKY5J9/g9x2RS7UfnXAz
 vZNcSwIvpF0AnPWJUs+G+CdOe4CjdeQp9eETjk5BiVBsv42Dm+qYIuZ34UGFtxij
 +SBxB1VaVWAhuiwflNbmYh+fXooKLkuTBk1nQU09e6MdOZne5Yi3VUl7oHlj4GBm
 +YQfpPM1xujQJgS711tg5BS7n/1kwEW+SMeIcHk7Rnj4UgpEAl829dwvNKi+BjKo
 50sQeecofnJ/DGXpWE7RgUgobvIu8Y0veoSDQA9+6Dg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=XdGfe1
 h3eeYguWybZrtd9kWZ/vU3VbNczWdxx5J8XyE=; b=hr6gZM3AlyUFolDDHcePtE
 ftwwgywnn/9dTVZ2aM61wOV0S9ohCVkab8OhUEo60HTL3VV9HPiTye0US0t+036+
 GQbRTCETVPlM+9LXu7QdXeLe0AjJOokMCPKVTmCC+1lR2pbBxqibWQ8OPlFp3Whh
 LvrQRkctsmIu9TS8qZ4glKyHTPryk2qD41udlJoy4UhlbCoYnpud5TYr/t/+M3oy
 9H5+SZa2kUv8Dsnpiew5WhZCtRmr0VH3f0aXXkqto2PkH0GW+01/AL988A6FFkzD
 YHaS9D4oR5U3xZjFwNsmYmfUNleS24Vapox3AxSzk5K29Fxs56Mj4zA2Eff9rDCQ
 ==
X-ME-Sender: <xms:SPoFYGLYwPASbO42ok7KpKxeWOjxzSup_J4v146TlIWrGKv-tyCyag>
 <xme:SPoFYOJJ0oIxtyDiAYqtWTH9W0icmeUWInNBLAOpzkVKj0BE07vU0Tj1IpaGfqIAT
 py-fkVfC2j1tKxlejM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrtdekgddugeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeehgeehgfffgeekveefteetudekheejffdtvedvudfgffelleefvdfftdekgffg
 udenucffohhmrghinhepvddtudelqddtkedrohhrghenucfkphepkedtrdduieejrdelke
 drudeltdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhm
 pehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:SPoFYGvZorFW07oqKA3bSnp0Q8jm-w0QVve3g06VbURk88ku3-roew>
 <xmx:SPoFYLYgNG8bKfz0RESy_hUC0SWvgSzEh4T_EwUolE_7zbQOrQ2A6g>
 <xmx:SPoFYNY1oWaIeop1-LilDHwbSuoXYQOXEn0_H5vdqQIyIJ96gZWn5g>
 <xmx:SPoFYMX8PCBv2CsowPzx1vZG6QD2NDBxAg_2QzHGUpYKe-5G3VfxjQ>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 71DBC24005C;
 Mon, 18 Jan 2021 16:14:47 -0500 (EST)
Date: Mon, 18 Jan 2021 22:14:45 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Minwoo Im <minwoo.im.dev@gmail.com>
Subject: Re: [RFC PATCH V2 00/11] hw/block/nvme: support multi-path for ctrl/ns
Message-ID: <YAX6RcpFiX9xthQI@apples.localdomain>
References: <20210117145341.23310-1-minwoo.im.dev@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="NGMolId4a56V0r0z"
Content-Disposition: inline
In-Reply-To: <20210117145341.23310-1-minwoo.im.dev@gmail.com>
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
Cc: Keith Busch <kbusch@kernel.org>, Kevin Wolf <kwolf@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--NGMolId4a56V0r0z
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jan 17 23:53, Minwoo Im wrote:
> Hello,
>=20
> This patch series introduces NVMe subsystem device to support multi-path
> I/O in NVMe device model.  Two use-cases are supported along with this
> patch: Multi-controller, Namespace Sharing.
>=20
> V1 RFC has been discussed with Klaus and Keith, I really appreciate them
> for this patch series to have proper direction [1].
>=20
> This patch series contains few start-up refactoring pathces from the
> first to fifth patches to make nvme-ns device not to rely on the nvme
> controller always.  Because nvme-ns shall be able to be mapped to the
> subsystem level, not a single controller level so that it should provide
> generic initialization code: nvme_ns_setup() with NvmeCtrl.  To do that,
> the first five patches are to remove the NvmeCtrl * instance argument
> from the nvme_ns_setup().  I'd be happy if they are picked!
>=20
> For controller and namespace devices, 'subsys' property has been
> introduced to map them to a subsystem.  If multi-controller needed, we
> can specify 'subsys' to controllers the same.
>=20
> For namespace deivice, if 'subsys' is not given just like it was, it
> will have to be provided with 'bus' parameter to specify a nvme
> controller device to attach, it means, they are mutual-exlusive.  To
> share a namespace between or among controllers, then nvme-ns should have
> 'subsys' property to a single nvme subsystem instance.  To make a
> namespace private one, then we need to specify 'bus' property rather
> than the 'subsys'.
>=20
> Of course, this series does not require any updates for the run command
> for the previos users.
>=20
> Plase refer the following example with nvme-cli output:
>=20
> QEMU Run:
>   -device nvme-subsys,id=3Dsubsys0 \
>   -device nvme,serial=3Dfoo,id=3Dnvme0,subsys=3Dsubsys0 \
>   -device nvme,serial=3Dbar,id=3Dnvme1,subsys=3Dsubsys0 \
>   -device nvme,serial=3Dbaz,id=3Dnvme2,subsys=3Dsubsys0 \
>   -device nvme-ns,id=3Dns1,drive=3Ddrv10,nsid=3D1,subsys=3Dsubsys0 \
>   -device nvme-ns,id=3Dns2,drive=3Ddrv11,nsid=3D2,bus=3Dnvme2 \
>   \
>   -device nvme,serial=3Dqux,id=3Dnvme3 \
>   -device nvme-ns,id=3Dns3,drive=3Ddrv12,nsid=3D3,bus=3Dnvme3
>=20
> nvme-cli:
>   root@vm:~/work# nvme list -v
>   NVM Express Subsystems
>=20
>   Subsystem        Subsystem-NQN                                         =
                                           Controllers
>   ---------------- ------------------------------------------------------=
------------------------------------------ ----------------
>   nvme-subsys1     nqn.2019-08.org.qemu:subsys0                          =
                                           nvme0, nvme1, nvme2
>   nvme-subsys3     nqn.2019-08.org.qemu:qux                              =
                                           nvme3
>=20
>   NVM Express Controllers
>=20
>   Device   SN                   MN                                       =
FR       TxPort Address        Subsystem    Namespaces
>   -------- -------------------- ---------------------------------------- =
-------- ------ -------------- ------------ ----------------
>   nvme0    foo                  QEMU NVMe Ctrl                           =
1.0      pcie   0000:00:06.0   nvme-subsys1 nvme1n1
>   nvme1    bar                  QEMU NVMe Ctrl                           =
1.0      pcie   0000:00:07.0   nvme-subsys1 nvme1n1
>   nvme2    baz                  QEMU NVMe Ctrl                           =
1.0      pcie   0000:00:08.0   nvme-subsys1 nvme1n1, nvme1n2
>   nvme3    qux                  QEMU NVMe Ctrl                           =
1.0      pcie   0000:00:09.0   nvme-subsys3
>=20
>   NVM Express Namespaces
>=20
>   Device       NSID     Usage                      Format           Contr=
ollers
>   ------------ -------- -------------------------- ---------------- -----=
-----------
>   nvme1n1      1        134.22  MB / 134.22  MB    512   B +  0 B   nvme0=
, nvme1, nvme2
>   nvme1n2      2        268.44  MB / 268.44  MB    512   B +  0 B   nvme2
>   nvme3n1      3        268.44  MB / 268.44  MB    512   B +  0 B   nvme3
>=20
> Summary:
>   - Refactored nvme-ns device not to rely on controller during the
>     setup.  [1/11 - 5/11]
>   - Introduced a nvme-subsys device model. [6/11]
>   - Create subsystem NQN based on subsystem. [7/11]
>   - Introduced multi-controller model. [8/11 - 9/11]
>   - Updated namespace sharing scheme to be based on nvme-subsys
>     hierarchy. [10/11 - 11/11]
>=20
> Since RFC V1:
>   - Updated namespace sharing scheme to be based on nvme-subsys
>     hierarchy.
>=20

Great stuff Minwoo. Thanks!

I'll pick up [01-05/11] directly since they are pretty trivial.

The subsystem model looks pretty much like it should, I don't have a lot
of comments.

One thing that I considered, is if we should reverse the "registration"
and think about it as namespace attachment. The spec is about
controllers attaching to namespaces, not the other way around.
Basically, let the namespaces be configured first and register on the
subsystem (accumulating in a "namespaces" array), then have the
controllers register with the subsystem and attach to all "non-detached"
namespaces. This allows detached namespaces to "linger" in the subsystem
to be attached later on. If there are any private namespaces (like ns2
in your example above), it will be defined after the controller with the
bus=3DctrlX parameter like normal.

--NGMolId4a56V0r0z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmAF+kQACgkQTeGvMW1P
DemAXQf/SYJTLhG22DtwUBJoyL0cHaxM0XCArEFCnWiSdnJRoAMzYDGdiLoa5wAR
vV73rxyExwGND8RfCsxfDB9H3jfSTPdG0Gh5HhuCacJIM2m/VcJgdgRGLyZNPP/z
TFV5k9OnHSpHDa9Ur3A20GAIrChEfZoTKkusqsQ9JBgadDcTqGjiwd0apCu6CrHk
J8NTAPN7Mat1hWBWk0kU8OZbsd3qeRL6z5JF79bB5c5C69/N6zeVEpNKNJ7S6fWV
K3Uyw6bOG77zD/XVx0anheb7sslQvhLXRUdyD1rG1fSsdntwb5X/m8FeUS3PFZ31
Dda4kpnt0Eblhi5j62smYxXdmGckeQ==
=Grua
-----END PGP SIGNATURE-----

--NGMolId4a56V0r0z--

