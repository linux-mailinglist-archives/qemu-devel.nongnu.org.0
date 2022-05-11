Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B26523F1E
	for <lists+qemu-devel@lfdr.de>; Wed, 11 May 2022 22:55:09 +0200 (CEST)
Received: from localhost ([::1]:43440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1notMR-0003QX-NP
	for lists+qemu-devel@lfdr.de; Wed, 11 May 2022 16:55:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1notLY-0002Xd-E8
 for qemu-devel@nongnu.org; Wed, 11 May 2022 16:54:12 -0400
Received: from 10.mo552.mail-out.ovh.net ([87.98.187.244]:36969)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1notLT-0005dZ-W2
 for qemu-devel@nongnu.org; Wed, 11 May 2022 16:54:10 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.47])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id C462722CC5;
 Wed, 11 May 2022 20:54:04 +0000 (UTC)
Received: from kaod.org (37.59.142.109) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.6; Wed, 11 May
 2022 22:54:04 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-109S003fcbc06fe-7ef9-4bb9-b636-650b90255786,
 0573B671C186F18DA7A9CA3D7ACC2C84049858CC) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <bec934c3-0877-fd5d-0d7e-1afc1a67fda4@kaod.org>
Date: Wed, 11 May 2022 22:54:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 1/1] hw: allow write_enable latch get/set
Content-Language: en-US
To: Iris Chen <irischenlj@fb.com>
CC: <pdel@fb.com>, <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>,
 <patrick@stwcx.xyz>
References: <irischenlj@fb.com> <20220511184539.1099161-1-irischenlj@fb.com>
 <20220511184539.1099161-2-irischenlj@fb.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220511184539.1099161-2-irischenlj@fb.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.109]
X-ClientProxiedBy: DAG4EX2.mxp5.local (172.16.2.32) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 34fef33a-b60f-408c-8540-da6579f33286
X-Ovh-Tracer-Id: 2480357494905146275
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrgeehgdduheduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepvdehgeehheekjefgheegkeeuveffffffhefhvdejiefhfeejfffhgeehvdehlefgnecuffhomhgrihhnpehrvggrughthhgvughotghsrdhiohenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehprghtrhhitghksehsthiftgigrdighiii
Received-SPF: pass client-ip=87.98.187.244; envelope-from=clg@kaod.org;
 helo=10.mo552.mail-out.ovh.net
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello Iris,

You need to add a description to the patch, may be use what you wrote
in the cover letter to start with, and a Signed-off-by tag.

Before sending, please run :

   $ ./scripts/checkpatch.pl <patch>

and

   $ ./scripts/get_maintainer.pl <patch>

to know who to send to.


The long story is here :

   https://qemu.readthedocs.io/en/latest/devel/submitting-a-patch.html

On 5/11/22 20:45, Iris Chen via wrote:
> ---
>   hw/block/m25p80.c             | 30 ++++++++++++++++++++++++++++++
>   tests/qtest/aspeed_smc-test.c | 20 ++++++++++++++++++++
>   2 files changed, 50 insertions(+)
> 
> diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
> index 430d1298a8..fb72704e5a 100644
> --- a/hw/block/m25p80.c
> +++ b/hw/block/m25p80.c
> @@ -35,6 +35,7 @@
>   #include "qapi/error.h"
>   #include "trace.h"
>   #include "qom/object.h"
> +#include "qapi/visitor.h"
>   
>   /* Fields for FlashPartInfo->flags */
>   
> @@ -1646,6 +1647,31 @@ static const VMStateDescription vmstate_m25p80 = {
>       }
>   };
>   
> +static void m25p80_get_wel(Object *obj, Visitor *v, const char *name,
> +                            void *opaque, Error **errp)
> +{
> +    Flash *s = M25P80(obj);
> +
> +    assert(strcmp(name, "WEL") == 0);

That's not necessary.

> +
> +    visit_type_bool(v, name, &s->write_enable, errp);
> +}
> +
> +static void m25p80_set_wel(Object *obj, Visitor *v, const char *name,
> +                            void *opaque, Error **errp)
> +{
> +    Flash *s = M25P80(obj);
> +    bool value;
> +
> +    assert(strcmp(name, "WEL") == 0);
> +
> +    if (!visit_type_bool(v, name, &value, errp)) {
> +        return;
> +    }
> +
> +    s->write_enable = value;
> +}
> +
>   static void m25p80_class_init(ObjectClass *klass, void *data)
>   {
>       DeviceClass *dc = DEVICE_CLASS(klass);
> @@ -1660,6 +1686,10 @@ static void m25p80_class_init(ObjectClass *klass, void *data)
>       device_class_set_props(dc, m25p80_properties);
>       dc->reset = m25p80_reset;
>       mc->pi = data;
> +
> +    object_class_property_add(klass, "WEL", "bool",
> +                            m25p80_get_wel,
> +                            m25p80_set_wel, NULL, NULL);

Instead, you could add a :

     DEFINE_PROP_BOOL("write-enable", Flash, write_enable, false);

under m25p80_properties.

Thanks,

C.

>   }
>   
>   static const TypeInfo m25p80_info = {
> diff --git a/tests/qtest/aspeed_smc-test.c b/tests/qtest/aspeed_smc-test.c
> index 87b40a0ef1..af885a9c9d 100644
> --- a/tests/qtest/aspeed_smc-test.c
> +++ b/tests/qtest/aspeed_smc-test.c
> @@ -49,6 +49,7 @@
>    */
>   enum {
>       JEDEC_READ = 0x9f,
> +    RDSR = 0x5,
>       BULK_ERASE = 0xc7,
>       READ = 0x03,
>       PP = 0x02,
> @@ -348,6 +349,24 @@ static void test_write_page_mem(void)
>       flash_reset();
>   }
>   
> +static void test_read_status_reg(void)
> +{
> +    uint8_t r;
> +
> +	qmp("{ 'execute': 'qom-set', 'arguments': "
> +       "{'path': '/machine/soc/fmc/ssi.0/child[0]', 'property': 'WEL', 'value': true}}");
> +
> +    spi_conf(CONF_ENABLE_W0);
> +	spi_ctrl_start_user();
> +	writeb(ASPEED_FLASH_BASE, RDSR);
> +	r = readb(ASPEED_FLASH_BASE);
> +	spi_ctrl_stop_user();
> +
> +	g_assert_cmphex(r, ==, 0x2);
> +
> +	flash_reset();
> +}
> +
>   static char tmp_path[] = "/tmp/qtest.m25p80.XXXXXX";
>   
>   int main(int argc, char **argv)
> @@ -373,6 +392,7 @@ int main(int argc, char **argv)
>       qtest_add_func("/ast2400/smc/write_page", test_write_page);
>       qtest_add_func("/ast2400/smc/read_page_mem", test_read_page_mem);
>       qtest_add_func("/ast2400/smc/write_page_mem", test_write_page_mem);
> +    qtest_add_func("/ast2400/smc/read_status_reg", test_read_status_reg);
>   
>       ret = g_test_run();
>   


