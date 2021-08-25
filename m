Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B32C73F74E2
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 14:16:26 +0200 (CEST)
Received: from localhost ([::1]:58650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIrpM-00052M-No
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 08:16:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mIrni-0004Bu-0N
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 08:14:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mIrnf-0006Km-E6
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 08:14:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629893674;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SFLE4u4soFXuATf6NHszDCCbm210Ova4OqQWCafOD5Y=;
 b=XZPG5z3sJ2OhBjzkzKrPqcPNxs8WtbvIu2T4+1KyZjzGnCZOoRGlFVP9iIeXSrfAU/el9C
 loBCT7vtTntkAlO5PfdYib7H+W2KSPTfudevWNUjOrmSu4UJGctvhRahXdk30vyOipst5x
 9E0r8uOAVIBG5mNiSgoVxj2Mxd/KyvU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-163--voso9_aMPKqtv66rjA4Bg-1; Wed, 25 Aug 2021 08:14:33 -0400
X-MC-Unique: -voso9_aMPKqtv66rjA4Bg-1
Received: by mail-wm1-f71.google.com with SMTP id
 j135-20020a1c238d000000b002e87aa95b5aso1954462wmj.4
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 05:14:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SFLE4u4soFXuATf6NHszDCCbm210Ova4OqQWCafOD5Y=;
 b=c+0OrTf0GTi4/nTsdoz6yyfxO0JobVBimbZy3KtfExU+w/Cn1wf23DN2i2FggxN+JJ
 5Bhvj7hX2l1jS+q4zWculr3ZwfbEgTp8H4XWbZi3I4kw3ObjsMb+KkDpA0iCwFB4keHl
 6CPFe9xcBF9KvKgvR3+axXmmVMtNV/d44TI+bL1a3H/LFW59K3KrOCMao/S8CikCqLjd
 NnkYeGfloObhU/4E2wXh5swnGz/DzjUP3FNMxP6qtDVcxO49W6DfE5Uy5izO8qHjGRgR
 nI2MGYsU+is70M8zsB5ow6WS+RxVejnP/J1zWfHs91LrefuavZH5K2kxaOl49jM9xag/
 LJ8A==
X-Gm-Message-State: AOAM531FrkFcCQBLaIIY5J6hCyDwQIUgBgpK8Z3hHbV2/jA92pMAMKFk
 48N2hh4sXWa5mr7fe/OiIqtY/AAglu/SqSSlZVA3SYwulW45Qe0OO4zn8EJV7uWyrrveHkpCGA8
 RfKKl4hWOF3Oo4LY=
X-Received: by 2002:a05:600c:206:: with SMTP id
 6mr8922264wmi.178.1629893672091; 
 Wed, 25 Aug 2021 05:14:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyjF1UASvwBKVWmmN1XDQXR1GG65qRWEfSd2cc8p9lLFEaVluS9L0pF+dxBCCvxnXOHED1rOw==
X-Received: by 2002:a05:600c:206:: with SMTP id
 6mr8922251wmi.178.1629893671924; 
 Wed, 25 Aug 2021 05:14:31 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id l2sm5933429wmi.1.2021.08.25.05.14.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 05:14:31 -0700 (PDT)
Date: Wed, 25 Aug 2021 14:14:30 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v7 7/7] memory_hotplug.c: send DEVICE_UNPLUG_GUEST_ERROR
 in acpi_memory_hotplug_write()
Message-ID: <20210825141430.54b3a607@redhat.com>
In-Reply-To: <20210825004835.472919-8-danielhb413@gmail.com>
References: <20210825004835.472919-1-danielhb413@gmail.com>
 <20210825004835.472919-8-danielhb413@gmail.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.745,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: "Michael S . Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 armbru@redhat.com, groug@kaod.org, qemu-ppc@nongnu.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 24 Aug 2021 21:48:35 -0300
Daniel Henrique Barboza <danielhb413@gmail.com> wrote:

> MEM_UNPLUG_ERROR is deprecated since the introduction of
> DEVICE_UNPLUG_GUEST_ERROR. Keep emitting both while the deprecation of
> MEM_UNPLUG_ERROR is pending.
> 
> CC: Michael S. Tsirkin <mst@redhat.com>
> CC: Igor Mammedov <imammedo@redhat.com>
> Reviewed-by: Greg Kurz <groug@kaod.org>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/acpi/memory_hotplug.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/hw/acpi/memory_hotplug.c b/hw/acpi/memory_hotplug.c
> index 6a71de408b..d0fffcf787 100644
> --- a/hw/acpi/memory_hotplug.c
> +++ b/hw/acpi/memory_hotplug.c
> @@ -8,6 +8,7 @@
>  #include "qapi/error.h"
>  #include "qapi/qapi-events-acpi.h"
>  #include "qapi/qapi-events-machine.h"
> +#include "qapi/qapi-events-qdev.h"
>  
>  #define MEMORY_SLOTS_NUMBER          "MDNR"
>  #define MEMORY_HOTPLUG_IO_REGION     "HPMR"
> @@ -178,8 +179,16 @@ static void acpi_memory_hotplug_write(void *opaque, hwaddr addr, uint64_t data,
>              hotplug_handler_unplug(hotplug_ctrl, dev, &local_err);
>              if (local_err) {
>                  trace_mhp_acpi_pc_dimm_delete_failed(mem_st->selector);
> +
> +                /*
> +                 * Send both MEM_UNPLUG_ERROR and DEVICE_UNPLUG_GUEST_ERROR
> +                 * while the deprecation of MEM_UNPLUG_ERROR is
> +                 * pending.
> +                 */
>                  qapi_event_send_mem_unplug_error(dev->id ? : "",
>                                                   error_get_pretty(local_err));
> +                qapi_event_send_device_unplug_guest_error(!!dev->id, dev->id,
> +                                                          dev->canonical_path);
>                  error_free(local_err);
>                  break;
>              }


