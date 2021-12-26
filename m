Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 894AB47F872
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Dec 2021 19:00:12 +0100 (CET)
Received: from localhost ([::1]:50864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n1XoZ-0003Eq-6q
	for lists+qemu-devel@lfdr.de; Sun, 26 Dec 2021 13:00:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n1XmS-0002Hk-N3
 for qemu-devel@nongnu.org; Sun, 26 Dec 2021 12:58:00 -0500
Received: from smtpout4.mo529.mail-out.ovh.net ([217.182.185.173]:44827)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n1XmQ-0008RS-MQ
 for qemu-devel@nongnu.org; Sun, 26 Dec 2021 12:58:00 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.193])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id CDF85D4158FE;
 Sun, 26 Dec 2021 18:57:55 +0100 (CET)
Received: from kaod.org (37.59.142.101) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Sun, 26 Dec
 2021 18:57:55 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G00466a6d6ae-bfe8-4998-8d6f-9f6d1c503d3b,
 AE5CAB6D971D10CFB765AF31D09B51945E61BB24) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.66.77.115
Message-ID: <ec0cf758-f05f-9fcf-eb97-14cb7a1fd9a2@kaod.org>
Date: Sun, 26 Dec 2021 18:57:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] target/ppc: Fix e6500 boot
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, "mario@locati.it" <mario@locati.it>
References: <20211213133542.2608540-1-farosas@linux.ibm.com>
 <724f7563-f36c-2c37-3b94-951c3d922861@eik.bme.hu>
 <R4OPHT$7F12C66D1107397991E0E4C978FE6AF1@locati.it>
 <a17ceb16-bce5-2090-8473-78b316bf5fb5@eik.bme.hu>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <a17ceb16-bce5-2090-8473-78b316bf5fb5@eik.bme.hu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG2EX1.mxp5.local (172.16.2.11) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: d393a15f-6359-4154-86b3-b278a982955c
X-Ovh-Tracer-Id: 12475815393871498022
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddruddugedgieeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepieejieevleeutdfhffefleehteduieehueetueduvddutdekudeffffffeeftdfhnecuffhomhgrihhnpeefvddrshhonecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepuggrnhhivghlhhgsgedufeesghhmrghilhdrtghomh
Received-SPF: pass client-ip=217.182.185.173; envelope-from=clg@kaod.org;
 helo=smtpout4.mo529.mail-out.ovh.net
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.063,
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 farosas@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/25/21 22:53, BALATON Zoltan wrote:
> On Sat, 25 Dec 2021, mario@locati.it wrote:
>> I have tried to launch a freshly compiled qemu from git master on a NXP T2080RDB devkit that has a e6500 CPU in combination with a freshly compiled kernel 5.16-rc6
>> I have Debian SID ppc64 up and running using such a kernel, and when I launch qemu to run a VM with the same debian sid for ppc64 and the same kernel using --enable-kvm I end up with a kernel panic

Thanks for testing,

>>
>> [....]
>> Run /sbin/init as init process
>> random: fast init done
>> systemd[1]: illegal instruction (4) at 3fff96562ac8 nip 3fff96562ac8 lr 3fff96562aa8 code 1 in libc-2.32.so[3fff96516000+1f7000]

debian ppc64 sid has a glibc 2.33 AFAICT

>> systemd[1]: code: 60000000 38600006 9122b7e8 4801bead 60000000 60000000 8122b7e8 2c090004
>> systemd[1]: code: 40820014 39200005 60000000 9122b7e8 <00000000> 60000000 8122b7e8 2c090005
> 
> Looks like it trips on a 0 opcode here in the middle of other values that look like valid code so I wonder how that 0 got there? Did something overwrite it before it tried to execute it? 

This looks like the abort() routine.

> If it always happens on the same address maybe you could try attaching gdb and put a watch point on that address to see what writes there, otherwise I don't know how to debug this.

Could you deduce the routine name from the nip ?

Thanks,

C.

