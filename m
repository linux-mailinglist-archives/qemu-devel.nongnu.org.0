Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A0913F4318
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 03:36:47 +0200 (CEST)
Received: from localhost ([::1]:51768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mHytK-0007O9-FI
	for lists+qemu-devel@lfdr.de; Sun, 22 Aug 2021 21:36:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mHyry-0006jB-AV
 for qemu-devel@nongnu.org; Sun, 22 Aug 2021 21:35:22 -0400
Received: from szxga03-in.huawei.com ([45.249.212.189]:2214)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mHyrv-0000Sx-GW
 for qemu-devel@nongnu.org; Sun, 22 Aug 2021 21:35:22 -0400
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4GtFCy3yDBz895v;
 Mon, 23 Aug 2021 09:34:54 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 23 Aug 2021 09:34:57 +0800
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Mon, 23 Aug 2021 09:34:57 +0800
Subject: Re: [PATCH 2/2] docs/about: Unify the subject format
To: Cornelia Huck <cohuck@redhat.com>, <qemu-devel@nongnu.org>,
 <libvir-list@redhat.com>
References: <20210820015628.173532-1-wangyanan55@huawei.com>
 <20210820015628.173532-3-wangyanan55@huawei.com> <87zgtcqv1d.fsf@redhat.com>
From: "wangyanan (Y)" <wangyanan55@huawei.com>
Message-ID: <c656d61b-4f08-7103-66e4-7a9efe685548@huawei.com>
Date: Mon, 23 Aug 2021 09:34:56 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <87zgtcqv1d.fsf@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme710-chm.china.huawei.com (10.1.199.106) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.189;
 envelope-from=wangyanan55@huawei.com; helo=szxga03-in.huawei.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.959,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Andrew Jones <drjones@redhat.com>, wanghaibin.wang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2021/8/20 18:18, Cornelia Huck wrote:
> On Fri, Aug 20 2021, Yanan Wang <wangyanan55@huawei.com> wrote:
>
>> Unify the subject format in deprecated.rst to "since X.Y".
>> Unify the subject format in removed-features.rst to "removed in X.Y".
> It seems unlikely that we will ever deprecate something in a stable
> release, and even more unlikely that we'll remove something in one, so
> the short versions look like the thing we want to standardize on.
>
>> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
>> ---
>>   docs/about/deprecated.rst       | 56 ++++++++++++++++-----------------
>>   docs/about/removed-features.rst | 28 ++++++++---------
>>   2 files changed, 42 insertions(+), 42 deletions(-)
> Unrelated to your patch, line 143 in removed-features.rst reads
>
> ``-vnc ...,tls=...``, ``-vnc ...,x509=...`` & ``-vnc ...,x509verify=...``
>
> and is missing the release it was removed in (presumably 3.1?)
Yes, this part of section was introduced by commit 29e0447551
(docs/about/removed-features: Document removed CLI options from QEMU v3.1),
so I think a record of "removed in 3.1" is needed. I rechecked both 
deprecated.rst
and removed-features.rst, and this is the only place where we are 
missing a release.
I can fix this in a third patch.
> Anyway,
>
> Reviewed-by: Cornelia Huck <cohuck@redhat.com>
>
> .
Thanks,
Yanan


