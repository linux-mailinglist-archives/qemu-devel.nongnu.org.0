Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D6E43E104
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 14:29:51 +0200 (CEST)
Received: from localhost ([::1]:50596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mg4XW-0000vf-4z
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 08:29:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.machado@linaro.org>)
 id 1mg4Se-0007BV-24
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 08:24:48 -0400
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231]:39486)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luis.machado@linaro.org>)
 id 1mg4Sb-0003ti-TN
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 08:24:47 -0400
Received: by mail-oi1-x231.google.com with SMTP id s190so7224292oie.6
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 05:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=j2qZdEu06KEBFkmGkgUzf7kRqrWyreB+4Rj8F+/+FZc=;
 b=O3RMG23+brR7Kr2sNXbxiDOPOO142k8cIG8n4M2M5MrRweJraaYf9YtAV0bv7UAflk
 XZzgiqcJv3ACLAKLfZRllrQR/SIgz/tjJQIBWZBxYjkFWjd4hJmuC0euUiucq+vNaNzY
 NDiLjwFgo7dg9a5k7m5kDpH73mxZnaphMFbDtFH94h58dRa4xN7va8zKgRff0ow6u3Wg
 SuXnCvYNw6yqyeMFduYuKdwANZ+zZYo+vu8+/OS+Qp6hyxyMvCwZDH/V2rwcVqWQF+FD
 7SLqbADDYOu+16/526OzlTI/hthurrtHXvMd/s7ElBhZhvIF4c7aThZLgd8CvemFTaGX
 frng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=j2qZdEu06KEBFkmGkgUzf7kRqrWyreB+4Rj8F+/+FZc=;
 b=ElNw1qQd1QajWZISKgvtnjnz5W4xoSdljHLOOILGv2TsqyRWpfJOvft1HgDQ84JC4O
 VUPrrKkXwbCzib0uZF5zQLNg0/QswQBQHHscJEMwJWjra1SrghyPusSsWbIjAJ2h7Rsb
 4PW/Sj9iLWl4aUSUR2gtYfv9xOtxNDSybTtGkXilq25GlChziwtbE9l1NVbrLesalIxx
 VbwfOKOC/0V+m9bNEjBbPf1GFnjP2Mw3Onb+XMM25uEogDhmQ5IR47wLLhp8Nyfjc7zm
 QzebCIH5B9QCN0eBoakRZ4emnKBiiq5ENUOuX3yfZd3B4ENRS+IZMGjhvAtsuQDAVE2E
 ZV8Q==
X-Gm-Message-State: AOAM533M2JJoF/tcFk6IVl4FLI4CVD16uzEeJvkVUcFDpKAtIiV5JteV
 DK5RCJ6h99RvHneT9XAyZTZeug==
X-Google-Smtp-Source: ABdhPJwMggFDGpx1pVkZxp5DaiKCTTzCw2cP2AxIXWxCGF4qerGLlCHDnFFdyZ95S1Df8DaCq9QvzA==
X-Received: by 2002:aca:be54:: with SMTP id o81mr8273430oif.64.1635423883934; 
 Thu, 28 Oct 2021 05:24:43 -0700 (PDT)
Received: from ?IPv6:2804:7f0:4841:3c03:6478:21a3:2901:16a6?
 ([2804:7f0:4841:3c03:6478:21a3:2901:16a6])
 by smtp.gmail.com with ESMTPSA id r44sm1106581otv.39.2021.10.28.05.24.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Oct 2021 05:24:43 -0700 (PDT)
Subject: Re: Deprecate the ppc405 boards in QEMU? (was: [PATCH v3 4/7]
 MAINTAINERS: Orphan obscure ppc platforms)
To: LEROY Christophe <christophe.leroy@csgroup.eu>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 BALATON Zoltan <balaton@eik.bme.hu>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>
References: <20210927044808.73391-1-david@gibson.dropbear.id.au>
 <20210927044808.73391-5-david@gibson.dropbear.id.au>
 <18fa56ee-956e-ee2f-9270-82aa96dfde09@redhat.com>
 <df767942-be5f-c920-2924-a5221e9db2b3@csgroup.eu>
 <40cdb137-60c9-43fd-7b48-4858cbd9307c@redhat.com>
 <CAFEAcA82L5JiHXUmc0vt7EgiiyrYHyJ+qQ7pFHp+CsvJCPyKqA@mail.gmail.com>
 <6c2ff4e6-4bf4-d310-5e26-c8d2741177bc@redhat.com>
 <42e5a8c2-b8fa-b9e2-71f1-c8e5cd7f5cef@csgroup.eu>
 <1397f18f-f187-6f48-ed6c-13c0b77abed9@redhat.com> <YVug7l8LWl3e+DN5@yekko>
 <9aeb7010-0a17-864a-cfac-ea5d90356085@csgroup.eu>
 <f0871969-190a-d15e-50d8-e6c1b1043652@ozlabs.ru>
 <5e4f78ce-1508-5689-ec29-79edad0c824e@kaod.org>
 <491d6265-3785-b11-b7f0-621a3d2823@eik.bme.hu>
 <b9f27c1b-1162-b178-9333-89c0dd707c12@redhat.com>
 <103e098a-a8ac-a22a-8aad-3df7d8cde148@amsat.org>
 <939f2d12-38f6-4ab0-b688-384136d1d9c@eik.bme.hu>
 <4e07823e-7162-525a-4a61-9bed63e85d58@kaod.org>
 <5263c819-b13c-f48a-d720-15b085537070@csgroup.eu>
From: Luis Machado <luis.machado@linaro.org>
Message-ID: <2b5f000b-31c0-bd2c-14a3-63a23f73ab18@linaro.org>
Date: Thu, 28 Oct 2021 09:24:35 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <5263c819-b13c-f48a-d720-15b085537070@csgroup.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::231;
 envelope-from=luis.machado@linaro.org; helo=mail-oi1-x231.google.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.847,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 "dbarboza@redhat.com" <dbarboza@redhat.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>,
 "gdb@sourceware.org" <gdb@sourceware.org>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Alexander Graf <agraf@csgraf.de>,
 qemu-ppc <qemu-ppc@nongnu.org>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 10/20/21 10:16 AM, LEROY Christophe wrote:
> 
> 
> Le 20/10/2021 à 14:43, Cédric Le Goater a écrit :
>> On 10/20/21 13:42, BALATON Zoltan wrote:
>>> On Wed, 20 Oct 2021, Philippe Mathieu-Daudé wrote:
>>>> On 10/5/21 14:29, Thomas Huth wrote:
>>>>> On 05/10/2021 14.20, BALATON Zoltan wrote:
>>>>>> On Tue, 5 Oct 2021, Cédric Le Goater wrote:
>>>>>>> On 10/5/21 08:18, Alexey Kardashevskiy wrote:
>>>>>>>> On 05/10/2021 15:44, Christophe Leroy wrote:
>>>>>>>>> Le 05/10/2021 à 02:48, David Gibson a écrit :
>>>>>>>>>> On Fri, Oct 01, 2021 at 04:18:49PM +0200, Thomas Huth wrote:
>>>>>>>>>>> On 01/10/2021 15.04, Christophe Leroy wrote:
>>>>>>>>>>>> Le 01/10/2021 à 14:04, Thomas Huth a écrit :
>>>>>>>>>>>>> On 01/10/2021 13.12, Peter Maydell wrote:
>>>>>>>>>>>>>> On Fri, 1 Oct 2021 at 10:43, Thomas Huth <thuth@redhat.com>
>>>>>>>>>>>>>> wrote:
>>>>>>>>>>>>>>> Nevertheless, as long as nobody has a hint where to find that
>>>>>>>>>>>>>>> ppc405_rom.bin, I think both boards are pretty useless in
>>>>>>>>>>>>>>> QEMU (as far as I
>>>>>>>>>>>>>>> can see, they do not work without the bios at all, so it's
>>>>>>>>>>>>>>> also not possible
>>>>>>>>>>>>>>> to use a Linux image with the "-kernel" CLI option directly).
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> It is at least in theory possible to run bare-metal code on
>>>>>>>>>>>>>> either board, by passing either a pflash or a bios argument.
>>>>>>>>>>>>>
>>>>>>>>>>>>> True. I did some more research, and seems like there was once
>>>>>>>>>>>>> support for those boards in u-boot, but it got removed there a
>>>>>>>>>>>>> couple of years ago already:
>>>>>>>>>>>>>
>>>>>>>>>>>>> https://gitlab.com/qemu-project/u-boot/-/commit/98f705c9cefdf
>>>>>>>>>>>>>
>>>>>>>>>>>>> https://gitlab.com/qemu-project/u-boot/-/commit/b147ff2f37d5b
>>>>>>>>>>>>>
>>>>>>>>>>>>> https://gitlab.com/qemu-project/u-boot/-/commit/7514037bcdc37
>>>>>>>>>>>>>
>>>>>>>>>>>>>> But I agree that there seem to be no signs of anybody actually
>>>>>>>>>>>>>> successfully using these boards for anything, so we should
>>>>>>>>>>>>>> deprecate-and-delete them.
>>>>>>>>>>>>>
>>>>>>>>>>>>> Yes, let's mark them as deprecated now ... if someone still
>>>>>>>>>>>>> uses
>>>>>>>>>>>>> them and speaks up, we can still revert the deprecation again.
>>>>>>>>>>>>
>>>>>>>>>>>> I really would like to be able to use them to validate Linux
>>>>>>>>>>>> Kernel
>>>>>>>>>>>> changes, hence looking for that missing BIOS.
>>>>>>>>>>>>
>>>>>>>>>>>> If we remove ppc405 from QEMU, we won't be able to do any
>>>>>>>>>>>> regression
>>>>>>>>>>>> tests of Linux Kernel on those processors.
>>>>>>>>>>>
>>>>>>>>>>> If you/someone managed to compile an old version of u-boot for
>>>>>>>>>>> one of these
>>>>>>>>>>> two boards, so that we would finally have something for
>>>>>>>>>>> regression testing,
>>>>>>>>>>> we can of course also keep the boards in QEMU...
>>>>>>>>>>
>>>>>>>>>> I can see that it would be usefor for some cases, but unless
>>>>>>>>>> someone
>>>>>>>>>> volunteers to track down the necessary firmware and look after
>>>>>>>>>> it, I
>>>>>>>>>> think we do need to deprecate it - I certainly don't have the
>>>>>>>>>> capacity
>>>>>>>>>> to look into this.
>>>>>>>>>>
>>>>>>>>>
>>>>>>>>> I will look at it, please allow me a few weeks though.
>>>>>>>>
>>>>>>>> Well, building it was not hard but now I'd like to know what board
>>>>>>>> QEMU actually emulates, there are way too many codenames and PVRs.
>>>>>>>
>>>>>>> yes. We should try to reduce the list below. Deprecating embedded
>>>>>>> machines
>>>>>>> is one way.
>>>>>>
>>>>>> Why should we reduce that list? It's good to have different cpu
>>>>>> options when one wants to test code for different PPC versions (maybe
>>>>>> also in user mode) or just to have a quick list of these at one place.
>>>>>
>>>>> I think there are many CPUs in that list which cannot be used with any
>>>>> board, some of them might be also in a very incomplete state. So
>>>>> presenting such a big list to the users is confusing and might create
>>>>> wrong expectations. It would be good to remove at least the CPUs which
>>>>> are really completely useless.
>>>>
>>>> Maybe only remove some from system emulation but keep all of them
>>>> in user emulation?
>>>
>>> Or keep them all but mark those that are not tested/may be incomplete?
>>> So the used can see what is expected to work and what may need to be
>>> fixed. That way somebody may try and fix it whereas if it's not there
>>> they are unlikely to try to add it.
>>
>>
>> The bamboo machine with 440 CPUs is booting with the latest kernel
>> and we have an acceptance test for it now, thanks to Thomas. There
>> is not much effort in keeping them in a working state until someone
>> volunteers. Hopefully, Christophe is making sure that we are not
>> breaking anything with Linux support.
>>
>> The 405 machine are still close to deprecation I think. We are still
>> struggling to boot one with mainline Linux, using uboot provided by
>> Thomas which skips SDRAM init. It is not clear to me if u-boot is
>> strictly necessary. It depends if Linux relies on it to do some
>> pre-initialization of HW. I guess once we find a good DTS for it, or
>> not, we can take a decision.
>>
> 
> I now have a hacked configuration booting linux with the hotfoot DTS and
> the kernel is booting up to starting /init
> 
> Then it is faulting forever taking a DSI for write protection. The
> problem is now likely in Linux and I'm investigating it, but I'm having
> problem with GDB (7.8.1), I'm hitting the bug
> https://sourceware.org/bugzilla/show_bug.cgi?id=17700
> 
> And GDB 11.1 coredumps while reading vmlinux's symbols
> 
> Hopefully I'll find a GDB version between 7.8 and 11 that works.
> 

Just to confirm, you're not really having problems with the ARM port of 
GDB, right? It is a 32-bit PowerPC one. The bug you pointed out is only 
a reference to a similar one for PowerPC?

