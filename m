Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DED5C4D2647
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Mar 2022 04:50:42 +0100 (CET)
Received: from localhost ([::1]:43748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRnLV-00019c-FR
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 22:50:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1nRnJi-0000To-5Y
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 22:48:50 -0500
Received: from mail.loongson.cn ([114.242.206.163]:59194 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1nRnJe-0001vt-27
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 22:48:49 -0500
Received: from [10.20.42.112] (unknown [10.20.42.112])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxysySIyhiKXUFAA--.6959S3;
 Wed, 09 Mar 2022 11:48:36 +0800 (CST)
Subject: Re: TCG Floating Point Support (Work in Progress)
To: Matt <mborgerson@gmail.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <CADc=-s7RifpTSQ_6tYY4B4pze-wy6KprPo=J6Jvv0VVV3PU8DA@mail.gmail.com>
 <87bl4a768t.fsf@linaro.org>
 <CADc=-s5wJ0cBv9r0rXaOk0Ys77Far7mgXq5B+y4KoNr937cC7A@mail.gmail.com>
 <87y27d5ezt.fsf@linaro.org>
 <CADc=-s4SAibNMeN9imMz9bOrNugdmuOAmKRgUWt1x12SQivEHQ@mail.gmail.com>
From: gaosong <gaosong@loongson.cn>
Message-ID: <5052ce92-3153-05b2-a3e9-c53114882987@loongson.cn>
Date: Wed, 9 Mar 2022 11:48:34 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CADc=-s4SAibNMeN9imMz9bOrNugdmuOAmKRgUWt1x12SQivEHQ@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------4D5D069D2C97ACAD937072BD"
Content-Language: en-US
X-CM-TRANSID: AQAAf9AxysySIyhiKXUFAA--.6959S3
X-Coremail-Antispam: 1UD129KBjvJXoW3ZrW5Xr4DJw43AF47JFW7twb_yoWDZFy3pF
 W5Wr17KF1kJF1xZwn2vw4xX3yFvFZ5JF15AFyrt348Zrs8GFy2qrWxK3yYyF97CrZYq3yY
 vayYvryUCan8AaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvK1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AE
 w4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2
 IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E
 87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcV
 Aq07x20xvEncxIr21lYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4U
 McvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I
 1l7480Y4vEI4kI2Ix0rVAqx4xJMxk0xIA0c2IEe2xFo4CEbIxvr21lc2xSY4AK6svPMxAI
 w28IcxkI7VAKI48JMxAIw28IcVCjz48v1sIEY20_XrWUJr1UMxC20s026xCaFVCjc4AY6r
 1j6r4UMI8I3I0E5I8CrVAFwI0_JrI_JrWlx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CE
 b7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0x
 vE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_WFyUJVCq3wCI
 42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxh
 VjvjDU0xZFpf9x0JUtkuxUUUUU=
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-0.001, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, maobibo@loongson.cn,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------4D5D069D2C97ACAD937072BD
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

  On 2021/10/2 上午10:07, Matt wrote:

>> Not at the moment but it would certainly be a useful addition for the
>> unit tests if we could test arbitrary sequences of TCG ops. I'm not sure
>> how much test harness would be needed to exercise that though.
> On a related note, in addition to testing TCG->Host translation, it
> would be nice to also have a way to make sure TCG->TCG optimization
> passes are working as expected. Is there existing work in this area?
>
>
>> We have a number of multiarch tcg tests for fused multiply-add and the
>> various fconv operations. There is also quite an exhaustive set of i386
>> specific tests (test-i386-fprem) but it doesn't get run by default as
>> the "reference" output is too big to include in the tree and has to be
>> generated in-situ. You get it by adding SPEED=slow to your make
>> invocation. [...]
>> You can run tests/fp/fp-bench -t host under translation to exercise that.
> Thanks for the info! This will be useful.
>
>
>> I know the classic Doom and Quake benchmarks showed a performance
>> regression when we switched to softfloat:
>>
>>    https://diasp.eu/posts/ec86de10240e01376f734061862b8e7b
> That post was an interesting read, thanks for sharing!
>
>
>> Out of interest what game code still uses x87? [...]
>> however I kinda assumed more modern games would be taking advantaged of
>> SSE and later features. There is however some missing gaps in the x86
>> emulation that might mean code falls back to the x87. Maybe that would
>> be another area to look at.
> This project is an emulator of the original Xbox game console, which
> is now...twenty years old (time flies). The Xbox CPU (P3) does feature
> SSE (not SSE2+), however most of the games I've tested for this
> generation still make heavy use of x87.
>
> I have seen at least one game make noticeable use of MMX/SSE features
> though, which I also need to look at accelerating. Profiler indicates
> they are also very costly. I have seen the TCG vector ops, which are a
> very cool addition.
>
> Matt
>
>
> On Fri, Oct 1, 2021 at 1:24 AM Alex Bennée <alex.bennee@linaro.org> wrote:
>>
>> Matt <mborgerson@gmail.com> writes:
>>
>>> Thank you Alex, for your quick and thoughtful response.
>>>
>>>> I've not reviewed the code as it is a rather large diff. For your proper
>>>> submission could you please ensure that your patch series is broken up
>>>> into discreet commits to aid review.
>>> Of course.
>>>
>>>> The phrase "if the user discovers some issues" is a bit of a red flag.
>>>> We should always be striving for correct emulation of floating point.
>>> I agree. This is an option that I added for use during feature
>>> development. Ultimately I would like not to have such an option, and
>>> for it to always *just work*.
>> The closest I can think of is the --accel thread=single|multi option
>> which allowed for verifying if an issue was related to MTTCG. However
>> the default would always do the right thing.
>>
>>>> Indeed we have recently got the code base to the point we pass all of
>>>> the Berkey softfloat test suite. This can be checked by running:
>>>>
>>>>    make check-softfloat
>>>>
>>>> However the test code links directly to the softfloat code so won't work
>>>> with direct code execution.
>>> I had planned to leverage the existing soft float test suite, and I
>>> think this can be done with the right harnessing. It would be nice to
>>> have a mechanism to test translation of individual TCG ops, e.g. be
>>> able to run translated blocks from test code and evaluate their
>>> output. I'm not sure if any such op level testing like that is being
>>> done.
>> Not at the moment but it would certainly be a useful addition for the
>> unit tests if we could test arbitrary sequences of TCG ops. I'm not sure
>> how much test harness would be needed to exercise that though.
>>
>>> There are also guest tests in tests/tcg, which could also be
>>> expanded to include more FP tests.
>> We have a number of multiarch tcg tests for fused multiply-add and the
>> various fconv operations. There is also quite an exhaustive set of i386
>> specific tests (test-i386-fprem) but it doesn't get run by default as
>> the "reference" output is too big to include in the tree and has to be
>> generated in-situ. You get it by adding SPEED=slow to your make
>> invocation.
>>
>>>> The existing 32/64 bit hardfloat
>>>> optimisations work within the helpers. While generating direct code is
>>>> appealing to avoid the cost of helper calls it's fairly well cached and
>>>> predicted code. Experience with the initial hardfloat code showed the
>>>> was still a performance win even with the cost of the helper call.
>>> Unfortunately, even with the existing hardfloat support, the overhead
>>> of the helper calls is still too costly for my particular application.
>> Once you start dealing with flag generation you might find that equation
>> changes somewhat if you have to mess around with bit masking and checks
>> using TCG ops. However providing benchmark results with your patch would
>> be required to argue the point. You can run tests/fp/fp-bench -t host
>> under translation to exercise that.
>>
>>>> I don't think you'll see the same behaviour emulating an x87 on anything
>>>> that isn't an x87 because the boundaries for things like inexact
>>>> calculation will be different. Indeed if you look at the existing
>>>> hardfloat code function can_use_fpu() you will see we only call the host
>>>> processor function if the inexact bit is already set. Other wrappers
>>>> have even more checks for normal numbers. Anything that needs NaN
>>>> handling will fallback to the correct softfloat code.
>>> Fair points. Bit-perfect x87 emulation with this approach may be
>>> ultimately unachievable; and I'm still evaluating the cases when this
>>> will not work. This has been a learning experience for me, and I
>>> gladly welcome expert input in this matter.
>>>
>>> Personally, I would accept minor accuracy differences in trade for
>>> significant performance advantage in emulation of game code, but not
>>> for scientific applications, which I understand may diminish upstream
>>> appeal of this x87 translation work.
>> Out of interest what game code still uses x87? I know the classic Doom
>> and Quake benchmarks showed a performance regression when we switched to
>> softfloat:
>>
>>    https://diasp.eu/posts/ec86de10240e01376f734061862b8e7b
>>
>> however I kinda assumed more modern games would be taking advantaged of
>> SSE and later features. There is however some missing gaps in the x86
>> emulation that might mean code falls back to the x87. Maybe that would
>> be another area to look at.
>>
>>>> I think there will be a wariness to merge anything that only works for a
>>>> single frontend/backend combination. Running translated x86 on x86 is
>>>> not the common case for TCG ;-)
>>> Understood; initially this works on a single frontend/backend
>>> combination, with eventual translation to other guests and hosts. It
>>> will be a long road, but my plan next is to produce a translation for
>>> AArch64 systems.

Hi, Matt

We have read you shared patch, We are interested in the work you are working.
Have you already supported AArch64 systems?

>>>> These are the things that make correct handling of floating point hard.
>>> Agreed!

Hi, Alex

Does TCG plan to support Hardware  Floating Point?

Thanks
Song

>>>> I'll happily review patches on the list that provide for an accelerated
>>>> FPU experience as long as the correctness is maintained.
>>> Thank you!
>>>
>>> Matt
>>>
>>> On Thu, Sep 30, 2021 at 2:38 AM Alex Bennée <alex.bennee@linaro.org> wrote:
>>>>
>>>> Matt <mborgerson@gmail.com> writes:
>>>>
>>>>> Hello--
>>>>>
>>>>> I'm excited to share that I have been developing support for TCG
>>>>> floating point operations; specifically, to accelerate emulation of
>>>>> x86 guest code which heavily exercises the x87 FPU for a game console
>>>>> emulator project based on QEMU. So far, this work has shown great
>>>>> promise, demonstrating some dramatic performance improvements in
>>>>> emulation of x87 heavy code.
>>>> I've not reviewed the code as it is a rather large diff. For your proper
>>>> submission could you please ensure that your patch series is broken up
>>>> into discreet commits to aid review. It also aids bisection if
>>>> regressions are identified.
>>>>
>>>>> The feature works in concert with unaccelerated x87 FPU helpers, and
>>>>> also allows total soft float helper fallback if the user discovers
>>>>> some issue with the hard float implementation.
>>>> The phrase "if the user discovers some issues" is a bit of a red flag.
>>>> We should always be striving for correct emulation of floating point.
>>>> Indeed we have recently got the code base to the point we pass all of
>>>> the Berkey softfloat test suite. This can be checked by running:
>>>>
>>>>    make check-softfloat
>>>>
>>>> However the test code links directly to the softfloat code so won't work
>>>> with direct code execution. The existing 32/64 bit hardfloat
>>>> optimisations work within the helpers. While generating direct code is
>>>> appealing to avoid the cost of helper calls it's fairly well cached and
>>>> predicted code. Experience with the initial hardfloat code showed the
>>>> was still a performance win even with the cost of the helper call.
>>>>
>>>>> For the TCG target,
>>>>> I've opted to implement it for x86-64 hosts using SSE2, although this
>>>>> could be extended to support full 80b double extended precision with
>>>>> host x87 support. I'm also in early development of an implementation
>>>>> for AArch64 hosts.
>>>> I don't think you'll see the same behaviour emulating an x87 on anything
>>>> that isn't an x87 because the boundaries for things like inexact
>>>> calculation will be different. Indeed if you look at the existing
>>>> hardfloat code function can_use_fpu() you will see we only call the host
>>>> processor function if the inexact bit is already set. Other wrappers
>>>> have even more checks for normal numbers. Anything that needs NaN
>>>> handling will fallback to the correct softfloat code.
>>>>
>>>> I think there will be a wariness to merge anything that only works for a
>>>> single frontend/backend combination. Running translated x86 on x86 is
>>>> not the common case for TCG ;-)
>>>>
>>>>> There are still some significant tasks to be done, like proper
>>>>> handling of exception flags, edge cases, and testing, to name a few.
>>>> These are the things that make correct handling of floating point hard.
>>>>
>>>>> Once in a slightly more mature state, I do think this feature would
>>>>> make a natural addition to upstream QEMU and plan to submit it for
>>>>> consideration.
>>>>>
>>>>> I'm writing to the mailing list now to inform FPU maintainers and any
>>>>> other interested parties that this work is happening, to solicit any
>>>>> early feedback, and to extend an invitation to anyone interested in
>>>>> collaborating to expedite its upstreaming.
>>>> I'll happily review patches on the list that provide for an accelerated
>>>> FPU experience as long as the correctness is maintained.
>>>>
>>>>> My initial TCG FP work can be found here:
>>>>> https://github.com/mborgerson/xemu/pull/464/commits
>>>>>
>>>>> Thanks,
>>>>> Matt
>>>>
>>>> --
>>>> Alex Bennée
>>
>> --
>> Alex Bennée

--------------4D5D069D2C97ACAD937072BD
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p> On 2021/10/2 上午10:07, Matt wrote:<br>
    </p>
    <blockquote type="cite"
cite="mid:CADc=-s4SAibNMeN9imMz9bOrNugdmuOAmKRgUWt1x12SQivEHQ@mail.gmail.com">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Not at the moment but it would certainly be a useful addition for the
unit tests if we could test arbitrary sequences of TCG ops. I'm not sure
how much test harness would be needed to exercise that though.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
On a related note, in addition to testing TCG-&gt;Host translation, it
would be nice to also have a way to make sure TCG-&gt;TCG optimization
passes are working as expected. Is there existing work in this area?


</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">We have a number of multiarch tcg tests for fused multiply-add and the
various fconv operations. There is also quite an exhaustive set of i386
specific tests (test-i386-fprem) but it doesn't get run by default as
the "reference" output is too big to include in the tree and has to be
generated in-situ. You get it by adding SPEED=slow to your make
invocation. [...]
You can run tests/fp/fp-bench -t host under translation to exercise that.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Thanks for the info! This will be useful.


</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">I know the classic Doom and Quake benchmarks showed a performance
regression when we switched to softfloat:

  <a class="moz-txt-link-freetext" href="https://diasp.eu/posts/ec86de10240e01376f734061862b8e7b">https://diasp.eu/posts/ec86de10240e01376f734061862b8e7b</a>
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
That post was an interesting read, thanks for sharing!


</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Out of interest what game code still uses x87? [...]
however I kinda assumed more modern games would be taking advantaged of
SSE and later features. There is however some missing gaps in the x86
emulation that might mean code falls back to the x87. Maybe that would
be another area to look at.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
This project is an emulator of the original Xbox game console, which
is now...twenty years old (time flies). The Xbox CPU (P3) does feature
SSE (not SSE2+), however most of the games I've tested for this
generation still make heavy use of x87.

I have seen at least one game make noticeable use of MMX/SSE features
though, which I also need to look at accelerating. Profiler indicates
they are also very costly. I have seen the TCG vector ops, which are a
very cool addition.

Matt


On Fri, Oct 1, 2021 at 1:24 AM Alex Bennée <a class="moz-txt-link-rfc2396E" href="mailto:alex.bennee@linaro.org">&lt;alex.bennee@linaro.org&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">

Matt <a class="moz-txt-link-rfc2396E" href="mailto:mborgerson@gmail.com">&lt;mborgerson@gmail.com&gt;</a> writes:

</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">Thank you Alex, for your quick and thoughtful response.

</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">I've not reviewed the code as it is a rather large diff. For your proper
submission could you please ensure that your patch series is broken up
into discreet commits to aid review.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">
Of course.

</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">The phrase "if the user discovers some issues" is a bit of a red flag.
We should always be striving for correct emulation of floating point.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">
I agree. This is an option that I added for use during feature
development. Ultimately I would like not to have such an option, and
for it to always *just work*.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
The closest I can think of is the --accel thread=single|multi option
which allowed for verifying if an issue was related to MTTCG. However
the default would always do the right thing.

</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">Indeed we have recently got the code base to the point we pass all of
the Berkey softfloat test suite. This can be checked by running:

  make check-softfloat

However the test code links directly to the softfloat code so won't work
with direct code execution.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">
I had planned to leverage the existing soft float test suite, and I
think this can be done with the right harnessing. It would be nice to
have a mechanism to test translation of individual TCG ops, e.g. be
able to run translated blocks from test code and evaluate their
output. I'm not sure if any such op level testing like that is being
done.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Not at the moment but it would certainly be a useful addition for the
unit tests if we could test arbitrary sequences of TCG ops. I'm not sure
how much test harness would be needed to exercise that though.

</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">There are also guest tests in tests/tcg, which could also be
expanded to include more FP tests.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
We have a number of multiarch tcg tests for fused multiply-add and the
various fconv operations. There is also quite an exhaustive set of i386
specific tests (test-i386-fprem) but it doesn't get run by default as
the "reference" output is too big to include in the tree and has to be
generated in-situ. You get it by adding SPEED=slow to your make
invocation.

</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">The existing 32/64 bit hardfloat
optimisations work within the helpers. While generating direct code is
appealing to avoid the cost of helper calls it's fairly well cached and
predicted code. Experience with the initial hardfloat code showed the
was still a performance win even with the cost of the helper call.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">
Unfortunately, even with the existing hardfloat support, the overhead
of the helper calls is still too costly for my particular application.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Once you start dealing with flag generation you might find that equation
changes somewhat if you have to mess around with bit masking and checks
using TCG ops. However providing benchmark results with your patch would
be required to argue the point. You can run tests/fp/fp-bench -t host
under translation to exercise that.

</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">I don't think you'll see the same behaviour emulating an x87 on anything
that isn't an x87 because the boundaries for things like inexact
calculation will be different. Indeed if you look at the existing
hardfloat code function can_use_fpu() you will see we only call the host
processor function if the inexact bit is already set. Other wrappers
have even more checks for normal numbers. Anything that needs NaN
handling will fallback to the correct softfloat code.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">
Fair points. Bit-perfect x87 emulation with this approach may be
ultimately unachievable; and I'm still evaluating the cases when this
will not work. This has been a learning experience for me, and I
gladly welcome expert input in this matter.

Personally, I would accept minor accuracy differences in trade for
significant performance advantage in emulation of game code, but not
for scientific applications, which I understand may diminish upstream
appeal of this x87 translation work.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Out of interest what game code still uses x87? I know the classic Doom
and Quake benchmarks showed a performance regression when we switched to
softfloat:

  <a class="moz-txt-link-freetext" href="https://diasp.eu/posts/ec86de10240e01376f734061862b8e7b">https://diasp.eu/posts/ec86de10240e01376f734061862b8e7b</a>

however I kinda assumed more modern games would be taking advantaged of
SSE and later features. There is however some missing gaps in the x86
emulation that might mean code falls back to the x87. Maybe that would
be another area to look at.

</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">I think there will be a wariness to merge anything that only works for a
single frontend/backend combination. Running translated x86 on x86 is
not the common case for TCG ;-)
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">
Understood; initially this works on a single frontend/backend
combination, with eventual translation to other guests and hosts. It
will be a long road, but my plan next is to produce a translation for
AArch64 systems.
</pre>
        </blockquote>
      </blockquote>
    </blockquote>
    <pre>Hi, Matt</pre>
    <pre>We have read you shared patch, We are interested in the work you are working.
Have you already supported AArch64 systems?</pre>
    <blockquote type="cite"
cite="mid:CADc=-s4SAibNMeN9imMz9bOrNugdmuOAmKRgUWt1x12SQivEHQ@mail.gmail.com">
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">These are the things that make correct handling of floating point hard.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">
Agreed!
</pre>
        </blockquote>
      </blockquote>
    </blockquote>
    <pre>Hi, Alex</pre>
    <pre>Does TCG plan to support Hardware<span style="color: rgb(34, 34, 34); font-family: sans-serif; font-size: 20px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;"></span> Floating Point? 

Thanks
Song 
</pre>
    <blockquote type="cite"
cite="mid:CADc=-s4SAibNMeN9imMz9bOrNugdmuOAmKRgUWt1x12SQivEHQ@mail.gmail.com">
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">I'll happily review patches on the list that provide for an accelerated
FPU experience as long as the correctness is maintained.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">
Thank you!

Matt

On Thu, Sep 30, 2021 at 2:38 AM Alex Bennée <a class="moz-txt-link-rfc2396E" href="mailto:alex.bennee@linaro.org">&lt;alex.bennee@linaro.org&gt;</a> wrote:
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">

Matt <a class="moz-txt-link-rfc2396E" href="mailto:mborgerson@gmail.com">&lt;mborgerson@gmail.com&gt;</a> writes:

</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">Hello--

I'm excited to share that I have been developing support for TCG
floating point operations; specifically, to accelerate emulation of
x86 guest code which heavily exercises the x87 FPU for a game console
emulator project based on QEMU. So far, this work has shown great
promise, demonstrating some dramatic performance improvements in
emulation of x87 heavy code.
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">
I've not reviewed the code as it is a rather large diff. For your proper
submission could you please ensure that your patch series is broken up
into discreet commits to aid review. It also aids bisection if
regressions are identified.

</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">The feature works in concert with unaccelerated x87 FPU helpers, and
also allows total soft float helper fallback if the user discovers
some issue with the hard float implementation.
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">
The phrase "if the user discovers some issues" is a bit of a red flag.
We should always be striving for correct emulation of floating point.
Indeed we have recently got the code base to the point we pass all of
the Berkey softfloat test suite. This can be checked by running:

  make check-softfloat

However the test code links directly to the softfloat code so won't work
with direct code execution. The existing 32/64 bit hardfloat
optimisations work within the helpers. While generating direct code is
appealing to avoid the cost of helper calls it's fairly well cached and
predicted code. Experience with the initial hardfloat code showed the
was still a performance win even with the cost of the helper call.

</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">For the TCG target,
I've opted to implement it for x86-64 hosts using SSE2, although this
could be extended to support full 80b double extended precision with
host x87 support. I'm also in early development of an implementation
for AArch64 hosts.
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">
I don't think you'll see the same behaviour emulating an x87 on anything
that isn't an x87 because the boundaries for things like inexact
calculation will be different. Indeed if you look at the existing
hardfloat code function can_use_fpu() you will see we only call the host
processor function if the inexact bit is already set. Other wrappers
have even more checks for normal numbers. Anything that needs NaN
handling will fallback to the correct softfloat code.

I think there will be a wariness to merge anything that only works for a
single frontend/backend combination. Running translated x86 on x86 is
not the common case for TCG ;-)

</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">There are still some significant tasks to be done, like proper
handling of exception flags, edge cases, and testing, to name a few.
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">
These are the things that make correct handling of floating point hard.

</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">Once in a slightly more mature state, I do think this feature would
make a natural addition to upstream QEMU and plan to submit it for
consideration.

I'm writing to the mailing list now to inform FPU maintainers and any
other interested parties that this work is happening, to solicit any
early feedback, and to extend an invitation to anyone interested in
collaborating to expedite its upstreaming.
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">
I'll happily review patches on the list that provide for an accelerated
FPU experience as long as the correctness is maintained.

</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">My initial TCG FP work can be found here:
<a class="moz-txt-link-freetext" href="https://github.com/mborgerson/xemu/pull/464/commits">https://github.com/mborgerson/xemu/pull/464/commits</a>

Thanks,
Matt
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">

--
Alex Bennée
</pre>
          </blockquote>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">

--
Alex Bennée
</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------4D5D069D2C97ACAD937072BD--


