Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9231F66CD59
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 18:35:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHTOY-0007pH-8d; Mon, 16 Jan 2023 12:35:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1pHTOJ-0007Jd-4H; Mon, 16 Jan 2023 12:35:29 -0500
Received: from mout.kundenserver.de ([212.227.126.135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1pHTOG-00054D-Gj; Mon, 16 Jan 2023 12:35:26 -0500
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MgiPE-1oneLT49RE-00h48n; Mon, 16 Jan 2023 18:35:20 +0100
Message-ID: <02ca716e-12a0-017f-9d81-5f7750cbad57@vivier.eu>
Date: Mon, 16 Jan 2023 18:35:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH-for-8.0] block/nbd: Add missing <qemu/bswap.h> include
Content-Language: fr
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, qemu-block@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-trivial@nongnu.org, Hanna Reitz <hreitz@redhat.com>
References: <20221125175328.48539-1-philmd@linaro.org>
 <07ccf64d-1400-b19d-145e-6c0f25685d46@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <07ccf64d-1400-b19d-145e-6c0f25685d46@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Ys/stV8Dur32OhmKaaOLvt3lbqkbkbBXXvUx/IdgiNZpCU66wMh
 XoqnmGMJP0ENr/xNbrUv9N959C6FvCfO8d6L2DB+fTMFnUht3gzVM7rFhosdNq8XErDYFjg
 eRPjN+ZLFHN2WuKo69FzhpnruuZh0FPEELfuW4RAIvWmZOAe2k01JcFilcdTbLaxA12gG8X
 RIMJw0rrpcmmYXHgarxTQ==
UI-OutboundReport: notjunk:1;M01:P0:BAvf18fCahk=;zhXuaEwxVGHzKTeeP0eR2MuHxmh
 ag145+xtGG4YY8mqXeyBLancGWladzWB+295XrYJ4ZwLnAw17jCVMqU/vSJhwPhfC4AXIb/fD
 RRtyOWyEeFpOPbQJhIUpStsGVXCXxQwN62KWA4+oGeAu+oD2rw7UdqAPVOEdiAnDWyFKwwmCm
 2Qz9NdpT0sjQAKKX68Vbae7Temx9xcHWLNGwXQlGE62tgE3IQRGoVZr3mrTxh/26QPOkaSVR/
 g4PDsiM8OKtNpB+cpcvTjdHc4yOTiXJeKX1WjqojBZa8nJobQlUUYoBlqrR4U4PeSrCNnnczl
 NfLea48wBObpxOs/g1jz/ni+/ZY4jVtq0hYrblsX2wL7FWAJkliGEJWNDC7Uf8OWJBdurQDeR
 vAuW1XJ+lHuEi0AnXA0qiCjP3TZ4lOYJMUDhanDvI4ik72zM1hDur7QAlLIIGdLf5pcrLsSdm
 YIN0MSnQDRIY/GyCEnWh2IgnL6jiC8CWVHeWpgjnPfXM6umaw6mtnngKqbcffojNiTvE70oiG
 GOQwExX9QOkqpsMrJi/hHebK3j8ZYH2UkubTb2InB3Eu+tBg3oTTpOpFZh7fcXg5WQajtNhrX
 vC6JvTq1fniBVHy3zwKq06Zm5yR0yJpFPOW1uB4VTTl76itGBHafCHBugHYfYRsc4zyCxHnUF
 FxbswhGBwda8fyIV4cRNXd/hAbij/7f1gaTsi7l2ZQ==
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.097,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Le 12/01/2023 à 13:00, Philippe Mathieu-Daudé a écrit :
> Hi, can this reviewed patch get merged via a block tree?

I can take this via trivial.

Thanks,
Laurent

> 
> On 25/11/22 18:53, Philippe Mathieu-Daudé wrote:
>> The inlined nbd_readXX() functions call beXX_to_cpu(), themselves
>> declared in <qemu/bswap.h>. This fixes when refactoring:
>>
>>    In file included from ../../block/nbd.c:44:
>>    include/block/nbd.h: In function 'nbd_read16':
>>    include/block/nbd.h:383:12: error: implicit declaration of function 'be16_to_cpu' 
>> [-Werror=implicit-function-declaration]
>>      383 |     *val = be##bits##_to_cpu(*val);                                     \
>>          |            ^~
>>    include/block/nbd.h:387:1: note: in expansion of macro 'DEF_NBD_READ_N'
>>      387 | DEF_NBD_READ_N(16) /* Defines nbd_read16(). */
>>          | ^~~~~~~~~~~~~~
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   include/block/nbd.h | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/include/block/nbd.h b/include/block/nbd.h
>> index 4ede3b2bd0..a4c98169c3 100644
>> --- a/include/block/nbd.h
>> +++ b/include/block/nbd.h
>> @@ -24,6 +24,7 @@
>>   #include "io/channel-socket.h"
>>   #include "crypto/tlscreds.h"
>>   #include "qapi/error.h"
>> +#include "qemu/bswap.h"
>>   extern const BlockExportDriver blk_exp_nbd;
> 
> 


