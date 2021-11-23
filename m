Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF78145B003
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 00:24:11 +0100 (CET)
Received: from localhost ([::1]:44806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpf90-00058H-Ax
	for lists+qemu-devel@lfdr.de; Tue, 23 Nov 2021 18:24:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mpf7M-0003lm-7L
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 18:22:28 -0500
Received: from 1.mo552.mail-out.ovh.net ([178.32.96.117]:41517)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mpf7J-0007Yj-J6
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 18:22:27 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.47])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 640AF20802;
 Tue, 23 Nov 2021 23:22:15 +0000 (UTC)
Received: from kaod.org (37.59.142.97) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Wed, 24 Nov
 2021 00:22:14 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G002c2356012-6f41-4a66-9a2b-5859de3a5665,
 91DCD1862618CD88E95BCEF119A98FE4AA8C2BE1) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <a6b4bfd8-099c-9e7a-0492-6df404167367@kaod.org>
Date: Wed, 24 Nov 2021 00:22:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 0/2] change IVSHMEM endianess to LITTLE_ENDIAN
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, <qemu-devel@nongnu.org>
References: <20211123211932.284043-1-danielhb413@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20211123211932.284043-1-danielhb413@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG1EX2.mxp5.local (172.16.2.2) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 5bfb3d3a-d869-4ba8-9575-22a058906471
X-Ovh-Tracer-Id: 8621860011640458208
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrgeejgddtlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpedtjeeffedvvedtffevjeeitdejgeeiueejhfffkeffgeeghedvleffuedvjeeftdenucffohhmrghinhepghhithhlrggsrdgtohhmnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdeljeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegurghvihgusehgihgsshhonhdrughrohhpsggvrghrrdhiugdrrghu
Received-SPF: pass client-ip=178.32.96.117; envelope-from=clg@kaod.org;
 helo=1.mo552.mail-out.ovh.net
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.515,
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

On 11/23/21 22:19, Daniel Henrique Barboza wrote:
> Hi,
> 
> This small series fixes an issue reported in Gitlab [1] that
> affects PowerPC big-endian and little-endian and probably all
> other big-endians in the wild that might use 'ivshmem'.
> 
> It's not clear to me who is the maintainer/responsible for this device
> (MAINTAINERS doesn't seem to have any 'ivhshmem' entries nor someone
> that looks upon all hw/misc/* files) so I didn't add any CC in that
> regard. 'qemu-ppc' is being copied for awareness since they are the
> folks that are most likely being impacted by the bug.
> 
> [1] https://gitlab.com/qemu-project/qemu/-/issues/168

Do we want these fixes for 6.2 ?

Thanks,

C.

> 
> Daniel Henrique Barboza (2):
>    ivshmem.c: change endianness to LITTLE_ENDIAN
>    ivshmem-test.c: enable test_ivshmem_server for ppc64 arch
> 
>   hw/misc/ivshmem.c          | 2 +-
>   tests/qtest/ivshmem-test.c | 5 +----
>   2 files changed, 2 insertions(+), 5 deletions(-)
> 


