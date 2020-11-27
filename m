Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B892C5F8D
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 06:21:43 +0100 (CET)
Received: from localhost ([::1]:42394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiWCU-00079m-1M
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 00:21:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kiWAr-0006Ri-TQ
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 00:20:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:24098)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kiWAp-00069W-UR
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 00:20:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606454398;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I7Hy7piC0mpSGruXrkSx/AVzvqWOebgXAtqLWGA/tjE=;
 b=cPiFPnWPaHQDpYaDLSzcVofu9Nurhuh2jBv+ZSgxQvDp18SC5JWd3q/aMmX5z+ecvgvJtc
 2CnMiA1WyQadFUgfrBrEtF2fqstJsij8AIuxvmNLeAeTIYll2LV6Ufu0IBtHAsyUNI4F4T
 PO0zc2I7vcLzYKAHVr8Q8mI6lNl1IZE=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-470-kb77YV1ZPhmSf81nPcS8qw-1; Fri, 27 Nov 2020 00:19:55 -0500
X-MC-Unique: kb77YV1ZPhmSf81nPcS8qw-1
Received: by mail-ed1-f69.google.com with SMTP id y11so1994295edv.6
 for <qemu-devel@nongnu.org>; Thu, 26 Nov 2020 21:19:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=I7Hy7piC0mpSGruXrkSx/AVzvqWOebgXAtqLWGA/tjE=;
 b=Q/3A4mkC4ggcgbAFJfBCPDO1C7P/RH0ojnKkJc+RIA9+D++jwYuColXhiqFooEhpWZ
 PPwNArV0I4XdiRs0sd6x10Kq5zaFbP3Kw086XxHApt8+IYtqfbSv0wxN9um4c5LAGzSb
 0zUZRy5OFmxDSzrjk+kI28FaDFD52L4ecDanKJrOK8qnI3sEz3eUqni8Qesxx2TWIqWv
 4vtnQNxoIrgEYlb+AdcPQvu6YhUbKBCE05gCtmElmaFX/wy0CMkLhBvKR7VMY9QyT5Ps
 kdJ9j/BpNhWzBxndmAkIuRS77SKJ/AulBLoT1TZXCfgu0gPxmNMlGtultttgwSQr/Vrr
 yGDw==
X-Gm-Message-State: AOAM532gZRuZDPAOb5mOwZ2aLHufESR7vRFJeFGX3MWiyvwXrhsRdUcU
 8QgJLqu4bB1SnTQ1YwmXoBBQeMh4TtcrX3jBpGjbDiiDXF78eGBpqCtBTk/OYSXpo7nYqpC7QVA
 s6KJfCvlY2Iy/RVaHQdcdN1UCjioL+k/0dZB7hUDuo2dz/Dk+BMqKY6I6yb6aJ3SOVWc=
X-Received: by 2002:a17:906:5fd6:: with SMTP id
 k22mr5821010ejv.333.1606454393828; 
 Thu, 26 Nov 2020 21:19:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzKRvwM/Jmz9Za+ILngeeSl9JkWLwYvdYuNuVrt4q1CsUcd3RkSh+s2e48N9CznHOQ02DlloQ==
X-Received: by 2002:a17:906:5fd6:: with SMTP id
 k22mr5820993ejv.333.1606454393487; 
 Thu, 26 Nov 2020 21:19:53 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id f13sm4152344ejf.42.2020.11.26.21.19.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Nov 2020 21:19:52 -0800 (PST)
To: Igor Mammedov <imammedo@redhat.com>
References: <20201123141435.2726558-1-pbonzini@redhat.com>
 <20201123141435.2726558-27-pbonzini@redhat.com>
 <20201126195551.7b761db9@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 26/36] remove preconfig state
Message-ID: <f356049d-36e1-9b63-b50d-0a9ca2d1cb96@redhat.com>
Date: Fri, 27 Nov 2020 06:19:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201126195551.7b761db9@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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

On 26/11/20 19:55, Igor Mammedov wrote:
> On Mon, 23 Nov 2020 09:14:25 -0500
> Paolo Bonzini <pbonzini@redhat.com> wrote:
> 
>> The preconfig state is only used if -incoming is not specified, which
>> makes the RunState state machine more tricky than it need be.  However
>> there is already an equivalent condition which works even with -incoming,
>> namely qdev_hotplug.  Use it instead of a separate runstate.
>>
>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>> ---
>>   hw/core/machine-qmp-cmds.c    |  5 ++---
>>   include/qapi/qmp/dispatch.h   |  1 +
>>   monitor/hmp.c                 |  7 ++++---
>>   monitor/qmp-cmds.c            |  5 ++---
>>   qapi/qmp-dispatch.c           |  5 +----
>>   qapi/run-state.json           |  5 +----
>>   softmmu/qdev-monitor.c        | 12 ++++++++++++
>>   softmmu/vl.c                  | 13 ++-----------
>>   stubs/meson.build             |  1 +
>>   stubs/qmp-command-available.c |  7 +++++++
>>   tests/qtest/qmp-test.c        |  2 +-
>>   11 files changed, 34 insertions(+), 29 deletions(-)
>>   create mode 100644 stubs/qmp-command-available.c
>>
>> diff --git a/hw/core/machine-qmp-cmds.c b/hw/core/machine-qmp-cmds.c
>> index 5362c80a18..cb9387c5f5 100644
>> --- a/hw/core/machine-qmp-cmds.c
>> +++ b/hw/core/machine-qmp-cmds.c
>> @@ -286,9 +286,8 @@ HotpluggableCPUList *qmp_query_hotpluggable_cpus(Error **errp)
>>   
>>   void qmp_set_numa_node(NumaOptions *cmd, Error **errp)
>>   {
>> -    if (!runstate_check(RUN_STATE_PRECONFIG)) {
>> -        error_setg(errp, "The command is permitted only in '%s' state",
>> -                   RunState_str(RUN_STATE_PRECONFIG));
>> +    if (qdev_hotplug) {
> 
> that would work only as long as qemu_init_board() hasn't been called,
> and fall apart as soon as we permit creating cold-pluged devices
> (qemu_create_cli_devices()) at preconfig stage.
> 
> for qmp_set_numa_node() the better fit would something like
>    if(is_board_created)
>       error_out
> so it won't break silently when we start extending list of
> commands allowed at preconfig time.
> 
>> +         error_setg(errp, "The command is permitted only before the machine has been created");
>>            return;
>>       }

I don't understand...  qdev_hotplug is a bad name for is_board_created, 
it is set by qdev_machine_creation_done which is called after preconfig 
is left.  As of this patch that happens after the early 
qemu_main_loop(); the next patch moves it to qmp_x_exit_preconfig.

Cold-plugged devices would (by definition) be created while qdev_hotplug 
is false.  But before we get there, I will have replaced the two states 
permitted by qdev_hotplug with five separate phases (PHASE_NO_MACHINE, 
PHASE_MACHINE_CREATED, PHASE_ACCEL_CREATED, PHASE_MACHINE_INITIALIZED, 
PHASE_MACHINE_READY) to clarify the QMP command implementation and to 
assert that various functions are called in the right phase.

Thanks,

Paolo


