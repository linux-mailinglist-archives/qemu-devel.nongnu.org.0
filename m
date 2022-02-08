Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B57CA4ADBFC
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 16:07:40 +0100 (CET)
Received: from localhost ([::1]:34860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHS5j-0006hc-3f
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 10:07:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nHPqn-0000ma-MY
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 07:44:05 -0500
Received: from [2001:41c9:1:41f::167] (port=51702
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nHPqg-0004oa-1a
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 07:44:03 -0500
Received: from [2a00:23c4:8ba0:ca00:d4eb:dbd5:5a41:aefe]
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nHPq1-00078B-Er; Tue, 08 Feb 2022 12:43:17 +0000
Message-ID: <60d34033-fd73-249d-97d2-886ece0ef190@ilande.co.uk>
Date: Tue, 8 Feb 2022 12:43:43 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20220127205405.23499-1-mark.cave-ayland@ilande.co.uk>
 <20220127205405.23499-9-mark.cave-ayland@ilande.co.uk>
 <CAFEAcA8ZiLTgeG_2aUHBoV0io52623VRybG0NL0uY8=9Fg59Kg@mail.gmail.com>
 <71542eb1-fc8f-8f30-81e0-35c9df764825@amsat.org>
 <877da5wzgp.fsf@pond.sub.org> <YgJF9SDwb93k5/fg@work-vm>
 <YgJZfwfpX5/R9HfR@redhat.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <YgJZfwfpX5/R9HfR@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba0:ca00:d4eb:dbd5:5a41:aefe
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 08/11] mos6522: add "info via" HMP command for debugging
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:41c9:1:41f::167
 (failed)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Laurent@vivier.eu,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08/02/2022 11:52, Daniel P. Berrangé wrote:

(cut)

>>> The proposed device-specific command uses a mechanism originally made
>>> for modules instead (more on that below).
>>>
>>> I think we should make up our minds which way we want device-specific
>>> commands done, then do *all* of them that way.
>>
>> I think device specific commands make sense, but I think it would
>> probably be better if we had an 'info dev $name' and that a method on
>> the device rather than registering each one separately.
>> I'd assume that this would be a QMP level thing that got unwrapped at
>> HMP.
>>
>> But that's not a problem for this contribution; someone else can figure
>> that out later.
> 
> Actually I think this would solve a problem with this contribution.
> This patch implements a QMP command but never registers it, so it
> isn't actually accessible via QMP. It only registers the HMP wrapper
> which rather defeats the point of doing it via the QMP HumanReadableText
> approach.
> 
> I'm guessing this was done because we don't have ability to dynamically
> register QMP commands at runtime.  I don't know how hard/easy it is
> to address this, and perhaps we don't even want to.  It was a problem
> for me when previously converting HMP info commands to QMP and I
> didn't get a solution, so didn't convert anything where the command
> impl was dynamically registered at runtime. This basically excluded
> converting devices that have been split into loadable modules.
> 
> If we had a general  'info dev-debug' (HMP) and  'x-query-dev-debug'
> commands, then we could side-step the QMP limitation, as both thue
> HMP and QMP comamnds could be statically registered. The devices
> then only need to register  a callback at runtime which should be
> easier to deal with.

That could work, or even just a "debug via" without using "info" for brevity.

You could even add the callback to DeviceClass so that the registration takes place 
as part of class_init() using a function such as device_class_register_debug("name", 
callback).


ATB,

Mark.

