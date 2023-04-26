Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF486EF6F6
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 16:59:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prgah-0001xG-LI; Wed, 26 Apr 2023 10:57:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1prgaf-0001wn-G0
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 10:57:53 -0400
Received: from forwardcorp1b.mail.yandex.net ([178.154.239.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1prgac-0005lM-F5
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 10:57:53 -0400
Received: from mail-nwsmtp-smtp-corp-main-62.myt.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-62.myt.yp-c.yandex.net
 [IPv6:2a02:6b8:c00:2582:0:640:9a17:0])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id 7B8C060232;
 Wed, 26 Apr 2023 17:57:38 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:6525::1:35] (unknown
 [2a02:6b8:b081:6525::1:35])
 by mail-nwsmtp-smtp-corp-main-62.myt.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id bvIMe10OfqM0-2e1QJWft; Wed, 26 Apr 2023 17:57:37 +0300
Precedence: bulk
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1682521057; bh=/I3g5/ZNBs0drVB1SKcIDZTSAofTTDiIkWcPq2F3DDQ=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=CJlkMDVHkB+mh/RofjIMcTzG05lvU1NRe93jQnf4sxOFxrKldlTK1b/MrVZZQeifY
 72wSTj7S5i0EhQ9Na65ijPeaynWYBB4trbsopeIKi+KzsaceEAr7IGvlw8+GDT3Q9S
 SebKeo0FpKbKx92+G7fPUd/03pEOoIqi9aV3HYEU=
Authentication-Results: mail-nwsmtp-smtp-corp-main-62.myt.yp-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <baad13d4-e04d-f7f1-119a-728092397c0c@yandex-team.ru>
Date: Wed, 26 Apr 2023 17:57:37 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v5] qapi/qmp: Add timestamps to qmp command responses
Content-Language: en-US
To: Denis Plotnikov <den-plotnikov@yandex-team.ru>, qemu-devel@nongnu.org
Cc: yc-core@yandex-team.ru, armbru@redhat.com, berrange@redhat.com,
 marcandre.lureau@gmail.com
References: <20230426140839.72223-1-den-plotnikov@yandex-team.ru>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20230426140839.72223-1-den-plotnikov@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=178.154.239.136;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1b.mail.yandex.net
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 26.04.23 17:08, Denis Plotnikov wrote:
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
> Suggested-by: Andrey Ryabinin<arbn@yandex-team.ru>
> Signed-off-by: Denis Plotnikov<den-plotnikov@yandex-team.ru>
> Reviewed-by: Daniel P. Berrangé<berrange@redhat.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

-- 
Best regards,
Vladimir


