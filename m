Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 584F349B798
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 16:29:29 +0100 (CET)
Received: from localhost ([::1]:42582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCNl9-0002S1-RO
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 10:29:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nCNYY-0005s8-7k
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 10:16:26 -0500
Received: from 10.mo552.mail-out.ovh.net ([87.98.187.244]:35677)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nCNYI-0007Ws-84
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 10:16:25 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.179])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id E122021AA6;
 Tue, 25 Jan 2022 15:15:21 +0000 (UTC)
Received: from kaod.org (37.59.142.100) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 25 Jan
 2022 16:15:21 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R003fedf1362-8a3a-4faa-80fc-e3bbff8a7add,
 81DEFC5675B4A2B0B4575F732D37872089199EF9) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <28c217a0-bf69-c573-aa72-aacda7211202@kaod.org>
Date: Tue, 25 Jan 2022 16:15:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 0/5] target/ppc: powerpc_excp improvements [BookS] (4/n)
Content-Language: en-US
To: Fabiano Rosas <farosas@linux.ibm.com>, <qemu-devel@nongnu.org>
References: <20220124184605.999353-1-farosas@linux.ibm.com>
 <6605f0a0-fcc4-44fa-1b94-397dd7ed554e@kaod.org>
 <87pmofx3uw.fsf@linux.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <87pmofx3uw.fsf@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG5EX2.mxp5.local (172.16.2.42) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: b022efa1-0ce2-4fa2-99e1-cf2dfb132222
X-Ovh-Tracer-Id: 1443685158752914339
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrvdelgdejfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeejkedvgfduveekfeekledtjeetkedvgeffgeduteegtedtffejfeehkeeflefftdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepuggrvhhiugesghhisghsohhnrdgurhhophgsvggrrhdrihgurdgruh
Received-SPF: pass client-ip=87.98.187.244; envelope-from=clg@kaod.org;
 helo=10.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/25/22 15:54, Fabiano Rosas wrote:
> Cédric Le Goater <clg@kaod.org> writes:
> 
>> On 1/24/22 19:46, Fabiano Rosas wrote:
>>> This series splits the exception code for BookS CPUs: 970, POWER5+,
>>> POWER7, POWER8, POWER9, POWER10. After dealing with the 405, let's go
>>> back to something more familiar to give everyone a break.
>>>
>>> No upfront fixes this time. The pseries code gets used a lot, so there
>>> are no obvious issues and the older BookS CPUs get the benefits by
>>> default since they are similar.
>>
>> Super ! I think this series can go in directly. I would only change
>> the name to book3s because it fits better the current naming in QEMU
>> and Linux.
> 
> Not that it matters that much, but QEMU emulates Books I and II as well,
> doesn't it?

yes. it's just a naming convention that we use everywhere. See :

   https://www.kernel.org/doc/html/latest/powerpc/cpu_families.html

book3s is even a larger family, it includes all the 32bit ..

I would vote for 'book3s_arch2x' to be in sync with the is_book3s_arch2x()
helper.

Thanks,

C.

> Book I, Power ISA User Instruction Set Architecture,
> covers the base instruction set and related facilities
> available to the application programmer.
> 
> Book II, Power ISA Virtual Environment Architecture,
> defines the storage model and other instructions and
> facilities that enable the application programmer to cre-
> ate multithreaded programs and programs that interact
> with certain physical realities of the computing environ-
> ment.
> 
> Book III, Power ISA Operating Environment Architec-
> ture, defines the supervisor instructions and related
> facilities.
> 
> Anyway, I'm OK with either name.
> 
>>
>> Thanks,
>>
>> C.


