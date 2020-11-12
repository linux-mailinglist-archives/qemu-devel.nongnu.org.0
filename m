Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A142B01C5
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 10:10:48 +0100 (CET)
Received: from localhost ([::1]:55532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kd8cv-0006eL-BK
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 04:10:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1kd8aF-0004lv-PB
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 04:07:59 -0500
Received: from 10.mo51.mail-out.ovh.net ([46.105.77.235]:32805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1kd8aD-0001yK-GM
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 04:07:59 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.144])
 by mo51.mail-out.ovh.net (Postfix) with ESMTPS id 9862C2337EF;
 Thu, 12 Nov 2020 10:07:46 +0100 (CET)
Received: from kaod.org (37.59.142.97) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Thu, 12 Nov
 2020 10:07:45 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G0029d081ea3-fba7-4f4f-bfa5-463d8a805b36,
 52E2ECA475D190B70181DB61C9ABB7F7A86F4E17) smtp.auth=clg@kaod.org
Subject: Re: [PATCH] ast2600: SRAM is 89KB
To: Joel Stanley <joel@jms.id.au>, Peter Maydell <peter.maydell@linaro.org>
References: <20201112012113.835858-1-joel@jms.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <e2dc28b3-592d-e17b-bdd7-e577e6d90880@kaod.org>
Date: Thu, 12 Nov 2020 10:07:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201112012113.835858-1-joel@jms.id.au>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG3EX1.mxp5.local (172.16.2.21) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 636661d6-1422-49cb-a54c-fb256dbec80b
X-Ovh-Tracer-Id: 18114040651568483235
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedruddvvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeejkeduueduveelgeduueegkeelffevledujeetffeivdelvdfgkeeufeduheehfeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehjohgvlhesjhhmshdrihgurdgruh
Received-SPF: pass client-ip=46.105.77.235; envelope-from=clg@kaod.org;
 helo=10.mo51.mail-out.ovh.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 04:07:48
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

On 11/12/20 2:21 AM, Joel Stanley wrote:
> On the AST2600A1, the SRAM size was increased to 89KB.
> 
> Fixes: 7582591ae745 ("aspeed: Support AST2600A1 silicon revision")
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

> ---
>  hw/arm/aspeed_ast2600.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
> index 1450bde7cf26..12e4a16d3765 100644
> --- a/hw/arm/aspeed_ast2600.c
> +++ b/hw/arm/aspeed_ast2600.c
> @@ -481,7 +481,7 @@ static void aspeed_soc_ast2600_class_init(ObjectClass *oc, void *data)
>      sc->name         = "ast2600-a1";
>      sc->cpu_type     = ARM_CPU_TYPE_NAME("cortex-a7");
>      sc->silicon_rev  = AST2600_A1_SILICON_REV;
> -    sc->sram_size    = 0x10000;
> +    sc->sram_size    = 0x16400;
>      sc->spis_num     = 2;
>      sc->ehcis_num    = 2;
>      sc->wdts_num     = 4;
> 


