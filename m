Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C918B45412E
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 07:47:25 +0100 (CET)
Received: from localhost ([::1]:37698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnEj6-0004Jh-Hz
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 01:47:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mnEdN-0001dA-LI
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 01:41:31 -0500
Received: from 6.mo552.mail-out.ovh.net ([188.165.49.222]:55771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mnEdH-0002oi-Cp
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 01:41:29 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.164])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 215A521580;
 Wed, 17 Nov 2021 06:41:16 +0000 (UTC)
Received: from kaod.org (37.59.142.103) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Wed, 17 Nov
 2021 07:41:15 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G00523028bcd-2238-433e-852b-fb187bf5174d,
 6BDA4A3F9269C8E5581A3C4EE5F64AFAFECCD473) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <ad8687ad-31b4-a5aa-4133-252743321427@kaod.org>
Date: Wed, 17 Nov 2021 07:41:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [SPAM] [RESEND PATCH 1/3] docs: aspeed: Add new boards
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>, Peter Maydell <peter.maydell@linaro.org>
References: <20211117010947.297540-1-joel@jms.id.au>
 <20211117010947.297540-2-joel@jms.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20211117010947.297540-2-joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG6EX1.mxp5.local (172.16.2.51) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 74f03db8-1c7c-4f2a-9332-b9cb95b1fba0
X-Ovh-Tracer-Id: 11820823125521107875
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrfeefgdeljecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpefhhfelgeeukedtteffvdffueeiuefgkeekleehleetfedtgfetffefheeugeelheenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhg
Received-SPF: pass client-ip=188.165.49.222; envelope-from=clg@kaod.org;
 helo=6.mo552.mail-out.ovh.net
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.009,
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/17/21 02:09, Joel Stanley wrote:
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>   docs/system/arm/aspeed.rst | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/docs/system/arm/aspeed.rst b/docs/system/arm/aspeed.rst
> index cec87e3743d0..b091c0c61dec 100644
> --- a/docs/system/arm/aspeed.rst
> +++ b/docs/system/arm/aspeed.rst
> @@ -14,6 +14,7 @@ AST2400 SoC based machines :
>   
>   - ``palmetto-bmc``         OpenPOWER Palmetto POWER8 BMC
>   - ``quanta-q71l-bmc``      OpenBMC Quanta BMC
> +- ``supermicrox11-bmc``    Supermicro X11 BMC
>   
>   AST2500 SoC based machines :
>   
> @@ -22,11 +23,14 @@ AST2500 SoC based machines :
>   - ``witherspoon-bmc``      OpenPOWER Witherspoon POWER9 BMC
>   - ``sonorapass-bmc``       OCP SonoraPass BMC
>   - ``swift-bmc``            OpenPOWER Swift BMC POWER9

That reminds me that this board is scheduled for removal in 7.0

> +- ``fp5280g2-bmc``         Inspur FP5280G2 BMC
> +- ``g220a-bmc``            Bytedance G220A BMC
>   
>   AST2600 SoC based machines :
>   
>   - ``ast2600-evb``          Aspeed AST2600 Evaluation board (Cortex-A7)
>   - ``tacoma-bmc``           OpenPOWER Witherspoon POWER9 AST2600 BMC
> +- ``rainier-bmc``          IBM Rainier BMC

May be we should add POWER10 in the description ^

and we merged the Fuji BMC also.

Thanks,

C.

>   
>   Supported devices
>   -----------------
> 


