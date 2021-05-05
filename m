Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BA8537366D
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 10:41:59 +0200 (CEST)
Received: from localhost ([::1]:53822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leD6U-0006fY-Bf
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 04:41:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1leCsv-00020u-6H
 for qemu-devel@nongnu.org; Wed, 05 May 2021 04:27:57 -0400
Received: from mx2.suse.de ([195.135.220.15]:40060)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1leCst-00076A-Dp
 for qemu-devel@nongnu.org; Wed, 05 May 2021 04:27:56 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 85D99AEAA;
 Wed,  5 May 2021 08:27:52 +0000 (UTC)
Subject: Re: [PATCH v26 00/20] i386 cleanup PART 2
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20210301085450.1732-1-cfontana@suse.de>
 <cfeead83-4890-bdd8-c5cb-9bdb2ca24abb@suse.de> <875z21aghn.fsf@linaro.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <50c3c1e6-cc62-ee50-874b-72615d7bfac7@suse.de>
Date: Wed, 5 May 2021 10:27:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <875z21aghn.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Roman Bolshakov <r.bolshakov@yadro.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/8/21 3:02 PM, Alex Bennée wrote:
> 
> Claudio Fontana <cfontana@suse.de> writes:
> 
>> Hi,
>>
>> anything else for me to do here?
> 
> It looks to me that this series is looking pretty good. Every patch has
> at least one review so I think it's just waiting on the maintainers to
> pick it up.
> 
> Paolo/Richard - are you intending to take the series as is or are you
> waiting for something else? I'd like to see the patch delta reduced for
> the ARM cleanup work which is still ongoing.

I am a bit at a loss here, as this has been reviewed for a while, but nothing is happening.
Rebasing is starting to become more and more draining;

I am seeing some changes from Phil that redo some of the patches here (like target arch user),
maybe you would like to drive this?

> 
>>
>> The latest rebased state of this series should be always available here:
>>
>> https://gitlab.com/hw-claudio/qemu/-/tree/i386_cleanup_8

https://gitlab.com/hw-claudio/qemu/-/tree/i386_cleanup_9

is the more recent rebase, but now it is out of date again.

Phil could you help rebase this again?
Otherwise I could only get at this in about two weeks.

Thanks,

Claudio

>>
>> When it comes to the ARM cleanup series,
>> I would like to have the tests pass for ARM, before doing even more changes, could you help me there Philippe?
>>
>> Maybe applying some of your changes on top would fix the failures? I tried, for example with the arm-cpu-features ones, but it didn't work for me..
>>
> <snip>
> 


