Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4533345422C
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 08:55:26 +0100 (CET)
Received: from localhost ([::1]:39250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnFmu-0005Ev-VG
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 02:55:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mnFlH-0004KS-QL
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 02:53:43 -0500
Received: from 2.mo552.mail-out.ovh.net ([178.33.105.233]:50545)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mnFlF-0004pB-4o
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 02:53:43 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.118])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 9270E21592;
 Wed, 17 Nov 2021 07:53:38 +0000 (UTC)
Received: from kaod.org (37.59.142.97) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Wed, 17 Nov
 2021 08:53:37 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G002dce578e4-617e-48dc-a2ef-82cf2323b240,
 6BDA4A3F9269C8E5581A3C4EE5F64AFAFECCD473) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <e5c54c0a-4f7f-1653-9538-3d008cde2cfc@kaod.org>
Date: Wed, 17 Nov 2021 08:53:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [SPAM] [PATCH v2 1/4] docs: aspeed: Add new boards
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>, Peter Maydell <peter.maydell@linaro.org>
References: <20211117065752.330632-1-joel@jms.id.au>
 <20211117065752.330632-2-joel@jms.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20211117065752.330632-2-joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG6EX2.mxp5.local (172.16.2.52) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 87bb057a-becf-485a-92cf-f3b88a39b89e
X-Ovh-Tracer-Id: 13042987472296577955
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrfeefgdduudduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepieegvdffkeegfeetuddttddtveduiefhgeduffekiedtkeekteekhfffleevleelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdeljeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhg
Received-SPF: pass client-ip=178.33.105.233; envelope-from=clg@kaod.org;
 helo=2.mo552.mail-out.ovh.net
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.009,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 11/17/21 07:57, Joel Stanley wrote:
> Add X11, FP5280G2, G220A, Rainier and Fuji. Mention that Swift will be
> removed in v7.0.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>


Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks

C.


> ---
> v2:
>   - Add POWER10 to Rainier description
>   - Include Fuji
>   - Mention Swift to be removed
> ---
>   docs/system/arm/aspeed.rst | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/docs/system/arm/aspeed.rst b/docs/system/arm/aspeed.rst
> index cec87e3743d0..41a9bd5608e8 100644
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
> @@ -21,12 +22,16 @@ AST2500 SoC based machines :
>   - ``romulus-bmc``          OpenPOWER Romulus POWER9 BMC
>   - ``witherspoon-bmc``      OpenPOWER Witherspoon POWER9 BMC
>   - ``sonorapass-bmc``       OCP SonoraPass BMC
> -- ``swift-bmc``            OpenPOWER Swift BMC POWER9
> +- ``swift-bmc``            OpenPOWER Swift BMC POWER9 (to be removed in v7.0)
> +- ``fp5280g2-bmc``         Inspur FP5280G2 BMC
> +- ``g220a-bmc``            Bytedance G220A BMC
>   
>   AST2600 SoC based machines :
>   
>   - ``ast2600-evb``          Aspeed AST2600 Evaluation board (Cortex-A7)
>   - ``tacoma-bmc``           OpenPOWER Witherspoon POWER9 AST2600 BMC
> +- ``rainier-bmc``          IBM Rainier POWER10 BMC
> +- ``fuji-bmc``             Facebook Fuji BMC
>   
>   Supported devices
>   -----------------
> 


