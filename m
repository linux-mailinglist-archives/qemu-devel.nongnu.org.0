Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB0D6C815F
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Mar 2023 16:36:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfcn6-0007f6-Uk; Fri, 24 Mar 2023 04:28:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pfcn4-0007ew-BS
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 04:28:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pfcmn-0005g4-4L
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 04:28:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679646486;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1ZMJVpYFbSlxJAwBMAwY85VUlcJZrrKj2duam1pVQro=;
 b=fIxD/9+vTSSD6+lb7ZEL9Sr9WNayo6LcyqZ+IlFaR1drcWkz97Pv7AwF6RcEM/YYsnvIv6
 at9Yjs7O0ouWPe0nsEt6e026codhAfAGCSNXJ5F8Nc0g0k49w2gVFvghgRFy3EJNWvML6X
 K/BgYqY98DPBStGOtcuSjdRmcbESTqY=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-549-fB2C65nKOzC-ms7CZHefaA-1; Fri, 24 Mar 2023 04:28:05 -0400
X-MC-Unique: fB2C65nKOzC-ms7CZHefaA-1
Received: by mail-pj1-f71.google.com with SMTP id
 ip12-20020a17090b314c00b0023f7dfb7d7fso412494pjb.6
 for <qemu-devel@nongnu.org>; Fri, 24 Mar 2023 01:28:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679646484;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1ZMJVpYFbSlxJAwBMAwY85VUlcJZrrKj2duam1pVQro=;
 b=YjBVEvNYJvaSrz3IifvkXOH9m3uGvShD5Jp2bEvq4Cikh7jsWEMbQhD0/PkPPRiXtD
 MdXlMYuEx/CZL9EWaDqMNfMSjkvznY9tHw9PRWjdlUDO0SKb9J42RSZjrvFC+ww5SHz1
 x14ISDk/KcmFnnzLTRBv1DgHbHIVFbuUtQwUbyzB+VU5YOnnC2j0/Yh8Hx1kDmU180Gt
 rK1AMNWWUveoBVOYnZ0KoEcOzTB8TGirRr07x7u3VFraq+Ca2FKYtNXTsS+C9vJT2Rmx
 +WxMFMflY+OsfMqUsZLy1sLi3QwkXKePzLv3pz2DocIYSiuO6qiBi75bct13laodEwOL
 waGA==
X-Gm-Message-State: AAQBX9e6cCe0pFUoRj2MXGiJsnouYgs4oQfWWBysQdkutwEG/TP37unU
 DXKkOjNWAF3BtBaRIfN83BjIM9H9KBnPTg/QeKtlGv5IKscf8rbuS0kFejLnV0oAwAC3NWIaou6
 rFpts235gldzSQ0A=
X-Received: by 2002:a17:903:5c3:b0:1a1:ee8c:eeba with SMTP id
 kf3-20020a17090305c300b001a1ee8ceebamr1542031plb.59.1679646483880; 
 Fri, 24 Mar 2023 01:28:03 -0700 (PDT)
X-Google-Smtp-Source: AKy350bsRd/hdRoFw41UDuIiPDY1QokqUPDR/KbyQ/Cd3SUBUrmQOK1eRNw9OVmvcAHp6KIM5ZV+HA==
X-Received: by 2002:a17:903:5c3:b0:1a1:ee8c:eeba with SMTP id
 kf3-20020a17090305c300b001a1ee8ceebamr1542015plb.59.1679646483554; 
 Fri, 24 Mar 2023 01:28:03 -0700 (PDT)
Received: from [10.72.13.76] ([43.228.180.230])
 by smtp.gmail.com with ESMTPSA id
 d9-20020a170902854900b0019c61616f82sm13623631plo.230.2023.03.24.01.28.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Mar 2023 01:28:03 -0700 (PDT)
Message-ID: <6e732fd4-5296-6d87-6419-b8db33419ae5@redhat.com>
Date: Fri, 24 Mar 2023 16:27:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH for 8.0 v2] igb: Save more Tx states
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: "qemu-devel @ nongnu . org" <qemu-devel@nongnu.org>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "quintela @ redhat . com" <quintela@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>
References: <20230322042044.25136-1-akihiko.odaki@daynix.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20230322042044.25136-1-akihiko.odaki@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


在 2023/3/22 12:20, Akihiko Odaki 写道:
> The current implementation of igb uses only part of a advanced Tx
> context descriptor and first data descriptor because it misses some
> features and sniffs the trait of the packet instead of respecting the
> packet type specified in the descriptor. However, we will certainly
> need the entire Tx context descriptor when we update igb to respect
> these ignored fields. Save the entire context descriptor and first
> data descriptor except the buffer address to prepare for such a change.
>
> This also introduces the distinction of contexts with different
> indexes, which was not present in e1000e but in igb.
>
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> Reviewed-by: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
> ---
> V1 -> V2: Removed references to old variables in igb_reset()
>
> Supersedes: <20230316155707.27007-1-akihiko.odaki@daynix.com>
>
>   hw/net/igb.c      | 25 ++++++++++++++++++-------
>   hw/net/igb_core.c | 39 +++++++++++++++++++--------------------
>   hw/net/igb_core.h |  8 +++-----
>   3 files changed, 40 insertions(+), 32 deletions(-)
>
> diff --git a/hw/net/igb.c b/hw/net/igb.c
> index c6d753df87..7c05896325 100644
> --- a/hw/net/igb.c
> +++ b/hw/net/igb.c
> @@ -502,16 +502,27 @@ static int igb_post_load(void *opaque, int version_id)
>       return igb_core_post_load(&s->core);
>   }
>   
> -static const VMStateDescription igb_vmstate_tx = {
> -    .name = "igb-tx",
> +static const VMStateDescription igb_vmstate_tx_ctx = {
> +    .name = "igb-tx-ctx",
>       .version_id = 1,
>       .minimum_version_id = 1,
>       .fields = (VMStateField[]) {
> -        VMSTATE_UINT16(vlan, struct igb_tx),
> -        VMSTATE_UINT16(mss, struct igb_tx),
> -        VMSTATE_BOOL(tse, struct igb_tx),
> -        VMSTATE_BOOL(ixsm, struct igb_tx),
> -        VMSTATE_BOOL(txsm, struct igb_tx),
> +        VMSTATE_UINT32(vlan_macip_lens, struct e1000_adv_tx_context_desc),
> +        VMSTATE_UINT32(seqnum_seed, struct e1000_adv_tx_context_desc),
> +        VMSTATE_UINT32(type_tucmd_mlhl, struct e1000_adv_tx_context_desc),
> +        VMSTATE_UINT32(mss_l4len_idx, struct e1000_adv_tx_context_desc),


Miss VMSTATE_END_OF_LIST().

Please make sure your patch can pass check-qtest before submitting.

Thanks


> +    }
> +};
> +
> +static const VMStateDescription igb_vmstate_tx = {
> +    .name = "igb-tx",
> +    .version_id = 2,
> +    .minimum_version_id = 2,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_STRUCT_ARRAY(ctx, struct igb_tx, 2, 0, igb_vmstate_tx_ctx,
> +                             struct e1000_adv_tx_context_desc),
> +        VMSTATE_UINT32(first_cmd_type_len, struct igb_tx),
> +        VMSTATE_UINT32(first_olinfo_status, struct igb_tx),
>           VMSTATE_BOOL(first, struct igb_tx),
>           VMSTATE_BOOL(skip_cp, struct igb_tx),
>           VMSTATE_END_OF_LIST()
> diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
> index a7c7bfdc75..7708333c2a 100644
> --- a/hw/net/igb_core.c
> +++ b/hw/net/igb_core.c
> @@ -389,8 +389,10 @@ igb_rss_parse_packet(IGBCore *core, struct NetRxPkt *pkt, bool tx,
>   static bool
>   igb_setup_tx_offloads(IGBCore *core, struct igb_tx *tx)
>   {
> -    if (tx->tse) {
> -        if (!net_tx_pkt_build_vheader(tx->tx_pkt, true, true, tx->mss)) {
> +    if (tx->first_cmd_type_len & E1000_ADVTXD_DCMD_TSE) {
> +        uint32_t idx = (tx->first_olinfo_status >> 4) & 1;
> +        uint32_t mss = tx->ctx[idx].mss_l4len_idx >> 16;
> +        if (!net_tx_pkt_build_vheader(tx->tx_pkt, true, true, mss)) {
>               return false;
>           }
>   
> @@ -399,13 +401,13 @@ igb_setup_tx_offloads(IGBCore *core, struct igb_tx *tx)
>           return true;
>       }
>   
> -    if (tx->txsm) {
> +    if (tx->first_olinfo_status & E1000_ADVTXD_POTS_TXSM) {
>           if (!net_tx_pkt_build_vheader(tx->tx_pkt, false, true, 0)) {
>               return false;
>           }
>       }
>   
> -    if (tx->ixsm) {
> +    if (tx->first_olinfo_status & E1000_ADVTXD_POTS_IXSM) {
>           net_tx_pkt_update_ip_hdr_checksum(tx->tx_pkt);
>       }
>   
> @@ -527,7 +529,7 @@ igb_process_tx_desc(IGBCore *core,
>   {
>       struct e1000_adv_tx_context_desc *tx_ctx_desc;
>       uint32_t cmd_type_len;
> -    uint32_t olinfo_status;
> +    uint32_t idx;
>       uint64_t buffer_addr;
>       uint16_t length;
>   
> @@ -538,20 +540,19 @@ igb_process_tx_desc(IGBCore *core,
>               E1000_ADVTXD_DTYP_DATA) {
>               /* advanced transmit data descriptor */
>               if (tx->first) {
> -                olinfo_status = le32_to_cpu(tx_desc->read.olinfo_status);
> -
> -                tx->tse = !!(cmd_type_len & E1000_ADVTXD_DCMD_TSE);
> -                tx->ixsm = !!(olinfo_status & E1000_ADVTXD_POTS_IXSM);
> -                tx->txsm = !!(olinfo_status & E1000_ADVTXD_POTS_TXSM);
> -
> +                tx->first_cmd_type_len = cmd_type_len;
> +                tx->first_olinfo_status = le32_to_cpu(tx_desc->read.olinfo_status);
>                   tx->first = false;
>               }
>           } else if ((cmd_type_len & E1000_ADVTXD_DTYP_CTXT) ==
>                      E1000_ADVTXD_DTYP_CTXT) {
>               /* advanced transmit context descriptor */
>               tx_ctx_desc = (struct e1000_adv_tx_context_desc *)tx_desc;
> -            tx->vlan = le32_to_cpu(tx_ctx_desc->vlan_macip_lens) >> 16;
> -            tx->mss = le32_to_cpu(tx_ctx_desc->mss_l4len_idx) >> 16;
> +            idx = (le32_to_cpu(tx_ctx_desc->mss_l4len_idx) >> 4) & 1;
> +            tx->ctx[idx].vlan_macip_lens = le32_to_cpu(tx_ctx_desc->vlan_macip_lens);
> +            tx->ctx[idx].seqnum_seed = le32_to_cpu(tx_ctx_desc->seqnum_seed);
> +            tx->ctx[idx].type_tucmd_mlhl = le32_to_cpu(tx_ctx_desc->type_tucmd_mlhl);
> +            tx->ctx[idx].mss_l4len_idx = le32_to_cpu(tx_ctx_desc->mss_l4len_idx);
>               return;
>           } else {
>               /* unknown descriptor type */
> @@ -575,8 +576,10 @@ igb_process_tx_desc(IGBCore *core,
>       if (cmd_type_len & E1000_TXD_CMD_EOP) {
>           if (!tx->skip_cp && net_tx_pkt_parse(tx->tx_pkt)) {
>               if (cmd_type_len & E1000_TXD_CMD_VLE) {
> -                net_tx_pkt_setup_vlan_header_ex(tx->tx_pkt, tx->vlan,
> -                    core->mac[VET] & 0xffff);
> +                idx = (tx->first_olinfo_status >> 4) & 1;
> +                uint16_t vlan = tx->ctx[idx].vlan_macip_lens >> 16;
> +                uint16_t vet = core->mac[VET] & 0xffff;
> +                net_tx_pkt_setup_vlan_header_ex(tx->tx_pkt, vlan, vet);
>               }
>               if (igb_tx_pkt_send(core, tx, queue_index)) {
>                   igb_on_tx_done_update_stats(core, tx->tx_pkt);
> @@ -4024,11 +4027,7 @@ static void igb_reset(IGBCore *core, bool sw)
>       for (i = 0; i < ARRAY_SIZE(core->tx); i++) {
>           tx = &core->tx[i];
>           net_tx_pkt_reset(tx->tx_pkt);
> -        tx->vlan = 0;
> -        tx->mss = 0;
> -        tx->tse = false;
> -        tx->ixsm = false;
> -        tx->txsm = false;
> +        memset(tx->ctx, 0, sizeof(tx->ctx));
>           tx->first = true;
>           tx->skip_cp = false;
>       }
> diff --git a/hw/net/igb_core.h b/hw/net/igb_core.h
> index 814c1e264b..8914e0b801 100644
> --- a/hw/net/igb_core.h
> +++ b/hw/net/igb_core.h
> @@ -72,11 +72,9 @@ struct IGBCore {
>       QEMUTimer *autoneg_timer;
>   
>       struct igb_tx {
> -        uint16_t vlan;  /* VLAN Tag */
> -        uint16_t mss;   /* Maximum Segment Size */
> -        bool tse;       /* TCP/UDP Segmentation Enable */
> -        bool ixsm;      /* Insert IP Checksum */
> -        bool txsm;      /* Insert TCP/UDP Checksum */
> +        struct e1000_adv_tx_context_desc ctx[2];
> +        uint32_t first_cmd_type_len;
> +        uint32_t first_olinfo_status;
>   
>           bool first;
>           bool skip_cp;


