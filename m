Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB645EA6DE
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 15:11:29 +0200 (CEST)
Received: from localhost ([::1]:52216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocntQ-0005xK-HN
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 09:11:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1ocnop-0001yD-EN
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 09:06:53 -0400
Received: from forwardcorp1p.mail.yandex.net
 ([2a02:6b8:0:1472:2741:0:8b6:217]:41650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1ocnol-0000rZ-IB
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 09:06:42 -0400
Received: from sas1-c73b4b4f4b95.qloud-c.yandex.net
 (sas1-c73b4b4f4b95.qloud-c.yandex.net
 [IPv6:2a02:6b8:c08:12a9:0:640:c73b:4b4f])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id C4F342E125C;
 Mon, 26 Sep 2022 16:06:30 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b683::1:39] (unknown
 [2a02:6b8:b081:b683::1:39])
 by sas1-c73b4b4f4b95.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 xVrnihyXKR-6QOSI22S; Mon, 26 Sep 2022 16:06:29 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Precedence: bulk
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1664197589; bh=GTyw89gUN5JoUzNN3eP72ruyhj+FawCFj6WBJS/FABU=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=Auj+SxkPYAKtTkkptRWrsE3VFTA6eInx3DLw9FknhPiR+0hgI5cX54PqF5Jprsuwu
 5Rjwmw7SvUDnzjqpXb19hic8ovvHVdDKgO3nXRhk8+6bh8cz13oRtUuFPQgYRqP+OQ
 6P2l++0vvwsETJmNsH+Eu2ryLiDhlNqnTp/Dv/lo=
Authentication-Results: sas1-c73b4b4f4b95.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <79a0c55c-3eea-7b47-a573-4b9c64ddcc93@yandex-team.ru>
Date: Mon, 26 Sep 2022 16:06:26 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [patch v0] qapi/qmp: Add timestamps to qmp command responses.
Content-Language: en-US
To: Denis Plotnikov <den-plotnikov@yandex-team.ru>, qemu-devel@nongnu.org
Cc: yc-core@yandex-team.ru, armbru@redhat.com, michael.roth@amd.com
References: <20220926095940.283094-1-den-plotnikov@yandex-team.ru>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20220926095940.283094-1-den-plotnikov@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a02:6b8:0:1472:2741:0:8b6:217;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1p.mail.yandex.net
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.319,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/26/22 12:59, Denis Plotnikov wrote:
> Add "start" & "end" timestamps to qmp command responses.
> It's disabled by default, but can be enabled with 'timestamp=on'
> monitor's parameter, e.g.:
>      -chardev  socket,id=mon1,path=/tmp/qmp.socket,server=on,wait=off
>      -mon chardev=mon1,mode=control,timestamp=on
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
> The responce of the qmp command contains the start & end time of
> the qmp command processing.
> 
> These times may be helpful for the management layer in understanding of
> the actual timeline of a qmp command processing.
> 
> Suggested-by: Andrey Ryabinin <arbn@yandex-team.ru>
> Signed-off-by: Denis Plotnikov <den-plotnikov@yandex-team.ru>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

> ---
>   include/monitor/monitor.h   |  2 +-
>   include/qapi/qmp/dispatch.h |  2 +-
>   monitor/monitor-internal.h  |  1 +
>   monitor/monitor.c           |  9 ++++++++-
>   monitor/qmp.c               |  5 +++--
>   qapi/control.json           |  3 +++
>   qapi/qmp-dispatch.c         | 28 +++++++++++++++++++++++++++-

[..]

>   QDict *qmp_dispatch(const QmpCommandList *cmds, QObject *request,
> -                    bool allow_oob, Monitor *cur_mon)
> +                    bool allow_oob, bool timestamp, Monitor *cur_mon)
>   {
>       Error *err = NULL;
>       bool oob;
> @@ -146,6 +162,11 @@ QDict *qmp_dispatch(const QmpCommandList *cmds, QObject *request,
>       QObject *id;
>       QObject *ret = NULL;
>       QDict *rsp = NULL;
> +    uint64_t ts_start = -1;
> +
> +    if (timestamp) {
> +        ts_start = g_get_real_time();
> +    }

Maybe, better start timing in handle_qmp_command(), to inlude waiting in the mon->qmp_requests queue.

>   
>       dict = qobject_to(QDict, request);
>       if (!dict) {
> @@ -270,5 +291,10 @@ out:
>           qdict_put_obj(rsp, "id", qobject_ref(id));
>       }
>   
> +    if (timestamp) {
> +        uint64_t ts_end = g_get_real_time();
> +        add_timestamps(rsp, ts_start, ts_end);
> +    }
> +
>       return rsp;
>   }


-- 
Best regards,
Vladimir

