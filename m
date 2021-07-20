Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 531133CFA71
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 15:21:52 +0200 (CEST)
Received: from localhost ([::1]:60452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5ph1-0004Nj-BR
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 09:21:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1m5per-0001s4-Eu
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 09:19:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41922)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1m5pep-0005jY-Qg
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 09:19:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626787175;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Zc9iqI5zkboXBbkSjnFG/5kMqHqpuiW7I8dOK0P6AT4=;
 b=IMXnPZcFH/3plDCWf+ooLQqWGfaJTAtozIkrPEuOywmbaPlzBm6wGv0RAic6lBh+3hueEB
 6CritoDjuQwSNhD7oVN/hdJCJVy7q9rPDP6UXie0aWW1Sh++BMFcU4LtU6Qu+HQ06kAyAN
 Ycdgoh8gOu4B6o36GfJLNPuEWo8TkLg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-588-Z0lzfV2MONGIVw99RoZxfg-1; Tue, 20 Jul 2021 09:19:32 -0400
X-MC-Unique: Z0lzfV2MONGIVw99RoZxfg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F1E5E9F92E;
 Tue, 20 Jul 2021 13:19:30 +0000 (UTC)
Received: from localhost (unknown [10.43.2.75])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 441C360C82;
 Tue, 20 Jul 2021 13:19:25 +0000 (UTC)
Date: Tue, 20 Jul 2021 15:19:24 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eric DeVolder <eric.devolder@oracle.com>
Subject: Re: [PATCH v5 08/10] ACPI ERST: create ACPI ERST table for pc/x86
 machines.
Message-ID: <20210720151924.2eb89d31@redhat.com>
In-Reply-To: <1625080041-29010-9-git-send-email-eric.devolder@oracle.com>
References: <1625080041-29010-1-git-send-email-eric.devolder@oracle.com>
 <1625080041-29010-9-git-send-email-eric.devolder@oracle.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: ehabkost@redhat.com, mst@redhat.com, konrad.wilk@oracle.com,
 qemu-devel@nongnu.org, pbonzini@redhat.com, boris.ostrovsky@oracle.com,
 rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 30 Jun 2021 15:07:19 -0400
Eric DeVolder <eric.devolder@oracle.com> wrote:

> This change exposes ACPI ERST support for x86 guests.
> 
> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
looks good to me, maybe move find_erst_dev() impl. here as well
if it's the patch it's first used.

> ---
>  hw/i386/acpi-build.c   | 9 +++++++++
>  hw/i386/acpi-microvm.c | 9 +++++++++
>  2 files changed, 18 insertions(+)
> 
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index de98750..d2026cc 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -43,6 +43,7 @@
>  #include "sysemu/tpm.h"
>  #include "hw/acpi/tpm.h"
>  #include "hw/acpi/vmgenid.h"
> +#include "hw/acpi/erst.h"
>  #include "hw/boards.h"
>  #include "sysemu/tpm_backend.h"
>  #include "hw/rtc/mc146818rtc_regs.h"
> @@ -2327,6 +2328,7 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
>      GArray *tables_blob = tables->table_data;
>      AcpiSlicOem slic_oem = { .id = NULL, .table_id = NULL };
>      Object *vmgenid_dev;
> +    Object *erst_dev;
>      char *oem_id;
>      char *oem_table_id;
>  
> @@ -2388,6 +2390,13 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
>                      ACPI_DEVICE_IF(x86ms->acpi_dev), x86ms->oem_id,
>                      x86ms->oem_table_id);
>  
> +    erst_dev = find_erst_dev();
> +    if (erst_dev) {
> +        acpi_add_table(table_offsets, tables_blob);
> +        build_erst(tables_blob, tables->linker, erst_dev,
> +                   x86ms->oem_id, x86ms->oem_table_id);
> +    }
> +
>      vmgenid_dev = find_vmgenid_dev();
>      if (vmgenid_dev) {
>          acpi_add_table(table_offsets, tables_blob);
> diff --git a/hw/i386/acpi-microvm.c b/hw/i386/acpi-microvm.c
> index ccd3303..0099b13 100644
> --- a/hw/i386/acpi-microvm.c
> +++ b/hw/i386/acpi-microvm.c
> @@ -30,6 +30,7 @@
>  #include "hw/acpi/bios-linker-loader.h"
>  #include "hw/acpi/generic_event_device.h"
>  #include "hw/acpi/utils.h"
> +#include "hw/acpi/erst.h"
>  #include "hw/boards.h"
>  #include "hw/i386/fw_cfg.h"
>  #include "hw/i386/microvm.h"
> @@ -160,6 +161,7 @@ static void acpi_build_microvm(AcpiBuildTables *tables,
>      X86MachineState *x86ms = X86_MACHINE(mms);
>      GArray *table_offsets;
>      GArray *tables_blob = tables->table_data;
> +    Object *erst_dev;
>      unsigned dsdt, xsdt;
>      AcpiFadtData pmfadt = {
>          /* ACPI 5.0: 4.1 Hardware-Reduced ACPI */
> @@ -209,6 +211,13 @@ static void acpi_build_microvm(AcpiBuildTables *tables,
>                      ACPI_DEVICE_IF(x86ms->acpi_dev), x86ms->oem_id,
>                      x86ms->oem_table_id);
>  
> +    erst_dev = find_erst_dev();
> +    if (erst_dev) {
> +        acpi_add_table(table_offsets, tables_blob);
> +        build_erst(tables_blob, tables->linker, erst_dev,
> +                   x86ms->oem_id, x86ms->oem_table_id);
> +    }
> +
>      xsdt = tables_blob->len;
>      build_xsdt(tables_blob, tables->linker, table_offsets, x86ms->oem_id,
>                 x86ms->oem_table_id);


