Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA3E60A545
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 14:22:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omw9n-0005nU-OB; Mon, 24 Oct 2022 08:02:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=xank=2Z=zx2c4.com=Jason@kernel.org>)
 id 1omw8L-0005N1-2x
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 08:00:45 -0400
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=xank=2Z=zx2c4.com=Jason@kernel.org>)
 id 1omw8I-0008U6-E1
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 08:00:44 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 750DB61257
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 12:00:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5431C43141
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 12:00:33 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="LYhVe6Op"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1666612830;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sVAKExOuZ86uPiiBKvfa/z/bnHGc3tATyxb2ifPX0kU=;
 b=LYhVe6Opv/bEUXTp/MRtlViTixMHenmVFv05xTsuwEQ2YDfxFDCoKvvJei5AD2Bn1ZOcEP
 QB1/5W+tsnmT+RMW6Zxw186UzVH8OLmZAIYljTw+7MeixZ43wWjtovpHJoDFUE2VK397RZ
 chDezJnwz/Av1dB/rIaU0oKYuwpG/90=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 69ffe69b
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO) for <qemu-devel@nongnu.org>;
 Mon, 24 Oct 2022 12:00:30 +0000 (UTC)
Received: by mail-vk1-f171.google.com with SMTP id i15so2610647vka.0
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 05:00:30 -0700 (PDT)
X-Gm-Message-State: ACrzQf2uLnonl+rBm7m0BrtyyM/qezMRmrWmhw54Vv77qRiSY4PeIFHh
 nAJi5gAPWEFSNzVK2Ia39Xoje8qBkFA4JE9EQmU=
X-Google-Smtp-Source: AMsMyM5fa+DvM8910XiNTL8bZmyJGb78+F2IS6Ny+FTin3h9U6A6ib4LvgaAUWtYvG8lvM9MBKERxMlzyfA6i7ZKnWY=
X-Received: by 2002:a05:6122:317:b0:3b7:6590:daa1 with SMTP id
 c23-20020a056122031700b003b76590daa1mr1596031vko.37.1666612829283; Mon, 24
 Oct 2022 05:00:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:35cb:0:b0:40d:d85:af37 with HTTP; Mon, 24 Oct 2022
 05:00:28 -0700 (PDT)
In-Reply-To: <CAFEAcA8jra50q_DvNTGG8Wi+eF+PEKPHnfLNBhUjG9muqiPe0A@mail.gmail.com>
References: <20221014021653.1461512-1-Jason@zx2c4.com>
 <20221014021653.1461512-2-Jason@zx2c4.com>
 <CAFEAcA8jra50q_DvNTGG8Wi+eF+PEKPHnfLNBhUjG9muqiPe0A@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 24 Oct 2022 14:00:28 +0200
X-Gmail-Original-Message-ID: <CAHmME9pkhx-fs_nFN1k4nYkwjdATJ9fT2Ftw0pxhu2M+G+ujcg@mail.gmail.com>
Message-ID: <CAHmME9pkhx-fs_nFN1k4nYkwjdATJ9fT2Ftw0pxhu2M+G+ujcg@mail.gmail.com>
Subject: Re: [PATCH v3 1/8] reset: allow registering handlers that aren't
 called by snapshot loading
To: Peter Maydell <peter.maydell@linaro.org>
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org, richard.henderson@linaro.org, 
 Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=SRS0=xank=2Z=zx2c4.com=Jason@kernel.org;
 helo=dfw.source.kernel.org
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 10/24/22, Peter Maydell <peter.maydell@linaro.org> wrote:
> (Cc'ing Markus for a QMP related question.)
>
> On Fri, 14 Oct 2022 at 03:17, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>>
>> Snapshot loading only expects to call deterministic handlers, not
>> non-deterministic ones. So introduce a way of registering handlers that
>> won't be called when reseting for snapshots.
>>
>> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
>
>> diff --git a/migration/savevm.c b/migration/savevm.c
>> index 48e85c052c..a0cdb714f7 100644
>> --- a/migration/savevm.c
>> +++ b/migration/savevm.c
>> @@ -3058,7 +3058,7 @@ bool load_snapshot(const char *name, const char
>> *vmstate,
>>          goto err_drain;
>>      }
>>
>> -    qemu_system_reset(SHUTDOWN_CAUSE_NONE);
>> +    qemu_system_reset(SHUTDOWN_CAUSE_SNAPSHOT_LOAD);
>>      mis->from_src_file = f;
>>
>>      if (!yank_register_instance(MIGRATION_YANK_INSTANCE, errp)) {
>> diff --git a/qapi/run-state.json b/qapi/run-state.json
>> index 9273ea6516..74ed0ac93c 100644
>> --- a/qapi/run-state.json
>> +++ b/qapi/run-state.json
>> @@ -86,12 +86,14 @@
>>  #                   ignores --no-reboot. This is useful for sanitizing
>>  #                   hypercalls on s390 that are used during
>> kexec/kdump/boot
>>  #
>> +# @snapshot-load: A snapshot is being loaded by the record & replay
>> subsystem.
>> +#
>>  ##
>>  { 'enum': 'ShutdownCause',
>>    # Beware, shutdown_caused_by_guest() depends on enumeration order
>>    'data': [ 'none', 'host-error', 'host-qmp-quit',
>> 'host-qmp-system-reset',
>>              'host-signal', 'host-ui', 'guest-shutdown', 'guest-reset',
>> -            'guest-panic', 'subsystem-reset'] }
>> +            'guest-panic', 'subsystem-reset', 'snapshot-load'] }
>
> Markus: do we need to mark new enum values with some kind of "since n.n"
> version info ?
>
>>  ##
>>  # @StatusInfo:
>> diff --git a/softmmu/runstate.c b/softmmu/runstate.c
>> index 1e68680b9d..03e1ee3a8a 100644
>> --- a/softmmu/runstate.c
>> +++ b/softmmu/runstate.c
>> @@ -441,9 +441,9 @@ void qemu_system_reset(ShutdownCause reason)
>>      cpu_synchronize_all_states();
>>
>>      if (mc && mc->reset) {
>> -        mc->reset(current_machine);
>> +        mc->reset(current_machine, reason);
>>      } else {
>> -        qemu_devices_reset();
>> +        qemu_devices_reset(reason);
>>      }
>>      if (reason && reason != SHUTDOWN_CAUSE_SUBSYSTEM_RESET) {
>>          qapi_event_send_reset(shutdown_caused_by_guest(reason), reason);
>
> This change means that resets on snapshot-load, which previously
> did not result in sending a QMP event, will now start to do so
> with this new ShutdownCause type. I don't think we want that
> change in behaviour.

Good point. I'll exclude that case and send a v+1.

Jason

>
> (Also, as per the 'Beware' comment in run-state.json, we will
> claim this to be a 'caused by guest' reset, which doesn't seem
> right. If we suppress the sending the event that is moot, though.)
>
> Markus: if we add a new value to the ShutdownCause enumeration,
> how annoying is it if we decide we don't want it later? I guess
> we can just leave it in the enum unused... (In this case we're
> using it for purely internal purposes and it won't ever actually
> wind up in any QMP events.)
>
> thanks
> -- PMM
>


-- 
Jason A. Donenfeld
Deep Space Explorer
fr: +33 6 51 90 82 66
us: +1 513 476 1200
www.jasondonenfeld.com
www.zx2c4.com
zx2c4.com/keys/AB9942E6D4A4CFC3412620A749FC7012A5DE03AE.asc

