Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C13752FBFE5
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 20:22:20 +0100 (CET)
Received: from localhost ([::1]:32970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1wa2-0003Kz-2j
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 14:22:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l1vaH-0004YB-Hp; Tue, 19 Jan 2021 13:18:30 -0500
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:58059)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l1vaD-0007b9-Eb; Tue, 19 Jan 2021 13:18:29 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 206E51318;
 Tue, 19 Jan 2021 13:18:20 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 19 Jan 2021 13:18:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=/iP4ZWQfzKRhgShmGyDASK09yKK
 xUXCCpny4iKZRrsM=; b=uEQZpQJ57/QAVFv6w0x3hElVzeY8vrPVo0OYXNfFT2I
 Grgc6+7zue0ySwZEVACg1vmiSCenKu9lOj/4s7b5rsthxEK3Hplwd1FJHnS1/N6P
 DfsRE/7x1W0xPZ53hDFXz3m1BnJ6DlEM0EfxXKLSg4E3QsmXjrofFxNsNmKPa7X5
 O6KBIvu1fFLmIlT0uSqiNwCvN7vjsNyVXMZM1W07cUjrrpy3ypgSCbWTZdEIBQqS
 6AmUdRa4PfkoTMBDqQTXM6Xz2IvlAu73TCENUGrFQ9pO40ir1OkXr4F72gwo4GFs
 Ji5noOuj8RHMxDpyyPdvyM/pwDNoXWs4mZXZrLGq8Ew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=/iP4ZW
 QfzKRhgShmGyDASK09yKKxUXCCpny4iKZRrsM=; b=UolgHSw7EmD7PGN88/TvVh
 ttOwAajFs/B/wJun16falsMxcZmHzStMSlnQgAg9yWFNJocFw8iw/dOiXZTC9brA
 5urU5aKA2rpQpnp7KLIAbtxuQi1ILeOUIwaI38Xc7Y/Jop60UXMNkzaaGgiP2XAa
 MY/BhA2gy6xBVWJMPvm1Zv52U6F/XtCTImZtvI+oY68xSj0hlHzACtiabmeWvCMD
 ZoWI0Yet6JFLPXGvGg3iSWfHFBk0lBntOlDerOGQhDBSFG2ZmxY2NOuMvFcNJaB/
 hXivv+zu2WeDaUxgZUGIdTPAtMao7j+b8AO8D64xYHL3jzSd0AkRgLrTFImjHlDg
 ==
X-ME-Sender: <xms:ayIHYJ16G9ah6hD9Z10tHSwHJV34D7jJPdhoLLRNlt1wS7HnmwIBUw>
 <xme:ayIHYAFfjlBBAMAYbW6-P526Pb8I1pG8zFdBEImDxl9ainNFAQbJKiaeeOHxrihZl
 dtQHmqIK1ff_r9cEl4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddtgdduuddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeehgeehgfffgeekveefteetudekheejffdtvedvudfgffelleefvdfftdekgffg
 udenucffohhmrghinhepvddtudelqddtkedrohhrghenucfkphepkedtrdduieejrdelke
 drudeltdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhm
 pehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:ayIHYJ6xRaBQ7N-DIKpLJUcXFVgjLodVRox5L7bnTZFLLakvz1aoeA>
 <xmx:ayIHYG0AzOHAARBjopHd0KyOnp0I2Ij0FjlxXYhyDRWTepKV3U-cOA>
 <xmx:ayIHYMHg_ZKspgChj-HM7MuoDM9JzY2_WJp5eiceHJnLOJah7_p6ag>
 <xmx:ayIHYIjOOZAWLIBC7Kg06RS_J6b-N4R75tO32qIJhHCsIU-oMRRY-Q>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 75534108005B;
 Tue, 19 Jan 2021 13:18:18 -0500 (EST)
Date: Tue, 19 Jan 2021 19:18:16 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Minwoo Im <minwoo.im.dev@gmail.com>
Subject: Re: [RFC PATCH V3 0/8] hw/block/nvme: support multi-path for ctrl/ns
Message-ID: <YAciaPBu9TuGjifu@apples.localdomain>
References: <20210119170147.19657-1-minwoo.im.dev@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="pbQO86mB6nOpcvmw"
Content-Disposition: inline
In-Reply-To: <20210119170147.19657-1-minwoo.im.dev@gmail.com>
Received-SPF: pass client-ip=64.147.123.24; envelope-from=its@irrelevant.dk;
 helo=wout1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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


--pbQO86mB6nOpcvmw
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jan 20 02:01, Minwoo Im wrote:
> Hello,
>=20
> This patch series is third one to support multi-controller and namespace
> sharing in multi-path.  This series introduced subsystem scheme to
> manage controller(s) and namespace(s) in the subsystem.
>=20
> This series has new patches from the V2:  'detached' parameter has been
> added to the nvme-ns device.  This will decide whether to attach the
> namespace to controller(s) in the current subsystem or not.  If it's
> given with true, then it will be just allocated in the subsystem, but
> not attaching to any controllers in the subsystem.  Otherwise, it will
> automatically attach to all the controllers in the subsystem.  The other
> t hing is that the last patch implemented Identify Active Namespace ID
> List command handler apart from the Allocated Namespace ID List.
>=20
> Run with:
>   -device nvme,serial=3Dqux,id=3Dnvme3
>   -device nvme-ns,id=3Dns3,drive=3Ddrv12,nsid=3D3,bus=3Dnvme3
>=20
>   -device nvme-subsys,id=3Dsubsys0
>   -device nvme,serial=3Dfoo,id=3Dnvme0,subsys=3Dsubsys0
>   -device nvme,serial=3Dbar,id=3Dnvme1,subsys=3Dsubsys0
>   -device nvme,serial=3Dbaz,id=3Dnvme2,subsys=3Dsubsys0
>   -device nvme-ns,id=3Dns1,drive=3Ddrv10,nsid=3D1,subsys=3Dsubsys0,detach=
ed=3Dtrue
>   -device nvme-ns,id=3Dns2,drive=3Ddrv11,nsid=3D2,bus=3Dnvme2
>=20
> nvme-cli:
>   root@vm:~/work# nvme list -v                                           =
                                                          =20
>   NVM Express Subsystems                                                 =
                                               =20
>                                                                          =
                                                           =20
>   Subsystem        Subsystem-NQN                                         =
                                           Controllers
>   ---------------- ------------------------------------------------------=
------------------------------------------ ----------------
>   nvme-subsys0     nqn.2019-08.org.qemu:qux                              =
                                           nvme0
>   nvme-subsys1     nqn.2019-08.org.qemu:subsys0                          =
                                           nvme1, nvme2, nvme3
>                                                                          =
                                                         =20
>   NVM Express Controllers                                                =
                                          =20
>                                                                          =
                                        =20
>   Device   SN                   MN                                       =
FR       TxPort Address        Subsystem    Namespaces
>   -------- -------------------- ---------------------------------------- =
-------- ------ -------------- ------------ ----------------
>   nvme0    qux                  QEMU NVMe Ctrl                           =
1.0      pcie   0000:00:06.0   nvme-subsys0

Shouldn't nvme0n1 be listed under Namespaces for nvme0?

>   nvme1    foo                  QEMU NVMe Ctrl                           =
1.0      pcie   0000:00:07.0   nvme-subsys1
>   nvme2    bar                  QEMU NVMe Ctrl                           =
1.0      pcie   0000:00:08.0   nvme-subsys1
>   nvme3    baz                  QEMU NVMe Ctrl                           =
1.0      pcie   0000:00:09.0   nvme-subsys1 nvme1n1
>                                                                          =
        =20
>   NVM Express Namespaces                                                =
=20
>                                                                       =20
>   Device       NSID     Usage                      Format           Contr=
ollers
>   ------------ -------- -------------------------- ---------------- -----=
-----------
>   nvme0n1      3        268.44  MB / 268.44  MB    512   B +  0 B   nvme0
>   nvme1n1      2        268.44  MB / 268.44  MB    512   B +  0 B   nvme3
>=20
> Now we have [allocated|not-allocated]/[attached/detached] scheme for
> namespaces and controllers.  The next series is going to be to support
> namespace management and attachment with few Identify command handlers.
>=20
> Please review.
>=20
> Thanks!
>=20
> Since RFC V2:
>   - Rebased on nvme-next branch with trivial patches from the previous
>     version(V2) applied. (Klaus)
>   - Fix enumeration type name convention with NvmeIdNs prefix. (Klaus)
>   - Put 'cntlid' to NvmeCtrl instance in nvme_init_ctrl() which was
>     missed in V2.
>   - Added 'detached' parameter to nvme-ns device to decide whether to
>     attach or not to controller(s) in the subsystem. (Klaus)
>   - Implemented Identify Active Namespace ID List aprt from Identify
>     Allocated Namespace ID List by removing fall-thru statement.
>=20
> Since RFC V1:
>   - Updated namespace sharing scheme to be based on nvme-subsys
>     hierarchy.
>=20
> Minwoo Im (8):
>   hw/block/nvme: introduce nvme-subsys device
>   hw/block/nvme: support to map controller to a subsystem
>   hw/block/nvme: add CMIC enum value for Identify Controller
>   hw/block/nvme: support for multi-controller in subsystem
>   hw/block/nvme: add NMIC enum value for Identify Namespace
>   hw/block/nvme: support for shared namespace in subsystem
>   hw/block/nvme: add 'detached' param not to attach namespace
>   hw/block/nvme: Add Identify Active Namespace ID List
>=20
>  hw/block/meson.build   |   2 +-
>  hw/block/nvme-ns.c     |  32 ++++++++--
>  hw/block/nvme-ns.h     |  13 ++++
>  hw/block/nvme-subsys.c | 111 +++++++++++++++++++++++++++++++++
>  hw/block/nvme-subsys.h |  32 ++++++++++
>  hw/block/nvme.c        | 137 ++++++++++++++++++++++++++++++++++++++---
>  hw/block/nvme.h        |  19 ++++++
>  include/block/nvme.h   |   8 +++
>  8 files changed, 340 insertions(+), 14 deletions(-)
>  create mode 100644 hw/block/nvme-subsys.c
>  create mode 100644 hw/block/nvme-subsys.h
>=20
> --=20
> 2.17.1
>=20
>=20

--=20
One of us - No more doubt, silence or taboo about mental illness.

--pbQO86mB6nOpcvmw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmAHImcACgkQTeGvMW1P
Del9SAf/WYULosF+2kw61CPcADDTCSjk8+985xHuMeeJUsRGYUTNjJak6F+h/8Pq
QpqQw1nw1bGwM85QoxDHFN2AwMHzKGZalOzLNJd9WxCVoitKXEataS/WHOF5Mq5N
UQKV7Gph7VJEjjdZlh0/p9/7OSW3SnV0Ki4o3LiQeYpHtC19MJXMh1yqwxvCyBaf
qJQmltWDkoDcVYnKzVrQf5qXc4SXu7yfLbbJX7kNFAsnPa1cutkuEW/emgAX511y
iRNO7KC7tDLUrVBqt57Z94embxC1+lYMgpecud7MngsZWDoplRUOKbzo8ze9dAFy
tRo0imHsxQc9/uuM6pMqHAYJ7BjTag==
=YeBH
-----END PGP SIGNATURE-----

--pbQO86mB6nOpcvmw--

