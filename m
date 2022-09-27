Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDAB15EB934
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 06:26:42 +0200 (CEST)
Received: from localhost ([::1]:58224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od2B7-0007L3-76
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 00:26:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1od29S-0005yD-Rf
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 00:24:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42227)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1od29O-00017Q-Bd
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 00:24:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664252693;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T7xg7x6M2H4EOE0VMbGkiXc/TBdustWQZstGLiagHOY=;
 b=XP+yvkQnuuHKLwYRkyVlkYMh9+ErBBIqzgboQj78TDjzHGR0Kec6iqov8IlNeC9j4Kboc2
 v4t0hwLoFl4EhGNHGlGteoAVPhgJI+mlTbVQ5DrJ9HiJpwg8GLqiZ8iRDGLN3uKGVzj++d
 /drF69aa98IGRpUiuGcNEpSdZlo6egk=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-350-Y21ySGT5PzqapB2ENUnhrQ-1; Tue, 27 Sep 2022 00:24:49 -0400
X-MC-Unique: Y21ySGT5PzqapB2ENUnhrQ-1
Received: by mail-pj1-f70.google.com with SMTP id
 z9-20020a17090a468900b00202fdb32ba1so4017740pjf.1
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 21:24:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=T7xg7x6M2H4EOE0VMbGkiXc/TBdustWQZstGLiagHOY=;
 b=QZj76vaGOa17fMKaYjee3kKHeI2pwUy5hIUKSOJK8bKy1BKAIVTUa5a3Zr9IvPu47Y
 Brgc18FPacNLGkZ5dxjpxLMrL7ctk/hwUfZ6pMRf6d/1XeddF3jRCVjOpX9lVclWB+S+
 OpnXUXYpAuIlCWFqZuuDq8GKGBu9h4meo2X/7aZYJxVSfY3R+5uLJaqSjZ5StMcQQpoX
 sLECao+n3E/E6eQZSf3knER/pZBVo1M9XFjPV6XjKcRRb/ycDlTvp7/p+9iN9Pboz3kC
 LcuHPCCj6cp15g40kXgpC2Y0PxvW36HvgjguIP9L/h67uC37mha/7Xcv7f8UY6JKId3e
 e4jw==
X-Gm-Message-State: ACrzQf1qs4ImHp1sfYeOs8uS+k4kjeI0TreZgQTlzDG/w0f4KDK9YZTu
 8swj4MbJDfJE3T6BSdUmFO4yHUhLqEdc2CueNF0wcrepXy6iB6SAvayMfk6DpmIaGRmLOcKzGak
 DwPZ9K4fEVLuJDvk=
X-Received: by 2002:a05:6a02:318:b0:43c:e24a:961c with SMTP id
 bn24-20020a056a02031800b0043ce24a961cmr3375144pgb.589.1664252688905; 
 Mon, 26 Sep 2022 21:24:48 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM54vFQMAASqJNeBrzEBdyv24Vex8xR//PMf1seV1KniQ1fbfYs3OQLoO7m107ESWmEG7AiWsg==
X-Received: by 2002:a05:6a02:318:b0:43c:e24a:961c with SMTP id
 bn24-20020a056a02031800b0043ce24a961cmr3375131pgb.589.1664252688663; 
 Mon, 26 Sep 2022 21:24:48 -0700 (PDT)
Received: from [10.72.12.230] ([43.228.180.230])
 by smtp.gmail.com with ESMTPSA id
 rm10-20020a17090b3eca00b00202618f0df4sm7729057pjb.0.2022.09.26.21.24.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Sep 2022 21:24:48 -0700 (PDT)
Message-ID: <1b17371c-0842-19b9-ae49-6f59e46cbf04@redhat.com>
Date: Tue, 27 Sep 2022 12:24:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.1
Subject: Re: [PATCH v2] e1000e: set RX desc status with DD flag in a separate
 operation
Content-Language: en-US
To: Ding Hui <dinghui@sangfor.com.cn>, dmitry.fleytman@gmail.com
Cc: qemu-devel@nongnu.org, georgmueller@gmx.net
References: <20220914121647.11585-1-dinghui@sangfor.com.cn>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20220914121647.11585-1-dinghui@sangfor.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.319, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2022/9/14 20:16, Ding Hui 写道:
> Like commit 034d00d48581 ("e1000: set RX descriptor status in
> a separate operation"), there is also same issue in e1000e, which
> would cause lost packets or stop sending packets to VM with DPDK.
>
> Do similar fix in e1000e.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/402
> Signed-off-by: Ding Hui <dinghui@sangfor.com.cn>


Applied.

Thanks


> ---
>   hw/net/e1000e_core.c | 53 +++++++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 52 insertions(+), 1 deletion(-)
>
> ---
> v2: use uint8_t/uint32_t directly instead of typeof
>
> diff --git a/hw/net/e1000e_core.c b/hw/net/e1000e_core.c
> index 208e3e0d79..a570b366b2 100644
> --- a/hw/net/e1000e_core.c
> +++ b/hw/net/e1000e_core.c
> @@ -1364,6 +1364,57 @@ struct NetRxPkt *pkt, const E1000E_RSSInfo *rss_info,
>       }
>   }
>   
> +static inline void
> +e1000e_pci_dma_write_rx_desc(E1000ECore *core, dma_addr_t addr,
> +                             uint8_t *desc, dma_addr_t len)
> +{
> +    PCIDevice *dev = core->owner;
> +
> +    if (e1000e_rx_use_legacy_descriptor(core)) {
> +        struct e1000_rx_desc *d = (struct e1000_rx_desc *) desc;
> +        size_t offset = offsetof(struct e1000_rx_desc, status);
> +        uint8_t status = d->status;
> +
> +        d->status &= ~E1000_RXD_STAT_DD;
> +        pci_dma_write(dev, addr, desc, len);
> +
> +        if (status & E1000_RXD_STAT_DD) {
> +            d->status = status;
> +            pci_dma_write(dev, addr + offset, &status, sizeof(status));
> +        }
> +    } else {
> +        if (core->mac[RCTL] & E1000_RCTL_DTYP_PS) {
> +            union e1000_rx_desc_packet_split *d =
> +                (union e1000_rx_desc_packet_split *) desc;
> +            size_t offset = offsetof(union e1000_rx_desc_packet_split,
> +                wb.middle.status_error);
> +            uint32_t status = d->wb.middle.status_error;
> +
> +            d->wb.middle.status_error &= ~E1000_RXD_STAT_DD;
> +            pci_dma_write(dev, addr, desc, len);
> +
> +            if (status & E1000_RXD_STAT_DD) {
> +                d->wb.middle.status_error = status;
> +                pci_dma_write(dev, addr + offset, &status, sizeof(status));
> +            }
> +        } else {
> +            union e1000_rx_desc_extended *d =
> +                (union e1000_rx_desc_extended *) desc;
> +            size_t offset = offsetof(union e1000_rx_desc_extended,
> +                wb.upper.status_error);
> +            uint32_t status = d->wb.upper.status_error;
> +
> +            d->wb.upper.status_error &= ~E1000_RXD_STAT_DD;
> +            pci_dma_write(dev, addr, desc, len);
> +
> +            if (status & E1000_RXD_STAT_DD) {
> +                d->wb.upper.status_error = status;
> +                pci_dma_write(dev, addr + offset, &status, sizeof(status));
> +            }
> +        }
> +    }
> +}
> +
>   typedef struct e1000e_ba_state_st {
>       uint16_t written[MAX_PS_BUFFERS];
>       uint8_t cur_idx;
> @@ -1600,7 +1651,7 @@ e1000e_write_packet_to_guest(E1000ECore *core, struct NetRxPkt *pkt,
>   
>           e1000e_write_rx_descr(core, desc, is_last ? core->rx_pkt : NULL,
>                              rss_info, do_ps ? ps_hdr_len : 0, &bastate.written);
> -        pci_dma_write(d, base, &desc, core->rx_desc_len);
> +        e1000e_pci_dma_write_rx_desc(core, base, desc, core->rx_desc_len);
>   
>           e1000e_ring_advance(core, rxi,
>                               core->rx_desc_len / E1000_MIN_RX_DESC_LEN);


