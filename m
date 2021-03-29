Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E2AE34C6FB
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Mar 2021 10:12:29 +0200 (CEST)
Received: from localhost ([::1]:51840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQn0e-0005T2-Cb
	for lists+qemu-devel@lfdr.de; Mon, 29 Mar 2021 04:12:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1lQmzV-0004ra-Q2
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 04:11:17 -0400
Received: from 2.mo51.mail-out.ovh.net ([178.33.255.19]:46274)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1lQmzQ-0004Dg-1I
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 04:11:17 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.109])
 by mo51.mail-out.ovh.net (Postfix) with ESMTPS id 1DB892655DD;
 Mon, 29 Mar 2021 10:10:54 +0200 (CEST)
Received: from kaod.org (37.59.142.103) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Mon, 29 Mar
 2021 10:10:46 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G0053527f1ab-c79a-4640-b0ee-60b89973fcda,
 8BF819BD6DA5614ACA9E0FB600EB83BC0C5CC0F8) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Subject: Re: [PATCH v3 1/2] aspeed: Add Scater-Gather support for HACE Hash
To: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>, <qemu-arm@nongnu.org>,
 <qemu-devel@nongnu.org>
References: <20210326193745.13558-1-klaus@linux.vnet.ibm.com>
 <20210326193745.13558-2-klaus@linux.vnet.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <2c432f9c-7d57-068a-302d-2ced8f54c520@kaod.org>
Date: Mon, 29 Mar 2021 10:10:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210326193745.13558-2-klaus@linux.vnet.ibm.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG9EX1.mxp5.local (172.16.2.81) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 81700482-f4b8-41d7-8b47-2ec454da569d
X-Ovh-Tracer-Id: 10053723221702970159
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrudehjedguddviecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeegvdeijeefvdfhudfhffeuveehledufffhvdekheelgedttddthfeigeevgefhffenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepkhhlrghusheslhhinhhugidrvhhnvghtrdhisghmrdgtohhm
Received-SPF: pass client-ip=178.33.255.19; envelope-from=clg@kaod.org;
 helo=2.mo51.mail-out.ovh.net
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/26/21 8:37 PM, Klaus Heinrich Kiwi wrote:
> Complement the Aspeed HACE support with Scatter-Gather hash support for
> sha256 and sha512. Scatter-Gather is only supported on AST2600-series.

...

>  static uint64_t aspeed_hace_read(void *opaque, hwaddr addr, unsigned int size)
>  {
> @@ -187,11 +303,6 @@ static void aspeed_hace_write(void *opaque, hwaddr addr, uint64_t data,
>                            "%s: HMAC engine command mode %"PRIx64" not implemented",
>                            __func__, (data & HASH_HMAC_MASK) >> 8);
>          }
> -        if (data & HASH_SG_EN) {
> -            qemu_log_mask(LOG_UNIMP,
> -                          "%s: Hash scatter gather mode not implemented",
> -                          __func__);
> -        }

Could we check the SoC type and emit an error if not ast2600 ? 

>          if (data & BIT(1)) {
>              qemu_log_mask(LOG_UNIMP,
>                            "%s: Cascaded mode not implemented",
> @@ -204,7 +315,10 @@ static void aspeed_hace_write(void *opaque, hwaddr addr, uint64_t data,
>                          __func__, data & ahc->hash_mask);
>                  break;
>          }
> -        do_hash_operation(s, algo);
> +        if (data & HASH_SG_EN)
> +            do_hash_sg_operation(s, algo);
> +        else
> +            do_hash_operation(s, algo);

patchew should complain for the lack of { }.

Thanks,

C. 

>          if (data & HASH_IRQ_EN) {
>              qemu_irq_raise(s->irq);
> 


