Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 159CD4A0263
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 21:58:14 +0100 (CET)
Received: from localhost ([::1]:51180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDYJw-0003nk-TZ
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 15:58:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nDXrO-0008Ga-LR
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 15:28:42 -0500
Received: from 4.mo552.mail-out.ovh.net ([178.33.43.201]:44849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nDXrM-00017V-BD
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 15:28:42 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.186])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id E1DF32060B;
 Fri, 28 Jan 2022 20:28:30 +0000 (UTC)
Received: from kaod.org (37.59.142.101) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Fri, 28 Jan
 2022 21:28:30 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G004f0ff37a6-9653-42a8-a683-e3467a3f2a8a,
 25116B600FA9B488C253496EC78095CF85B5B260) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 90.89.155.142
Message-ID: <cb0d7e80-aee2-9eb3-0ac4-8cec07032a96@kaod.org>
Date: Fri, 28 Jan 2022 21:28:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] target/ppc: Remove support for the PowerPC 602 CPU
Content-Language: en-US
To: =?UTF-8?Q?V=c3=adctor_Colombo?= <victor.colombo@eldorado.org.br>,
 <qemu-ppc@nongnu.org>, <qemu-devel@nongnu.org>
References: <20220128131227.199226-1-clg@kaod.org>
 <48832eff-fc37-86f6-842c-43b75fbe83be@eldorado.org.br>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <48832eff-fc37-86f6-842c-43b75fbe83be@eldorado.org.br>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG8EX2.mxp5.local (172.16.2.72) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: a0b0f772-af91-462a-8428-e45f997f86d0
X-Ovh-Tracer-Id: 5903656163936209702
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrfeehgddufeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepieegvdffkeegfeetuddttddtveduiefhgeduffekiedtkeekteekhfffleevleelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepghhrohhugheskhgrohgurdhorhhg
Received-SPF: pass client-ip=178.33.43.201; envelope-from=clg@kaod.org;
 helo=4.mo552.mail-out.ovh.net
X-Spam_score_int: 10
X-Spam_score: 1.0
X-Spam_bar: +
X-Spam_report: (1.0 / 5.0 requ) NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 TVD_SUBJ_WIPE_DEBT=1.004,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, Greg Kurz <groug@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/28/22 15:13, Víctor Colombo wrote:
> On 28/01/2022 10:12, Cédric Le Goater wrote:
>> The 602 was derived from the PowerPC 603, for the gaming market it
>> seems. It was hardly used and no firmware supporting the CPU could be
>> found. Drop support.
>>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> 
> Hello Cédric! I am having problems building QEMU with this patch
> applied. Tried on both master and legoater/ppc-7.0. I think you forgot
> one reference to PPC_602_SPEC on cpu.h:
> 
>   #define PPC_TCG_INSNS  (PPC_INSNS_BASE | PPC_POWER | PPC_POWER2 \
>                           | PPC_POWER_RTC | PPC_POWER_BR | PPC_64B \
>                           | PPC_64BX | PPC_64H | PPC_WAIT | PPC_MFTB \
> -                        | PPC_602_SPEC | PPC_ISEL | PPC_POPCNTB \
> +                        | PPC_ISEL | PPC_POPCNTB \
>                           | PPC_STRING | PPC_FLOAT | PPC_FLOAT_EXT \
>                           | PPC_FLOAT_FSQRT | PPC_FLOAT_FRES \
>                           | PPC_FLOAT_FRSQRTE | PPC_FLOAT_FRSQRTES \
> 
> 
> Could you take a look at it please? Thanks!

Yes :/ Thanks for checking.

C.


