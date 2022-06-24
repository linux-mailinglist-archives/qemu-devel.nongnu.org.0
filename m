Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 480515593EB
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 09:04:14 +0200 (CEST)
Received: from localhost ([::1]:35654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4dMT-0002sY-DN
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 03:04:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1o4dJM-0007Tt-QM; Fri, 24 Jun 2022 03:01:03 -0400
Received: from 4.mo548.mail-out.ovh.net ([188.165.42.229]:55035)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1o4dJK-0006AR-3L; Fri, 24 Jun 2022 03:01:00 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.167])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 4663922F45;
 Fri, 24 Jun 2022 07:00:56 +0000 (UTC)
Received: from kaod.org (37.59.142.95) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Fri, 24 Jun
 2022 09:00:55 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G00176969940-de30-45b9-9827-fd908585c2b8,
 5EF2319963E9DB1A14486A5EC8730A2EE4B20F29) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <76e7219d-5b0f-9763-86cf-c398a41647f2@kaod.org>
Date: Fri, 24 Jun 2022 09:00:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 6/8] aspeed: Add fby35 skeleton
Content-Language: en-US
To: Peter Delevoryas <pdel@fb.com>
CC: <peter.maydell@linaro.org>, <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
References: <20220624003701.1363500-1-pdel@fb.com>
 <20220624003701.1363500-7-pdel@fb.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220624003701.1363500-7-pdel@fb.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG2EX1.mxp5.local (172.16.2.11) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 72ae6816-320a-4587-9290-50fd16a84030
X-Ovh-Tracer-Id: 7000845624571366368
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudefkedgudduiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepfeekfeejvedthfevueetteduleejfeejtdeugfevjedtuedttdefieeuueduudetnecuffhomhgrihhnpehmvghtrgdrtghomhenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepqhgvmhhuqdgrrhhmsehnohhnghhnuhdrohhrghdpoffvtefjohhsthepmhhoheegke
Received-SPF: pass client-ip=188.165.42.229; envelope-from=clg@kaod.org;
 helo=4.mo548.mail-out.ovh.net
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

On 6/24/22 02:36, Peter Delevoryas wrote:
> Signed-off-by: Peter Delevoryas <pdel@fb.com>

Reviewed-by: Cédric Le Goater <clg@kaod.org>


Thanks,

C.


> ---
>   MAINTAINERS        |  1 +
>   hw/arm/fby35.c     | 54 ++++++++++++++++++++++++++++++++++++++++++++++
>   hw/arm/meson.build |  3 ++-
>   3 files changed, 57 insertions(+), 1 deletion(-)
>   create mode 100644 hw/arm/fby35.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index aaa649a50d..b43b428a30 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1067,6 +1067,7 @@ F: hw/net/ftgmac100.c
>   F: include/hw/net/ftgmac100.h
>   F: docs/system/arm/aspeed.rst
>   F: tests/qtest/*aspeed*
> +F: hw/arm/fby35.c
>   
>   NRF51
>   M: Joel Stanley <joel@jms.id.au>
> diff --git a/hw/arm/fby35.c b/hw/arm/fby35.c
> new file mode 100644
> index 0000000000..dc1ae8e62a
> --- /dev/null
> +++ b/hw/arm/fby35.c
> @@ -0,0 +1,54 @@
> +/*
> + * Copyright (c) Meta Platforms, Inc. and affiliates. (http://www.meta.com)
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a copy
> + * of this software and associated documentation files (the "Software"), to deal
> + * in the Software without restriction, including without limitation the rights
> + * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
> + * copies of the Software, and to permit persons to whom the Software is
> + * furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
> + * THE SOFTWARE.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "hw/boards.h"
> +
> +#define TYPE_FBY35 MACHINE_TYPE_NAME("fby35")
> +OBJECT_DECLARE_SIMPLE_TYPE(Fby35State, FBY35);
> +
> +struct Fby35State {
> +    MachineState parent_obj;
> +};
> +
> +static void fby35_init(MachineState *machine)
> +{
> +}
> +
> +static void fby35_class_init(ObjectClass *oc, void *data)
> +{
> +    MachineClass *mc = MACHINE_CLASS(oc);
> +
> +    mc->desc = "Meta Platforms fby35";
> +    mc->init = fby35_init;
> +}
> +
> +static const TypeInfo fby35_types[] = {
> +    {
> +        .name = MACHINE_TYPE_NAME("fby35"),
> +        .parent = TYPE_MACHINE,
> +        .class_init = fby35_class_init,
> +        .instance_size = sizeof(Fby35State),
> +    },
> +};
> +
> +DEFINE_TYPES(fby35_types);
> diff --git a/hw/arm/meson.build b/hw/arm/meson.build
> index 2d8381339c..92f9f6e000 100644
> --- a/hw/arm/meson.build
> +++ b/hw/arm/meson.build
> @@ -51,7 +51,8 @@ arm_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files(
>     'aspeed_soc.c',
>     'aspeed.c',
>     'aspeed_ast2600.c',
> -  'aspeed_ast10x0.c'))
> +  'aspeed_ast10x0.c',
> +  'fby35.c'))
>   arm_ss.add(when: 'CONFIG_MPS2', if_true: files('mps2.c'))
>   arm_ss.add(when: 'CONFIG_MPS2', if_true: files('mps2-tz.c'))
>   arm_ss.add(when: 'CONFIG_MSF2', if_true: files('msf2-soc.c'))


