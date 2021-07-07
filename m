Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C343BE39B
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 09:32:57 +0200 (CEST)
Received: from localhost ([::1]:42504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m123D-0007hR-Pk
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 03:32:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1m122M-0006zc-84
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 03:32:02 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.223]:38637
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1m122J-0000G4-Ca
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 03:32:01 -0400
HMM_SOURCE_IP: 172.18.0.218:33378.1908009098
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-10.133.11.244?logid-e2cb4247a7414040a07ed5d5d6d51d55
 (unknown [172.18.0.218])
 by chinatelecom.cn (HERMES) with SMTP id 008CE2800AC;
 Wed,  7 Jul 2021 15:31:43 +0800 (CST)
X-189-SAVE-TO-SEND: huangy81@chinatelecom.cn
Received: from  ([172.18.0.218])
 by app0025 with ESMTP id e2cb4247a7414040a07ed5d5d6d51d55 for
 berrange@redhat.com; Wed Jul  7 15:31:44 2021
X-Transaction-ID: e2cb4247a7414040a07ed5d5d6d51d55
X-filter-score: 
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.218
X-MEDUSA-Status: 0
Subject: Re: [PATCH] tests/migration: fix unix socket migration
From: Hyman Huang <huangy81@chinatelecom.cn>
To: Wainer dos Santos Moschetta <wainersm@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>
References: <ea67ec8c4a46979af5515a794759efc00960ed7e.1615304914.git.huangy81@chinatelecom.cn>
 <8a8d72ee-d24c-5aac-3b89-192d4d54f7cb@redhat.com>
 <4b1e91a5-73e8-912a-32c4-b78a7412a8bc@chinatelecom.cn>
 <decc942d-c801-f460-d2aa-d75756551c61@redhat.com>
 <b785fea1-2967-acac-21fd-9117ab1c64f7@chinatelecom.cn>
Message-ID: <15999fa7-4bab-12e2-8720-61480d8ef753@chinatelecom.cn>
Date: Wed, 7 Jul 2021 15:31:38 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <b785fea1-2967-acac-21fd-9117ab1c64f7@chinatelecom.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.223;
 envelope-from=huangy81@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ping

cc the author and maintainer

在 2021/6/26 0:33, Hyman 写道:
> 
> 
> 在 2021/4/29 1:26, Wainer dos Santos Moschetta 写道:
>> Cleber,
>>
>> Maybe you could review then queue this one?
> Ping
> 
> it seems that this patch has been left out :)
> 
>>
>> - Wainer
>>
>> On 4/20/21 10:16 PM, Hyman Huang wrote:
>>>
>>> 在 2021/3/10 0:55, Philippe Mathieu-Daudé 写道:
>>>> On 3/9/21 5:00 PM, huangy81@chinatelecom.cn wrote:
>>>>> From: Hyman <huangy81@chinatelecom.cn>
>>>>>
>>>>> The test aborts and error message as the following be throwed:
>>>>> "No such file or directory: '/var/tmp/qemu-migrate-{pid}.migrate",
>>>>> when the unix socket migration test nearly done. The reason is
>>>>> qemu removes the unix socket file after migration before
>>>>> guestperf.py script do it. So pre-check if the socket file exists
>>>>> when removing it to prevent the guestperf program from aborting.
>>>>>
>>>>> Signed-off-by: Hyman <huangy81@chinatelecom.cn>
>>>>> ---
>>>>>   tests/migration/guestperf/engine.py | 2 +-
>>>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> Interesting, we have in MAINTAINERS:
>>>>
>>>> Python scripts
>>>> M: Eduardo Habkost <ehabkost@redhat.com>
>>>> M: Cleber Rosa <crosa@redhat.com>
>>>> S: Odd Fixes
>>>> F: scripts/*.py
>>>> F: tests/*.py
>>>>
>>>> However:
>>>>
>>>> ./scripts/get_maintainer.pl -f tests/migration/guestperf/engine.py
>>>> get_maintainer.pl: No maintainers found, printing recent contributors.
>>>> get_maintainer.pl: Do not blindly cc: them on patches!  Use common 
>>>> sense.
>>>
>>> Ping
>>>
>>> The following patch has fixed it
>>> https://patchew.org/QEMU/91d5978357fb8709ef61d2030984f7142847037d.1616141556.git.huangy81@chinatelecom.cn/ 
>>>
>>>
>>>>
>>>>> diff --git a/tests/migration/guestperf/engine.py 
>>>>> b/tests/migration/guestperf/engine.py
>>>>> index 83bfc3b..86d4f21 100644
>>>>> --- a/tests/migration/guestperf/engine.py
>>>>> +++ b/tests/migration/guestperf/engine.py
>>>>> @@ -405,7 +405,7 @@ def run(self, hardware, scenario, 
>>>>> result_dir=os.getcwd()):
>>>>>               progress_history = ret[0]
>>>>>               qemu_timings = ret[1]
>>>>>               vcpu_timings = ret[2]
>>>>> -            if uri[0:5] == "unix:":
>>>>> +            if uri[0:5] == "unix:" and os.path.exists(uri[5:]):
>>>>>                   os.remove(uri[5:])
>>>>>               if self._verbose:
>>>>>                   print("Finished migration")
>>>>>
>>>>
>>>> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>>>
>>

-- 
Best regard

Hyman Huang(黄勇)

