Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E8CC4AED15
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 09:50:15 +0100 (CET)
Received: from localhost ([::1]:56904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHig1-0003Zg-T7
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 03:50:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nHhhl-0003gc-Fj
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 02:48:07 -0500
Received: from 4.mo548.mail-out.ovh.net ([188.165.42.229]:45121)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nHhhI-0006oz-1O
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 02:47:48 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.163])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id BC66420FB8;
 Wed,  9 Feb 2022 07:46:26 +0000 (UTC)
Received: from kaod.org (37.59.142.105) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Wed, 9 Feb
 2022 08:46:25 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G00631783126-42ba-4eeb-a8da-124be7c89f8d,
 D657DFC387B0B0E2C5DD546C0716E11BBFCF4DEE) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 90.76.223.183
Message-ID: <0cce86e2-1efe-cf4a-2052-87f2b35c98ae@kaod.org>
Date: Wed, 9 Feb 2022 08:46:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH qemu] spapr/vof: Install rom and nvram binaries
Content-Language: en-US
To: Alexey Kardashevskiy <aik@ozlabs.ru>, <qemu-devel@nongnu.org>
References: <20220208103751.1587902-1-aik@ozlabs.ru>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220208103751.1587902-1-aik@ozlabs.ru>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG6EX2.mxp5.local (172.16.2.52) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: accac4ec-296d-459c-b43f-81475574c1e8
X-Ovh-Tracer-Id: 8165589077622361053
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrheekgddutdekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpefhhfelgeeukedtteffvdffueeiuefgkeekleehleetfedtgfetffefheeugeelheenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehqvghmuhdqphhptgesnhhonhhgnhhurdhorhhg
Received-SPF: pass client-ip=188.165.42.229; envelope-from=clg@kaod.org;
 helo=4.mo548.mail-out.ovh.net
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
Cc: qemu-ppc@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/8/22 11:37, Alexey Kardashevskiy wrote:
> This installs VOF-related binaries (the firmware and the preformatted
> NVRAM) as those were left out when the VOF was submitted initially.
> 
> Fixes: fc8c745d5015 ("spapr: Implement Open Firmware client interface")
> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> ---
>   pc-bios/meson.build | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/pc-bios/meson.build b/pc-bios/meson.build
> index 4ac7a5509b69..c86dedf7dff9 100644
> --- a/pc-bios/meson.build
> +++ b/pc-bios/meson.build
> @@ -81,6 +81,8 @@ blobs = files(
>     'opensbi-riscv32-generic-fw_dynamic.bin',
>     'opensbi-riscv64-generic-fw_dynamic.bin',
>     'npcm7xx_bootrom.bin',
> +  'vof.bin',
> +  'vof-nvram.bin',
>   )
>   
>   if get_option('install_blobs')
> 


Applied to ppc-7.0.

Thanks,

C.


