Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C330C58A8CA
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 11:27:18 +0200 (CEST)
Received: from localhost ([::1]:49528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJtbx-0007q8-Se
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 05:27:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mcascell@redhat.com>)
 id 1oJtXu-0004Eh-5v
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 05:23:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48036)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mcascell@redhat.com>)
 id 1oJtXr-00079D-8m
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 05:23:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659691382;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=U2P4kM+/lF2nXLhe9I5zpKnzu8BUlCqXRG7t13NOUuY=;
 b=TmoXlYsxS4myq72RpUWtbu+e4ZFKpdI3nE3G91ms7ynPtHpmkoPD2WqSS+efOfWAxK/mvY
 /LxRygEy5i0enAFKIgk2IrSYzEeycfzBacP/6Ve34Rmapcz5Et7Dde9PrinaPyqCPn+gsC
 YNMrwOllZPTG256s5Z5/xvll0BT4K3U=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-478-DSHByppwNw-SdS3j0tG7lg-1; Fri, 05 Aug 2022 05:23:01 -0400
X-MC-Unique: DSHByppwNw-SdS3j0tG7lg-1
Received: by mail-yb1-f197.google.com with SMTP id
 r4-20020a259a44000000b006775138624fso1612020ybo.23
 for <qemu-devel@nongnu.org>; Fri, 05 Aug 2022 02:23:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=U2P4kM+/lF2nXLhe9I5zpKnzu8BUlCqXRG7t13NOUuY=;
 b=2iDwd4M0UDH2sJsGm7nQcaB/0YYguB13Qkhkc4/47JJP4yLsml+qSyK1s0CEXyBXhl
 sjMhgZa5q9SIjHcMaNO+cMIjIKcrXFXDWIYT1dGmhX5xnFmVkW7gGDztwr+8h/45qQ+o
 hsH8o8/NHzXA33nZDFUN0+YhV1b2GYRlAmPYM063SLxumLOwgArKfh80qs8eZtRguOx6
 bTK5DHvAL5BgADTKUgmZiUDslRbOFLEQhJGvJUhNc8qAjaW9Bllh6tvGofuQodgR2IqG
 +55nCWpG15L5mCaqHkC74V7zvhY+OwA8LeMVUh70ObNY8XI+StmjYDvOMpKKmK5Ku7Fs
 W+rw==
X-Gm-Message-State: ACgBeo1GetM5N6Z4hP5a1Qk3DO3u/8s7SgrdKf4c/qoNH211Ot0Cciq6
 G0K1+e7PNsooATklUDaqBRwtUBP4+atSHZXEh8IwKWi//kQlM1OX1yz8X+i81Y9Nrds+Qc4VRI4
 ZQjkl/+b5gK0sh7aLvY1I39v+Ni5ghek=
X-Received: by 2002:a25:d4c3:0:b0:673:52d:10e1 with SMTP id
 m186-20020a25d4c3000000b00673052d10e1mr4112135ybf.349.1659691380777; 
 Fri, 05 Aug 2022 02:23:00 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4Dic0KofvdsiA6Kl7kkqL8drEOohkcQ8OrLdvvH6BKVLPMTRB7nVag3hnyO/XV3ePHmwYTH8Rz1InjZ0kgsFQ=
X-Received: by 2002:a25:d4c3:0:b0:673:52d:10e1 with SMTP id
 m186-20020a25d4c3000000b00673052d10e1mr4112125ybf.349.1659691380536; Fri, 05
 Aug 2022 02:23:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220804131300.96368-1-thuth@redhat.com>
In-Reply-To: <20220804131300.96368-1-thuth@redhat.com>
From: Mauro Matteo Cascella <mcascell@redhat.com>
Date: Fri, 5 Aug 2022 11:22:49 +0200
Message-ID: <CAA8xKjXgBebE=P7QXoRV+9Ep7EDz=Z==w2ZJTEZjT-b77DEDgw@mail.gmail.com>
Subject: Re: [PATCH v2 for-7.1] hw/usb/hcd-xhci: Fix unbounded loop in
 xhci_ring_chain_length() (CVE-2020-14394)
To: Thomas Huth <thuth@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org, f4bug@amsat.org, 
 Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mcascell@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Thu, Aug 4, 2022 at 3:13 PM Thomas Huth <thuth@redhat.com> wrote:
>
> The loop condition in xhci_ring_chain_length() is under control of
> the guest, and additionally the code does not check for failed DMA
> transfers (e.g. if reaching the end of the RAM), so the loop there
> could run for a very long time or even forever. Fix it by checking
> the return value of dma_memory_read() and by introducing a maximum
> loop length.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/646
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  v2:
>  - Reworded subject and commit description
>  - Focus on xhci_ring_chain_length() since that's the only function
>    where an endless loop can currently occur. The other spots that
>    ignore the return value of dma_memory_read() should be fixed as
>    well later, but that's rather something for QEMU 7.2.
>  - Added an real limit for the loop, so that it also ends after a
>    while in case there are no DMA errors
>  - Use "return -1" instead of "return -length" since the latter
>    is somewhat weird (could be sometimes 0, sometimes negative)
>
>  hw/usb/hcd-xhci.c | 23 +++++++++++++++++++----
>  1 file changed, 19 insertions(+), 4 deletions(-)
>
> diff --git a/hw/usb/hcd-xhci.c b/hw/usb/hcd-xhci.c
> index 5a1ddf8c3e..b5669bc234 100644
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
> @@ -729,10 +730,14 @@ static int xhci_ring_chain_length(XHCIState *xhci, const XHCIRing *ring)
>      bool control_td_set = 0;
>      uint32_t link_cnt = 0;
>
> -    while (1) {
> +    do {
>          TRBType type;
> -        dma_memory_read(xhci->as, dequeue, &trb, TRB_SIZE,
> -                        MEMTXATTRS_UNSPECIFIED);
> +        if (dma_memory_read(xhci->as, dequeue, &trb, TRB_SIZE,
> +                        MEMTXATTRS_UNSPECIFIED) != MEMTX_OK) {
> +            qemu_log_mask(LOG_GUEST_ERROR, "%s: DMA memory access failed!\n",
> +                          __func__);
> +            return -1;
> +        }
>          le64_to_cpus(&trb.parameter);
>          le32_to_cpus(&trb.status);
>          le32_to_cpus(&trb.control);
> @@ -766,7 +771,17 @@ static int xhci_ring_chain_length(XHCIState *xhci, const XHCIRing *ring)
>          if (!control_td_set && !(trb.control & TRB_TR_CH)) {
>              return length;
>          }
> -    }
> +
> +        /*
> +         * According to the xHCI spec, Transfer Ring segments should have
> +         * a maximum size of 64 kB (see chapter "6 Data Structures")
> +         */
> +    } while (length < TRB_LINK_LIMIT * 65536 / TRB_SIZE);
> +
> +    qemu_log_mask(LOG_GUEST_ERROR, "%s: exceeded maximum tranfer ring size!\n",
> +                          __func__);
> +
> +    return -1;
>  }
>
>  static void xhci_er_reset(XHCIState *xhci, int v)
> --
> 2.31.1
>

Reviewed-by: Mauro Matteo Cascella <mcascell@redhat.com>

Thanks,
-- 
Mauro Matteo Cascella
Red Hat Product Security
PGP-Key ID: BB3410B0


