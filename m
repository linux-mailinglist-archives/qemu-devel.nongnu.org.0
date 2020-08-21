Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC2624C973
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Aug 2020 03:10:38 +0200 (CEST)
Received: from localhost ([::1]:45804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k8vZk-0006wZ-Q5
	for lists+qemu-devel@lfdr.de; Thu, 20 Aug 2020 21:10:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <punit1.agrawal@toshiba.co.jp>)
 id 1k8vYS-0006Dw-5V; Thu, 20 Aug 2020 21:09:18 -0400
Received: from mo-csw1516.securemx.jp ([210.130.202.155]:46018
 helo=mo-csw.securemx.jp)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <punit1.agrawal@toshiba.co.jp>)
 id 1k8vYK-0007hE-Lx; Thu, 20 Aug 2020 21:09:14 -0400
Received: by mo-csw.securemx.jp (mx-mo-csw1516) id 07L18wbB022933;
 Fri, 21 Aug 2020 10:08:58 +0900
X-Iguazu-Qid: 34tMSeeoSoqueZbKi2
X-Iguazu-QSIG: v=2; s=0; t=1597972138; q=34tMSeeoSoqueZbKi2;
 m=VQLcjwad1ae08W7GaurJKe9kyqqe4/aidO6vRvI15Jc=
Received: from imx2.toshiba.co.jp (imx2.toshiba.co.jp [106.186.93.51])
 by relay.securemx.jp (mx-mr1513) id 07L18vvW032589;
 Fri, 21 Aug 2020 10:08:57 +0900
Received: from enc01.localdomain ([106.186.93.100])
 by imx2.toshiba.co.jp  with ESMTP id 07L18vN3023378;
 Fri, 21 Aug 2020 10:08:57 +0900 (JST)
Received: from hop001.toshiba.co.jp ([133.199.164.63])
 by enc01.localdomain  with ESMTP id 07L18v6X031918;
 Fri, 21 Aug 2020 10:08:57 +0900
From: Punit Agrawal <punit1.agrawal@toshiba.co.jp>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] hw/arm/virt: Default to architecture appropriate CPU
References: <20200820045507.614288-1-punit1.agrawal@toshiba.co.jp>
 <CAFEAcA-zRAzU_ZRE5Wfc1V9jtnnhNyHEkXF4+t2TFXJ26MKc8A@mail.gmail.com>
Date: Fri, 21 Aug 2020 10:08:56 +0900
In-Reply-To: <CAFEAcA-zRAzU_ZRE5Wfc1V9jtnnhNyHEkXF4+t2TFXJ26MKc8A@mail.gmail.com>
 (Peter Maydell's message of "Thu, 20 Aug 2020 09:55:16 +0100")
X-TSB-HOP: ON
Message-ID: <87h7swyfdj.fsf@kokedama.swc.toshiba.co.jp>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=210.130.202.155;
 envelope-from=punit1.agrawal@toshiba.co.jp; helo=mo-csw.securemx.jp
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/20 21:09:01
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Peter,

Thanks for the quick feedback and the background. 

Peter Maydell <peter.maydell@linaro.org> writes:

> On Thu, 20 Aug 2020 at 05:55, Punit Agrawal
> <punit1.agrawal@toshiba.co.jp> wrote:
>>
>> The default_cpu_type for the Virt machine is set to "cortex-a15" for
>> both the arm (qemu-system-arm) and aarch64 (qemu-system-aarch64)
>> targets.
>>
>> As a result, starting the aarch64 target with "-machine virt" defaults
>> to booting with a Arm v7 cpu which is counter to
>> expectation. Debugging the issue is further hampered by lack of any
>> output from a supplied arm64 firmware as it is now running on the
>> wrong CPU type.
>>
>> Fix this by defaulting to the "max" capability CPU for the target
>> architecture. After the patch both the arm and aarch64 qemu default to
>> the equivalent of passing "-cpu max".
>
> Hi; this kind of thing has been suggested in the past several times.
> Generally we've taken the view that we prefer:
>  * not to make changes that would break pre-existing command lines
>  * to maintain the general behaviour that a command line used
>    with qemu-system-arm will also work with qemu-system-aarch64

It did feel like too low hanging a fruit to not have been looked into
before. Generally the above makes sense - though defaulting
qemu-system-aarch64 to start with a 32bit cpu is stretching the above
view too far I think.

> It is certainly true that these days the default CPU type for
> virt is not what most users want, though.

I do understand it's a balancing act when it comes to changing user
visible options. But it's worth revisiting the choice if most users
would prefer otherwise.

Thanks,

Punit

