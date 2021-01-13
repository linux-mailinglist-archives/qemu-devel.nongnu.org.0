Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D020E2F44A9
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 07:50:44 +0100 (CET)
Received: from localhost ([::1]:56940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzZzP-0006UI-QB
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 01:50:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhouyang789@huawei.com>)
 id 1kzZyF-0005cI-Dc; Wed, 13 Jan 2021 01:49:31 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:2585)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhouyang789@huawei.com>)
 id 1kzZyB-0000HS-FP; Wed, 13 Jan 2021 01:49:31 -0500
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4DFyh54gzRzj5HG;
 Wed, 13 Jan 2021 14:48:21 +0800 (CST)
Received: from [10.108.234.244] (10.108.234.244) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.498.0; Wed, 13 Jan 2021 14:49:02 +0800
Subject: Ping: [PATCH v2 0/5] Fix some style problems in contrib
From: "zhouyang (T)" <zhouyang789@huawei.com>
To: <alex.bennee@linaro.org>, <peter.maydell@linaro.org>
References: <f82ef80a-e3d9-0514-d238-f1b454b32c93@huawei.com>
 <3e3a7822-f23b-5a9f-3cea-9f0869ba6b02@huawei.com>
Message-ID: <489ea67e-acaf-1a90-432e-8841435fae3d@huawei.com>
Date: Wed, 13 Jan 2021 14:49:01 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <3e3a7822-f23b-5a9f-3cea-9f0869ba6b02@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.108.234.244]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32;
 envelope-from=zhouyang789@huawei.com; helo=szxga06-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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

Hi Peter,

Friendly ping again, It's been more than a month since I submitted the patch,did I miss any response?

On 2020/12/31 10:26, zhouyang (T) wrote:
> kindly ping
> 
> On 2020/12/17 11:44, zhouyang (T) wrote:
>> kindly ping
>>
>>> v1 -> v2:
>>> Changed the "From:" and "Signed-off-by:" lines from "zhouyang (T)"
>>> to my real name "zhouyang".
>>>
>>> I found some style problems while check the code using checkpatch.pl
>>> and fixed them, please review.
>>>
>>> zhouyang (5):
>>>  contrib: Don't use '#' flag of printf format
>>>  contrib: Fix some code style problems, ERROR: "foo * bar" should be
>>>    "foo *bar"
>>>  contrib: Add spaces around operator
>>>  contrib: space required after that ','
>>>  contrib: Open brace '{' following struct go on the same line
>>>
>>> contrib/ivshmem-server/main.c |  2 +-
>>> contrib/plugins/hotblocks.c   |  2 +-
>>> contrib/plugins/hotpages.c    |  2 +-
>>> contrib/plugins/howvec.c      | 19 +++++++++----------
>>> contrib/plugins/lockstep.c    |  6 +++---
>>> 5 files changed, 15 insertions(+), 16 deletions(-)
>>>
>>> --
>>> 2.23.0
>>

