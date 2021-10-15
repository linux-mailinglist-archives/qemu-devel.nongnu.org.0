Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5090A42E663
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 04:09:16 +0200 (CEST)
Received: from localhost ([::1]:52104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbCep-0005Bf-FK
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 22:09:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1mbCdB-0003vO-EU
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 22:07:33 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.226]:48775
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1mbCd8-0005kg-H5
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 22:07:33 -0400
HMM_SOURCE_IP: 172.18.0.218:57572.1868656741
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-182.150.57.243 (unknown [172.18.0.218])
 by chinatelecom.cn (HERMES) with SMTP id 78F6A2800E3;
 Fri, 15 Oct 2021 10:07:05 +0800 (CST)
X-189-SAVE-TO-SEND: huangy81@chinatelecom.cn
Received: from  ([172.18.0.218])
 by app0025 with ESMTP id 66cf86384b224b089b45b055aab3ba3e for
 zhengchuan@huawei.com; Fri, 15 Oct 2021 10:07:10 CST
X-Transaction-ID: 66cf86384b224b089b45b055aab3ba3e
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.218
Subject: Re: [PATCH v12 0/6] support dirtyrate at the granualrity of vcpu
To: Peter Xu <peterx@redhat.com>
References: <cover.1624982116.git.huangy81@chinatelecom.cn>
 <YWjaQ80LZGvPPoeX@t490s>
From: Hyman Huang <huangy81@chinatelecom.cn>
Message-ID: <78929c64-ca4d-6c6a-f371-99cd508e958a@chinatelecom.cn>
Date: Fri, 15 Oct 2021 10:07:00 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YWjaQ80LZGvPPoeX@t490s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.226;
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
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Chuan Zheng <zhengchuan@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



在 2021/10/15 9:32, Peter Xu 写道:
> On Wed, Jun 30, 2021 at 12:01:17AM +0800, huangy81@chinatelecom.cn wrote:
>> From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
>>
>> v12
>> - adjust the order of calculating dirty rate
>>    let memory_global_dirty_log_sync before calculating as
>>    v11 version description.
> 
> Ping for Yong. >
> Dave/Juan, any plan to review/merge this series (along with the other series of
> dirty logging)?
> 
> I found it useful when I wanted to modify the program I used to generate
> constant dirty workload - this series can help me to verify the change.
> 
> I still keep thinking this series is something good to have.  Thanks,
the dirtyrate calculation has already been used to estimate time of live 
migration in "e cloud" production of chinatelecom, it also predict the 
migration success ratio, which provide valuable information for the 
cloud management plane when selecting which vm should be migrated.
> 

-- 
Best regard

Hyman Huang(黄勇)

