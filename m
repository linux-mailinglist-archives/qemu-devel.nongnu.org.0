Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F5151DC9CD
	for <lists+qemu-devel@lfdr.de>; Thu, 21 May 2020 11:17:47 +0200 (CEST)
Received: from localhost ([::1]:53384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jbhKk-000669-3n
	for lists+qemu-devel@lfdr.de; Thu, 21 May 2020 05:17:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1jbhHy-0002F4-GB
 for qemu-devel@nongnu.org; Thu, 21 May 2020 05:14:54 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:28688
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1jbhHx-0005ds-Pb
 for qemu-devel@nongnu.org; Thu, 21 May 2020 05:14:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590052493;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pAQcFfvmbFo2T0FcP6sN6SJ7IPjBqdn/kotVhvFayU4=;
 b=AdamYWQh0f8DMIAT2bYyW8UiRTlipDaeEVy4pIBjCnpL3BAMF/VzMF1s3nVBS3IrUGv+Y4
 peXaSKW3oWrYGN3N1QNG6Rx++Ej+RB1zZcQVUChs4w1doYVLFcRc1h6tWcMql8Vfy7Mr7l
 XJFO8TsxZu8VKurOHFYSFwDzQAb6NNo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-327-YjhYg8QNNbG64tldmum13Q-1; Thu, 21 May 2020 05:14:50 -0400
X-MC-Unique: YjhYg8QNNbG64tldmum13Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 83DD58018A2;
 Thu, 21 May 2020 09:14:49 +0000 (UTC)
Received: from localhost (unknown [10.40.208.12])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6A4EC6E71B;
 Thu, 21 May 2020 09:14:37 +0000 (UTC)
Date: Thu, 21 May 2020 11:14:36 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v3 14/22] microvm: use 2G split unconditionally
Message-ID: <20200521111436.5c742fde@redhat.com>
In-Reply-To: <20200520132003.9492-15-kraxel@redhat.com>
References: <20200520132003.9492-1-kraxel@redhat.com>
 <20200520132003.9492-15-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/21 04:44:45
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 20 May 2020 15:19:55 +0200
Gerd Hoffmann <kraxel@redhat.com> wrote:

> Looks like the logiv was copied over from q35.
> 
> q35 does this for backward compatibility, there is no reason to do this
> on microvm though.  So split @ 2G unconditionally.
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/i386/microvm.c | 16 +---------------
>  1 file changed, 1 insertion(+), 15 deletions(-)
> 
> diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c
> index 867d3d652145..b8f0d3283758 100644
> --- a/hw/i386/microvm.c
> +++ b/hw/i386/microvm.c
> @@ -170,23 +170,9 @@ static void microvm_memory_init(MicrovmMachineState *mms)
>      MemoryRegion *ram_below_4g, *ram_above_4g;
>      MemoryRegion *system_memory = get_system_memory();
>      FWCfgState *fw_cfg;
> -    ram_addr_t lowmem;
> +    ram_addr_t lowmem = 0x80000000; /* 2G */
>      int i;
>  
> -    /*
> -     * Check whether RAM fits below 4G (leaving 1/2 GByte for IO memory
> -     * and 256 Mbytes for PCI Express Enhanced Configuration Access Mapping
> -     * also known as MMCFG).
> -     * If it doesn't, we need to split it in chunks below and above 4G.
> -     * In any case, try to make sure that guest addresses aligned at
> -     * 1G boundaries get mapped to host addresses aligned at 1G boundaries.
> -     */
> -    if (machine->ram_size >= 0xb0000000) {
> -        lowmem = 0x80000000;
> -    } else {
> -        lowmem = 0xb0000000;
> -    }
> -
>      /*
>       * Handle the machine opt max-ram-below-4g.  It is basically doing
>       * min(qemu limit, user limit).


