Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1AF847C939
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 23:32:20 +0100 (CET)
Received: from localhost ([::1]:58356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzngB-00039z-Cf
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 17:32:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mznen-0002Nz-BG
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 17:30:53 -0500
Received: from 9.mo548.mail-out.ovh.net ([46.105.48.137]:55211)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mzned-0008GH-L0
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 17:30:50 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.141])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id DA325202E2;
 Tue, 21 Dec 2021 22:30:30 +0000 (UTC)
Received: from kaod.org (37.59.142.104) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Tue, 21 Dec
 2021 23:30:30 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R005cdce0feb-a4c2-4793-98d6-a21997dced3e,
 742E9276A26BC2B4C6C283707E5EBA255AB8FB31) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <b7c50c1b-16f2-3fdd-dbd7-944ddf150947@kaod.org>
Date: Tue, 21 Dec 2021 23:30:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: powernv gitlab ci regression
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, Richard Henderson
 <richard.henderson@linaro.org>, qemu-devel <qemu-devel@nongnu.org>,
 <clombard@linux.vnet.ibm.com>
References: <461a77d6-a5d2-0ba1-de95-bc8cfa5fb83b@linaro.org>
 <9f1947e0-86d8-60e4-87bf-f4a5ec0d6ea8@gmail.com>
 <a9031035-5623-d0ec-1e68-7f1371a4ee87@kaod.org>
 <b454cba4-7254-fbe6-0235-8a0778f2938d@gmail.com>
 <8ab3b465-dfec-8579-2b96-e0383f9bcc6f@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <8ab3b465-dfec-8579-2b96-e0383f9bcc6f@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.104]
X-ClientProxiedBy: DAG5EX2.mxp5.local (172.16.2.42) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: c694cdab-6866-499b-892c-12ea8bdfca6e
X-Ovh-Tracer-Id: 6162613144280665056
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddruddtgedgudeifecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeigedvffekgeeftedutddttdevudeihfegudffkeeitdekkeetkefhffelveelleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegtlhhomhgsrghrugeslhhinhhugidrvhhnvghtrdhisghmrdgtohhm
Received-SPF: pass client-ip=46.105.48.137; envelope-from=clg@kaod.org;
 helo=9.mo548.mail-out.ovh.net
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.012,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> Just rewrote the fore-mentioned patch using TCG ops. Here's some numbers running the tests on
> my local machine:
> 
> - using current master:
> 
>   (1/1) tests/avocado/boot_linux_console.py:BootLinuxConsole.test_ppc_powernv8: PASS (71.00 s)
>   (1/1) tests/avocado/boot_linux_console.py:BootLinuxConsole.test_ppc_powernv8: PASS (69.57 s)
>   (1/1) tests/avocado/boot_linux_console.py:BootLinuxConsole.test_ppc_powernv8: PASS (76.04 s)
> 
> 
>   (1/1) tests/avocado/boot_linux_console.py:BootLinuxConsole.test_ppc_powernv9: PASS (72.62 s)
>   (1/1) tests/avocado/boot_linux_console.py:BootLinuxConsole.test_ppc_powernv9: PASS (76.50 s)
>   (1/1) tests/avocado/boot_linux_console.py:BootLinuxConsole.test_ppc_powernv9: PASS (73.58 s)
> 
> 
> - after my TCG Ops rewrite to count instructions:
> 
> 
>   (1/1) tests/avocado/boot_linux_console.py:BootLinuxConsole.test_ppc_powernv8: PASS (39.97 s)
>   (1/1) tests/avocado/boot_linux_console.py:BootLinuxConsole.test_ppc_powernv8: PASS (40.19 s)
>   (1/1) tests/avocado/boot_linux_console.py:BootLinuxConsole.test_ppc_powernv8: PASS (41.76 s)
> 
>   (1/1) tests/avocado/boot_linux_console.py:BootLinuxConsole.test_ppc_powernv9: PASS (40.88 s)
>   (1/1) tests/avocado/boot_linux_console.py:BootLinuxConsole.test_ppc_powernv9: PASS (41.49 s)
>   (1/1) tests/avocado/boot_linux_console.py:BootLinuxConsole.test_ppc_powernv9: PASS (42.04 s)
> 
> 
> Also, there's a high possibility that the code I wrote is not optimized since I'm not well
> versed with TCG ops/code. I expect that after a couple of reviews from Richard we might be able
> to bring down those numbers even further.

This is behaving like 6.2. We should be fine (until we add more counters :)
   
> I'll clean this up and send for review.
ok. We might have a last ppc PR in 2021.

Thanks a lot,

C.


