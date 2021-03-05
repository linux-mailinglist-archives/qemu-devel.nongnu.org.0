Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA50032EF2B
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 16:41:06 +0100 (CET)
Received: from localhost ([::1]:52220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lICZd-0006Gg-V2
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 10:41:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lICXo-0004rL-S6; Fri, 05 Mar 2021 10:39:12 -0500
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:52969)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lICXl-0004Ht-Pq; Fri, 05 Mar 2021 10:39:12 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.124])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 415038D2BCD5;
 Fri,  5 Mar 2021 16:38:58 +0100 (CET)
Received: from kaod.org (37.59.142.104) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Fri, 5 Mar 2021
 16:38:57 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R00569663646-4b0b-4080-8184-30f1d16334ce,
 A3005A4F36DF08AD97B2C2D73D5B520F0C45B7E8) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 86.201.91.229
Subject: Re: [PATCH v2 0/2] tests/acceptance: Test Aspeed ARM machines
To: Peter Maydell <peter.maydell@linaro.org>, Joel Stanley <joel@jms.id.au>
References: <20210304123951.163411-1-joel@jms.id.au>
 <CAFEAcA9jux7H2cAwgrndvUv5=fivgQwbWDUEbU7rv7xUb=rz4A@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <345ad50c-ac43-2337-29e4-b7f060896434@kaod.org>
Date: Fri, 5 Mar 2021 16:38:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9jux7H2cAwgrndvUv5=fivgQwbWDUEbU7rv7xUb=rz4A@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.104]
X-ClientProxiedBy: DAG7EX2.mxp5.local (172.16.2.62) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 19546cc7-e86c-43a5-8606-5e5c07c4bff1
X-Ovh-Tracer-Id: 5805421396028066668
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledruddtiedgjeefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepjeekudeuudevleegudeugeekleffveeludejteffiedvledvgfekueefudehheefnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehpvghtvghrrdhmrgihuggvlhhlsehlihhnrghrohdrohhrgh
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>, QEMU Developers <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/5/21 4:12 PM, Peter Maydell wrote:
> On Thu, 4 Mar 2021 at 12:40, Joel Stanley <joel@jms.id.au> wrote:
>>
>> v2: Fix ast2600 test, thanks Cédric for the review.
>>
>> This adds tests for the Aspeed ARM SoCs. The AST2400 and AST2500 tests
>> use OpenBMC images from that project, fetched from github releases. The
>> AST2600 test uses a Debian arm32 kernel.
> 
> Just a note that I'm assuming that Cédric will gather up the
> various aspeed related patches that have been on the list recently
> and send a pullreq for them. (Having been on holiday my to-review
> queue is pretty full so I've just ignored anything aspeed-related;
> let me know if there is anything you specifically want me to look
> at, queue, whatever.)
>
> PS: softfreeze is 16 March so a pullreq on list sometime next week
> would probably be the ideal.

Yes. I am preparing the PR. 

  aspeed: Integrate HACE
  hw: Model ASPEED's Hash and Crypto Engine
  hw/misc: Model KCS devices in the Aspeed LPC controller
  hw/misc: Add a basic Aspeed LPC controller model
  hw/arm: ast2600: Correct the iBT interrupt ID
  hw/arm: ast2600: Set AST2600_MAX_IRQ to value from datasheet
  hw/arm: ast2600: Force a multiple of 32 of IRQs for the GIC
  hw/arm/aspeed: Fix location of firmware images in documentation
  aspeed: Emulate the AST2600A3
  tests/acceptance: Test ast2600 machine
  tests/acceptance: Test ast2400 and ast2500 machines
  arm/ast2600: Fix SMP booting with -kernel

The HACE patchset needs a second look from an Aspeed-aware person and 
I have some questions on AST2600A3.

Merging these acceptance tests would be really nice. Have we addressed
all you concerns Philippe regarding the image downloads ?

Thanks,

C.

