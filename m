Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2152B6BCF9A
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 13:37:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcmqE-0003rn-UO; Thu, 16 Mar 2023 08:36:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pcmqA-0003qw-Vw
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 08:36:19 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pcmq7-0002mC-Tk
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 08:36:17 -0400
Received: by mail-wr1-x432.google.com with SMTP id r29so1378163wra.13
 for <qemu-devel@nongnu.org>; Thu, 16 Mar 2023 05:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678970172;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HpuCKGKLlDEoXsRwiXHTsSc2ssBxPmqLr7dZ5rORoRk=;
 b=ta7FvPusQdFCN/0Kv7VIKOHZqDXqR1rzOIzbpdl8sVHe6kJYhDh9Z8+EjxkqMGnAjV
 Yjx0xWHsFarRHaUlLjbhJzmCpGo0Cnk9uBfkHt30sarEqhPLO7YnnHl8R82xPsl6ar1T
 HpTeHo3PoDkyaB9W3QPx9jkdrrnOX+dfygZKkeuSSvPZtndbyhK80VVpcYQa0katSri3
 ldtI470CM+YlQ/43etY8ZiRyeFM0FO5l7RTDSeybO2Y9j+PYhe6649c0Nj24oEVcV5a1
 ac+HvOT8e7vLd/ml9TrOLRBESxMzPugYyksqu45taxei1Hs2cVLN6D9GTLbEUqBqHNQG
 QmmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678970172;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HpuCKGKLlDEoXsRwiXHTsSc2ssBxPmqLr7dZ5rORoRk=;
 b=dStN/NBmrAshivXrLNQlynXakJSTFlAwTEQHOncfrfkLj+pLMRSXHGXCOsEfZvljCV
 6eeNPRcxksZ2DZqlFb951J6P2hpz6dLWYWf2b2Zw50qQa5NnIpvghWtGTpJJqAP+Y71R
 crQwuLWlQR2tw4YIWSZdk6SIr8olOdstIkUdAhF5zodESrZH6W+EzZZ38UwYNMd0YbiY
 9lacWXUdixdDWcud0+RLN5xYTH6sn7bpV0K3iMXa44+J+/KJUkSl+4f0bXgJXLsHUtJQ
 Xz+IceCX4ODC0I+5Jz9eWVKpgFpYkmYrOplps4L0jLIHEDen49fizNYNA28mH+AmNura
 sYRw==
X-Gm-Message-State: AO0yUKV30+74ulR9MoETlZ74EdOTPJcbEqa6MwQuE1Cy78cChPin/sag
 eemNV4pOOYkOtO4hHRj1OFaK5A==
X-Google-Smtp-Source: AK7set8+6nTThdM7pywpyRLzh6uJB9BmHgHWi5tDn480nxeiJiBcJQzmUByIDwSG3ApsFxv3bzytPg==
X-Received: by 2002:adf:e5c1:0:b0:2ce:a828:b248 with SMTP id
 a1-20020adfe5c1000000b002cea828b248mr4235898wrn.71.1678970172595; 
 Thu, 16 Mar 2023 05:36:12 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 u7-20020a5d4687000000b002c5544b3a69sm7096843wrq.89.2023.03.16.05.36.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Mar 2023 05:36:12 -0700 (PDT)
Message-ID: <d60df663-51e0-67bf-0888-cfd78acec7d2@linaro.org>
Date: Thu, 16 Mar 2023 13:36:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH for 8.0] igb: Save the entire Tx context descriptor
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>
References: <20230316122847.11003-1-akihiko.odaki@daynix.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230316122847.11003-1-akihiko.odaki@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 16/3/23 13:28, Akihiko Odaki wrote:
> The current implementation of igb uses only part of a advanced Tx
> context descriptor because it misses some features and sniffs the trait
> of the packet instead of respecting the packet type specified in the
> descriptor. However, we will certainly need the entire Tx context
> descriptor when we update igb to respect these ignored fields. Save the
> entire Tx context descriptor to prepare for such a change.
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>   hw/net/igb.c      |  6 ++++--
>   hw/net/igb_core.c | 17 ++++++++++-------
>   hw/net/igb_core.h |  3 +--
>   3 files changed, 15 insertions(+), 11 deletions(-)
> 
> diff --git a/hw/net/igb.c b/hw/net/igb.c
> index 0792626322..50239a7cb1 100644
> --- a/hw/net/igb.c
> +++ b/hw/net/igb.c
> @@ -499,8 +499,10 @@ static const VMStateDescription igb_vmstate_tx = {
>       .version_id = 1,

Don't we need to increment the vmstate version? See
https://qemu-project.gitlab.io/qemu/devel/migration.html#versions

>       .minimum_version_id = 1,
>       .fields = (VMStateField[]) {
> -        VMSTATE_UINT16(vlan, struct igb_tx),
> -        VMSTATE_UINT16(mss, struct igb_tx),
> +        VMSTATE_UINT32(ctx.vlan_macip_lens, struct igb_tx),
> +        VMSTATE_UINT32(ctx.seqnum_seed, struct igb_tx),
> +        VMSTATE_UINT32(ctx.type_tucmd_mlhl, struct igb_tx),
> +        VMSTATE_UINT32(ctx.mss_l4len_idx, struct igb_tx),
>           VMSTATE_BOOL(tse, struct igb_tx),
>           VMSTATE_BOOL(ixsm, struct igb_tx),
>           VMSTATE_BOOL(txsm, struct igb_tx),
> diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
> index 41d1abae03..dbe24739d0 100644
> --- a/hw/net/igb_core.c
> +++ b/hw/net/igb_core.c
> @@ -390,7 +390,8 @@ static bool
>   igb_setup_tx_offloads(IGBCore *core, struct igb_tx *tx)
>   {
>       if (tx->tse) {
> -        if (!net_tx_pkt_build_vheader(tx->tx_pkt, true, true, tx->mss)) {
> +        uint32_t mss = tx->ctx.mss_l4len_idx >> 16;
> +        if (!net_tx_pkt_build_vheader(tx->tx_pkt, true, true, mss)) {
>               return false;
>           }
>   
> @@ -551,8 +552,10 @@ igb_process_tx_desc(IGBCore *core,
>                      E1000_ADVTXD_DTYP_CTXT) {
>               /* advanced transmit context descriptor */
>               tx_ctx_desc = (struct e1000_adv_tx_context_desc *)tx_desc;
> -            tx->vlan = le32_to_cpu(tx_ctx_desc->vlan_macip_lens) >> 16;
> -            tx->mss = le32_to_cpu(tx_ctx_desc->mss_l4len_idx) >> 16;
> +            tx->ctx.vlan_macip_lens = le32_to_cpu(tx_ctx_desc->vlan_macip_lens);
> +            tx->ctx.seqnum_seed = le32_to_cpu(tx_ctx_desc->seqnum_seed);
> +            tx->ctx.type_tucmd_mlhl = le32_to_cpu(tx_ctx_desc->type_tucmd_mlhl);
> +            tx->ctx.mss_l4len_idx = le32_to_cpu(tx_ctx_desc->mss_l4len_idx);
>               return;
>           } else {
>               /* unknown descriptor type */
> @@ -576,8 +579,9 @@ igb_process_tx_desc(IGBCore *core,
>       if (cmd_type_len & E1000_TXD_CMD_EOP) {
>           if (!tx->skip_cp && net_tx_pkt_parse(tx->tx_pkt)) {
>               if (cmd_type_len & E1000_TXD_CMD_VLE) {
> -                net_tx_pkt_setup_vlan_header_ex(tx->tx_pkt, tx->vlan,
> -                    core->mac[VET] & 0xffff);
> +                uint16_t vlan = tx->ctx.vlan_macip_lens >> 16;
> +                uint16_t vet = core->mac[VET] & 0xffff;
> +                net_tx_pkt_setup_vlan_header_ex(tx->tx_pkt, vlan, vet);
>               }
>               if (igb_tx_pkt_send(core, tx, queue_index)) {
>                   igb_on_tx_done_update_stats(core, tx->tx_pkt);
> @@ -4027,8 +4031,7 @@ static void igb_reset(IGBCore *core, bool sw)
>       for (i = 0; i < ARRAY_SIZE(core->tx); i++) {
>           tx = &core->tx[i];
>           net_tx_pkt_reset(tx->tx_pkt, NULL);
> -        tx->vlan = 0;
> -        tx->mss = 0;
> +        memset(&tx->ctx, 0, sizeof(tx->ctx));
>           tx->tse = false;
>           tx->ixsm = false;
>           tx->txsm = false;
> diff --git a/hw/net/igb_core.h b/hw/net/igb_core.h
> index 814c1e264b..3483edc655 100644
> --- a/hw/net/igb_core.h
> +++ b/hw/net/igb_core.h
> @@ -72,8 +72,7 @@ struct IGBCore {
>       QEMUTimer *autoneg_timer;
>   
>       struct igb_tx {
> -        uint16_t vlan;  /* VLAN Tag */
> -        uint16_t mss;   /* Maximum Segment Size */
> +        struct e1000_adv_tx_context_desc ctx;
>           bool tse;       /* TCP/UDP Segmentation Enable */
>           bool ixsm;      /* Insert IP Checksum */
>           bool txsm;      /* Insert TCP/UDP Checksum */


