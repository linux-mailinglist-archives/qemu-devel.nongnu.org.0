Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE8DE38E640
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 14:08:06 +0200 (CEST)
Received: from localhost ([::1]:32892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ll9NI-0004NA-P2
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 08:08:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1ll9M2-0003N4-LG
 for qemu-devel@nongnu.org; Mon, 24 May 2021 08:06:42 -0400
Received: from mx2.suse.de ([195.135.220.15]:49980)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1ll9M0-0006ju-Ip
 for qemu-devel@nongnu.org; Mon, 24 May 2021 08:06:42 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1621857997; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I3V4LFjtInPvuBrNsoaS3C2h1OCWgswWo/mAr9mKwT8=;
 b=AMmkJYSiJLojXeOqIcQgtVNgURJ+FoJ7DSfdlEvtcLbUyRJTWvXzbJJfSBgKcmk73Smajw
 Y16MpDpmrlsnBH0fDoaLi1jU6qRF17ut7BpSZDgIMnbz8HMZ1msdyL3KcCBcDie8uOCmeA
 Hft63fJ/I0Q8rUfuKewjEFIbMXFR8WI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1621857997;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I3V4LFjtInPvuBrNsoaS3C2h1OCWgswWo/mAr9mKwT8=;
 b=bUYTKu/o3F9I41NR0jxtRTvcnaCsY29l2AD481PQBVWgc6cYfzy+RBYWVzHjeUXCgqM61T
 AtC9YaHVQ4sxs4DQ==
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 770A5AC11;
 Mon, 24 May 2021 12:06:37 +0000 (UTC)
Subject: Re: latest GOOD state of series i386 cleanup, arm cleanup, s390
 cleanup
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <466cf154-cabf-2e8f-021f-a82cf7b88b31@suse.de>
 <20be5f7e-f475-4f3c-0fca-fff1750c08fe@suse.de> <87tun0cf3d.fsf@linaro.org>
 <198d8ef3-cc15-6f9d-6455-286748a705a8@suse.de> <871ra1crx4.fsf@linaro.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <8c016171-5c59-ee82-7fd7-6afa61182fb7@suse.de>
Date: Mon, 24 May 2021 14:06:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <871ra1crx4.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Liang Yan <lyan@suse.com>, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Al Cho <ACho@suse.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/20/21 6:02 PM, Alex Bennée wrote:
> 
> Claudio Fontana <cfontana@suse.de> writes:
> 
>> On 5/18/21 4:02 PM, Alex Bennée wrote:
>>>
>>> Claudio Fontana <cfontana@suse.de> writes:
>>>
>>>> On 5/17/21 11:53 AM, Claudio Fontana wrote:
>>>>> Hello all,
>>>>>
>>>>> due to my inactivity for a few weeks coupled likely with the upstream processes around qemu-6.0 now the series:
>>>>>
>>>>> 1) i386 cleanup
>>>>> 2) arm cleanup and experimental kvm-only build
>>>>> 3) s390 cleanup
>>>>>
>>>>> have become stale and hard to rebase on latest master.
>>>>> This effect is compounded by the fact that lots of broken tests in
>>>>> master have been added.
>>>
>>> Which tests are these? I know master suffers a bit from occasional
>>> falling red but to my knowledge everything should be green (at least
>>> from my last PR anyway ;-).
>>>
>>>>>
>>>>> In the interest of not losing work,
>>>>> I provide here the latest known good state of these series:
>>>>>
>>>>> For the i386 cleanup:
>>>>> https://gitlab.com/hw-claudio/qemu/-/pipelines/293603386
>>>>>
>>>>> Tests started breaking horribly since about 1/2 weeks.
>>>
>>> The pipeline only shows one failed test (checkpatch) which is an
>>> allowfail I believe. /me is confused.
>>
>> Hi Alex, yes, I pointed to the last pipeline that works :-)
>>
>>>
>>>>> The latest version of the cleanup is reachable here:
>>>>>
>>>>> https://github.com/qemu/qemu.git branch "i386_cleanup_9"
>>>>>
>>>>> In my understanding, Paolo has now picked up this one.
>>>>>
>>>>> For the ARM cleanup and experimental kvm-only build:
>>>>>
>>>>> https://gitlab.com/hw-claudio/qemu/-/pipelines/293603376
>>>>>
>>>>> https://github.com/qemu/qemu.git branch "arm_cleanup_v15"
>>>>>
>>>>> Again here tests started misbehaving in the same timeframe.
>>>>>
>>>>> The state of ARM cleanup is still experimental, maybe Liang or
>>>>> Philippe you can adopt this one?
> 
> I've done a re-base onto the current master (and my testing/next):
> 
>   https://github.com/stsquad/qemu/tree/review/arm_cleanup_v15
> 
> which is currently working it's way through my CI:
> 
>   https://gitlab.com/stsquad/qemu/-/pipelines/306727076
> 
> As I've got patches waiting for this re-factor I'm happy to take the
> series on if you've run out of time/patience ;-)
> 

I don't see any other takers so it makes sense, thanks a lot!

Maybe Liang you could help Alex along the way in promoting this work from experimental state to ready for actual integration?

Thanks,

Claudio

