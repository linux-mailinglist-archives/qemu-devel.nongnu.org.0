Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A7BF6A7FFC
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 11:31:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXgCP-0007MV-CO; Thu, 02 Mar 2023 05:30:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pXgCI-0007KD-Ij
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 05:30:05 -0500
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pXgCG-0000n7-5V
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 05:30:02 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.2])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id DD4A421275;
 Thu,  2 Mar 2023 10:29:48 +0000 (UTC)
Received: from kaod.org (37.59.142.105) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Thu, 2 Mar
 2023 11:29:48 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G006dd9eef8a-3c5f-48cc-99be-56b243b508f2,
 9B4FE5079A0EA0ECEB0374FF8CD8206378B8B5FD) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <2503ff6f-a4fa-d58c-ea5f-49a39cd21403@kaod.org>
Date: Thu, 2 Mar 2023 11:29:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: Bug in master branch:
 IbmPrep40pMachine.test_factory_firmware_and_netbsd broken
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clegoate@redhat.com>, Thomas Huth
 <thuth@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>, Peter Maydell
 <peter.maydell@linaro.org>, =?UTF-8?Q?Herv=c3=a9_Poussineau?=
 <hpoussin@reactos.org>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>
CC: Richard Henderson <richard.henderson@linaro.org>, Daniel Henrique Barboza
 <danielhb413@gmail.com>, Bernhard Beschow <shentey@gmail.com>
References: <928a8552-ab62-9e6c-a492-d6453e338b9d@redhat.com>
 <ef101296-fc49-aa65-bc88-ce12fee8aeea@redhat.com>
 <71ed4fd4-0d47-5802-cb2d-35a49002a92d@linaro.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <71ed4fd4-0d47-5802-cb2d-35a49002a92d@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG5EX1.mxp5.local (172.16.2.41) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 9e8fb34b-176e-41ec-b97a-a59bccdc12f9
X-Ovh-Tracer-Id: 8834936572233288693
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrudeljedgudehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeehuefgtdetteefgfeihfefgfeuudevfeeihefgvedvteeiudeggefhhedthedvffenucffohhmrghinhepghhithhlrggsrdgtohhmnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrddutdehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeotghlgheskhgrohgurdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehphhhilhhmugeslhhinhgrrhhordhorhhgpdgtlhgvghhorghtvgesrhgvughhrghtrdgtohhmpdhthhhuthhhsehrvgguhhgrthdrtghomhdpqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpqhgvmhhuqdhpphgtsehnohhnghhnuhdrohhrghdpphgvthgvrhdrmhgrhiguvghllheslhhinhgrrhhordhorhhgpdhhphhouhhsshhinhesrhgvrggtthhoshdrohhrghdpfhegsghughesrghmshgrthdrohhrghdprhhitg
 hhrghrugdrhhgvnhguvghrshhonheslhhinhgrrhhordhorhhgpdgurghnihgvlhhhsgegudefsehgmhgrihhlrdgtohhmpdhshhgvnhhtvgihsehgmhgrihhlrdgtohhmpdfovfetjfhoshhtpehmohehvdelpdhmohguvgepshhmthhpohhuth
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.09,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 3/2/23 11:27, Philippe Mathieu-Daudé wrote:
> On 2/3/23 10:48, Cédric Le Goater wrote:
>> On 3/2/23 08:47, Thomas Huth wrote:
>>>
>>>   Hi all,
>>>
>>> seems like we've got another bug that sneaked in during the CI minutes blackout: The avocado test IbmPrep40pMachine.test_factory_firmware_and_netbsd is now broken reliably, see:
>>>
>>>   https://gitlab.com/qemu-project/qemu/-/jobs/3858833617#L300
>>>   https://gitlab.com/thuth/qemu/-/jobs/3858727901#L300
>>>   https://gitlab.com/thuth/qemu/-/jobs/3857804517#L300
>>>
>>> Is anybody already looking into this?
>>>
>>>   Thomas
>>
>> I tried manually and QEMU reached :
>>        >> (builds@wb29, Tue Oct  7 23:59:44 PDT 2008)
>>      Boot:
>>      Loading in()
>>      3558080+232036 [197696+188133]=0x3fbbf0
>>      start=0x100000
>>      Copyright (c) 1996, 1997, 1998, 1999, 2000, 2001, 2002, 2003, 2004, 2005,
>>          2006, 2007
>>          The NetBSD Foundation, Inc.  All rights reserved.
>>      Copyright (c) 1982, 1986, 1989, 1991, 1993
>>          The Regents of the University of California.  All rights reserved.
>>      NetBSD 4.0.1 (GENERIC) #0: Wed Oct  8 00:46:56 PDT 2008
>> builds@wb29:/home/builds/ab/netbsd-4-0-1-RELEASE/prep/200810080053Z-obj/home/builds/ab/netbsd-4-0-1-RELEASE/src/sys/arch/prep/compile/GENERIC
>>      Model: IBM PPS Model 6015
>>      total memory = 128 MB
>>      avail memory = 119 MB
>>      trap: kernel read DSI trap @ 0x7c3042a6 by 0x3e4cf8 (DSISR 0x40000000, err=14), lr 0x377eac
>>      panic: trap
>>      Stopped in pid 0.1 () at        netbsd:cpu_Debugger+0x10: lwz     r0, r1, 0
>>      x14
> 
> Bisecting using:
> 
>       make print-V \
>    && ninja qemu-system-ppc \
>    && AVOCADO_ALLOW_UNTRUSTED_CODE=1 \
>       avocado --show=app,console \
>         run --test-runner=nrunner -t slowness:high \
>           tests/avocado/ppc_prep_40p.py
> 
> commit cef2e7148e32d61338de0220619d308bf42af770
> Author: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Date:   Fri Feb 10 16:05:34 2023 +0100
> 
>      hw/isa/i82378: Remove intermediate IRQ forwarder
> 
>      When the i82378 model was added in commit a04ff940974 ("prep:
>      Add i82378 PCI-to-ISA bridge emulation") the i8259 model was
>      not yet QOM'ified. This happened later in commit 747c70af78f
>      ("i8259: Convert to qdev").
> 
>      Directly dispatch ISA IRQs to 'cpu_intr' output IRQ
>      by removing the intermediate i82378_request_out0_irq()
>      handler. Rename ISA IRQs array as 'isa_irqs_in' to
>      emphasize these are input IRQs.

Yes. Just found the same.

> Sorry :/ I'll look at this.

Thanks,

C.

