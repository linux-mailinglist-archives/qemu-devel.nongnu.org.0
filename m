Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93DA459D6A2
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 11:28:20 +0200 (CEST)
Received: from localhost ([::1]:54406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQQCp-0003FN-At
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 05:28:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1oQQ8t-0008NT-Pf; Tue, 23 Aug 2022 05:24:16 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:57755)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1oQQ8g-00054b-Kj; Tue, 23 Aug 2022 05:24:14 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 7D2295C017C;
 Tue, 23 Aug 2022 05:23:59 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Tue, 23 Aug 2022 05:23:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1661246639; x=1661333039; bh=ot
 mssfj9N3teg30fD6nrCS81JGFsoJlMNlwMt1B2sFY=; b=bRx3zjnv1J6pSgdkhn
 pcny+NxlyqWerdHxkm6IOrqDich5H0CE7gcRH5DzTd5QpUVeU/MNmZ4VcHHEaJaN
 iSUGlLQdpp15nndSCnnwazarJGlF3NGGpwrs3EAmVkiyZguS9u2AhhKR4gKgJT4g
 BO2a6Fy4Oe90srPADj/BxArDQZGPgKjSzfHFe4nQ7s4bo1sSEPNchyfoTQxFgy3M
 kSt22HTE3yFNBaDekpv9bdm1ebRYgI0sCSGlaXPmn6aObN/J+RsTUas7IeCIvKN1
 VJF32s/mEcrX7AGcQWVMsT1SGBrGEATriJpsaLKa+SZaWjSHZL4x/ElrbrsICV+0
 q3TA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1661246639; x=1661333039; bh=otmssfj9N3teg30fD6nrCS81JGFs
 oJlMNlwMt1B2sFY=; b=sK5+II0XjpkNgb0VrgAmdljjsqZ5q8GlGy/vmw4yXA3V
 aRpCHoGjo439VloqJn2kX9kCghsU/gT+w943F9gsWMyURFiRpnkqo1TWWUgChdeZ
 rgf5S0sVac9o8x0/vxQkE13ymZ2OsWYCZ8fR15lbtL8+B+9i2sA55VROaEo0gfWB
 0knSktAFXNI1KX2pbYth6jbUP413qVRvmo4H6mdU7HLNAE2Ubdh9eNtX6n9ufwrs
 yPG75RdxBz+M5NeA0DL44EZG76tPDkCh888LutQTE9D9It9Q7dAJNn111YUjHGdy
 vpJjKlZh8UFULPIg0lw9Pph8ka/vUWCu3Apntij3eA==
X-ME-Sender: <xms:rpwEY4C9czOCUvURV7PPpXzXR68mIHQm4dWmhsln0ta7Ta1vEsFmxg>
 <xme:rpwEY6jLft7msMEh9sccLZazUBUa0cZFwQ-cYd93cI01Lp6_Szw3JE2AJXpmV8-EU
 tOYRNbs3mQQ6oQHqCA>
X-ME-Received: <xmr:rpwEY7n-NQ1aEwSi_SqEc2tYfHuKGOqb1XsYQhmyPrAGyRFtDgl6wwXfuvCKyo9pCPZgbsZ_HwwvuMTk6w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdeiledgudefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepffduvdfhheejudfgieejueeileegveduvdelhfekhffgteetffdtvdekveei
 leefnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpe
 dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:rpwEY-wWR6hHF72eHpBXm94iesjnJNEkkzQxMmlvJhwuw36214xlNQ>
 <xmx:rpwEY9SOsIoRtWi8Ip5w-M3q3dt-e1T_xJk5XUMva1FJr4Da5D_02g>
 <xmx:rpwEY5bk1bFsA594rUsL0512_0Brrs4RFKRRZ0RWyliamMzUKjF9_Q>
 <xmx:r5wEY4EHNsqajsf03V4xT6vRAwMyd5MO9zNtZLlHBgJkWKNbFmBebw>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 23 Aug 2022 05:23:57 -0400 (EDT)
Date: Tue, 23 Aug 2022 11:23:55 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Delevoryas <peter@pjd.dev>
Cc: patrick@stwcx.xyz, clg@kaod.org, peter.maydell@linaro.org,
 andrew@aj.id.au, joel@jms.id.au, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, dz4list@gmail.com
Subject: Re: [PATCH 1/1] hw/i2c/aspeed: Fix old reg slave receive
Message-ID: <YwScq4fD+gBIN+3Q@apples>
References: <20220820225712.713209-1-peter@pjd.dev>
 <20220820225712.713209-2-peter@pjd.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="6f5kc02gty7ajWhr"
Content-Disposition: inline
In-Reply-To: <20220820225712.713209-2-peter@pjd.dev>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--6f5kc02gty7ajWhr
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Aug 20 15:57, Peter Delevoryas wrote:
> I think when Klaus ported his slave mode changes from the original patch
> series to the rewritten I2C module, he changed the behavior of the first
> byte that is received by the slave device.
>=20
> What's supposed to happen is that the AspeedI2CBus's slave device's
> i2c_event callback should run, and if the event is "send_async", then it
> should populate the byte buffer with the 8-bit I2C address that is being
> sent to. Since we only support "send_async", the lowest bit should
> always be 0 (indicating that the master is requesting to send data).
>=20
> This is the code Klaus had previously, for reference. [1]
>=20
>     switch (event) {
>     case I2C_START_SEND:
>         bus->buf =3D bus->dev_addr << 1;
>=20
>         bus->buf &=3D I2CD_BYTE_BUF_RX_MASK;
>         bus->buf <<=3D I2CD_BYTE_BUF_RX_SHIFT;
>=20
>         bus->intr_status |=3D (I2CD_INTR_SLAVE_ADDR_RX_MATCH | I2CD_INTR_=
RX_DONE);
>         aspeed_i2c_set_state(bus, I2CD_STXD);
>=20
>         break;
>=20
> [1]: https://lore.kernel.org/qemu-devel/20220331165737.1073520-4-its@irre=
levant.dk/
>=20
> Signed-off-by: Peter Delevoryas <peter@pjd.dev>
> Fixes: a8d48f59cd021b25 ("hw/i2c/aspeed: add slave device in old register=
 mode")
> ---
>  hw/i2c/aspeed_i2c.c         | 8 +++++---
>  include/hw/i2c/aspeed_i2c.h | 1 +
>  2 files changed, 6 insertions(+), 3 deletions(-)
>=20
> diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
> index 42c6d69b82..c166fd20fa 100644
> --- a/hw/i2c/aspeed_i2c.c
> +++ b/hw/i2c/aspeed_i2c.c
> @@ -1131,7 +1131,9 @@ static int aspeed_i2c_bus_slave_event(I2CSlave *sla=
ve, enum i2c_event event)
>      AspeedI2CBus *bus =3D ASPEED_I2C_BUS(qbus->parent);
>      uint32_t reg_intr_sts =3D aspeed_i2c_bus_intr_sts_offset(bus);
>      uint32_t reg_byte_buf =3D aspeed_i2c_bus_byte_buf_offset(bus);
> -    uint32_t value;
> +    uint32_t reg_dev_addr =3D aspeed_i2c_bus_dev_addr_offset(bus);
> +    uint32_t dev_addr =3D SHARED_ARRAY_FIELD_EX32(bus->regs, reg_dev_add=
r,
> +                                                SLAVE_DEV_ADDR1);
> =20
>      if (aspeed_i2c_is_new_mode(bus->controller)) {
>          return aspeed_i2c_bus_new_slave_event(bus, event);
> @@ -1139,8 +1141,8 @@ static int aspeed_i2c_bus_slave_event(I2CSlave *sla=
ve, enum i2c_event event)
> =20
>      switch (event) {
>      case I2C_START_SEND_ASYNC:
> -        value =3D SHARED_ARRAY_FIELD_EX32(bus->regs, reg_byte_buf, TX_BU=
F);
> -        SHARED_ARRAY_FIELD_DP32(bus->regs, reg_byte_buf, RX_BUF, value <=
< 1);
> +        /* Bit[0] =3D=3D 0 indicates "send". */
> +        SHARED_ARRAY_FIELD_DP32(bus->regs, reg_byte_buf, RX_BUF, dev_add=
r << 1);
> =20
>          ARRAY_FIELD_DP32(bus->regs, I2CD_INTR_STS, SLAVE_ADDR_RX_MATCH, =
1);
>          SHARED_ARRAY_FIELD_DP32(bus->regs, reg_intr_sts, RX_DONE, 1);
> diff --git a/include/hw/i2c/aspeed_i2c.h b/include/hw/i2c/aspeed_i2c.h
> index 300a89b343..adc904d6c1 100644
> --- a/include/hw/i2c/aspeed_i2c.h
> +++ b/include/hw/i2c/aspeed_i2c.h
> @@ -130,6 +130,7 @@ REG32(I2CD_CMD, 0x14) /* I2CD Command/Status */
>      SHARED_FIELD(M_TX_CMD, 1, 1)
>      SHARED_FIELD(M_START_CMD, 0, 1)
>  REG32(I2CD_DEV_ADDR, 0x18) /* Slave Device Address */
> +    SHARED_FIELD(SLAVE_DEV_ADDR1, 0, 7)
>  REG32(I2CD_POOL_CTRL, 0x1C) /* Pool Buffer Control */
>      SHARED_FIELD(RX_COUNT, 24, 5)
>      SHARED_FIELD(RX_SIZE, 16, 5)
> --=20
> 2.37.1
>=20

Nice catch Peter! I'm not sure how I messed that up like that.

Reviewed-by: Klaus Jensen <k.jensen@samsung.com>

--6f5kc02gty7ajWhr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmMEnKkACgkQTeGvMW1P
DelJXAf/QBkRA+aluk7Cs9Rh60eAFgnWLjslOV1ydyIMLwkumiX0ZJ0mX3k8+cpD
G+jQ7/EVwgDuoiusi/fUKGVMKhfcxUY8TTh1udoCuNKgcpfA0U3gTGDOT3+pGVEz
Ryxyu9cPEnNyNHoB04WA0H5v/Y6fC10hhT96RzWLtkdhb7eX1ottNNlC94mh+NX6
9RLRKADkJROMd5pO9OtcgjIP2uEmZoryCyODpN8BtA17nQkguXeYr9PoXVyoqWqY
UQUOgCobHLDUMxZU95Cij25QTpLMJgEEkpnKbp3Ur5VJFf1PL/C0WnjVa7lOp4Ga
DZj6Wx6ttNimVj5+jm0wcDuJrn2Fsw==
=BVdZ
-----END PGP SIGNATURE-----

--6f5kc02gty7ajWhr--

