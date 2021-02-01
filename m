Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C82BC30A85A
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 14:11:19 +0100 (CET)
Received: from localhost ([::1]:57498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6Yz8-0004tp-T1
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 08:11:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1l6Ywb-0003R8-O9; Mon, 01 Feb 2021 08:08:41 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:3302)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1l6YwT-0003Rt-23; Mon, 01 Feb 2021 08:08:41 -0500
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4DTp9m6XPhzlF09;
 Mon,  1 Feb 2021 21:06:36 +0800 (CST)
Received: from [10.174.184.42] (10.174.184.42) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.498.0; Mon, 1 Feb 2021 21:07:59 +0800
Subject: Re: [PATCH v2 0/2] accel: kvm: Some bugfixes for kvm dirty log
References: <20201217014941.22872-1-zhukeqian1@huawei.com>
 <b81889c3-2823-22b1-9087-75157abc414f@huawei.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, "Dr . David Alan Gilbert" <dgilbert@redhat.com>
From: Keqian Zhu <zhukeqian1@huawei.com>
Message-ID: <2be6b8cc-30ee-dcd4-87ca-215fc9161cfb@huawei.com>
Date: Mon, 1 Feb 2021 21:07:59 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <b81889c3-2823-22b1-9087-75157abc414f@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.184.42]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=zhukeqian1@huawei.com; helo=szxga04-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Andrew Jones <drjones@redhat.com>, jiangkunkun@huawei.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi All,

Kindly Ping ;-) ...

On 2021/1/25 15:51, Keqian Zhu wrote:
> Hi Paolo,
> 
> Any suggestions on this patch series :-) ? Thanks,
> 
> Keqian
> 
> On 2020/12/17 9:49, Keqian Zhu wrote:
>> Hi all,
>>
>> This series fixes memory waste and adds alignment check for unmatched
>> qemu_real_host_page_size and TARGET_PAGE_SIZE.
>>
>> Thanks.
>>
>> Keqian Zhu (2):
>>   accel: kvm: Fix memory waste under mismatch page size
>>   accel: kvm: Add aligment assert for kvm_log_clear_one_slot
>>
>>  accel/kvm/kvm-all.c | 13 ++++++++++++-
>>  1 file changed, 12 insertions(+), 1 deletion(-)
>>
> 
> .
> 

