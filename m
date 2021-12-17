Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA6A7478671
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 09:46:21 +0100 (CET)
Received: from localhost ([::1]:53474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1my8se-0006fx-6c
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 03:46:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>) id 1my8kO-0003Gi-6L
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 03:37:48 -0500
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:48693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>) id 1my8kG-0005Ca-6S
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 03:37:47 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 32F6D5801DE;
 Fri, 17 Dec 2021 03:37:36 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Fri, 17 Dec 2021 03:37:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=dSMvx1+nkKzSmU1shpGDyQNX8gC
 Goy/vSQLnaY0ahsE=; b=nzxGCpyc/xIP4rI9pLkjSXH7jz8QGEiIdJYTWf7ajon
 R5whPSQI6pWoDdlzagbCGBS20t/9TT7RgPircTG6x51wwcK3+f4mM4N1IuDCm9aI
 KL9sVm7F6//U5oBf4lu28WgjRkB32sY7opo2mSRSrDvUi1Tb8yT/pfqbRHmNGjqd
 90PX0HqQyiTkuge+97mGvXB9l6L6gcRVEqmai70jZTaY90JJxgUecbg88zTGIxml
 t5zMxO+vy2XpDsjGOBgeP91N1eUy4STMeWSoGy8oRaiF8z7Y77MggDPYmuodYhFf
 3gm1JZEloJFwkXQZnoinl2RwL+jelKg9w6k2fSgr8WA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=dSMvx1
 +nkKzSmU1shpGDyQNX8gCGoy/vSQLnaY0ahsE=; b=XX8x3AIiLuRaOcQQeTe3P8
 ZODDHGRBWzpy1zlSsnVGTS2d9TAMqh1cRkb/VN87l9G51OBJbURjIy+IMyeKeyc0
 hxxUoosQKGmiUeT4/PeBln3iqnmuFAxYz05PRwEOISodtebgt6QdSKeqwJxDdB9M
 t4211/FfGkyaqIMjj35BiMAoKCCHp761XjHjXK/43ugjbmtpgceS4qmMGH5ueqPp
 Rp8kcTKKWzwJcd67h3jyTVi/lTTzZP+t46WAUmSbdbRpKshtfAR5ix1R7cZbkw/j
 buYSxk6B1RAHk6CfCMxh+efe24uIZdkCsKAWgU/K1wOv5ySLbY4CliRiksghRxKA
 ==
X-ME-Sender: <xms:T0y8YcGe3BH95kBH5qo3-sNf9J6gawj_NGazOhlO0BgHMrr5r1owAQ>
 <xme:T0y8YVUac9FGNWXSSQhCQheKBpKOkwN7RVWZpZ9Rfc5XTqwdjSdsDS1dg3bzHcfsX
 SSwcB2VU8WR0o2XAFc>
X-ME-Received: <xmr:T0y8YWLsZouljDGFPfHUHVmUy3IL0v0IMgX-E76Q-Qq4htPbN3rdFBil8mrlFh8UxcmDghiX6tOb_yRQNTSTTfFhXv--BKwqdA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrleehgdduvdduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeetudehfeefhffgieefhefgteffffegteevffegudetteeuvdejveetleejgfef
 udenucffohhmrghinhepghhithhlrggsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:T0y8YeEdbv59Yn78aoNwDI7IugqHjyXdIYLzoWhTAQdkK9Hw_r7lqQ>
 <xmx:T0y8YSWjaikNtMcoSwwpvC4APtfqzN-vOX2p8XtoZ6IM6U9wi3vpsQ>
 <xmx:T0y8YRNR_W3BTk0vwKj24NBiEx639rre-6wvRjAhlFKjXH1ksrb9RQ>
 <xmx:UEy8YX0Ji2_F6iuJ3P8ct_z-zq3kB-8I0hb_cW2izktGPfoS-bBsXg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 17 Dec 2021 03:37:32 -0500 (EST)
Date: Fri, 17 Dec 2021 09:37:30 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Qiuhao Li <Qiuhao.Li@outlook.com>
Subject: Re: [RFC PATCH] memory: Fix dma-reentrancy issues at the MMIO level
Message-ID: <YbxMSpb7Eaiw0azn@apples>
References: <20211217030858.834822-1-alxndr@bu.edu>
 <PN0PR01MB6352C2E496E5723275EB1878FC789@PN0PR01MB6352.INDPRD01.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="VCSXtF6QcfFGFlJa"
Content-Disposition: inline
In-Reply-To: <PN0PR01MB6352C2E496E5723275EB1878FC789@PN0PR01MB6352.INDPRD01.PROD.OUTLOOK.COM>
Received-SPF: pass client-ip=66.111.4.229; envelope-from=its@irrelevant.dk;
 helo=new3-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, David Hildenbrand <david@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 Li Qiang <liq3ea@gmail.com>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--VCSXtF6QcfFGFlJa
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Dec 17 06:27, Qiuhao Li wrote:
> Thanks Alex. It seems this patch sets and checks if the destination devic=
e is busy. But how about the data transfers not triggered directly by PMIO/=
MMIO handlers? For example:
>=20
> 1. Device A Timer's callback -> Device A MMIO handler
> 2. Device A BH's callback -> Device A MMIO handler
>=20
> In these situations, when A launches a DMA to itself, the dev->engaged_in=
_direct_io is not set, so the operation is allowed. Maybe we should log the=
 source and check the destination when we launch data transfers. Is there a=
 way to do that?
>=20
> Below is a reproducer in NVMe which triggers DMA in a timer's callback (n=
vme_process_sq). I can still trigger use-after-free exception with this pat=
ch on qemu-6.1.0:
>=20
> cat << EOF | ./qemu-system-x86_64 -display none -machine accel=3Dqtest \
> -machine q35 -nodefaults -drive file=3Dnull-co://,if=3Dnone,format=3Draw,=
id=3Ddisk0 \
> -device nvme,drive=3Ddisk0,serial=3D1 -qtest stdio \
>=20
> outl 0xcf8 0x80000810               /* MLBAR (BAR0) =E2=80=93 Memory Regi=
ster Base Address, lower 32-bits */
> outl 0xcfc 0xe0000000               /* MMIO Base Address =3D 0xe0000000 */
> outl 0xcf8 0x80000804               /* CMD - Command */
> outw 0xcfc 0x06                     /* Bus Master Enable, Memory Space En=
able */
> write 0xe0000024 0x4 0x02000200     /* [3] 3.1.8, Admin Queue Attributes =
*/
> write 0xe0000028 0x4 0x00100000     /* asq =3D 0x1000 */
> write 0xe0000030 0x4 0x00200000     /* acq =3D 0x2000 */
> write 0xe0000014 0x4 0x01004600     /* [3] 3.1.5, Controller Configuratio=
n, start ctrl */
> write 0xe0001000 0x1 0x01           /* [3] 3.1.24, SQyTDBL =E2=80=93 Subm=
ission Queue y Tail Doorbell */
> write 0x1000 0x1 0x02               /* cmd->opcode, NVME_ADM_CMD_GET_LOG_=
PAGE, nvme_get_log() */
> write 0x1018 0x4 0x140000e0         /* prp1 =3D 0xe0000014, NVME_REG_CC, =
nvme_ctrl_reset() */
> write 0x1028 0x4 0x03000004         /* cmd->cdw10, lid =3D 3 NVME_LOG_FW_=
SLOT_INFO, nvme_fw_log_info, buf_len =3D 4 */
> write 0x1030 0x4 0xfc010000         /* cmd->cdw12 =3D 0x1fc, Log Page Off=
set, trans_len =3D sizeof(fw_log) - 0x1fc =3D 4 */
> clock_step
> EOF
>=20
> CC: Mauro Matteo Cascella and Philippe Mathieu-Daud=C3=A9. Should we put =
the reproducer above to https://gitlab.com/qemu-project/qemu/-/issues/556?
>=20

This is a good reproducer. Does it still work if you do the `write
0xe0001000 0x1 0x01` at the end instead? It looks weird that you ring
the doorbell prior to writing the command in the queue.

--VCSXtF6QcfFGFlJa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmG8TEgACgkQTeGvMW1P
DekPrwf9GwiRcu3GSlp4nEjIXKTEMheQttizXNHkLYQO0p3qZawDzOKkRTyUZGh9
W1hISN9H/7QJuTlGZzqXj+fn4rMycP86Va4zSlBPrXjIgfMrep1Ekivt1kGiCnlA
k5GHb1d7DwzOy5zH4vtDFbdLskQq8c4fEFusyVCRXqFUEcxHCKpHhPzfGMeThLTK
srRHtoVOVkV5lfcx2Ka8cHFquDizDWm6QVYiGSL5BjUmzM4IkyBAuMstb+Ak7hgz
tW4x7FY05Yfhxft9ELG8j4la7IUKt4Dp1MywiWyyWEooUihC4LmtZLbR6BKL5tPU
AZsbKfxvHp1/BMLZnz4IfzhaDAT3jA==
=cgVU
-----END PGP SIGNATURE-----

--VCSXtF6QcfFGFlJa--

