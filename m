Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0841570208
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 14:29:31 +0200 (CEST)
Received: from localhost ([::1]:52054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oAsXa-000052-SP
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 08:29:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@aj.id.au>)
 id 1oAsUf-0004is-QP; Mon, 11 Jul 2022 08:26:30 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:54081)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@aj.id.au>)
 id 1oAsUd-0001sT-Up; Mon, 11 Jul 2022 08:26:29 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 010C95C0094;
 Mon, 11 Jul 2022 08:26:24 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
 by compute3.internal (MEProxy); Mon, 11 Jul 2022 08:26:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1657542383; x=1657628783; bh=Vi4vr9+Iaq
 snwt0/FE4RWix28SqDR8s2ycbcSmiry1U=; b=LFJmge2uvDDrO+4hbPfPL0HN9b
 n9Q01U/92wjVO+Th1tdmRZe/c5mKwzdAo/V6jpV0da/DRIZIBldAgOn+oJycyDaw
 hl8rPguU1At5lPqMbFcI/9REyRKBfobdPY/JFleD+nvYjXXYNMtau/Sr0OvwXiCc
 MDz+in7BmfXPimhQdVF4sLdPmx+q8n4QL7Kf7BGEpHbpAXBezJZa9nUyAvKk5aTg
 TLgAXGdFGwmHhN59ISz/ORz4vQcEPHZAeHNx3ZTTdVO84aCxGrUvDNYRX3w5pFd6
 rX04/9C+coS7UZKmqUp37KG04hdY7CWclZJ6jtOdO/tPzt0L+H7ui/fmBKtA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1657542383; x=1657628783; bh=Vi4vr9+Iaqsnwt0/FE4RWix28SqD
 R8s2ycbcSmiry1U=; b=GByfh8qoXktQY1NKAzeVLhdEpWNprnRafhU++FXa56w3
 8FdVMgz9bMo7ScQdQBOqtqRPngqFkY36fTVbeWdBrs6cEKYgXQSHQeNWEhmqm7se
 5JtX492AcGXXDFoNZpprXLrHqcY2UtC39lRyjyKwjjrLPW7jWM1sxAmK3sp1BS6Q
 sTONhWIlzfRJa3AMx48TVEswIUqtXdKzYrMWvfETuIHt0W86aW67P/L+myS8zVO+
 F40hlAUgqMrP4h6qzS8AJrsfQmE8MThNe8TRkll0VnuvWql3+E65mvQZUYT/+e8j
 KpQ20JRcFoQ/Hp383LbMiMfFnq2CYu7AL8qLLqiUiw==
X-ME-Sender: <xms:7xbMYmc8FLPLW65-mxWarB-qcxJpYuHTPnzH0D8c20VcgO0b9mLTsg>
 <xme:7xbMYgNezLaa1fm8urXMwx144pZCO7Sf3XQ3c8c9qAJTFfNhs-8oFJJSccEMKMZQs
 W9vUjM6LMFN0H-9Ig>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejfedggeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehn
 ughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtf
 frrghtthgvrhhnpeekvdekjeekgfejudffteetgeejkeetteduvedtffdtledutdfhheev
 feetkeeiteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:7xbMYngRn61VDknnfb6Av79lgeJLLgLrxDObqNcXbGd5Px8e-0OIhQ>
 <xmx:7xbMYj-s70UcZY-mf91miRAUOs3FOrNe5WYcMfKuOEyDHE3xVc-WaQ>
 <xmx:7xbMYiu1JMQOaMkR9NTfv6xqB-2SVBbU5M_lwGYqPdCyvIbsfuMXWA>
 <xmx:7xbMYmL6jDgK6HURkXsleWjg5rKSn5fo0inD9JaKbXad7QCXnI3tvg>
Feedback-ID: idfb84289:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id A7980170007E; Mon, 11 Jul 2022 08:26:23 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-720-gbf5afa95ff-fm-20220708.001-gbf5afa95
Mime-Version: 1.0
Message-Id: <db1ffbd9-a827-4fba-8e4f-83522634f20b@www.fastmail.com>
In-Reply-To: <CACPK8Xe-BXFt7oefdO-QS67tQSRP6arzgnGO973MYDYOMrQK4w@mail.gmail.com>
References: <20220707071731.34047-1-peter@pjd.dev>
 <20220707071731.34047-2-peter@pjd.dev>
 <CACPK8Xe-BXFt7oefdO-QS67tQSRP6arzgnGO973MYDYOMrQK4w@mail.gmail.com>
Date: Mon, 11 Jul 2022 21:55:55 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joel Stanley" <joel@jms.id.au>, "Peter Delevoryas" <peter@pjd.dev>
Cc: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 "Peter Maydell" <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9_via?= <qemu-arm@nongnu.org>,
 "Cameron Esfahani via" <qemu-devel@nongnu.org>
Subject: Re: [PATCH 1/2] hw/gpio/aspeed: Don't let guests modify input pins
Content-Type: text/plain
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



On Thu, 7 Jul 2022, at 17:50, Joel Stanley wrote:
> On Thu, 7 Jul 2022 at 07:17, Peter Delevoryas <peter@pjd.dev> wrote:
>>
>> It seems that aspeed_gpio_update is allowing the value for input pins to be
>> modified through register writes and QOM property modification.
>>
>> The QOM property modification is fine, but modifying the value through
>> register writes from the guest OS seems wrong if the pin's direction is set
>> to input.
>>
>> The datasheet specifies that "0" bits in the direction register select input
>> mode, and "1" selects output mode.
>>
>> OpenBMC userspace code is accidentally writing 0's to the GPIO data
>> registers somewhere (or perhaps the driver is doing it through a reset or
>> something), and this is overwriting GPIO FRU information (board ID, slot
>> presence pins) that is initialized in Aspeed machine reset code (see
>> fby35_reset() in hw/arm/aspeed.c).
>>
>> Signed-off-by: Peter Delevoryas <peter@pjd.dev>
>> Fixes: 4b7f956862dc ("hw/gpio: Add basic Aspeed GPIO model for AST2400 and AST2500")
>> ---
>>  hw/gpio/aspeed_gpio.c | 22 ++++++++++++----------
>>  1 file changed, 12 insertions(+), 10 deletions(-)
>>
>> diff --git a/hw/gpio/aspeed_gpio.c b/hw/gpio/aspeed_gpio.c
>> index a62a673857..2eae427201 100644
>> --- a/hw/gpio/aspeed_gpio.c
>> +++ b/hw/gpio/aspeed_gpio.c
>> @@ -268,7 +268,7 @@ static ptrdiff_t aspeed_gpio_set_idx(AspeedGPIOState *s, GPIOSets *regs)
>>  }
>>
>>  static void aspeed_gpio_update(AspeedGPIOState *s, GPIOSets *regs,
>> -                               uint32_t value)
>> +                               uint32_t value, bool force)
>>  {
>>      uint32_t input_mask = regs->input_mask;
>>      uint32_t direction = regs->direction;
>> @@ -293,10 +293,12 @@ static void aspeed_gpio_update(AspeedGPIOState *s, GPIOSets *regs,
>>              }
>>
>
> Reading this model hurts my head a little. Perhaps we also need to add
> a test for this case to make it clear what's going on.
>
> The test above the code you've changed does this:
>
>>            /* ...and we're output or not input-masked... */
>>            if (!(direction & mask) && (input_mask & mask)) {
>>                continue;
>>            }
>
> For clarity, !(direction & mask) means "is input".
>
> The comment confuses me because it says "or", but the code has "and".

The comment documents what conditions we need before we actually go and set the
output value.

The test is whether we fail to meet those conditions.

If the condition evaluates true we don't want to modify the GPIO value, so we
`continue` to the next loop iteration to test the next GPIO.

>
> input_mask doesn't seem to feature in the Linux driver, so that will
> always be zero. The test will be X && 0, which is always 0.
>
> If you changed it to || then we would do the test that the comment
> suggests. When the pin is input, we will skip updating the value.

The condition shouldn't change, rather if the comment makes things more
confusing rather than less, we should change that instead.

Andrew

