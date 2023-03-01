Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED4C86A7057
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 16:54:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXOmT-0005Jv-Hz; Wed, 01 Mar 2023 10:54:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1pXOmQ-0005JP-Od
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 10:54:10 -0500
Received: from prt-mail.chinatelecom.cn ([42.123.76.220] helo=chinatelecom.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1pXOmM-00081r-G1
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 10:54:10 -0500
HMM_SOURCE_IP: 172.18.0.218:37802.1611263487
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-123.121.9.71 (unknown [172.18.0.218])
 by chinatelecom.cn (HERMES) with SMTP id ECEA12800B0;
 Wed,  1 Mar 2023 23:53:41 +0800 (CST)
X-189-SAVE-TO-SEND: huangy81@chinatelecom.cn
Received: from  ([123.121.9.71])
 by app0025 with ESMTP id f117a08953fa4073b047d34a30d6fac8 for
 qemu-devel@nongnu.org; Wed, 01 Mar 2023 23:53:51 CST
X-Transaction-ID: f117a08953fa4073b047d34a30d6fac8
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 123.121.9.71
X-MEDUSA-Status: 0
Message-ID: <7db2c1ab-2d77-9dec-0a14-5c052ba0844d@chinatelecom.cn>
Date: Wed, 1 Mar 2023 23:53:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v4 00/10] migration: introduce dirtylimit capability
To: qemu-devel <qemu-devel@nongnu.org>
Cc: Markus Armbruster <armbru@redhat.com>, Peter Xu <peterx@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
References: <cover.1676563222.git.huangy81@chinatelecom.cn>
From: Hyman Huang <huangy81@chinatelecom.cn>
In-Reply-To: <cover.1676563222.git.huangy81@chinatelecom.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.220;
 envelope-from=huangy81@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: 13
X-Spam_score: 1.3
X-Spam_bar: +
X-Spam_report: (1.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.09,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Ping ?

在 2023/2/17 0:18, huangy81@chinatelecom.cn 写道:
> From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> 
> v4:
> 1. Polish the docs and update the release version suggested by Markus
> 2. Rename the migrate exported info "dirty-limit-throttle-time-per-round"
>     to "dirty-limit-throttle-time-per-full".
> 
> The following 5 commits hasn't been acked or reviewed yet:
> 
> kvm: dirty-ring: Fix race with vcpu creation
> qapi/migration: Introduce x-vcpu-dirty-limit-period parameter
> migration: Implement dirty-limit convergence algo
> migration: Extend query-migrate to provide dirty page limit info
> tests: Add migration dirty-limit capability test
> 
> Ping David and Juan.
> 
> Please review if you have time. Thanks.
> 
> Yong
> 
> v3(resend):
> - fix the syntax error of the topic.
> 
> v3:
> This version make some modifications inspired by Peter and Markus
> as following:
> 1. Do the code clean up in [PATCH v2 02/11] suggested by Markus
> 2. Replace the [PATCH v2 03/11] with a much simpler patch posted by
>     Peter to fix the following bug:
>     https://bugzilla.redhat.com/show_bug.cgi?id=2124756
> 3. Fix the error path of migrate_params_check in [PATCH v2 04/11]
>     pointed out by Markus. Enrich the commit message to explain why
>     x-vcpu-dirty-limit-period an unstable parameter.
> 4. Refactor the dirty-limit convergence algo in [PATCH v2 07/11]
>     suggested by Peter:
>     a. apply blk_mig_bulk_active check before enable dirty-limit
>     b. drop the unhelpful check function before enable dirty-limit
>     c. change the migration_cancel logic, just cancel dirty-limit
>        only if dirty-limit capability turned on.
>     d. abstract a code clean commit [PATCH v3 07/10] to adjust
>        the check order before enable auto-converge
> 5. Change the name of observing indexes during dirty-limit live
>     migration to make them more easy-understanding. Use the
>     maximum throttle time of vpus as "dirty-limit-throttle-time-per-full"
> 6. Fix some grammatical and spelling errors pointed out by Markus
>     and enrich the document about the dirty-limit live migration
>     observing indexes "dirty-limit-ring-full-time"
>     and "dirty-limit-throttle-time-per-full"
> 7. Change the default value of x-vcpu-dirty-limit-period to 1000ms,
>     which is optimal value pointed out in cover letter in that
>     testing environment.
> 8. Drop the 2 guestperf test commits [PATCH v2 10/11],
>     [PATCH v2 11/11] and post them with a standalone series in the
>     future.
> 
> Thanks Peter and Markus sincerely for the passionate, efficient
> and careful comments and suggestions.
> 
> Please review.
> 
> Yong
> 
> v2:
> This version make a little bit modifications comparing with
> version 1 as following:
> 1. fix the overflow issue reported by Peter Maydell
> 2. add parameter check for hmp "set_vcpu_dirty_limit" command
> 3. fix the racing issue between dirty ring reaper thread and
>     Qemu main thread.
> 4. add migrate parameter check for x-vcpu-dirty-limit-period
>     and vcpu-dirty-limit.
> 5. add the logic to forbid hmp/qmp commands set_vcpu_dirty_limit,
>     cancel_vcpu_dirty_limit during dirty-limit live migration when
>     implement dirty-limit convergence algo.
> 6. add capability check to ensure auto-converge and dirty-limit
>     are mutually exclusive.
> 7. pre-check if kvm dirty ring size is configured before setting
>     dirty-limit migrate parameter
> 
> A more comprehensive test was done comparing with version 1.
> 
> The following are test environment:
> -------------------------------------------------------------
> a. Host hardware info:
> 
> CPU:
> Intel(R) Xeon(R) Gold 5218 CPU @ 2.30GHz
> 
> CPU(s):                          64
> On-line CPU(s) list:             0-63
> Thread(s) per core:              2
> Core(s) per socket:              16
> Socket(s):                       2
> NUMA node(s):                    2
> 
> NUMA node0 CPU(s):               0-15,32-47
> NUMA node1 CPU(s):               16-31,48-63
> 
> Memory:
> Hynix  503Gi
> 
> Interface:
> Intel Corporation Ethernet Connection X722 for 1GbE (rev 09)
> Speed: 1000Mb/s
> 
> b. Host software info:
> 
> OS: ctyunos release 2
> Kernel: 4.19.90-2102.2.0.0066.ctl2.x86_64
> Libvirt baseline version:  libvirt-6.9.0
> Qemu baseline version: qemu-5.0
> 
> c. vm scale
> CPU: 4
> Memory: 4G
> -------------------------------------------------------------
> 
> All the supplementary test data shown as follows are basing on
> above test environment.
> 
> In version 1, we post a test data from unixbench as follows:
> 
> $ taskset -c 8-15 ./Run -i 2 -c 8 {unixbench test item}
> 
> host cpu: Intel(R) Xeon(R) Platinum 8378A
> host interface speed: 1000Mb/s
>    |---------------------+--------+------------+---------------|
>    | UnixBench test item | Normal | Dirtylimit | Auto-converge |
>    |---------------------+--------+------------+---------------|
>    | dhry2reg            | 32800  | 32786      | 25292         |
>    | whetstone-double    | 10326  | 10315      | 9847          |
>    | pipe                | 15442  | 15271      | 14506         |
>    | context1            | 7260   | 6235       | 4514          |
>    | spawn               | 3663   | 3317       | 3249          |
>    | syscall             | 4669   | 4667       | 3841          |
>    |---------------------+--------+------------+---------------|
> 
> In version 2, we post a supplementary test data that do not use
> taskset and make the scenario more general, see as follows:
> 
> $ ./Run
> 
> per-vcpu data:
>    |---------------------+--------+------------+---------------|
>    | UnixBench test item | Normal | Dirtylimit | Auto-converge |
>    |---------------------+--------+------------+---------------|
>    | dhry2reg            | 2991   | 2902       | 1722          |
>    | whetstone-double    | 1018   | 1006       | 627           |
>    | Execl Throughput    | 955    | 320        | 660           |
>    | File Copy - 1       | 2362   | 805        | 1325          |
>    | File Copy - 2       | 1500   | 1406       | 643           |
>    | File Copy - 3       | 4778   | 2160       | 1047          |
>    | Pipe Throughput     | 1181   | 1170       | 842           |
>    | Context Switching   | 192    | 224        | 198           |
>    | Process Creation    | 490    | 145        | 95            |
>    | Shell Scripts - 1   | 1284   | 565        | 610           |
>    | Shell Scripts - 2   | 2368   | 900        | 1040          |
>    | System Call Overhead| 983    | 948        | 698           |
>    | Index Score         | 1263   | 815        | 600           |
>    |---------------------+--------+------------+---------------|
> Note:
>    File Copy - 1: File Copy 1024 bufsize 2000 maxblocks
>    File Copy - 2: File Copy 256 bufsize 500 maxblocks
>    File Copy - 3: File Copy 4096 bufsize 8000 maxblocks
>    Shell Scripts - 1: Shell Scripts (1 concurrent)
>    Shell Scripts - 2: Shell Scripts (8 concurrent)
> 
> Basing on above data, we can draw a conclusion that dirty-limit
> can hugely improve the system benchmark almost in every respect,
> the "System Benchmarks Index Score" show it improve 35% performance
> comparing with auto-converge during live migration.
> 
> 4-vcpu parallel data(we run a test vm with 4c4g-scale):
>    |---------------------+--------+------------+---------------|
>    | UnixBench test item | Normal | Dirtylimit | Auto-converge |
>    |---------------------+--------+------------+---------------|
>    | dhry2reg            | 7975   | 7146       | 5071          |
>    | whetstone-double    | 3982   | 3561       | 2124          |
>    | Execl Throughput    | 1882   | 1205       | 768           |
>    | File Copy - 1       | 1061   | 865        | 498           |
>    | File Copy - 2       | 676    | 491        | 519           |
>    | File Copy - 3       | 2260   | 923        | 1329          |
>    | Pipe Throughput     | 3026   | 3009       | 1616          |
>    | Context Switching   | 1219   | 1093       | 695           |
>    | Process Creation    | 947    | 307        | 446           |
>    | Shell Scripts - 1   | 2469   | 977        | 989           |
>    | Shell Scripts - 2   | 2667   | 1275       | 984           |
>    | System Call Overhead| 1592   | 1459       | 692           |
>    | Index Score         | 1976   | 1294       | 997           |
>    |---------------------+--------+------------+---------------|
> 
> For the parallel data, the "System Benchmarks Index Score" show it
> also improve 29% performance.
> 
> In version 1, migration total time is shown as follows:
> 
> host cpu: Intel(R) Xeon(R) Platinum 8378A
> host interface speed: 1000Mb/s
>    |-----------------------+----------------+-------------------|
>    | dirty memory size(MB) | Dirtylimit(ms) | Auto-converge(ms) |
>    |-----------------------+----------------+-------------------|
>    | 60                    | 2014           | 2131              |
>    | 70                    | 5381           | 12590             |
>    | 90                    | 6037           | 33545             |
>    | 110                   | 7660           | [*]               |
>    |-----------------------+----------------+-------------------|
>    [*]: This case means migration is not convergent.
> 
> In version 2, we post more comprehensive migration total time test data
> as follows:
> 
> we update N MB on 4 cpus and sleep S us every time 1 MB data was updated.
> test twice in each condition, data is shown as follow:
> 
>    |-----------+--------+--------+----------------+-------------------|
>    | ring size | N (MB) | S (us) | Dirtylimit(ms) | Auto-converge(ms) |
>    |-----------+--------+--------+----------------+-------------------|
>    | 1024      | 1024   | 1000   | 44951          | 191780            |
>    | 1024      | 1024   | 1000   | 44546          | 185341            |
>    | 1024      | 1024   | 500    | 46505          | 203545            |
>    | 1024      | 1024   | 500    | 45469          | 909945            |
>    | 1024      | 1024   | 0      | 61858          | [*]               |
>    | 1024      | 1024   | 0      | 57922          | [*]               |
>    | 1024      | 2048   | 0      | 91982          | [*]               |
>    | 1024      | 2048   | 0      | 90388          | [*]               |
>    | 2048      | 128    | 10000  | 14511          | 25971             |
>    | 2048      | 128    | 10000  | 13472          | 26294             |
>    | 2048      | 1024   | 10000  | 44244          | 26294             |
>    | 2048      | 1024   | 10000  | 45099          | 157701            |
>    | 2048      | 1024   | 500    | 51105          | [*]               |
>    | 2048      | 1024   | 500    | 49648          | [*]               |
>    | 2048      | 1024   | 0      | 229031         | [*]               |
>    | 2048      | 1024   | 0      | 154282         | [*]               |
>    |-----------+--------+--------+----------------+-------------------|
>    [*]: This case means migration is not convergent.
> 
> Not that the larger ring size is, the less sensitively dirty-limit responds,
> so we should choose a optimal ring size base on the test data with different
> scale vm.
> 
> We also test the effect of "x-vcpu-dirty-limit-period" parameter on
> migration total time. test twice in each condition, data is shown
> as follows:
> 
>    |-----------+--------+--------+-------------+----------------------|
>    | ring size | N (MB) | S (us) | Period (ms) | migration total time |
>    |-----------+--------+--------+-------------+----------------------|
>    | 2048      | 1024   | 10000  | 100         | [*]                  |
>    | 2048      | 1024   | 10000  | 100         | [*]                  |
>    | 2048      | 1024   | 10000  | 300         | 156795               |
>    | 2048      | 1024   | 10000  | 300         | 118179               |
>    | 2048      | 1024   | 10000  | 500         | 44244                |
>    | 2048      | 1024   | 10000  | 500         | 45099                |
>    | 2048      | 1024   | 10000  | 700         | 41871                |
>    | 2048      | 1024   | 10000  | 700         | 42582                |
>    | 2048      | 1024   | 10000  | 1000        | 41430                |
>    | 2048      | 1024   | 10000  | 1000        | 40383                |
>    | 2048      | 1024   | 10000  | 1500        | 42030                |
>    | 2048      | 1024   | 10000  | 1500        | 42598                |
>    | 2048      | 1024   | 10000  | 2000        | 41694                |
>    | 2048      | 1024   | 10000  | 2000        | 42403                |
>    | 2048      | 1024   | 10000  | 3000        | 43538                |
>    | 2048      | 1024   | 10000  | 3000        | 43010                |
>    |-----------+--------+--------+-------------+----------------------|
> 
> It shows that x-vcpu-dirty-limit-period should be configured with 1000 ms
> in above condition.
> 
> Please review, any comments and suggestions are very appreciated, thanks
> 
> Yong
> 
> Hyman Huang (9):
>    dirtylimit: Fix overflow when computing MB
>    softmmu/dirtylimit: Add parameter check for hmp "set_vcpu_dirty_limit"
>    qapi/migration: Introduce x-vcpu-dirty-limit-period parameter
>    qapi/migration: Introduce vcpu-dirty-limit parameters
>    migration: Introduce dirty-limit capability
>    migration: Refactor auto-converge capability logic
>    migration: Implement dirty-limit convergence algo
>    migration: Extend query-migrate to provide dirty page limit info
>    tests: Add migration dirty-limit capability test
> 
> Peter Xu (1):
>    kvm: dirty-ring: Fix race with vcpu creation
> 
>   accel/kvm/kvm-all.c            |   9 ++
>   include/sysemu/dirtylimit.h    |   2 +
>   migration/migration-hmp-cmds.c |  26 ++++++
>   migration/migration.c          |  88 ++++++++++++++++++
>   migration/migration.h          |   1 +
>   migration/ram.c                |  63 ++++++++++---
>   migration/trace-events         |   1 +
>   qapi/migration.json            |  64 ++++++++++++--
>   softmmu/dirtylimit.c           |  91 ++++++++++++++++---
>   tests/qtest/migration-test.c   | 157 +++++++++++++++++++++++++++++++++
>   10 files changed, 470 insertions(+), 32 deletions(-)
> 

-- 
Best regard

Hyman Huang(黄勇)

