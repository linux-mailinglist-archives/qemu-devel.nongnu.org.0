Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D0B92BAF75
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 17:02:58 +0100 (CET)
Received: from localhost ([::1]:55548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kg8sD-0006NC-Gc
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 11:02:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kg8jN-0006aN-5Q
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 10:53:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60876)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kg8jL-0005d6-C9
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 10:53:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605887626;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LEqK9zXO5j3vcdSQPdkEHDabnNx4rrXoMy0rwtN6EAI=;
 b=LnNtRWWd2tCjaNplTptOEdPiWXCOs6NxNhPrhdU6e5h0rZK7wki9jhpV6kLA5xAcrOiMlZ
 ycEpWjcAIBV5mXmeEK5VfC7T3djhVp2QJ77/w46Z1gO3gUzI23B+2eT17iUOo3UwspQoo6
 Kk5jevWSvxPd7B/DydBqTZR1B+hofQs=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-359-OXNpxuhaPIupBjgxTVRy-w-1; Fri, 20 Nov 2020 10:53:44 -0500
X-MC-Unique: OXNpxuhaPIupBjgxTVRy-w-1
Received: by mail-ej1-f71.google.com with SMTP id p18so3653421ejl.14
 for <qemu-devel@nongnu.org>; Fri, 20 Nov 2020 07:53:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LEqK9zXO5j3vcdSQPdkEHDabnNx4rrXoMy0rwtN6EAI=;
 b=FyDBn5FvwwgOHZQhUK714lIlk7jA4U1FJKF9UDi9WTc/nPX4hDrrBZYCjBvSe8y7zo
 zYLgfuxazESGImrlDT/agBY6Z+4aiFGvhXm93F+L2RA1pz4w1zsix/gENzXSQrLNtN1S
 Unoz8lA0p2ehbDZLx4RZn2tOZ4g7smoYqwHzWFuJKxD5jZ/Uq5Bc3Q8DscZ292Ke4+sZ
 /CE3nurPXEdo0kzX1B08bgG/S3wJZuCS/Ev325HTF7h1r0GBx6Ud+bFa1Lb4ATdg/1/G
 zMkv4YmEm5Bwv0o7ygAEovcvuxIwWkBHCfT7A33q77rx6qB7OiS48C74sLFJmi1ycLPM
 osEA==
X-Gm-Message-State: AOAM530pyube31/W9v9Z1klOdVtmNPuv/wvRzpivOuRMV+ZyyY5zgl5O
 gYeEtwB07BI+0wL2yQA+g/fVplvBUDxJ2zhoLCUuNQcHVeqUt5S7QLsAPZg9OW+zS17JgcIzy0L
 dqXG1/2tkC1YAA9GPVmR3OKc9PcKtFkVxk/supwvdNJXDj9C7JaDCFcknLh0x4PZkS2k=
X-Received: by 2002:a17:906:d8ce:: with SMTP id
 re14mr32453331ejb.275.1605887622994; 
 Fri, 20 Nov 2020 07:53:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx39eg2g71cNKoIzhPPW5OsxkJlhD5nvGJI7HFWLbFRG/uzm9NKIViD3SXrj0cv85b55zMwdw==
X-Received: by 2002:a17:906:d8ce:: with SMTP id
 re14mr32453318ejb.275.1605887622694; 
 Fri, 20 Nov 2020 07:53:42 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id bd21sm1244527edb.79.2020.11.20.07.53.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Nov 2020 07:53:41 -0800 (PST)
To: Igor Mammedov <imammedo@redhat.com>
References: <20201027182144.3315885-1-pbonzini@redhat.com>
 <20201027182144.3315885-23-pbonzini@redhat.com>
 <20201120161148.0dc2bdcf@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 22/29] vl: initialize displays before preconfig loop
Message-ID: <85980ae2-9da0-d432-6825-85782f4beee5@redhat.com>
Date: Fri, 20 Nov 2020 16:53:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201120161148.0dc2bdcf@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20/11/20 16:11, Igor Mammedov wrote:
> On Tue, 27 Oct 2020 14:21:37 -0400
> Paolo Bonzini <pbonzini@redhat.com> wrote:
> 
>> Displays should be available before the monitor starts, so that
>> it is possible to use the graphical console to interact with
>> the monitor itself.
>>
>> This patch is quite ugly, but all this is temporary.  The double
>> call to qemu_init_displays will go away as soon we can unify machine
>> initialization between the preconfig and "normal" flows, and so will
>> the preconfig_exit_requested variable (that is only preconfig_requested
>> remains).
>>
>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> 
> Doesn't apply to yer for-6.0 branch

I updated the branch.

Thanks,

Paolo

>> ---
>>   softmmu/vl.c | 58 ++++++++++++++++++++++++++++++++--------------------
>>   1 file changed, 36 insertions(+), 22 deletions(-)
>>
>> diff --git a/softmmu/vl.c b/softmmu/vl.c
>> index 1485aba8be..a46f1b9164 100644
>> --- a/softmmu/vl.c
>> +++ b/softmmu/vl.c
>> @@ -137,6 +137,7 @@ static ram_addr_t maxram_size;
>>   static uint64_t ram_slots;
>>   static int display_remote;
>>   static int snapshot;
>> +static bool preconfig_requested;
>>   static QemuPluginList plugin_list = QTAILQ_HEAD_INITIALIZER(plugin_list);
>>   static BlockdevOptionsQueue bdo_queue = QSIMPLEQ_HEAD_INITIALIZER(bdo_queue);
>>   static bool nographic = false;
>> @@ -3210,12 +3211,12 @@ static void qemu_validate_options(void)
>>             }
>>       }
>>   
>> -    if (loadvm && !preconfig_exit_requested) {
>> +    if (loadvm && preconfig_requested) {
>>           error_report("'preconfig' and 'loadvm' options are "
>>                        "mutually exclusive");
>>           exit(EXIT_FAILURE);
>>       }
>> -    if (incoming && !preconfig_exit_requested) {
>> +    if (incoming && preconfig_requested) {
>>           error_report("'preconfig' and 'incoming' options are "
>>                        "mutually exclusive");
>>           exit(EXIT_FAILURE);
>> @@ -3381,6 +3382,28 @@ static void qemu_init_subsystems(void)
>>       socket_init();
>>   }
>>   
>> +static void qemu_init_displays(void)
>> +{
>> +    DisplayState *ds;
>> +
>> +    /* init local displays */
>> +    ds = init_displaystate();
>> +    qemu_display_init(ds, &dpy);
>> +
>> +    /* must be after terminal init, SDL library changes signal handlers */
>> +    os_setup_signal_handling();
>> +
>> +    /* init remote displays */
>> +#ifdef CONFIG_VNC
>> +    qemu_opts_foreach(qemu_find_opts("vnc"),
>> +                      vnc_init_func, NULL, &error_fatal);
>> +#endif
>> +
>> +    if (using_spice) {
>> +        qemu_spice.display_init();
>> +    }
>> +}
>> +
>>   /*
>>    * Called after leaving preconfig state.  From here on runstate is
>>    * RUN_STATE_PRELAUNCH or RUN_STATE_INMIGRATE.
>> @@ -3449,8 +3472,6 @@ static void qemu_create_cli_devices(void)
>>   
>>   static void qemu_machine_creation_done(void)
>>   {
>> -    DisplayState *ds;
>> -
>>       cpu_synchronize_all_post_init();
>>   
>>       /* Did we create any drives that we failed to create a device for? */
>> @@ -3473,23 +3494,6 @@ static void qemu_machine_creation_done(void)
>>           qemu_register_reset(restore_boot_order, g_strdup(boot_order));
>>       }
>>   
>> -    /* init local displays */
>> -    ds = init_displaystate();
>> -    qemu_display_init(ds, &dpy);
>> -
>> -    /* must be after terminal init, SDL library changes signal handlers */
>> -    os_setup_signal_handling();
>> -
>> -    /* init remote displays */
>> -#ifdef CONFIG_VNC
>> -    qemu_opts_foreach(qemu_find_opts("vnc"),
>> -                      vnc_init_func, NULL, &error_fatal);
>> -#endif
>> -
>> -    if (using_spice) {
>> -        qemu_spice.display_init();
>> -    }
>> -
>>       if (foreach_device_config(DEV_GDB, gdbserver_start) < 0) {
>>           exit(1);
>>       }
>> @@ -4094,6 +4098,7 @@ void qemu_init(int argc, char **argv, char **envp)
>>                   break;
>>               case QEMU_OPTION_preconfig:
>>                   preconfig_exit_requested = false;
>> +                preconfig_requested = true;
>>                   break;
>>               case QEMU_OPTION_enable_kvm:
>>                   olist = qemu_find_opts("machine");
>> @@ -4515,11 +4520,20 @@ void qemu_init(int argc, char **argv, char **envp)
>>       qemu_resolve_machine_memdev();
>>       parse_numa_opts(current_machine);
>>   
>> +    if (preconfig_requested) {
>> +        qemu_init_displays();
>> +    }
>> +
>>       /* do monitor/qmp handling at preconfig state if requested */
>>       qemu_main_loop();
>> -
>>       qemu_finish_machine_init();
>> +
>>       qemu_create_cli_devices();
>> +
>> +    /* initialize displays after all errors have been reported */
>> +    if (!preconfig_requested) {
>> +        qemu_init_displays();
>> +    }
>>       qemu_machine_creation_done();
>>   
>>       if (loadvm) {
> 


