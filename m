Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9CDA6DC898
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Apr 2023 17:35:19 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pltWy-0000Ei-MG; Mon, 10 Apr 2023 11:34:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pltWw-0000Di-GY
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 11:34:06 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pltWu-0000h9-H7
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 11:34:06 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 c10-20020a17090abf0a00b0023d1bbd9f9eso7775987pjs.0
 for <qemu-devel@nongnu.org>; Mon, 10 Apr 2023 08:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112; t=1681140842; x=1683732842;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9Bxh+5E/JT4lLEPtTC+HKfVqbRfoB41fpfzYMXr46fU=;
 b=yabox8JgqVoepSvHY705TkI7w63I2J805ZlsEqTpcIy65OGX8jiCO13/OJvkObVWU9
 GBjDYIqICSC2l8VqMMPEW98mcMSsMB13sqxFSk1WJfFRr/0rzSObc1eWfY73r6klUsJu
 x7j7XKGgCM7FVC+GpUz19Zm1Do8jnVyLl7m6hzQZlTm4sgdGWLPYGi4T0bznCyM6hYPt
 Dyd/Id714I5K3E2xs8ls0zSNxfd/7j4c5sD9kkzA95mJGH/UGR+RYnOCePY8fsIwFiCE
 1CJYSHNuWgRof2xOAeTHkoSgbVaXBgbOHlQJ8ytSi30icqDGaCHkNq/tT0erxDp2DcQd
 Q4Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681140842; x=1683732842;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9Bxh+5E/JT4lLEPtTC+HKfVqbRfoB41fpfzYMXr46fU=;
 b=Wm8NLypfsfoGpOgglWQ4ig6pDYHKZUVS+XW7HCOIQxrGMQ6ulDoLll05Ae6LgazwFf
 Gnyj2Kxc6jJ56Q/nXshY3sHrKb35rcXO2eIQgukwTl8ZOf85zpPcsRUj5SIeS+xHd3Cs
 2q0CrS75gUrdaLzmnYToZDETiKWWId9Q0o1gvHeNm3+cUHQdaKEajWWH2K+hwsA15Oom
 Dr6EGLWNu1OLmhojJ/rb5E5BB8KBxgo1p9ilP0OC6ATUsg8J2XW0BA/GK67NE6g//9w/
 7mLaR0CjcEmHkaz3RmVYKWdAjoA5dUFLNcVTuwGbUybK9u15di40MIueNgSqbjWeEogU
 leUg==
X-Gm-Message-State: AAQBX9fQq6/lGxp2qzlhXYZQZJl5zW9PMHl4pgYSPK5ymjdL96gE8Grh
 A/bNO3duCB0GuVfQ57r4gV2UAw==
X-Google-Smtp-Source: AKy350ZWruP4IAfM1CCdkjJNmG7Y3FGu4eVKUrzunufrsIPVwnaigvdM6L5jsn7Xc2eyqT2FSQrwBw==
X-Received: by 2002:a05:6a20:1790:b0:d4:f423:6661 with SMTP id
 bl16-20020a056a20179000b000d4f4236661mr10896594pzb.25.1681140842207; 
 Mon, 10 Apr 2023 08:34:02 -0700 (PDT)
Received: from ?IPV6:2400:4050:a840:1e00:4457:c267:5e09:481b?
 ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 o12-20020a056a001bcc00b006328ee1e56csm4491657pfw.2.2023.04.10.08.33.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Apr 2023 08:34:01 -0700 (PDT)
Message-ID: <5bae2d2d-b28e-00c9-e6a3-2b0deb8e4e59@daynix.com>
Date: Tue, 11 Apr 2023 00:33:58 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 1/1] e1000e: Fix tx/rx counters
To: timothee.cocault@gmail.com, qemu-devel@nongnu.org
Cc: Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>
References: <366bbcafdb6e0373f0deb105153768a8c0bded87.camel@gmail.com>
 <6b31f5f523af93d47cac37509caf8036e183e136.camel@gmail.com>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <6b31f5f523af93d47cac37509caf8036e183e136.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1033;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-3.246, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

On 2023/04/11 0:27, timothee.cocault@gmail.com wrote:
> The bytes and packets counter registers are cleared on read.
> 
> Copying the "total counter" registers to the "good counter" registers has
> side effects.
> If the "total" register is never read by the OS, it only gets incremented.
> This leads to exponential growth of the "good" register.
> 
> This commit increments the counters individually to avoid this.
> 
> Signed-off-by: Timothée Cocault <timothee.cocault@gmail.com>

Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>

> ---
>   hw/net/e1000.c         | 5 ++---
>   hw/net/e1000e_core.c   | 5 ++---
>   hw/net/e1000x_common.c | 5 ++---
>   hw/net/igb_core.c      | 5 ++---
>   4 files changed, 8 insertions(+), 12 deletions(-)
> 
> diff --git a/hw/net/e1000.c b/hw/net/e1000.c
> index 23d660619f..59bacb5d3b 100644
> --- a/hw/net/e1000.c
> +++ b/hw/net/e1000.c
> @@ -637,9 +637,8 @@ xmit_seg(E1000State *s)
>   
>       e1000x_inc_reg_if_not_full(s->mac_reg, TPT);
>       e1000x_grow_8reg_if_not_full(s->mac_reg, TOTL, s->tx.size + 4);
> -    s->mac_reg[GPTC] = s->mac_reg[TPT];
> -    s->mac_reg[GOTCL] = s->mac_reg[TOTL];
> -    s->mac_reg[GOTCH] = s->mac_reg[TOTH];
> +    e1000x_inc_reg_if_not_full(s->mac_reg, GPTC);
> +    e1000x_grow_8reg_if_not_full(s->mac_reg, GOTCL, s->tx.size + 4);
>   }
>   
>   static void
> diff --git a/hw/net/e1000e_core.c b/hw/net/e1000e_core.c
> index c0c09b6965..cfa3f55e96 100644
> --- a/hw/net/e1000e_core.c
> +++ b/hw/net/e1000e_core.c
> @@ -711,9 +711,8 @@ e1000e_on_tx_done_update_stats(E1000ECore *core, struct NetTxPkt *tx_pkt)
>           g_assert_not_reached();
>       }
>   
> -    core->mac[GPTC] = core->mac[TPT];
> -    core->mac[GOTCL] = core->mac[TOTL];
> -    core->mac[GOTCH] = core->mac[TOTH];
> +    e1000x_inc_reg_if_not_full(core->mac, GPTC);
> +    e1000x_grow_8reg_if_not_full(core->mac, GOTCL, tot_len);
>   }
>   
>   static void
> diff --git a/hw/net/e1000x_common.c b/hw/net/e1000x_common.c
> index b844af590a..4c8e7dcf70 100644
> --- a/hw/net/e1000x_common.c
> +++ b/hw/net/e1000x_common.c
> @@ -220,15 +220,14 @@ e1000x_update_rx_total_stats(uint32_t *mac,
>   
>       e1000x_increase_size_stats(mac, PRCregs, data_fcs_size);
>       e1000x_inc_reg_if_not_full(mac, TPR);
> -    mac[GPRC] = mac[TPR];
> +    e1000x_inc_reg_if_not_full(mac, GPRC);
>       /* TOR - Total Octets Received:
>       * This register includes bytes received in a packet from the <Destination
>       * Address> field through the <CRC> field, inclusively.
>       * Always include FCS length (4) in size.
>       */
>       e1000x_grow_8reg_if_not_full(mac, TORL, data_size + 4);
> -    mac[GORCL] = mac[TORL];
> -    mac[GORCH] = mac[TORH];
> +    e1000x_grow_8reg_if_not_full(mac, GORCL, data_size + 4);
>   }
>   
>   void
> diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
> index d733fed6cf..826e7a6cf1 100644
> --- a/hw/net/igb_core.c
> +++ b/hw/net/igb_core.c
> @@ -538,9 +538,8 @@ igb_on_tx_done_update_stats(IGBCore *core, struct NetTxPkt *tx_pkt, int qn)
>           g_assert_not_reached();
>       }
>   
> -    core->mac[GPTC] = core->mac[TPT];
> -    core->mac[GOTCL] = core->mac[TOTL];
> -    core->mac[GOTCH] = core->mac[TOTH];
> +    e1000x_inc_reg_if_not_full(core->mac, GPTC);
> +    e1000x_grow_8reg_if_not_full(core->mac, GOTCL, tot_len);
>   
>       if (core->mac[MRQC] & 1) {
>           uint16_t pool = qn % IGB_NUM_VM_POOLS;

