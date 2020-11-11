Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C78F32AF0E9
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 13:40:53 +0100 (CET)
Received: from localhost ([::1]:59510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcpQi-0004As-R8
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 07:40:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kcpOF-00034z-QI
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 07:38:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21332)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kcpO9-0007gh-7j
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 07:38:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605098291;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9MA7f/mVdcVt1gC4dfE1qUjIZiWHtO3ZEnmv5kq8Q4Y=;
 b=hUsOxAXuZKMepgp4mEnNciuKejX4yyCLu4wNl4GdEJj5VctKgkhII+tKvjlGnUqyvLYrY4
 hzX5J7CFVJQoth1QyB1chswvRzxZZuB+E0P/yRWuuh+sMqnnWJvODF5F2KyZ4fZKdhoy+b
 1P+JQh3kwy5pqvXFSYxhnKzgl1g6pdM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-109-YzcQ-4DfNAm0DUUDYn0JrQ-1; Wed, 11 Nov 2020 07:38:10 -0500
X-MC-Unique: YzcQ-4DfNAm0DUUDYn0JrQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2C24C801F9A;
 Wed, 11 Nov 2020 12:38:09 +0000 (UTC)
Received: from localhost (unknown [10.40.208.29])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 456756EF4A;
 Wed, 11 Nov 2020 12:37:55 +0000 (UTC)
Date: Wed, 11 Nov 2020 13:37:54 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v2 04/12] microvm: make number of virtio transports
 runtime configurable
Message-ID: <20201111133754.62184836@redhat.com>
In-Reply-To: <20201105133923.23821-5-kraxel@redhat.com>
References: <20201105133923.23821-1-kraxel@redhat.com>
 <20201105133923.23821-5-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 01:49:01
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu,  5 Nov 2020 14:39:15 +0100
Gerd Hoffmann <kraxel@redhat.com> wrote:

"runtime configurable" I read as being able to change during VM life cycle,
which isn't the case here, nor this patch makes it actually configurable.

So perhaps it needs to be renamed and a commit message explaining why
dropping  macro and adding a field with hardcoded value is necessary.

> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  include/hw/i386/microvm.h | 2 +-
>  hw/i386/microvm.c         | 9 +++++++--
>  2 files changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/include/hw/i386/microvm.h b/include/hw/i386/microvm.h
> index 0fc216007777..c5d60bacb5e8 100644
> --- a/include/hw/i386/microvm.h
> +++ b/include/hw/i386/microvm.h
> @@ -52,7 +52,6 @@
>  
>  /* Platform virtio definitions */
>  #define VIRTIO_MMIO_BASE      0xfeb00000
> -#define VIRTIO_NUM_TRANSPORTS 8
>  #define VIRTIO_CMDLINE_MAXLEN 64
>  
>  #define GED_MMIO_BASE         0xfea00000
> @@ -98,6 +97,7 @@ struct MicrovmMachineState {
>  
>      /* Machine state */
>      uint32_t virtio_irq_base;
> +    uint32_t virtio_num_transports;
>      bool kernel_cmdline_fixed;
>      Notifier machine_done;
>      Notifier powerdown_req;
> diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c
> index 5428448b7059..e92f236bf442 100644
> --- a/hw/i386/microvm.c
> +++ b/hw/i386/microvm.c
> @@ -178,8 +178,13 @@ static void microvm_devices_init(MicrovmMachineState *mms)
>  
>      kvmclock_create(true);
>  
> -    mms->virtio_irq_base = x86_machine_is_acpi_enabled(x86ms) ? 16 : 5;
> -    for (i = 0; i < VIRTIO_NUM_TRANSPORTS; i++) {
> +    mms->virtio_irq_base = 5;
> +    mms->virtio_num_transports = 8;
> +    if (x86_machine_is_acpi_enabled(x86ms)) {
> +        mms->virtio_irq_base = 16;
> +    }
> +
> +    for (i = 0; i < mms->virtio_num_transports; i++) {
>          sysbus_create_simple("virtio-mmio",
>                               VIRTIO_MMIO_BASE + i * 512,
>                               x86ms->gsi[mms->virtio_irq_base + i]);


