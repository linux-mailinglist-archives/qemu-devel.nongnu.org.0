Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 217383AE767
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 12:41:58 +0200 (CEST)
Received: from localhost ([::1]:35074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvHNN-0003Yn-5C
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 06:41:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lvGwA-0001BQ-Sz; Mon, 21 Jun 2021 06:13:50 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:46323)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lvGw8-0007GK-Q6; Mon, 21 Jun 2021 06:13:50 -0400
Received: from [192.168.100.1] ([82.142.1.74]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1Mk178-1lXBbI46i8-00kQqm; Mon, 21 Jun 2021 12:13:41 +0200
Subject: Re: [PATCH] memory: Display MemoryRegion name in read/write ops trace
 events
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210307074833.143106-1-f4bug@amsat.org>
 <8892fbd6-a63c-ef02-78f3-935e4f95dbb1@amsat.org>
 <2def176e-8707-78cc-b524-3fd47456261f@amsat.org>
 <c4b050f9-8d36-28a5-b5fe-343bbbe0efdb@vivier.eu>
 <dadd0b69-e613-a0f6-5f81-a62159b41493@amsat.org>
 <a3660d89-0a2b-bb28-8a78-8d8078b71a01@vivier.eu>
 <ac9ed125-4efa-6068-9050-3dc367066de7@amsat.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <c1f1313c-6d32-c560-30e6-0acd8a6f2090@vivier.eu>
Date: Mon, 21 Jun 2021 12:13:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <ac9ed125-4efa-6068-9050-3dc367066de7@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:QvmmbzqnwrPht6ZtEYaud+oA0dq4yVojSSfcstB85+TdM1KQaAm
 bSi1QemFPU0ZQJilJgY7/i56e4G41eN0BHbA6lNCFOwukEdnXG+INwf5XiGow00CZijaKse
 JlaZGnlsjc+TSv2Og/DsbfpRJUTVXnGeDNUfPsoCjMeTXB6I7g8U6shUZAO4gnEhRO6f6YX
 3kS8LQ+/bZs6B1EyzPhTA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:rpCtNnGpv4E=:BRx7XE90geyK4HFtMM9WWA
 bwP7EHzQxAvtJDoQp/3F2z7alT61S8NPxntIZp8+o2ryDx6biyspRwGDIobBiR4jYZhITR8fm
 kWOHNHHRuqAkZ6DdVz+rQ5KttGNP4lLFPOHF65sGiokK2a+ye/BdqjAhLRGylIutG5Zcax66y
 J4KtjCeQJxUxtxGK3+F4PUR060rr2qag+nPLYD3WNIq5AKnxwagLXxJlW8MlFp6bSq2EhcZDO
 V4MmiRUp2kdKtWNo5l+A5oEkaq/1XBlY/SU08+NyX+C2mBIsRjGfJQW+1OKqB3GbIkD0L0Iu/
 lsbFMp23P6+sa6fX/WWIFVRCqsg/kowLParVxH0ssUI4WBlIbbYsrmufy2X/WwWPOtpQliz6a
 +/yaMniZBJS2znukitR3R6CvCrOitC+DUI6BL4WUOTnLxaZ98+NtGXxiJJDKrha0kOxVb1sW9
 JdDAOKqvNvsabQ08utqm9MRY3MBcLYB9QPKbMwzqvUG25QhWDyVvipUQ50pO6VzDnxbiU5c9b
 LIvGsh82WyV/QURBTsvMqs=
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 21/06/2021 à 12:08, Philippe Mathieu-Daudé a écrit :
> Hi Laurent,
> 
> On 6/7/21 1:29 PM, Laurent Vivier wrote:
>> Le 07/06/2021 à 10:28, Philippe Mathieu-Daudé a écrit :
>>> On 6/7/21 9:33 AM, Laurent Vivier wrote:
>>>> Le 02/06/2021 à 12:49, Philippe Mathieu-Daudé a écrit :
>>>>> Cc'ing qemu-trivial@
>>>>>
>>>>> On 3/18/21 4:39 PM, Philippe Mathieu-Daudé wrote:
>>>>>> ping?
>>>>>>
>>>>>> On 3/7/21 8:48 AM, Philippe Mathieu-Daudé wrote:
>>>>>>> MemoryRegion names is cached on first call to memory_region_name(),
>>>>
>>>> It is cached on first call but now that it is used in the trace function, does it mean it will be
>>>> always allocated in memory?
>>>
>>> Yes, this is how memory_region_name() works:
>>>
>>> const char *memory_region_name(const MemoryRegion *mr)
>>> {
>>>     if (!mr->name) {
>>>         ((MemoryRegion *)mr)->name =
>>>             g_strdup(object_get_canonical_path_component(OBJECT(mr)));
>>>     }
>>>     return mr->name;
>>> }
>>
>> OK, in fact I didn't see it was called from inside a "if
>> (trace_event_get_state_backends(TRACE_MEMORY_REGION_OPS_XXX))" and was worrying about the memory for
>> the string always allocated.
>>
>> So it looks good.
> 
> Is there something else you expect me to do with this patch?
> Maybe you expect another R-b to take it, so I should keep
> pinging for review?
> 

No, I'm working on a linux-user pull request, once done I'll do a new trivial branch pull request.

Thanks,
Laurent

