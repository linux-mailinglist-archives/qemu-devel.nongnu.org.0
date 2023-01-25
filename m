Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFF0767BA71
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Jan 2023 20:14:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKlCa-0007nn-GI; Wed, 25 Jan 2023 14:12:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1pKlCY-0007nX-WE; Wed, 25 Jan 2023 14:12:55 -0500
Received: from wout1-smtp.messagingengine.com ([64.147.123.24])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1pKlCX-0005N2-2a; Wed, 25 Jan 2023 14:12:54 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id B86B0320091B;
 Wed, 25 Jan 2023 14:12:48 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 25 Jan 2023 14:12:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm1; t=1674673968; x=1674760368; bh=m9C45R8EbV
 QNfBcbp2lSbRIBq4bQIlGDLwQrbSVTA6A=; b=q4Om+qnUSiI5xSbgyQwcr4yLXK
 m3KE4QzYL2Tam0+I5HYZMssZXAxc/hhkfY6V9u25JVXFpWgb+Zphq1Uen6eOB6Mf
 CGL00Ym0zebq8BA6v0eqs7Boktakaozv/RMk7rLtTGgU6RKRTM1TGLpON1T1MycB
 TU/ELzXYyKdWFb2bX9vVnanTZh6yMwq6mHIaq8m2NqNIpLGYAE8/NEXlHY3/8AD8
 G4iu6rIWv1oAxP/n8ZtR11tMonacLZSwrf+vcLSX9ci9KatFZi12Bi2Z+tdqrGJI
 InTIOds6fox4c+Ym6XNxhav2Delt6pwo4TNPQtQzVvn+9qxqpcUO0GBweFLg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1674673968; x=1674760368; bh=m9C45R8EbVQNfBcbp2lSbRIBq4bQ
 IlGDLwQrbSVTA6A=; b=LY365FxMbTfKpKCrsdGRWSVDbMgFIp0ZRE4/ZNSyq7ZS
 K6SNWb5bz1bVKdO+/j3fIE+enWLfh5M9F/6/iTLHckCI04UJgBllQcbgFl8Csq5F
 Hz75PKY8zUZKt+wSm7gjJ3P7W0eUcGATmIQNG37yOlR5d0APAZE9wL5GfPka8Flj
 h+bOyz8iIv1YHmqWRKcOiSvT+0mytw+E7BQ+AHd2AmBNTLOPThjPCXs4Bzsep2rt
 cvd7ySq/2Kn3acbbyPDCffj5/ONLquNQu5nfE9yAQPodilR2SxEfsApYtxqPjaKt
 6W0GFIEzMIsHq3hRfKocNDttk7/yfxIinx9jjJgfZw==
X-ME-Sender: <xms:L3_RYzCCeJAqIiwB7T-Z5tS08bW_X_Ao3_1rBmVnCE5H3RnSLSrLeg>
 <xme:L3_RY5iqfLSX3uVtevpvN6NF3EvMZY_HZ0AvPwHLPLRjCU1Pdjo_vHWlk3rpMWeGj
 CuxFNeBjZJhRYvLB1w>
X-ME-Received: <xmr:L3_RY-mK2eW9ANKUBbLqi1y2Upt5yhn_Ts3k8szI2tFUP2tTxggL8fvh4VLpZ7J-wCYs9z-skL-ijezdfOJXeJjp>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddvvddguddvfecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefrvght
 vghrucffvghlvghvohhrhigrshcuoehpvghtvghrsehpjhgurdguvghvqeenucggtffrrg
 htthgvrhhnpeduteeihfffleeuveekgedugfeffeehtdeguefffffhleehgfduueejjeek
 feeukeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hpvghtvghrsehpjhgurdguvghv
X-ME-Proxy: <xmx:L3_RY1znHLI7miqMqjf1bv_rj7gugrPCxM4zNKvNdIKmv6F_ZdIy3w>
 <xmx:L3_RY4TuPhs0g3uPP3tD4S_6MhjE5qjk4hjSROLbHuC7wsqoWLMw1Q>
 <xmx:L3_RY4bCrP64ES9GEXZ7cbMmB1W0iYfp4KBbtq8e6jLCX6-EZKj2BQ>
 <xmx:MH_RY7H_lJhb_7CWXfG3LgWF6va_8bMgD84N4wMQWJtUASg4vr8wvw>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 25 Jan 2023 14:12:44 -0500 (EST)
Date: Wed, 25 Jan 2023 11:12:41 -0800
From: Peter Delevoryas <peter@pjd.dev>
To: Ninad S Palsule <ninadpalsule@us.ibm.com>
Cc: "andrew@aj.id.au" <andrew@aj.id.au>, "clg@kaod.org" <clg@kaod.org>,
 "hskinnemoen@google.com" <hskinnemoen@google.com>,
 "joel@jms.id.au" <joel@jms.id.au>,
 "kfting@nuvoton.com" <kfting@nuvoton.com>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "philmd@linaro.org" <philmd@linaro.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: [PATCH v4 3/5] hw/nvram/eeprom_at24c: Add init_rom field and
 at24c_eeprom_init_rom helper
Message-ID: <Y9F/KS1cPueMfyI4@pdel-mbp.dhcp.thefacebook.com>
References: <20230118024214.14413-4-peter@pjd.dev>
 <3C616E21-EED8-4A17-9FC9-970939CC0926@contoso.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3C616E21-EED8-4A17-9FC9-970939CC0926@contoso.com>
Received-SPF: pass client-ip=64.147.123.24; envelope-from=peter@pjd.dev;
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

On Wed, Jan 25, 2023 at 04:53:20PM +0000, Ninad S Palsule wrote:
> Signed-off-by: Peter Delevoryas peter@pjd.dev<mailto:peter@pjd.dev>
> Reviewed-by: Joel Stanley joel@jms.id.au<mailto:joel@jms.id.au>
> 
> Tested-by: Ninad Palsule ninadpalsule@us.ibm.com<mailto:ninadpalsule@us.ibm.com>
> 
> Hi Peter,
> I applied your patches and made sure that different EEPROM images can be loaded from
> appropriate image files and it is working as expected.

Thanks Ninad, this is a good regression test to make sure I didn't break the
existing drive proprerty.

- Peter

> 
> # Used following command to invoke the qemu.
> qemu-system-arm -M rainier-bmc -nographic \
>   -kernel fitImage-linux.bin \
>   -dtb aspeed-bmc-ibm-rainier.dtb \
>   -initrd obmc-phosphor-initramfs.rootfs.cpio.xz \
>   -drive file=obmc-phosphor-image.rootfs.wic.qcow2,if=sd,index=2 \
>   -append "rootwait console=ttyS4,115200n8 root=PARTLABEL=rofs-a" \
>   -device at24c-eeprom,bus=aspeed.i2c.bus.0,address=0x51,drive=a,rom-size=32768 -drive file=tpm.eeprom.bin,format=raw,if=none,id=a \
>   -device at24c-eeprom,bus=aspeed.i2c.bus.7,address=0x50,drive=b,rom-size=65536 -drive file=oppanel.eeprom.bin,format=raw,if=none,id=b \
>   -device at24c-eeprom,bus=aspeed.i2c.bus.7,address=0x51,drive=c,rom-size=65536 -drive file=lcd.eeprom.bin,format=raw,if=none,id=c \
>   -device at24c-eeprom,bus=aspeed.i2c.bus.8,address=0x50,drive=d,rom-size=65536 -drive file=baseboard.eeprom.bin,format=raw,if=none,id=d \
>   -device at24c-eeprom,bus=aspeed.i2c.bus.8,address=0x51,drive=e,rom-size=65536 -drive file=bmc.eeprom.bin,format=raw,if=none,id=e \
>   -device at24c-eeprom,bus=aspeed.i2c.bus.9,address=0x50,drive=f,rom-size=131072 -drive file=vrm.eeprom.bin,format=raw,if=none,id=f \
>   -device at24c-eeprom,bus=aspeed.i2c.bus.10,address=0x50,drive=g,rom-size=131072 -drive file=vrm.eeprom.bin,format=raw,if=none,id=g \
>   -device at24c-eeprom,bus=aspeed.i2c.bus.13,address=0x50,drive=h,rom-size=65536 -drive file=nvme.eeprom.bin,format=raw,if=none,id=h \
>   -device at24c-eeprom,bus=aspeed.i2c.bus.14,address=0x50,drive=i,rom-size=65536 -drive file=nvme.eeprom.bin,format=raw,if=none,id=i \
>   -device at24c-eeprom,bus=aspeed.i2c.bus.15,address=0x50,drive=j,rom-size=65536 -drive file=nvme.eeprom.bin,format=raw,if=none,id=j

