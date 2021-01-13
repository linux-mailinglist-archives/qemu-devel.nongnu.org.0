Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50F162F44FF
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 08:16:09 +0100 (CET)
Received: from localhost ([::1]:46396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzaO0-00076u-Ca
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 02:16:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shiliyang@huawei.com>)
 id 1kzaLB-0006GR-CL
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 02:13:13 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2927)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shiliyang@huawei.com>)
 id 1kzaL7-0003L1-HS
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 02:13:13 -0500
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4DFzBv2257zMJDv;
 Wed, 13 Jan 2021 15:11:35 +0800 (CST)
Received: from [10.108.235.13] (10.108.235.13) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.498.0; Wed, 13 Jan 2021 15:12:43 +0800
Subject: Re: [PATCH] crypto: Fix some code style problems, add spaces around
 operator
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <eec07863-d8fa-1ad0-5b64-4683d48478ab@huawei.com>
 <d0196f04-a286-c36b-d88e-0a3f8de8f599@redhat.com>
From: shiliyang <shiliyang@huawei.com>
Message-ID: <b520d663-6930-025d-5f3e-e8742ae7650e@huawei.com>
Date: Wed, 13 Jan 2021 15:12:42 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <d0196f04-a286-c36b-d88e-0a3f8de8f599@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.108.235.13]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191; envelope-from=shiliyang@huawei.com;
 helo=szxga05-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Cc: alex.chen@huawei.com, hunongda@huawei.com, berrange@redhat.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Kindly ping. This patch still not on the master branch.
Please take it on your tree.

Thanks.

On 2020/12/7 18:10, Philippe Mathieu-Daudé wrote:
> On 12/7/20 9:37 AM, shiliyang wrote:
>> This patch fixes error style problems found by checkpatch.pl:
>> ERROR: spaces required around that '*'
>> ERROR: space required after that ','
>> ERROR: spaces required around that '|'
>>
>> Signed-off-by: Liyang Shi <shiliyang@huawei.com>
>> ---
>>  crypto/aes.c          | 2 +-
>>  crypto/desrfb.c       | 2 +-
>>  crypto/tlscredsx509.c | 2 +-
>>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> 
> .
> 

