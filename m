Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B947851923B
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 01:18:55 +0200 (CEST)
Received: from localhost ([::1]:42440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nm1nC-0005jb-8f
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 19:18:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nm0At-0004dL-E1
 for qemu-devel@nongnu.org; Tue, 03 May 2022 17:35:17 -0400
Received: from 9.mo552.mail-out.ovh.net ([87.98.180.222]:43849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nm0Ar-00037B-CD
 for qemu-devel@nongnu.org; Tue, 03 May 2022 17:35:14 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.59])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 2115F21A9E;
 Tue,  3 May 2022 21:35:10 +0000 (UTC)
Received: from kaod.org (37.59.142.99) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.6; Tue, 3 May 2022
 23:35:09 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-99G003ec5e8385-9973-4a7f-babe-a3f4fcd3f5d3,
 F6B89E566DA044E9E2FB2CFEBB669705F2CEA7ED) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.66.77.115
Message-ID: <f0143ab9-54e9-09cd-d203-e779f9d8d6e4@kaod.org>
Date: Tue, 3 May 2022 23:35:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 0/1] hw/arm/aspeed: Add fby35 machine type
Content-Language: en-US
To: Peter Delevoryas <pdel@fb.com>
CC: <patrick@stwcx.xyz>, <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
References: <20220503204451.1257898-1-pdel@fb.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220503204451.1257898-1-pdel@fb.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.99]
X-ClientProxiedBy: DAG1EX2.mxp5.local (172.16.2.2) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 7a533747-c8ca-48d1-a498-cec74f481e28
X-Ovh-Tracer-Id: 11533155696763964384
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrvdekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeelleeiiefgkeefiedtvdeigeetueetkeffkeelheeugfetteegvdekgfehgffgkeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrgh
Received-SPF: pass client-ip=87.98.180.222; envelope-from=clg@kaod.org;
 helo=9.mo552.mail-out.ovh.net
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

On 5/3/22 22:44, Peter Delevoryas wrote:
> Hey everyone,
> 
> I'm submitting another Facebook (Meta Platforms) machine type: this time I'm
> including an acceptance test too.
> 
> Unfortunately, this machine boots _very_ slowly. 300+ seconds. 

This is too much for avocado tests.

> I'm not sure why this is (so I don't know how to fix it easily)

The fuji has the same kind of problem. It takes ages to load the lzma ramdisk.
Could it be a modeling issue ? or how the FW image is compiled ?

Thanks,

C.


> and I don't know how to override
> the avocado test timeout just for a single test, so I increased the global
> timeout for all "boot_linux_console.py" tests from 90s to 400s. I doubt this is
> acceptable, but what other option is there? Should I add
> AVOCADO_TIMEOUT_EXPECTED?
> 
> @skipUnless(os.getenv('AVOCADO_TIMEOUT_EXPECTED'), 'Test might timeout')
> 
> What is the point of this environment variable though, except to skip it in CIT?
> If I run the test with this environment variable defined, it doesn't disable the
> timeout, it just skips it right? I want an option to run this test with a larger
> timeout.
> 
> Thanks,
> Peter
> 
> Peter Delevoryas (1):
>    hw/arm/aspeed: Add fby35 machine type
> 
>   hw/arm/aspeed.c                     | 63 +++++++++++++++++++++++++++++
>   tests/avocado/boot_linux_console.py | 20 ++++++++-
>   2 files changed, 82 insertions(+), 1 deletion(-)
> 


