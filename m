Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D10593D86F4
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Jul 2021 06:57:53 +0200 (CEST)
Received: from localhost ([::1]:35516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8bdg-0003oq-TJ
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 00:57:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1m8bc6-0001qA-PI
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 00:56:14 -0400
Received: from szxga03-in.huawei.com ([45.249.212.189]:2199)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1m8bc4-0003Vv-F5
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 00:56:14 -0400
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4GZLpj4vGxz7yvl;
 Wed, 28 Jul 2021 12:51:25 +0800 (CST)
Received: from dggpeml500005.china.huawei.com (7.185.36.59) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 28 Jul 2021 12:56:09 +0800
Received: from [10.174.186.51] (10.174.186.51) by
 dggpeml500005.china.huawei.com (7.185.36.59) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 28 Jul 2021 12:56:08 +0800
From: Zheng Chuan <zhengchuan@huawei.com>
Subject: Re: [PATCH V5 13/25] cpr: HMP interfaces for restart
To: Steve Sistare <steven.sistare@oracle.com>, <qemu-devel@nongnu.org>
References: <1625678434-240960-1-git-send-email-steven.sistare@oracle.com>
 <1625678434-240960-14-git-send-email-steven.sistare@oracle.com>
Message-ID: <71cdf1c2-fa45-e693-b76b-91e450bf79a2@huawei.com>
Date: Wed, 28 Jul 2021 12:56:08 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <1625678434-240960-14-git-send-email-steven.sistare@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.186.51]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpeml500005.china.huawei.com (7.185.36.59)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.189;
 envelope-from=zhengchuan@huawei.com; helo=szxga03-in.huawei.com
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
>   mode may be "restart"
> 
> cprexec <command>
>   Call cprexec().
>   Arguments:
>     command : command line to execute, with space-separated arguments
> 
> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
> ---
>  hmp-commands.hx       | 20 +++++++++++++++++++-
>  include/monitor/hmp.h |  1 +
>  monitor/hmp-cmds.c    | 11 +++++++++++
>  3 files changed, 31 insertions(+), 1 deletion(-)
> 
> diff --git a/hmp-commands.hx b/hmp-commands.hx
> index 11827ae..d956405 100644
> --- a/hmp-commands.hx
> +++ b/hmp-commands.hx
> @@ -366,7 +366,7 @@ ERST
>      {
>          .name       = "cprsave",
>          .args_type  = "file:s,mode:s",
> -        .params     = "file 'reboot'",
> +        .params     = "file 'restart'|'reboot'",
>          .help       = "create a checkpoint of the VM in file",
>          .cmd        = hmp_cprsave,
>      },
> @@ -379,6 +379,24 @@ If *mode* is 'reboot', the checkpoint remains valid after a host kexec
>  reboot, and guest ram must be backed by persistant shared memory.  To
Same, Should be persistent.
>  resume from the checkpoint, issue the quit command, reboot the system,
>  and issue the cprload command.
> +
> +If *mode* is 'restart', the checkpoint remains valid after restarting qemu,
> +and guest ram must be allocated with the memfd-alloc machine option.  To
> +resume from the checkpoint, issue the cprexec command to restart, and issue
> +the cprload command.
> +ERST
> +
> +    {
> +        .name       = "cprexec",
> +        .args_type  = "command:S",
> +        .params     = "command",
> +        .help       = "Restart qemu by directly exec'ing command",
> +        .cmd        = hmp_cprexec,
> +    },
> +
> +SRST
> +``cprexec`` *command*
> +Restart qemu by directly exec'ing *command*, replacing the qemu process.
>  ERST
>  
>      {
> diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h
> index 98bb775..ffc5eb1 100644
> --- a/include/monitor/hmp.h
> +++ b/include/monitor/hmp.h
> @@ -60,6 +60,7 @@ void hmp_savevm(Monitor *mon, const QDict *qdict);
>  void hmp_delvm(Monitor *mon, const QDict *qdict);
>  void hmp_cprinfo(Monitor *mon, const QDict *qdict);
>  void hmp_cprsave(Monitor *mon, const QDict *qdict);
> +void hmp_cprexec(Monitor *mon, const QDict *qdict);
>  void hmp_cprload(Monitor *mon, const QDict *qdict);
>  void hmp_migrate_cancel(Monitor *mon, const QDict *qdict);
>  void hmp_migrate_continue(Monitor *mon, const QDict *qdict);
> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
> index a56f83c..163564e 100644
> --- a/monitor/hmp-cmds.c
> +++ b/monitor/hmp-cmds.c
> @@ -1217,6 +1217,17 @@ out:
>      hmp_handle_error(mon, err);
>  }
>  
> +void hmp_cprexec(Monitor *mon, const QDict *qdict)
> +{
> +    Error *err = NULL;
> +    const char *command = qdict_get_try_str(qdict, "command");
> +    strList *args = strList_from_string(command, ' ');
> +
> +    qmp_cprexec(args, &err);
> +    qapi_free_strList(args);
> +    hmp_handle_error(mon, err);
> +}
> +
>  void hmp_cprload(Monitor *mon, const QDict *qdict)
>  {
>      Error *err = NULL;
> 

-- 
Regards.
Chuan

