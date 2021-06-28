Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ABAE3B5858
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 06:35:33 +0200 (CEST)
Received: from localhost ([::1]:52276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxizc-0001Zn-44
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 00:35:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@aj.id.au>)
 id 1lxixP-0008LT-Nj; Mon, 28 Jun 2021 00:33:17 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:46499)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@aj.id.au>)
 id 1lxixM-0004Iu-9O; Mon, 28 Jun 2021 00:33:15 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id AA3F33200645;
 Mon, 28 Jun 2021 00:33:07 -0400 (EDT)
Received: from imap43 ([10.202.2.93])
 by compute2.internal (MEProxy); Mon, 28 Jun 2021 00:33:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=vRXBHPbfYTlmgvRozwLM16bg6nHo6wz
 51TXIjdwDpNU=; b=GoNfAeRhwv6I1+O/+R+/Oc6YtBCZ3KIIkIG/MGXHOkGPlnO
 1w8VZWjtl18sDyDvGc0tyEJFgFd/e842/JFK3uPL+YXF6uSlAbTigxIOTREqTp8V
 jKyhgoI6KeS31cGd9EUkVkGT0PkXlRxMfIa5nQSSsOPb0qSj4gUvVwCJh7TMM8K9
 5g29mda4e9h+fKt8mV43jUF77/6e9pJI8RQKwlg/G7O/IBCT44VaymAVpcDSVXZz
 fW3t66jKm82FjTKbTipY0YFz8MRK5WiTFRYviAVCYxzoA0LhLHv5sUWIfW7pIzwv
 CFgVqaawOFsZOtTQuv0bEeimfr+vmT0Ot1YAeGQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=vRXBHP
 bfYTlmgvRozwLM16bg6nHo6wz51TXIjdwDpNU=; b=KbA6U6tPA/ngEFFqUiPeFE
 tV065M26LtTxnOYNAridJJS5bZE0YkYEjlx0U912iAoOS4mdhqbsOWj3PYv4swFR
 6QrDjwv0ev5D/oX4mt1+82Qs1dKFSrnoPykSPksTUjD6ftQA9vkyn8WU7sWoyF1I
 X+xDZExQEduVx9/TwfHiRsPeQDy0mpJSwWmR7HoOGy3M2B3KblajUX4jeQbKCe21
 X8bIMcrgmsnaq5NxwgarrMp93l+aPUH2xCg010s2xsIbQqcrr3P9s+b5iZcrBKwt
 Z/pE/xJtdkIQA5dB26pU89LrqT2kjGegiJyY3ZmNztYaQtt8olMupfa/MAYobbMw
 ==
X-ME-Sender: <xms:AlHZYLadWk9ZbvdHgWgmDE97XVQqqyyWuJwKukaamK-thw9qqw0KTA>
 <xme:AlHZYKbGBLOXIFxQWKvk5Ue7A8NGPWh7l3pDMTYq0wPIM4lb-uLXYA3xPQaZ7sxR9
 t38auUZJvyPP0bhfg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeehfedgkedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhephefhfeekgfekudevheffheeihedujeefjeevjeefudfgfeeutdeuvdeh
 hfevueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:AlHZYN8Q6o_JEAc15TKfAZoiRDLfPnExXhjAidieCIZNNL1O0m4T8A>
 <xmx:AlHZYBr1SMYH9umrtJdibXs84Rsf0ZDVwiN3oBnJMRM5Ex2UPGIjOw>
 <xmx:AlHZYGp8gbXQhnuNZmh8l_PTTFDp7c5Y3Ms5Dr8QYpYF9r_yWKJ6Zg>
 <xmx:A1HZYJVxBeAPkPlk8qvxaksrMdpIxi0HzNefG0UUBr6fEJhSMlj8NA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id B9DA6AC0073; Mon, 28 Jun 2021 00:33:06 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-530-gd0c265785f-fm-20210616.002-gd0c26578
Mime-Version: 1.0
Message-Id: <aea5f8fe-438b-4c11-96c4-21c7e361778d@www.fastmail.com>
In-Reply-To: <20210625050643.161042-1-joel@jms.id.au>
References: <20210625050643.161042-1-joel@jms.id.au>
Date: Mon, 28 Jun 2021 14:02:45 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joel Stanley" <joel@jms.id.au>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 "Peter Maydell" <peter.maydell@linaro.org>
Subject: Re: [PATCH] arm/aspeed: rainier: Add i2c eeproms and muxes
Content-Type: text/plain
Received-SPF: pass client-ip=64.147.123.21; envelope-from=andrew@aj.id.au;
 helo=wout5-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Patrick Venture <venture@google.com>, qemu-arm@nongnu.org,
 Cameron Esfahani via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On Fri, 25 Jun 2021, at 14:36, Joel Stanley wrote:
> These are the devices documented by the Rainier device tree. With this
> we can see the guest discovering the multiplexers and probing the eeprom
> devices:
> 
>  i2c i2c-2: Added multiplexed i2c bus 16
>  i2c i2c-2: Added multiplexed i2c bus 17
>  i2c i2c-2: Added multiplexed i2c bus 18
>  i2c i2c-2: Added multiplexed i2c bus 19
>  i2c-mux-gpio i2cmux: 4 port mux on 1e78a180.i2c-bus adapter
>  at24 20-0050: 8192 byte 24c64 EEPROM, writable, 1 bytes/write
>  i2c i2c-4: Added multiplexed i2c bus 20
>  at24 21-0051: 8192 byte 24c64 EEPROM, writable, 1 bytes/write
>  i2c i2c-4: Added multiplexed i2c bus 21
>  at24 22-0052: 8192 byte 24c64 EEPROM, writable, 1 bytes/write
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  hw/arm/aspeed.c | 56 +++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 56 insertions(+)
> 
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index 1301e8fdffb2..7ed22294c6eb 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -677,6 +677,10 @@ static void g220a_bmc_i2c_init(AspeedMachineState *bmc)
>  static void rainier_bmc_i2c_init(AspeedMachineState *bmc)
>  {
>      AspeedSoCState *soc = &bmc->soc;
> +    I2CSlave *i2c_mux;
> +
> +    smbus_eeprom_init_one(aspeed_i2c_get_bus(&soc->i2c, 0), 0x51,
> +                          g_malloc0(32 * 1024));
>  
>      /* The rainier expects a TMP275 but a TMP105 is compatible */
>      i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 4), TYPE_TMP105,
> @@ -685,11 +689,25 @@ static void rainier_bmc_i2c_init(AspeedMachineState *bmc)
>                       0x49);
>      i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 4), TYPE_TMP105,
>                       0x4a);
> +    i2c_mux = i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 4),
> +                                      "pca9546", 0x70);
> +    smbus_eeprom_init_one(pca954x_i2c_get_bus(i2c_mux, 0), 0x50,
> +                          g_malloc0(64 * 1024));

The EEPROMs described in the Rainier devicetree are Atmel AT2x devices and
not SMBus EEPROMs. The SMBus EEPROM model uses SMBus block reads and 
writes which are not what the AT2x driver issues. If you try to read or 
write data under Linux from the EEPROMs in this patch you just get 
corrupt results. So as far as I can see the patch needs to be reworked.

Andrew

