Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF433B5D6A
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 13:54:11 +0200 (CEST)
Received: from localhost ([::1]:43844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxpq6-0000xD-6t
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 07:54:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1lxppA-0008TA-M7; Mon, 28 Jun 2021 07:53:12 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:2151)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1lxpp7-0003ff-Lm; Mon, 28 Jun 2021 07:53:12 -0400
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4GD5W959vPz75C5;
 Mon, 28 Jun 2021 19:49:41 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 28 Jun 2021 19:53:01 +0800
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Mon, 28 Jun 2021 19:53:00 +0800
Subject: Re: [RFC PATCH v4 0/7] hw/arm/virt: Introduce cpu topology support
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210622093413.13360-1-wangyanan55@huawei.com>
 <YNG44c9KtaiNXT7b@redhat.com> <20210622114634.crjqusw6x6oj4j6v@gator>
 <bc47a66a-b1ff-939c-32a2-94c90efd0caf@huawei.com>
 <YNHalhuNZhMa665J@redhat.com>
 <7fcc5f2d-cc84-3464-15cc-3bebb07f8190@huawei.com>
 <YNHvcQAMLSpVcxaE@redhat.com>
 <CAFEAcA9X9fYAFAux4h2n00kYpTgxkNcJg6Ako7s6ndU4KWTJyQ@mail.gmail.com>
 <YNHzqHMkfSWCHA3i@redhat.com>
 <909af1cb-7e7b-7532-06b5-69cd9487e001@huawei.com>
 <YNmzLTSIQrLPm6TF@redhat.com>
From: "wangyanan (Y)" <wangyanan55@huawei.com>
Message-ID: <f4c3693f-8200-2004-f5eb-ed2ddfe62761@huawei.com>
Date: Mon, 28 Jun 2021 19:53:00 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <YNmzLTSIQrLPm6TF@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme720-chm.china.huawei.com (10.1.199.116) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=wangyanan55@huawei.com; helo=szxga02-in.huawei.com
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
Cc: Barry Song <song.bao.hua@hisilicon.com>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, wanghaibin.wang@huawei.com, QEMU
 Developers <qemu-devel@nongnu.org>, yangyicong@huawei.com,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 "Zengtao \(B\)" <prime.zeng@hisilicon.com>,
 Igor Mammedov <imammedo@redhat.com>, Zenghui Yu <yuzenghui@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Keqian Zhu <zhukeqian1@huawei.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2021/6/28 19:31, Daniel P. Berrangé wrote:
> On Mon, Jun 28, 2021 at 07:14:02PM +0800, wangyanan (Y) wrote:
>> Hi Daniel,
>>
>> On 2021/6/22 22:28, Daniel P. Berrangé wrote:
>>> On Tue, Jun 22, 2021 at 03:15:18PM +0100, Peter Maydell wrote:
>>>> On Tue, 22 Jun 2021 at 15:11, Daniel P. Berrangé <berrange@redhat.com> wrote:
>>>>> The QEMU man page says this explicitly
>>>>>
>>>>>                    For the PC target, the number of cores per die, the
>>>>>       number of threads per cores, the number of dies per packages and the
>>>>>       total number of sockets can be specified. Missing values will be
>>>>>       computed. If any on the three values is given, the total number of
>>>>>       CPUs n can be omitted.
>>>> Anybody feel like submitting a patch to fix the typo? Should read
>>>> "If any of"...
>>> Actually looking at the broader text for -smp, the whole thing just needs
>>> to be rewritten from scratch IMHO. I'll send a patch....
>> Do you have any plan to rewrite the -smp text in qemu-options.hx recently?
>>
>> I suggest that we explain in more detail how the missing values will
>> be computed, so that qemu users can have a clear image of what a
>> -smp parameter collection would be parsed out if they are using an
>> incomplete cmdline and have read the man page.
>>
>> Also if we all agree to prefer cores over sockets for all arches since
>> machine type 6.2, I'll be glad to add this change for the man page
>> and update the parsing helpers in next version of this patch series.
> I wrote a docs update on friday, which I've just sent out as a short
> patch series with yourself CC'd.  I wrote it such that we can easily
> update it again, if we want to prefer cores over sockets.
>
Great, thanks. I'm going to have a look.

Thanks,
Yanan
.


