Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35CF347E071
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 09:33:53 +0100 (CET)
Received: from localhost ([::1]:35960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0JXr-0004Vs-Dd
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 03:33:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n0JWn-0003f4-0l
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 03:32:45 -0500
Received: from smtpout3.mo529.mail-out.ovh.net ([46.105.54.81]:54455)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n0JWl-0006yt-5T
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 03:32:44 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.124])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 262BDD3965F0;
 Thu, 23 Dec 2021 09:32:38 +0100 (CET)
Received: from kaod.org (37.59.142.105) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Thu, 23 Dec
 2021 09:32:37 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G0063aff690d-7c66-4490-8530-df0ea502ede7,
 8CA006CF2B51D87471028670A5C113E20BDD9F51) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.66.77.115
Message-ID: <80acf463-a7a0-7a88-ca7f-7b52b5eaa397@kaod.org>
Date: Thu, 23 Dec 2021 09:32:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: =?UTF-8?Q?Re=3a_=5bPATCH=5d_Adding_C=c3=a9dric=27s_repos_in_MAINTAI?=
 =?UTF-8?Q?NERS_file=2e?=
Content-Language: en-US
To: <lagarcia@linux.ibm.com>, <qemu-ppc@nongnu.org>
References: <6387872fe9d16d32be0ec311e310d250e47fa97c.1638935436.git.lagarcia@br.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <6387872fe9d16d32be0ec311e310d250e47fa97c.1638935436.git.lagarcia@br.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG4EX2.mxp5.local (172.16.2.32) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 91941e16-16be-4d70-9463-f3076eb1cceb
X-Ovh-Tracer-Id: 3757690941304179619
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddruddtjedguddvvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeejkeekfeehfedvfeehgfejleevkeehieelheduveekfedvhfelteeivdfftddukeenucffohhmrghinhepghhithhlrggsrdgtohhmnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheplhgrghgrrhgtihgrsegsrhdrihgsmhdrtghomh
Received-SPF: pass client-ip=46.105.54.81; envelope-from=clg@kaod.org;
 helo=smtpout3.mo529.mail-out.ovh.net
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.264,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Leonardo Garcia <lagarcia@br.ibm.com>, danielhb413@gmail.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

On 12/8/21 04:52, lagarcia@linux.ibm.com wrote:
> From: Leonardo Garcia <lagarcia@br.ibm.com>
> 
> Signed-off-by: Leonardo Garcia <lagarcia@br.ibm.com>

Here is a description of the branches I have put in place over the years
for aspeed and powernv machines on github:

   <topic>-<prev>         prev stable branch

   <topic>                dev branch
   <topic>-<current>      current staging branch (I should call it -staging)
   <topic>-next           frozen staging branch
   <topic>-for-upstream   pull request branch (created on demand)

gitlab replicates but for test purposes only.

I haven't formalized yet ppc but it should more or less be the same.
Thanks for reminding me. I will update when this is clear.

Thanks,

C.

> ---
>   MAINTAINERS | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7543eb4d59..52c6b99763 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -273,6 +273,7 @@ F: hw/ppc/ppc.c
>   F: hw/ppc/ppc_booke.c
>   F: include/hw/ppc/ppc.h
>   F: disas/ppc.c
> +T: git https://gitlab.com/legoater/qemu.git
>   
>   RISC-V TCG CPUs
>   M: Palmer Dabbelt <palmer@dabbelt.com>
> @@ -390,6 +391,7 @@ R: David Gibson <david@gibson.dropbear.id.au>
>   R: Greg Kurz <groug@kaod.org>
>   S: Maintained
>   F: target/ppc/kvm.c
> +T: git https://gitlab.com/legoater/qemu.git
>   
>   S390 KVM CPUs
>   M: Halil Pasic <pasic@linux.ibm.com>
> @@ -1343,6 +1345,7 @@ F: tests/qtest/libqos/*spapr*
>   F: tests/qtest/rtas*
>   F: tests/qtest/libqos/rtas*
>   F: tests/avocado/ppc_pseries.py
> +T: git https://gitlab.com/legoater/qemu.git
>   
>   PowerNV (Non-Virtualized)
>   M: Cédric Le Goater <clg@kaod.org>
> @@ -1356,6 +1359,7 @@ F: include/hw/ppc/pnv*
>   F: include/hw/pci-host/pnv*
>   F: pc-bios/skiboot.lid
>   F: tests/qtest/pnv*
> +T: git https://gitlab.com/legoater/qemu.git powernv-next
>   
>   virtex_ml507
>   M: Edgar E. Iglesias <edgar.iglesias@gmail.com>
> @@ -1399,6 +1403,7 @@ F: hw/ppc/vof*
>   F: include/hw/ppc/vof*
>   F: pc-bios/vof/*
>   F: pc-bios/vof*
> +T: git https://gitlab.com/legoater/qemu.git
>   
>   RISC-V Machines
>   ---------------
> @@ -2244,6 +2249,7 @@ S: Supported
>   F: hw/*/*xive*
>   F: include/hw/*/*xive*
>   F: docs/*/*xive*
> +T: git https://gitlab.com/legoater/qemu.git
>   
>   Renesas peripherals
>   R: Yoshinori Sato <ysato@users.sourceforge.jp>
> 


