Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3327D589984
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 10:53:19 +0200 (CEST)
Received: from localhost ([::1]:36016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJWbV-0002UX-NT
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 04:53:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mcascell@redhat.com>)
 id 1oJWU4-00066U-6s
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 04:45:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23132)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mcascell@redhat.com>)
 id 1oJWU0-0007NF-Rj
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 04:45:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659602731;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=X19n08OwxJZEDTtP+rB3uc7NG/XYk6XXoElWglH9TwU=;
 b=PBMHyJyfKVuRYTQeM2UVash1tTTYSiQQ7DdeKagbUZbXEBfOLvI57DzmXcTrY7bU7UveE7
 AgAqrTpT1F2p9sQS/IgjsXYAte+p9/o5tFE4fRyQ25F4bkYkklbdiEtVbiX1tCN/NBcGIb
 bVoL4T8I+6F/iIEvx6xuD/xI8LWCkEk=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-131-GV_oHrF2Nk6dap7WXDI1Qg-1; Thu, 04 Aug 2022 04:45:29 -0400
X-MC-Unique: GV_oHrF2Nk6dap7WXDI1Qg-1
Received: by mail-yb1-f197.google.com with SMTP id
 m123-20020a253f81000000b0066ff6484995so15375769yba.22
 for <qemu-devel@nongnu.org>; Thu, 04 Aug 2022 01:45:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=X19n08OwxJZEDTtP+rB3uc7NG/XYk6XXoElWglH9TwU=;
 b=rn4EFIL+Gs0wEQTzIBQh8BATeQCdq8DRYwAe3bP+nBj3lg0S5p5/uwjJvZS3PsSN0g
 lmkZz9qGeo5iv0iHZEObFyso8pPscnKmk8Tdo3aMqNyvoIxQrLEJwvBYojzhOEozmZWR
 D8Zhu5ARx5frrEYbqm29tvFALmX4rs0Q/g6hoYawZMzpuqpZ0pPrebX2uV11YXKHqpeb
 8083kPB0WjAD04n2gBKhTJGtny39Kn/F9SIlku0HF2rBalav8lEwwgtPPAoEso3xFXfR
 b1oVRjfjOp+L7q6WzGnhI/egOQcRauzpzjwHiM/1HgWYidkwlEvRy7QyiSpHkwKbJOoZ
 1kMg==
X-Gm-Message-State: ACgBeo1L8zso1CIcXle9Sc+0MBkUyGNItFDAISBFFieK61vGQ0aNAJry
 IQ89CySOhCN4jtGohkmLAceZXQKI+0JsEvdGk20C2VKBlBL/2kHg3GGUJRLAqjE2xFnZKbaikv3
 31yyU/Zre+I7OK1aSfKYm/LeQbWTq+24=
X-Received: by 2002:a05:6902:154b:b0:676:de44:7af8 with SMTP id
 r11-20020a056902154b00b00676de447af8mr574370ybu.573.1659602729330; 
 Thu, 04 Aug 2022 01:45:29 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5i65oDSoxuq554iHojsa27Ix6YG38nCdII2fH9q7qSZJjGNmZXydOhdIq/RCbmXD/sxHESMX+mLdHWdedFDvA=
X-Received: by 2002:a05:6902:154b:b0:676:de44:7af8 with SMTP id
 r11-20020a056902154b00b00676de447af8mr574360ybu.573.1659602729098; Thu, 04
 Aug 2022 01:45:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220802134834.454749-1-thuth@redhat.com>
In-Reply-To: <20220802134834.454749-1-thuth@redhat.com>
From: Mauro Matteo Cascella <mcascell@redhat.com>
Date: Thu, 4 Aug 2022 10:45:18 +0200
Message-ID: <CAA8xKjUgU=KNbOYhXLkHdhMFLvxwv4rvnTZcLzMQw8TrB-bR6A@mail.gmail.com>
Subject: Re: [PATCH] hw/usb/hcd-xhci: Fix endless loop in case the DMA access
 fails (CVE-2020-14394)
To: Thomas Huth <thuth@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org, f4bug@amsat.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mcascell@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Tue, Aug 2, 2022 at 3:48 PM Thomas Huth <thuth@redhat.com> wrote:
>
> The XHCI code could enter an endless loop in case the guest points
> QEMU to fetch TRBs from invalid memory areas. Fix it by properly
> checking the return value of dma_memory_read().
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/646
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  hw/usb/hcd-xhci.c | 17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)
>
> diff --git a/hw/usb/hcd-xhci.c b/hw/usb/hcd-xhci.c
> index 296cc6c8e6..63d428a444 100644
> --- a/hw/usb/hcd-xhci.c
> +++ b/hw/usb/hcd-xhci.c
> @@ -21,6 +21,7 @@
>
>  #include "qemu/osdep.h"
>  #include "qemu/timer.h"
> +#include "qemu/log.h"
>  #include "qemu/module.h"
>  #include "qemu/queue.h"
>  #include "migration/vmstate.h"
> @@ -679,8 +680,12 @@ static TRBType xhci_ring_fetch(XHCIState *xhci, XHCIRing *ring, XHCITRB *trb,
>
>      while (1) {
>          TRBType type;
> -        dma_memory_read(xhci->as, ring->dequeue, trb, TRB_SIZE,
> -                        MEMTXATTRS_UNSPECIFIED);
> +        if (dma_memory_read(xhci->as, ring->dequeue, trb, TRB_SIZE,
> +                            MEMTXATTRS_UNSPECIFIED) != MEMTX_OK) {
> +            qemu_log_mask(LOG_GUEST_ERROR, "%s: DMA memory access failed!\n",
> +                          __func__);
> +            return 0;
> +        }
>          trb->addr = ring->dequeue;
>          trb->ccs = ring->ccs;
>          le64_to_cpus(&trb->parameter);
> @@ -727,8 +732,12 @@ static int xhci_ring_chain_length(XHCIState *xhci, const XHCIRing *ring)
>
>      while (1) {
>          TRBType type;
> -        dma_memory_read(xhci->as, dequeue, &trb, TRB_SIZE,
> -                        MEMTXATTRS_UNSPECIFIED);
> +        if (dma_memory_read(xhci->as, dequeue, &trb, TRB_SIZE,
> +                        MEMTXATTRS_UNSPECIFIED) != MEMTX_OK) {
> +            qemu_log_mask(LOG_GUEST_ERROR, "%s: DMA memory access failed!\n",
> +                          __func__);
> +            return -length;

Not strictly related to this issue, but what's the point of returning
-length instead of e.g. -1? Apart from that, LGTM. Thank you.

> +        }
>          le64_to_cpus(&trb.parameter);
>          le32_to_cpus(&trb.status);
>          le32_to_cpus(&trb.control);
> --
> 2.31.1
>

-- 
Mauro Matteo Cascella
Red Hat Product Security
PGP-Key ID: BB3410B0


