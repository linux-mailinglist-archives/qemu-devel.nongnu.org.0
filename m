Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 525504D2A92
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Mar 2022 09:24:05 +0100 (CET)
Received: from localhost ([::1]:50944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRrc3-00071k-UH
	for lists+qemu-devel@lfdr.de; Wed, 09 Mar 2022 03:24:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nRrZv-0005bw-9N
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 03:21:51 -0500
Received: from smtpout4.mo529.mail-out.ovh.net ([217.182.185.173]:42501)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nRrZt-0004Ok-8y
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 03:21:50 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.17])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 2EEDCE7BE481;
 Wed,  9 Mar 2022 09:21:39 +0100 (CET)
Received: from kaod.org (37.59.142.95) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 9 Mar
 2022 09:21:38 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G001355f29fc-391f-4b29-935e-b56e5899f6b8,
 4C617328B094ABD9DFA4DE296C3C041D1A210FDA) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <03591944-78f4-b855-07e3-5fdf695bc26b@kaod.org>
Date: Wed, 9 Mar 2022 09:21:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 5/5] avocado/replay_kernel.py: make tcg-icount check in
 run_vm()
Content-Language: en-US
To: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>, Daniel Henrique Barboza
 <danielhb413@gmail.com>, <qemu-devel@nongnu.org>
References: <20220303153517.168943-1-danielhb413@gmail.com>
 <20220303153517.168943-6-danielhb413@gmail.com>
 <04d9a7d9-13c7-ee86-96c1-90bf8cf9173f@kaod.org>
 <63454050-add5-a22d-432f-be492a77ff72@ispras.ru>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <63454050-add5-a22d-432f-be492a77ff72@ispras.ru>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG9EX2.mxp5.local (172.16.2.82) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 0116e479-ed3a-4fca-aad7-d9de11ddab30
X-Ovh-Tracer-Id: 7175078632830634860
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddruddujedgudduiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeigedvffekgeeftedutddttdevudeihfegudffkeeitdekkeetkefhffelveelleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepphgrvhgvlhdrughovhhgrghluhhksehishhprhgrshdrrhhu
Received-SPF: pass client-ip=217.182.185.173; envelope-from=clg@kaod.org;
 helo=smtpout4.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: thuth@redhat.com, crosa@redhat.com, qemu-ppc@nongnu.org,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/9/22 05:59, Pavel Dovgalyuk wrote:
> On 07.03.2022 11:47, Cédric Le Goater wrote:
>> On 3/3/22 16:35, Daniel Henrique Barboza wrote:
>>> The icount framework relies on TCG availability. If QEMU is built with
>>> --disable-tcg we won't have icount either, and then this test will fail
>>> with the following message in an IBM POWER9 host:
>>>
>>> tests/avocado/replay_kernel.py:ReplayKernelNormal.test_ppc64_pseries:
>>> ERROR: ConnectError: Failed to establish session:
>>> (...)
>>> /11-tests_avocado_replay_kernel.py_ReplayKernelNormal.test_ppc64_pseries/replay.bin:
>>> cannot configure icount, TCG support not available
>>>
>>> Although this was revealed in a specific ppc64 scenario, the TCG check
>>> is being done in the common code inside run_vm() because all archs need
>>> TCG to have access to icount.
>>>
>>> Cc: Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>
>>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>>
>>
>> Reviewed-by: Cédric Le Goater <clg@kaod.org>
>>
>> Pavel,
>>
>> Should I take this patch through the ppc tree ?
> 
> Nobody has queued it yet, so I think it is ok.

Since these are fixes, I will at end of the week.

Thanks,

C.

