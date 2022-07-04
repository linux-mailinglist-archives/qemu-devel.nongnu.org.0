Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27600564E74
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 09:12:46 +0200 (CEST)
Received: from localhost ([::1]:60062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8GGC-0006eH-Tn
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 03:12:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1o8GEE-0005RC-RF
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 03:10:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1o8GEB-00016G-J6
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 03:10:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656918638;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p4A2UadpP7Vpqsa+zDd7Gm0biljatrKHc4p/eQcFvqU=;
 b=E69QbUhJ677u3CpTD4RJkPPOEZwYnp57KQnTaIXV8sRRatjXvTZFiWTl/eEXvCh4bTm06R
 f+jkK4u8ckKjETdeTwkDQqRUi6tTc1fzX4oIxZ+b25qXhXHdQlg2ZeH3p9HfX9wgC4wc5x
 hn9TzMYaaDT0kgp39aqMkiWhdzSAsnU=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-671-CAvJWkYWMvetV7v62PYcjw-1; Mon, 04 Jul 2022 03:10:37 -0400
X-MC-Unique: CAvJWkYWMvetV7v62PYcjw-1
Received: by mail-pj1-f69.google.com with SMTP id
 o13-20020a17090a9f8d00b001ef7c429b91so2698456pjp.6
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 00:10:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=p4A2UadpP7Vpqsa+zDd7Gm0biljatrKHc4p/eQcFvqU=;
 b=I8xF5i3u9eaI1EBayeueFDUP6c4dEpT6DtKL4OexKygmCyoV1DikHXbQQqBWmt9K0D
 CXQD1goAHRG3fbwTwmwuWB9Knqt5JZt27qQ+ZEbOd7YelAdY6UZP0THLS7HCeKWst0nP
 0uUvLWaNz9hyp2FwPaUu5M8mBSDduddc4rEvC7CqK//ZYrSylXY8QB3YeNVXGySCjDv+
 pmQxoRXBYNe1r2Ng9ynzHh+6hRxlGCaVQd0C54Px9lxvoudqcT6oFXq1V/0B++ZpzBoP
 OsEV41WzH+eGuy+CGcTnJUUFxE2LlxTTzXEiwLR2deC8xpG3WZ6+430TTxATY+ypG7W3
 qSQA==
X-Gm-Message-State: AJIora9s+vBbM/oATMmYe2sC5gKhR5XsAi2LgvKNxFqP30sutCLYaFCo
 5IxCemL3tTraxCdcafciZN8oWF9iNWXSQ+/Sj3SXB6MiuL7IJCFvuIYE6yv6b3A+XqVnSip2U6d
 rAEHOoJrSq+b6NXU=
X-Received: by 2002:a63:f70c:0:b0:412:1877:7e1c with SMTP id
 x12-20020a63f70c000000b0041218777e1cmr8415079pgh.621.1656918636606; 
 Mon, 04 Jul 2022 00:10:36 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uIFNCN60VZWwm6jICla+E5okPUUDyl+cqSYMX4Tv4k22ptfWizrskRCOCjIq0kVsoGY/09gg==
X-Received: by 2002:a63:f70c:0:b0:412:1877:7e1c with SMTP id
 x12-20020a63f70c000000b0041218777e1cmr8415057pgh.621.1656918636327; 
 Mon, 04 Jul 2022 00:10:36 -0700 (PDT)
Received: from [10.72.13.251] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 c16-20020a170902b69000b001678dcb4c5asm20369492pls.100.2022.07.04.00.10.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Jul 2022 00:10:35 -0700 (PDT)
Message-ID: <9f349685-b935-942b-57ac-ff5499cda210@redhat.com>
Date: Mon, 4 Jul 2022 15:10:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH] e1000: set RX descriptor status in a separate operation
Content-Language: en-US
To: Ding Hui <dinghui@sangfor.com.cn>, asm@asm.pp.ru
Cc: qemu-devel@nongnu.org, zhangjing@sangfor.com.cn,
 lifan38153@sangfor.com.cn, Stefan Hajnoczi <stefanha@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 qemu-stable@nongnu.org
References: <20220629094026.558-1-dinghui@sangfor.com.cn>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20220629094026.558-1-dinghui@sangfor.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


在 2022/6/29 17:40, Ding Hui 写道:
> The code of setting RX descriptor status field maybe work fine in
> previously, however with the update of glibc version, it shows two
> issues when guest using dpdk receive packets:
>
>    1. The dpdk has a certain probability getting wrong buffer_addr
>
>       this impact may be not obvious, such as lost a packet once in
>       a while
>
>    2. The dpdk may consume a packet twice when scan the RX desc queue
>       over again
>
>       this impact will lead a infinite wait in Qemu, since the RDT
>       (tail pointer) be inscreased to equal to RDH by unexpected,
>       which regard as the RX desc queue is full
>
> Write a whole of RX desc with DD flag on is not quite correct, because
> when the underlying implementation of memcpy using XMM registers to
> copy e1000_rx_desc (when AVX or something else CPU feature is usable),
> the bytes order of desc writing to memory is indeterminacy
>
> We can use full-scale test case to reproduce the issue-2 by
> https://github.com/BASM/qemu_dpdk_e1000_test (thanks to Leonid Myravjev)
>
> I also write a POC test case at https://github.com/cdkey/e1000_poc
> which can reproduce both of them, and easy to verify the patch effect.
>
> The hw watchpoint also shows that, when Qemu using XMM related instructions
> writing 16 bytes e1000_rx_desc, concurrent with DPDK using movb
> writing 1 byte status, the final result of writing to memory will be one
> of them, if it made by Qemu which DD flag is on, DPDK will consume it
> again.
>
> Setting DD status in a separate operation, can prevent the impact of
> disorder memory writing by memcpy, also avoid unexpected data when
> concurrent writing status by qemu and guest dpdk.
>
> Links: https://lore.kernel.org/qemu-devel/20200102110504.GG121208@stefanha-x1.localdomain/T/
>
> Reported-by: Leonid Myravjev <asm@asm.pp.ru>
> Cc: Stefan Hajnoczi <stefanha@gmail.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Michael S. Tsirkin <mst@redhat.com>
> Cc: qemu-stable@nongnu.org
> Tested-by: Jing Zhang <zhangjing@sangfor.com.cn>
> Reviewed-by: Frank Lee <lifan38153@sangfor.com.cn>
> Signed-off-by: Ding Hui <dinghui@sangfor.com.cn>
> ---
>   hw/net/e1000.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/hw/net/e1000.c b/hw/net/e1000.c
> index f5bc81296d..e26e0a64c1 100644
> --- a/hw/net/e1000.c
> +++ b/hw/net/e1000.c
> @@ -979,7 +979,7 @@ e1000_receive_iov(NetClientState *nc, const struct iovec *iov, int iovcnt)
>           base = rx_desc_base(s) + sizeof(desc) * s->mac_reg[RDH];
>           pci_dma_read(d, base, &desc, sizeof(desc));
>           desc.special = vlan_special;
> -        desc.status |= (vlan_status | E1000_RXD_STAT_DD);
> +        desc.status &= ~E1000_RXD_STAT_DD;
>           if (desc.buffer_addr) {
>               if (desc_offset < size) {
>                   size_t iov_copy;
> @@ -1013,6 +1013,9 @@ e1000_receive_iov(NetClientState *nc, const struct iovec *iov, int iovcnt)
>               DBGOUT(RX, "Null RX descriptor!!\n");
>           }
>           pci_dma_write(d, base, &desc, sizeof(desc));
> +        desc.status |= (vlan_status | E1000_RXD_STAT_DD);
> +        pci_dma_write(d, base + offsetof(struct e1000_rx_desc, status),
> +                      &desc.status, sizeof(desc.status));


Good catch, but to be more safe, I wonder if we can simply use 
stx_le_pci_dma() here?

Thanks


>   
>           if (++s->mac_reg[RDH] * sizeof(desc) >= s->mac_reg[RDLEN])
>               s->mac_reg[RDH] = 0;


