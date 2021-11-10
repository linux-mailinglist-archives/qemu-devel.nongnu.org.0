Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E42E44C215
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 14:29:18 +0100 (CET)
Received: from localhost ([::1]:34810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mknfB-0004ph-1Y
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 08:29:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mknZN-0002DD-CN
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 08:23:17 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:42126)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mknZK-00010d-Ab
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 08:23:17 -0500
Received: from [192.168.12.10] (unknown [195.68.53.70])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 21D7B20786;
 Wed, 10 Nov 2021 13:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1636550591;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i+aTsSoQTtoea2eWSXaOJFtXmhmfkcmjA7JOJ+loFV4=;
 b=syCqRB/FK4o1Zu0DpSYuxLqDindSx2eOtKb8qzmsa5TXDRV/uiWHJ/ESULENEG5PTI1sAk
 wkFBqKl09wZiWdb4BTE5bo86jint5Zo4/8umcfGf+j1n0myrwnAH6zMAKUYAJ8OWccJNyd
 FiBcNhVhhLtckTXyPdTQEGLhAvHxuJg=
Message-ID: <ca9fedf8-92bc-cb74-8448-74793429eaad@greensocs.com>
Date: Wed, 10 Nov 2021 14:23:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Subject: Re: [PATCH] qmp: Stabilize preconfig
Content-Language: en-US-large
To: =?UTF-8?B?TWljaGFsIFByw612b3puw61r?= <mprivozn@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <b31f442d28920447690a6b8cee865bdbacde1283.1635160056.git.mprivozn@redhat.com>
 <87bl3dfg9v.fsf@dusky.pond.sub.org>
 <bb896561-9d0c-6c6c-4bdb-5e7ef5ed71d5@redhat.com>
 <YYAATW1JQmzpDPhu@redhat.com> <87zgqlzmxi.fsf@dusky.pond.sub.org>
 <40bc6df2-496f-b303-2c10-f28ab4f9608c@redhat.com>
From: Damien Hedde <damien.hedde@greensocs.com>
In-Reply-To: <40bc6df2-496f-b303-2c10-f28ab4f9608c@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=damien.hedde@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.678,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 11/10/21 13:54, Michal Prívozník wrote:
> On 11/3/21 9:02 AM, Markus Armbruster wrote:
>> Daniel P. Berrangé <berrange@redhat.com> writes:
>>
>>> On Mon, Nov 01, 2021 at 03:37:58PM +0100, Michal Prívozník wrote:
>>>> On 10/25/21 2:19 PM, Markus Armbruster wrote:
>>>>> Michal Privoznik <mprivozn@redhat.com> writes:
>>>>>
>>>>>> The -preconfig option and exit-preconfig command are around for
>>>>>> quite some time now. However, they are still marked as unstable.
>>>>>> This is suboptimal because it may block some upper layer in
>>>>>> consuming it. In this specific case - Libvirt avoids using
>>>>>> experimental features.
>>>>>>
>>>>>> Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
>>>>>
>>>>> If I remember correctly, the motivation for -preconfig was NUMA
>>>>> configuration via QMP.  More uses may have appeared since.
>>>>>
>>>>> Back then, I questioned the need for yet another option and yet another
>>>>> state: why not -S?
>>>>>
>>>>> The answer boiled down to
>>>>>
>>>>> 0. Yes, having just one would be a simpler and cleaner interface, but
>>>>>
>>>>> 1. the godawful mess QEMU startup has become makes -S unsuitable for
>>>>>     some things we want to do, so we need -preconfig,
>>>>>
>>>>> 2. which is in turn unsuitable for other things we want to do, so we
>>>>>     still need -S".
>>>>>
>>>>> 3. Cleaning up the mess to the point where "simpler and cleaner" becomes
>>>>>     viable again is not in the cards right now.
>>>>
>>>> I see a difference between the two. -preconfig starts QEMU in such a way
>>>> that its configuration can still be changed (in my particular use case
>>>> vCPUs can be assigned to NUMA nodes), while -S does not allow that. If
>>>> we had one state for both, then some commands must be forbidden from
>>>> executing as soon as 'cont' is issued. Moreover, those commands would
>>>> need to do much more than they are doing now (e.g. regenerate ACPI table
>>>> after each run). Subsequently, validating configuration would need to be
>>>> postponed until the first 'cont' because with just one state QEMU can't
>>>> know when the last config command was issued.
>>
>> Doesn't all this apply to x-exit-preconfig already?
>>
>> * Some commands are only allowed before x-exit-preconfig,
>>    e.g. set-numa-node.
>>
>> * The complete (pre-)configuration is only available at
>>    x-exit-preconfig.  In particular, ACPI tables can be fixed only then.
> 
> So why was preconfig introduced in the first place? I mean, from
> libvirt's POV it doesn't really matter whether it needs to use both
> -preconfig and -S or just -S (or some new -option). But ideally, we
> would start QEMU with nothing but monitor config and then pass whole
> configuration via the monitor. I thought it would be simpler for QEMU if
> it had three states.
> 
> Michal
> 
> 

IMHO only introducing preconfig allowed to pause qemu at an early-enough 
stage to do qemu configuration. '-S' was just way too late.

We can hope being able, some day, to start with only preconfig and 
monitor setup and do all the rest using the monitor. AFAIK, right now 
accelerator, machine and device options cannot be configured on the 
monitor even with preconfig. For the devices it should be doable soon.

Damien

