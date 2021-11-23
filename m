Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29DF745A75C
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Nov 2021 17:15:19 +0100 (CET)
Received: from localhost ([::1]:57832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpYRw-0004xa-Vs
	for lists+qemu-devel@lfdr.de; Tue, 23 Nov 2021 11:15:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mpYOD-0003Df-Dz
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 11:11:25 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:56058)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mpYOA-0000pS-GS
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 11:11:25 -0500
Received: from [192.168.12.10] (unknown [195.68.53.70])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 6BE6821A86;
 Tue, 23 Nov 2021 16:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1637683878;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MnIGOSNOK3mp570k8LMcpgjjNBFNFk7fkdqmYPA6QlQ=;
 b=cbMdFohpYXsFJReaH1SpvAhpF6UEDqQe/FRFAJnJGxkEOPPB2N6cs/5UDFkbBgkbB92Q6V
 YaycGOGGqbaWFEPjij7lyci4APDZJZQk3FIjqosW972NJ+tInxweE/PftKavfHRpdlA3aJ
 ClG9Icoh3XqUCd8SRtTaZ8PEAtd90U8=
Message-ID: <d3ae2bea-7d60-a714-100c-40b31fd19725@greensocs.com>
Date: Tue, 23 Nov 2021 17:11:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [RFC PATCH v3 0/5] QMP support for cold-plugging devices
Content-Language: en-US-large
To: Markus Armbruster <armbru@redhat.com>
References: <20211117144703.16305-1-damien.hedde@greensocs.com>
 <87y25jw69i.fsf@dusky.pond.sub.org>
From: Damien Hedde <damien.hedde@greensocs.com>
In-Reply-To: <87y25jw69i.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=damien.hedde@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.515,
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
Cc: edgar.iglesias@xilinx.com,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Eric Blake <eblake@redhat.com>, Mark Burton <mark.burton@greensocs.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Auger <eric.auger@redhat.com>,
 Mirela Grujic <mirela.grujic@greensocs.com>,
 Alistair Francis <alistair.francis@wdc.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 11/20/21 10:00, Markus Armbruster wrote:
> Damien Hedde <damien.hedde@greensocs.com> writes:
> 
>> Hi all,
>>
>> This series adds support for cold-plugging devices using QMP
>> commands. It is a step towards machine configuration using QMP, but
>> it does not allow the user to add more devices than he could do with
>> the CLI options before.
>>
>> Right now we can add a device using 2 ways:
>> + giving "-device" CLI option. In that case the device is
>>    cold-plugged: it is created before the machine becomes ready.
>> + issuing device_add QMP command. In that case the device is
>>    hot-plugged (the command can not be issued before the machine is
>>    ready).
>>
>> This series allows to issue device_add QMP to cold-plug a device
>> like we do with "-device" CLI option. All added QMP commands are
>> marked as 'unstable' in qapi as they are part of preconfig.
>> We achieve this by introducing a new 'x-machine-init' command to
>> stop the VM creation at a point where we can cold-plug devices.
>>
>> We are aware of the ongoing discussion about preconfig future (see
>> [1]). This patchset includes no major modifications from the v2 (but
>> the scope is reduced) and "x-machine-init" simply stops the
>> configuration between qemu_board_init() and qemu_create_cli_devices()
>> function calls.
>>
>> As a consequence, in the current state, the timeline is:
> 
> "current state" = with this series applied?

yes. this patchset adds the first two steps.

> 
>> + "x-machine-init" command
>> + "device_add" cold-plug commands (no fw_cfg legacy order support)
>> + "x-exit-preconfig" command will then trigger the following
>> + "-soundhw" CLI options
>> + "-fw_cfg" CLI options
>> + usb devices creation
>> + "-device" CLI options (with fw_cfg legacy order support)
>> + some other devices creation (with fw_cfg legacy order support)
>>
>> We don't know if the differences between -device/device_add are
>> acceptable or not. To reduce/remove them we could move the
>> "x-machine-init" stopping point. What do you think ?
> 
> I'm not sure I understand this paragraph.
> 
> I understand the difference between -device and device_add in master:
> cold vs. hot plug.
> 
> Your patch series makes "cold" device_add possible, i.e. it reduces
> (eliminates?) the difference between -device and device_add when the
> latter is "cold".

Yes.
Apart, before this patchset cold-plugging with device_add was not 
possible at all.

So, any difference between -device and a cold device_add is added here. 
(no bad intention, the patch did not move since v1 and this part of the 
code is just really tricky to understand...)

> 
> What difference remains that moving 'the "x-machine-init" stopping
> point' would 'reduce/remove'?

To answer this, let's take a look at qemu_create_cli_devices() (I 
removed some comments).

| 1 static void qemu_create_cli_devices(void)
| 2 {
| 3     DeviceOption *opt;
| 4
| 5     soundhw_init();
| 6
| 7     qemu_opts_foreach(qemu_find_opts("fw_cfg"),
| 8                       parse_fw_cfg, fw_cfg_find(), &error_fatal);
| 9
|10     /* init USB devices */
|11     if (machine_usb(current_machine)) {
|12         if (foreach_device_config(DEV_USB, usb_parse) < 0)
|13             exit(1);
|14     }
|15
|16     /* init generic devices */
|17     rom_set_order_override(FW_CFG_ORDER_OVERRIDE_DEVICE);
|18     qemu_opts_foreach(qemu_find_opts("device"),
|19                       device_init_func, NULL, &error_fatal);
|20     QTAILQ_FOREACH(opt, &device_opts, next) {
|21         loc_push_restore(&opt->loc);
|22         qdev_device_add_from_qdict(opt->opts, true, &error_fatal);
|23         loc_pop(&opt->loc);
|24     }
|25     rom_reset_order_override();
|26 }

The configuration timeline is:
Line 3    : handle "-soundhw" (deprecated).
Line 7-8  : handle "-fw_cfg"
Line 10-14: related to USB devices
Line 18-19: handle "-device" CLI options (legacy cli format)
Line 20-24: handle "-device" CLI options (json format)

With this patchset implementation, we pause just before calling this 
function (it seemed logical to stop here, given the machine phase). But 
the above timeline happens after we paused and issued device_add to cold 
plug devices. As a consequence there is a difference between (1) giving 
a -device option and (2) issuing a device_add at this pause point.

The biggest difference is the fw_cfg option I think: it is related with 
the rom_set_order_override()/rom_reset_order_override() (line 17 and 
25). There is also the usb devices parts in between. I lack the 
knowledge about fw_cfg/usb to tell if it is important or not.

What I wanted to say is I don't know if the difference is acceptable. If 
we want device_add to support all -device use cases, it is not. In that 
case we need to stop either in the middle of this function (line 15) or 
at the end (better with your sketch in mind).

Note that rom_set_order_override()/rom_reset_order_override() only 
set/reset a switch variable that changes how fw_cfg files are sorted. It 
could be integrated into device_add code (and removed from the above 
function) without changing the behavior.

> 
>> Patches 1, 3 and 5 miss a review.
>>
>> The series is organized as follow:
>>
>> + Patches 1 and 2 converts the MachinePhase enum to a qapi definition
>>    and add the 'query-machine-phase'. It allows to introspect the
>>    current machine phase during preconfig as we will now be able to
>>    reach several machine phases using QMP.
> 
> If we fold MachinePhase into RunState, we can reuse query-status.
> 
> Having two state machines run one after the other feels like one too
> many.
> 
>> + Patch 3 adds the 'x-machine-init' QMP command to stop QEMU at
>>    machine-initialized phase during preconfig.
>> + Patch 4 allows issuing device_add QMP command during the
>>    machine-initialized phase.
>> + Patch 5 improves the doc about preconfig in consequence.
> 
> I understand you want to make progress towards machine configuration
> with QMP.  However, QEMU startup is (in my educated opinion) a hole, and
> we should be wary of digging deeper.
> 
> The "timeline" you gave above illustrates this.  It's a complicated
> shuffling of command line options and QMP commands that basically nobody
> can keep in working memory.  We have reshuffled it / made it more
> complicated quite a few times already to support new features.  Based on
> your cover letter, I figure you're making it more complicated once more.
> 
> At some point, we need to stop digging us deeper into the hole.  This is
> not an objection to merging your work.  It's a call to stop and think.

That's why we re-posted this as RFC. Reading the preconfig thread, I had 
the feeling what we've initially proposed 6 months ago was not going 
into the direction discussed in the thread. We don't want to put more 
effort in a dead-end but we are committed into fixing it so that it fits 
into the good direction.

Do you mean we should wait for "stabilize preconfig" thread to arrive to 
some conclusion before we continue to work on this ?

Thanks,
Damien

> 
> Let me quote the sketch I posted to the "Stabilize preconfig" thread:
> 
> 1. Start event loop
> 
> 2. Feed it CLI left to right.  Each option runs a handler just like each
>     QMP command does.
> 
>     Options that read a configuration file inject the file into the feed.
> 
>     Options that create a monitor create it suspended.
> 
>     Options may advance the phase / run state, and they may require
>     certain phase(s).
> 
> 3. When we're done with CLI, resume any monitors we created.
> 
> 4. Monitors now feed commands to the event loop.  Commands may advance
>     the phase / run state, and they may require certain phase(s).
> 
> Users can do as much or as little with the CLI as they want.  You'd
> probably want to set up a QMP monitor and no more.
> 
> device_add becomes possible at a certain state of the phase / run state
> machine.  It changes from cold to hot plug at a certain later state.
> 
>> [1]: https://lore.kernel.org/qemu-devel/b31f442d28920447690a6b8cee865bdbacde1283.1635160056.git.mprivozn@redhat.com
>>
>> Thanks for your feedback.
> 

