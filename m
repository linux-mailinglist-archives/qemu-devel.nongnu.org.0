Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF27420B01
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 14:41:45 +0200 (CEST)
Received: from localhost ([::1]:50178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXNHr-0000A8-DH
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 08:41:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mXN8p-0003K5-Ns
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 08:32:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47291)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mXN8m-0004bh-F9
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 08:32:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633350739;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FsfnuBQshJu1RbQNamHuIfNWlgV7YMhqQF4wztloXDk=;
 b=PLqY1lP5fcEJi47cEe3kJaLAqT5OLV2w8Mkd7kovg9qJm1dWmVH72ioZrU5/5dMU+tPiQA
 BB7iAUQC6rAsYx6RKItgIUAMbfftWfE87zzrVAsjwRhBecYp7UOClUoniaKE3XjfC2uq/w
 PxUMc725GmurKBIfCSlGpYbvU4wazq8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-406-5en1vwHGPHyG-Ql3TvQkyA-1; Mon, 04 Oct 2021 08:32:18 -0400
X-MC-Unique: 5en1vwHGPHyG-Ql3TvQkyA-1
Received: by mail-wm1-f70.google.com with SMTP id
 k6-20020a05600c0b4600b0030d2a0a259eso6770414wmr.6
 for <qemu-devel@nongnu.org>; Mon, 04 Oct 2021 05:32:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=FsfnuBQshJu1RbQNamHuIfNWlgV7YMhqQF4wztloXDk=;
 b=eXjjPoOro3CyUD76snWAVxjEkjgtIzLBbVaBD4T4iCsNgA8fkKe+6GDHpK6Pd9vV18
 OTeG2m2p3NjDyd+3HGMSZOw0E9xar2TRy1tCO4YUwF75pQ/lqEwS888f0wSWrpM2/qJ6
 ShRXunSuCr8hKvJKfYnoSD16F2L3/EaqmUHrgP9YMxI4vFqx6lv5q4h5QxCffYOnBi6b
 wE7TAguyN8LUX28GTMUCSgD43YgYH9+RQ6XJn1P+DKch02NwqNObniiTLhtR85uy4quY
 c+56xTrt2wV65zYtjO0GhgH+ofTQtH/eROoOivnxUPBgpHzVv53D5bdG0bse6ZVVY1Cp
 kcoA==
X-Gm-Message-State: AOAM5332SKW9M4PpFYmfqOdA6N4vda9H0pAtXLXG21ktsvDGy5Nwx/Yo
 GVvh/fG0iz4iFjKv9WzR5koGEZkQk1lSvaBBBr2pmwgPt54mTTau8Twcm72Zlg1hXMRFk1LUutm
 lTQ6aBUvzoXF3aYM=
X-Received: by 2002:a7b:c442:: with SMTP id l2mr18777554wmi.131.1633350737041; 
 Mon, 04 Oct 2021 05:32:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwZsReheXuFAbE9PrnvPWhJcYmtfoOMD21NcdszUsus8K94tPmiK0Dk/JHD/x3NwXId+zqtnw==
X-Received: by 2002:a7b:c442:: with SMTP id l2mr18777499wmi.131.1633350736725; 
 Mon, 04 Oct 2021 05:32:16 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id t15sm5082052wru.6.2021.10.04.05.32.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 05:32:16 -0700 (PDT)
Date: Mon, 4 Oct 2021 13:32:14 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH v3 07/19] qapi: introduce x-query-roms QMP command
Message-ID: <YVr0TufQdOS59bta@work-vm>
References: <20210930132349.3601823-1-berrange@redhat.com>
 <20210930132349.3601823-8-berrange@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210930132349.3601823-8-berrange@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, David Hildenbrand <david@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Cornelia Huck <cohuck@redhat.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Daniel P. Berrangé (berrange@redhat.com) wrote:
> This is a counterpart to the HMP "info roms" command. It is being
> added with an "x-" prefix because this QMP command is intended as an
> adhoc debugging tool and will thus not be modelled in QAPI as fully
> structured data, nor will it have long term guaranteed stability.
> The existing HMP command is rewritten to call the QMP command.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  hw/core/loader.c            | 53 +++++++++++++++++++++++++------------
>  hw/core/machine-qmp-cmds.c  |  1 +
>  include/qapi/type-helpers.h | 14 ++++++++++
>  qapi/common.json            | 11 ++++++++
>  qapi/machine.json           | 12 +++++++++
>  qapi/meson.build            |  3 +++
>  qapi/qapi-type-helpers.c    | 23 ++++++++++++++++
>  7 files changed, 100 insertions(+), 17 deletions(-)
>  create mode 100644 include/qapi/type-helpers.h
>  create mode 100644 qapi/qapi-type-helpers.c
> 
> diff --git a/hw/core/loader.c b/hw/core/loader.c
> index c623318b73..5ebdca3087 100644
> --- a/hw/core/loader.c
> +++ b/hw/core/loader.c
> @@ -46,6 +46,8 @@
>  #include "qemu-common.h"
>  #include "qemu/datadir.h"
>  #include "qapi/error.h"
> +#include "qapi/qapi-commands-machine.h"
> +#include "qapi/type-helpers.h"
>  #include "trace.h"
>  #include "hw/hw.h"
>  #include "disas/disas.h"
> @@ -1472,32 +1474,49 @@ void *rom_ptr_for_as(AddressSpace *as, hwaddr addr, size_t size)
>      return cbdata.rom;
>  }
>  
> -void hmp_info_roms(Monitor *mon, const QDict *qdict)
> +HumanReadableText *qmp_x_query_roms(Error **errp)
>  {
>      Rom *rom;
> +    g_autoptr(GString) buf = g_string_new("");
>  
>      QTAILQ_FOREACH(rom, &roms, next) {
>          if (rom->mr) {
> -            monitor_printf(mon, "%s"
> -                           " size=0x%06zx name=\"%s\"\n",
> -                           memory_region_name(rom->mr),
> -                           rom->romsize,
> -                           rom->name);
> +            g_string_append_printf(buf, "%s"
> +                                   " size=0x%06zx name=\"%s\"\n",
> +                                   memory_region_name(rom->mr),
> +                                   rom->romsize,
> +                                   rom->name);
>          } else if (!rom->fw_file) {
> -            monitor_printf(mon, "addr=" TARGET_FMT_plx
> -                           " size=0x%06zx mem=%s name=\"%s\"\n",
> -                           rom->addr, rom->romsize,
> -                           rom->isrom ? "rom" : "ram",
> -                           rom->name);
> +            g_string_append_printf(buf, "addr=" TARGET_FMT_plx
> +                                   " size=0x%06zx mem=%s name=\"%s\"\n",
> +                                   rom->addr, rom->romsize,
> +                                   rom->isrom ? "rom" : "ram",
> +                                   rom->name);
>          } else {
> -            monitor_printf(mon, "fw=%s/%s"
> -                           " size=0x%06zx name=\"%s\"\n",
> -                           rom->fw_dir,
> -                           rom->fw_file,
> -                           rom->romsize,
> -                           rom->name);
> +            g_string_append_printf(buf, "fw=%s/%s"
> +                                   " size=0x%06zx name=\"%s\"\n",
> +                                   rom->fw_dir,
> +                                   rom->fw_file,
> +                                   rom->romsize,
> +                                   rom->name);
>          }
>      }
> +
> +    return human_readable_text_from_str(buf);
> +}
> +
> +
> +void hmp_info_roms(Monitor *mon, const QDict *qdict)
> +{
> +    Error *err = NULL;
> +    g_autoptr(HumanReadableText) info = qmp_x_query_roms(&err);
> +
> +    if (err) {
> +        error_report_err(err);
> +        return;
> +    }
> +
> +    monitor_printf(mon, "%s", info->human_readable_text);

This is getting copied in each one of these; it looks like you need
either:
  a) A helper function like:
       void hmp_info_from_qmp(Monitor *mon, HumanReadableText *(void)func) 
       {
           ...
       }

  b) Or teach the hmp parser to do the calls?

Dave

>  }
>  
>  typedef enum HexRecord HexRecord;
> diff --git a/hw/core/machine-qmp-cmds.c b/hw/core/machine-qmp-cmds.c
> index 216fdfaf3a..76f2b84d81 100644
> --- a/hw/core/machine-qmp-cmds.c
> +++ b/hw/core/machine-qmp-cmds.c
> @@ -15,6 +15,7 @@
>  #include "qapi/qmp/qerror.h"
>  #include "qapi/qmp/qobject.h"
>  #include "qapi/qobject-input-visitor.h"
> +#include "qapi/type-helpers.h"
>  #include "qemu/main-loop.h"
>  #include "qom/qom-qobject.h"
>  #include "sysemu/hostmem.h"
> diff --git a/include/qapi/type-helpers.h b/include/qapi/type-helpers.h
> new file mode 100644
> index 0000000000..be1f181526
> --- /dev/null
> +++ b/include/qapi/type-helpers.h
> @@ -0,0 +1,14 @@
> +/*
> + * QAPI common helper functions
> + *
> + * This file provides helper functions related to types defined
> + * in the QAPI schema.
> + *
> + * This work is licensed under the terms of the GNU LGPL, version 2.1 or later.
> + * See the COPYING.LIB file in the top-level directory.
> + *
> + */
> +
> +#include "qapi/qapi-types-common.h"
> +
> +HumanReadableText *human_readable_text_from_str(GString *str);
> diff --git a/qapi/common.json b/qapi/common.json
> index 7c976296f0..412cc4f5ae 100644
> --- a/qapi/common.json
> +++ b/qapi/common.json
> @@ -197,3 +197,14 @@
>  { 'enum': 'GrabToggleKeys',
>    'data': [ 'ctrl-ctrl', 'alt-alt', 'shift-shift','meta-meta', 'scrolllock',
>              'ctrl-scrolllock' ] }
> +
> +##
> +# @HumanReadableText:
> +#
> +# @human-readable-text: Formatted output intended for humans.
> +#
> +# Since: 6.2
> +#
> +##
> +{ 'struct': 'HumanReadableText',
> +  'data': { 'human-readable-text': 'str' } }
> diff --git a/qapi/machine.json b/qapi/machine.json
> index 32d47f4e35..4c18904521 100644
> --- a/qapi/machine.json
> +++ b/qapi/machine.json
> @@ -1346,3 +1346,15 @@
>       '*cores': 'int',
>       '*threads': 'int',
>       '*maxcpus': 'int' } }
> +
> +##
> +# @x-query-roms:
> +#
> +# Query information on the registered ROMS
> +#
> +# Returns: registered ROMs
> +#
> +# Since: 6.2
> +##
> +{ 'command': 'x-query-roms',
> +  'returns': 'HumanReadableText' }
> diff --git a/qapi/meson.build b/qapi/meson.build
> index c356a385e3..c0c49c15e4 100644
> --- a/qapi/meson.build
> +++ b/qapi/meson.build
> @@ -10,6 +10,9 @@ util_ss.add(files(
>    'string-input-visitor.c',
>    'string-output-visitor.c',
>  ))
> +if have_system
> +  util_ss.add(files('qapi-type-helpers.c'))
> +endif
>  if have_system or have_tools
>    util_ss.add(files(
>      'qmp-dispatch.c',
> diff --git a/qapi/qapi-type-helpers.c b/qapi/qapi-type-helpers.c
> new file mode 100644
> index 0000000000..f76b34f647
> --- /dev/null
> +++ b/qapi/qapi-type-helpers.c
> @@ -0,0 +1,23 @@
> +/*
> + * QAPI common helper functions
> + *
> + * This file provides helper functions related to types defined
> + * in the QAPI schema.
> + *
> + * This work is licensed under the terms of the GNU LGPL, version 2.1 or later.
> + * See the COPYING.LIB file in the top-level directory.
> + *
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qapi/error.h"
> +#include "qapi/type-helpers.h"
> +
> +HumanReadableText *human_readable_text_from_str(GString *str)
> +{
> +    HumanReadableText *ret = g_new0(HumanReadableText, 1);
> +
> +    ret->human_readable_text = g_steal_pointer(&str->str);
> +
> +    return ret;
> +}
> -- 
> 2.31.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


