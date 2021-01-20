Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FDE02FCC16
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 08:56:46 +0100 (CET)
Received: from localhost ([::1]:55846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l28M9-0007cD-Ca
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 02:56:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l28Hv-0006mJ-B5; Wed, 20 Jan 2021 02:52:23 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:58423)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l28Ht-0004ht-Dh; Wed, 20 Jan 2021 02:52:23 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 9DEAE5C0102;
 Wed, 20 Jan 2021 02:52:18 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 20 Jan 2021 02:52:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=4fG4BQ6+WKZtzxlRMFxUH22MbcP
 Kr3tn65ogdpVzRGw=; b=puZYQ2MqvpWlo0jcaONWwSPWqSpczWJ3H+K9J/lFgTj
 TLtSvYzRUvv9IQZENzCjcK2/VVOmJo4XQQYl4Xuwk2cwW4rENBMBmWjdOvIM/R7x
 uN5MEEbbENhITwmwG4MCdt1R7g2lUIBvmwT3h9eflpkLHRVZlWoi8eaSTVpdvMIt
 vK5bCi+Bj1wpuBTI6qUTgcJQMilvUoWeb39udHsFUA6hK4crL17JfsvGIA4ZPHfD
 EZyTJ7TKbbYCMevI2awkj3bOZ6u/xQeBSmo9q5bMbBeTJes+Bi24GcDCJVG8DNfA
 0W4UAxjFfsQgO4mzKtw1isrZDAwWev8YsMJZbiVcrwQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=4fG4BQ
 6+WKZtzxlRMFxUH22MbcPKr3tn65ogdpVzRGw=; b=bjeCe1LKPbLulbVO6b0X95
 IcN202Eu+HuOtcO4zQ64o+7L0qs3Z0d2ax3ufLJA3dBqgO6SMEyY7hDOzFLX3GpL
 l5LwrMPTLfPTMrCUmkbjEy4Oz7zFk8a3wlcFmUXgjVzkh1O+sSGxXpVMet/9J8sr
 rO+iJdrLx39CDiiPZwgEPEE3HDhwVKo/Ne7+vUBUWWZtYGd15iifAgj9VsH+AOdV
 iWyLP248R/erykn4iE1yAFA+WOyf3vWICn1kgpz1IWXj8CV4GfS5svFc8Jp8mLZo
 j/2NWK5ozEVDlu9QzS4DjzjnPs9jtiOw8QvpnWBfVaYC67ITrVXdPQqDzaW9Pp0g
 ==
X-ME-Sender: <xms:MeEHYFIMIwdhqBIHUUR-rgUZqlX13CbzxffIZmOM5lwzG0JGVS8xrA>
 <xme:MeEHYBIHjEbxWbGdhjw_uGI-sMu7dFO_Ej-lllQnu-mm8pEiSGM4rPmmysqp6Pf-Z
 5Sccwpg50cOVW-fI_8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddugdduudehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtdorredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeileefhfffueeftdehhffgteejhfevkeeghedttdfhvefhleffueevtefhueev
 teenucffohhmrghinhepvddtudelqddtkedrohhrghenucfkphepkedtrdduieejrdelke
 drudeltdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhm
 pehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:MeEHYNuG8e-vWsVvKC9wSui6JFE_JzJPK2tNoC0JxPJDePOBDfeUGw>
 <xmx:MeEHYGaZxqnPNdS6cKtw2XB6X6-onmR7IGrb5OAX-H-E7F7Aa9TKMw>
 <xmx:MeEHYMa4rNHTsZpAKpC1CHpSnOtozDGG7DF6orT8Cpp-1E8yk6VOBA>
 <xmx:MuEHYDUvt2rkq0wdx9x5UpiZz-Ad3tvB9HXNxPQh9YMQRXqG1zJR9A>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 9FF43240062;
 Wed, 20 Jan 2021 02:52:16 -0500 (EST)
Date: Wed, 20 Jan 2021 08:52:14 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Minwoo Im <minwoo.im.dev@gmail.com>
Subject: Re: [RFC PATCH V3 0/8] hw/block/nvme: support multi-path for ctrl/ns
Message-ID: <YAfhLnBuNawnFvhE@apples.localdomain>
References: <20210119170147.19657-1-minwoo.im.dev@gmail.com>
 <YAciaPBu9TuGjifu@apples.localdomain>
 <20210120004417.GA4205@localhost.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ZaWNhjzcF9RlSYpK"
Content-Disposition: inline
In-Reply-To: <20210120004417.GA4205@localhost.localdomain>
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


--ZaWNhjzcF9RlSYpK
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jan 20 09:44, Minwoo Im wrote:
> On 21-01-19 19:18:16, Klaus Jensen wrote:
> > On Jan 20 02:01, Minwoo Im wrote:
> > > Hello,
> > >=20
> > > This patch series is third one to support multi-controller and namesp=
ace
> > > sharing in multi-path.  This series introduced subsystem scheme to
> > > manage controller(s) and namespace(s) in the subsystem.
> > >=20
> > > This series has new patches from the V2:  'detached' parameter has be=
en
> > > added to the nvme-ns device.  This will decide whether to attach the
> > > namespace to controller(s) in the current subsystem or not.  If it's
> > > given with true, then it will be just allocated in the subsystem, but
> > > not attaching to any controllers in the subsystem.  Otherwise, it will
> > > automatically attach to all the controllers in the subsystem.  The ot=
her
> > > t hing is that the last patch implemented Identify Active Namespace ID
> > > List command handler apart from the Allocated Namespace ID List.
> > >=20
> > > Run with:
> > >   -device nvme,serial=3Dqux,id=3Dnvme3
> > >   -device nvme-ns,id=3Dns3,drive=3Ddrv12,nsid=3D3,bus=3Dnvme3
> > >=20
> > >   -device nvme-subsys,id=3Dsubsys0
> > >   -device nvme,serial=3Dfoo,id=3Dnvme0,subsys=3Dsubsys0
> > >   -device nvme,serial=3Dbar,id=3Dnvme1,subsys=3Dsubsys0
> > >   -device nvme,serial=3Dbaz,id=3Dnvme2,subsys=3Dsubsys0
> > >   -device nvme-ns,id=3Dns1,drive=3Ddrv10,nsid=3D1,subsys=3Dsubsys0,de=
tached=3Dtrue
> > >   -device nvme-ns,id=3Dns2,drive=3Ddrv11,nsid=3D2,bus=3Dnvme2
> > >=20
> > > nvme-cli:
> > >   root@vm:~/work# nvme list -v                                       =
                                                              =20
> > >   NVM Express Subsystems                                             =
                                                   =20
> > >                                                                      =
                                                               =20
> > >   Subsystem        Subsystem-NQN                                     =
                                               Controllers
> > >   ---------------- --------------------------------------------------=
---------------------------------------------- ----------------
> > >   nvme-subsys0     nqn.2019-08.org.qemu:qux                          =
                                               nvme0
> > >   nvme-subsys1     nqn.2019-08.org.qemu:subsys0                      =
                                               nvme1, nvme2, nvme3
> > >                                                                      =
                                                             =20
> > >   NVM Express Controllers                                            =
                                              =20
> > >                                                                      =
                                            =20
> > >   Device   SN                   MN                                   =
    FR       TxPort Address        Subsystem    Namespaces
> > >   -------- -------------------- -------------------------------------=
--- -------- ------ -------------- ------------ ----------------
> > >   nvme0    qux                  QEMU NVMe Ctrl                       =
    1.0      pcie   0000:00:06.0   nvme-subsys0
> >=20
> > Shouldn't nvme0n1 be listed under Namespaces for nvme0?
>=20
> Oh, I missed that one from the output.  As Keith mentioned, I ran the
> list command again based on the latest nvme-cli.git:
>=20
> Please refer the following result.  I think it's okay not to send the
> cover letter again :)
>=20
> # nvme --version
> nvme version 1.13.48.g33c6
>=20
> # nvme list -v
> NVM Express Subsystems
>=20
> Subsystem        Subsystem-NQN                                           =
                                         Controllers
> ---------------- --------------------------------------------------------=
---------------------------------------- ----------------
> nvme-subsys0     nqn.2019-08.org.qemu:qux                                =
                                         nvme0
> nvme-subsys1     nqn.2019-08.org.qemu:subsys0                            =
                                         nvme1, nvme2, nvme3
>=20
> NVM Express Controllers
>=20
> Device   SN                   MN                                       FR=
       TxPort Address        Subsystem    Namespaces     =20
> -------- -------------------- ---------------------------------------- --=
------ ------ -------------- ------------ ----------------
> nvme0    qux                  QEMU NVMe Ctrl                           1.=
0      pcie   0000:00:06.0   nvme-subsys0 nvme0n1
> nvme1    foo                  QEMU NVMe Ctrl                           1.=
0      pcie   0000:00:07.0   nvme-subsys1=20
> nvme2    bar                  QEMU NVMe Ctrl                           1.=
0      pcie   0000:00:08.0   nvme-subsys1=20
> nvme3    baz                  QEMU NVMe Ctrl                           1.=
0      pcie   0000:00:09.0   nvme-subsys1 nvme1c3n1
>=20
> NVM Express Namespaces
>=20
> Device       NSID     Usage                      Format           Control=
lers    =20
> ------------ -------- -------------------------- ---------------- -------=
---------
> nvme0n1      3        268.44  MB / 268.44  MB    512   B +  0 B   nvme0
> nvme1n1      2        268.44  MB / 268.44  MB    512   B +  0 B   nvme3

That looks better, but hmm. Shouldnt the namespace be named `nvme1c3n1`
here has well? Is that also an issue with nvme-cli?

--ZaWNhjzcF9RlSYpK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmAH4SwACgkQTeGvMW1P
DelYnQf/b9P8+1G53ROXSiOQfvfIkDV760PAPAN8MsrhbfAfguLa0gzs0xdNJq08
NHe0sDBPUPCieutuPTy7UZuUx09M/wqy6+JhhRrCwgBr+hXWeko4YWZXXWJOOGOx
KpNHSEwIDCl0XXsGcr1qE2rHHCPTbRGqE6bt9r3mhxbeh+uoCcQx3NNsrQXQnY0f
uxhC1aGKHH2sBngQ+Ve0vkbe+rf9hg/dAAx1xu5YIJxK/47aFRc+UGd/VI2cqkhl
5lkRJ5m80lODfQBql7jIhvBQwXrOmtH4hH8/ayrGCI96ZTXchUqdqGYFbe2Y3lI3
V3cJTtulJbodMRZXHAOP1DtRpErWIQ==
=XAC5
-----END PGP SIGNATURE-----

--ZaWNhjzcF9RlSYpK--

