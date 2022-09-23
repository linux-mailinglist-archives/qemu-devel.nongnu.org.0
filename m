Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7897F5E7D46
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 16:37:27 +0200 (CEST)
Received: from localhost ([::1]:54984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1objny-0004ty-K5
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 10:37:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luzhipeng@cestc.cn>)
 id 1objka-00021Q-6I; Fri, 23 Sep 2022 10:33:56 -0400
Received: from [106.39.185.57] (port=42686 helo=smtp.cecloud.com)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <luzhipeng@cestc.cn>)
 id 1objkV-0004Pz-BP; Fri, 23 Sep 2022 10:33:55 -0400
Received: from localhost (localhost [127.0.0.1])
 by smtp.cecloud.com (Postfix) with ESMTP id 0C6D3FC0203;
 Fri, 23 Sep 2022 22:33:35 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ANTISPAM-LEVEL: 2
X-SKE-CHECKED: 1
X-ABS-CHECKED: 1
Received: from [192.168.0.102] (1.39.88.218.broad.cd.sc.dynamic.163data.com.cn
 [218.88.39.1]) by smtp.cecloud.com (postfix) whith ESMTP id
 P51407T281469725307248S1663943614105692_; 
 Fri, 23 Sep 2022 22:33:34 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <8ea6e25ee459f2ecd7bdf21e21fccb73>
X-RL-SENDER: luzhipeng@cestc.cn
X-SENDER: luzhipeng@cestc.cn
X-LOGIN-NAME: luzhipeng@cestc.cn
X-FST-TO: kwolf@redhat.com
X-RCPT-COUNT: 4
X-SENDER-IP: 218.88.39.1
X-ATTACHMENT-NUM: 0
X-System-Flag: 0
Message-ID: <82ff13ee-1d8f-7907-bb58-3165a2ec624c@cestc.cn>
Date: Fri, 23 Sep 2022 22:33:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] block: unmap (discard) blocks only if discard_zeros flag
 is true
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>
References: <20220923100224.537-1-luzhipeng@cestc.cn>
 <Yy3Cfovcpq3OrOP1@redhat.com>
From: luzhipeng <luzhipeng@cestc.cn>
In-Reply-To: <Yy3Cfovcpq3OrOP1@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 106.39.185.57 (failed)
Received-SPF: pass client-ip=106.39.185.57; envelope-from=luzhipeng@cestc.cn;
 helo=smtp.cecloud.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



在 2022/9/23 22:28, Kevin Wolf 写道:
> Am 23.09.2022 um 12:02 hat luzhipeng geschrieben:
>> From: lu zhipeng <luzhipeng@cestc.cn>
>>
>> we can unmap(discard) blocks for block devices of supporting discard zeros
>> or regular file.
>>
>> Signed-off-by: lu zhipeng <luzhipeng@cestc.cn>
> 
> This more or less restores the state before commit 34fa110e. The commit
> message there explains that s->discard_zeroes is unreliable (in
> particular, it is false on block devices on recent kernels even though
> they may support zeroing by discard just fine).
> 
> We should instead remove s->discard_zeroes because it is currently
> unused. I'll send a patch.
> 
> Kevin
> 
> 
> 
OK



