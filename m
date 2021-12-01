Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55829464B4E
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Dec 2021 11:11:22 +0100 (CET)
Received: from localhost ([::1]:57526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msMa7-00015o-TP
	for lists+qemu-devel@lfdr.de; Wed, 01 Dec 2021 05:11:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1msMYV-0008Vk-To; Wed, 01 Dec 2021 05:09:40 -0500
Received: from 1.mo548.mail-out.ovh.net ([178.32.121.110]:50603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1msMYT-0005yN-NV; Wed, 01 Dec 2021 05:09:39 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.35])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id B658720182;
 Wed,  1 Dec 2021 10:09:33 +0000 (UTC)
Received: from kaod.org (37.59.142.100) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Wed, 1 Dec
 2021 11:09:32 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R00382ccb381-0a6f-4faa-a94e-8f4a64279aee,
 A214034E9EDAB49BEA2160BF49F8C38F118F2259) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 90.11.56.15
Message-ID: <721c3bea-4ab8-7cf2-0465-fc10b754f498@kaod.org>
Date: Wed, 1 Dec 2021 11:09:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [RFC PATCH v2 4/4] tests/avocado: ppc: Add smoke tests for
 MPC7400 and MPC7450 families
Content-Language: en-US
To: Fabiano Rosas <farosas@linux.ibm.com>, <qemu-devel@nongnu.org>
References: <20211130230123.781844-1-farosas@linux.ibm.com>
 <20211130230123.781844-5-farosas@linux.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20211130230123.781844-5-farosas@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG2EX2.mxp5.local (172.16.2.12) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 9d4a0969-bc75-4716-802c-cf8017c62fc1
X-Ovh-Tracer-Id: 5322410338632108847
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrieefgdduudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpefhudevgeegudevgfelhfekkeehffeghfekjedvgeeuffdtkeeugfeghfefjeekudenucffohhmrghinhepnhhonhhgnhhurdhorhhgnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheprhhitghhrghrugdrhhgvnhguvghrshhonheslhhinhgrrhhordhorhhg
Received-SPF: pass client-ip=178.32.121.110; envelope-from=clg@kaod.org;
 helo=1.mo548.mail-out.ovh.net
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.211,
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
Cc: richard.henderson@linaro.org, danielhb413@gmail.com,
 mark.cave-ayland@ilande.co.uk, qemu-ppc@nongnu.org, openbios@openbios.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/1/21 00:01, Fabiano Rosas wrote:
> These tests ensure that our emulation for these cpus is not completely
> broken and we can at least run OpenBIOS on them.
> 
> $ make check-avocado AVOCADO_TESTS=../tests/avocado/ppc_74xx.py
> 
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
> Reviewed-by: Willian Rampazzo <willianr@redhat.com>
> ---
> Note that the 7450s depend on an OpenBIOS change adding support for
> their PVR:
> 
> https://lists.nongnu.org/archive/html/qemu-ppc/2021-11/msg00290.html


So we will have to merge the change in openbios first, and then update
openbios in QEMU before merging this patch.

These tests are really useful to track regression and it would be nice
to have a kernel to run because some CPU flavors behave differently under
Linux. It is good start anyhow.

Thanks,

C.

