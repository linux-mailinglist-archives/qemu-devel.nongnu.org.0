Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB7A2A46C4
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Nov 2020 14:44:37 +0100 (CET)
Received: from localhost ([::1]:42026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kZwc0-0007fk-G5
	for lists+qemu-devel@lfdr.de; Tue, 03 Nov 2020 08:44:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1kZwai-0006WF-8b; Tue, 03 Nov 2020 08:43:16 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2389)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1kZwad-0004js-SK; Tue, 03 Nov 2020 08:43:15 -0500
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CQWFJ12c8z15N85;
 Tue,  3 Nov 2020 21:43:00 +0800 (CST)
Received: from [10.174.187.138] (10.174.187.138) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.487.0; Tue, 3 Nov 2020 21:42:59 +0800
Message-ID: <5FA15E63.1000608@huawei.com>
Date: Tue, 3 Nov 2020 21:42:59 +0800
From: AlexChen <alex.chen@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.2; WOW64;
 rv:17.0) Gecko/20130509 Thunderbird/17.0.6
MIME-Version: 1.0
To: Max Reitz <mreitz@redhat.com>
Subject: Re: block: Remove unused include
References: <5F8FFB94.3030209@huawei.com>
 <98121829-c9fc-9ee4-a962-b3ea2a47e028@redhat.com>
In-Reply-To: <98121829-c9fc-9ee4-a962-b3ea2a47e028@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.187.138]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190; envelope-from=alex.chen@huawei.com;
 helo=szxga04-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/03 04:56:56
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
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
Cc: kwolf@redhat.com, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2020/11/3 21:26, Max Reitz wrote:
> On 21.10.20 11:12, AlexChen wrote:
>> The "qemu-common.h" include is not used, remove it.
>>
>> Reported-by: Euler Robot <euler.robot@huawei.com>
>> Signed-off-by: AlexChen <alex.chen@huawei.com>
>> ---
>>  block/dmg-lzfse.c | 1 -
>>  1 file changed, 1 deletion(-)
> 
> Thanks, I’ve applied this patch to my block branch:
> 
> https://git.xanclic.moe/XanClic/qemu/commits/branch/block
> 
> Please note (for future patches) that all patches’ subjects should by
> prefixed by “[PATCH]”, as done by git format-patch (see
> https://wiki.qemu.org/Contribute/SubmitAPatch#Use_git_format-patch).
>

Oh, this is my fault, I will pay attention to this in my subsequent patches.

Thanks,
Alex


