Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D90F13600E6
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 06:20:09 +0200 (CEST)
Received: from localhost ([::1]:51748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWtU9-0007Ol-0k
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 00:20:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lWtT3-0006ye-2v
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 00:19:01 -0400
Received: from out28-169.mail.aliyun.com ([115.124.28.169]:38077)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lWtT0-0003aA-HH
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 00:19:00 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.1468707|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.0144587-0.00207649-0.983465;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047204; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=4; RT=4; SR=0; TI=SMTPD_---.K-CPmQq_1618460325; 
Received: from 10.0.2.15(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.K-CPmQq_1618460325)
 by smtp.aliyun-inc.com(10.147.41.120);
 Thu, 15 Apr 2021 12:18:45 +0800
Subject: Re: [Bug 1923629] [NEW] RISC-V Vector Instruction vssub.vv not
 saturating
To: Alistair Francis <alistair23@gmail.com>,
 Bug 1923629 <1923629@bugs.launchpad.net>, Kito Cheng <kito.cheng@sifive.com>
References: <161832726983.9430.3755052950345832110.malonedeb@chaenomeles.canonical.com>
 <CAKmqyKM7iVth4dzSLgdx6u=V3icoQuFnZ+JeqwUzmvim14BRRg@mail.gmail.com>
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
Message-ID: <d8a3da4f-69d5-d254-497b-c2a0397db029@c-sky.com>
Date: Thu, 15 Apr 2021 12:18:22 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAKmqyKM7iVth4dzSLgdx6u=V3icoQuFnZ+JeqwUzmvim14BRRg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: none client-ip=115.124.28.169; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-169.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Alistair,

I think that this bug has been resolved in my packed-extension patch set[1].

Would you mind to have a test and merge it before the whole patch set?

Thanks.


Best Regards,

Zhiwei

[1]: https://www.mail-archive.com/qemu-devel@nongnu.org/msg782125.html



On 2021/4/15 上午11:57, Alistair Francis wrote:
> + LIU Zhiwei and Kito Cheng
>
> Alistair
>
> On Wed, Apr 14, 2021 at 1:31 AM Tony Cole <1923629@bugs.launchpad.net> wrote:
>> Public bug reported:
>>
>> I noticed doing a negate ( 0 – 0x80000000 ) using vssub.vv produces an
>> incorrect result of 0x80000000 (should saturate to 0x7FFFFFFF).
>>
>> Here is the bit of the code:
>>
>>                  vmv.v.i         v16, 0
>>                  …
>> 8f040457        vssub.vv        v8,v16,v8
>>
>> I believe the instruction encoding is correct (vssub.vv with vd = v8,
>> vs2 = v16, rs1 = v8), but the result does not saturate in QEMU.
>>
>> I’ve just tested with what I think is the latest branch (
>> https://github.com/sifive/qemu/tree/rvv-1.0-upstream-v7 commit 26 Feb
>> 2021: 1151361fa7d45cc90d69086ccf1a4d8397931811 ) and the problem still
>> exists.
>>
>> ** Affects: qemu
>>       Importance: Undecided
>>           Status: New
>>
>>
>> ** Tags: riscv vector
>>
>> --
>> You received this bug notification because you are a member of qemu-
>> devel-ml, which is subscribed to QEMU.
>> https://bugs.launchpad.net/bugs/1923629
>>
>> Title:
>>    RISC-V Vector Instruction vssub.vv not saturating
>>
>> Status in QEMU:
>>    New
>>
>> Bug description:
>>    I noticed doing a negate ( 0 – 0x80000000 ) using vssub.vv produces an
>>    incorrect result of 0x80000000 (should saturate to 0x7FFFFFFF).
>>
>>    Here is the bit of the code:
>>
>>                  vmv.v.i         v16, 0
>>                  …
>>    8f040457      vssub.vv        v8,v16,v8
>>
>>    I believe the instruction encoding is correct (vssub.vv with vd = v8,
>>    vs2 = v16, rs1 = v8), but the result does not saturate in QEMU.
>>
>>    I’ve just tested with what I think is the latest branch (
>>    https://github.com/sifive/qemu/tree/rvv-1.0-upstream-v7 commit 26 Feb
>>    2021: 1151361fa7d45cc90d69086ccf1a4d8397931811 ) and the problem still
>>    exists.
>>
>> To manage notifications about this bug go to:
>> https://bugs.launchpad.net/qemu/+bug/1923629/+subscriptions
>>

