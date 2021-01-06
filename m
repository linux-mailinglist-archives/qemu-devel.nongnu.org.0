Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF5512EBA51
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jan 2021 08:08:57 +0100 (CET)
Received: from localhost ([::1]:46668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kx2wC-0005E5-HB
	for lists+qemu-devel@lfdr.de; Wed, 06 Jan 2021 02:08:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1kx2v3-0004f0-HY; Wed, 06 Jan 2021 02:07:45 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:3020)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1kx2uy-0004F3-13; Wed, 06 Jan 2021 02:07:45 -0500
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4D9gQD5RSpzj392;
 Wed,  6 Jan 2021 15:06:28 +0800 (CST)
Received: from [10.174.184.42] (10.174.184.42) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.498.0; Wed, 6 Jan 2021 15:07:13 +0800
Subject: Re: [PATCH v2 0/2] accel: kvm: Some bugfixes for kvm dirty log
To: Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, "Dr . David Alan Gilbert" <dgilbert@redhat.com>
References: <20201217014941.22872-1-zhukeqian1@huawei.com>
From: Keqian Zhu <zhukeqian1@huawei.com>
Message-ID: <6c1a62af-1aa7-cc7f-28de-9761d88faa8f@huawei.com>
Date: Wed, 6 Jan 2021 15:07:12 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <20201217014941.22872-1-zhukeqian1@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.184.42]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=zhukeqian1@huawei.com; helo=szxga05-in.huawei.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.249,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>, qemu-arm@nongnu.org,
 Zenghui Yu <yuzenghui@huawei.com>, wanghaibin.wang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Friendly ping ...

Hi, please queue this well reviewed series, Thanks :-)

Keqian

On 2020/12/17 9:49, Keqian Zhu wrote:
> Hi all,
> 
> This series fixes memory waste and adds alignment check for unmatched
> qemu_real_host_page_size and TARGET_PAGE_SIZE.
> 
> Thanks.
> 
> Keqian Zhu (2):
>   accel: kvm: Fix memory waste under mismatch page size
>   accel: kvm: Add aligment assert for kvm_log_clear_one_slot
> 
>  accel/kvm/kvm-all.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 

