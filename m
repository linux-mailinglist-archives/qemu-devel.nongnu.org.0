Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47779589BD8
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 14:43:05 +0200 (CEST)
Received: from localhost ([::1]:53294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJaBs-0004j0-Ba
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 08:43:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oJZw5-0001Yp-Le
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 08:26:45 -0400
Received: from 8.mo548.mail-out.ovh.net ([46.105.45.231]:43835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oJZw1-00018a-JE
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 08:26:45 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.132])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 7C39C21FF0;
 Thu,  4 Aug 2022 12:26:37 +0000 (UTC)
Received: from kaod.org (37.59.142.103) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Thu, 4 Aug 2022
 14:26:36 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G005348c8439-e599-4d65-86ea-e9d632625b08,
 E459FF07681E7C706565AD81A8193C11BE0AA2AA) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <c2fa7a64-9b43-9abb-b910-e84175448551@kaod.org>
Date: Thu, 4 Aug 2022 14:26:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 00/20] ppc: QOM'ify 405 board
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, <qemu-ppc@nongnu.org>
CC: <qemu-devel@nongnu.org>, BALATON Zoltan <balaton@eik.bme.hu>
References: <20220803132844.2370514-1-clg@kaod.org>
 <6e3b8380-56bb-c9af-47f3-c37611484917@kaod.org>
 <d240289b-f03b-9678-6b7a-2a710ad8a82c@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <d240289b-f03b-9678-6b7a-2a710ad8a82c@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG8EX2.mxp5.local (172.16.2.72) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: d99c1213-e2f3-4979-a62d-4c1aaed57393
X-Ovh-Tracer-Id: 13473925661448506336
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrvddvledghedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeekteejtdelkeejvdevffduhfetteelieefgeefffeugffhfeekheffueefledujeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopegsrghlrghtohhnsegvihhkrdgsmhgvrdhhuhdpoffvtefjohhsthepmhhoheegke
Received-SPF: pass client-ip=46.105.45.231; envelope-from=clg@kaod.org;
 helo=8.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 8/4/22 12:07, Daniel Henrique Barboza wrote:
> 
> 
> On 8/4/22 03:07, Cédric Le Goater wrote:
>> Daniel,
>>
>> On 8/3/22 15:28, Cédric Le Goater wrote:
>>> Hello,
>>>
>>> Here is large series QOM'ifying the PPC405 board. It introduces a new
>>> generic machine and SoC models, converts the current device models to
>>> QOM and populates the SoC. The process is quite mechanical without too
>>> much issues to handle. The noisy part is the initial patch introducing
>>> the SoC realize routine.
>>>
>>> What's left ?
>>>
>>> * The DCR read/writre handlers are attached in table to the CPU
>>>    instance. We could probably rework the whole with a specific address
>>>    space and memory regions handling the implemented registers. I don't
>>>    think this is necessary.
>>>
>>> * the SDRAM mappings are very baroque and certainly could be simplified.
>>>    I think we should QOMify the ppc440 machines before addressing this
>>>    part.
>>
>>
>> I will resend a v3 taking into account the comments (and fixes) from you
>> and Zoltan.
> 
> I'll get whatever pending fixes we have for the freeze and send a PR including
> the mal_irqs[] fix today. 

Yes. Please do that. The mal_irqs[] issue is clearly a "for-7.1" fix.

> I'll be less stuff to worry about for this series.

I think I am going to add some extras to remove the plb/ebc/mal init
routines while I am at changing things.

Thanks,

C.

> 
> Daniel
> 
>>
>> Also, the PPC405 controller has 2 SDRAM banks, I should try to model
>> that with a single bank default. The ppc4xx_sdram_init() routine is
>> a bit of a pain to do anything clean really.
>>
>>
>> Thanks,
>>
>> C.
>>
>>
>>
>>> Changes in v2 :
>>>
>>>   - docs/about/removed-features.rst update
>>>   - Fix compile breakage (uic)
>>>   - Fix CPU reset, which breaking u-boot boot
>>>   - Changed prefix of memory regions to "ppc405"
>>>   - Reduced the number of RAM banks to 1. Second was a dummy one to
>>>     please ppc405ep_init()
>>>
>>> Cédric Le Goater (20):
>>>    ppc/ppc405: Remove taihu machine
>>>    ppc/ppc405: Introduce a PPC405 generic machine
>>>    ppc/ppc405: Move devices under the ref405ep machine
>>>    ppc/ppc405: Introduce a PPC405 SoC
>>>    ppc/ppc405: Start QOMification of the SoC
>>>    ppc/ppc405: QOM'ify CPU
>>>    ppc/ppc405: QOM'ify CPC
>>>    ppc/ppc405: QOM'ify GPT
>>>    ppc/ppc405: QOM'ify OCM
>>>    ppc/ppc405: QOM'ify GPIO
>>>    ppc/ppc405: QOM'ify DMA
>>>    ppc/ppc405: QOM'ify EBC
>>>    ppc/ppc405: QOM'ify OPBA
>>>    ppc/ppc405: QOM'ify POB
>>>    ppc/ppc405: QOM'ify PLB
>>>    ppc/ppc405: QOM'ify MAL
>>>    ppc/ppc405: QOM'ify FPGA
>>>    ppc/ppc405: QOM'ify UIC
>>>    ppc/ppc405: QOM'ify I2C
>>>    ppc/ppc4xx: Fix sdram trace events
>>>
>>>   docs/about/deprecated.rst       |   9 -
>>>   docs/about/removed-features.rst |   6 +
>>>   docs/system/ppc/embedded.rst    |   1 -
>>>   hw/ppc/ppc405.h                 | 210 ++++++++-
>>>   include/hw/ppc/ppc4xx.h         |  29 ++
>>>   hw/ppc/ppc405_boards.c          | 366 ++++-----------
>>>   hw/ppc/ppc405_uc.c              | 799 +++++++++++++++++++-------------
>>>   hw/ppc/ppc4xx_devs.c            | 124 +++--
>>>   MAINTAINERS                     |   2 +-
>>>   9 files changed, 894 insertions(+), 652 deletions(-)
>>>
>>


