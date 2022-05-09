Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 580F2520413
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 20:02:15 +0200 (CEST)
Received: from localhost ([::1]:44414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no7i2-0005gg-Ef
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 14:02:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mail@maciej.szmigiero.name>)
 id 1no7g5-0004Mu-NV; Mon, 09 May 2022 14:00:13 -0400
Received: from vps-vb.mhejs.net ([37.28.154.113]:50782)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mail@maciej.szmigiero.name>)
 id 1no7g2-0004SK-En; Mon, 09 May 2022 14:00:13 -0400
Received: from MUA by vps-vb.mhejs.net with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <mail@maciej.szmigiero.name>)
 id 1no7fd-00067I-7o; Mon, 09 May 2022 19:59:45 +0200
Message-ID: <6ed59ef8-53bc-74ba-432c-955ad72d9f23@maciej.szmigiero.name>
Date: Mon, 9 May 2022 19:59:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <7ecb5ece9d1e0a607e801d547d387bc840b250ea.1651779343.git.maciej.szmigiero@oracle.com>
 <309ab0f5-7bb0-ddb4-3736-8cf0a4cfb269@redhat.com>
From: "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>
Subject: Re: [PATCH][RESEND] MAINTAINERS: Add myself as a reviewer for Hyper-V
 VMBus
In-Reply-To: <309ab0f5-7bb0-ddb4-3736-8cf0a4cfb269@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=37.28.154.113;
 envelope-from=mail@maciej.szmigiero.name; helo=vps-vb.mhejs.net
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

On 6.05.2022 07:31, Thomas Huth wrote:
> On 05/05/2022 21.36, Maciej S. Szmigiero wrote:
>> From: "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>
>>
>> This way there is at least some contact point for incoming patches.
>>
>> We'll see whether the code still gets just a random patch a few times
>> a year or whether it requires a permanent maintainer to take care of it.
>>
>> Signed-off-by: Maciej S. Szmigiero <maciej.szmigiero@oracle.com>
>> ---
>>      Resending, since the previous submission at [1] wasn't picked up.
>>      [1]: https://lore.kernel.org/qemu-devel/b145dcf08ae606e9d29e55b2f701a3fe4f16b347.1637433881.git.maciej.szmigiero@oracle.com/
>>
>>   MAINTAINERS | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 218c9459b6..907f1d4a88 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -1776,6 +1776,12 @@ F: include/hw/block/fdc.h
>>   F: tests/qtest/fdc-test.c
>>   T: git https://gitlab.com/jsnow/qemu.git ide
>> +Hyper-V VMBus
>> +S: Odd Fixes
>> +R: Maciej S. Szmigiero <maciej.szmigiero@oracle.com>
>> +F: hw/hyperv/vmbus.c
>> +F: include/hw/hyperv/vmbus*.h
> 
> If there's no dedicated maintainer, I'd rather pick "Orphan" instead of "Odd Fixes" here?
> Who's supposed to pick up the related patches?

I think I can do this, as long as I know who to send pull requests to
and on what schedule.

>   Thomas
> 

Thanks,
Maciej

