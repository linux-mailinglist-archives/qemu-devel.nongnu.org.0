Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B03B158A525
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 05:49:48 +0200 (CEST)
Received: from localhost ([::1]:50748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJoLL-0007AI-Rn
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 23:49:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oJoIn-0005RR-U5
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 23:47:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31373)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oJoIl-0003h2-TE
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 23:47:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659671227;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=x9lPfQSwfP7hI/Q81iCpOm38mjeHd2BN4vwmEVMURPc=;
 b=jRwey81ln5/Rmi6xFIflIYPUMgC6jqQQTDqJbcRfyrygGwMBmVARX986FDfLD0jYcAaIxs
 v57rB5WwjuPtUmRSiZFI2zZ/s3UjpH2nDaHVF3jJKnXiVomoz3k+1misRRSSLw9D6qT34z
 etZvVY8npoTvZgYhp3Ldywr29yTlTKY=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-28-1gVNYueVO7G7DmsEXir4aw-1; Thu, 04 Aug 2022 23:46:26 -0400
X-MC-Unique: 1gVNYueVO7G7DmsEXir4aw-1
Received: by mail-lf1-f69.google.com with SMTP id
 k25-20020a195619000000b00489e6a6527eso288608lfb.8
 for <qemu-devel@nongnu.org>; Thu, 04 Aug 2022 20:46:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=x9lPfQSwfP7hI/Q81iCpOm38mjeHd2BN4vwmEVMURPc=;
 b=v+PxksHkobjLojI8NcM/MFrfaDAYHV9mEbEb/1WMzG39MOGkedxP3vjAVY7kJuzL6z
 sOzw8TB74XmsxieHe3WkP+nZa/vDbdL+QXo2Y+YE2+12qcydkKbbMvLiDkiq0u6BxlGW
 d84VbBTUOzsGn/l/XOp3P9M3IhyI/wG3lLQ3owFNw/PuIQgHqhKk4I7ScdrsG3v/kBDc
 ehzd7pLOPJZS5bdGYnS8HHWOCHE0JxWx22MrYtYQl6gqQbJJdHXCbyQwwXjs5cff/7Ug
 s4bOzWL7tCrt03wMmdVOZUwP16GeEumTtosRF+kYrPXD14oANUW2clsO5ba1WIjAWLpq
 9L8w==
X-Gm-Message-State: ACgBeo1R4mqDBYWC/TLWJmyv4uK2hk2Q2MPE10Ol+ltBEnISdOcTbPEe
 Te5Bv3oEIMFJZO1T3pftDJ1DTO5urpE23fG3ApjVXXAtWaw9Ah3phWS6Vdvb3s3qvT7apXjbTsq
 u8BUeIrY0wX9aHttH4IislNDTEU4AzoE=
X-Received: by 2002:a2e:9e1a:0:b0:25d:f9db:92f7 with SMTP id
 e26-20020a2e9e1a000000b0025df9db92f7mr1551894ljk.243.1659671184541; 
 Thu, 04 Aug 2022 20:46:24 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7HecshELwJh3lk5uvs07M3bVIqCJkAx2roK67/lpSnjlPTkEOgNjXEnzZApvC21p3LLww2xA/aOJdOulEiTAk=
X-Received: by 2002:a2e:9e1a:0:b0:25d:f9db:92f7 with SMTP id
 e26-20020a2e9e1a000000b0025df9db92f7mr1551889ljk.243.1659671184334; Thu, 04
 Aug 2022 20:46:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220802080948.37426-1-chen.zhang@intel.com>
In-Reply-To: <20220802080948.37426-1-chen.zhang@intel.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 5 Aug 2022 11:46:13 +0800
Message-ID: <CACGkMEs4Ypb+WcKTX-YqxrRUJW65fWokuBaMAkBp9eznXNDGTw@mail.gmail.com>
Subject: Re: [PATCH] net/colo.c: Fix the pointer issuse reported by Coverity.
To: Zhang Chen <chen.zhang@intel.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Li Zhijian <lizhijian@fujitsu.com>, qemu-dev <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
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

On Tue, Aug 2, 2022 at 4:24 PM Zhang Chen <chen.zhang@intel.com> wrote:
>
> When enable the virtio-net-pci, guest network packet will
> load the vnet_hdr. In COLO status, the primary VM's network
> packet maybe redirect to another VM, it need filter-redirect
> enable the vnet_hdr flag at the same time, COLO-proxy will
> correctly parse the original network packet. If have any
> misconfiguration here, the vnet_hdr_len is wrong for parse
> the packet, the data+offset will point to wrong place.
>
> Signed-off-by: Zhang Chen <chen.zhang@intel.com>
> ---
>  net/colo.c | 16 ++++++++++------
>  1 file changed, 10 insertions(+), 6 deletions(-)
>
> diff --git a/net/colo.c b/net/colo.c
> index 6b0ff562ad..dfb15b4c14 100644
> --- a/net/colo.c
> +++ b/net/colo.c
> @@ -44,21 +44,25 @@ int parse_packet_early(Packet *pkt)
>  {
>      int network_length;
>      static const uint8_t vlan[] = {0x81, 0x00};
> -    uint8_t *data = pkt->data + pkt->vnet_hdr_len;
> +    uint8_t *data = pkt->data;
>      uint16_t l3_proto;
>      ssize_t l2hdr_len;
>
>      if (data == NULL) {

I wonder under which case we can see data == NULL?

AFAIK, data is either dup via packet_new() or assigned to a pointer to
the buf in packet_new_nocopy().

Thanks

> -        trace_colo_proxy_main_vnet_info("This packet is not parsed correctly, "
> -                                        "pkt->vnet_hdr_len", pkt->vnet_hdr_len);
> +        trace_colo_proxy_main("COLO-proxy got NULL data packet ");
>          return 1;
>      }
> -    l2hdr_len = eth_get_l2_hdr_length(data);
>
> -    if (pkt->size < ETH_HLEN + pkt->vnet_hdr_len) {
> -        trace_colo_proxy_main("pkt->size < ETH_HLEN");
> +    /* Check the received vnet_hdr_len then add the offset */
> +    if (pkt->size < sizeof(struct eth_header) + sizeof(struct vlan_header)
> +        + pkt->vnet_hdr_len) {
> +        trace_colo_proxy_main_vnet_info("This packet may be load wrong "
> +                                        "pkt->vnet_hdr_len", pkt->vnet_hdr_len);
>          return 1;
>      }
> +    data += pkt->vnet_hdr_len;
> +
> +    l2hdr_len = eth_get_l2_hdr_length(data);
>
>      /*
>       * TODO: support vlan.
> --
> 2.25.1
>


