Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FBDF52CA61
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 05:32:30 +0200 (CEST)
Received: from localhost ([::1]:58872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrWtp-0001Kk-Ll
	for lists+qemu-devel@lfdr.de; Wed, 18 May 2022 23:32:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1nrWqE-0004cS-AV
 for qemu-devel@nongnu.org; Wed, 18 May 2022 23:28:47 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.228]:32918
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1nrWqB-0007AB-Co
 for qemu-devel@nongnu.org; Wed, 18 May 2022 23:28:46 -0400
HMM_SOURCE_IP: 172.18.0.48:46344.554853993
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-36.111.64.85 (unknown [172.18.0.48])
 by chinatelecom.cn (HERMES) with SMTP id 981DC28011B;
 Thu, 19 May 2022 11:28:38 +0800 (CST)
X-189-SAVE-TO-SEND: huangy81@chinatelecom.cn
Received: from  ([172.18.0.48])
 by app0024 with ESMTP id 394f029f09824d6e807935c64d062a16 for
 qemu-devel@nongnu.org; Thu, 19 May 2022 11:28:41 CST
X-Transaction-ID: 394f029f09824d6e807935c64d062a16
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.48
X-MEDUSA-Status: 0
Message-ID: <2b5c3b07-7608-3741-0e3c-40c2b1bea04c@chinatelecom.cn>
Date: Thu, 19 May 2022 11:28:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v23 0/8] support dirty restraint on vCPU
To: qemu-devel <qemu-devel@nongnu.org>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <cover.1652929816.git.huangy81@chinatelecom.cn>
From: Hyman Huang <huangy81@chinatelecom.cn>
In-Reply-To: <cover.1652929816.git.huangy81@chinatelecom.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.228;
 envelope-from=huangy81@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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

sent by accident, please ignore, i'll resend when series is ready.

在 2022/5/19 11:25, huangy81@chinatelecom.cn 写道:
> From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> 
> This is v23 of dirtylimit series. Since v22 posted abount 1 month ago,
> i did some modifications to make sure it's ready to be queued:
> 
> - rebased the master and changed the qapi version tag from 7.0 to 7.1
> - do not set error if when query_vcpu_dirty_limit find dirtylimit not
>    in service, returning NULL is sufficient. (PATCH v22 [7/8]).
> 
> The following is the history of the patchset, since v22 kind of different from
> the original version, i made abstracts of changelog:
> 
> RFC and v1: https://lore.kernel.org/qemu-devel/cover.1637214721.git.huangy81@chinatelecom.cn/
> v2: https://lore.kernel.org/qemu-devel/cover.1637256224.git.huangy81@chinatelecom.cn/
> v1->v2 changelog:
> - rename some function and variables. refactor the original algo of dirtylimit. Thanks for
>    the comments given by Juan Quintela.
> v3: https://lore.kernel.org/qemu-devel/cover.1637403404.git.huangy81@chinatelecom.cn/
> v4: https://lore.kernel.org/qemu-devel/cover.1637653303.git.huangy81@chinatelecom.cn/
> v5: https://lore.kernel.org/qemu-devel/cover.1637759139.git.huangy81@chinatelecom.cn/
> v6: https://lore.kernel.org/qemu-devel/cover.1637856472.git.huangy81@chinatelecom.cn/
> v7: https://lore.kernel.org/qemu-devel/cover.1638202004.git.huangy81@chinatelecom.cn/
> v2->v7 changelog:
> - refactor the docs, annotation and fix bugs of the original algo of dirtylimit.
>    Thanks for the review given by Markus Armbruster.
> v8: https://lore.kernel.org/qemu-devel/cover.1638463260.git.huangy81@chinatelecom.cn/
> v9: https://lore.kernel.org/qemu-devel/cover.1638495274.git.huangy81@chinatelecom.cn/
> v10: https://lore.kernel.org/qemu-devel/cover.1639479557.git.huangy81@chinatelecom.cn/
> v7->v10 changelog:
> - introduce a simpler but more efficient algo of dirtylimit inspired by Peter Xu.
> - keep polishing the annotation suggested by Markus Armbruster.
> v11: https://lore.kernel.org/qemu-devel/cover.1641315745.git.huangy81@chinatelecom.cn/
> v12: https://lore.kernel.org/qemu-devel/cover.1642774952.git.huangy81@chinatelecom.cn/
> v13: https://lore.kernel.org/qemu-devel/cover.1644506963.git.huangy81@chinatelecom.cn/
> v10->v13 changelog:
> - handle the hotplug/unplug scenario.
> - refactor the new algo, split the commit and make the code more clean.
> v14: https://lore.kernel.org/qemu-devel/cover.1644509582.git.huangy81@chinatelecom.cn/
> v13->v14 changelog:
> - sent by accident.
> v15: https://lore.kernel.org/qemu-devel/cover.1644976045.git.huangy81@chinatelecom.cn/
> v16: https://lore.kernel.org/qemu-devel/cover.1645067452.git.huangy81@chinatelecom.cn/
> v17: https://lore.kernel.org/qemu-devel/cover.1646243252.git.huangy81@chinatelecom.cn/
> v14->v17 changelog:
> - do some code clean and fix test bug reported by Dr. David Alan Gilbert.
> v18: https://lore.kernel.org/qemu-devel/cover.1646247968.git.huangy81@chinatelecom.cn/
> v19: https://lore.kernel.org/qemu-devel/cover.1647390160.git.huangy81@chinatelecom.cn/
> v20: https://lore.kernel.org/qemu-devel/cover.1647396907.git.huangy81@chinatelecom.cn/
> v21: https://lore.kernel.org/qemu-devel/cover.1647435820.git.huangy81@chinatelecom.cn/
> v17->v21 changelog:
> - add qtest, fix bug and do code clean.
> v21->v22 changelog:
> - move the vcpu dirty limit test into migration-test and do some modification suggested
>    by Peter.
> 
> Please review.
> 
> Yong.
> 
> Abstract
> ========
> 
> This patchset introduce a mechanism to impose dirty restraint
> on vCPU, aiming to keep the vCPU running in a certain dirtyrate
> given by user. dirty restraint on vCPU maybe an alternative
> method to implement convergence logic for live migration,
> which could improve guest memory performance during migration
> compared with traditional method in theory.
> 
> For the current live migration implementation, the convergence
> logic throttles all vCPUs of the VM, which has some side effects.
> -'read processes' on vCPU will be unnecessarily penalized
> - throttle increase percentage step by step, which seems
>    struggling to find the optimal throttle percentage when
>    dirtyrate is high.
> - hard to predict the remaining time of migration if the
>    throttling percentage reachs 99%
> 
> to a certain extent, the dirty restraint machnism can fix these
> effects by throttling at vCPU granularity during migration.
> 
> the implementation is rather straightforward, we calculate
> vCPU dirtyrate via the Dirty Ring mechanism periodically
> as the commit 0e21bf246 "implement dirty-ring dirtyrate calculation"
> does, for vCPU that be specified to impose dirty restraint,
> we throttle it periodically as the auto-converge does, once after
> throttling, we compare the quota dirtyrate with current dirtyrate,
> if current dirtyrate is not under the quota, increase the throttling
> percentage until current dirtyrate is under the quota.
> 
> this patchset is the basis of implmenting a new auto-converge method
> for live migration, we introduce two qmp commands for impose/cancel
> the dirty restraint on specified vCPU, so it also can be an independent
> api to supply the upper app such as libvirt, which can use it to
> implement the convergence logic during live migration, supplemented
> with the qmp 'calc-dirty-rate' command or whatever.
> 
> we post this patchset for RFC and any corrections and suggetions about
> the implementation, api, throttleing algorithm or whatever are very
> appreciated!
> 
> Please review, thanks !
> 
> Best Regards !
> 
> Hyman Huang (8):
>    accel/kvm/kvm-all: Refactor per-vcpu dirty ring reaping
>    cpus: Introduce cpu_list_generation_id
>    migration/dirtyrate: Refactor dirty page rate calculation
>    softmmu/dirtylimit: Implement vCPU dirtyrate calculation periodically
>    accel/kvm/kvm-all: Introduce kvm_dirty_ring_size function
>    softmmu/dirtylimit: Implement virtual CPU throttle
>    softmmu/dirtylimit: Implement dirty page rate limit
>    tests: Add dirty page rate limit test
> 
>   accel/kvm/kvm-all.c             |  46 ++-
>   accel/stubs/kvm-stub.c          |   6 +
>   cpus-common.c                   |   8 +
>   hmp-commands-info.hx            |  13 +
>   hmp-commands.hx                 |  32 +++
>   include/exec/cpu-common.h       |   1 +
>   include/exec/memory.h           |   5 +-
>   include/hw/core/cpu.h           |   6 +
>   include/monitor/hmp.h           |   3 +
>   include/sysemu/dirtylimit.h     |  37 +++
>   include/sysemu/dirtyrate.h      |  28 ++
>   include/sysemu/kvm.h            |   2 +
>   migration/dirtyrate.c           | 227 +++++++++------
>   migration/dirtyrate.h           |   7 +-
>   qapi/migration.json             |  80 ++++++
>   softmmu/dirtylimit.c            | 601 ++++++++++++++++++++++++++++++++++++++++
>   softmmu/meson.build             |   1 +
>   softmmu/trace-events            |   7 +
>   tests/qtest/migration-helpers.c |  22 ++
>   tests/qtest/migration-helpers.h |   2 +
>   tests/qtest/migration-test.c    | 255 +++++++++++++++++
>   tests/qtest/qmp-cmd-test.c      |   2 +
>   22 files changed, 1292 insertions(+), 99 deletions(-)
>   create mode 100644 include/sysemu/dirtylimit.h
>   create mode 100644 include/sysemu/dirtyrate.h
>   create mode 100644 softmmu/dirtylimit.c
> 

-- 
Best regard

Hyman Huang(黄勇)

