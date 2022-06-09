Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 080B6544C3E
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 14:37:10 +0200 (CEST)
Received: from localhost ([::1]:45440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzHPR-00068N-2d
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 08:37:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1nzF4p-0004SK-Kf
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 06:07:44 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:38342)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1nzF4l-00070M-2v
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 06:07:40 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8BF5D1FDAB;
 Thu,  9 Jun 2022 10:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1654769252; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p7knSxgmTdBzprjhGCrILETyGXK74Sl7QC19EjSq530=;
 b=OpwajpRoH3xEWMp2Y9phEIKOACPBYJdxbrgIefVfaN5Q+wQX7zfNgo2ZxzZVvWxFuRys2d
 WikYqr5KrKJ2GmWqYQt03LvY2S5uLfn8W8wm+/IouYokG8DTWkgw27IvvY4Vj6O8WMn0sC
 dFYydLrDFyxLejY+Rzc9TbJSzwV1TFM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1654769252;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p7knSxgmTdBzprjhGCrILETyGXK74Sl7QC19EjSq530=;
 b=NkKrQy6YAbe7VYxxpOU4A4J822F9XYeXlBGM2J4yQOnmpWhG0V8uh/F8QUO7lHxWCGdz55
 jpIrs+RyYatnFkBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 06BAE13A8C;
 Thu,  9 Jun 2022 10:07:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id lQmMO2PGoWJqegAAMHmgww
 (envelope-from <cfontana@suse.de>); Thu, 09 Jun 2022 10:07:31 +0000
Message-ID: <073c1687-d30f-8f41-b87e-83372137708a@suse.de>
Date: Thu, 9 Jun 2022 12:07:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PULL 15/18] qapi: introduce x-query-ramblock QMP command
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, David Hildenbrand <david@redhat.com>,
 Michael Roth <michael.roth@amd.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Peter Xu <peterx@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>
References: <20211102175700.1175996-1-berrange@redhat.com>
 <20211102175700.1175996-16-berrange@redhat.com>
From: Claudio Fontana <cfontana@suse.de>
In-Reply-To: <20211102175700.1175996-16-berrange@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.29; envelope-from=cfontana@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Hello all,

it would be really good to be able to rely on this command or something similar,
to be able to know the approximate size of a migration before starting it.

in QEMU ram_bytes_total() returns what I would like to have,
but there is currently no QMP way to get it without starting a migration,
which when trying to optimize it/size it is just about too late.

Do you think x-query-ramblock could be promoted to non-experimental?

Should another one be made available instead, like :
query-ram-bytes-total ?

Thanks,

Claudio


On 11/2/21 18:56, Daniel P. Berrangé wrote:
> This is a counterpart to the HMP "info ramblock" command. It is being
> added with an "x-" prefix because this QMP command is intended as an
> adhoc debugging tool and will thus not be modelled in QAPI as fully
> structured data, nor will it have long term guaranteed stability.
> The existing HMP command is rewritten to call the QMP command.
> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  hmp-commands-info.hx   |  2 +-
>  include/exec/ramlist.h |  2 +-
>  monitor/hmp-cmds.c     |  6 ------
>  monitor/qmp-cmds.c     |  8 ++++++++
>  qapi/machine.json      | 12 ++++++++++++
>  softmmu/physmem.c      | 19 +++++++++++--------
>  6 files changed, 33 insertions(+), 16 deletions(-)
> 
> diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
> index d9af216473..c2d7275bf5 100644
> --- a/hmp-commands-info.hx
> +++ b/hmp-commands-info.hx
> @@ -772,7 +772,7 @@ ERST
>          .args_type  = "",
>          .params     = "",
>          .help       = "Display system ramblock information",
> -        .cmd        = hmp_info_ramblock,
> +        .cmd_info_hrt = qmp_x_query_ramblock,
>      },
>  
>  SRST
> diff --git a/include/exec/ramlist.h b/include/exec/ramlist.h
> index ece6497ee2..2ad2a81acc 100644
> --- a/include/exec/ramlist.h
> +++ b/include/exec/ramlist.h
> @@ -80,6 +80,6 @@ void ram_block_notify_add(void *host, size_t size, size_t max_size);
>  void ram_block_notify_remove(void *host, size_t size, size_t max_size);
>  void ram_block_notify_resize(void *host, size_t old_size, size_t new_size);
>  
> -void ram_block_dump(Monitor *mon);
> +GString *ram_block_format(void);
>  
>  #endif /* RAMLIST_H */
> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
> index 9d221622d7..90f9a64573 100644
> --- a/monitor/hmp-cmds.c
> +++ b/monitor/hmp-cmds.c
> @@ -52,7 +52,6 @@
>  #include "ui/console.h"
>  #include "qemu/cutils.h"
>  #include "qemu/error-report.h"
> -#include "exec/ramlist.h"
>  #include "hw/intc/intc.h"
>  #include "migration/snapshot.h"
>  #include "migration/misc.h"
> @@ -2176,11 +2175,6 @@ void hmp_rocker_of_dpa_groups(Monitor *mon, const QDict *qdict)
>      qapi_free_RockerOfDpaGroupList(list);
>  }
>  
> -void hmp_info_ramblock(Monitor *mon, const QDict *qdict)
> -{
> -    ram_block_dump(mon);
> -}
> -
>  void hmp_info_vm_generation_id(Monitor *mon, const QDict *qdict)
>  {
>      Error *err = NULL;
> diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
> index 0a9ba7595c..a9766fa38d 100644
> --- a/monitor/qmp-cmds.c
> +++ b/monitor/qmp-cmds.c
> @@ -38,6 +38,7 @@
>  #include "qapi/qapi-commands-ui.h"
>  #include "qapi/type-helpers.h"
>  #include "qapi/qmp/qerror.h"
> +#include "exec/ramlist.h"
>  #include "hw/mem/memory-device.h"
>  #include "hw/acpi/acpi_dev_interface.h"
>  #include "hw/rdma/rdma.h"
> @@ -414,3 +415,10 @@ HumanReadableText *qmp_x_query_rdma(Error **errp)
>  
>      return human_readable_text_from_str(buf);
>  }
> +
> +HumanReadableText *qmp_x_query_ramblock(Error **errp)
> +{
> +    g_autoptr(GString) buf = ram_block_format();
> +
> +    return human_readable_text_from_str(buf);
> +}
> diff --git a/qapi/machine.json b/qapi/machine.json
> index 1b2748c77a..be81170c2b 100644
> --- a/qapi/machine.json
> +++ b/qapi/machine.json
> @@ -1436,6 +1436,18 @@
>  { 'command': 'x-query-profile',
>    'returns': 'HumanReadableText' }
>  
> +##
> +# @x-query-ramblock:
> +#
> +# Query system ramblock information
> +#
> +# Returns: system ramblock information
> +#
> +# Since: 6.2
> +##
> +{ 'command': 'x-query-ramblock',
> +  'returns': 'HumanReadableText' }
> +
>  ##
>  # @x-query-rdma:
>  #
> diff --git a/softmmu/physmem.c b/softmmu/physmem.c
> index b9a8c1d1f4..314f8b439c 100644
> --- a/softmmu/physmem.c
> +++ b/softmmu/physmem.c
> @@ -1296,23 +1296,26 @@ void qemu_mutex_unlock_ramlist(void)
>      qemu_mutex_unlock(&ram_list.mutex);
>  }
>  
> -void ram_block_dump(Monitor *mon)
> +GString *ram_block_format(void)
>  {
>      RAMBlock *block;
>      char *psize;
> +    GString *buf = g_string_new("");
>  
>      RCU_READ_LOCK_GUARD();
> -    monitor_printf(mon, "%24s %8s  %18s %18s %18s\n",
> -                   "Block Name", "PSize", "Offset", "Used", "Total");
> +    g_string_append_printf(buf, "%24s %8s  %18s %18s %18s\n",
> +                           "Block Name", "PSize", "Offset", "Used", "Total");
>      RAMBLOCK_FOREACH(block) {
>          psize = size_to_str(block->page_size);
> -        monitor_printf(mon, "%24s %8s  0x%016" PRIx64 " 0x%016" PRIx64
> -                       " 0x%016" PRIx64 "\n", block->idstr, psize,
> -                       (uint64_t)block->offset,
> -                       (uint64_t)block->used_length,
> -                       (uint64_t)block->max_length);
> +        g_string_append_printf(buf, "%24s %8s  0x%016" PRIx64 " 0x%016" PRIx64
> +                               " 0x%016" PRIx64 "\n", block->idstr, psize,
> +                               (uint64_t)block->offset,
> +                               (uint64_t)block->used_length,
> +                               (uint64_t)block->max_length);
>          g_free(psize);
>      }
> +
> +    return buf;
>  }
>  
>  #ifdef __linux__


