Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F55C349FC0
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 03:25:20 +0100 (CET)
Received: from localhost ([::1]:36454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPcA3-0005T1-56
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 22:25:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuzenghui@huawei.com>)
 id 1lPc94-0004uF-8Z; Thu, 25 Mar 2021 22:24:18 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:4401)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuzenghui@huawei.com>)
 id 1lPc91-0007xu-9i; Thu, 25 Mar 2021 22:24:17 -0400
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4F65Md1MwGz19JZG;
 Fri, 26 Mar 2021 10:22:05 +0800 (CST)
Received: from [10.174.185.179] (10.174.185.179) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.498.0; Fri, 26 Mar 2021 10:23:59 +0800
Subject: Re: [PATCH v3 6/7] hw/arm/smmuv3: Fix SMMU_CMD_CFGI_STE_RANGE handling
To: Auger Eric <eric.auger@redhat.com>, <eric.auger.pro@gmail.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <peter.maydell@linaro.org>,
 <mst@redhat.com>, <jean-philippe@linaro.org>, <peterx@redhat.com>,
 <jasowang@redhat.com>, <pbonzini@redhat.com>
References: <20210309102742.30442-1-eric.auger@redhat.com>
 <20210309102742.30442-7-eric.auger@redhat.com>
 <7fdc3340-51b5-3a89-7d41-2eac2c768829@huawei.com>
 <7a616c80-be1e-3c1d-2192-c8f4662760aa@redhat.com>
From: Zenghui Yu <yuzenghui@huawei.com>
Message-ID: <ce3b5301-21ab-39af-db73-c0dffda9b386@huawei.com>
Date: Fri, 26 Mar 2021 10:23:58 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <7a616c80-be1e-3c1d-2192-c8f4662760aa@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.185.179]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190; envelope-from=yuzenghui@huawei.com;
 helo=szxga04-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: vivek.gautam@arm.com, shameerali.kolothum.thodi@huawei.com,
 wanghaibin.wang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2021/3/25 23:09, Auger Eric wrote:
> Hi Zenghui,
> 
> On 3/25/21 3:18 PM, Zenghui Yu wrote:
>> which seems to be some bits that we had never taken into account. And
>> what I'm saying is roughly something like below (compile tested), any
>> thoughts?

[...]

> Thanks for spotting this discrepancy with the spec. This looks good to
> me, please feel free to then the patch.

Okay, I'll have a patch for that. Thanks Eric.


Zenghui

