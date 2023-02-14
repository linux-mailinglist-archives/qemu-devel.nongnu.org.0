Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EBD9696DDA
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 20:25:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pS0vy-0007rq-Sj; Tue, 14 Feb 2023 14:25:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pS0va-0007Wf-Ud
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 14:25:27 -0500
Received: from forwardcorp1c.mail.yandex.net
 ([2a02:6b8:c03:500:1:45:d181:df01])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pS0vW-0005QU-19
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 14:25:21 -0500
Received: from myt5-8800bd68420f.qloud-c.yandex.net
 (myt5-8800bd68420f.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:4615:0:640:8800:bd68])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id BFCDC6105F;
 Tue, 14 Feb 2023 22:25:06 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b433::1:3c] (unknown
 [2a02:6b8:b081:b433::1:3c])
 by myt5-8800bd68420f.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 5Ppsc20RZeA1-jBcYTXWH; Tue, 14 Feb 2023 22:25:05 +0300
Precedence: bulk
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1676402705; bh=+nNdq4fdpY5/XLdG4OJveuIpbWj221JrvhGfJNStE3Q=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=CB+fjx5k/RamjvgJTph2MGL4g6WHNHGRMz+GRoT+nOU4V5kFqpRHGYEHqv+sJz7Ux
 CS8o1L/wz5jTINSYuFPYxCOJpynxfB7AHZbzj+P6wAjJtgiXopRRx5Je942foD7So5
 NZgAQ9vPsLXG9mDtY+SpVQCN/AOnNmkUxYEoJuiQ=
Authentication-Results: myt5-8800bd68420f.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <eb980f8f-77f1-e267-f64c-ca75488b7ac7@yandex-team.ru>
Date: Tue, 14 Feb 2023 22:25:05 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v4] qapi/qmp: Add timestamps to qmp command responses
Content-Language: en-US
To: Denis Plotnikov <den-plotnikov@yandex-team.ru>, qemu-devel@nongnu.org
Cc: yc-core@yandex-team.ru, armbru@redhat.com, michael.roth@amd.com,
 berrange@redhat.com, marcandre.lureau@gmail.com
References: <20221101153728.101085-1-den-plotnikov@yandex-team.ru>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20221101153728.101085-1-den-plotnikov@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:c03:500:1:45:d181:df01;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1c.mail.yandex.net
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.35,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 01.11.22 18:37, Denis Plotnikov wrote:
> Add "start" & "end" time values to QMP command responses.
> 
> These time values are added to let the qemu management layer get the exact
> command execution time without any other time variance which might be brought
> by other parts of management layer or qemu internals.
> This helps to look for problems poactively from the management layer side.
> The management layer would be able to detect problem cases by calculating
> QMP command execution time:
> 1. execution_time_from_mgmt_perspective -
>         execution_time_of_qmp_command > some_threshold
>     This detects problems with management layer or internal qemu QMP command
>     dispatching
> 2. current_qmp_command_execution_time > avg_qmp_command_execution_time
>     This detects that a certain QMP command starts to execute longer than
>     usual
> In both these cases more thorough investigation of the root cases should be
> done by using some qemu tracepoints depending on particular QMP command under
> investigation or by other means. The timestamps help to avoid excessive log
> output when qemu tracepoints are used to address similar cases.
> 
> Example of result:
> 
>      ./qemu/scripts/qmp/qmp-shell /tmp/qmp.socket
> 
>      (QEMU) query-status
>      {"end": {"seconds": 1650367305, "microseconds": 831032},
>       "start": {"seconds": 1650367305, "microseconds": 831012},
>       "return": {"status": "running", "singlestep": false, "running": true}}
> 
> The response of the QMP command contains the start & end time of
> the QMP command processing.
> 
> Also, "start" & "end" timestaps are added to qemu guest agent responses as
> qemu-ga shares the same code for request dispatching.
> 
> Suggested-by: Andrey Ryabinin <arbn@yandex-team.ru>
> Signed-off-by: Denis Plotnikov <den-plotnikov@yandex-team.ru>
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

[..]

> diff --git a/docs/interop/qmp-spec.txt b/docs/interop/qmp-spec.txt
> index b0e8351d5b261..0dd8e716c02f0 100644
> --- a/docs/interop/qmp-spec.txt
> +++ b/docs/interop/qmp-spec.txt
> @@ -158,7 +158,9 @@ responses that have an unknown "id" field.
>   
>   The format of a success response is:
>   
> -{ "return": json-value, "id": json-value }
> +{ "return": json-value, "id": json-value,
> +  "start": {"seconds": json-value, "microseconds": json-value},
> +  "end": {"seconds": json-value, "microseconds": json-value} }

That should be "json-number", like in "2.5 Asynchronous events" section.

with this fixed:
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

[...]

> --- a/qapi/qmp-dispatch.c
> +++ b/qapi/qmp-dispatch.c
> @@ -130,6 +130,22 @@ static void do_qmp_dispatch_bh(void *opaque)
>       aio_co_wake(data->co);
>   }
>   
> +static void add_timestamps(QDict *qdict, int64_t start_ms, int64_t end_ms)
> +{
> +    QDict *start_dict, *end_dict;
> +
> +    start_dict = qdict_new();
> +    qdict_put_int(start_dict, "seconds", start_ms / G_USEC_PER_SEC);
> +    qdict_put_int(start_dict, "microseconds", start_ms % G_USEC_PER_SEC);
> +
> +    end_dict = qdict_new();
> +    qdict_put_int(end_dict, "seconds", end_ms / G_USEC_PER_SEC);
> +    qdict_put_int(end_dict, "microseconds", end_ms % G_USEC_PER_SEC);
> +
> +    qdict_put_obj(qdict, "start", QOBJECT(start_dict));
> +    qdict_put_obj(qdict, "end", QOBJECT(end_dict));
> +}

I think, we should split a single qdict_new_timestamp() out of this and reuse it also in qmp_event_build_dict() in qapi/qmp-event.c, to not have different paths for the same thing.


-- 
Best regards,
Vladimir


