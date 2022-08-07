Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7172658BE46
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 01:08:03 +0200 (CEST)
Received: from localhost ([::1]:56232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oKpNK-00060J-Dt
	for lists+qemu-devel@lfdr.de; Sun, 07 Aug 2022 19:08:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oKpIu-0001ZY-TU
 for qemu-devel@nongnu.org; Sun, 07 Aug 2022 19:03:28 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:55217)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oKpIs-0003To-SX
 for qemu-devel@nongnu.org; Sun, 07 Aug 2022 19:03:28 -0400
Received: by mail-pj1-x1029.google.com with SMTP id b4so7269125pji.4
 for <qemu-devel@nongnu.org>; Sun, 07 Aug 2022 16:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=Y4C6QenWMAWP++iB8teCgnQMivMzp1pi6lQpN4ZnzU0=;
 b=W6jCtHBypb/dYNJYt15WDiwq3TxSq9LidCeEr/FKrxULGZFdu0hcLPoA8Us5UzXcVX
 3Y55ioGaa+KzHLjpgG0iZuU2z3IGV56d6F8F/gkVJRuhy3oCqenNqdSe4HJeK5uwi34e
 gIVeLybGmVatPcEKMSdtyp6RWnknq3Ay8CRsfFVmdZeB1T5OgSuWD8MxohLsx/uKxlG2
 aDnextR64X+Df7XZ57gWbexd0lT1B+lT0Xaal1EZSK+9KGnP/x/Z/bylw6yPNHeVoylS
 37V2TwuoNVTVsMYw3rF9HssKtckc+4AZY2gWLbVXxY8aDx6WGwlioMFKOADSjP3GS1Am
 Kqsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=Y4C6QenWMAWP++iB8teCgnQMivMzp1pi6lQpN4ZnzU0=;
 b=b8OfYWahmd/te+1BtKYFLghR0obHVjifzpcKCC0rnltcUzWtv+rHzW4ZpYWBPKerr6
 fV4nbJQFaQgnERl5uhlTLds2ekiUXcKhRiBcE0aOF1CwjEk5GOu8l3wQrXxARbT4P8jb
 lfqSwWr+2SawGW/7m3Gs/CskcCwmhMYcmfH4leRe9AjWrXQBhRWgD6Z6DSrAr9hoKemc
 x+qk3Wc4MLGHAdQ6g6qePbJtC9T0/WI1pxrk7ej8seKIsnwS0CjTK/4DNguLNCvFiVhl
 LFy37+bdAjh/egdLuTPi9rBRINVNC7XLbNIDXdp86Aa4ip+m4nwZkmSXurJz4djRGORV
 NUBQ==
X-Gm-Message-State: ACgBeo3gTc9omgqiFfVPKpnc038yI+5wkUZPj+6Uqg8HzYs8SyCyGteH
 5xwb2pFBA7rCHAHNZ7GkYfnhoBpOG2mqFWJq3BA=
X-Google-Smtp-Source: AA6agR6mCe/8wyJSD/nslkV3pI306PwZ6P05ny3fX8mei/iJUQPtDn2LGpcAR18DEwrZIXG1We4x6zffYYdDqLXmRoc=
X-Received: by 2002:a17:902:e5c8:b0:16f:1511:7575 with SMTP id
 u8-20020a170902e5c800b0016f15117575mr16392754plf.83.1659913405246; Sun, 07
 Aug 2022 16:03:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220805093948.82561-1-danielhb413@gmail.com>
 <20220805093948.82561-15-danielhb413@gmail.com>
In-Reply-To: <20220805093948.82561-15-danielhb413@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 8 Aug 2022 09:02:59 +1000
Message-ID: <CAKmqyKNpObyJ-GDh2nGxNkXe3kSOqMi8kpi-+UNw5WnbZqfjgQ@mail.gmail.com>
Subject: Re: [PATCH for-7.2 v2 14/20] qmp/hmp, device_tree.c: introduce dumpdtb
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 David Gibson <david@gibson.dropbear.id.au>, 
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=alistair23@gmail.com; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Aug 5, 2022 at 7:59 PM Daniel Henrique Barboza
<danielhb413@gmail.com> wrote:
>
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
> FDT is available, it'll save it in a file 'filename'. In short, this is
> a '-machine dumpdtb' that can be fired on demand via QMP/HMP.
>
> A valid FDT consists of a FDT that was created using libfdt being
> retrieved via 'current_machine->fdt' in device_tree.c. This condition is
> met by most FDT users in QEMU.
>
> Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hmp-commands.hx              | 13 +++++++++++++
>  include/monitor/hmp.h        |  1 +
>  include/sysemu/device_tree.h |  1 +
>  monitor/hmp-cmds.c           | 12 ++++++++++++
>  monitor/qmp-cmds.c           | 13 +++++++++++++
>  qapi/machine.json            | 17 +++++++++++++++++
>  softmmu/device_tree.c        | 18 ++++++++++++++++++
>  7 files changed, 75 insertions(+)
>
> diff --git a/hmp-commands.hx b/hmp-commands.hx
> index 182e639d14..d2554e9701 100644
> --- a/hmp-commands.hx
> +++ b/hmp-commands.hx
> @@ -1800,3 +1800,16 @@ ERST
>                        "\n\t\t\t\t\t limit on a specified virtual cpu",
>          .cmd        = hmp_cancel_vcpu_dirty_limit,
>      },
> +
> +SRST
> +``dumpdtb`` *filename*
> +  Save the FDT in the 'filename' file to be decoded using dtc.
> +  Requires 'libfdt' support.
> +ERST
> +    {
> +        .name       = "dumpdtb",
> +        .args_type  = "filename:s",
> +        .params     = "[filename] file to save the FDT",
> +        .help       = "save the FDT in the 'filename' file to be decoded using dtc",
> +        .cmd        = hmp_dumpdtb,
> +    },
> diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h
> index a618eb1e4e..d7f324da59 100644
> --- a/include/monitor/hmp.h
> +++ b/include/monitor/hmp.h
> @@ -134,6 +134,7 @@ void hmp_calc_dirty_rate(Monitor *mon, const QDict *qdict);
>  void hmp_set_vcpu_dirty_limit(Monitor *mon, const QDict *qdict);
>  void hmp_cancel_vcpu_dirty_limit(Monitor *mon, const QDict *qdict);
>  void hmp_info_vcpu_dirty_limit(Monitor *mon, const QDict *qdict);
> +void hmp_dumpdtb(Monitor *mon, const QDict *qdict);
>  void hmp_human_readable_text_helper(Monitor *mon,
>                                      HumanReadableText *(*qmp_handler)(Error **));
>  void hmp_info_stats(Monitor *mon, const QDict *qdict);
> diff --git a/include/sysemu/device_tree.h b/include/sysemu/device_tree.h
> index ef060a9759..bf7684e4ed 100644
> --- a/include/sysemu/device_tree.h
> +++ b/include/sysemu/device_tree.h
> @@ -136,6 +136,7 @@ int qemu_fdt_add_path(void *fdt, const char *path);
>      } while (0)
>
>  void qemu_fdt_dumpdtb(void *fdt, int size);
> +void qemu_fdt_qmp_dumpdtb(const char *filename, Error **errp);
>
>  /**
>   * qemu_fdt_setprop_sized_cells_from_array:
> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
> index c6cd6f91dd..d23ec85f9d 100644
> --- a/monitor/hmp-cmds.c
> +++ b/monitor/hmp-cmds.c
> @@ -2472,3 +2472,15 @@ exit:
>  exit_no_print:
>      error_free(err);
>  }
> +
> +void hmp_dumpdtb(Monitor *mon, const QDict *qdict)
> +{
> +    const char *filename = qdict_get_str(qdict, "filename");
> +    Error *local_err = NULL;
> +
> +    qmp_dumpdtb(filename, &local_err);
> +
> +    if (local_err) {
> +        error_report_err(local_err);
> +    }
> +}
> diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
> index 7314cd813d..8415aca08c 100644
> --- a/monitor/qmp-cmds.c
> +++ b/monitor/qmp-cmds.c
> @@ -45,6 +45,7 @@
>  #include "hw/intc/intc.h"
>  #include "hw/rdma/rdma.h"
>  #include "monitor/stats.h"
> +#include "sysemu/device_tree.h"
>
>  NameInfo *qmp_query_name(Error **errp)
>  {
> @@ -596,3 +597,15 @@ bool apply_str_list_filter(const char *string, strList *list)
>      }
>      return false;
>  }
> +
> +#ifdef CONFIG_FDT
> +void qmp_dumpdtb(const char *filename, Error **errp)
> +{
> +    return qemu_fdt_qmp_dumpdtb(filename, errp);
> +}
> +#else
> +void qmp_dumpdtb(const char *filename, Error **errp)
> +{
> +    error_setg(errp, "dumpdtb requires libfdt");
> +}
> +#endif
> diff --git a/qapi/machine.json b/qapi/machine.json
> index 6afd1936b0..aeb013f3dd 100644
> --- a/qapi/machine.json
> +++ b/qapi/machine.json
> @@ -1664,3 +1664,20 @@
>       '*size': 'size',
>       '*max-size': 'size',
>       '*slots': 'uint64' } }
> +
> +##
> +# @dumpdtb:
> +#
> +# Save the FDT in dtb format. Requires 'libfdt' support.
> +#
> +# @filename: name of the FDT file to be created
> +#
> +# Since: 7.2
> +#
> +# Example:
> +#   {"execute": "dumpdtb"}
> +#    "arguments": { "filename": "/tmp/fdt.dtb" } }
> +#
> +##
> +{ 'command': 'dumpdtb',
> +  'data': { 'filename': 'str' } }
> diff --git a/softmmu/device_tree.c b/softmmu/device_tree.c
> index 6ca3fad285..cd487ddd4d 100644
> --- a/softmmu/device_tree.c
> +++ b/softmmu/device_tree.c
> @@ -643,3 +643,21 @@ out:
>      g_free(propcells);
>      return ret;
>  }
> +
> +void qemu_fdt_qmp_dumpdtb(const char *filename, Error **errp)
> +{
> +    int size;
> +
> +    if (!current_machine->fdt) {
> +        error_setg(errp, "Unable to find the machine FDT");
> +        return;
> +    }
> +
> +    size = fdt_totalsize(current_machine->fdt);
> +
> +    if (g_file_set_contents(filename, current_machine->fdt, size, NULL)) {
> +        return;
> +    }
> +
> +    error_setg(errp, "Error when saving machine FDT to file %s", filename);
> +}
> --
> 2.36.1
>
>

