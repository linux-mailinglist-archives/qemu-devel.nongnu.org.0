Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C97F39D29F
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 03:31:23 +0200 (CEST)
Received: from localhost ([::1]:58686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lq46s-00033V-Ba
	for lists+qemu-devel@lfdr.de; Sun, 06 Jun 2021 21:31:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1lq40M-00047f-QR
 for qemu-devel@nongnu.org; Sun, 06 Jun 2021 21:24:39 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.220]:44282
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1lq40J-0003tz-Kg
 for qemu-devel@nongnu.org; Sun, 06 Jun 2021 21:24:38 -0400
HMM_SOURCE_IP: 172.18.0.48:58294.1587860453
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-182.138.181.182?logid-8b86a17fa908486d99dd7cd09d5b3943
 (unknown [172.18.0.48])
 by chinatelecom.cn (HERMES) with SMTP id BB69228008E;
 Mon,  7 Jun 2021 09:24:32 +0800 (CST)
X-189-SAVE-TO-SEND: huangy81@chinatelecom.cn
Received: from  ([172.18.0.48])
 by app0024 with ESMTP id 8b86a17fa908486d99dd7cd09d5b3943 for
 zhengchuan@huawei.com; Mon Jun  7 09:24:33 2021
X-Transaction-ID: 8b86a17fa908486d99dd7cd09d5b3943
X-filter-score: filter<0>
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.48
X-MEDUSA-Status: 0
Subject: Re: [PATCH v3 0/7] support dirtyrate at the granualrity of vcpu
To: qemu-devel@nongnu.org
References: <cover.1623027729.git.huangy81@chinatelecom.cn>
From: Hyman <huangy81@chinatelecom.cn>
Message-ID: <6b8126ce-2289-f305-9c4d-7d1221e9e68e@chinatelecom.cn>
Date: Mon, 7 Jun 2021 09:24:28 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <cover.1623027729.git.huangy81@chinatelecom.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.220;
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Chuan Zheng <zhengchuan@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

cc Chuan Zheng <zhengchuan@huawei.com>

在 2021/6/7 9:11, huangy81@chinatelecom.cn 写道:
> From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> 
> v3:
> - pick up "migration/dirtyrate: make sample page count configurable" to
>    make patchset apply master correctly
> 
> v2:
> - rebase to "migration/dirtyrate: make sample page count configurable"
> 
> - rename "vcpu" to "per_vcpu" to show the per-vcpu method
> 
> - squash patch 5/6 into a single one, squash patch 1/2 also
> 
> - pick up "hmp: Add "calc_dirty_rate" and "info dirty_rate" cmds"
> 
> - make global_dirty_log a bitmask to make sure both migration and dirty
>    could not intefer with each other
> 
> - add memory free callback to prevent memory leaking
> 
> the most different of v2 fron v1 is that we make the global_dirty_log a
> bitmask. the reason is dirty rate measurement may start or stop dirty
> logging during calculation. this conflict with migration because stop
> dirty log make migration leave dirty pages out then that'll be a
> problem.
> 
> make global_dirty_log a bitmask can let both migration and dirty
> rate measurement work fine. introduce GLOBAL_DIRTY_MIGRATION and
> GLOBAL_DIRTY_DIRTY_RATE to distinguish what current dirty log aims
> for, migration or dirty rate.
>      
> all references to global_dirty_log should be untouched because any bit
> set there should justify that global dirty logging is enabled.
> 
> Please review, thanks !
> 
> v1:
> 
> Since the Dirty Ring on QEMU part has been merged recently, how to use
> this feature is under consideration.
> 
> In the scene of migration, it is valuable to provide a more accurante
> interface to track dirty memory than existing one, so that the upper
> layer application can make a wise decision, or whatever. More
> importantly,
> dirtyrate info at the granualrity of vcpu could provide a possibility to
> make migration convergent by imposing restriction on vcpu. With Dirty
> Ring, we can calculate dirtyrate efficiently and cheaply.
> 
> The old interface implemented by sampling pages, it consumes cpu
> resource, and the larger guest memory size become, the more cpu resource
> it consumes, namely, hard to scale. New interface has no such drawback.
> 
> Please review, thanks !
> 
> Best Regards !
> 
> Hyman Huang(黄勇) (6):
>    migration/dirtyrate: make sample page count configurable
>    KVM: introduce dirty_pages and kvm_dirty_ring_enabled
>    migration/dirtyrate: add per-vcpu option for calc-dirty-rate
>    migration/dirtyrate: adjust struct DirtyRateStat
>    memory: make global_dirty_log a bitmask
>    migration/dirtyrate: implement dirty-ring dirtyrate calculation
> 
> Peter Xu (1):
>    hmp: Add "calc_dirty_rate" and "info dirty_rate" cmds
> 
>   accel/kvm/kvm-all.c    |   7 +
>   hmp-commands-info.hx   |  13 ++
>   hmp-commands.hx        |  15 ++
>   include/exec/memory.h  |  13 +-
>   include/hw/core/cpu.h  |   1 +
>   include/monitor/hmp.h  |   2 +
>   include/sysemu/kvm.h   |   1 +
>   migration/dirtyrate.c  | 347 ++++++++++++++++++++++++++++++++++++++---
>   migration/dirtyrate.h  |  27 +++-
>   migration/ram.c        |   8 +-
>   migration/trace-events |   5 +
>   qapi/migration.json    |  38 ++++-
>   softmmu/memory.c       |  36 +++--
>   13 files changed, 468 insertions(+), 45 deletions(-)
> 

