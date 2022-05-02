Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B7A517263
	for <lists+qemu-devel@lfdr.de>; Mon,  2 May 2022 17:21:20 +0200 (CEST)
Received: from localhost ([::1]:56614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlXrT-0000g3-4f
	for lists+qemu-devel@lfdr.de; Mon, 02 May 2022 11:21:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nlXgB-0007ap-BY
 for qemu-devel@nongnu.org; Mon, 02 May 2022 11:09:39 -0400
Received: from 7.mo548.mail-out.ovh.net ([46.105.33.25]:38827)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nlXg9-0006wo-0v
 for qemu-devel@nongnu.org; Mon, 02 May 2022 11:09:38 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.47])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id D088E21075;
 Mon,  2 May 2022 15:09:33 +0000 (UTC)
Received: from kaod.org (37.59.142.100) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 2 May
 2022 17:09:33 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R00312b3fa39-96a4-4f2a-b6f1-83c8d0b9cbc1,
 1C738C3314058F8CE8CF02D37F1FC3678EA14F63) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <80ac0726-f2a0-527c-2125-97d1869fb147@kaod.org>
Date: Mon, 2 May 2022 17:09:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] hw/gpio/aspeed_gpio: Fix QOM pin property
Content-Language: en-US
To: Peter Delevoryas <pdel@fb.com>
References: <20220502080827.244815-1-pdel@fb.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220502080827.244815-1-pdel@fb.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG8EX2.mxp5.local (172.16.2.72) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 31a2010a-290f-4d0c-beda-6419dd4ef1d3
X-Ovh-Tracer-Id: 17594719321682184998
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehgdekgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepfeekfeejvedthfevueetteduleejfeejtdeugfevjedtuedttdefieeuueduudetnecuffhomhgrihhnpehmvghtrgdrtghomhenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddttdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehjohgvlhesjhhmshdrihgurdgruh
Received-SPF: pass client-ip=46.105.33.25; envelope-from=clg@kaod.org;
 helo=7.mo548.mail-out.ovh.net
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
Cc: andrew@aj.id.au, rashmica.g@gmail.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/2/22 10:08, Peter Delevoryas wrote:
> I was setting gpioV4-7 to "1110" using the QOM pin property handler and
> noticed that lowering gpioV7 was inadvertently lowering gpioV4-6 too.
> 
>      (qemu) qom-set /machine/soc/gpio gpioV4 true
>      (qemu) qom-set /machine/soc/gpio gpioV5 true
>      (qemu) qom-set /machine/soc/gpio gpioV6 true
>      (qemu) qom-get /machine/soc/gpio gpioV4
>      true
>      (qemu) qom-set /machine/soc/gpio gpioV7 false
>      (qemu) qom-get /machine/soc/gpio gpioV4
>      false
> 
> An expression in aspeed_gpio_set_pin_level was using a logical NOT
> operator instead of a bitwise NOT operator:
> 
>      value &= !pin_mask;
> 
> The original author probably intended to make a bitwise NOT expression
> "~", but mistakenly used a logical NOT operator "!" instead. Some
> programming languages like Rust use "!" for both purposes.
> 
> Fixes: 4b7f956862dc ("hw/gpio: Add basic Aspeed GPIO model for AST2400 and
> AST2500")
> Signed-off-by: Peter Delevoryas <pdel@fb.com>

Nice catch !

Reviewed-by: Cédric Le Goater <clg@kaod.org>

I was going to send a PR but I will wait a bit to include this fix.

Thanks,

C.


> ---
>   hw/gpio/aspeed_gpio.c          |  2 +-
>   tests/qtest/aspeed_gpio-test.c | 87 ++++++++++++++++++++++++++++++++++
>   tests/qtest/meson.build        |  3 +-
>   3 files changed, 90 insertions(+), 2 deletions(-)
>   create mode 100644 tests/qtest/aspeed_gpio-test.c
> 
> diff --git a/hw/gpio/aspeed_gpio.c b/hw/gpio/aspeed_gpio.c
> index c63634d3d3..9b736e7a9f 100644
> --- a/hw/gpio/aspeed_gpio.c
> +++ b/hw/gpio/aspeed_gpio.c
> @@ -312,7 +312,7 @@ static void aspeed_gpio_set_pin_level(AspeedGPIOState *s, uint32_t set_idx,
>       if (level) {
>           value |= pin_mask;
>       } else {
> -        value &= !pin_mask;
> +        value &= ~pin_mask;
>       }
>   
>       aspeed_gpio_update(s, &s->sets[set_idx], value);
> diff --git a/tests/qtest/aspeed_gpio-test.c b/tests/qtest/aspeed_gpio-test.c
> new file mode 100644
> index 0000000000..c1003f2d1b
> --- /dev/null
> +++ b/tests/qtest/aspeed_gpio-test.c
> @@ -0,0 +1,87 @@
> +/*
> + * QTest testcase for the Aspeed GPIO Controller.
> + *
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
> +#include "qemu/bitops.h"
> +#include "qemu/timer.h"
> +#include "qapi/qmp/qdict.h"
> +#include "libqtest-single.h"
> +
> +static bool qom_get_bool(QTestState *s, const char *path, const char *property)
> +{
> +    QDict *r;
> +    bool b;
> +
> +    r = qtest_qmp(s, "{ 'execute': 'qom-get', 'arguments': "
> +                     "{ 'path': %s, 'property': %s } }", path, property);
> +    b = qdict_get_bool(r, "return");
> +    qobject_unref(r);
> +
> +    return b;
> +}
> +
> +static void qom_set_bool(QTestState *s, const char *path, const char *property,
> +                         bool value)
> +{
> +    QDict *r;
> +
> +    r = qtest_qmp(s, "{ 'execute': 'qom-set', 'arguments': "
> +                     "{ 'path': %s, 'property': %s, 'value': %i } }",
> +                     path, property, value);
> +    qobject_unref(r);
> +}
> +
> +static void test_set_colocated_pins(const void *data)
> +{
> +    QTestState *s = (QTestState *)data;
> +
> +    /*
> +     * gpioV4-7 occupy bits within a single 32-bit value, so we want to make
> +     * sure that modifying one doesn't affect the other.
> +     */
> +    qom_set_bool(s, "/machine/soc/gpio", "gpioV4", true);
> +    qom_set_bool(s, "/machine/soc/gpio", "gpioV5", false);
> +    qom_set_bool(s, "/machine/soc/gpio", "gpioV6", true);
> +    qom_set_bool(s, "/machine/soc/gpio", "gpioV7", false);
> +    g_assert(qom_get_bool(s, "/machine/soc/gpio", "gpioV4"));
> +    g_assert(!qom_get_bool(s, "/machine/soc/gpio", "gpioV5"));
> +    g_assert(qom_get_bool(s, "/machine/soc/gpio", "gpioV6"));
> +    g_assert(!qom_get_bool(s, "/machine/soc/gpio", "gpioV7"));
> +}
> +
> +int main(int argc, char **argv)
> +{
> +    QTestState *s;
> +    int r;
> +
> +    g_test_init(&argc, &argv, NULL);
> +
> +    s = qtest_init("-machine ast2600-evb");
> +    qtest_add_data_func("/ast2600/gpio/set_colocated_pins", s,
> +                        test_set_colocated_pins);
> +    r = g_test_run();
> +    qtest_quit(s);
> +
> +    return r;
> +}
> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index 6b9807c183..32fb8cf755 100644
> --- a/tests/qtest/meson.build
> +++ b/tests/qtest/meson.build
> @@ -189,7 +189,8 @@ qtests_npcm7xx = \
>      (slirp.found() ? ['npcm7xx_emc-test'] : [])
>   qtests_aspeed = \
>     ['aspeed_hace-test',
> -   'aspeed_smc-test']
> +   'aspeed_smc-test',
> +   'aspeed_gpio-test']
>   qtests_arm = \
>     (config_all_devices.has_key('CONFIG_MPS2') ? ['sse-timer-test'] : []) + \
>     (config_all_devices.has_key('CONFIG_CMSDK_APB_DUALTIMER') ? ['cmsdk-apb-dualtimer-test'] : []) + \


