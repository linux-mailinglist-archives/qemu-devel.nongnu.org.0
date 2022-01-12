Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B3F48C5AA
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 15:14:56 +0100 (CET)
Received: from localhost ([::1]:44286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7eOs-00074c-98
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 09:14:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n7d0V-0003jy-Hm
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 07:45:41 -0500
Received: from 10.mo548.mail-out.ovh.net ([46.105.77.235]:51653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n7d0H-00079j-Mg
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 07:45:28 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.11])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 0134B21604;
 Wed, 12 Jan 2022 12:45:07 +0000 (UTC)
Received: from kaod.org (37.59.142.105) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Wed, 12 Jan
 2022 13:45:07 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G00695858d33-4730-4bc6-9c91-d98367ec80c7,
 C5437DA5DF8DB845CC48CAA380855665EAA33ED7) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <dcda4d71-d6a1-f45a-f465-8ec881dc2b7a@kaod.org>
Date: Wed, 12 Jan 2022 13:45:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v3 0/2] Aspeed I3C device model
Content-Language: en-US
To: Graeme Gregory <quic_ggregory@quicinc.com>, Troy Lee
 <troy_lee@aspeedtech.com>
References: <20220111084546.4145785-1-troy_lee@aspeedtech.com>
 <20220112105704.ovkq5yxl6phzeqi3@ggregory-linuxws>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220112105704.ovkq5yxl6phzeqi3@ggregory-linuxws>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG6EX2.mxp5.local (172.16.2.52) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 5aa8d422-6245-410c-9a2d-62350ebe5a6d
X-Ovh-Tracer-Id: 14795169201292217251
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrtddugddukecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeekfeeiudekhfeujeetffevtdfhhfekheehhfdtjeekfeehieefjedvgfffgfeifeenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohephhgrihhlihhnrdifuhesrghsphgvvgguthgvtghhrdgtohhm
Received-SPF: pass client-ip=46.105.77.235; envelope-from=clg@kaod.org;
 helo=10.mo548.mail-out.ovh.net
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
Cc: leetroy@gmail.com, qemu-devel@nongnu.org, hailin.wu@aspeedtech.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello Gregory,

On 1/12/22 11:57, Graeme Gregory wrote:
> On Tue, Jan 11, 2022 at 04:45:44PM +0800, Troy Lee wrote:
>> This series of patch introduce a dummy implemenation of aspeed i3c
>> model, and it provide just enough information for guest machine.
>> However, the driver probing is still failed, but it will not cause
>> kernel panic.
>>
> 
> These patches arrived just in time for our i3c testing. This stops
> our CI halting due to kernel panic on i3c probing.
> 
> Reviewed-by: Graeme Gregory <quic_ggregory@quicinc.com>
> Tested-by: Graeme Gregory <quic_ggregory@quicinc.com>

Excellent !

Are you using the Aspeed image from :

  https://github.com/AspeedTech-BMC/openbmc/releases/tag/v07.02

or your custom ones ?

Thanks,

C.

