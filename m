Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11EA46C03AB
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Mar 2023 18:59:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pdxIG-0006vS-A6; Sun, 19 Mar 2023 13:58:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pdxIB-0006tf-4S
 for qemu-devel@nongnu.org; Sun, 19 Mar 2023 13:58:03 -0400
Received: from 5.mo548.mail-out.ovh.net ([188.165.49.213])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pdxI9-00030b-9n
 for qemu-devel@nongnu.org; Sun, 19 Mar 2023 13:58:02 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.240])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 9E7B01FD37;
 Sun, 19 Mar 2023 17:57:49 +0000 (UTC)
Received: from kaod.org (37.59.142.101) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Sun, 19 Mar
 2023 18:57:49 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G004194a3899-f1e4-48c2-b439-e2284af81e97,
 BC9DF364CEB6EC240818CFF545E77DA4D2CB286A) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <1f589f04-8d48-36bd-9518-357d3a0cbfd1@kaod.org>
Date: Sun, 19 Mar 2023 18:57:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: Using QEMU how to redirect serial /dev/ttyS2 output of guest
 machine to host machine.
To: Abhishek Singh Dagur <abhishek@drut.io>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Srinivas Kodali <srini@drut.io>,
 <qemu-devel@nongnu.org>, Anand Moon <anand@drut.io>
References: <CAJ1un7j0FNpYaaviQxoKQN4O+C8RejqA918CdBamPySKyAEJUQ@mail.gmail.com>
 <87mt4b73sv.fsf@linaro.org> <b2c11d07-ee58-715d-2994-3add1c60b95d@kaod.org>
 <CAJ1un7gM4Zf1ZRCG9c-FAcrgUcEtrRX5C0PXFxqOjMq=FzQvvw@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <CAJ1un7gM4Zf1ZRCG9c-FAcrgUcEtrRX5C0PXFxqOjMq=FzQvvw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG5EX2.mxp5.local (172.16.2.42) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: e0defe73-6cee-4fb1-b74d-07eaae8d023b
X-Ovh-Tracer-Id: 5556597519423474595
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrvdefiedguddutdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeugfelhfevffefjeetveeuieduueefkedujefghfeuleekjedvteevveefhffhueenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrddutddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeotghlgheskhgrohgurdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopegrsghhihhshhgvkhesughruhhtrdhiohdprghlvgigrdgsvghnnhgvvgeslhhinhgrrhhordhorhhgpdhsrhhinhhisegurhhuthdrihhopdhqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdgrnhgrnhgusegurhhuthdrihhopdfovfetjfhoshhtpehmohehgeekpdhmohguvgepshhmthhpohhuth
Received-SPF: pass client-ip=188.165.49.213; envelope-from=clg@kaod.org;
 helo=5.mo548.mail-out.ovh.net
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hello Abhishek,

On 3/18/23 18:55, Abhishek Singh Dagur wrote:
> Hi Alex , Cédric,
> we have tried this *option:-serial *pty* -serial *pty* -serial *pty *-serial *pty *-serial *pty to check the serial output on screen.
> 
> Here we are providing 2 scenarios without and with the changes suggested by @Cédric Le Goater <mailto:clg@kaod.org> .
> In first we are able to get /dev/ttyS4 serial port not /dev/ttyS2
> In second we are able to get /dev/ttyS2 not /dev/ttyS4
> 
> *Scenario1:****previously with normal qemu build i have tried emulation as:*
> 
> qemu-system-arm -m 512 -M ast2500-evb,fmc-model=mx66u51235f,spi-model=mx66u51235f -nographic -drive file=./pru-1.2.4_dev-rc1.static.mtd,format=raw,if=mtd -serial pty -serial pty -serial pty -serial pty
> 
> which gives us output as.
> 
> QEMU 7.2.0 monitor - type 'help' for more information
> (qemu) char device redirected to /dev/pts/15 (label serial0)
> char device redirected to /dev/pts/16 (label serial1)
> char device redirected to /dev/pts/17 (label serial2)
> char device redirected to /dev/pts/18 (label serial3)
> 
> so we can use *screen *to interact with the ttyS4 serial port like :
> screen /dev/pts/15
> In which we have our boot process and shell prompt .
> 
> *Scenario2:* *when I am using the newly build image with the changes *@Cédric Le Goater <mailto:clg@kaod.org>*  provided*
> 
> With the below command:
> ./qemu-system-arm -m 512 -M ast2500-evb,uart-default=uart2,fmc-model=mx66u51235f,spi-model=mx66u51235f -nographic -drive file=./pru-1.2.4_dev-rc1.static.mtd,format=raw,if=mtd -serial pty -serial pty -serial pty -serial pty

Since the machine expect /dev/ttyS2 to be the boot console, the SoC device
to attach to the first serial is UART3. This command line should output
the console logs in the same terminal :

   ./qemu-system-arm -m 512 -M ast2500-evb,uart-default=uart3,fmc-model=mx66u51235f,spi-model=mx66u51235f -net user -nographic -drive file=./pru-1.2.4_dev-rc1.static.mtd,format=raw,if=mtd -serial mon:stdio

I have updated the patch in my aspeed-8.0 tree :

   https://github.com/legoater/qemu/commit/20fe705361dd7ed1d9129747a8a0b643410869e3

Please note that in this last version, the machine option is simply "uart".

Thanks,

C.

