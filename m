Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 477D12E81F8
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Dec 2020 21:39:53 +0100 (CET)
Received: from localhost ([::1]:41926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kv4jf-0001QL-RD
	for lists+qemu-devel@lfdr.de; Thu, 31 Dec 2020 15:39:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kv4gq-0006Sm-P6
 for qemu-devel@nongnu.org; Thu, 31 Dec 2020 15:36:56 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:33610)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kv4gn-0001WX-6S
 for qemu-devel@nongnu.org; Thu, 31 Dec 2020 15:36:55 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id EE4EF7470F2;
 Thu, 31 Dec 2020 21:36:50 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id B4FFD7470E4; Thu, 31 Dec 2020 21:36:50 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id AFF2474645F;
 Thu, 31 Dec 2020 21:36:50 +0100 (CET)
Date: Thu, 31 Dec 2020 21:36:50 +0100 (CET)
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v2 3/3] trace: recommend "log" backend for getting started
 with tracing
In-Reply-To: <CAFEAcA8_cFGtU=_6a7XzD6ky-fvn1k9_usjaKrwjBxAP2Ls3Yg@mail.gmail.com>
Message-ID: <8b81184b-b0b6-2b1b-62c-8de94c279e70@eik.bme.hu>
References: <20201216160923.722894-1-stefanha@redhat.com>
 <20201216160923.722894-4-stefanha@redhat.com>
 <CAFEAcA8_cFGtU=_6a7XzD6ky-fvn1k9_usjaKrwjBxAP2Ls3Yg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset=US-ASCII
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: BALATON Zoltan <balaton@eik.bme.hu>
From: BALATON Zoltan via <qemu-devel@nongnu.org>

On Thu, 31 Dec 2020, Peter Maydell wrote:
> On Wed, 16 Dec 2020 at 16:09, Stefan Hajnoczi <stefanha@redhat.com> wrote:
>>
>> The "simple" backend is actually more complicated to use than the "log"
>> backend. Update the quickstart documentation to feature the "log"
>> backend instead of the "simple" backend.
>>
>> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
>> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
>> ---
>>  docs/devel/tracing.rst | 35 ++++++++++++++++++-----------------
>>  1 file changed, 18 insertions(+), 17 deletions(-)
>>
>> diff --git a/docs/devel/tracing.rst b/docs/devel/tracing.rst
>> index 76cc1b24fa..e60058bf55 100644
>> --- a/docs/devel/tracing.rst
>> +++ b/docs/devel/tracing.rst
>> @@ -11,22 +11,22 @@ for debugging, profiling, and observing execution.
>>  Quickstart
>>  ==========
>>
>> -1. Build with the 'simple' trace backend::
>> +Enable tracing of ``memory_region_ops_read`` and ``memory_region_ops_write``
>> +events::
>>
>> -    ./configure --enable-trace-backends=simple
>> -    make
>> +    $ qemu --trace "memory_region_ops_*" ...
>> +    ...
>> +    719585@1608130130.441188:memory_region_ops_read cpu 0 mr 0x562fdfbb3820 addr 0x3cc value 0x67 size 1
>> +    719585@1608130130.441190:memory_region_ops_write cpu 0 mr 0x562fdfbd2f00 addr 0x3d4 value 0x70e size 2
>>
>> -2. Create a file with the events you want to trace::
>> +This output comes from the "log" trace backend that is enabled by default when
>> +``./configure --enable-trace-backends=BACKENDS`` was not explicitly specified.
>>
>> -    echo memory_region_ops_read >/tmp/events
>> +More than one trace event pattern can be specified by providing a file
>> +instead::
>
> Does --trace really not let you specify more than one pattern
> without resorting to putting them into a file? That sounds like a
> deficiency compared to -d (which allows -d trace:PATTERN,trace:PATTERN...)
> that we could look at fixing...

Ir's possible to give more patterns in multiple options, I'm using that, 
such as:

-trace enable="pci*" -trace enable="ide*"

For a lot of patterns using a file may be clearer though.

This reminds me to the plainlog backend I've submitted. What happened to 
that? See:

https://lists.nongnu.org/archive/html/qemu-devel/2020-06/msg07296.html

I'd like a solution that can be set at compile time and does not need 
another command line option to turn off time stamps. (Timestamps are 
annoyong when comparing logs that's often necessary to check changes.) I'm 
still using my plainlog patch but I have to disable that when bisecting.

Regards,
BALATON Zoltan

> Anyway,
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>
> thanks
> -- PMM
>
>

