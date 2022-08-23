Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 244C259CE30
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 04:04:54 +0200 (CEST)
Received: from localhost ([::1]:35112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQJHg-0007i6-Qb
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 22:04:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oQJFq-0006Ch-1o
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 22:02:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57194)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oQJFm-0005r9-5L
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 22:02:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661220171;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tbFDOw8LhMdGEb4um11ZkTlA7LserPQMoAweS0yet9A=;
 b=Ozj2v0UajqH7FObLbJ4BhC7B/6UgI9XsW3FKCK0WWaA1nrpv2V4Lj24z1XchRq38jpMQFM
 0fnp4a0Vn+ZSQ3gXm3e6KUIttzgkU7o/gAk0cSkbNJVr8JlFxozEmucgpKyz0OwVg/Blgt
 al/yK6ejvlj0wqsz2Gc4REKv/RVRYO8=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-344-DhlSksWTMp2I06B8VeCfXQ-1; Mon, 22 Aug 2022 22:02:50 -0400
X-MC-Unique: DhlSksWTMp2I06B8VeCfXQ-1
Received: by mail-lj1-f197.google.com with SMTP id
 o9-20020a2e7309000000b00261d4ae66d7so327063ljc.21
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 19:02:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=tbFDOw8LhMdGEb4um11ZkTlA7LserPQMoAweS0yet9A=;
 b=KGMLwu51m+nvHPHUbRxA+x14lNVC8NAlvL0UUqqDjMIVbmF7lBoqeS1X4Kc03mXBW5
 PZ/f9mCCfOcqaVhQGM7/qdDZxiRAEUKslkLqrQ+FUsTBNfRfIKRGgzIZW/aVjn2mHh7M
 Szeaq2ezJzV2dCSFQz19Woi6IunCE2abel85l43Aq2O1tzE6oGz/smWtlGcs3Oafzeqw
 I1gj88ZvKyU4NEMw2Drgz1elckFOiLchw49V4+oH6KwpVv7NzJ8royCzwPmcPMW3gmGS
 jKt/Zzd3YPd6z1Hpf+jsqZluNpHMPaonlUrcwsx6jjP5cvq+tTu9iJ8BXG5K2QnjbP5p
 0LYg==
X-Gm-Message-State: ACgBeo3WyGzGt3576+gRIPZZCvGtUc0H2IaXcIk06ck2pyWJFIrGCpBn
 27zqYp3ac5qrsgpFUtnnKHQY52TUMZbPu6ycsfex8hLKQBg97sl9gDyzkzcVkA9SsWaKf5EHPsg
 pHGJMksJp17ERjufm+4xZ+jLd6MFrd1s=
X-Received: by 2002:a05:6512:3da1:b0:48f:cad0:195a with SMTP id
 k33-20020a0565123da100b0048fcad0195amr8140998lfv.397.1661220168546; 
 Mon, 22 Aug 2022 19:02:48 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6vZQTDLcmP9ZQe05NrF724XE4J9XUm7L44gjJvJfAxV7dBelvPS3IliZKOcsSqc7XomAU3xyXDR89VqizC3Ac=
X-Received: by 2002:a05:6512:3da1:b0:48f:cad0:195a with SMTP id
 k33-20020a0565123da100b0048fcad0195amr8140991lfv.397.1661220168321; Mon, 22
 Aug 2022 19:02:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220822081436.653555-1-chen.zhang@intel.com>
In-Reply-To: <20220822081436.653555-1-chen.zhang@intel.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 23 Aug 2022 10:02:37 +0800
Message-ID: <CACGkMEsnxOHsK-sq0xkXU9h9MaZBu31o9msc8gyrNtcyhJRLhA@mail.gmail.com>
Subject: Re: [PATCH V5] net/colo.c: Fix the pointer issue reported by Coverity.
To: Zhang Chen <chen.zhang@intel.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Li Zhijian <lizhijian@fujitsu.com>, qemu-dev <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

On Mon, Aug 22, 2022 at 4:29 PM Zhang Chen <chen.zhang@intel.com> wrote:
>
> When enabled the virtio-net-pci, guest network packet will
> load the vnet_hdr. In COLO status, the primary VM's network
> packet maybe redirect to another VM, it needs filter-redirect
> enable the vnet_hdr flag at the same time, COLO-proxy will
> correctly parse the original network packet. If have any
> misconfiguration here, the vnet_hdr_len is wrong for parse
> the packet, the data+offset will point to wrong place.
>
> Signed-off-by: Zhang Chen <chen.zhang@intel.com>

Not sure it's worth 7.1. So I queued this for 7.2.

Thanks

> ---
>  net/colo.c       | 25 ++++++++++++++++---------
>  net/colo.h       |  1 +
>  net/trace-events |  2 +-
>  3 files changed, 18 insertions(+), 10 deletions(-)
>
> diff --git a/net/colo.c b/net/colo.c
> index 6b0ff562ad..fb2c36a026 100644
> --- a/net/colo.c
> +++ b/net/colo.c
> @@ -44,21 +44,28 @@ int parse_packet_early(Packet *pkt)
>  {
>      int network_length;
>      static const uint8_t vlan[] = {0x81, 0x00};
> -    uint8_t *data = pkt->data + pkt->vnet_hdr_len;
> +    uint8_t *data = pkt->data;
>      uint16_t l3_proto;
>      ssize_t l2hdr_len;
>
> -    if (data == NULL) {
> -        trace_colo_proxy_main_vnet_info("This packet is not parsed correctly, "
> -                                        "pkt->vnet_hdr_len", pkt->vnet_hdr_len);
> +    assert(data);
> +
> +    /* Check the received vnet_hdr_len then add the offset */
> +    if ((pkt->vnet_hdr_len > sizeof(struct virtio_net_hdr_v1_hash)) ||
> +        (pkt->size < sizeof(struct eth_header) + sizeof(struct vlan_header) +
> +        pkt->vnet_hdr_len)) {
> +        /*
> +         * The received remote packet maybe misconfiguration here,
> +         * Please enable/disable filter module's the vnet_hdr flag at
> +         * the same time.
> +         */
> +        trace_colo_proxy_main_vnet_info("This received packet load wrong ",
> +                                        pkt->vnet_hdr_len, pkt->size);
>          return 1;
>      }
> -    l2hdr_len = eth_get_l2_hdr_length(data);
> +    data += pkt->vnet_hdr_len;
>
> -    if (pkt->size < ETH_HLEN + pkt->vnet_hdr_len) {
> -        trace_colo_proxy_main("pkt->size < ETH_HLEN");
> -        return 1;
> -    }
> +    l2hdr_len = eth_get_l2_hdr_length(data);
>
>      /*
>       * TODO: support vlan.
> diff --git a/net/colo.h b/net/colo.h
> index 8b3e8d5a83..22fc3031f7 100644
> --- a/net/colo.h
> +++ b/net/colo.h
> @@ -18,6 +18,7 @@
>  #include "qemu/jhash.h"
>  #include "qemu/timer.h"
>  #include "net/eth.h"
> +#include "standard-headers/linux/virtio_net.h"
>
>  #define HASHTABLE_MAX_SIZE 16384
>
> diff --git a/net/trace-events b/net/trace-events
> index 6af927b4b9..823a071bdc 100644
> --- a/net/trace-events
> +++ b/net/trace-events
> @@ -9,7 +9,7 @@ vhost_user_event(const char *chr, int event) "chr: %s got event: %d"
>
>  # colo.c
>  colo_proxy_main(const char *chr) ": %s"
> -colo_proxy_main_vnet_info(const char *sta, int size) ": %s = %d"
> +colo_proxy_main_vnet_info(const char *sta, uint32_t vnet_hdr, int size) ": %s pkt->vnet_hdr_len = %u, pkt->size = %d"
>
>  # colo-compare.c
>  colo_compare_main(const char *chr) ": %s"
> --
> 2.25.1
>


