Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11A2C4799F5
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Dec 2021 10:35:30 +0100 (CET)
Received: from localhost ([::1]:35908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myW7k-00057B-JF
	for lists+qemu-devel@lfdr.de; Sat, 18 Dec 2021 04:35:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1myW6C-0004Ef-0E
 for qemu-devel@nongnu.org; Sat, 18 Dec 2021 04:33:52 -0500
Received: from 10.mo548.mail-out.ovh.net ([46.105.77.235]:33403)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1myW6A-00056d-6r
 for qemu-devel@nongnu.org; Sat, 18 Dec 2021 04:33:51 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.147])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id E23C32030B;
 Sat, 18 Dec 2021 09:33:46 +0000 (UTC)
Received: from kaod.org (37.59.142.100) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Sat, 18 Dec
 2021 10:33:46 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R003392f41ab-de77-4d05-ae0b-da4e531170b3,
 B1F2FCB93787BB0875C07E604CDE73E7ADF677F7) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <31878c2f-2d85-9c84-d967-6899fe980c67@kaod.org>
Date: Sat, 18 Dec 2021 10:33:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 00/15] ppc/ppc405: decade cleanup
Content-Language: en-US
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, "qemu-ppc@nongnu.org"
 <qemu-ppc@nongnu.org>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <20211206103712.1866296-1-clg@kaod.org>
 <880aa46a-97cb-ad79-b72e-f8276692d750@kaod.org>
 <b3345770-21e2-39f2-8fe2-e9963886e680@csgroup.eu>
 <25f46261-6dd4-e1e5-cc68-c5a56243858c@kaod.org>
In-Reply-To: <25f46261-6dd4-e1e5-cc68-c5a56243858c@kaod.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG3EX2.mxp5.local (172.16.2.22) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 4775a59a-250b-4b55-8afa-8602a5ec508a
X-Ovh-Tracer-Id: 12320159731160419177
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrleekgddthecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuhffvfhgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeihfefffffgedtkeegtdekffevudeggfegffethfffhefhhfevhfdtudejhfdvieenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddttdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehgrhhouhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=46.105.77.235; envelope-from=clg@kaod.org;
 helo=10.mo548.mail-out.ovh.net
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.716,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, Greg Kurz <groug@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

>> Don't know if this is the reason of our problems but I think there is
>> something to investigate around timer interrupts:
>>
>>
>> / # cat /proc/interrupts
>>              CPU0
>>    16:         68       UIC   1 Level     serial
>> LOC:          0   Local timer interrupts for timer event device
>> LOC:          0   Local timer interrupts for others
>> SPU:          0   Spurious interrupts
>> PMI:          0   Performance monitoring interrupts
>> MCE:          0   Machine check exceptions
>>
>> Any idea what the problem can be ? How does QEMU generates timer
>> interrupts ?

The ppc405 timers were trashed by ddd1055b07fd ("PPC: booke timers").
I guess at the time, in 2011, there were no possible ways to test
regressions :/

This is addictive. I will look into it, I hope it's only a question
of adding back the TSR and TCR store helpers.

Thanks,

C.



