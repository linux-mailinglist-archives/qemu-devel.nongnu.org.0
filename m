Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE4120EEDE
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Jun 2020 08:57:58 +0200 (CEST)
Received: from localhost ([::1]:59496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jqADM-0002PV-OY
	for lists+qemu-devel@lfdr.de; Tue, 30 Jun 2020 02:57:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1jqACS-0001fX-G6
 for qemu-devel@nongnu.org; Tue, 30 Jun 2020 02:57:00 -0400
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:33853)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1jqACP-0000C8-L9
 for qemu-devel@nongnu.org; Tue, 30 Jun 2020 02:57:00 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07483298|-1; CH=green;
 DM=|CONTINUE|false|; DS=CONTINUE|ham_alarm|0.0461644-0.00132375-0.952512;
 FP=0|0|0|0|0|-1|-1|-1; HT=e01a16367; MF=zhiwei_liu@c-sky.com; NM=1; PH=DS;
 RN=4; RT=4; SR=0; TI=SMTPD_---.Hv1ba3L_1593500202; 
Received: from 30.225.208.21(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.Hv1ba3L_1593500202)
 by smtp.aliyun-inc.com(10.147.41.178);
 Tue, 30 Jun 2020 14:56:42 +0800
Subject: Re: [PULL 00/63] riscv-to-apply queue
To: Alistair Francis <alistair23@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20200626214410.3613258-1-alistair.francis@wdc.com>
 <CAFEAcA-8QejH-sFsP_rmKuYdYbQdYRjrHaNz4vLHzfYiSBCKYA@mail.gmail.com>
 <CAKmqyKNo9rPtbtqb1R3OFKH71geYjo0mZONNLxkL0Mg6bnb1Zw@mail.gmail.com>
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
Message-ID: <544fb149-c920-b396-7297-f9688a744445@c-sky.com>
Date: Tue, 30 Jun 2020 14:56:42 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <CAKmqyKNo9rPtbtqb1R3OFKH71geYjo0mZONNLxkL0Mg6bnb1Zw@mail.gmail.com>
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



On 2020/6/29 6:51, Alistair Francis wrote:
> On Sun, Jun 28, 2020 at 7:30 AM Peter Maydell <peter.maydell@linaro.org> wrote:
>> On Fri, 26 Jun 2020 at 22:53, Alistair Francis <alistair.francis@wdc.com> wrote:
>>> The following changes since commit 553cf5d7c47bee05a3dec9461c1f8430316d516b:
>>>
>>>    Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20200626' into staging (2020-06-26 18:22:36 +0100)
>>>
>>> are available in the Git repository at:
>>>
>>>    git@github.com:alistair23/qemu.git tags/pull-riscv-to-apply-20200626-1
>>>
>>> for you to fetch changes up to b39d59434ea10649fdb9e0a339c30c76e38c5e17:
>>>
>>>    target/riscv: configure and turn on vector extension from command line (2020-06-26 14:22:15 -0700)
>>>
>>> ----------------------------------------------------------------
>>> This PR contains two patches to improve PLIC support in QEMU.
>>>
>>> The rest of the PR is adding support for the v0.7.1 RISC-V vector
>>> extensions. This is experimental support as the vector extensions are
>>> still in a draft state.
>>>
>> Hi; I'm afraid this fails to build on PPC64 and s390x (ie
>> our big-endian hosts):
Hi Peter,

Do you mean you built the patch set on PPC64 or s390x and got errors in 
the list? Or just a worry?

I have built the patch set on Ubuntu 18.04 X86-64. I don't know which 
compile option
will fails the compilation. If you compiled on Ubuntu x86-64, could you 
show me the
compile option?

As a note: I try to find a PPC64 for test, but I'm afraid it will be too 
later.
Is there an available  PPC64  machine in the community?

Thanks very much.

Zhiwei
> LIU Zhiwei do you mind looking into this?
>
> Alistair
>
>> /home/ubuntu/qemu/target/riscv/vector_helper.c: In function ‘vext_clear’:
>> /home/ubuntu/qemu/target/riscv/vector_helper.c: In function ‘vext_clear’:
>> /home/ubuntu/qemu/target/riscv/vector_helper.c:154:21: error: invalid
>> operands to binary & (have ‘void *’ and ‘long long unsigned int’)
>>           memset(tail & ~(7ULL), 0, part1);
>>                       ^
>> /home/ubuntu/qemu/target/riscv/vector_helper.c:155:27: error: invalid
>> operands to binary & (have ‘void *’ and ‘long long unsigned int’)
>>           memset((tail + 8) & ~(7ULL), 0, part2);
>>                  ~~~~~~~~~~ ^
>> /home/ubuntu/qemu/target/riscv/vector_helper.c:154:21: error: invalid
>> operands to binary & (have ‘void *’ and ‘long long unsigned int’)
>>           memset(tail & ~(7ULL), 0, part1);
>>                       ^
>> /home/ubuntu/qemu/target/riscv/vector_helper.c:155:27: error: invalid
>> operands to binary & (have ‘void *’ and ‘long long unsigned int’)
>>           memset((tail + 8) & ~(7ULL), 0, part2);
>>                  ~~~~~~~~~~ ^
>> /home/ubuntu/qemu/rules.mak:69: recipe for target
>> 'target/riscv/vector_helper.o' failed
>>
>>
>> thanks
>> -- PMM


