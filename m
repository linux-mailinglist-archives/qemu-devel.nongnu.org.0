Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F791491FB1
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 08:13:43 +0100 (CET)
Received: from localhost ([::1]:48638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9igY-0001Gm-Ji
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 02:13:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n9iUf-0007iY-Pu
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 02:01:31 -0500
Received: from 4.mo552.mail-out.ovh.net ([178.33.43.201]:40623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n9iUd-0007Xg-Ju
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 02:01:25 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.66])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 229F321676;
 Tue, 18 Jan 2022 07:01:21 +0000 (UTC)
Received: from kaod.org (37.59.142.105) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 18 Jan
 2022 08:01:20 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G0065113f3d0-43ad-42cc-b2e2-6d66373e1d96,
 78124C4340FA50D00486B2609A05927D7A7C6ABE) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <037a8ade-122a-3f02-4a7e-42d04af39c33@kaod.org>
Date: Tue, 18 Jan 2022 08:01:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 3/3] Link new ppc-spapr-uv-hcalls.rst to pseries.rst.
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, <lagarcia@linux.ibm.com>, 
 <qemu-ppc@nongnu.org>
References: <cover.1642446868.git.lagarcia@br.ibm.com>
 <a24d2c260442e44aa99d4c18b1717f2f4a73529a.1642446876.git.lagarcia@br.ibm.com>
 <e08c04ee-012f-0310-8bf3-d9f939e83356@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <e08c04ee-012f-0310-8bf3-d9f939e83356@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG4EX2.mxp5.local (172.16.2.32) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 64634398-ba79-4057-8146-edd4b2125dce
X-Ovh-Tracer-Id: 7332141669253614499
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddruddvgddutddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhephffhleegueektdetffdvffeuieeugfekkeelheelteeftdfgtefffeehueegleehnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhgrghgrrhgtihgrsegsrhdrihgsmhdrtghomh
Received-SPF: pass client-ip=178.33.43.201; envelope-from=clg@kaod.org;
 helo=4.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Cc: Leonardo Garcia <lagarcia@br.ibm.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/17/22 21:53, Daniel Henrique Barboza wrote:
> 
> 
> On 1/17/22 16:19, lagarcia@linux.ibm.com wrote:
>> From: Leonardo Garcia <lagarcia@br.ibm.com>
>>
>> Signed-off-by: Leonardo Garcia <lagarcia@br.ibm.com>
>> ---
> 
> It is worth noticing that this patch applies cleanly only if the
> 
> "[PATCH 0/3] rSTify ppc-spapr-hotplug.txt" [1]
> 
> series is applied first. The reason is that docs/system/ppc/pseries.rst being changed
> here already has the ppc-spapr-hotplug.rst link.

yes. That's fine. I have queued the first series already.

Thanks,

C.

