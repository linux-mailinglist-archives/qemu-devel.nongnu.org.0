Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0187E1C5AF9
	for <lists+qemu-devel@lfdr.de>; Tue,  5 May 2020 17:23:56 +0200 (CEST)
Received: from localhost ([::1]:60110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jVzQJ-00069H-1n
	for lists+qemu-devel@lfdr.de; Tue, 05 May 2020 11:23:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1jVzPP-0005hc-O7
 for qemu-devel@nongnu.org; Tue, 05 May 2020 11:22:59 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:57133
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1jVzPO-0005YX-UF
 for qemu-devel@nongnu.org; Tue, 05 May 2020 11:22:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588692177;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=udu9YjlXQwXvgq093bxW3P1jJOiLZ4eVV1osHESK+dM=;
 b=KB0RsJHBQ1CTcG/r4rg6C+GreLfOhD8hfS7RLyNL3S+VKSccaI1CwJ53WrPrmXgHdcYOok
 RaUtKLJFfGoEnoEr5VHAzFECa/Gg2IantuMp/oGWnUlVCvZszR1OhDsLbBp4m9vqhAynaj
 01SfPm/wSZnqmpMB7wX9kejuWDndN5g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-242-GT-O4w_NPoOKaPWr8HMHPg-1; Tue, 05 May 2020 11:22:55 -0400
X-MC-Unique: GT-O4w_NPoOKaPWr8HMHPg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DAC3E107ACF3;
 Tue,  5 May 2020 15:22:54 +0000 (UTC)
Received: from localhost (unknown [10.40.208.7])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AF1CA5D9D5;
 Tue,  5 May 2020 15:22:39 +0000 (UTC)
Date: Tue, 5 May 2020 17:22:38 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v2 10/13] microvm: disable virtio-mmio cmdline hack
Message-ID: <20200505172238.6bbaeb9b@redhat.com>
In-Reply-To: <20200505134305.22666-11-kraxel@redhat.com>
References: <20200505134305.22666-1-kraxel@redhat.com>
 <20200505134305.22666-11-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/05 00:37:40
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue,  5 May 2020 15:43:02 +0200
Gerd Hoffmann <kraxel@redhat.com> wrote:

> ... in case we are using ACPI.
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/i386/microvm.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c
> index 6ba2d9d3f028..a3708fdf1e39 100644
> --- a/hw/i386/microvm.c
> +++ b/hw/i386/microvm.c
> @@ -369,7 +369,8 @@ static void microvm_machine_reset(MachineState *machine)
>      CPUState *cs;
>      X86CPU *cpu;
>  
> -    if (machine->kernel_filename != NULL &&
> +    if (!x86_machine_is_acpi_enabled(X86_MACHINE(machine)) &&
> +        machine->kernel_filename != NULL &&
>          mms->auto_kernel_cmdline && !mms->kernel_cmdline_fixed) {
>          microvm_fix_kernel_cmdline(machine);
>          mms->kernel_cmdline_fixed = true;


