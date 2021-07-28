Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F0273D86EF
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Jul 2021 06:57:22 +0200 (CEST)
Received: from localhost ([::1]:33404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8bdA-0002Q4-Mf
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 00:57:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1m8bbs-0001UK-5w
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 00:56:00 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:2451)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1m8bbp-0003E8-4c
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 00:55:59 -0400
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4GZLql1Q1szZtm0;
 Wed, 28 Jul 2021 12:52:19 +0800 (CST)
Received: from dggpeml500005.china.huawei.com (7.185.36.59) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 28 Jul 2021 12:55:45 +0800
Received: from [10.174.186.51] (10.174.186.51) by
 dggpeml500005.china.huawei.com (7.185.36.59) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 28 Jul 2021 12:55:44 +0800
From: Zheng Chuan <zhengchuan@huawei.com>
Subject: Re: [PATCH V5 04/25] cpr: HMP interfaces for reboot
To: Steve Sistare <steven.sistare@oracle.com>, <qemu-devel@nongnu.org>
References: <1625678434-240960-1-git-send-email-steven.sistare@oracle.com>
 <1625678434-240960-5-git-send-email-steven.sistare@oracle.com>
Message-ID: <fbf9dbc6-e093-6949-0ad9-f301c431292e@huawei.com>
Date: Wed, 28 Jul 2021 12:55:44 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <1625678434-240960-5-git-send-email-steven.sistare@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.186.51]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpeml500005.china.huawei.com (7.185.36.59)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=zhengchuan@huawei.com; helo=szxga01-in.huawei.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.438,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Jason Zeng <jason.zeng@linux.intel.com>,
 Juan Quintela <quintela@redhat.com>, Eric
 Blake <eblake@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Alex
 Williamson <alex.williamson@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi

On 2021/7/8 1:20, Steve Sistare wrote:
> cprsave <file> <mode>
>   Call cprsave().
>   Arguments:
>     file : save vmstate to this file name
>     mode: must be "reboot"
> 
> cprload <file>
>   Call cprload().
>   Arguments:
>     file : load vmstate from this file name
> 
> cprinfo
>   Print to stdout a space-delimited list of modes supported by cprsave.
>   Arguments: none
> 
> Signed-off-by: Mark Kanda <mark.kanda@oracle.com>
> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
> ---
>  hmp-commands.hx       | 44 ++++++++++++++++++++++++++++++++++++++++++++
>  include/monitor/hmp.h |  3 +++
>  monitor/hmp-cmds.c    | 48 ++++++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 95 insertions(+)
> 
> diff --git a/hmp-commands.hx b/hmp-commands.hx
> index 8e45bce..11827ae 100644
> --- a/hmp-commands.hx
> +++ b/hmp-commands.hx
> @@ -351,6 +351,50 @@ SRST
>  ERST
>  
>      {
> +        .name       = "cprinfo",
> +        .args_type  = "",
> +        .params     = "",
> +        .help       = "return list of modes supported by cprsave",
> +        .cmd        = hmp_cprinfo,
> +    },
> +
> +SRST
> +``cprinfo``
> +Return a space-delimited list of modes supported by cprsave.
> +ERST
> +
> +    {
> +        .name       = "cprsave",
> +        .args_type  = "file:s,mode:s",
> +        .params     = "file 'reboot'",
> +        .help       = "create a checkpoint of the VM in file",
> +        .cmd        = hmp_cprsave,
> +    },
> +
> +SRST
> +``cprsave`` *file* *mode*
> +Pause the VCPUs,
> +create a checkpoint of the whole virtual machine, and save it in *file*.
> +If *mode* is 'reboot', the checkpoint remains valid after a host kexec
> +reboot, and guest ram must be backed by persistant shared memory.  To

Should be persistent.

> +resume from the checkpoint, issue the quit command, reboot the system,
> +and issue the cprload command.
> +ERST
> +
> +    {
> +        .name       = "cprload",
> +        .args_type  = "file:s",
> +        .params     = "file",
> +        .help       = "load VM checkpoint from file",
> +        .cmd        = hmp_cprload,
> +    },
> +
> +SRST
> +``cprload`` *file*
> +Load a virtual machine from checkpoint file *file* and continue VCPUs.
> +ERST
> +
> +    {
>          .name       = "delvm",
>          .args_type  = "name:s",
>          .params     = "tag",
> diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h
> index 3baa105..98bb775 100644
> --- a/include/monitor/hmp.h
> +++ b/include/monitor/hmp.h
> @@ -58,6 +58,9 @@ void hmp_balloon(Monitor *mon, const QDict *qdict);
>  void hmp_loadvm(Monitor *mon, const QDict *qdict);
>  void hmp_savevm(Monitor *mon, const QDict *qdict);
>  void hmp_delvm(Monitor *mon, const QDict *qdict);
> +void hmp_cprinfo(Monitor *mon, const QDict *qdict);
> +void hmp_cprsave(Monitor *mon, const QDict *qdict);
> +void hmp_cprload(Monitor *mon, const QDict *qdict);
>  void hmp_migrate_cancel(Monitor *mon, const QDict *qdict);
>  void hmp_migrate_continue(Monitor *mon, const QDict *qdict);
>  void hmp_migrate_incoming(Monitor *mon, const QDict *qdict);
> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
> index 0942027..8e80581 100644
> --- a/monitor/hmp-cmds.c
> +++ b/monitor/hmp-cmds.c
> @@ -33,6 +33,7 @@
>  #include "qapi/qapi-commands-block.h"
>  #include "qapi/qapi-commands-char.h"
>  #include "qapi/qapi-commands-control.h"
> +#include "qapi/qapi-commands-cpr.h"
>  #include "qapi/qapi-commands-machine.h"
>  #include "qapi/qapi-commands-migration.h"
>  #include "qapi/qapi-commands-misc.h"
> @@ -1177,6 +1178,53 @@ void hmp_announce_self(Monitor *mon, const QDict *qdict)
>      qapi_free_AnnounceParameters(params);
>  }
>  
> +void hmp_cprinfo(Monitor *mon, const QDict *qdict)
> +{
> +    Error *err = NULL;
> +    CprInfo *cprinfo;
> +    CprModeList *mode;
> +
> +    cprinfo = qmp_cprinfo(&err);
> +    if (err) {
> +        goto out;
> +    }
> +
> +    for (mode = cprinfo->modes; mode; mode = mode->next) {
> +        monitor_printf(mon, "%s ", CprMode_str(mode->value));
> +    }
> +
> +out:
> +    hmp_handle_error(mon, err);
> +    qapi_free_CprInfo(cprinfo);
> +}
> +
> +void hmp_cprsave(Monitor *mon, const QDict *qdict)
> +{
> +    Error *err = NULL;
> +    const char *mode;
> +    int val;
> +
> +    mode = qdict_get_try_str(qdict, "mode");
> +    val = qapi_enum_parse(&CprMode_lookup, mode, -1, &err);
> +
> +    if (val == -1) {
> +        goto out;
> +    }
> +
> +    qmp_cprsave(qdict_get_try_str(qdict, "file"), val, &err);
> +
> +out:
> +    hmp_handle_error(mon, err);
> +}
> +
> +void hmp_cprload(Monitor *mon, const QDict *qdict)
> +{
> +    Error *err = NULL;
> +
> +    qmp_cprload(qdict_get_try_str(qdict, "file"), &err);
> +    hmp_handle_error(mon, err);
> +}
> +
>  void hmp_migrate_cancel(Monitor *mon, const QDict *qdict)
>  {
>      qmp_migrate_cancel(NULL);
> 

-- 
Regards.
Chuan

