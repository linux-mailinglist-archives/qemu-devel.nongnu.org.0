Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E0C20F0C8
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Jun 2020 10:46:15 +0200 (CEST)
Received: from localhost ([::1]:35292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jqBuA-0002wl-F8
	for lists+qemu-devel@lfdr.de; Tue, 30 Jun 2020 04:46:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1jqBst-0002M3-0S
 for qemu-devel@nongnu.org; Tue, 30 Jun 2020 04:44:55 -0400
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:35328)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1jqBsq-00086Y-86
 for qemu-devel@nongnu.org; Tue, 30 Jun 2020 04:44:54 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07439804|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.0128548-0.000358907-0.986786;
 FP=0|0|0|0|0|-1|-1|-1; HT=e02c03294; MF=zhiwei_liu@c-sky.com; NM=1; PH=DS;
 RN=5; RT=5; SR=0; TI=SMTPD_---.Hv5qgYQ_1593506682; 
Received: from 30.225.208.21(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.Hv5qgYQ_1593506682)
 by smtp.aliyun-inc.com(10.147.42.22); Tue, 30 Jun 2020 16:44:42 +0800
Subject: Re: [PULL 00/63] riscv-to-apply queue
To: Thomas Huth <thuth@redhat.com>, Alistair Francis <alistair23@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20200626214410.3613258-1-alistair.francis@wdc.com>
 <CAFEAcA-8QejH-sFsP_rmKuYdYbQdYRjrHaNz4vLHzfYiSBCKYA@mail.gmail.com>
 <CAKmqyKNo9rPtbtqb1R3OFKH71geYjo0mZONNLxkL0Mg6bnb1Zw@mail.gmail.com>
 <544fb149-c920-b396-7297-f9688a744445@c-sky.com>
 <29f57b2e-7d67-5da2-0ad0-0750e400a91c@redhat.com>
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
Message-ID: <67c76bac-2416-9ace-a71b-ab56b864975b@c-sky.com>
Date: Tue, 30 Jun 2020 16:44:42 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <29f57b2e-7d67-5da2-0ad0-0750e400a91c@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: none client-ip=121.197.200.217;
 envelope-from=zhiwei_liu@c-sky.com; helo=smtp2200-217.mail.aliyun.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/30 02:56:46
X-ACL-Warn: Detected OS   = Linux 3.x [generic] [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, UNPARSEABLE_RELAY=0.001 autolearn=_AUTOLEARN
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
Cc: Alistair Francis <alistair.francis@wdc.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 2020/6/30 16:11, Thomas Huth wrote:
> On 30/06/2020 08.56, LIU Zhiwei wrote:
>>
>>
>> On 2020/6/29 6:51, Alistair Francis wrote:
>>> On Sun, Jun 28, 2020 at 7:30 AM Peter Maydell 
>>> <peter.maydell@linaro.org> wrote:
>>>> On Fri, 26 Jun 2020 at 22:53, Alistair Francis 
>>>> <alistair.francis@wdc.com> wrote:
>>>>> The following changes since commit 
>>>>> 553cf5d7c47bee05a3dec9461c1f8430316d516b:
>>>>>
>>>>>    Merge remote-tracking branch 
>>>>> 'remotes/pmaydell/tags/pull-target-arm-20200626' into staging 
>>>>> (2020-06-26 18:22:36 +0100)
>>>>>
>>>>> are available in the Git repository at:
>>>>>
>>>>>    git@github.com:alistair23/qemu.git 
>>>>> tags/pull-riscv-to-apply-20200626-1
>>>>>
>>>>> for you to fetch changes up to 
>>>>> b39d59434ea10649fdb9e0a339c30c76e38c5e17:
>>>>>
>>>>>    target/riscv: configure and turn on vector extension from 
>>>>> command line (2020-06-26 14:22:15 -0700)
>>>>>
>>>>> ----------------------------------------------------------------
>>>>> This PR contains two patches to improve PLIC support in QEMU.
>>>>>
>>>>> The rest of the PR is adding support for the v0.7.1 RISC-V vector
>>>>> extensions. This is experimental support as the vector extensions are
>>>>> still in a draft state.
>>>>>
>>>> Hi; I'm afraid this fails to build on PPC64 and s390x (ie
>>>> our big-endian hosts):
>> Hi Peter,
>>
>> Do you mean you built the patch set on PPC64 or s390x and got errors 
>> in the list? Or just a worry?
> >
>> I have built the patch set on Ubuntu 18.04 X86-64. I don't know which 
>> compile option
>> will fails the compilation. If you compiled on Ubuntu x86-64, could 
>> you show me the
>> compile option?
>
> The related code in your patch "target/riscv: add vector stride load 
> and store instructions" is in a "#ifdef HOST_WORDS_BIGENDIAN" section, 
> so of course this bug does not trigger on a x86 host. You could 
> temporarily turn the "#ifdef HOST_WORDS_BIGENDIAN" into a "#if 1" to 
> see whether you can then also reproduce the error on x86.
>
Yes. I can reproduce it in this way.
>> As a note: I try to find a PPC64 for test, but I'm afraid it will be 
>> too later.
>> Is there an available  PPC64  machine in the community?
>
> Maybe the easiest way to test your code on a big endian machine, too, 
> is to get a github account, clone the QEMU repository there, and 
> enable Travis for that repo. Then your code gets built on some non-x86 
> architectures (including a big-endian s390x) as soon as you push it to 
> the repo (see .travis.yml for details).
>
Thanks very much. I will have a try.
>>>> /home/ubuntu/qemu/target/riscv/vector_helper.c: In function 
>>>> ‘vext_clear’:
>>>> /home/ubuntu/qemu/target/riscv/vector_helper.c: In function 
>>>> ‘vext_clear’:
>>>> /home/ubuntu/qemu/target/riscv/vector_helper.c:154:21: error: invalid
>>>> operands to binary & (have ‘void *’ and ‘long long unsigned int’)
>>>>           memset(tail & ~(7ULL), 0, part1);
>
> You obviously must not use "&" with a pointer. I guess you have to 
> cast to "uintptr_t" and back, or think of some other smart way to fix 
> this.
>
Yes. That's the error. It  build successfully after the cast.

Best Regards，
Zhiwei
>  Thomas


