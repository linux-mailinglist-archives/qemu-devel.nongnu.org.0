Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D7415A1A8
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Feb 2020 08:18:49 +0100 (CET)
Received: from localhost ([::1]:32852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j1mIK-0007pE-9D
	for lists+qemu-devel@lfdr.de; Wed, 12 Feb 2020 02:18:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54093)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhiwei_liu@c-sky.com>) id 1j1mGz-0006yJ-GQ
 for qemu-devel@nongnu.org; Wed, 12 Feb 2020 02:17:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <zhiwei_liu@c-sky.com>) id 1j1mGx-0005lM-3L
 for qemu-devel@nongnu.org; Wed, 12 Feb 2020 02:17:25 -0500
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:56729)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1j1mGw-0005iU-GK; Wed, 12 Feb 2020 02:17:23 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.2234684|-1; CH=green;
 DM=CONTINUE|CONTINUE|true|0.323115-0.0237869-0.653098;
 DS=CONTINUE|ham_regular_dialog|0.0296133-0.00190767-0.968479;
 FP=0|0|0|0|0|-1|-1|-1; HT=e02c03301; MF=zhiwei_liu@c-sky.com; NM=1; PH=DS;
 RN=8; RT=8; SR=0; TI=SMTPD_---.GnBjSQy_1581491829; 
Received: from 192.168.3.18(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.GnBjSQy_1581491829)
 by smtp.aliyun-inc.com(10.147.42.198);
 Wed, 12 Feb 2020 15:17:10 +0800
Subject: Re: [PATCH v4 1/4] target/riscv: add vector extension field in
 CPURISCVState
To: Richard Henderson <richard.henderson@linaro.org>, alistair23@gmail.com,
 chihmin.chao@sifive.com, palmer@dabbelt.com
References: <20200210081240.11481-1-zhiwei_liu@c-sky.com>
 <20200210081240.11481-2-zhiwei_liu@c-sky.com>
 <cc4d0b93-013f-5cf5-4ff4-248ab99eec70@linaro.org>
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
Message-ID: <04a3b70a-a28b-c2d8-89aa-1882cd5186a8@c-sky.com>
Date: Wed, 12 Feb 2020 15:17:11 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <cc4d0b93-013f-5cf5-4ff4-248ab99eec70@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 121.197.200.217
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
Cc: wenmeng_zhang@c-sky.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 wxy194768@alibaba-inc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 2020/2/11 23:53, Richard Henderson wrote:
> On 2/10/20 8:12 AM, LIU Zhiwei wrote:
>> The 32 vector registers will be viewed as a continuous memory block.
>> It avoids the convension between element index and (regno,offset).
>> Thus elements can be directly accessed by offset from the first vector
>> base address.
>>
>> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
>> ---
>>   target/riscv/cpu.h | 13 +++++++++++++
>>   1 file changed, 13 insertions(+)
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>
> I still don't think you need to put stuff into a sub-structure.  These register
> names are unique in the manual, and not subdivided there.
OK. I will scatter these registers next patch.
>
> r~


