Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1542B6DF243
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 12:54:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmY6Q-00052Q-3v; Wed, 12 Apr 2023 06:53:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pmY6N-00051n-U3
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 06:53:23 -0400
Received: from smtpout2.mo529.mail-out.ovh.net ([79.137.123.220])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pmY6L-0008Dg-Ev
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 06:53:23 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.59])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 9B22620B69;
 Wed, 12 Apr 2023 10:53:17 +0000 (UTC)
Received: from kaod.org (37.59.142.105) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Wed, 12 Apr
 2023 12:53:16 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G0060324bba9-40f2-427e-872c-60e907c1abce,
 5163A029651DE878447B53959E60E0FA73EB9D10) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.66.77.115
Message-ID: <8a6dcd0b-81c3-b293-ac02-1949ae9af570@kaod.org>
Date: Wed, 12 Apr 2023 12:53:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 3/3] softmmu: Make qtest.c target independent
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 <qemu-devel@nongnu.org>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>
CC: <qemu-ppc@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>, Richard
 Henderson <richard.henderson@linaro.org>, David Gibson
 <david@gibson.dropbear.id.au>, Daniel Henrique Barboza
 <danielhb413@gmail.com>
References: <20230411183418.1640500-1-thuth@redhat.com>
 <20230411183418.1640500-4-thuth@redhat.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20230411183418.1640500-4-thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG9EX1.mxp5.local (172.16.2.81) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 778c4996-e443-4e0e-80b0-4011dd785e80
X-Ovh-Tracer-Id: 10204312333766200111
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrvdekiedgfeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeffudefleeiudejfeffhfejffeigffhhffhvdekieejheelvdeufffhjedtheeggeenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddruddthedpkedvrdeiiedrjeejrdduudehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeotghlgheskhgrohgurdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehthhhuthhhsehrvgguhhgrthdrtghomhdplhhvihhvihgvrhesrhgvughhrghtrdgtohhmpdhqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdhphhhilhhmugeslhhinhgrrhhordhorhhgpdhqvghmuhdqphhptgesnhhonhhgnhhurdhorhhgpdhpsghonhiiihhnihesrhgvughhrghtrdgtohhmpdhrihgthhgrrhgurdhhvghnuggvrhhsohhnsehlihhnrghrohdrohhrghdpuggrvhhiugesghhisghsohhnrdgurhhophgsvggrrhdrih
 gurdgruhdpuggrnhhivghlhhgsgedufeesghhmrghilhdrtghomhdpoffvtefjohhsthepmhhohedvledpmhhouggvpehsmhhtphhouhht
Received-SPF: pass client-ip=79.137.123.220; envelope-from=clg@kaod.org;
 helo=smtpout2.mo529.mail-out.ovh.net
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.17,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 4/11/23 20:34, Thomas Huth wrote:
> The code in this file is not performance critical, so we can use
> the target independent endianess functions to only compile this
> file once for all targets.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
>   softmmu/qtest.c     | 12 ++++++------
>   softmmu/meson.build |  2 +-
>   2 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/softmmu/qtest.c b/softmmu/qtest.c
> index 76cbb8bcee..9f2197fd6f 100644
> --- a/softmmu/qtest.c
> +++ b/softmmu/qtest.c
> @@ -13,12 +13,12 @@
>   
>   #include "qemu/osdep.h"
>   #include "qapi/error.h"
> -#include "cpu.h"
>   #include "sysemu/qtest.h"
>   #include "sysemu/runstate.h"
>   #include "chardev/char-fe.h"
>   #include "exec/ioport.h"
>   #include "exec/memory.h"
> +#include "exec/tswap.h"
>   #include "hw/qdev-core.h"
>   #include "hw/irq.h"
>   #include "qemu/accel.h"
> @@ -717,11 +717,11 @@ static void qtest_process_command(CharBackend *chr, gchar **words)
>           qtest_send(chr, "OK\n");
>       } else if (strcmp(words[0], "endianness") == 0) {
>           qtest_send_prefix(chr);
> -#if TARGET_BIG_ENDIAN
> -        qtest_sendf(chr, "OK big\n");
> -#else
> -        qtest_sendf(chr, "OK little\n");
> -#endif
> +        if (target_words_bigendian()) {
> +            qtest_sendf(chr, "OK big\n");
> +        } else {
> +            qtest_sendf(chr, "OK little\n");
> +        }
>       } else if (qtest_enabled() && strcmp(words[0], "clock_step") == 0) {
>           int64_t ns;
>   
> diff --git a/softmmu/meson.build b/softmmu/meson.build
> index 1a7c7ac089..b392f0bd35 100644
> --- a/softmmu/meson.build
> +++ b/softmmu/meson.build
> @@ -3,7 +3,6 @@ specific_ss.add(when: 'CONFIG_SOFTMMU', if_true: [files(
>     'ioport.c',
>     'memory.c',
>     'physmem.c',
> -  'qtest.c',
>     'dirtylimit.c',
>     'watchpoint.c',
>   )])
> @@ -23,6 +22,7 @@ softmmu_ss.add(files(
>     'globals.c',
>     'memory_mapping.c',
>     'qdev-monitor.c',
> +  'qtest.c',
>     'rtc.c',
>     'runstate-action.c',
>     'runstate-hmp-cmds.c',


