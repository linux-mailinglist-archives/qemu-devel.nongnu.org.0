Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B932AF112
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 13:42:53 +0100 (CET)
Received: from localhost ([::1]:35020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcpSe-0005sh-8N
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 07:42:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kcpP7-0003Ye-Ju
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 07:39:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:22933)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kcpP5-00080A-Tf
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 07:39:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605098350;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p27vSGN9xWATpHc6jkOF/AZMUwyIuyJFQrqcOsNAOi4=;
 b=OvImhpeaOuK4gvB09kHQe7iQCkxmyhBSpFGy+F/YYnrZDj1sShp2lK6deI3WvKLQ1E/htt
 7DJchwz0BReK10qUc054ZvjUvpgz0f/PG3rGViqeFz9vXUra3PiSTrlndnERr+nK31taCH
 rbGeISZFFLgAmHqYKvaCfItuNCrMDuo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-574-dbnWFbHNOzyPDExPvgrqPg-1; Wed, 11 Nov 2020 07:39:09 -0500
X-MC-Unique: dbnWFbHNOzyPDExPvgrqPg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0F30B803F51;
 Wed, 11 Nov 2020 12:39:08 +0000 (UTC)
Received: from localhost (unknown [10.40.208.29])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CD5BF55778;
 Wed, 11 Nov 2020 12:38:46 +0000 (UTC)
Date: Wed, 11 Nov 2020 13:38:45 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v2 06/12] microvm: drop microvm_gsi_handler()
Message-ID: <20201111133845.45fe0025@redhat.com>
In-Reply-To: <20201105133923.23821-7-kraxel@redhat.com>
References: <20201105133923.23821-1-kraxel@redhat.com>
 <20201105133923.23821-7-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 01:42:46
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

On Thu,  5 Nov 2020 14:39:17 +0100
Gerd Hoffmann <kraxel@redhat.com> wrote:

> With the improved gsi_handler() we don't need
> our private version any more.
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/i386/microvm.c | 14 +-------------
>  1 file changed, 1 insertion(+), 13 deletions(-)
> 
> diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c
> index 5e4182b47464..829b376a1278 100644
> --- a/hw/i386/microvm.c
> +++ b/hw/i386/microvm.c
> @@ -96,13 +96,6 @@ static void microvm_set_rtc(MicrovmMachineState *mms, ISADevice *s)
>      rtc_set_memory(s, 0x5d, val >> 16);
>  }
>  
> -static void microvm_gsi_handler(void *opaque, int n, int level)
> -{
> -    GSIState *s = opaque;
> -
> -    qemu_set_irq(s->ioapic_irq[n], level);
> -}
> -
>  static void create_gpex(MicrovmMachineState *mms)
>  {
>      X86MachineState *x86ms = X86_MACHINE(mms);
> @@ -163,12 +156,7 @@ static void microvm_devices_init(MicrovmMachineState *mms)
>      /* Core components */
>  
>      gsi_state = g_malloc0(sizeof(*gsi_state));
> -    if (mms->pic == ON_OFF_AUTO_ON || mms->pic == ON_OFF_AUTO_AUTO) {
> -        x86ms->gsi = qemu_allocate_irqs(gsi_handler, gsi_state, GSI_NUM_PINS);
> -    } else {
> -        x86ms->gsi = qemu_allocate_irqs(microvm_gsi_handler,
> -                                        gsi_state, GSI_NUM_PINS);
> -    }
> +    x86ms->gsi = qemu_allocate_irqs(gsi_handler, gsi_state, GSI_NUM_PINS);
>  
>      isa_bus = isa_bus_new(NULL, get_system_memory(), get_system_io(),
>                            &error_abort);


