Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B231468EA26
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 09:46:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPg4Y-0002KQ-9e; Wed, 08 Feb 2023 03:44:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPg4X-0002KG-7A
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 03:44:57 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPg4V-0002x2-2p
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 03:44:56 -0500
Received: by mail-wr1-x435.google.com with SMTP id o18so15962129wrj.3
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 00:44:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=aLSwR5k5YRrnZxCCy08B97iuv6w/Kf6rQq6tYcPetBI=;
 b=y+OqSmEP1OXw9OZdj6ep8K6NF1A7ZrtxJxSJxPC3hhYYIG7sBEzIAXcOprHbbIBZV3
 lpTrCIdQlVgw4Z8Pjg3pV0i/DIwYNEXe3zJzjpr6JZuGsnChz8vsczocZQKXFL+ZPnQR
 WFtbZTBbr5NWBquJq4yPNAGBtxLAyzcmsztrW/GFPlV5oxKepBtKoOg3uPPJcJIxvrfz
 mksYmkRwFQZYbBKUMdUnJI1WP/O8rpVupOIBxkPsJ+jVLNKfUEJwwj+3RQCODL5TIWEP
 sxhRRoLanDHq89DGtdcNhak4WLIuBt4zZ+YPGzth/BCr+xaNI4h8xQ9/wdIaBCWAgd0c
 LgeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aLSwR5k5YRrnZxCCy08B97iuv6w/Kf6rQq6tYcPetBI=;
 b=IedXXeO0p7OxOglzL6y0N97hzHG7H/DDaDXUnQnZwgLanCm7eDqKLcp2I2wRYKpsU3
 NZ9AfMpcUBLxWxmPu3MBR90wA0d6rPQucO9QPKBTCJ43SqceREnC0VKu0Es/pXhzIZtS
 ObOY2MQ9DLYq4ZJlWtRe+2WHKGX82kPkJAJ63QaZKiFj5XAaq30OCEHsQPZixQosk082
 OaTp5uCseNJS51JIJXdwNWfcGdjBWfqvcwGpMQoTZLZ4OF5zz6g0m0zjigQR0dlBrUT+
 1xVNpfrcN7kJTU3qGVgu228kzEca4qoNgHv3QTwPjw/rMtj+f6k0tq+Gp/cS0kFiatVn
 xe0A==
X-Gm-Message-State: AO0yUKXJayf/kwf0Fw4ISd8bkjkpnTzF6rMm7ZWwvJ6BDeG7Uq6ItyY9
 QLCyfoY1r0gTBa7eW1JCkbseVQ==
X-Google-Smtp-Source: AK7set8Yn1ai42uPNQ/cQ4ob7odoQdUzjvVWj/9SzN9vnPtDDDraFPwfkQyp+eOWXjusYARBocngIg==
X-Received: by 2002:adf:ea45:0:b0:2bd:c1de:a33f with SMTP id
 j5-20020adfea45000000b002bdc1dea33fmr6018567wrn.19.1675845892710; 
 Wed, 08 Feb 2023 00:44:52 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 az10-20020a05600c600a00b003dc3f07c876sm1240898wmb.46.2023.02.08.00.44.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Feb 2023 00:44:50 -0800 (PST)
Message-ID: <7fbb3bfa-8cb3-73ab-bf03-81585f9024e1@linaro.org>
Date: Wed, 8 Feb 2023 09:44:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PULL 09/35] readline: Extract readline_add_completion_of() from
 monitor
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org
References: <20230203084549.2622302-1-armbru@redhat.com>
 <20230203084549.2622302-10-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230203084549.2622302-10-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 3/2/23 09:45, Markus Armbruster wrote:
> monitor/misc.h has static add_completion_option().  It's useful
> elsewhere in the monitor.  Since it's not monitor-specific, move it to
> util/readline.c renamed to readline_add_completion_of(), and put it to
> use.

52f50b1e9f8fd410d4293a211d549ec61b902728 is the first bad commit

This commit broke monitor autocomplete feature.

Before:

(qemu) <tab>
?                                announce_self
balloon                          block_job_cancel
block_job_complete               block_job_pause
block_job_resume                 block_job_set_speed
[...]

After:

(qemu) <tab>
[no autocomplete]

> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> Message-Id: <20230124121946.1139465-7-armbru@redhat.com>
> ---
>   include/qemu/readline.h |  2 +
>   monitor/hmp.c           | 12 +++---
>   monitor/misc.c          | 85 +++++++++++++----------------------------
>   util/readline.c         |  8 ++++
>   4 files changed, 41 insertions(+), 66 deletions(-)
> 
> diff --git a/include/qemu/readline.h b/include/qemu/readline.h
> index 622aa4564f..b05e4782da 100644
> --- a/include/qemu/readline.h
> +++ b/include/qemu/readline.h
> @@ -44,6 +44,8 @@ typedef struct ReadLineState {
>   } ReadLineState;
>   
>   void readline_add_completion(ReadLineState *rs, const char *str);
> +void readline_add_completion_of(ReadLineState *rs,
> +                                const char *pfx, const char *str);
>   void readline_set_completion_index(ReadLineState *rs, int completion_index);
>   
>   const char *readline_get_history(ReadLineState *rs, unsigned int index);
> diff --git a/monitor/hmp.c b/monitor/hmp.c
> index 65641a6e56..893e100581 100644
> --- a/monitor/hmp.c
> +++ b/monitor/hmp.c
> @@ -1188,8 +1188,8 @@ static void cmd_completion(MonitorHMP *mon, const char *name, const char *list)
>           }
>           memcpy(cmd, pstart, len);
>           cmd[len] = '\0';
> -        if (name[0] == '\0' || !strncmp(name, cmd, strlen(name))) {
> -            readline_add_completion(mon->rs, cmd);
> +        if (name[0] == '\0') {
> +            readline_add_completion_of(mon->rs, name, cmd);
>           }
>           if (*p == '\0') {
>               break;
> @@ -1269,7 +1269,7 @@ static void monitor_find_completion_by_table(MonitorHMP *mon,
>   {
>       const char *cmdname;
>       int i;
> -    const char *ptype, *old_ptype, *str, *name;
> +    const char *ptype, *old_ptype, *str;
>       const HMPCommand *cmd;
>       BlockBackend *blk = NULL;
>   
> @@ -1334,10 +1334,8 @@ static void monitor_find_completion_by_table(MonitorHMP *mon,
>               /* block device name completion */
>               readline_set_completion_index(mon->rs, strlen(str));
>               while ((blk = blk_next(blk)) != NULL) {
> -                name = blk_name(blk);
> -                if (str[0] == '\0' ||
> -                    !strncmp(name, str, strlen(str))) {
> -                    readline_add_completion(mon->rs, name);
> +                if (str[0] == '\0') {
> +                    readline_add_completion_of(mon->rs, str, blk_name(blk));
>                   }
>               }
>               break;
> diff --git a/monitor/misc.c b/monitor/misc.c
> index d58a81c452..9da52939b2 100644
> --- a/monitor/misc.c
> +++ b/monitor/misc.c
> @@ -1350,14 +1350,6 @@ int get_monitor_def(Monitor *mon, int64_t *pval, const char *name)
>       return ret;
>   }
>   
> -static void add_completion_option(ReadLineState *rs, const char *str,
> -                                  const char *option)
> -{
> -    if (!strncmp(option, str, strlen(str))) {
> -        readline_add_completion(rs, option);
> -    }
> -}
> -
>   void netdev_add_completion(ReadLineState *rs, int nb_args, const char *str)
>   {
>       size_t len;
> @@ -1369,7 +1361,7 @@ void netdev_add_completion(ReadLineState *rs, int nb_args, const char *str)
>       len = strlen(str);
>       readline_set_completion_index(rs, len);
>       for (i = 0; i < NET_CLIENT_DRIVER__MAX; i++) {
> -        add_completion_option(rs, str, NetClientDriver_str(i));
> +        readline_add_completion_of(rs, str, NetClientDriver_str(i));
>       }
>   }
>   
> @@ -1386,14 +1378,12 @@ void device_add_completion(ReadLineState *rs, int nb_args, const char *str)
>       readline_set_completion_index(rs, len);
>       list = elt = object_class_get_list(TYPE_DEVICE, false);
>       while (elt) {
> -        const char *name;
>           DeviceClass *dc = OBJECT_CLASS_CHECK(DeviceClass, elt->data,
>                                                TYPE_DEVICE);
> -        name = object_class_get_name(OBJECT_CLASS(dc));
>   
> -        if (dc->user_creatable
> -            && !strncmp(name, str, len)) {
> -            readline_add_completion(rs, name);
> +        if (dc->user_creatable) {
> +            readline_add_completion_of(rs, str,
> +                                object_class_get_name(OBJECT_CLASS(dc)));
>           }
>           elt = elt->next;
>       }
> @@ -1416,8 +1406,8 @@ void object_add_completion(ReadLineState *rs, int nb_args, const char *str)
>           const char *name;
>   
>           name = object_class_get_name(OBJECT_CLASS(elt->data));
> -        if (!strncmp(name, str, len) && strcmp(name, TYPE_USER_CREATABLE)) {
> -            readline_add_completion(rs, name);
> +        if (strcmp(name, TYPE_USER_CREATABLE)) {
> +            readline_add_completion_of(rs, str, name);
>           }
>           elt = elt->next;
>       }
> @@ -1450,7 +1440,7 @@ static GSList *qdev_build_hotpluggable_device_list(Object *peripheral)
>   }
>   
>   static void peripheral_device_del_completion(ReadLineState *rs,
> -                                             const char *str, size_t len)
> +                                             const char *str)
>   {
>       Object *peripheral = container_get(qdev_get_machine(), "/peripheral");
>       GSList *list, *item;
> @@ -1463,8 +1453,8 @@ static void peripheral_device_del_completion(ReadLineState *rs,
>       for (item = list; item; item = g_slist_next(item)) {
>           DeviceState *dev = item->data;
>   
> -        if (dev->id && !strncmp(str, dev->id, len)) {
> -            readline_add_completion(rs, dev->id);
> +        if (dev->id) {
> +            readline_add_completion_of(rs, str, dev->id);
>           }
>       }
>   
> @@ -1473,15 +1463,12 @@ static void peripheral_device_del_completion(ReadLineState *rs,
>   
>   void device_del_completion(ReadLineState *rs, int nb_args, const char *str)
>   {
> -    size_t len;
> -
>       if (nb_args != 2) {
>           return;
>       }
>   
> -    len = strlen(str);
> -    readline_set_completion_index(rs, len);
> -    peripheral_device_del_completion(rs, str, len);
> +    readline_set_completion_index(rs, strlen(str));
> +    peripheral_device_del_completion(rs, str);
>   }
>   
>   void object_del_completion(ReadLineState *rs, int nb_args, const char *str)
> @@ -1499,9 +1486,8 @@ void object_del_completion(ReadLineState *rs, int nb_args, const char *str)
>       while (list) {
>           ObjectPropertyInfo *info = list->value;
>   
> -        if (!strncmp(info->type, "child<", 5)
> -            && !strncmp(info->name, str, len)) {
> -            readline_add_completion(rs, info->name);
> +        if (!strncmp(info->type, "child<", 5)) {
> +            readline_add_completion_of(rs, str, info->name);
>           }
>           list = list->next;
>       }
> @@ -1521,14 +1507,11 @@ void set_link_completion(ReadLineState *rs, int nb_args, const char *str)
>                                                NET_CLIENT_DRIVER_NONE,
>                                                MAX_QUEUE_NUM);
>           for (i = 0; i < MIN(count, MAX_QUEUE_NUM); i++) {
> -            const char *name = ncs[i]->name;
> -            if (!strncmp(str, name, len)) {
> -                readline_add_completion(rs, name);
> -            }
> +            readline_add_completion_of(rs, str, ncs[i]->name);
>           }
>       } else if (nb_args == 3) {
> -        add_completion_option(rs, str, "on");
> -        add_completion_option(rs, str, "off");
> +        readline_add_completion_of(rs, str, "on");
> +        readline_add_completion_of(rs, str, "off");
>       }
>   }
>   
> @@ -1546,12 +1529,8 @@ void netdev_del_completion(ReadLineState *rs, int nb_args, const char *str)
>       count = qemu_find_net_clients_except(NULL, ncs, NET_CLIENT_DRIVER_NIC,
>                                            MAX_QUEUE_NUM);
>       for (i = 0; i < MIN(count, MAX_QUEUE_NUM); i++) {
> -        const char *name = ncs[i]->name;
> -        if (strncmp(str, name, len)) {
> -            continue;
> -        }
>           if (ncs[i]->is_netdev) {
> -            readline_add_completion(rs, name);
> +            readline_add_completion_of(rs, str, ncs[i]->name);
>           }
>       }
>   }
> @@ -1590,8 +1569,8 @@ void trace_event_completion(ReadLineState *rs, int nb_args, const char *str)
>           }
>           g_free(pattern);
>       } else if (nb_args == 3) {
> -        add_completion_option(rs, str, "on");
> -        add_completion_option(rs, str, "off");
> +        readline_add_completion_of(rs, str, "on");
> +        readline_add_completion_of(rs, str, "off");
>       }
>   }
>   
> @@ -1604,7 +1583,7 @@ void watchdog_action_completion(ReadLineState *rs, int nb_args, const char *str)
>       }
>       readline_set_completion_index(rs, strlen(str));
>       for (i = 0; i < WATCHDOG_ACTION__MAX; i++) {
> -        add_completion_option(rs, str, WatchdogAction_str(i));
> +        readline_add_completion_of(rs, str, WatchdogAction_str(i));
>       }
>   }
>   
> @@ -1618,14 +1597,11 @@ void migrate_set_capability_completion(ReadLineState *rs, int nb_args,
>       if (nb_args == 2) {
>           int i;
>           for (i = 0; i < MIGRATION_CAPABILITY__MAX; i++) {
> -            const char *name = MigrationCapability_str(i);
> -            if (!strncmp(str, name, len)) {
> -                readline_add_completion(rs, name);
> -            }
> +            readline_add_completion_of(rs, str, MigrationCapability_str(i));
>           }
>       } else if (nb_args == 3) {
> -        add_completion_option(rs, str, "on");
> -        add_completion_option(rs, str, "off");
> +        readline_add_completion_of(rs, str, "on");
> +        readline_add_completion_of(rs, str, "off");
>       }
>   }
>   
> @@ -1639,10 +1615,7 @@ void migrate_set_parameter_completion(ReadLineState *rs, int nb_args,
>       if (nb_args == 2) {
>           int i;
>           for (i = 0; i < MIGRATION_PARAMETER__MAX; i++) {
> -            const char *name = MigrationParameter_str(i);
> -            if (!strncmp(str, name, len)) {
> -                readline_add_completion(rs, name);
> -            }
> +            readline_add_completion_of(rs, str, MigrationParameter_str(i));
>           }
>       }
>   }
> @@ -1672,14 +1645,8 @@ static void vm_completion(ReadLineState *rs, const char *str)
>   
>           snapshot = snapshots;
>           while (snapshot) {
> -            char *completion = snapshot->value->name;
> -            if (!strncmp(str, completion, len)) {
> -                readline_add_completion(rs, completion);
> -            }
> -            completion = snapshot->value->id;
> -            if (!strncmp(str, completion, len)) {
> -                readline_add_completion(rs, completion);
> -            }
> +            readline_add_completion_of(rs, str, snapshot->value->name);
> +            readline_add_completion_of(rs, str, snapshot->value->id);
>               snapshot = snapshot->next;
>           }
>           qapi_free_SnapshotInfoList(snapshots);
> diff --git a/util/readline.c b/util/readline.c
> index f1ac6e4769..494a3d924e 100644
> --- a/util/readline.c
> +++ b/util/readline.c
> @@ -286,6 +286,14 @@ void readline_add_completion(ReadLineState *rs, const char *str)
>       }
>   }
>   
> +void readline_add_completion_of(ReadLineState *rs,
> +                                const char *pfx, const char *str)
> +{
> +    if (!strncmp(str, pfx, strlen(pfx))) {
> +        readline_add_completion(rs, str);
> +    }
> +}
> +
>   void readline_set_completion_index(ReadLineState *rs, int index)
>   {
>       rs->completion_index = index;


