Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7440C45DA74
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Nov 2021 13:52:47 +0100 (CET)
Received: from localhost ([::1]:35372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqEF4-0003lV-3j
	for lists+qemu-devel@lfdr.de; Thu, 25 Nov 2021 07:52:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mqE5X-0003Ot-Mq
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 07:42:55 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:48432)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mqE5U-0003E3-L0
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 07:42:55 -0500
Received: from [192.168.12.10] (unknown [195.68.53.70])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 75CC020782;
 Thu, 25 Nov 2021 12:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1637844166;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1zBOkLcaO0nQMJq9eDlK0vIVPZ7jNPqr+pnMvSWGm9M=;
 b=4KAYkM0isi6xQeqDBRK05Gmn3cPyD5WmDQ7B0mCvfsQhFE+gOOVqnk5uMYZPOiLsK1/Ant
 pXPBWhzznEYOkGXQ6uRnJDZ3Dk3VkgslaG1HAYIHqM3vJGOMwNss8M2BFkdCGc7SM4pFk/
 lYevBJYh8T9kv5wLc1tAMq4s5aCkpAg=
Message-ID: <ecf32268-00e5-3990-56b1-c54ff4a59733@greensocs.com>
Date: Thu, 25 Nov 2021 13:42:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [RFC PATCH v3 0/5] QMP support for cold-plugging devices
Content-Language: en-US-large
To: Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20211117144703.16305-1-damien.hedde@greensocs.com>
 <87y25jw69i.fsf@dusky.pond.sub.org>
 <d3ae2bea-7d60-a714-100c-40b31fd19725@greensocs.com>
 <87lf1dwtm4.fsf@dusky.pond.sub.org> <YZ5HI0ms/sd4gEIS@redhat.com>
 <87czmpvc7o.fsf@dusky.pond.sub.org>
From: Damien Hedde <damien.hedde@greensocs.com>
In-Reply-To: <87czmpvc7o.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=damien.hedde@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -61
X-Spam_score: -6.2
X-Spam_bar: ------
X-Spam_report: (-6.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.1,
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
Cc: edgar.iglesias@xilinx.com, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Eric Blake <eblake@redhat.com>,
 Mark Burton <mark.burton@greensocs.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Auger <eric.auger@redhat.com>,
 Mirela Grujic <mirela.grujic@greensocs.com>,
 Alistair Francis <alistair.francis@wdc.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 11/24/21 15:51, Markus Armbruster wrote:
> Daniel P. Berrangé <berrange@redhat.com> writes:
> 
>> On Wed, Nov 24, 2021 at 02:50:11PM +0100, Markus Armbruster wrote:
>>> Damien Hedde <damien.hedde@greensocs.com> writes:
>>>
>>>> The biggest difference is the fw_cfg option I think: it is related
>>>> with the rom_set_order_override()/rom_reset_order_override() (line 17
>>>> and 25). There is also the usb devices parts in between. I lack the
>>>> knowledge about fw_cfg/usb to tell if it is important or not.
>>>>
>>>> What I wanted to say is I don't know if the difference is
>>>> acceptable. If we want device_add to support all -device use cases, it
>>>> is not. In that case we need to stop either in the middle of this
>>>> function (line 15) or at the end (better with your sketch in mind).
>>>>
>>>> Note that rom_set_order_override()/rom_reset_order_override() only
>>>> set/reset a switch variable that changes how fw_cfg files are
>>>> sorted. It could be integrated into device_add code (and removed from
>>>> the above function) without changing the behavior.
>>>
>>> For me, the part that puts me off is interleaving CLI and QMP.
>>>
>>> We process the CLI in an order few people understand, and only while
>>> staring at the code.  That's bad.
>>>
>>> Injecting QMP at certain points in that sequence can only make it worse.
>>
>> Yep, I share your unease here.. especially wrt this quoted text
>> from later:
>>
>>    > >> Users can do as much or as little with the CLI as they want.  You'd
>>    > >> probably want to set up a QMP monitor and no more.
>>
>> I would say that is a case of overkill. It can only make our
>> lives harder as maintainers in the long term, if we have to
>> worry about such arbitrary mixing of QMP and CLI. This is
>> also why I'm pretty uneasy about the 'preconfig' stuff as
>> implemented today in general.
>>
>> It is a half-way house that doesn't really give mgmt apps
>> what they want, which is a 100% QAPI-only config. If mgmt
>> apps start using preconfig, it won't make life any better
>> for them and will also lock QEMU maintainers into supporting
>> this half-way house.
> 
> Misunderstanding?  The paragraph you quoted is about this design:
> 
>      1. Start event loop
>      
>      2. Feed it CLI left to right.  Each option runs a handler just like each
>          QMP command does.
>      
>          Options that read a configuration file inject the file into the feed.
>      
>          Options that create a monitor create it suspended.
>      
>          Options may advance the phase / run state, and they may require
>          certain phase(s).
>      
>      3. When we're done with CLI, resume any monitors we created.
>      
>      4. Monitors now feed commands to the event loop.  Commands may advance
>          the phase / run state, and they may require certain phase(s).
>      
>      Users can do as much or as little with the CLI as they want.  You'd
>      probably want to set up a QMP monitor and no more.
>      
>      device_add becomes possible at a certain state of the phase / run state
>      machine.  It changes from cold to hot plug at a certain later state.
> 
> Certainly enables 100% QAPI-only config.  It just doesn't *force* you to
> 100%.  Feature.
> 
>> We have a bit of a track record with QEMU of introducing
>> partial solutions and never quite finishing the job. There's
>> little strong incentive to ever finish it, if you can freely
>> mix both old and new style forever, and thus maintainers are
>> burdened forever with both.
>>
>> IMHO, we should only try to support the non-mixed scenarios
>>
>>    - 100% of hardware configured via CLI args
>>    - 100% of hardware configured via QAPI (whether live in
>>      QMP, or fed in via a QAPI based JSON/YAML config file)
>>
>> so that we only have two clear cases we need to worry about
>> dealing with.
>>
>> Focus our efforts 100% of the 100% QAPI scenario and don't
>> divert energy into short term hybrid solutions.
> 
> The design above pretty much requires 100% QAPI.
> 
> It's based on the notion that there's no real difference between a CLI
> option and a QMP command that doesn't return a value.  So treat the CLI
> more like a monitor.
> 
> For sanity's sake, make it not race with the other monitors by starting
> them suspended.
> 
> This design is arguably *less* hybrid than one that treats a (severely
> dumbed down) CLI unlike a monitor.
>

It seems there is a big gap from where we are now to a full QAPI startup 
support.
Could we adopt a plan which would allow us to progress from where we are 
to full QAPI support in small steps ?

For example, the following:

  1. CLI/QMP interleaving seems to be big issue right now. We could 
solve this by making -preconfig stop only after all CLI options are 
"consumed".
For example if you give -preconfig and some -device, qemu won't stop 
before having created the devices.

Meaning you would do
$qemu [out-of-order CLI with -preconfig] then jump into the monitors.

Depending on your use case, you would have to give a few CLI options so 
that -preconfig stops early enough.

  2. Then we can enable QMP commands one by one corresponding to 
unsupported and needed/cleaned up CLI options. They will check and/or 
advance the phase/runstate.

Basically this would mean we have to first convert CLI options that are 
used last in the startup procedure.
Along the road we will be able to make -preconfig stop earlier and earlier.

You could do a ~0% CLI startup at any point during the development
$qemu -monitor... --preconfig
but you would have a reduced set of configuration possibilities due the 
lack of QAPI support.

In addition, optionally, if we want to go with the left-to-right CLI 
parsing and reading a CLI script file like Markus proposed, we could 
have something like:
$qemu [out-of-order CLI] --preconfig [in-order CLI]
with [in-order CLI] being a 1:1 equivalent of QMP commands. [in-order 
CLI] will still be parsed and executed before jumping in the monitors.

Damien

