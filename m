Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FBE75E6111
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 13:30:41 +0200 (CEST)
Received: from localhost ([::1]:42696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obKPf-0005mY-Vz
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 07:30:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1obJjs-0008AV-7p; Thu, 22 Sep 2022 06:47:28 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:36807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1obJjn-0002if-KO; Thu, 22 Sep 2022 06:47:26 -0400
Received: by mail-pl1-x632.google.com with SMTP id c24so8432970plo.3;
 Thu, 22 Sep 2022 03:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=UW8ImqOJqo8y+t0UAC3M9dPOyYsc/gjKIVpqN88d2ZE=;
 b=Wlfc41PolYLjkRx6aNVroVaceFJLHEDkBswlEeqWSswiYtPBnqDWmWkDXt0mRoFGdV
 4jR/aZvLa0NsaCKCQ1DvEosdCNhCC8Tzw6380YneM7AEufB9G5zFkfmEyq+FDybJovgY
 i9pHc9nqN56iP3NTS8rs2z2Uv3a83XufTeEs2Xgx6gh2WS8NFOIo9PFXJSUlOmAEQ8RQ
 2MnXak/Npoei78Zb/oLqx0qGcyZqocoUdn3X9Ec++Xj4NP/OTnPS6Y6jUHDBm+aaN5h4
 ExBW/WTpsCYuHmj+lqoZLEjdAQWPujQ/1S7FnyOaZhLJfKjyXxA/DrTQDhKKVFqzTb8Z
 1GgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=UW8ImqOJqo8y+t0UAC3M9dPOyYsc/gjKIVpqN88d2ZE=;
 b=Wh8B+hnGpiUjYE7KkR1PBtb1WDqalXBegeQu23hLcPseIvpW5ay/lGMopH5Jlxvl15
 y96Q4lRYH+YeJApfuLuC4Dj+DicM+X+TSMIgrlO7/YWm/spPR5DumDDrr9r4cjAMLEwZ
 Mj5ubfWp09TY/K6fUnh59gtHZ86mAtYsyzGLwJ/E0CIV1yeK1zj3CHmnHj5jaMJdZoyA
 8bEhi130avKYAPuBUF9NY1Fzqo8YjUcW0DJHB+LEwWMakTtVjH3bCOunZ7KUOvrZzarx
 dKKt3UWIXfHiYWIjro4V2sd1c+GJND2g4I9LZkOJrKAjYAu2NXHu8/HStmIugc8QsjDz
 7UIA==
X-Gm-Message-State: ACrzQf2DZcrrh2jNiPY7IOvBqNCLACT+v15qiT21VEsbjo4nikWc3LOi
 vWBhwGcCxPIF7baEa0GNt64=
X-Google-Smtp-Source: AMsMyM77ETuqzKRGbVfPlCR+ggP7CXKZhh1KtMTju37GdCXDnOKXMV+z0l/hhR/543AWOgAWLnbuKg==
X-Received: by 2002:a17:90b:33c5:b0:202:fa60:3765 with SMTP id
 lk5-20020a17090b33c500b00202fa603765mr14965864pjb.137.1663843638523; 
 Thu, 22 Sep 2022 03:47:18 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 p4-20020a622904000000b0054d1a2ee8cfsm3991908pfp.103.2022.09.22.03.47.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Sep 2022 03:47:17 -0700 (PDT)
Message-ID: <0d4f5caf-6005-779d-8e37-5d26ba3a0856@amsat.org>
Date: Thu, 22 Sep 2022 12:47:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH v7 14/14] qmp/hmp, device_tree.c: introduce dumpdtb
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 David Gibson <david@gibson.dropbear.id.au>
References: <20220908194040.518400-1-danielhb413@gmail.com>
 <20220908194040.518400-15-danielhb413@gmail.com>
In-Reply-To: <20220908194040.518400-15-danielhb413@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x632.google.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-3.702,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 8/9/22 21:40, Daniel Henrique Barboza wrote:
> To save the FDT blob we have the '-machine dumpdtb=<file>' property.
> With this property set, the machine saves the FDT in <file> and exit.
> The created file can then be converted to plain text dts format using
> 'dtc'.
> 
> There's nothing particularly sophisticated into saving the FDT that
> can't be done with the machine at any state, as long as the machine has
> a valid FDT to be saved.
> 
> The 'dumpdtb' command receives a 'filename' paramenter and, if a valid

Typo "parameter".

> FDT is available, it'll save it in a file 'filename'. In short, this is
> a '-machine dumpdtb' that can be fired on demand via QMP/HMP.
> 
> A valid FDT consists of a FDT that was created using libfdt being
> retrieved via 'current_machine->fdt' in device_tree.c.

This sentence is odd.

> This condition is
> met by most FDT users in QEMU.
> 
> This command will always be executed in-band (i.e. holding BQL),
> avoiding potential race conditions with machines that might change the
> FDT during runtime (e.g. PowerPC 'pseries' machine).
> 
> Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Cc: Markus Armbruster <armbru@redhat.com>
> Cc: Alistair Francis <alistair.francis@wdc.com>
> Cc: David Gibson <david@gibson.dropbear.id.au>
> Acked-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>   hmp-commands.hx              | 15 +++++++++++++++
>   include/sysemu/device_tree.h |  1 +
>   monitor/misc.c               |  1 +
>   qapi/machine.json            | 18 ++++++++++++++++++
>   softmmu/device_tree.c        | 31 +++++++++++++++++++++++++++++++
>   5 files changed, 66 insertions(+)
> 
> diff --git a/hmp-commands.hx b/hmp-commands.hx
> index 182e639d14..753669a2eb 100644
> --- a/hmp-commands.hx
> +++ b/hmp-commands.hx
> @@ -1800,3 +1800,18 @@ ERST
>                         "\n\t\t\t\t\t limit on a specified virtual cpu",
>           .cmd        = hmp_cancel_vcpu_dirty_limit,
>       },
> +
> +#if defined(CONFIG_FDT)
> +    {
> +        .name       = "dumpdtb",
> +        .args_type  = "filename:F",
> +        .params     = "filename",
> +        .help       = "save the FDT in the 'filename' file to be decoded using dtc",
> +        .cmd        = hmp_dumpdtb,
> +    },
> +
> +SRST
> +``dumpdtb`` *filename*
> +  Save the FDT in the 'filename' file to be decoded using dtc.
> +ERST
> +#endif
> diff --git a/include/sysemu/device_tree.h b/include/sysemu/device_tree.h
> index ef060a9759..e7c5441f56 100644
> --- a/include/sysemu/device_tree.h
> +++ b/include/sysemu/device_tree.h
> @@ -136,6 +136,7 @@ int qemu_fdt_add_path(void *fdt, const char *path);
>       } while (0)
>   
>   void qemu_fdt_dumpdtb(void *fdt, int size);
> +void hmp_dumpdtb(Monitor *mon, const QDict *qdict);
>   
>   /**
>    * qemu_fdt_setprop_sized_cells_from_array:
> diff --git a/monitor/misc.c b/monitor/misc.c
> index 3d2312ba8d..e7dd63030b 100644
> --- a/monitor/misc.c
> +++ b/monitor/misc.c
> @@ -49,6 +49,7 @@
>   #include "sysemu/blockdev.h"
>   #include "sysemu/sysemu.h"
>   #include "sysemu/tpm.h"
> +#include "sysemu/device_tree.h"
>   #include "qapi/qmp/qdict.h"
>   #include "qapi/qmp/qerror.h"
>   #include "qapi/qmp/qstring.h"
> diff --git a/qapi/machine.json b/qapi/machine.json
> index abb2f48808..9f0c8c8374 100644
> --- a/qapi/machine.json
> +++ b/qapi/machine.json
> @@ -1664,3 +1664,21 @@
>        '*size': 'size',
>        '*max-size': 'size',
>        '*slots': 'uint64' } }
> +
> +##
> +# @dumpdtb:
> +#
> +# Save the FDT in dtb format.
> +#
> +# @filename: name of the FDT file to be created

"name of the binary FDT ..."?

> +#
> +# Since: 7.2
> +#
> +# Example:
> +#   {"execute": "dumpdtb"}
> +#    "arguments": { "filename": "fdt.dtb" } }
> +#
> +##
> +{ 'command': 'dumpdtb',
> +  'data': { 'filename': 'str' },
> +  'if': 'CONFIG_FDT' }
> diff --git a/softmmu/device_tree.c b/softmmu/device_tree.c
> index 6ca3fad285..7031dcf89d 100644
> --- a/softmmu/device_tree.c
> +++ b/softmmu/device_tree.c
> @@ -26,6 +26,9 @@
>   #include "hw/loader.h"
>   #include "hw/boards.h"
>   #include "qemu/config-file.h"
> +#include "qapi/qapi-commands-machine.h"
> +#include "qapi/qmp/qdict.h"
> +#include "monitor/hmp.h"
>   
>   #include <libfdt.h>
>   
> @@ -643,3 +646,31 @@ out:
>       g_free(propcells);
>       return ret;
>   }
> +
> +void qmp_dumpdtb(const char *filename, Error **errp)
> +{
> +    g_autoptr(GError) err = NULL;
> +    int size;

fdt_totalsize() returns an uint32_t. Maybe use "unsigned" if you
don't want to use uint32_t?

> +
> +    if (!current_machine->fdt) {
> +        error_setg(errp, "This machine doesn't have a FDT");
> +        return;
> +    }
> +
> +    size = fdt_totalsize(current_machine->fdt);

        assert(size > 0); ?

> +
> +    if (!g_file_set_contents(filename, current_machine->fdt, size, &err)) {
> +        error_setg(errp, "Error saving FDT to file %s: %s",
> +                   filename, err->message);
> +    }

Eventually:

        info_report("Dumped %u bytes of FDT to %s\n", size, filename);

To have a feedback in HMP.

> +}
> +
> +void hmp_dumpdtb(Monitor *mon, const QDict *qdict)
> +{
> +    const char *filename = qdict_get_str(qdict, "filename");
> +    Error *local_err = NULL;
> +
> +    qmp_dumpdtb(filename, &local_err);
> +
> +    hmp_handle_error(mon, local_err);
> +}

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

