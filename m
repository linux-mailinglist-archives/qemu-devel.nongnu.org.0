Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D80C62ED88
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Nov 2022 07:17:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovufR-000756-11; Fri, 18 Nov 2022 01:16:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jk@codeconstruct.com.au>)
 id 1ovufN-00073J-V8; Fri, 18 Nov 2022 01:15:57 -0500
Received: from pi.codeconstruct.com.au ([203.29.241.158]
 helo=codeconstruct.com.au)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jk@codeconstruct.com.au>)
 id 1ovufK-0003nY-Qz; Fri, 18 Nov 2022 01:15:57 -0500
Received: from pecola.lan (unknown [159.196.93.152])
 by mail.codeconstruct.com.au (Postfix) with ESMTPSA id D65D620032;
 Fri, 18 Nov 2022 14:15:43 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=codeconstruct.com.au; s=2022a; t=1668752145;
 bh=AoeLfpwjhGucJ0mk+CgAZN3heDtSf281OPv5BqgGRoI=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References;
 b=Dy0sGL5MYnGFKOdD/CHvfM1MDU0Phbtaer7539InMUKsYRlrpKMa7cbhiHfIJvh9y
 savfv+j7PrIgjZiEbB868+IAPOijcqpmPukWDHOcjfWxB3fAsFzU8OCVXrwgaSz+Hk
 TM8e3LatxetsFVQ/vBoU7CzTTGDOXyN6z2ic+/lmdR+5TnAm6FPoQ5pF64cd3omnvS
 +POkKBI97xTzoZhVU8UqwUT125IEdBkxhoUi9NRSh8a4f1uDG2ixGnqn2tQSxw1+cV
 qoMI+A8yYulq44HEeXSAl4lfVO8eoKW/rIGmiPwcoiDiA257k2V7P7AwH1+l50HDM3
 t66E3GsBZPfdw==
Message-ID: <be1a8590ee2f06d159987c45f85b4552695f8ed1.camel@codeconstruct.com.au>
Subject: Re: [PATCH RFC 2/3] hw/i2c: add mctp core
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: Klaus Jensen <its@irrelevant.dk>, qemu-devel@nongnu.org
Cc: Andrew Jeffery <andrew@aj.id.au>, Keith Busch <kbusch@kernel.org>, Corey
 Minyard <cminyard@mvista.com>, Peter Delevoryas <peter@pjd.dev>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, Joel Stanley <joel@jms.id.au>, 
 =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, Klaus Jensen
 <k.jensen@samsung.com>, Matt Johnston <matt@codeconstruct.com.au>
Date: Fri, 18 Nov 2022 14:15:43 +0800
In-Reply-To: <d8a8549c6fc29650131046ee00b7968ebedf886b.camel@codeconstruct.com.au>
References: <20221116084312.35808-1-its@irrelevant.dk>
 <20221116084312.35808-3-its@irrelevant.dk>
 <d8a8549c6fc29650131046ee00b7968ebedf886b.camel@codeconstruct.com.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-1 
MIME-Version: 1.0
Received-SPF: pass client-ip=203.29.241.158;
 envelope-from=jk@codeconstruct.com.au; helo=codeconstruct.com.au
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
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

Hi Klaus,

> With those changes, I can get control protocol going, and multi-
> packet messages work.

Ah, I also needed a change to the aspeed I2C driver, as I'm seeing
the interrupt handler being invoked with both a stop and a start event
pending.

Patch below; if this seems sensible I will propose upstream.

Cheers,


Jeremy

---
From 6331cf2499c182606979029d2aaed93ee3e544fa Mon Sep 17 00:00:00 2001
From: Jeremy Kerr <jk@codeconstruct.com.au>
Date: Fri, 18 Nov 2022 14:04:50 +0800
Subject: [PATCH] i2c: aspeed: Allow combined STOP & START irqs

Currently, if we enter our interrupt handler with both a stop and start
condition pending, the stop event handler will override the current
state, so we'll then lose the start condition.

This change handles the stop condition before anything else, which means
we can then restart the state machine on any pending start state.

Because of this, we no longer need the ASPEED_I2C_SLAVE_STOP state,
because we're just reverting directly to INACTIVE.

I have only seen this condition on emulation; it may be impossible to
hit on real HW.

Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>
---
 drivers/i2c/busses/i2c-aspeed.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspee=
d.c
index 185dedfebbac..45f2766b2b66 100644
--- a/drivers/i2c/busses/i2c-aspeed.c
+++ b/drivers/i2c/busses/i2c-aspeed.c
@@ -135,7 +135,6 @@ enum aspeed_i2c_slave_state {
 	ASPEED_I2C_SLAVE_READ_PROCESSED,
 	ASPEED_I2C_SLAVE_WRITE_REQUESTED,
 	ASPEED_I2C_SLAVE_WRITE_RECEIVED,
-	ASPEED_I2C_SLAVE_STOP,
 };
=20
 struct aspeed_i2c_bus {
@@ -250,6 +249,14 @@ static u32 aspeed_i2c_slave_irq(struct aspeed_i2c_bus =
*bus, u32 irq_status)
=20
 	command =3D readl(bus->base + ASPEED_I2C_CMD_REG);
=20
+	/* handle a stop before starting any new events */
+	if (bus->slave_state !=3D ASPEED_I2C_SLAVE_INACTIVE &&
+	    irq_status & ASPEED_I2CD_INTR_NORMAL_STOP) {
+		irq_handled |=3D ASPEED_I2CD_INTR_NORMAL_STOP;
+		i2c_slave_event(slave, I2C_SLAVE_STOP, &value);
+		bus->slave_state =3D ASPEED_I2C_SLAVE_INACTIVE;
+	}
+
 	/* Slave was requested, restart state machine. */
 	if (irq_status & ASPEED_I2CD_INTR_SLAVE_MATCH) {
 		irq_handled |=3D ASPEED_I2CD_INTR_SLAVE_MATCH;
@@ -278,15 +285,11 @@ static u32 aspeed_i2c_slave_irq(struct aspeed_i2c_bus=
 *bus, u32 irq_status)
 		irq_handled |=3D ASPEED_I2CD_INTR_RX_DONE;
 	}
=20
-	/* Slave was asked to stop. */
-	if (irq_status & ASPEED_I2CD_INTR_NORMAL_STOP) {
-		irq_handled |=3D ASPEED_I2CD_INTR_NORMAL_STOP;
-		bus->slave_state =3D ASPEED_I2C_SLAVE_STOP;
-	}
 	if (irq_status & ASPEED_I2CD_INTR_TX_NAK &&
 	    bus->slave_state =3D=3D ASPEED_I2C_SLAVE_READ_PROCESSED) {
 		irq_handled |=3D ASPEED_I2CD_INTR_TX_NAK;
-		bus->slave_state =3D ASPEED_I2C_SLAVE_STOP;
+		i2c_slave_event(slave, I2C_SLAVE_STOP, &value);
+		bus->slave_state =3D ASPEED_I2C_SLAVE_INACTIVE;
 	}
=20
 	switch (bus->slave_state) {
@@ -316,13 +319,11 @@ static u32 aspeed_i2c_slave_irq(struct aspeed_i2c_bus=
 *bus, u32 irq_status)
 	case ASPEED_I2C_SLAVE_WRITE_RECEIVED:
 		i2c_slave_event(slave, I2C_SLAVE_WRITE_RECEIVED, &value);
 		break;
-	case ASPEED_I2C_SLAVE_STOP:
-		i2c_slave_event(slave, I2C_SLAVE_STOP, &value);
-		bus->slave_state =3D ASPEED_I2C_SLAVE_INACTIVE;
-		break;
 	case ASPEED_I2C_SLAVE_START:
 		/* Slave was just started. Waiting for the next event. */;
 		break;
+	case ASPEED_I2C_SLAVE_INACTIVE:
+		break;
 	default:
 		dev_err(bus->dev, "unknown slave_state: %d\n",
 			bus->slave_state);
--=20
2.35.1


