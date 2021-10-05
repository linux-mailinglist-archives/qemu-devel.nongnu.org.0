Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E5F7421F7A
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 09:34:35 +0200 (CEST)
Received: from localhost ([::1]:37036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXey9-0004RD-NQ
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 03:34:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mXexH-0003YZ-4h
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 03:33:39 -0400
Received: from 4.mo548.mail-out.ovh.net ([188.165.42.229]:53585)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mXexE-0002E9-KU
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 03:33:38 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.250])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 39E8120C1C;
 Tue,  5 Oct 2021 07:33:32 +0000 (UTC)
Received: from kaod.org (37.59.142.99) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Tue, 5 Oct
 2021 09:33:31 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-99G003553784bf-7aff-413b-9ffd-c3bc475e6523,
 B992A7A85F7DA5A3EB1BC28B00EBEA618CDBEA87) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <802d0795-36ee-938c-9c47-16e8f0b3b173@kaod.org>
Date: Tue, 5 Oct 2021 09:33:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2 1/2] hw/adc: Add basic Aspeed ADC model
Content-Language: en-US
To: Peter Delevoryas <pdel@fb.com>
References: <20211003191850.513658-1-pdel@fb.com>
 <20211003191850.513658-2-pdel@fb.com>
 <4d7c55d4-25fd-520c-97aa-98036fe6fd1a@kaod.org>
 <8507A7E7-DA6A-4E73-A4C5-C44780397351@fb.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <8507A7E7-DA6A-4E73-A4C5-C44780397351@fb.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.99]
X-ClientProxiedBy: DAG6EX2.mxp5.local (172.16.2.52) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 2c405d0c-ffe9-4534-ae8b-bee7ebfb91c5
X-Ovh-Tracer-Id: 18432107378577279791
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrudelfedguddujecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeigedvffekgeeftedutddttdevudeihfegudffkeeitdekkeetkefhffelveelleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehprghtrhhitghksehsthiftgigrdighiii
Received-SPF: pass client-ip=188.165.42.229; envelope-from=clg@kaod.org;
 helo=4.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Alistair Francis <alistair@alistair23.me>,
 Cameron Esfahani via <qemu-devel@nongnu.org>,
 "patrick@stwcx.xyz" <patrick@stwcx.xyz>, qemu-arm <qemu-arm@nongnu.org>,
 Joel Stanley <joel@jms.id.au>, Dan Zhang <zhdaniel@fb.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/5/21 07:31, Peter Delevoryas wrote:
> 
> 
>> On Oct 4, 2021, at 12:49 AM, Cédric Le Goater <clg@kaod.org> wrote:
>>
>> On 10/3/21 21:18, pdel@fb.com wrote:
>>> From: Andrew Jeffery <andrew@aj.id.au>
>>> This model implements enough behaviour to do basic functionality tests
>>> such as device initialisation and read out of dummy sample values. The
>>> sample value generation strategy is similar to the STM ADC already in
>>> the tree.
>>> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
>>> [clg : support for multiple engines (AST2600) ]
>>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>>> [pdel : refactored engine register struct fields to regs[] array field]
>>> [pdel : added guest-error checking for upper-8 channel regs in AST2600]
>>> Signed-off-by: Peter Delevoryas <pdel@fb.com>
>>
>> Reviewed-by: Cédric Le Goater <clg@kaod.org>
>>
>> Thanks,
>>
>> C.
> 
> Hey Cedric,
> 
> Actually, I have just submitted a v3 of this patch series to support 16-bit
> reads of the channel data registers. I don’t think I tested using the driver
> to read from the ADC, and that’s what Patrick found crashed with these
> changes. Since it’s relatively easy to enable 16-bit reads, I figured
> I would just include that.

OK.

A Tested-by: tag would be welcome !

Thanks,

C.

