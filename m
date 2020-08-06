Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7508523D840
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Aug 2020 11:03:13 +0200 (CEST)
Received: from localhost ([::1]:54272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k3bns-0007KQ-JH
	for lists+qemu-devel@lfdr.de; Thu, 06 Aug 2020 05:03:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1k3bn2-0006ph-MW; Thu, 06 Aug 2020 05:02:20 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:54504 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1k3bn0-0003bN-8R; Thu, 06 Aug 2020 05:02:20 -0400
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 94D6A26FA6178419FBCD;
 Thu,  6 Aug 2020 17:02:11 +0800 (CST)
Received: from [10.174.185.104] (10.174.185.104) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.487.0; Thu, 6 Aug 2020 17:02:02 +0800
Subject: Re: [PATCH] qcow2: flush qcow2 l2 meta for new allocated clusters
To: <qemu-devel@nongnu.org>, <kwolf@redhat.com>, <mreitz@redhat.com>
References: <159659539087.12210.2061753185498913487@66eaa9a8a123>
From: Ying Fang <fangying1@huawei.com>
Message-ID: <6239531a-08d8-e538-30ac-ee58fef77aec@huawei.com>
Date: Thu, 6 Aug 2020 17:01:51 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <159659539087.12210.2061753185498913487@66eaa9a8a123>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.185.104]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.35; envelope-from=fangying1@huawei.com;
 helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/06 03:36:23
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Cc: alex.chen@huawei.com, zhang.zhanghailiang@huawei.com, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 8/5/2020 10:43 AM, no-reply@patchew.org wrote:
> Patchew URL: https://patchew.org/QEMU/20200805023826.184-1-fangying1@huawei.com/
> 
> 
> 
> Hi,
> 
> This series failed the docker-quick@centos7 build test. Please find the testing commands and
> their output below. If you have Docker installed, you can probably reproduce it
> locally.
> I see some error message which says ** No space left on device **
However I do not know what is wrong with this build test.
Could you give me some help here?

Updating 3c8cf5a9c21ff8782164d1def7f44bd888713384
error: copy-fd: write returned No space left on device
fatal: failed to copy file to 
'/var/tmp/patchew-tester-tmp-wtnwtuq5/src/.git/objects/pack/pack-518a8ad92e3ce11d2627a7221e2d360b337cb27d.pack': 
No space left on device
fatal: The remote end hung up unexpectedly
Traceback (most recent call last):
   File "patchew-tester/src/patchew-cli", line 521, in test_one
     git_clone_repo(clone, r["repo"], r["head"], logf, True)
   File "patchew-tester/src/patchew-cli", line 53, in git_clone_repo
     subprocess.check_call(clone_cmd, stderr=logf, stdout=logf)
   File "/opt/rh/rh-python36/root/usr/lib64/python3.6/subprocess.py", 
line 291, in check_call
     raise CalledProcessError(retcode, cmd)
subprocess.CalledProcessError: Command '['git', 'clone', '-q', 
'/home/patchew/.cache/patchew-git-cache/httpsgithubcompatchewprojectqemu-3c8cf5a9c21ff8782164d1def7f44bd888713384', 
'/var/tmp/patchew-tester-tmp-wtnwtuq5/src']' returned non-zero exit 
status 128.

> 
> 
> 
> 
> 
> The full log is available at
> http://patchew.org/logs/20200805023826.184-1-fangying1@huawei.com/testing.docker-quick@centos7/?type=message.
> ---
> Email generated automatically by Patchew [https://patchew.org/].
> Please send your feedback to patchew-devel@redhat.com
> 

