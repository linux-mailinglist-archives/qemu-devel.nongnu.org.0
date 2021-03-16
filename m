Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF8233D469
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 13:57:14 +0100 (CET)
Received: from localhost ([::1]:42322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lM9G5-0007Gm-3q
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 08:57:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lM9F8-0006jC-I8; Tue, 16 Mar 2021 08:56:14 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:44355)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lM9F6-0008Fe-Gr; Tue, 16 Mar 2021 08:56:14 -0400
Received: from [192.168.100.1] ([82.142.20.38]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MHWzP-1lQo4h47wf-00DXUZ; Tue, 16 Mar 2021 13:55:55 +0100
To: BALATON Zoltan <balaton@eik.bme.hu>
References: <cover.1615345138.git.balaton@eik.bme.hu>
 <85548594-aaa1-8d3a-cedf-d2dd92f05028@eik.bme.hu>
 <b6bda254-ac3-d271-3e1b-bf73e4282e9b@eik.bme.hu>
 <d6d7d87b-7c7d-69e8-a7f4-e6611a4096ea@vivier.eu>
 <276e8961-d058-c47e-82dd-1715881607d5@amsat.org>
 <4ce33c11-af3c-4a18-fccb-9c9bdb2b26c2@vivier.eu>
 <ea5f6f28-3be1-6a80-7b8a-c3563baec061@eik.bme.hu>
From: Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH v7 0/8] Pegasos2 emulation
Message-ID: <d5bdc780-4809-2666-35cb-a2096ed967e0@vivier.eu>
Date: Tue, 16 Mar 2021 13:55:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <ea5f6f28-3be1-6a80-7b8a-c3563baec061@eik.bme.hu>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:LlUbvfHP7EaH0VLXg4p++NQwU1wnT1huAYbxcVnz6yC+74gt0QC
 oJOh3g/3o9UO7HCbci2hcX7kmFWWst0Zj9i1OeWSFOCIIsz/he258cBtj3IPygTOfUEA067
 7xZ7ZJ/MbOXwm2g4aDChIB9FlfWfUTYrIiSb602WBxWveS3uJ0j9aTQiJBJoQ6dHMgvB1Lu
 EdmrkAHEUpyID5v0/29cw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:eW87gf8GxWM=:dC+pPTr9UcIaXRVP46IRyW
 flYmTi6GKX1u0v3pHwBB5AFcxd5PzwB60IqCidSMYgJ3weU3ymtbvEMpwLvJyXZMj5ljJyKv5
 YOOLGqvMxwg3omp0r6Lc4DWpg1Yi1wt+Yc/JmVKW5TaP1l7cd+oo6/UayEfNS8/XYvCY7uOZ7
 /zBarya0Pmc+w+c097dNVujt4D8n/vO4cEaR/ECJsqhL+c7ZK7XSGaNkeMq5caFIR1WkwHdnM
 YUAnzB+x3D3hIxw6e/DMApYG3y+OaFpPUCSeJIinCnUnqACkwJOglCQxT4XjT49bJd6/w0u2E
 5q4SosepUXCw1fCXag0a6RU3P20YlQs6P2C21bYGtqgVKgRGuYNzXnKIO3+BqEY/5615AZYbT
 ry7s9KbwZzV35PkrjfejviaPuTszK5qemQp0rCDQ0WC4pmWS3s0QjUHBdGEqcb4Rwy1NlkgSm
 j9+vODqMHw==
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 16/03/2021 à 13:24, BALATON Zoltan a écrit :
> On Tue, 16 Mar 2021, Laurent Vivier wrote:
>> Le 16/03/2021 à 12:49, Philippe Mathieu-Daudé a écrit :
>>> On 3/16/21 10:01 AM, Laurent Vivier wrote:
>>>> Le 15/03/2021 à 13:33, BALATON Zoltan a écrit :
>>>>> On Sat, 13 Mar 2021, BALATON Zoltan wrote:
>>>>>> On Wed, 10 Mar 2021, BALATON Zoltan wrote:
>>>>>>> Hello,
>>>>>>
>>>>>> I've started posting this series well in advance to get it into 6.0 and yet it seems like it may
>>>>>> be missing it due to organisational issues (no real complaints were found with patches but
>>>>>> Philippe seems to like more review that does not seem to happen as nobody is interested). Looks
>>>>>> like David is waiting for an ack from Philippe but will be away next week so if this is not
>>>>>> resolved now it may be too late on Monday. To avoid that:
>>>>>>
>>>>>> David, could you please send an ack before you leave for the last two patches so it could get
>>>>>> committed via some other tree while you're away?
>>>>>>
>>>>>> Philippe, if you can't ack the vt82c686 patches now are you OK with taking the whole series via
>>>>>> your tree before the freeze? That would give you some more days to review and it could always be
>>>>>> reverted during the freeze but if it's not merged now I'll have to wait until the summer to
>>>>>> get it
>>>>>> in again which would be another long delay. I don't think this will get more reviews unless it's
>>>>>> in master and people can start using and testing it better.
>>>>>
>>>>> Hello,
>>>>>
>>>>> Since David seems to be away for this week before seeing my mail asking for an ack from him, now
>>>>> this can only get in by Philippe or Peter. (David said before he'd be OK with the series if
>>>>> Philippe
>>>>> acked it so I think that can count as an implicit ack and it could always be reverted before the
>>>>> releease.)
>>>>>
>>>>> Philippe, do you have anything against this to get merged now? If not please send a pull or ack it
>>>>> so it has a chance to be in 6.0 or tell if you still intend to do anything about it before the
>>>>> freeze. This series was on the list since January and the remaining parts you did not take are
>>>>> here
>>>>> since February 22nd and the version after your first review since two weeks so it would be nice to
>>>>> sort this out and not block it any further without a good reason.
>>>>
>>>> Pegasos looks like a New World PowerMac, so perhaps Mark can help?
>>>
>>> The PPC part is mostly reviewed. The problem is the first patch:
>>> "vt82c686: Implement control of serial port io ranges via config regs".
>>
>> vt82c686.c is a Fuloong 2E file, why Fuloong 2E maintainers are not involved in the review?
> 
> Philippe is MIPS maintainer and he was involved and reviewed most patches. Huacai did not respond
> much and Jiaxun's email adress is constantly stripped by the list so whenrver I add him it will be
> lost the next time. He seems to be more interested in Fuloong 3 anyway so did not respond much either.
> 
> All in all I think there's just not enough interest in these machines/devices so my stance is that
> if it does not break anything just take it now and then we'll have enough time for further review,
> fixing or reverting during the freeze. Whereas if this is kept pushing back then nothing will happen
> with them for the next 2-3 months then we'll be back to here and miss the next release as well.

The PATCH 1 doesn't seem to be needed to have a working Pegasos 2 machine, does it?

If the problem is only with the first patch perhaps you can remove it to have it merged and come
back later with a cleaner implementation (it is presented to be a hack)?

I think PATCH 6 can already be merged, and PATCH 2 can be done outside of the series as a pre-requisite.

Then it will be easier to manage a series only adding devices for your new machine.

Thanks,
Laurent


