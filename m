Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 172C7483DF2
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 09:19:26 +0100 (CET)
Received: from localhost ([::1]:47342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4f2T-0002tp-6D
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 03:19:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n4ePi-00031x-Nh
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 02:39:26 -0500
Received: from 8.mo552.mail-out.ovh.net ([46.105.37.156]:38681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n4ePf-00013P-KO
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 02:39:21 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.171])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id DBDF2212E1;
 Tue,  4 Jan 2022 07:39:17 +0000 (UTC)
Received: from kaod.org (37.59.142.106) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Tue, 4 Jan
 2022 08:39:17 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R0068b637307-e9f4-40c9-acf1-8ab058e9f514,
 DC41CA294A1AC0AE13D8E7EBC58C249E9ADF812E) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <8a60aa3a-935a-70be-f9d5-eeb04687da0b@kaod.org>
Date: Tue, 4 Jan 2022 08:39:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 00/17] ppc/pnv: enable pnv-phb4 user devices
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, <qemu-devel@nongnu.org>
References: <20211228193806.1198496-1-danielhb413@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20211228193806.1198496-1-danielhb413@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.106]
X-ClientProxiedBy: DAG6EX1.mxp5.local (172.16.2.51) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 2590778f-2eb3-4731-b589-b96e4ef0c8b5
X-Ovh-Tracer-Id: 17988784287805508576
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrudefvddguddtiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeehhfeuuedukeetkefhvdduteelffehueegvdettefgjefgfedttdegtefgjeeiueenucffohhmrghinhepghhithhhuhgsrdgtohhmpdhgnhhurdhorhhgnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepuggrvhhiugesghhisghsohhnrdgurhhophgsvggrrhdrihgurdgruh
Received-SPF: pass client-ip=46.105.37.156; envelope-from=clg@kaod.org;
 helo=8.mo552.mail-out.ovh.net
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.354,
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
Cc: qemu-ppc@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/28/21 20:37, Daniel Henrique Barboza wrote:
> Hi,
> 
> This series implements pnv-phb4 user devices for the powernv9 machine.
> It also includes a couple of pnv-phb3 and pnv-phb3-root-port fixes that
> were also applied for the pnv4 equivalents.
> 
> During the enablement I had to rollback from the previously added
> support for user creatable pnv-phb4-pec devices. The most important
> reason is user experience. PEC devices that doesn't spawn the PHB
> devices will be just a placeholder to add PHBs, having no use of their
> own as far as the user sees it. From this standpoint it makes more sense
> to just create all PECs and attach the PHBs the user wants on them.
> Patch 14 also describes technical reasons to rollback this support.
> 
> The series is rebased using Cedric's 'powernv-6.2' branch [1]i, which
> includes the '[PATCH 0/5] ppc/pnv: Preliminary cleanups before user
> created PHBs' patches [2].
> 
> [1] https://github.com/legoater/qemu/tree/powernv-6.2
> [2] https://lists.gnu.org/archive/html/qemu-devel/2021-12/msg03810.html


Applied patches 2-16 in ppc-next.

Thanks,

C.

