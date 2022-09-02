Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CFE75AAA56
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Sep 2022 10:43:21 +0200 (CEST)
Received: from localhost ([::1]:36702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oU2Gl-0005Zi-Tx
	for lists+qemu-devel@lfdr.de; Fri, 02 Sep 2022 04:43:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oU2Ev-0002OS-RU
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 04:41:25 -0400
Received: from 3.mo548.mail-out.ovh.net ([188.165.32.156]:55333)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oU2Et-0004eS-Sm
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 04:41:25 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.83])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 81A8223B0E;
 Fri,  2 Sep 2022 08:41:20 +0000 (UTC)
Received: from kaod.org (37.59.142.104) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12; Fri, 2 Sep
 2022 10:41:19 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R0058ed4035b-1c64-4773-b300-8ef8935c4a0f,
 D61F9D71629D8638CC5FDB79ACAD046E2B22D36A) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 90.27.158.190
Message-ID: <55c860d4-f294-f032-91b7-299223e03d35@kaod.org>
Date: Fri, 2 Sep 2022 10:41:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 00/20] ppc4xx_sdram QOMify and clean ups
Content-Language: en-US
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
To: BALATON Zoltan <balaton@eik.bme.hu>, <qemu-devel@nongnu.org>,
 <qemu-ppc@nongnu.org>
CC: Daniel Henrique Barboza <danielhb413@gmail.com>, Peter Maydell
 <peter.maydell@linaro.org>
References: <cover.1660926381.git.balaton@eik.bme.hu>
 <1816eb34-a93a-c8cc-9abc-c38f5a4e38ce@eik.bme.hu>
 <fa58b3d3-3773-0c2a-f7a5-b2ee2e61ed22@kaod.org>
In-Reply-To: <fa58b3d3-3773-0c2a-f7a5-b2ee2e61ed22@kaod.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.104]
X-ClientProxiedBy: DAG4EX2.mxp5.local (172.16.2.32) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: b180caac-5fd9-4a53-a614-de96bbf43941
X-Ovh-Tracer-Id: 13956655247257209763
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrvdeltddgtdekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffhvfevfhgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeehieevfedvtdeitedtleelveduveetteegffevieevvdffgeegteevieegleeigeenucffohhmrghinhepghhithhlrggsrdgtohhmpdhgihhthhhusgdrtghomhenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehpvghtvghrrdhmrgihuggvlhhlsehlihhnrghrohdrohhrghdpoffvtefjohhsthepmhhoheegke
Received-SPF: pass client-ip=188.165.32.156; envelope-from=clg@kaod.org;
 helo=3.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 9/2/22 10:35, Cédric Le Goater wrote:
> On 9/1/22 23:02, BALATON Zoltan wrote:
>> On Fri, 19 Aug 2022, BALATON Zoltan wrote:
>>> Hello,
>>>
>>> This is based on gitlab.com/danielhb/qemu/tree/ppc-7.2
>>
>> Now that the queue is flushed it should apply on master so
> 
> 
> I will take a look (most likely next week) and It should reach 7.2.
> No worries on that.

First comment, you should use :

   https://github.com/legoater/qemu-ppc-boot

and check that this command still runs :

   ./ppc-boot.sh -q --prefix=/path/to/qemu/  bamboo ref405ep

Thanks,

C.


