Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 664715888C2
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Aug 2022 10:39:45 +0200 (CEST)
Received: from localhost ([::1]:50782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJ9uq-0006KB-9c
	for lists+qemu-devel@lfdr.de; Wed, 03 Aug 2022 04:39:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oJ9oR-00027l-0l
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 04:33:07 -0400
Received: from 1.mo548.mail-out.ovh.net ([178.32.121.110]:38103)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oJ9oO-0007JZ-88
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 04:33:06 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.243])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 0DA6E2180D;
 Wed,  3 Aug 2022 08:32:59 +0000 (UTC)
Received: from kaod.org (37.59.142.100) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Wed, 3 Aug 2022
 10:32:57 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R0033f56bb9d-40df-40cf-a253-e7c77752e58b,
 CC7AE06ED68251E997EA4638F74AFDA4D8EEB002) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <ff945e61-b647-c982-9af6-1c4a86650aac@kaod.org>
Date: Wed, 3 Aug 2022 10:32:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [RFC 0/1] SPI support in QEMU TPM
Content-Language: en-US
To: Iris Chen <irischenlj@gmail.com>
CC: <irischenlj@fb.com>, <peter@pjd.dev>, <pdel@fb.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <patrick@stwcx.xyz>,
 <alistair@alistair23.me>, <kwolf@redhat.com>, <hreitz@redhat.com>,
 <peter.maydell@linaro.org>, <andrew@aj.id.au>, <joel@jms.id.au>,
 <thuth@redhat.com>, <lvivier@redhat.com>, <pbonzini@redhat.com>,
 <qemu-block@nongnu.org>, <dz4list@gmail.com>, Stefan Berger
 <stefanb@linux.ibm.com>
References: <20220803023241.63739-1-irischenlj@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220803023241.63739-1-irischenlj@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG1EX2.mxp5.local (172.16.2.2) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 60177f34-f9af-45dc-a1c0-3d64977270a9
X-Ovh-Tracer-Id: 3655234048092572429
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrvddvjedgtdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeekteejtdelkeejvdevffduhfetteelieefgeefffeugffhfeekheffueefledujeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddttdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehsthgvfhgrnhgssehlihhnuhigrdhisghmrdgtohhmpdfovfetjfhoshhtpehmohehgeek
Received-SPF: pass client-ip=178.32.121.110; envelope-from=clg@kaod.org;
 helo=1.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

[ Adding Stefan, TPM maintainer ]

On 8/3/22 04:32, Iris Chen wrote:
> From: Iris Chen <irischenlj@fb.com>
> 
> Hey everyone,
> 
> Thanks for all your comments on the SPI GPIO model. I am working through them.
> 
> As for adding support for SPI-based TPMs in QEMU, this RFC patch adds SPI
> support in the QEMU TPM implementation via tpm_tis_spi.c.
> 
> The QEMU tree already has support for two connection methods to the TPM:
> mmio (isa for x86, sysbus for arm) and “spapr”. This patch adds a new SPI
> bus implementation for the TPM. Specifically, this SPI bus implementation
> connects to the Yosemite-v3.5 model using the SPI-GPIO model sent earlier
> last week. I have already tested these implementations locally together
> and can verify that the Linux kernel can successfully probe the TPM device
> on Yosemite-v3.5 and we can run the TPM command line tools to interact with it.
> 
> Please let me know what you think about this!
> 
> Thanks,
> Iris
> 
> Iris Chen (1):
>    hw: tpmtisspi: add SPI support to QEMU TPM implementation
> 
>   configs/devices/arm-softmmu/default.mak |   1 +
>   hw/arm/Kconfig                          |   5 +
>   hw/tpm/Kconfig                          |   5 +
>   hw/tpm/meson.build                      |   1 +
>   hw/tpm/tpm_tis_spi.c                    | 311 ++++++++++++++++++++++++
>   include/sysemu/tpm.h                    |   3 +
>   6 files changed, 326 insertions(+)
>   create mode 100644 hw/tpm/tpm_tis_spi.c
> 
> --
> 2.30.2


