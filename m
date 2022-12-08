Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73614646998
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Dec 2022 08:18:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3B91-0007oS-Qr; Thu, 08 Dec 2022 02:16:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>) id 1p3B8y-0007nU-Ts
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 02:16:33 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>) id 1p3B8w-00047D-0E
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 02:16:32 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 9B0B95C005B;
 Thu,  8 Dec 2022 02:16:26 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 08 Dec 2022 02:16:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1670483786; x=1670570186; bh=tM
 RuaqZ8QafTksMSXJdPgP+eh8BftDlqaps/pBIv5Hg=; b=TLp8Y0wurDLiTMJzd6
 Q2oYB/UWi1sK2cbPHEtyV4D12NKcp+Pkjpcn92mx0obR8osdPYdgN6ThOkwrAyKj
 bGJHW2VRj/xwkB3rIoVJoe8Ua0yxD/mVdnSu+wm0tdnPGDYY2WTKQH0Ju/lpsoLX
 U/PxMAxHl3lDJoNk1ftRbgQfOzD5jr9SXX9lTAiPxS7mi5DRccFVHxOw8E50SuBu
 d+Oki3XAZh2b9Ak72aGMvLq3NtRRm1LkL61QbckMmKZ/r8+6kFrFSzhi8nrk4Ynb
 WuZXvBtNpScoy3NyXPUuGiuJ79Vxeb0vJ+RK6w0WQ7MNttmU3bhH+vs81CEDAg3R
 lXMw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1670483786; x=1670570186; bh=tMRuaqZ8QafTksMSXJdPgP+eh8Bf
 tDlqaps/pBIv5Hg=; b=jFV3EAV2JujZQ4qCKlmAkzrP1wRoil3Bowbjeb/8fdGu
 zSji4z7hmr2G9br1sdoHupm9EZmBMi5tZ7untqQVaUyosUF5HxgB+MHbM/B28TM4
 idWxqpdf/2OBXpAH6b5wezNHbqFs03y8QwrclCg+ZWTxxMARYjHXWmoiiaYOFwV+
 mcLFm2WWV9/mQfmqxMtEyFjAU46JWgWq4DPREgn8xkj7xesfJ6trmRufyeU3TinI
 y83TNE7pCiJunYfNAWf+ODB21IzakJANxqWV1ccueYp7DwW8+01qvO6Qjuj//b1p
 0UarLtZO6MHTGIEVWH8wVOb2BQBummPdPypeQLfK9g==
X-ME-Sender: <xms:SY-RYw63zrdQ-EWGsO-BnZs0ony_6A2QNQNvJdm7LooRiKa7vtHaTA>
 <xme:SY-RYx6hWCj3nKkKYBouJsoCNu-QSPqPnc9hn9Kgu4m_55O6o0aZ3CtkIPHo-LhCf
 W2uqOBUgsGbVw_hYGU>
X-ME-Received: <xmr:SY-RY_flhVGU51b3eVaigbVvZQNC1qr7NmanAB8h566Q0SALupgQ9HZlddmy5g6KYbszMs6zKOyphwYYq9WDnjA2raR8Fg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudelgddutdejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvvefukfhfgggtuggjsehgtd
 erredttdejnecuhfhrohhmpefmlhgruhhsucflvghnshgvnhcuoehithhssehirhhrvghl
 vghvrghnthdrughkqeenucggtffrrghtthgvrhhnpeejgfejfeffvdeuhfeifefhgffgue
 elhedukeevjeevtdduudegieegteffffejveenucevlhhushhtvghrufhiiigvpedtnecu
 rfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:SY-RY1JANnnpV6FwGM4jIa6Li41zyhCiiXb16BOCH2C46RIzRE-1Rw>
 <xmx:SY-RY0LTvv1gtX2EYG5kgIVouerXUpsibURQ__NZUPezZhL0jn_Kkw>
 <xmx:SY-RY2zby_nk0BalDCMytS7fg4UyN7AF6GYv7c2v39RDG3VjVaAZBg>
 <xmx:So-RY43C04DxceOv_1Odg7DGCaRcrKdFdd2kme1-wIZBijH0sP88eQ>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 8 Dec 2022 02:16:24 -0500 (EST)
Date: Thu, 8 Dec 2022 08:16:22 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jinhao Fan <fanjinhao21s@ict.ac.cn>, qemu-devel@nongnu.org,
 kbusch@kernel.org
Subject: Re: [PATCH v3 1/2] hw/nvme: Implement shadow doorbell buffer support
Message-ID: <Y5GPRiO0g2mgA3FS@cormorant.local>
References: <20220616123408.3306055-1-fanjinhao21s@ict.ac.cn>
 <20220616123408.3306055-2-fanjinhao21s@ict.ac.cn>
 <20221207174918.GA1151796@roeck-us.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="vFIPv9pf3B64OMvQ"
Content-Disposition: inline
In-Reply-To: <20221207174918.GA1151796@roeck-us.net>
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


--vFIPv9pf3B64OMvQ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Dec  7 09:49, Guenter Roeck wrote:
> Hi,
>=20
> On Thu, Jun 16, 2022 at 08:34:07PM +0800, Jinhao Fan wrote:
> > Implement Doorbel Buffer Config command (Section 5.7 in NVMe Spec 1.3)
> > and Shadow Doorbel buffer & EventIdx buffer handling logic (Section 7.13
> > in NVMe Spec 1.3). For queues created before the Doorbell Buffer Config
> > command, the nvme_dbbuf_config function tries to associate each existing
> > SQ and CQ with its Shadow Doorbel buffer and EventIdx buffer address.
> > Queues created after the Doorbell Buffer Config command will have the
> > doorbell buffers associated with them when they are initialized.
> >=20
> > In nvme_process_sq and nvme_post_cqe, proactively check for Shadow
> > Doorbell buffer changes instead of wait for doorbell register changes.
> > This reduces the number of MMIOs.
> >=20
> > In nvme_process_db(), update the shadow doorbell buffer value with
> > the doorbell register value if it is the admin queue. This is a hack
> > since hosts like Linux NVMe driver and SPDK do not use shadow
> > doorbell buffer for the admin queue. Copying the doorbell register
> > value to the shadow doorbell buffer allows us to support these hosts
> > as well as spec-compliant hosts that use shadow doorbell buffer for
> > the admin queue.
> >=20
> > Signed-off-by: Jinhao Fan <fanjinhao21s@ict.ac.cn>
>=20
> I noticed that I can no longer boot Linux kernels from nvme on riscv64
> systems. The problem is seen with qemu v7.1 and qemu v7.2-rc4.
> The log shows:
>=20
> [   35.904128] nvme nvme0: I/O 642 (I/O Cmd) QID 1 timeout, aborting
> [   35.905000] EXT4-fs (nvme0n1): mounting ext2 file system using the ext=
4 subsystem
> [   66.623863] nvme nvme0: I/O 643 (I/O Cmd) QID 1 timeout, aborting
> [   97.343989] nvme nvme0: Abort status: 0x0
> [   97.344355] nvme nvme0: Abort status: 0x0
> [   97.344647] nvme nvme0: I/O 7 QID 0 timeout, reset controller
> [   97.350568] nvme nvme0: I/O 644 (I/O Cmd) QID 1 timeout, aborting
>=20
> This is with the mainline Linux kernel (v6.1-rc8).
>=20
> Bisect points to this patch. Reverting this patch and a number of associa=
ted
> patches (to fix conflicts) fixes the problem.
>=20
> 06143d8771 Revert "hw/nvme: Implement shadow doorbell buffer support"
> acb4443e3a Revert "hw/nvme: Use ioeventfd to handle doorbell updates"
> d5fd309feb Revert "hw/nvme: do not enable ioeventfd by default"
> 1ca1e6c47c Revert "hw/nvme: unregister the event notifier handler on the =
main loop"
> 2d26abd51e Revert "hw/nvme: skip queue processing if notifier is cleared"
> 99d411b5a5 Revert "hw/nvme: reenable cqe batching"
> 2293d3ca6c Revert "hw/nvme: Add trace events for shadow doorbell buffer"
>=20
> Qemu command line:
>=20
> qemu-system-riscv64 -M virt -m 512M \
>      -kernel arch/riscv/boot/Image -snapshot \
>      -device nvme,serial=3Dfoo,drive=3Dd0 \
>      -drive file=3Drootfs.ext2,if=3Dnone,format=3Draw,id=3Dd0 \
>      -bios default \
>      -append "root=3D/dev/nvme0n1 console=3DttyS0,115200 earlycon=3Duart8=
250,mmio,0x10000000,115200" \
>      -nographic -monitor none
>=20
> Guenter

Hi Guenter,

Thanks for the bisect.

The shadow doorbell is also an obvious candidate for this regression. I
wonder if this could be a kernel bug, since we are not observing this on
other architectures. The memory barriers required are super finicky, but
in QEMU all the operations are associated with full memory barriers. The
barriers are more fine grained in the kernel though.

I will dig into this together with Keith.

--vFIPv9pf3B64OMvQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmORj0UACgkQTeGvMW1P
DeklrwgAuSGZmMd5TZt+eAdK74XReLURx7e+zIt9sqSwDy+W7SFmGnl3mtp2BA0N
gfk6De38A3JwWXyWVdhasM65hujvFmNPQy8SQqF4k7nYEkHvZ91xLFsEXPsTYZJT
NsJ4IvxhkcoGatwqtuQ8pQkETKlScwM+g6mFlU4Uh1vFap2rUZNiQIq3sAVzq/DI
Lju5t/X4jAOXD2JoRhrYkv1IdIBveyTP2MCO3vl2ey5vU+FUIPrGWeuZ3oUczY/T
4xMqmLdCt8pqd6yhIt3IGRXJllv089Eyjty1Hfz83iJ3fdB69jwuywQsuJYahl4/
khyQQtjyP/HDGK/aDU0Kr1Js3E+dig==
=KdUZ
-----END PGP SIGNATURE-----

--vFIPv9pf3B64OMvQ--

