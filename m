Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E1DE6FD87C
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 09:47:15 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pweWe-0007xU-6V; Wed, 10 May 2023 03:46:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pweWb-0007wy-MW
 for qemu-devel@nongnu.org; Wed, 10 May 2023 03:46:14 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pweWX-0000HI-0W
 for qemu-devel@nongnu.org; Wed, 10 May 2023 03:46:13 -0400
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-307664010fdso6179881f8f.0
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 00:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683704767; x=1686296767;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9Eetz7NR0N0qOVbpWAdyyZlYaKRDSEy/hOCtEAOT1eE=;
 b=vHW8YB24OVVkEMFIo3Zq8yKWEGQuV9r8r+ug8VjRJJAAq28zYT33UEP1OmyNAWAn6P
 f9fIkCx1gdcCJ1kdSmQ5lg3sgIWrggpt+053oLlYKvY7PT9p80+8d3O0t+oQbkwZKaXy
 p+V7JTWMEBdeMKmEtc62mLBxsLJHcnNxy+8aJIGDOx6dpuFbFcPsNCu7ffI4j9brFPZ6
 BJCxCCeGe18BXPH40GMbwwtyxSdOpKzpMecs38dAoRK0HHXKUFU+24XsVPPXoTEM+lck
 zYuNTt/HxZyJYEwKFQ7nI5NfYzrSarYYhruDHXqqLaP1Qh6tEQ+uHXEK4qtTNCo/LFuY
 0RsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683704767; x=1686296767;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9Eetz7NR0N0qOVbpWAdyyZlYaKRDSEy/hOCtEAOT1eE=;
 b=fAiKRSkNeGUYvhKd9ZghTHdEdY9qdwh8UAlXtC/skNOctrAGXtVUGTwGS576kFO5xm
 xJS1z26hvwoKcGnZTk38QPa7eQoL8Mxl1BzZLrvXZ1KM9VSFbYZI8DZ5ziNyU+ce+F6p
 je1wZr69cUFQVYKVjXSKAr37DMsak7pn/MicpSNVP1DCWu0k9NRxCoY7SHyAVxLDPbew
 Gu2aewQy3nq69v4NMjGbutHFKSLWF02sGOrtIYXywyxTDQeVjeVjD9lhpc83BOB/IzsV
 Nfxx0cWYgizWprKeIJmo+penG2iID04yeOMjOdcr/3m3SHtmtxohi9jd7OIeL4vCOORu
 teaw==
X-Gm-Message-State: AC+VfDwpVGYskXXaoCz5+9+AlNC08UDhTkBUAzHqL5Oyfq3ZGNi/DMtJ
 gQiMRSJ0Bf8jpCh3SvnZCVM9kA==
X-Google-Smtp-Source: ACHHUZ6pZ2MFBMPOJmTF21hyES6+wtym1MTJpGQ3cypidsopK23VlG02SOswIdYINbKmxldFlttyvA==
X-Received: by 2002:adf:f946:0:b0:306:32fa:6750 with SMTP id
 q6-20020adff946000000b0030632fa6750mr10401295wrr.33.1683704767116; 
 Wed, 10 May 2023 00:46:07 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.211.62])
 by smtp.gmail.com with ESMTPSA id
 z10-20020a05600c220a00b003f17122587bsm22164353wml.36.2023.05.10.00.46.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 May 2023 00:46:06 -0700 (PDT)
Message-ID: <06247db2-f76a-e8fd-4a8e-84a60cfab3f2@linaro.org>
Date: Wed, 10 May 2023 09:46:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.1
Subject: Re: [PATCH v3 06/10] trace: remove code that depends on setting vcpu
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Michael Roth <michael.roth@amd.com>, Eric Blake <eblake@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Greg Kurz <groug@kaod.org>,
 Eduardo Habkost <eduardo@habkost.net>, Yanan Wang <wangyanan55@huawei.com>,
 Kyle Evans <kevans@freebsd.org>, Warner Losh <imp@bsdimp.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Riku Voipio <riku.voipio@iki.fi>
References: <20230505155336.137393-1-alex.bennee@linaro.org>
 <20230505155336.137393-7-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230505155336.137393-7-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.421,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 5/5/23 17:53, Alex Bennée wrote:
> Now we no longer have any events that are for vcpus we can start
> excising the code from the trace control. As the vcpu parameter is
> encoded as part of QMP we just stub out the has_vcpu/vcpu parameters
> rather than alter the API.
> 
> Message-Id: <20230420150009.1675181-7-alex.bennee@linaro.org>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20230503091756.1453057-7-alex.bennee@linaro.org>
> ---
>   trace/control-internal.h |  10 ----
>   trace/control-vcpu.h     |  16 ------
>   trace/control.h          |  48 -----------------
>   hw/core/cpu-common.c     |   2 -
>   stubs/trace-control.c    |  13 -----
>   trace/control-target.c   | 110 ++++-----------------------------------
>   trace/control.c          |  16 ------
>   trace/qmp.c              |  74 +++-----------------------
>   trace/trace-hmp-cmds.c   |  17 +-----
>   9 files changed, 19 insertions(+), 287 deletions(-)


> diff --git a/trace/trace-hmp-cmds.c b/trace/trace-hmp-cmds.c
> index 792876c34a..1d07672cb2 100644
> --- a/trace/trace-hmp-cmds.c
> +++ b/trace/trace-hmp-cmds.c
> @@ -37,16 +37,9 @@ void hmp_trace_event(Monitor *mon, const QDict *qdict)
>   {
>       const char *tp_name = qdict_get_str(qdict, "name");
>       bool new_state = qdict_get_bool(qdict, "option");
> -    bool has_vcpu = qdict_haskey(qdict, "vcpu");
> -    int vcpu = qdict_get_try_int(qdict, "vcpu", 0);
>       Error *local_err = NULL;
>   
> -    if (vcpu < 0) {
> -        monitor_printf(mon, "argument vcpu must be positive");
> -        return;
> -    }
> -
> -    qmp_trace_event_set_state(tp_name, new_state, true, true, has_vcpu, vcpu, &local_err);
> +    qmp_trace_event_set_state(tp_name, new_state, true, true, false, 0, &local_err);
>       if (local_err) {
>           error_report_err(local_err);
>       }
> @@ -80,8 +73,6 @@ void hmp_trace_file(Monitor *mon, const QDict *qdict)
>   void hmp_info_trace_events(Monitor *mon, const QDict *qdict)
>   {
>       const char *name = qdict_get_try_str(qdict, "name");
> -    bool has_vcpu = qdict_haskey(qdict, "vcpu");
> -    int vcpu = qdict_get_try_int(qdict, "vcpu", 0);
>       TraceEventInfoList *events;
>       TraceEventInfoList *elem;
>       Error *local_err = NULL;
> @@ -89,12 +80,8 @@ void hmp_info_trace_events(Monitor *mon, const QDict *qdict)
>       if (name == NULL) {
>           name = "*";
>       }
> -    if (vcpu < 0) {
> -        monitor_printf(mon, "argument vcpu must be positive");
> -        return;
> -    }
>   
> -    events = qmp_trace_event_get_state(name, has_vcpu, vcpu, &local_err);
> +    events = qmp_trace_event_get_state(name, false, 0, &local_err);
>       if (local_err) {
>           error_report_err(local_err);
>           return;

We can simplify further by removing 'bool has_vcpu, int64_t vcpu' from
qmp_trace_event_set_state/qmp_trace_event_get_state, which are now
always false/0.

