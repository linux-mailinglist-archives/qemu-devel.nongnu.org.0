Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C344839DB60
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 13:31:24 +0200 (CEST)
Received: from localhost ([::1]:43092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqDTX-0002tM-QK
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 07:31:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lqDRQ-0008GK-AZ; Mon, 07 Jun 2021 07:29:12 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:44669)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lqDRN-0002H4-Cs; Mon, 07 Jun 2021 07:29:12 -0400
Received: from [192.168.100.1] ([82.142.12.38]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MMWcT-1m6Vli2bup-00JYE1; Mon, 07 Jun 2021 13:29:01 +0200
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210307074833.143106-1-f4bug@amsat.org>
 <8892fbd6-a63c-ef02-78f3-935e4f95dbb1@amsat.org>
 <2def176e-8707-78cc-b524-3fd47456261f@amsat.org>
 <c4b050f9-8d36-28a5-b5fe-343bbbe0efdb@vivier.eu>
 <dadd0b69-e613-a0f6-5f81-a62159b41493@amsat.org>
From: Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH] memory: Display MemoryRegion name in read/write ops trace
 events
Message-ID: <a3660d89-0a2b-bb28-8a78-8d8078b71a01@vivier.eu>
Date: Mon, 7 Jun 2021 13:29:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <dadd0b69-e613-a0f6-5f81-a62159b41493@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:YBO173BZMYbpcVocGaUD8bTNRjqiRV/WbBMIl6iWOEEXjy672AR
 aXvP+LoN8tYVqZICOBmDDlW74W4u3ly9XQh1EFcrzExPlP4cmpYiwqvisGQl8NYSrlc0djG
 KlQowM33iWZP+Ri1wrADhvYD/CCZtlKZVgrZrVFn8mIrPXyNv/WX2bsR9XTsEXvil5U/osj
 pxa5GpSeLMdWTqJKRJh8g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:rzZL3tJL4Eg=:lPTgm/muPTReZuXMij/QMj
 bKRVnyysiIaqN4kyrb3pEjf81907os6+sygCYn+Wjb4xnPWCe7ACFj3df+9rfLMniotNQ1a+i
 udxzzo9Hxud1xWazpLisO3E6ViBn7Xyp8rsIwmG5YJwASxWZWdnEpIbgi8lEQbQ61IhYBfH6p
 tOSA2g+bh74bzeHRf2CakUvtmNPQ8/R6x3pvaYWPBZ2IRr9X8/RWLRqNY991jOqEndbV4PvvF
 VJhs15pLH0mS1Cz17POc23HobHasI9Wf4+YICk6msm6eKLvzk1UiUxDtM/KYv64f496NUudLh
 EYBrSJlu9xYzeJ1y4qk77URyVH4zGbjWLAL6+Dxe9dsAc+5k6HsYvF3HcaSPn7GuB5XTjyCpm
 t8zUzmq5wJ1NQcCgHVvnsa9kaixD1aSuooJpqYQOJ76/bCaOAFblIYcREwDn44Ac7CJ26txoE
 1an4w2/silbiOm/8f/UUNslIWN+h7+x5J5SEl9rFl041Sl0mjAHv/hIxMvQ9s/vyQcO4zGwMf
 AGxS+m0BpGH5c+tZ41cue8=
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 07/06/2021 à 10:28, Philippe Mathieu-Daudé a écrit :
> On 6/7/21 9:33 AM, Laurent Vivier wrote:
>> Le 02/06/2021 à 12:49, Philippe Mathieu-Daudé a écrit :
>>> Cc'ing qemu-trivial@
>>>
>>> On 3/18/21 4:39 PM, Philippe Mathieu-Daudé wrote:
>>>> ping?
>>>>
>>>> On 3/7/21 8:48 AM, Philippe Mathieu-Daudé wrote:
>>>>> MemoryRegion names is cached on first call to memory_region_name(),
>>
>> It is cached on first call but now that it is used in the trace function, does it mean it will be
>> always allocated in memory?
> 
> Yes, this is how memory_region_name() works:
> 
> const char *memory_region_name(const MemoryRegion *mr)
> {
>     if (!mr->name) {
>         ((MemoryRegion *)mr)->name =
>             g_strdup(object_get_canonical_path_component(OBJECT(mr)));
>     }
>     return mr->name;
> }

OK, in fact I didn't see it was called from inside a "if
(trace_event_get_state_backends(TRACE_MEMORY_REGION_OPS_XXX))" and was worrying about the memory for
the string always allocated.

So it looks good.

Thanks,
Laurent



