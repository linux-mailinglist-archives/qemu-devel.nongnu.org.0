Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D55853B410
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jun 2022 09:09:32 +0200 (CEST)
Received: from localhost ([::1]:47218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwexW-0006lY-VY
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 03:09:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nweha-0002SD-Ul; Thu, 02 Jun 2022 02:53:11 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:44251)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nwehY-00073R-Lv; Thu, 02 Jun 2022 02:53:02 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 3E5273200909;
 Thu,  2 Jun 2022 02:52:56 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Thu, 02 Jun 2022 02:52:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1654152775; x=1654239175; bh=RK
 awLh6XniL5/0fjAbjDISKDQ9gHeoRRguD73dYgP2U=; b=IvcFq3f3DZOwzdWbnq
 dK+mwrhprWtr2rzBmTcXNnulz0u2cRAu/YFCCgMbWxb0DQSh6MtF19lRs/bFAWIR
 CK4t90GuE5AIpuwrvGTWzrEoVWXWxNqJlU+Br4B1ecUzlNVaYURmXOUoqTEUZNTT
 JUyYQ0v12VhMI2BYIf4oRpoCQqkT80CAfxSFigRHM0X2g5VjAlp9lPeGOs+rub7R
 sWEOdWZ25eOeffuZm5Tb25Ut5VF2JOTFwTX67TFq/5WP/efqooJUDilq7eLaWyJF
 UaUQWtLI/buLu7psRdeRvdSRT4O4+bypSODmOalPalqNHicvWQ1Viw3uTixh2Xjt
 AbEQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1654152775; x=1654239175; bh=RKawLh6XniL5/0fjAbjDISKDQ9gH
 eoRRguD73dYgP2U=; b=kcdb6REwLop20vEz/cuFdYhlaBhxOt2TjQTPrilIwLXg
 +7Z4EOO8C7LJ+l6TFB+kSM8LYunoqt5/b99RsPzVr/oxyV1Y+3NOyRD8psSXQmer
 jW1ydt0Uc0f9SWZV+qo+tHMvPPo7ONcfwUApQYFUUtQlUX3zHFFOYb17R/sfzmsA
 5LXvASFgQoFkh6y+/d/9k+JJ5vmhBRESlHx7J5FVTw2gsiEvrzK3u47Pi6VYA/tN
 04gS5Y1ngOIq3ualPcedcxPDB42yfYruUn2OxcFZ3yNruQvRknFSlJjl7KuuJ8lW
 DV0H7gOBkLLvgWUbTrwH0OSQ8JrEKfqGCzlnjr6ayg==
X-ME-Sender: <xms:R16YYjkJk7TbRFiSJFUrqRWfJ7QNrX88WHUJv_b9HzNf3YrGDY8iYQ>
 <xme:R16YYm0_ZjPVr0IsIrES7ZTOwT89yAOf0hxvJlKQ6foZbAQxOIReJAp8BDGmSCBqx
 5YzJtjY239x8O1TlVM>
X-ME-Received: <xmr:R16YYppHYbXyxnjnn6ihJO4564AHpv_S47hz0Vr3EDRG5HRTnsOcJz0EwDlw2yiOBtNnbXfb2nIJuk1ynw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrledugddutdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjefgjeefffdvuefhieefhffggfeuleehudekveejvedtuddugeeigeetffff
 jeevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:R16YYrlEm3Pnb3CMDD4yeH3kGJZoskkd864_Gg1qg6p7l4B8aTAAPA>
 <xmx:R16YYh09qr3sgfJkI_UxvsoO2J8erJplnlgRXVfxmKaqjGzGnbIy4g>
 <xmx:R16YYquvBrKCE6rV1geNd0-5ZTp1TOs4rHbITH2dp1KTEMu9lAMxnQ>
 <xmx:R16YYvN-nM2cR8NJ1dbsUar2sgzirK34XLWveqrl0HurSlteLpOPVA>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 2 Jun 2022 02:52:53 -0400 (EDT)
Date: Thu, 2 Jun 2022 08:52:51 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Cc: qemu-devel@nongnu.org, Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 qemu-arm@nongnu.org, Peter Delevoryas <pdel@fb.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Corey Minyard <cminyard@mvista.com>,
 Padmakar Kalghatgi <p.kalghatgi@samsung.com>,
 Damien Hedde <damien.hedde@greensocs.com>,
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 Arun Kumar Kashinath Agasar <arun.kka@samsung.com>,
 Klaus Jensen <k.jensen@samsung.com>
Subject: Re: [RFC PATCH v2 1/6] hw/i2c/aspeed: rework raise interrupt trace
 event
Message-ID: <YpheQ1DhFcP90PYC@apples>
References: <20220601210831.67259-1-its@irrelevant.dk>
 <20220601210831.67259-2-its@irrelevant.dk>
 <0eede847-749e-9051-9913-7eda005e265f@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="S1ExMK7wXXeN9P6x"
Content-Disposition: inline
In-Reply-To: <0eede847-749e-9051-9913-7eda005e265f@kaod.org>
Received-SPF: pass client-ip=64.147.123.21; envelope-from=its@irrelevant.dk;
 helo=wout5-smtp.messagingengine.com
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


--S1ExMK7wXXeN9P6x
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jun  2 08:49, C=C3=A9dric Le Goater wrote:
> On 6/1/22 23:08, Klaus Jensen wrote:
> > From: Klaus Jensen <k.jensen@samsung.com>
> >=20
> > Build a single string instead of having several parameters on the trace
> > event.
> >=20
> > Suggested-by: C=C3=A9dric Le Goater <clg@kaod.org>
> > Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> > ---
> >   hw/i2c/aspeed_i2c.c | 55 +++++++++++++++++++++++++++++++++++----------
> >   hw/i2c/trace-events |  2 +-
> >   2 files changed, 44 insertions(+), 13 deletions(-)
> >=20
> > diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
> > index 5fce516517a5..576425898b09 100644
> > --- a/hw/i2c/aspeed_i2c.c
> > +++ b/hw/i2c/aspeed_i2c.c
> > @@ -21,6 +21,7 @@
> >   #include "qemu/osdep.h"
> >   #include "hw/sysbus.h"
> >   #include "migration/vmstate.h"
> > +#include "qemu/cutils.h"
> >   #include "qemu/log.h"
> >   #include "qemu/module.h"
> >   #include "qemu/error-report.h"
> > @@ -31,6 +32,9 @@
> >   #include "hw/registerfields.h"
> >   #include "trace.h"
> > +#define ASPEED_I2C_TRACE_INTR_TEMPLATE \
> > +    "pktdone|nak|ack|done|normal|abnormal|"
> > +
> >   static inline void aspeed_i2c_bus_raise_interrupt(AspeedI2CBus *bus)
> >   {
> >       AspeedI2CClass *aic =3D ASPEED_I2C_GET_CLASS(bus->controller);
> > @@ -38,23 +42,50 @@ static inline void aspeed_i2c_bus_raise_interrupt(A=
speedI2CBus *bus)
> >       uint32_t intr_ctrl_reg =3D aspeed_i2c_bus_intr_ctrl_offset(bus);
> >       bool raise_irq;
> > -    trace_aspeed_i2c_bus_raise_interrupt(bus->regs[reg_intr_sts],
> > -        aspeed_i2c_bus_pkt_mode_en(bus) &&
> > -        ARRAY_FIELD_EX32(bus->regs, I2CM_INTR_STS, PKT_CMD_DONE) ?
> > -                                                               "pktdon=
e|" : "",
> > -        SHARED_ARRAY_FIELD_EX32(bus->regs, reg_intr_sts, TX_NAK) ? "na=
k|" : "",
> > -        SHARED_ARRAY_FIELD_EX32(bus->regs, reg_intr_sts, TX_ACK) ? "ac=
k|" : "",
> > -        SHARED_ARRAY_FIELD_EX32(bus->regs, reg_intr_sts, RX_DONE) ? "d=
one|"
> > -                                                                  : "",
> > -        SHARED_ARRAY_FIELD_EX32(bus->regs, reg_intr_sts, NORMAL_STOP) ?
> > -                                                                "norma=
l|" : "",
> > -        SHARED_ARRAY_FIELD_EX32(bus->regs, reg_intr_sts, ABNORMAL) ? "=
abnormal"
> > -                                                                   : "=
");
> > +    if (trace_event_get_state_backends(TRACE_ASPEED_I2C_BUS_RAISE_INTE=
RRUPT)) {
> > +        static const size_t BUF_SIZE =3D strlen(ASPEED_I2C_TRACE_INTR_=
TEMPLATE);
> > +        g_autofree char *buf =3D g_malloc0(BUF_SIZE);
> > +
> > +        /*
> > +         * Remember to update ASPEED_I2C_TRACE_INTR_TEMPLATE if you ad=
d a new
> > +         * status string.
> > +         */
> > +
> > +        if (aspeed_i2c_bus_pkt_mode_en(bus) &&
> > +            ARRAY_FIELD_EX32(bus->regs, I2CM_INTR_STS, PKT_CMD_DONE)) {
> > +            pstrcat(buf, BUF_SIZE, "pktdone|");
> > +        }
> > +
> > +        if (SHARED_ARRAY_FIELD_EX32(bus->regs, reg_intr_sts, TX_NAK)) {
> > +            pstrcat(buf, BUF_SIZE, "nak|");
> > +        }
> > +
> > +        if (SHARED_ARRAY_FIELD_EX32(bus->regs, reg_intr_sts, TX_ACK)) {
> > +            pstrcat(buf, BUF_SIZE, "ack|");
> > +        }
> > +
> > +        if (SHARED_ARRAY_FIELD_EX32(bus->regs, reg_intr_sts, RX_DONE))=
 {
> > +            pstrcat(buf, BUF_SIZE, "done|");
> > +        }
> > +
> > +        if (SHARED_ARRAY_FIELD_EX32(bus->regs, reg_intr_sts, NORMAL_ST=
OP)) {
> > +            pstrcat(buf, BUF_SIZE, "normal|");
> > +        }
> > +
> > +        if (SHARED_ARRAY_FIELD_EX32(bus->regs, reg_intr_sts, ABNORMAL)=
) {
> > +            pstrcat(buf, BUF_SIZE, "abnormal|");
> > +        }
> > +
> > +        trace_aspeed_i2c_bus_raise_interrupt(bus->regs[reg_intr_sts], =
buf);
> > +    }
> > +
>=20
> How about :
>=20
>     if (trace_event_get_state_backends(TRACE_ASPEED_I2C_BUS_RAISE_INTERRU=
PT)) {
>         g_autofree char *buf =3D g_strdup_printf("%s%s%s%s%s%s",
>                aspeed_i2c_bus_pkt_mode_en(bus) &&
>                ARRAY_FIELD_EX32(bus->regs, I2CM_INTR_STS, PKT_CMD_DONE) ?=
 "pktdone|" : "",
>                SHARED_ARRAY_FIELD_EX32(bus->regs, reg_intr_sts, TX_NAK)? =
"nak|" : "",
>                SHARED_ARRAY_FIELD_EX32(bus->regs, reg_intr_sts, TX_ACK), =
"ack|" : "",
>                SHARED_ARRAY_FIELD_EX32(bus->regs, reg_intr_sts, RX_DONE) =
? "done|" : "",
>                SHARED_ARRAY_FIELD_EX32(bus->regs, reg_intr_sts, NORMAL_ST=
OP)? "normal|" : "",
> 	       SHARED_ARRAY_FIELD_EX32(bus->regs, reg_intr_sts, ABNORMAL) ? "abn=
ormal"  : "");
> =09
> 	       trace_aspeed_i2c_bus_raise_interrupt(bus->regs[reg_intr_sts], buf=
);
>     }
>=20
>=20

Uhm, yeah - that's way better :)

--S1ExMK7wXXeN9P6x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmKYXjIACgkQTeGvMW1P
DenEqAf/bHWzIsHvNaXg7dEg6QaNDl402h/DqRq8k/Hw4WnxpHZZiCrezGp9BbWP
wEFqHSvu/sibBV7kVjfIT7FFAUdDc9L8FhVEuMELPIAJoN3LuY0JwjULMmGgDPvo
ch9+jaiuHzPbHXNFWGlhGpxxCnD+9hY17i0ujSOPsF0Ln5fYyR+w49GGcsOnyWqv
ASg8tTfyGeEJaX59ngs2L/UIYr7V+R5KjdjIMXSPKR83TxWC7oNG0NfiY6otBywI
6+10PXiwVudS4hMT9V4wMSoory3K1PCEmVAL2aNKg/s+lSXPfQpf2UxZZSMpHma2
utrfJkiu5p7XxiDDainmXemdOlWMBg==
=dnZU
-----END PGP SIGNATURE-----

--S1ExMK7wXXeN9P6x--

