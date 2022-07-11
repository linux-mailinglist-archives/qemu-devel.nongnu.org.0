Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E8CC57044D
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 15:29:15 +0200 (CEST)
Received: from localhost ([::1]:37174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oAtTO-0001pA-Hi
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 09:29:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@aj.id.au>) id 1oAtQm-0006fj-Ja
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 09:26:36 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:48897)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@aj.id.au>) id 1oAtQk-00069m-Fu
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 09:26:32 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id BFB495C007A
 for <qemu-devel@nongnu.org>; Mon, 11 Jul 2022 09:26:29 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
 by compute3.internal (MEProxy); Mon, 11 Jul 2022 09:26:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1657545989; x=
 1657632389; bh=X90ww6VZsHoxiVANxT61tSrdZeuJV4RsEu//xgO1RPk=; b=h
 fZ5+A3l0I5Eeb/aidFZMzIEOWZ+rj3T/tob2sdJPKctz1qfIfx+Iv4LprkVn6qi8
 6WZh0MF3n0u+DZk10I7ZNFX2K8lpf+DcgZnHrz1Ex9w2GY0HRPXxHkNA5fXh46yG
 pcps5Gd31KlAAfJhYUnRf5iTp/hb06Rc6wMOeFhVI6FhldIF2Qof7HsMSEpS1m+k
 KssQcfk/QTKcyo8Ga1WGMXIipCyAIKBU9qiYv2hJDextFRH/GSovM7qAufTNicx8
 r6WtcSTtW6hTJSO6IFGhOsmaoi94MM7jaOcvQ6IwKj6SPCecYlUAiI3sikLg2MG1
 BBa4yDppfmi/O3RyKJuYQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:date:feedback-id:feedback-id:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; t=1657545989; x=1657632389; bh=X
 90ww6VZsHoxiVANxT61tSrdZeuJV4RsEu//xgO1RPk=; b=sE7DMa6Ksgu0VQUda
 pAGmU+BPDYUmXPS7NwPnruVuVLVYUsjZYkg7h3EaEKdh/xtDKGkbDucvf7FUT/yf
 KyMUlqNJ7B6KJ0mnAoM0y16BzYMRuWRbksIQNMxLt2o2ZC3eqfIisrmo+8vZk4/x
 P1NnNqOb0pZyuYdtjThpoqT5on93neUYGL5QRAr5nlEWdhna1GY0zuOYeybEyhix
 Gd9e78+fysXvGqeG2hn5MLZPlPgM6/n+NAmyYbuTkwlO2xaACx6hLH+tICVnCciy
 J+vDKRCJN5lcAp+Qi9yPjA96oo52rs5GciPfOumQj1udhEDsNW46VL+KnUibSpEq
 CST0w==
X-ME-Sender: <xms:BSXMYhKTNX2MBbMC_Vb41VCwZRaSsQRRAFAplFvVhhgEEJB87-BJsA>
 <xme:BSXMYtLmf-qADfWdkqR5iPBPgvh-wvuXBRtT5E28wRveX_BqCE3KYTXtt7cX73LyO
 01X-LiVJZ77oO1pUA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejfedgiedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfgjfhffhffvufgtgfesth
 hqredtreerjeenucfhrhhomhepfdetnhgurhgvficulfgvfhhfvghrhidfuceorghnughr
 vgifsegrjhdrihgurdgruheqnecuggftrfgrthhtvghrnhepvdegkeehgeefvdfhteehhf
 duteetgeeugefgieeigeeuheekudegtdekgfelgfehnecuvehluhhsthgvrhfuihiivgep
 tdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:BSXMYptLzp7Xz9tN669pOtjhOL7dp7H0PEo2-X1I0I_QBUto8wo66g>
 <xmx:BSXMYibfilc_WN4hoN6aKQbIVozfapxO1sbHs_SrFR7om4kqTTM8pw>
 <xmx:BSXMYobr6PGHM6fQvdwCTBfpnpm88h3ezICn4rws2VQUJU8Qd2RSsg>
 <xmx:BSXMYhmOKmZUAduOY8URWKgsxT8O-SYeI-AXcYZc1-1pF0z8kOocRg>
Feedback-ID: idfb84289:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 7BEA61700077; Mon, 11 Jul 2022 09:26:29 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-720-gbf5afa95ff-fm-20220708.001-gbf5afa95
Mime-Version: 1.0
Message-Id: <23523aa1-ba81-412b-92cc-8174faba3612@www.fastmail.com>
In-Reply-To: <YscuKtVuZojYtqXo@pdel-mbp.dhcp.thefacebook.com>
References: <20220707071731.34047-1-peter@pjd.dev>
 <20220707071731.34047-2-peter@pjd.dev>
 <fa52743a-5730-3b3f-f07f-99931bb66b01@kaod.org> <YscdtXYL5sJRSm6Z@pdel-mbp>
 <YscuKtVuZojYtqXo@pdel-mbp.dhcp.thefacebook.com>
Date: Mon, 11 Jul 2022 22:56:08 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Cameron Esfahani via" <qemu-devel@nongnu.org>
Subject: Re: [PATCH 1/2] hw/gpio/aspeed: Don't let guests modify input pins
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=66.111.4.26; envelope-from=andrew@aj.id.au;
 helo=out2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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



On Fri, 8 Jul 2022, at 04:34, Peter Delevoryas wrote:
> On Thu, Jul 07, 2022 at 10:53:57AM -0700, Peter Delevoryas wrote:
>> On Thu, Jul 07, 2022 at 10:56:02AM +0200, C=C3=A9dric Le Goater wrote:
>> > On 7/7/22 09:17, Peter Delevoryas wrote:
>> > > It seems that aspeed_gpio_update is allowing the value for input =
pins to be
>> > > modified through register writes and QOM property modification.
>> > >=20
>> > > The QOM property modification is fine, but modifying the value th=
rough
>> > > register writes from the guest OS seems wrong if the pin's direct=
ion is set
>> > > to input.
>> > >=20
>> > > The datasheet specifies that "0" bits in the direction register s=
elect input
>> > > mode, and "1" selects output mode.
>> > >=20
>> > > OpenBMC userspace code is accidentally writing 0's to the GPIO da=
ta
>> > > registers somewhere (or perhaps the driver is doing it through a =
reset or
>> > > something), and this is overwriting GPIO FRU information (board I=
D, slot
>> > > presence pins) that is initialized in Aspeed machine reset code (=
see
>> > > fby35_reset() in hw/arm/aspeed.c).
>> >=20
>> > It might be good to log a GUEST_ERROR in that case, when writing to=
 an
>> > input GPIO and when reading from an output GPIO.
>>=20
>> Good idea, I'll include a GUEST_ERROR for writing to an input GPIO.
>>=20
>> I'm actually not totally certain about emitting an error when reading=
 from an
>> output GPIO, because the driver can only do 8-bit reads at the finest
>> granularity, and if 1 of the 8 pins' direction is output, then it wil=
l be
>> reading the value of an output pin. But, that's not really bad, becau=
se
>> presumably the value will be ignored. Maybe I can go test this out on
>> hardware and figure out what happens though.
>
> Did a small experiment, I was looking at some of the most significant
> bits:
>
> root@dhcp-100-96-192-133:~# devmem 0x1e780000
> 0x3CFF303E
> root@dhcp-100-96-192-133:~# devmem 0x1e780004
> 0x2800000C
> root@dhcp-100-96-192-133:~# devmem 0x1e780000 32 0xffffffff
> root@dhcp-100-96-192-133:~# devmem 0x1e780004
> 0x2800000C
> root@dhcp-100-96-192-133:~# devmem 0x1e780000
> 0x3CFF303E
> root@dhcp-100-96-192-133:~# devmem 0x1e780000
> 0x3CFF303E
> root@dhcp-100-96-192-133:~# devmem 0x1e780000 32 0
> root@dhcp-100-96-192-133:~# devmem 0x1e780000
> 0x14FF303A
>
> Seems like the output pin 0x20000000 was initially high, and the input
> pin right next to it 0x10000000 was also high. After writing 0 to the
> data register, the value in the data register changed for the output
> pin, but not the input pin.  Which matches what we're planning on doing
> in the controller.
>
> So yeah, I'll add GUEST_ERROR for writes to input pins but not output
> pins.  The driver should probably be doing a read-modify-update.
> Although...if it's not, that technically wouldn't matter, behavior
> wise...maybe GUEST_ERROR isn't appropriate for writes to input pins
> either, for the same reason as I mentioned with reads of output pins.
> I'll let you guys comment on what you think we should do.
>

With the quick hack below I think I got sensible behaviour?

```
# devmem 0x1e780000
0x00000000
# devmem 0x1e780004
0x00000000
# devmem 0x1e780004 32 1
# devmem 0x1e780000 32 1
# devmem 0x1e780000
0x00000001
# devmem 0x1e780000 32 3
# devmem 0x1e780000
0x00000001
# QEMU 7.0.0 monitor - type 'help' for more information
(qemu) qom-set gpio gpioA1 on
(qemu)=20

# devmem 0x1e780000
0x00000003
# (qemu) qom-set gpio gpioA1 off
(qemu)=20

# devmem 0x1e780000
0x00000001
# (qemu) qom-set gpio gpioA0 off
(qemu)=20
# devmem 0x1e780000
0x00000001
#=20
```

That was with the patch below. However, I think there's a deeper issue=20
with the input masking that needs to be addressed. Essentially we lack=20
modelling for the actual line state, we were proxying that with=20
register state. As it stands if we input-mask a line and use qom-set to=20
change its state the state update will go missing. However, as Joel=20
notes, I don't think we have anything configuring input masking.

diff --git a/hw/gpio/aspeed_gpio.c b/hw/gpio/aspeed_gpio.c
index c63634d3d3e2..a1aa6504a8d8 100644
--- a/hw/gpio/aspeed_gpio.c
+++ b/hw/gpio/aspeed_gpio.c
@@ -244,7 +244,7 @@ static ptrdiff_t aspeed_gpio_set_idx(AspeedGPIOState=
 *s, GPIOSets *regs)
 }
=20
 static void aspeed_gpio_update(AspeedGPIOState *s, GPIOSets *regs,
-                               uint32_t value)
+                               uint32_t value, uint32_t mode_mask)
 {
     uint32_t input_mask =3D regs->input_mask;
     uint32_t direction =3D regs->direction;
@@ -253,7 +253,8 @@ static void aspeed_gpio_update(AspeedGPIOState *s, G=
PIOSets *regs,
     uint32_t diff;
     int gpio;
=20
-    diff =3D old ^ new;
+    diff =3D (old ^ new);
+    diff &=3D mode_mask;
     if (diff) {
         for (gpio =3D 0; gpio < ASPEED_GPIOS_PER_SET; gpio++) {
             uint32_t mask =3D 1 << gpio;
@@ -315,7 +316,7 @@ static void aspeed_gpio_set_pin_level(AspeedGPIOStat=
e *s, uint32_t set_idx,
         value &=3D !pin_mask;
     }
=20
-    aspeed_gpio_update(s, &s->sets[set_idx], value);
+    aspeed_gpio_update(s, &s->sets[set_idx], value, ~s->sets[set_idx].d=
irection);
 }
=20
 /*
@@ -607,7 +608,7 @@ static void aspeed_gpio_write(void *opaque, hwaddr o=
ffset, uint64_t data,
         data &=3D props->output;
         data =3D update_value_control_source(set, set->data_value, data=
);
         set->data_read =3D data;
-        aspeed_gpio_update(s, set, data);
+        aspeed_gpio_update(s, set, data, set->direction);
         return;
     case gpio_reg_direction:
         /*
@@ -683,7 +684,7 @@ static void aspeed_gpio_write(void *opaque, hwaddr o=
ffset, uint64_t data,
                       HWADDR_PRIx"\n", __func__, offset);
         return;
     }
-    aspeed_gpio_update(s, set, set->data_value);
+    aspeed_gpio_update(s, set, set->data_value, UINT32_MAX);
     return;
 }
=20

