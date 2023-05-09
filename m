Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB8476FC458
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 12:57:22 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwL1M-0007bH-Jq; Tue, 09 May 2023 06:56:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1pwL1E-0007aU-R1; Tue, 09 May 2023 06:56:35 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1pwL19-0000lA-IO; Tue, 09 May 2023 06:56:32 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 63E325C01D3;
 Tue,  9 May 2023 06:56:23 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Tue, 09 May 2023 06:56:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1683629783; x=
 1683716183; bh=LK5LyBCfMFthszr28/bQmiD2LnSOES+6ApN73vnUNsg=; b=k
 RGq0H7jiWhCXrgAp/5f+2wXcPi7grEr4VnQZ9wXG4Ny+PpCdJdqWKOE7aiH1Uy12
 n4ew6XIGa2id8B6Hoo5hkfU5coNA5yq22kzvKPqwEM+d5BQt9jazqdIX2f8FXMif
 PQ6wyE+vTUux4q43dB+EPruwJlidZQxsfbAu83JqBoQPWy1CwiV76eyeSGjqs0eZ
 j2gkHzrdUrLyqLSCO+pJSTrg2oAf6ZhOVi42OXe5RufdVQdMu+l1b0MaJG0CUIJB
 QYNHFKOmlrL1XCsDCw08oVNYRTk+Jwu17GVCHi2+uOqdfkbWJiFm5htdGlamVxSJ
 d2C3KonRm3OK2YC2Bv98Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1683629783; x=1683716183; bh=LK5LyBCfMFths
 zr28/bQmiD2LnSOES+6ApN73vnUNsg=; b=ADhH8697ciJHdu9kmITwDH50mQm1j
 U+pfb9A3esdjYNd0Ix4MLsxxms99TEwh6gUn7hONgR8yY+LoA1nCtUV6MU5MYK/K
 BUA1GO6jutiF7OeopocMlV+0rCh0weVCZdsne3FMdQScvHaCoeHM3v7ojIvBDiU6
 uioqV8meH6a/gRJ39lIlojX4Get0mf25YTP4ucG7Wf4lrbaxqeyB31uujbNx4Y5L
 IqRQ4wxUMREgXwza5zp21UoJsgf32M4umJHSj+ZWSAD7vrCWpJlEMUbjF8a7J/5D
 BJjCqo3X79aQ09zPb8xUc/sLi4W5wwQA9QN+epJxBeupqL99nFvmuFX5w==
X-ME-Sender: <xms:1yZaZL36p6K_v92ehCCebw80kK-HQjph-SVSQc48yVpCFBvKqKLFJA>
 <xme:1yZaZKGs_YDlWx1kLu3OPhQgNF4bB3Z2ZgQD72kvKg1s1NCDPYWd4nEviiA_77mVi
 eLQsXRgRG74ovjSkD8>
X-ME-Received: <xmr:1yZaZL5-545CZATmL0Blu1Td_kpwFTsIV21HNQVkm6efJ7ev36MbiD2pMCNHHzhyawI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeegtddgfeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepleefieegkeevfeduleffhedtgfejhfevtefhkefhveejvdejtedtffdtfedu
 vefgnecuffhomhgrihhnpedvtdduledqtdekrdhorhhgpdhkvghrnhgvlhdrohhrghenuc
 evlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehi
 rhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:1yZaZA0Xe7QOwCgbOswF4X2IySX-DQ1raH-JQHjGLX3JLN6cakp3lg>
 <xmx:1yZaZOFCXjGimLT_LuJZtlZ841yz4BeutzHb9eU-x__J1e2bbZm1Mg>
 <xmx:1yZaZB88i_ts4WOTXIsRC2uUMR2KHNzfcIE3tGeJ2MNX6L5G0h-5zQ>
 <xmx:1yZaZKBmbb5_jKK-0216gxtkdIiRHs0hUlYCMY73BTGhiX1hYHiE2g>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 9 May 2023 06:56:21 -0400 (EDT)
Date: Tue, 9 May 2023 12:56:20 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Daniel Wagner <dwagner@suse.de>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Hannes Reinecke <hare@suse.de>
Subject: Re: [PATCH v1 0/1] Add support for namespace attach/detach during
 runtime
Message-ID: <ZFom1KNuVXNcJGlT@cormorant.local>
References: <20230505121216.30740-1-dwagner@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="SRW9EMmWsYhKEwSi"
Content-Disposition: inline
In-Reply-To: <20230505121216.30740-1-dwagner@suse.de>
Received-SPF: pass client-ip=66.111.4.25; envelope-from=its@irrelevant.dk;
 helo=out1-smtp.messagingengine.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--SRW9EMmWsYhKEwSi
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On May  5 14:12, Daniel Wagner wrote:
> This is a follow up on a very old thread[1]. My aim is to attach/detatch =
nvme
> devices during runtime and test the Linux nvme subsystem in the guest.
>=20
> In order to it working, I had first to add hotplug able PCI bus and the
> nvme-subsystem. The nvme-subsystem can't be instatiated during runtime so=
 far
> (libvirtd config):
>=20
>   <qemu:commandline>
>     <qemu:arg value=3D'-device'/>
>     <qemu:arg value=3D'pcie-root-port,id=3Droot,bus=3Dpcie.0,addr=3D0x6'/>
>     <qemu:arg value=3D'-device'/>
>     <qemu:arg value=3D'nvme-subsys,id=3Dnvme-subsys-1,nqn=3Dnvme-1'/>
>   </qemu:commandline>
>=20
> and then with a bunch of monitor commands:
>=20
>   qemu-monitor-command tw --hmp device_add nvme,id=3Dnvme1,serial=3Dnvme-=
1,subsys=3Dnvme-subsys-1,bus=3Droot
>   qemu-monitor-command tw --hmp drive_add 0 if=3Dnone,file=3D/var/lib/lib=
virt/images/tw-nvme1.img,format=3Draw,id=3Dnvme1
>   qemu-monitor-command tw --hmp device_add nvme-ns,drive=3Dnvme1,shared=
=3Don
>=20
>   qemu-monitor-command tw --hmp info block
>=20
>   qemu-monitor-command tw --hmp device_del nvme1
>=20
> I see the nvme device pop up in the guest:
>=20
>   [  187.047693 ] pci 0000:0f:00.0: [1b36:0010] type 00 class 0x010802
>   [  187.050324 ] pci 0000:0f:00.0: reg 0x10: [mem 0x00000000-0x00003fff =
64bit]
>   [  187.098823 ] pci 0000:0f:00.0: BAR 0: assigned [mem 0xc0800000-0xc08=
03fff 64bit]
>   [  187.102173 ] nvme nvme1: pci function 0000:0f:00.0
>   [  187.103084 ] nvme 0000:0f:00.0: enabling device (0000 -> 0002)
>   [  187.131154 ] nvme nvme1: 4/0/0 default/read/poll queues
>   [  187.133460 ] nvme nvme1: Ignoring bogus Namespace Identifiers
>=20
> and it looks pretty reasonable:
>=20
>   # nvme list -v
>   Subsystem        Subsystem-NQN                                         =
                                           Controllers
>   ---------------- ------------------------------------------------------=
------------------------------------------ ----------------
>   nvme-subsys1     nqn.2019-08.org.qemu:nvme-1                           =
                                           nvme1
>   nvme-subsys0     nqn.2019-08.org.qemu:nvme-0                           =
                                           nvme0
>  =20
>   Device   SN                   MN                                       =
FR       TxPort Address        Subsystem    Namespaces     =20
>   -------- -------------------- ---------------------------------------- =
-------- ------ -------------- ------------ ----------------
>   nvme1    nvme-1               QEMU NVMe Ctrl                           =
8.0.0    pcie   0000:0f:00.0   nvme-subsys1 nvme1n1
>   nvme0    nvme-0               QEMU NVMe Ctrl                           =
8.0.0    pcie   0000:00:05.0   nvme-subsys0 nvme0n1
>  =20
>   Device       Generic      NSID       Usage                      Format =
          Controllers    =20
>   ------------ ------------ ---------- -------------------------- -------=
--------- ----------------
>   /dev/nvme1n1 /dev/ng1n1   0x1          1.07  GB /   1.07  GB    512   B=
 +  0 B   nvme1
>   /dev/nvme0n1 /dev/ng0n1   0x1          1.07  GB /   1.07  GB    512   B=
 +  0 B   nvme0
>=20
>=20
> [1] https://lore.kernel.org/all/Y195nENga028PvT9@cormorant.local/
>=20
> Daniel Wagner (1):
>   hw/nvme: Add hotplug handler to nvme bus
>=20
>  hw/nvme/ctrl.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>=20
> --=20
> 2.40.0
>=20

Hi Daniel,

This looks reasonable enough. If the pci bus is rescanned after plugging
the controller, but before plugging the namespace, the namespace doesnt
show up. The controller does not send an AER in this case. Should be
possible to do that with a 'plug' callback but we need to handle sending
this event on all controllers the namespace becomes attached to (if
shared) or just the first one (for shared=3Doff).

--SRW9EMmWsYhKEwSi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmRaJtMACgkQTeGvMW1P
DelHTgf9HKvYWj/XUkBSFEuZmvCxI456WcAK2vAhv0+gwqDiSreq5qp1YKUiHpb/
nK+6WutxDaSqk5XwmkEBP/Ey88rTdYS7rMYalBIS40v0PQyAQHqxva+t5a/QV7Mq
dRO8PMnshyUIFy2S8hBM5deHYAwGM0EasgzF5S0e5ferA3ymWmhc1E642EQHGpPg
Vh7JUfVx7gcvdpdMr3APPXvAPdOVSeGgDTLUry6HwHlnm0C2r+0EIsqGEIQa/3xz
G2DfrWfmWvZWAmr+BBM+zmvmW9/WrhnQhDVcnkPzOzRfLJ7gABeZtEjCSK6QLSeL
pINwDLGW3Ib6Wk24m/0YpFisfKy0qQ==
=Bk8z
-----END PGP SIGNATURE-----

--SRW9EMmWsYhKEwSi--

