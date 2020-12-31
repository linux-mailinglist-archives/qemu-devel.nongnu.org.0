Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE49F2E7DB3
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Dec 2020 03:28:28 +0100 (CET)
Received: from localhost ([::1]:37194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kunhT-0004XW-B6
	for lists+qemu-devel@lfdr.de; Wed, 30 Dec 2020 21:28:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhouyang789@huawei.com>)
 id 1kunfq-0003nk-2I; Wed, 30 Dec 2020 21:26:46 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2922)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhouyang789@huawei.com>)
 id 1kunfm-0001GU-7l; Wed, 30 Dec 2020 21:26:45 -0500
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4D5sSd3fhdzMCSr;
 Thu, 31 Dec 2020 10:25:21 +0800 (CST)
Received: from [10.108.234.244] (10.108.234.244) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.498.0; Thu, 31 Dec 2020 10:26:16 +0800
Subject: Re: [PATCH v2 0/5] Fix some style problems in contrib
From: "zhouyang (T)" <zhouyang789@huawei.com>
To: <alex.bennee@linaro.org>, <peter.maydell@linaro.org>
References: <f82ef80a-e3d9-0514-d238-f1b454b32c93@huawei.com>
Message-ID: <3e3a7822-f23b-5a9f-3cea-9f0869ba6b02@huawei.com>
Date: Thu, 31 Dec 2020 10:26:16 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <f82ef80a-e3d9-0514-d238-f1b454b32c93@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.108.234.244]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=zhouyang789@huawei.com; helo=szxga05-in.huawei.com
X-Spam_score_int: -75
X-Spam_score: -7.6
X-Spam_bar: -------
X-Spam_report: (-7.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.399,
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
Cc: qemu-trivial@nongnu.org, "Chenzhendong \(alex\)" <alex.chen@huawei.com>,
 qemu-devel@nongnu.org, hunongda <hunongda@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

kindly ping

On 2020/12/17 11:44, zhouyang (T) wrote:
> kindly ping
> 
>> v1 -> v2:
>> Changed the "From:" and "Signed-off-by:" lines from "zhouyang (T)"
>> to my real name "zhouyang".
>>
>> I found some style problems while check the code using checkpatch.pl
>> and fixed them, please review.
>>
>> zhouyang (5):
>>  contrib: Don't use '#' flag of printf format
>>  contrib: Fix some code style problems, ERROR: "foo * bar" should be
>>    "foo *bar"
>>  contrib: Add spaces around operator
>>  contrib: space required after that ','
>>  contrib: Open brace '{' following struct go on the same line
>>
>> contrib/ivshmem-server/main.c |  2 +-
>> contrib/plugins/hotblocks.c   |  2 +-
>> contrib/plugins/hotpages.c    |  2 +-
>> contrib/plugins/howvec.c      | 19 +++++++++----------
>> contrib/plugins/lockstep.c    |  6 +++---
>> 5 files changed, 15 insertions(+), 16 deletions(-)
>>
>> --
>> 2.23.0
> 

