Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0568868D734
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 13:50:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPNOt-0005hF-DY; Tue, 07 Feb 2023 07:48:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pPNOq-0005gw-KE
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 07:48:40 -0500
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pPNOo-0004UJ-H3
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 07:48:40 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 92FC17457E7;
 Tue,  7 Feb 2023 13:46:03 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 35C6A745712; Tue,  7 Feb 2023 13:46:03 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 33F787456E3;
 Tue,  7 Feb 2023 13:46:03 +0100 (CET)
Date: Tue, 7 Feb 2023 13:46:03 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Akihiko Odaki <akihiko.odaki@gmail.com>
cc: Richard Henderson <richard.henderson@linaro.org>, 
 Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org, 
 pixman@lists.freedesktop.org
Subject: Re: pixman_blt on aarch64
In-Reply-To: <8c33a708-9805-b6c8-70e8-9ee0dfb73ee6@gmail.com>
Message-ID: <6eb4db3e-fdbe-b57d-df4f-52b388efb422@eik.bme.hu>
References: <4b519268-f8e8-6542-9d1b-34054879eec0@eik.bme.hu>
 <a7866129-9f7a-02d6-1e58-bf05e1bf89e4@eik.bme.hu>
 <410c3da9-9be5-a715-7b7a-48bd67355c9c@linaro.org>
 <e615e033-a3f6-083f-5f0f-eb506c3c5b4c@eik.bme.hu>
 <a8ca919f-c6fc-70cf-0574-261fdad81d96@linaro.org>
 <8c33a708-9805-b6c8-70e8-9ee0dfb73ee6@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1690749644-1675773963=:60269"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1690749644-1675773963=:60269
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

Maybe we should include pixman list in this. In case you're not subscribed 
I'm forwarding it to that list now.

On Tue, 7 Feb 2023, Akihiko Odaki wrote:
> On 2023/02/06 4:16, Richard Henderson wrote:
>> On 2/5/23 08:44, BALATON Zoltan wrote:
>>> On Sun, 5 Feb 2023, Richard Henderson wrote:
>>>> On 2/4/23 06:57, BALATON Zoltan wrote:
>>>>> This has just bounced, I hoped to still be able to post after moderation 
>>>>> but now I'm resending it after subscribing to the pixman list. Meanwhile 
>>>>> I've found this ticket as well: 
>>>>> https://gitlab.freedesktop.org/pixman/pixman/-/merge_requests/71
>>>>> See the rest of the message below. Looks like this is being worked on 
>>>>> but I'm not sure how far is it from getting resolved. Any info on that?
>>>> 
>>>> Please try this:
>>>> 
>>>> https://gitlab.freedesktop.org/rth7680/pixman/-/tree/general
>>>> 
>>>> It provides a pure C version for ultimate fallback.
>>>> Unfortunately, there are no test cases for this, nor documentation.
>
> It can share the implementation with fast_composite_src_memcpy(). 
> fast_composite_src_memcpy() should be well-tested with the tests for 
> pixman_image_composite(). arm-neon does similar so we can trust 
> fast_composite_src_memcpy() functions as blt.
>
>>> 
>>> Thanks, I don't have hardware to test this but maybe Akihiko or somebody 
>>> else here cam try. Do you think pixman_fill won't have the same problem? 
>>> It seems to have at least a fast_path implementation but I'm not sure how 
>>> pixman selects these.
>> 
>> For fill, I think the fast_path implementation should work, so long as it 
>> isn't disabled via environment variable.  I'm not sure why that is, and why 
>> _fast_path isn't part of _general.
>
> The implementation of fill should be moved to pixman-general.c but the other 
> part of pixman-fast-path.c shouldn't be.
>
> By isolating the non-essential fast-path code to pixman-fast-path.c, you can 
> disable it with the environment variable when you are not confident with the 
> implementation, and that may help debugging. However, if pixman-fast-path.c 
> has some essential code like the implementation of fill, the utility of the 
> environment variable will be impaired as setting the environment variable may 
> break things.
>
>> 
>> Indeed, the fast_path implementation of fill should be easily vectorized by 
>> the compiler. I would expect it to be competitive with an assembly 
>> implementation.  I would expect the implementation chain design to only be 
>> useful when multiple vector implementations are supported and selected at 
>> runtime -- e.g. the x86 SSE2 vs SSSE3 stuff.
>> 
>> 
>> r~
>
>
--3866299591-1690749644-1675773963=:60269--

