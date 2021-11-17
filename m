Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 070DA45413C
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 07:49:58 +0100 (CET)
Received: from localhost ([::1]:42752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnElZ-0007z1-41
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 01:49:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mnEjW-0006JP-En
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 01:47:50 -0500
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:60931)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mnEjT-0003yY-BG
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 01:47:50 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.114])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 93984CC006EC;
 Wed, 17 Nov 2021 07:47:44 +0100 (CET)
Received: from kaod.org (37.59.142.95) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Wed, 17 Nov
 2021 07:47:43 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G001c79d167c-1d6d-4ac3-8f0a-a189194091bf,
 6BDA4A3F9269C8E5581A3C4EE5F64AFAFECCD473) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <662d5a80-967d-fbb5-2ea9-a750036f7fd0@kaod.org>
Date: Wed, 17 Nov 2021 07:47:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [SPAM] [RESEND PATCH 3/3] docs: aspeed: Give an example of
 booting a kernel
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>, Peter Maydell <peter.maydell@linaro.org>
References: <20211117010947.297540-1-joel@jms.id.au>
 <20211117010947.297540-4-joel@jms.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20211117010947.297540-4-joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG7EX1.mxp5.local (172.16.2.61) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: be29c3b7-fdfc-456d-b93b-e116a56c57fe
X-Ovh-Tracer-Id: 11930035413495483299
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrfeefgdelkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeehgfehvdfhteekuddtfeefffeihfeihfevjeevtddttdehvdehteekgeegkedtjeenucffohhmrghinhepohhpvghnsghmtgdrohhrghdpghhithhhuhgsrdgtohhmnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhg
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.009,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/17/21 02:09, Joel Stanley wrote:
> A common use case for the ASPEED machine is to boot a Linux kernel.
> Provide a full example command line.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks

C.


> ---
>   docs/system/arm/aspeed.rst | 15 ++++++++++++---
>   1 file changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/docs/system/arm/aspeed.rst b/docs/system/arm/aspeed.rst
> index 4bed7b5221b4..de408b0364ea 100644
> --- a/docs/system/arm/aspeed.rst
> +++ b/docs/system/arm/aspeed.rst
> @@ -77,9 +77,9 @@ Missing devices
>   Boot options
>   ------------
>   
> -The Aspeed machines can be started using the ``-kernel`` option to
> -load a Linux kernel or from a firmware. Images can be downloaded from
> -the OpenBMC jenkins :
> +The Aspeed machines can be started using the ``-kernel`` and ``-dtb`` options
> +to load a Linux kernel or from a firmware. Images can be downloaded from the
> +OpenBMC jenkins :
>   
>      https://jenkins.openbmc.org/job/ci-openbmc/lastSuccessfulBuild/
>   
> @@ -87,6 +87,15 @@ or directly from the OpenBMC GitHub release repository :
>   
>      https://github.com/openbmc/openbmc/releases
>   
> +To boot a kernel directly from a Linux build tree:
> +
> +.. code-block:: bash
> +
> +  $ qemu-system-arm -M ast2600-evb -nographic \
> +        -kernel arch/arm/boot/zImage \
> +        -dtb arch/arm/boot/dts/aspeed-ast2600-evb.dtb \
> +        -initrd rootfs.cpio
> +
>   The image should be attached as an MTD drive. Run :
>   
>   .. code-block:: bash
> 


