Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03678327F13
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 14:11:56 +0100 (CET)
Received: from localhost ([::1]:46074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGiL5-0001U1-1D
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 08:11:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1lGiKL-000142-CL
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 08:11:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1lGiKJ-0007YJ-Ph
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 08:11:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614604266;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wRoZpjDVbOAbA51Nzq1S8PSHm8ccyJBx0mUvARZeyoM=;
 b=WC4oSo5WibeDMQc/Spr9sqiEeAEEobQ35DSMwCTbpUyetufn0GO+hun8vJJaNkNzNSVdJB
 b+LVNw1RMtZBwVsAtIbgZ5QxLMQZQ2+GcbzHKbmwfYd38ZmPwFSQmmPSMCRoJhdmEHT5kJ
 rIFhlnc4Q6VqgIXizevxR09cFupFub4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-201-hO1GzXHHPxWxjqyOLpHocA-1; Mon, 01 Mar 2021 08:11:05 -0500
X-MC-Unique: hO1GzXHHPxWxjqyOLpHocA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9451D107ACC7
 for <qemu-devel@nongnu.org>; Mon,  1 Mar 2021 13:11:04 +0000 (UTC)
Received: from starship (unknown [10.35.206.26])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BCFA05C1C4;
 Mon,  1 Mar 2021 13:11:03 +0000 (UTC)
Message-ID: <f2dd45dceb0efe081b1750909ccffeab8f9924b8.camel@redhat.com>
Subject: Re: [PATCH] KVM: x86: deprecate -M kernel-irqchip=off except for -M
 isapc
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Date: Mon, 01 Mar 2021 15:11:02 +0200
In-Reply-To: <20210301111725.18434-2-pbonzini@redhat.com>
References: <20210301111725.18434-2-pbonzini@redhat.com>
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlevitsk@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mlevitsk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 2021-03-01 at 12:17 +0100, Paolo Bonzini wrote:
> The userspace local APIC is basically untested and does not support many
> features such as TSC deadline timer, x2APIC or PV spinlocks.  On the
> other hand, the PIT and IOAPIC are okay as they are not tied to
> the processor and are tested with -M kernel-irqchip=split.
> 
> Therefore, deprecate the local APIC and, with it, limit
> -M kernel-irqchip=off to the ISA PC machine type, which does not
> have a local APIC at all.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>

Best regards,
	Maxim Levitsky

> ---
>  docs/system/deprecated.rst | 7 +++++++
>  hw/intc/apic.c             | 5 +++++
>  2 files changed, 12 insertions(+)
> 
> diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
> index 561c916da2..ae180dc887 100644
> --- a/docs/system/deprecated.rst
> +++ b/docs/system/deprecated.rst
> @@ -153,6 +153,13 @@ The ``-writeconfig`` option is not able to serialize the entire contents
>  of the QEMU command line.  It is thus considered a failed experiment
>  and deprecated, with no current replacement.
>  
> +Userspace local APIC with KVM (x86, since 6.0)
> +'''''''''''''''''''''''''''''''''''''''''
> +
> +Using ``-M kernel-irqchip=off`` with x86 machine types that include a local
> +APIC is deprecated.  The ``split`` setting is supported, as is using
> +``-M kernel-irqchip=off`` with the ISA PC machine type.
> +
>  QEMU Machine Protocol (QMP) commands
>  ------------------------------------
>  
> diff --git a/hw/intc/apic.c b/hw/intc/apic.c
> index 3ada22f427..7e9601b89d 100644
> --- a/hw/intc/apic.c
> +++ b/hw/intc/apic.c
> @@ -875,6 +875,11 @@ static void apic_realize(DeviceState *dev, Error **errp)
>          return;
>      }
>  
> +    if (kvm_enabled()) {
> +        warn_report("Userspace local APIC is deprecated for KVM.");
> +        warn_report("Do not use kernel-irqchip except for the -M isapc machine type.");
> +    }
> +
>      memory_region_init_io(&s->io_memory, OBJECT(s), &apic_io_ops, s, "apic-msi",
>                            APIC_SPACE_SIZE);
>  



