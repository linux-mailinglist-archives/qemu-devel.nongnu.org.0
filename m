Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F854C8C58
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 14:13:48 +0100 (CET)
Received: from localhost ([::1]:45942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nP2K2-0006ja-Q0
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 08:13:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nP2Dl-0004XX-0B; Tue, 01 Mar 2022 08:07:17 -0500
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:36741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nP2Di-0006iV-CF; Tue, 01 Mar 2022 08:07:16 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id A76E6580451;
 Tue,  1 Mar 2022 08:07:12 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Tue, 01 Mar 2022 08:07:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; bh=kH+C+wz1ua2Y4+PjVtpseMQWi/T4dv
 eDhC+Kc+I1QdM=; b=YHZWngX5qliJph7TEpArwOs/MwMmx+owA3ksccJfi+C/Yy
 +rFO7uxHcHCqnUkjRN6oS6/RZN1go7ALvQQ0aOeeonH0ys5ASNUKQfwI9UwGHRZM
 6bc/i0bmxlzbAM8+Zx5x+Viyg+7/M7ZpiileZAqEG2381tVfPu3wvnGnApm9tkWm
 wLBw345yoOiGAFAYEh6jGKECRlR9OcrtFO5vnODKnzp4Z930+jo0AD/IR1x2Jiu+
 TuyxE8YnYau3iUYBz300j58LGL8H85nvNlFm/RIUGHje4yetDhAlx3g+p5oKiGkP
 pQ0lcGpwC0JifjbuO9YSWkESg6yVLrViQC1BdVjQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=kH+C+wz1ua2Y4+PjV
 tpseMQWi/T4dveDhC+Kc+I1QdM=; b=ZCwZKp5DNBiRbGKaPvdVkOQXlqVJDENCe
 wF/JkK42GlAipQKKOewGwlID8PBG8mgpKBIGR+sMyZMmYPrUNK1U3Dk2HWp3xaII
 5Wyh6ph5kkmqZlB/uE97nJhIL2FyRR70aTEoARLPJ4cqx6TCv/BN7zDVWVlh06Fs
 Aal5JvFi8scx6ZD6Wlqp52iZei/ZamDdEHLkaHRfxQh4DoS0H2Y7sgRVw2VThOPi
 lACwBlkD3hRSFhAUhZx9gCAbcAHA0SdV82lFx9AY57+xL56aGhQrGmacyEDxjz5h
 hCutqkeHRX8giBav/03jLkruyChjN6kr2/dFw4iajx6zfVAQlYRdg==
X-ME-Sender: <xms:fxoeYrf58LniIZ_kTb1h7EUQrxK_fgPhajw6bjKaPNQQV2EMPw7p1A>
 <xme:fxoeYhPZntocoOtCOCIRUtAYcBms0vcO27_OTHQdCkago7Eh-Ft5izk_vioTkkzlD
 2cJn8kSeyIH8sg-CTI>
X-ME-Received: <xmr:fxoeYkjXjVtDlplB6YrxhWjOc-rlL0VNfQ4JPyk53QEDBeyxJWxXS86_X4ZAmmgoQbR_7_NhlIPJKDI3W2k>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddruddtvddggeeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:fxoeYs_FEpaY_hrQXaLz-n84AR92yv87mc9mlYOrJsXMNwX1hU-PJw>
 <xmx:fxoeYnv3zdxK2J2TZBRgR_rbwXdDTQ_EuftO0PeV3cWMJ_dys0l6bg>
 <xmx:fxoeYrF9VWDCMumEh10r6Y2zaTl03WP8HQ8_jwtScqZPsCA71N0uHw>
 <xmx:gBoeYlL4MJ_Ecy64vYiuUJtSk6ea7jHK7Dwjqb8y5fSWcetLd4w6xQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 1 Mar 2022 08:07:09 -0500 (EST)
Date: Tue, 1 Mar 2022 14:07:08 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Lukasz Maniak <lukasz.maniak@linux.intel.com>
Subject: Re: [PATCH v5 13/15] hw/nvme: Add support for the Virtualization
 Management command
Message-ID: <Yh4afDUJ9Yc0a74Z@apples>
References: <20220217174504.1051716-1-lukasz.maniak@linux.intel.com>
 <20220217174504.1051716-14-lukasz.maniak@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="w95gntiYYPUdlCq1"
Content-Disposition: inline
In-Reply-To: <20220217174504.1051716-14-lukasz.maniak@linux.intel.com>
Received-SPF: pass client-ip=66.111.4.230; envelope-from=its@irrelevant.dk;
 helo=new4-smtp.messagingengine.com
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org,
 =?utf-8?Q?=C5=81ukasz?= Gieryk <lukasz.gieryk@linux.intel.com>,
 qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--w95gntiYYPUdlCq1
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Feb 17 18:45, Lukasz Maniak wrote:
> From: =C5=81ukasz Gieryk <lukasz.gieryk@linux.intel.com>
>=20
> With the new command one can:
>  - assign flexible resources (queues, interrupts) to primary and
>    secondary controllers,
>  - toggle the online/offline state of given controller.
>=20

QEMU segfaults (or asserts depending on the wind blowing) if the SR-IOV
enabled device is hotplugged after being configured (i.e. follow the
docs for a simple setup and then do a `device_del <nvme-device>` in the
monitor. I suspect this is related to freeing the queues and something
getting double-freed.

The device can be removed just fine if SR-IOV is configured (as in,
parameters are set), but no resources are reserved, onlined etc.


Snip from the backtrace (assert):

qemu-system-x86_64: ../util/qemu-thread-posix.c:78: qemu_mutex_lock_impl: A=
ssertion `mutex->initialized' failed.

Thread 4 "qemu-system-x86" received signal SIGABRT, Aborted.
[Switching to Thread 0x7fcb8ffff640 (LWP 174907)]
0x00007fcb9a85534c in __pthread_kill_implementation () from /usr/lib64/libc=
=2Eso.6
(gdb) bt
#0  0x00007fcb9a85534c in __pthread_kill_implementation () at /usr/lib64/li=
bc.so.6
#1  0x00007fcb9a8084b8 in raise () at /usr/lib64/libc.so.6
#2  0x00007fcb9a7f2534 in abort () at /usr/lib64/libc.so.6
#3  0x00007fcb9a7f245c in _nl_load_domain.cold () at /usr/lib64/libc.so.6
#4  0x00007fcb9a801116 in  () at /usr/lib64/libc.so.6
#5  0x0000556c1fffc342 in qemu_mutex_lock_impl (mutex=3D<optimized out>, fi=
le=3D<optimized out>, line=3D<optimized out>) at ../util/qemu-thread-posix.=
c:78
#6  qemu_mutex_lock_impl (mutex=3D<optimized out>, file=3D<optimized out>, =
line=3D<optimized out>) at ../util/qemu-thread-posix.c:74
#7  0x0000556c2001af05 in timer_del (ts=3Dts@entry=3D0x7fc9780000a0) at ../=
util/qemu-timer.c:432
#8  0x0000556c1fc28657 in timer_free (ts=3D0x7fc9780000a0) at /home/kbj/wor=
k/src/qemu/include/qemu/timer.h:633
#9  timer_free (ts=3D0x7fc9780000a0) at /home/kbj/work/src/qemu/include/qem=
u/timer.h:630
#10 nvme_free_sq (sq=3D0x7fc978000090, n=3D<optimized out>, n=3D<optimized =
out>) at ../hw/nvme/ctrl.c:4129
#11 0x0000556c1fc2a369 in nvme_ctrl_reset (n=3D0x7fc978436e70, rst=3DNVME_R=
ESET_FUNCTION) at ../hw/nvme/ctrl.c:6007
#12 0x0000556c1fc2a84c in nvme_virt_set_state (n=3Dn@entry=3D0x556c22d486b0=
, cntlid=3D<optimized out>, online=3Donline@entry=3D0x0) at ../hw/nvme/ctrl=
=2Ec:5815
#13 0x0000556c1fc2a5c6 in nvme_ctrl_reset (n=3D0x556c22d486b0, rst=3DNVME_R=
ESET_FUNCTION) at ../hw/nvme/ctrl.c:6026
#14 0x0000556c1fc2a9e3 in nvme_exit (pci_dev=3D0x556c22d486b0) at ../hw/nvm=
e/ctrl.c:7265
#15 0x0000556c1fc450e3 in pci_qdev_unrealize (dev=3D<optimized out>) at ../=
hw/pci/pci.c:1200
=2E.. more here


Snip from the backtrace (segfault)

Thread 7 "qemu-system-x86" received signal SIGSEGV, Segmentation fault.
[Switching to Thread 0x7f6c635fe640 (LWP 175552)]
0x0000555e275ab63a in nvme_free_sq (sq=3D0xfea03000, n=3D<optimized out>, n=
=3D<optimized out>) at ../hw/nvme/ctrl.c:4128
4128	    n->sq[sq->sqid] =3D NULL;
(gdb) bt
#0  0x0000555e275ab63a in nvme_free_sq (sq=3D0xfea03000, n=3D<optimized out=
>, n=3D<optimized out>) at ../hw/nvme/ctrl.c:4128
#1  0x0000555e275ad369 in nvme_ctrl_reset (n=3D0x7f6e683793e0, rst=3DNVME_R=
ESET_FUNCTION) at ../hw/nvme/ctrl.c:6007
#2  0x0000555e275ad84c in nvme_virt_set_state (n=3Dn@entry=3D0x555e2a2626b0=
, cntlid=3D<optimized out>, online=3Donline@entry=3D0x0) at ../hw/nvme/ctrl=
=2Ec:5815
#3  0x0000555e275ad5c6 in nvme_ctrl_reset (n=3D0x555e2a2626b0, rst=3DNVME_R=
ESET_FUNCTION) at ../hw/nvme/ctrl.c:6026
#4  0x0000555e275ad9e3 in nvme_exit (pci_dev=3D0x555e2a2626b0) at ../hw/nvm=
e/ctrl.c:7265
#5  0x0000555e275c80e3 in pci_qdev_unrealize (dev=3D<optimized out>) at ../=
hw/pci/pci.c:1200
=2E.. more here

--w95gntiYYPUdlCq1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmIeGnoACgkQTeGvMW1P
DeldWwf/VAPuZOi79RyJ0YFNdiwplQq24lNtcNsq1gQPj5CiXyhPxI5RhMGY9kMG
njx5JhK6p9OdAKfWfzqC0B2Xl3xU9Ghi8RsqFh1bELaGZ6Pfe5sLJNuZ44rsMXSt
LTk0Ld8emPwiQIbNgA4dBWGXhFV0diaRDL/2drXXlS/WO/hnCb3AZegFM7PiJX9M
Y5OtKazTTnui38h18KZldsu3TshrY2uLi7SdiX3G+jTAdFK3vmAcsDFbr0DIdXtV
I7gAWS6BbJNO4IQKc6Ae7/1yRQ6BC1nOuxrVcAJnKIReGQ9Nvb91tPysdy66moWW
xPDVGa1rdkeiWnuy1N4j4P6HyL5tcA==
=p+6I
-----END PGP SIGNATURE-----

--w95gntiYYPUdlCq1--

