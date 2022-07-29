Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E998E585246
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jul 2022 17:20:48 +0200 (CEST)
Received: from localhost ([::1]:55734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHRnD-0003Lh-O8
	for lists+qemu-devel@lfdr.de; Fri, 29 Jul 2022 11:20:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1oHRkF-0001No-Tn; Fri, 29 Jul 2022 11:17:44 -0400
Received: from smtpout4.mo529.mail-out.ovh.net ([217.182.185.173]:59557)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1oHRkD-0000EQ-Gj; Fri, 29 Jul 2022 11:17:43 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.124])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 0FDD511B4D274;
 Fri, 29 Jul 2022 17:17:36 +0200 (CEST)
Received: from kaod.org (37.59.142.95) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Fri, 29 Jul
 2022 17:17:28 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G0019cac6f85-9990-4be5-8cca-21500281aaf6,
 FAFF5065920E43DA0D2CF6C40E58A39B80E28978) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 90.89.72.120
Message-ID: <5532b623-d07d-9a36-ce1e-6d13b1fe70e6@kaod.org>
Date: Fri, 29 Jul 2022 17:17:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [RFC 0/3] Add Generic SPI GPIO model
Content-Language: en-US
To: Patrick Williams <patrick@stwcx.xyz>
CC: Iris Chen <irischenlj@fb.com>, <peter@pjd.dev>, <pdel@fb.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <alistair@alistair23.me>,
 <kwolf@redhat.com>, <hreitz@redhat.com>, <peter.maydell@linaro.org>,
 <andrew@aj.id.au>, <joel@jms.id.au>, <thuth@redhat.com>,
 <lvivier@redhat.com>, <pbonzini@redhat.com>, <qemu-block@nongnu.org>,
 <dz4list@gmail.com>
References: <20220728232322.2921703-1-irischenlj@fb.com>
 <435b3e89-f9fd-c257-b03d-a12d4b59ac6b@kaod.org>
 <YuPw8aQ2cfJIx+1f@heinlein.stwcx.org.github.beta.tailscale.net>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <YuPw8aQ2cfJIx+1f@heinlein.stwcx.org.github.beta.tailscale.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG1EX2.mxp5.local (172.16.2.2) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 43e33048-fbbe-4c85-b24d-90af56449215
X-Ovh-Tracer-Id: 18016931785696578375
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrvddujedgkeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeekteejtdelkeejvdevffduhfetteelieefgeefffeugffhfeekheffueefledujeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepugiigehlihhsthesghhmrghilhdrtghomhdpoffvtefjohhsthepmhhohedvle
Received-SPF: pass client-ip=217.182.185.173; envelope-from=clg@kaod.org;
 helo=smtpout4.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 7/29/22 16:38, Patrick Williams wrote:
> On Fri, Jul 29, 2022 at 03:25:55PM +0200, Cédric Le Goater wrote:
>> Hello Iris,
>>
>> On 7/29/22 01:23, Iris Chen wrote:
>>> Currently, most of our vboot platforms using a SPI-based TPM use the Linux
>>> SPI-GPIO driver to "bit-bang" the SPI protocol. This is because the Aspeed
>>> SPI controller (modeled in QEMU under hw/ssi/aspeed_smc.c) has an implementation
>>> deficiency that prevents bi-directional operations.
>> aspeed_smc models the Aspeed FMC/SPI controllers which have a well defined
>> HW interface. Your model proposal adds support for a new SPI controller
>> using bitbang GPIOs. These are really two differents models. I don't see
>> how you could reuse aspeed_smc for this purpose.
> 
> (I don't think there was anything here that proposed reusing the QEMU
>   aspeed_smc model, but it might have been poorly worded).

yeah. That's fine. I was trying to see if we could ease Iris work with
a fix in some driver/model but I didn't understand where.

>> or you mean that Linux is using the SPI-GPIO driver because the Linux
>> Aspeed SMC driver doesn't match the need ? It is true that the Linux
>> driver is not generic, it deals with flash devices only. But that's
>> another problem.
> 
> We actually mean that the _hardware_ has a deficiency, not any of the
> code for it.  The Aspeed SPI controller has a single byte FIFO in its
> implementation, which can only read or write in a single operation.  It
> is *impossible* to perform bi-directional access with it (ie. you cannot
> write the MOSI and read the MISO in the same transaction).  This is
> broken for many SPI protocols, other than flash devices, including the one
> used for TPMs.
> 
> In order to connect to SPI-based TPMs on an Aspeed chip, you have to use
> the SPI-GPIO method.

Ok. Thanks for the clarification.

C.


