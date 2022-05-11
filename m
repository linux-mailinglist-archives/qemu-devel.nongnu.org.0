Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5A452322D
	for <lists+qemu-devel@lfdr.de>; Wed, 11 May 2022 13:53:23 +0200 (CEST)
Received: from localhost ([::1]:52306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noku9-0006Xn-NJ
	for lists+qemu-devel@lfdr.de; Wed, 11 May 2022 07:53:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nokrg-0004cy-6Q; Wed, 11 May 2022 07:50:51 -0400
Received: from smtpout4.mo529.mail-out.ovh.net ([217.182.185.173]:48639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nokrb-0002Wb-Cj; Wed, 11 May 2022 07:50:46 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.19])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id E8643FEAB836;
 Wed, 11 May 2022 13:50:37 +0200 (CEST)
Received: from kaod.org (37.59.142.97) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.6; Wed, 11 May
 2022 13:50:37 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G0028736767e-4089-4aa4-bcb0-cdab8faa91cc,
 0573B671C186F18DA7A9CA3D7ACC2C84049858CC) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <6ce2d5a2-476f-d2a9-6eb7-928cd5c1a08a@kaod.org>
Date: Wed, 11 May 2022 13:50:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 1/1] docs: aspeed: Add fby35 board
Content-Language: en-US
To: Peter Delevoryas <pdel@fb.com>
CC: <patrick@stwcx.xyz>, <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
References: <20220506193354.990532-1-pdel@fb.com>
 <20220506193354.990532-2-pdel@fb.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220506193354.990532-2-pdel@fb.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG3EX1.mxp5.local (172.16.2.21) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 33bb994e-6253-467c-a1b0-2c5af91e6802
X-Ovh-Tracer-Id: 11749047004905901024
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrgeehgdegfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepkeetjedtleekjedvveffudfhteetleeifeegfeffuefghfefkeehffeufeeludejnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdeljeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhg
Received-SPF: pass client-ip=217.182.185.173; envelope-from=clg@kaod.org;
 helo=smtpout4.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/6/22 21:33, Peter Delevoryas wrote:
> Add fby35 to the list of Aspeed boards.
> 
> Signed-off-by: Peter Delevoryas <pdel@fb.com>
> ---
>   docs/system/arm/aspeed.rst | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/docs/system/arm/aspeed.rst b/docs/system/arm/aspeed.rst
> index 60ed94f187..fa98549c11 100644
> --- a/docs/system/arm/aspeed.rst
> +++ b/docs/system/arm/aspeed.rst
> @@ -31,6 +31,7 @@ AST2600 SoC based machines :
>   - ``tacoma-bmc``           OpenPOWER Witherspoon POWER9 AST2600 BMC
>   - ``rainier-bmc``          IBM Rainier POWER10 BMC
>   - ``fuji-bmc``             Facebook Fuji BMC
> +- ``fby35-bmc``            Facebook fby35 BMC
>   
>   Supported devices
>   -----------------

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

