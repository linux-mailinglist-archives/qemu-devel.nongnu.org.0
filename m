Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB435F1D23
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Oct 2022 17:05:43 +0200 (CEST)
Received: from localhost ([::1]:40386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oee3i-0005m7-3A
	for lists+qemu-devel@lfdr.de; Sat, 01 Oct 2022 11:05:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1oedzt-0003bL-Q7
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 11:01:46 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.220]:45558
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1oedzf-0003H6-Gm
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 11:01:45 -0400
HMM_SOURCE_IP: 172.18.0.188:59410.285977983
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-118.116.19.226 (unknown [172.18.0.188])
 by chinatelecom.cn (HERMES) with SMTP id AF5A62800AE;
 Sat,  1 Oct 2022 23:01:15 +0800 (CST)
X-189-SAVE-TO-SEND: huangy81@chinatelecom.cn
Received: from  ([118.116.19.226])
 by app0023 with ESMTP id 462fc2cd183047ba901281fe6954e34d for
 armbru@redhat.com; Sat, 01 Oct 2022 23:01:19 CST
X-Transaction-ID: 462fc2cd183047ba901281fe6954e34d
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 118.116.19.226
X-MEDUSA-Status: 0
Message-ID: <38ba74f3-f7cb-97b3-9898-8c03f4e692e6@chinatelecom.cn>
Date: Sat, 1 Oct 2022 23:01:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v1 0/8] migration: introduce dirtylimit capability
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>
References: <cover.1662052189.git.huangy81@chinatelecom.cn>
 <87wn9jk3t6.fsf@pond.sub.org>
From: Hyman Huang <huangy81@chinatelecom.cn>
In-Reply-To: <87wn9jk3t6.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.220;
 envelope-from=huangy81@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.743,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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



在 2022/10/1 22:37, Markus Armbruster 写道:
> huangy81@chinatelecom.cn writes:
> 
>> From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
>>
>> v1:
>> - make parameter vcpu-dirty-limit experimental
>> - switch dirty limit off when cancel migrate
>> - add cancel logic in migration test
>>
>> Please review, thanks,
>>
>> Yong
> 
> Are you still pursuing this feature?
Yes, of course, but the detailed test report has not been prepared, and 
the last 3 commits of this patchset has not been commentted, i'm waiting 
for the it and the next version can be improved hugely.

Ping to Daniel and David, what do you think of these 3 test patches?
I would be very pleased if you could help me with the review.  :)

Thanks

Yong
> 
>> Abstract
>> ========
>>
>> This series added a new migration capability called "dirtylimit".  It can
>> be enabled when dirty ring is enabled, and it'll improve the vCPU performance
>> during the process of migration. It is based on the previous patchset:
>> https://lore.kernel.org/qemu-devel/cover.1656177590.git.huangy81@chinatelecom.cn/
>>
>> As mentioned in patchset "support dirty restraint on vCPU", dirtylimit way of
>> migration can make the read-process not be penalized. This series wires up the
>> vcpu dirty limit and wrappers as dirtylimit capability of migration. I introduce
>> two parameters vcpu-dirtylimit-period and vcpu-dirtylimit to implement the setup
>> of dirtylimit during live migration.
>>
>> To validate the implementation, i tested a 32 vCPU vm live migration with such
>> model:
>> Only dirty vcpu0, vcpu1 with heavy memory workoad and leave the rest vcpus
>> untouched, running unixbench on the vpcu8-vcpu15 by setup the cpu affinity as
>> the following command:
>> taskset -c 8-15 ./Run -i 2 -c 8 {unixbench test item}
>>
>> The following are results:
>>
>> host cpu: Intel(R) Xeon(R) Platinum 8378A
>> host interface speed: 1000Mb/s
>>    |---------------------+--------+------------+---------------|
>>    | UnixBench test item | Normal | Dirtylimit | Auto-converge |
>>    |---------------------+--------+------------+---------------|
>>    | dhry2reg            | 32800  | 32786      | 25292         |
>>    | whetstone-double    | 10326  | 10315      | 9847          |
>>    | pipe                | 15442  | 15271      | 14506         |
>>    | context1            | 7260   | 6235       | 4514          |
>>    | spawn               | 3663   | 3317       | 3249          |
>>    | syscall             | 4669   | 4667       | 3841          |
>>    |---------------------+--------+------------+---------------|
>> >From the data above we can draw a conclusion that vcpus that do not dirty memory
>> in vm are almost unaffected during the dirtylimit migration, but the auto converge
>> way does.
>>
>> I also tested the total time of dirtylimit migration with variable dirty memory
>> size in vm.
>>
>> senario 1:
>> host cpu: Intel(R) Xeon(R) Platinum 8378A
>> host interface speed: 1000Mb/s
>>    |-----------------------+----------------+-------------------|
>>    | dirty memory size(MB) | Dirtylimit(ms) | Auto-converge(ms) |
>>    |-----------------------+----------------+-------------------|
>>    | 60                    | 2014           | 2131              |
>>    | 70                    | 5381           | 12590             |
>>    | 90                    | 6037           | 33545             |
>>    | 110                   | 7660           | [*]               |
>>    |-----------------------+----------------+-------------------|
>>    [*]: This case means migration is not convergent.
>>
>> senario 2:
>> host cpu: Intel(R) Xeon(R) CPU E5-2650
>> host interface speed: 10000Mb/s
>>    |-----------------------+----------------+-------------------|
>>    | dirty memory size(MB) | Dirtylimit(ms) | Auto-converge(ms) |
>>    |-----------------------+----------------+-------------------|
>>    | 1600                  | 15842          | 27548             |
>>    | 2000                  | 19026          | 38447             |
>>    | 2400                  | 19897          | 46381             |
>>    | 2800                  | 22338          | 57149             |
>>    |-----------------------+----------------+-------------------|
>> Above data shows that dirtylimit way of migration can also reduce the total
>> time of migration and it achieves convergence more easily in some case.
>>
>> In addition to implement dirtylimit capability itself, this series
>> add 3 tests for migration, aiming at playing around for developer simply:
>>   1. qtest for dirty limit migration
>>   2. support dirty ring way of migration for guestperf tool
>>   3. support dirty limit migration for guestperf tool
>>
>> Please review, thanks !
>>
>> Hyman Huang (8):
>>    qapi/migration: Introduce x-vcpu-dirty-limit-period parameter
>>    qapi/migration: Introduce x-vcpu-dirty-limit parameters
>>    migration: Introduce dirty-limit capability
>>    migration: Implement dirty-limit convergence algo
>>    migration: Export dirty-limit time info
>>    tests: Add migration dirty-limit capability test
>>    tests/migration: Introduce dirty-ring-size option into guestperf
>>    tests/migration: Introduce dirty-limit into guestperf
>>
>>   include/sysemu/dirtylimit.h             |   2 +
>>   migration/migration.c                   |  51 +++++++++++
>>   migration/migration.h                   |   1 +
>>   migration/ram.c                         |  53 ++++++++---
>>   migration/trace-events                  |   1 +
>>   monitor/hmp-cmds.c                      |  26 ++++++
>>   qapi/migration.json                     |  57 ++++++++++--
>>   softmmu/dirtylimit.c                    |  33 ++++++-
>>   tests/migration/guestperf/comparison.py |  24 +++++
>>   tests/migration/guestperf/engine.py     |  33 ++++++-
>>   tests/migration/guestperf/hardware.py   |   8 +-
>>   tests/migration/guestperf/progress.py   |  17 +++-
>>   tests/migration/guestperf/scenario.py   |  11 ++-
>>   tests/migration/guestperf/shell.py      |  25 +++++-
>>   tests/qtest/migration-test.c            | 154 ++++++++++++++++++++++++++++++++
>>   15 files changed, 465 insertions(+), 31 deletions(-)
> 

-- 
Best regard

Hyman Huang(黄勇)

