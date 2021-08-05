Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EEA83E1006
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 10:14:13 +0200 (CEST)
Received: from localhost ([::1]:36038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBYW4-0001D1-Gt
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 04:14:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mBYUT-0007a1-Sy; Thu, 05 Aug 2021 04:12:33 -0400
Received: from out28-195.mail.aliyun.com ([115.124.28.195]:56254)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mBYUN-0005te-8S; Thu, 05 Aug 2021 04:12:33 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.1355942|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_regular_dialog|0.0213493-0.000391944-0.978259;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047194; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=8; RT=8; SR=0; TI=SMTPD_---.KvhBIAv_1628151139; 
Received: from 10.0.2.15(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.KvhBIAv_1628151139)
 by smtp.aliyun-inc.com(10.147.41.187);
 Thu, 05 Aug 2021 16:12:19 +0800
Subject: Re: [RFC PATCH 00/13] Support UXL field in mstatus
To: Bin Meng <bmeng.cn@gmail.com>
References: <20210805025312.15720-1-zhiwei_liu@c-sky.com>
 <CAKmqyKOCRXbEhZrZSQN-X2ObrX=_aoxgyCsevE05LY9S-TS4hQ@mail.gmail.com>
 <a404e8dd-eb20-4d4a-6aa0-7c444b46c706@c-sky.com>
 <CAEUhbmU0TVvMvUi52kBYNJR0zjpoBmR6+3-PjOUu2r+6HL5qaA@mail.gmail.com>
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
Message-ID: <ff34c24d-540e-f286-d28e-898c726ca94d@c-sky.com>
Date: Thu, 5 Aug 2021 16:10:35 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAEUhbmU0TVvMvUi52kBYNJR0zjpoBmR6+3-PjOUu2r+6HL5qaA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: none client-ip=115.124.28.195; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-195.mail.aliyun.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.132,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis <alistair23@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2021/8/5 下午3:20, Bin Meng wrote:
> On Thu, Aug 5, 2021 at 3:16 PM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
>>
>> On 2021/8/5 下午2:01, Alistair Francis wrote:
>>> On Thu, Aug 5, 2021 at 12:55 PM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
>>>> This patch set implements UXL field in mstatus register. Programmer can change
>>>> UXLEN by writting to this field. So that you can run a 32 bit program
>>>> on a 64 bit CPU.
>>> Awesome! Do you have any steps for building a rootFS to test this?
>> Not yet.  It depends on Linux support which  will not start until
>> October.  Maybe as a rough test,
>> we can run the 32 glibc test cases on qemu-riscv64 with an option
>> uxl32=true(not implement yet).
> That's my understanding as well. Currently there is no software stack
> that supports mode switch, e.g.: OpenSBI boots in 64-bit but loading a
> 32-bit payload to execute.
>
> Do you plan to support SXL as well?

Sorry, SXL is not  planned.   If I have enough time later,  I will have 
a try.

Zhiwei

>
> Regards,
> Bin

