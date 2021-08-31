Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5700C3FC0AC
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 04:04:35 +0200 (CEST)
Received: from localhost ([::1]:52838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKt8c-0007MM-6e
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 22:04:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mKt60-0006b0-3R; Mon, 30 Aug 2021 22:01:55 -0400
Received: from szxga03-in.huawei.com ([45.249.212.189]:2227)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mKt5v-0008VZ-AW; Mon, 30 Aug 2021 22:01:50 -0400
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4Gz9Qh0VbLz8CQ0;
 Tue, 31 Aug 2021 10:01:16 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 31 Aug 2021 10:01:25 +0800
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.8; Tue, 31 Aug 2021 10:01:25 +0800
Subject: Re: [PATCH v4 1/5] hw, spapr: add 6.2 compat pseries machine
To: Peter Maydell <peter.maydell@linaro.org>, Greg Kurz <groug@kaod.org>
References: <20210827092455.125411-1-danielhb413@gmail.com>
 <20210827092455.125411-2-danielhb413@gmail.com>
 <20210830093446.0b80edfb@bahia.lan>
 <CAFEAcA9chWuKEOiGce-Db8Orz81eCjKhHvvbOKAuRMW34wUQ=w@mail.gmail.com>
From: "wangyanan (Y)" <wangyanan55@huawei.com>
Message-ID: <3e801256-4ee7-9185-d19d-ebe8c5f2740a@huawei.com>
Date: Tue, 31 Aug 2021 10:01:26 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9chWuKEOiGce-Db8Orz81eCjKhHvvbOKAuRMW34wUQ=w@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme716-chm.china.huawei.com (10.1.199.112) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.189;
 envelope-from=wangyanan55@huawei.com; helo=szxga03-in.huawei.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.932,
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 qemu-ppc <qemu-ppc@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 2021/8/31 2:32, Peter Maydell wrote:
> On Mon, 30 Aug 2021 at 08:36, Greg Kurz <groug@kaod.org> wrote:
>> On Fri, 27 Aug 2021 06:24:51 -0300
>> Daniel Henrique Barboza <danielhb413@gmail.com> wrote:
>>
>>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>>> ---
>> We usually introduce the compat machine types for all archs in a
>> single patch. One was already posted for 6.2 :
>>
>> https://patchwork.ozlabs.org/project/qemu-devel/patch/20210823122804.7692-7-wangyanan55@huawei.com/
> Would somebody like to fish that patch out of the unrelated large
> series it was posted in so that it can get into the tree sooner?
>
Now I have resent that patch separately, and hopefully someone will take 
it. :)

Thanks,
Yanan


