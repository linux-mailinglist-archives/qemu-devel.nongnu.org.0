Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 439003AFD6B
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 08:53:04 +0200 (CEST)
Received: from localhost ([::1]:37084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvaHP-0004sc-6l
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 02:53:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lvaFZ-0003OO-MO
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 02:51:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44356)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lvaFY-0004gu-3T
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 02:51:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624344667;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jBEVk9DdCGQyDjz/O5MJ2mBgWkCFNohHNYx8FqSsjqo=;
 b=Wa9zlliU1DzlkXR/xaGt/wLVlBjLLAl+9TBk2pDve9qBQfpfo4RWosmOHDDCRYOsdMQ3ge
 rKZeJciKSziykLI8fChIQMaKQCNgBb+JKbJr/yszPCC+JSMRGmAVD8urWODZJNLOpx2raG
 M/bHv+W6hEyq7FWJ9HPjeg3Pngg+Fhw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-182-6NNiTVY1NN-N_k7wlWRcEQ-1; Tue, 22 Jun 2021 02:51:01 -0400
X-MC-Unique: 6NNiTVY1NN-N_k7wlWRcEQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9EA161922961;
 Tue, 22 Jun 2021 06:51:00 +0000 (UTC)
Received: from localhost (unknown [10.43.2.75])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9FD225F714;
 Tue, 22 Jun 2021 06:50:55 +0000 (UTC)
Date: Tue, 22 Jun 2021 08:50:54 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eric DeVolder <eric.devolder@oracle.com>
Subject: Re: [PATCH v4 4/6] ACPI ERST: create ACPI ERST table for pc/x86
 machines.
Message-ID: <20210622085054.19ae302f@redhat.com>
In-Reply-To: <1623436283-20213-5-git-send-email-eric.devolder@oracle.com>
References: <1623436283-20213-1-git-send-email-eric.devolder@oracle.com>
 <1623436283-20213-5-git-send-email-eric.devolder@oracle.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
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

On Fri, 11 Jun 2021 14:31:21 -0400
Eric DeVolder <eric.devolder@oracle.com> wrote:

> This change exposes ACPI ERST support for x86 guests.
> 
> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
> ---
>  hw/i386/acpi-build.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index de98750..d8cae69 100644
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
> @@ -2388,6 +2389,10 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
>                      ACPI_DEVICE_IF(x86ms->acpi_dev), x86ms->oem_id,
>                      x86ms->oem_table_id);
>  

> +    acpi_add_table(table_offsets, tables_blob);
> +    build_erst(tables_blob, tables->linker,
> +               x86ms->oem_id, x86ms->oem_table_id);
it should be conditional an included only if erst device is present


>      vmgenid_dev = find_vmgenid_dev();
you can use this as an example of doing above

>      if (vmgenid_dev) {
>          acpi_add_table(table_offsets, tables_blob);


