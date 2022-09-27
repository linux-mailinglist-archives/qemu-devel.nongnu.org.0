Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C61D75EC5CB
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 16:20:01 +0200 (CEST)
Received: from localhost ([::1]:53660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odBRI-0002G1-K5
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 10:20:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den-plotnikov@yandex-team.ru>)
 id 1od9Mh-0000bH-Og
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 08:07:08 -0400
Received: from forwardcorp1p.mail.yandex.net ([77.88.29.217]:43820)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den-plotnikov@yandex-team.ru>)
 id 1od9Md-0000Q1-V6
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 08:07:06 -0400
Received: from sas1-c73b4b4f4b95.qloud-c.yandex.net
 (sas1-c73b4b4f4b95.qloud-c.yandex.net
 [IPv6:2a02:6b8:c08:12a9:0:640:c73b:4b4f])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id CA32B2E0A30;
 Tue, 27 Sep 2022 14:59:22 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b64a::1:39] (unknown
 [2a02:6b8:b081:b64a::1:39])
 by sas1-c73b4b4f4b95.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 KlVkgXAZLv-xLOqLkm3; Tue, 27 Sep 2022 14:59:21 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Precedence: bulk
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1664279961; bh=xyCrrfUBQDrhURqvOTlLAgLJQ/mI5GptNgrrNai/z+E=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=T7NEPlXKwIADLgzCMRKjsise2bK2E+ETkKyANDh4NcpjVo1KWjgciBmjL0y6o2bzk
 jaBp9hghswimkN7f5ioBPh/Vk/L+dc3SbROrjda8bhZsPOL/WgJvsNXJZFwnyXMsGv
 zDuTE5HeQA2LFT70dHeBSMQyvPkxHX8A+e1Mqt6c=
Authentication-Results: sas1-c73b4b4f4b95.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <72d7816c-7c90-67f4-ea46-fc043bfd09cd@yandex-team.ru>
Date: Tue, 27 Sep 2022 14:59:20 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [patch v0] qapi/qmp: Add timestamps to qmp command responses.
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, yc-core@yandex-team.ru, michael.roth@amd.com
References: <20220926095940.283094-1-den-plotnikov@yandex-team.ru>
 <YzGmoWQPhR27VWX7@redhat.com> <871qrxnyjo.fsf@pond.sub.org>
From: Denis Plotnikov <den-plotnikov@yandex-team.ru>
In-Reply-To: <871qrxnyjo.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=77.88.29.217;
 envelope-from=den-plotnikov@yandex-team.ru; helo=forwardcorp1p.mail.yandex.net
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.319,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 27.09.2022 09:04, Markus Armbruster wrote:
> Daniel P. Berrangé <berrange@redhat.com> writes:
>
>> On Mon, Sep 26, 2022 at 12:59:40PM +0300, Denis Plotnikov wrote:
>>> Add "start" & "end" timestamps to qmp command responses.
>>> It's disabled by default, but can be enabled with 'timestamp=on'
>>> monitor's parameter, e.g.:
>>>      -chardev  socket,id=mon1,path=/tmp/qmp.socket,server=on,wait=off
>>>      -mon chardev=mon1,mode=control,timestamp=on
>> I'm not convinced a cmdline flag is the right approach here.
>>
>> I think it ought be something defined by the QMP spec.
> The QMP spec is docs/interop/qmp-spec.txt.  The feature needs to be
> defined there regardless of how we control it.
ok, thanks for pointing out
>
>> The "QMP" greeting should report "timestamp" capabilities.
>>
>> The 'qmp_capabilities' command can be used to turn on this
>> capability for all commands henceforth.
> Yes, this is how optional QMP protocol features should be controlled.
>
> Bonus: control is per connection, not just globally.
>
>> As an option extra, the 'execute' command could gain a
>> parameter to allow this to be requested for only an
>> individual command.
> Needs a use case.
>
>> Alternatively we could say the overhead of adding the timestmaps
>> is small enough that we just add this unconditionally for
>> everything hence, with no opt-in/opt-out.
> Yes, because the extension is backwards compatible.

May be it worth to send the timestamps always in the response if doesn't 
contradicts with anything and doesn't bring any unnecessary data overhead.

 From the other hand turning it on via qmp capabilities seems to be more 
flexible solution.

>
> Aside: qmp-spec.txt could be clearer on what that means.
>
>>> Example of result:
>>>
>>>      ./qemu/scripts/qmp/qmp-shell /tmp/qmp.socket
>>>
>>>      (QEMU) query-status
>>>      {"end": {"seconds": 1650367305, "microseconds": 831032},
>>>       "start": {"seconds": 1650367305, "microseconds": 831012},
>>>       "return": {"status": "running", "singlestep": false, "running": true}}
>>>
>>> The responce of the qmp command contains the start & end time of
>>> the qmp command processing.
> Seconds and microseconds since when?  The update to qmp-spec.txt should
> tell.
>
> Why split the time into seconds and microseconds?  If you use
> microseconds since the Unix epoch (1970-01-01 UTC), 64 bit unsigned will
> result in a year 586524 problem:
>
>      $ date --date "@`echo '2^64/1000000' | bc`"
>      Wed Jan 19 09:01:49 CET 586524
>
> Even a mere 53 bits will last until 2255.
This is Just for convenience, may be it's too much and timestamp in msec 
if enough
>
>>> These times may be helpful for the management layer in understanding of
>>> the actual timeline of a qmp command processing.
>> Can you explain the problem scenario in more detail.
> Yes, please, because:
>
>> The mgmt app already knows when it send the QMP command and knows
>> when it gets the QMP reply.  This covers the time the QMP was
>> queued before processing (might be large if QMP is blocked on
>> another slow command) , the processing time, and the time any
>> reply was queued before sending (ought to be small).
>>
>> So IIUC, the value these fields add is that they let the mgmt
>> app extract only the command processing time, eliminating
>> any variance do to queue before/after.
So the scenario is the following: we need a means to understand from the 
management layer prospecitive of what is the timeline of the command 
execution. This is needed for a problem resolving if a qmp command 
executes for too long from the management layer point of view. 
Specifically, management layer sees the execution time as 
"management_layer_internal_routine_time" + "qemu_dispatching_time" + 
"qemu_qmp_command_execution_time". Suggested qmp command timestaps gives 
"qemu_command_execution_time". Management layer calculates 
"management_layer_internal_routine_time" internally. Using those two 
things we can calculate "qemu_dispatching_time" and decide where the 
potential delays comes from. This will gives us a direction of further 
problem investigation.
>>
>>> Suggested-by: Andrey Ryabinin <arbn@yandex-team.ru>
>>> Signed-off-by: Denis Plotnikov <den-plotnikov@yandex-team.ru>

