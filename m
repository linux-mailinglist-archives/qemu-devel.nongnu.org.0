Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21B1864A400
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 16:19:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4kZZ-0006nm-RA; Mon, 12 Dec 2022 10:18:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>) id 1p4kZX-0006nO-FR
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 10:18:27 -0500
Received: from wout1-smtp.messagingengine.com ([64.147.123.24])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>) id 1p4kZU-0004HH-Is
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 10:18:26 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 2CC9A3200910;
 Mon, 12 Dec 2022 10:18:22 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Mon, 12 Dec 2022 10:18:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1670858301; x=1670944701; bh=an
 VQVYlTR/Jqk1vsblJxeBE8uyewLSxxVoPijXeNK6Y=; b=c09+A42UoTQ3vIz5U7
 MRU9IgoJXvSY/jCPB2ZFIoyQpC23q+bKuFiBMpSypJKpS9QqYn34L5H1xjTAclxP
 JxTTYp4kD3SW25nc1Ovp7VXHq3KsvZZaCgUx5IKEL2AtCL5j7+m2RxzA62EMcHco
 Tjozle9Y8je5/OFriHMuCcH2sR0Y9YkQ9h8w2Lgyq+6Zh6AnMAoZs0zUVgjSRzFb
 dX/R+APf/WJ+1e4evHCQhG+mOmilftYmLAMvpWSYHyRtgGJ5b+29M4JQtiudeWIN
 yGFlCykUDgeeeXfJ6ohjtLL0B6Kyz5EhM+I4sFtWYX5vjeq27wG5C03ygUhEyhPU
 7F1w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1670858301; x=1670944701; bh=anVQVYlTR/Jqk1vsblJxeBE8uyew
 LSxxVoPijXeNK6Y=; b=N83CRlxR2IRfsmORCIFNEZym9Cdj8oGmEJMIMA7rtdkD
 KIerONzEpIlRqDWBXwp9/R3PiTBrgO+QQ1FBrI2ECFqehmd0DiZERuHdSgUtDj9h
 3lC1NExHz6RuDDnQlnuOmimR4nLeZgZ3MuWtUrtX/YvJVqo/mx8CH7V9nl0U395u
 Z57ELcWyNMxziWo0bKHf0p7KztdLlzsPoKDx/XDRSm83H39/uHFaBMocPt2ojVFN
 R1J/zioTmY/jVRICafjBKVoTzsjcp7WXflQTyIuNsas0gPq2tgE588AfdA7wzMnO
 ZayFv2A8wZ5fa1w1ImLltuk7gNv3eYqVnJTBIQYqaw==
X-ME-Sender: <xms:PEaXY4KnTO6KRfCXisO50qHajmqVzqLq1ZRodq_yC2CZZJJZRQam7Q>
 <xme:PEaXY4I68MS6WMF1gLAxC_Fu0loY5P1ZLH57w6GnWrFgtgQWNR5lrldU0T6AbbDDu
 wQaXQO-nKy-lfj_2zw>
X-ME-Received: <xmr:PEaXY4sNElJMhRHl0nV_RFFKa3kUIlc24zTRjgZWn6Gg8gOoHljdDVDW4eMxC0IqDLtHmC4nvSAMVwEMBUzOhdoCnY78nQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdekgdehvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhepfffhvfevuffkfhggtggujgesghdtre
 ertddtjeenucfhrhhomhepmfhlrghushculfgvnhhsvghnuceoihhtshesihhrrhgvlhgv
 vhgrnhhtrdgukheqnecuggftrfgrthhtvghrnhepjefgjeefffdvuefhieefhffggfeule
 ehudekveejvedtuddugeeigeetffffjeevnecuvehluhhsthgvrhfuihiivgeptdenucfr
 rghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:PEaXY1YS4nS44PBzKU8kdkznzhUR8rdTYAaVEF2v5rdQGyLHVq90WQ>
 <xmx:PEaXY_bWRpilSP4REY20D-rAmRwUwlm-RPyM1VgxdsLr-2bZ3Kw3hg>
 <xmx:PEaXYxAn-Xq4jvaw_9ouEjfYVtwV7p8Q7Bdj01B70RP2i2ih4OLQ9A>
 <xmx:PUaXY7FeWRQa5A646KaKrk7DqEUcvRtN59-0MjNpTuaUNSB24H5t7w>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 12 Dec 2022 10:18:19 -0500 (EST)
Date: Mon, 12 Dec 2022 16:18:17 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jinhao Fan <fanjinhao21s@ict.ac.cn>, qemu-devel@nongnu.org,
 kbusch@kernel.org
Subject: Re: [PATCH v3 1/2] hw/nvme: Implement shadow doorbell buffer support
Message-ID: <Y5dGOcky2PlisN1O@cormorant.local>
References: <20221207174918.GA1151796@roeck-us.net>
 <Y5GPRiO0g2mgA3FS@cormorant.local>
 <Y5GbbF68N5ZiYNdv@cormorant.local>
 <20221208184740.GA3380017@roeck-us.net>
 <20221208201353.GA928427@roeck-us.net>
 <20221208203955.GA1367659@roeck-us.net>
 <Y5b7Mdtklu0xA5bJ@cormorant.local>
 <c09eaf86-f6b1-cc74-1732-e3c7576e9d88@roeck-us.net>
 <Y5cwjfmTN4SVcZdk@cormorant.local>
 <81a71baf-3339-9928-b0b8-49f2168ffa57@roeck-us.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="xhWBvhVzud4iBMn5"
Content-Disposition: inline
In-Reply-To: <81a71baf-3339-9928-b0b8-49f2168ffa57@roeck-us.net>
Received-SPF: pass client-ip=64.147.123.24; envelope-from=its@irrelevant.dk;
 helo=wout1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


--xhWBvhVzud4iBMn5
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Dec 12 06:27, Guenter Roeck wrote:
> On 12/12/22 05:45, Klaus Jensen wrote:
> > On Dec 12 05:39, Guenter Roeck wrote:
> > > On 12/12/22 01:58, Klaus Jensen wrote:
> > > > On Dec  8 12:39, Guenter Roeck wrote:
> > > > > On Thu, Dec 08, 2022 at 12:13:55PM -0800, Guenter Roeck wrote:
> > > > > > On Thu, Dec 08, 2022 at 10:47:42AM -0800, Guenter Roeck wrote:
> > > > > > > >=20
> > > > > > > > A cq head doorbell mmio is skipped... And it is not the fau=
lt of the
> > > > > > > > kernel. The kernel is in it's good right to skip the mmio s=
ince the cq
> > > > > > > > eventidx is not properly updated.
> > > > > > > >=20
> > > > > > > > Adding that and it boots properly on riscv. But I'm perplex=
ed as to why
> > > > > > > > this didnt show up on our regularly tested platforms.
> > > > > > > >=20
> > > > > > > > Gonna try to get this in for 7.2!
> > > > > > >=20
> > > > > > > I see another problem with sparc64.
> > > > > > >=20
> > > > > > > [    5.261508] could not locate request for tag 0x0
> > > > > > > [    5.261711] nvme nvme0: invalid id 0 completed on queue 1
> > > > > > >=20
> > > > > > > That is seen repeatedly until the request times out. I'll tes=
t with
> > > > > > > your patch to see if it resolves this problem as well, and wi=
ll bisect
> > > > > > > otherwise.
> > > > > > >=20
> > > > > > The second problem is unrelated to the doorbell problem.
> > > > > > It is first seen in qemu v7.1. I'll try to bisect.
> > > > > >=20
> > > > >=20
> > > > > Unfortunately, the problem observed with sparc64 also bisects to =
this
> > > > > patch. Making things worse, "hw/nvme: fix missing cq eventidx upd=
ate"
> > > > > does not fix it (which is why I initially thought it was unrelate=
d).
> > > > >=20
> > > > > I used the following qemu command line.
> > > > >=20
> > > > > qemu-system-sparc64 -M sun4v -cpu "TI UltraSparc IIi" -m 512 -sna=
pshot \
> > > > >       -device nvme,serial=3Dfoo,drive=3Dd0,bus=3DpciB \
> > > > >       -drive file=3Drootfs.ext2,if=3Dnone,format=3Draw,id=3Dd0 \
> > > > >       -kernel arch/sparc/boot/image -no-reboot \
> > > > >       -append "root=3D/dev/nvme0n1 console=3DttyS0" \
> > > > >       -nographic -monitor none
> > > > >=20
> > > >=20
> > > > Hi Guenter,
> > > >=20
> > > > Thank you very much for the detailed reports and I apologize for the
> > > > fallout of this.
> > > >=20
> > > > I think this is related to missing endian conversions when handling=
 the
> > > > shadow doorbells. I'm not sure if there is a kernel issue here as w=
ell,
> > > > because as far as I can tell, the shadow doorbells are updated like=
 so:
> > > >=20
> > > >     old_value =3D *dbbuf_db;
> > > >     *dbbuf_db =3D value;
> > > >=20
> > > > (where `value` is the new head/tail value depending on if this is a=
n sq
> > > > or cq).
> > > >=20
> > > > Keith, is the kernel doing something magically here I am not aware =
of,
> > > > or isn't this missing some cpu_to_le32() / le32_to_cpu() calls as w=
ell?
> > >=20
> > > Wouldn't that mean that nvme doorbell support would be broken in Linux
> > > on all big endian systems ? Maybe it is, but it seems a bit unlikely.
> > >=20
> >=20
> > No, not broken in general - only for shadow doorbells. On regular MMIO,
> > the linux helpers takes care of endianness (and so does the MMIO
> > callbacks in QEMU). However, for shadow doorbells, the doorbell value is
> > written to host memory - and Linux (and QEMU) does not handle that
> > correctly wrt. endianness.
> >=20
> > I got it all working with the series I just posted for QEMU (v4) and
> > fixing endianness conversion for the above in the kernel (patch pending
> > for linux-nvme).
>=20
> Hmm, interesting. I guess I'll wait for the Linux patch to be posted.
>=20
> That makes me wonder, though: Are the Linux changes really necessary ?
> If this never worked, would it be possible to adjust the qemu code
> in a way that it just works with the existing Linux code ?
>=20

That would mean that hw/nvme would be non-compliant on big-endian and
I'd rather not leave it in that state.

> Alternatively, would it be possible to add a runtime flag to qemu
> that would let me disable shadow doorbell support ? I am testing
> all Linux kernel branches, and without such a flag I'd have to carry
> a patch just disabling it in qemu until all kernel branches are fixed
> (if that ever happens).
>=20

YES. The fallout of this has been bad, so I'll cook up a patch to
disable shadow doorbells at runtime.

--xhWBvhVzud4iBMn5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmOXRjkACgkQTeGvMW1P
DenHpwgAgK/ubQS4JbA0EmKozN/yuGSxXC/LNfdlYJOlqenJa3yAGjYfPopJ83/T
F9a78PQznWeRsjsj4Knl8m3+3gYRTlXakBhOSGbcq+1MNtlW2wtgGy1xQm4Il//8
20FLMEllY5DP+O66Fg/0NEgYETJ0+sInYavd0VUNBUzeD2rhSsP3VWPLMqqie9OP
/7t7kYnF4ibVrxc6/DyuI0ejcdiG/UvoEK3VrCzNOFpV3ovruBTMsMhtDlU79wMo
oyxVB9t6Wh1ZfXUdSmW/jNCiWpMraL4HLL0+bOJX8YLUxsKu2EhdB0nyb81KMQJR
EAp4AkQltHxc4/wAFk/MZ65/bsxzXA==
=syob
-----END PGP SIGNATURE-----

--xhWBvhVzud4iBMn5--

