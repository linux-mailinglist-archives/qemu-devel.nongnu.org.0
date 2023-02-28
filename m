Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 433CD6A5A12
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 14:40:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pX0CS-0002kb-Iv; Tue, 28 Feb 2023 08:39:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pX0CP-0002ch-Sv
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 08:39:21 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pX0CO-00017s-8W
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 08:39:21 -0500
Received: by mail-wr1-x436.google.com with SMTP id t15so9775435wrz.7
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 05:39:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IQyjIY73kYfSoFunfDcx8s5b4BrBg2D4Pp8oYI2f7gU=;
 b=QHXax0Q8JDWhajBdfJMqyhbnOv/nWpH7nKAns2a8YMKvVGbausGIr21qSVLUCV/GGR
 hhhWgjdyaUyExqTXxcsTIGBxvO07yU0KA3fI04g9sLD0MzdKkYlffvqNRzw1w5TrTlAL
 3ogASXkYrxh0AzX91fU5RY+hoSDJ/jC+Vg0y4Wpipjyxz3he9ffwAo7Y6jDcpOTPZLby
 FvYa/7LMq6Q5GfvRwDAHKRsdyPcEUxGsEi9yfpSk6JIKDoYv3aENn0q1221wdBRFGznC
 /b4ECruaygsbYSIeOoX7oDB3/w+zb20+DwV/2KQpd6qumut+e+tNsE27k2u5STzrcOEk
 5xzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IQyjIY73kYfSoFunfDcx8s5b4BrBg2D4Pp8oYI2f7gU=;
 b=jBdnpZgAma4o5uX58p00Q6fKlSjHTQEErKgip+Msrj6jqlCvQwb7vbItGV1mR73Vkt
 TqwqdIvSGr7459cSd+qh7HNyauvyBocKVTwbO626Lc627mwzMbszYe+L17pLh48ULdmf
 jCWwmYgCN1bYA1209EaIYFCyNmQPcLmYJkKOqFrik2KGc4frQimffkhhB5iutCoPm6Tn
 +HwLXinCvNIxeV1CnUBER2saQrTYLkKYsnm0U9RHa6DDRB8t9ghN2iy/nZc1l+3A68Pc
 2rofNx0/CYHzai9CaYypvWCQPEKsXA/lV5bMctge/S1iSekfIuwYw74l4/NkczEoBZT1
 D3Xw==
X-Gm-Message-State: AO0yUKXeJnt9pQX7qCxkqj/2f+HFHI6yGjyNvMtwNemmIcjG+vbW+GvS
 V0+BGTs295rZzMEyg86Hgl+926izgyz8iUKj
X-Google-Smtp-Source: AK7set8JBva3YytNahgu1bSyg4YdqZH9K6Ftp/o7BzGIzGJadDlrFNyCklJTB8MOw+CDEw/op6ukqA==
X-Received: by 2002:a05:6000:c8:b0:2c3:e0a0:93f with SMTP id
 q8-20020a05600000c800b002c3e0a0093fmr2121111wrx.8.1677591558436; 
 Tue, 28 Feb 2023 05:39:18 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 l15-20020a05600012cf00b002be505ab59asm9970001wrx.97.2023.02.28.05.39.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Feb 2023 05:39:17 -0800 (PST)
Message-ID: <a06d79d2-9cb8-9c36-ce49-f764b062d518@linaro.org>
Date: Tue, 28 Feb 2023 14:39:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v3 08/14] hw/net/ne2000-pci: Replace
 DO_UPCAST(PCINE2000State) by PCI_NE2000()
Content-Language: en-US
To: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 Jason Wang <jasowang@redhat.com>
Cc: qemu-block@nongnu.org, Hu Tao <hutao@cn.fujitsu.com>,
 Gonglei Arei <arei.gonglei@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>, Li Qiang <liq3ea@163.com>,
 Thomas Huth <thuth@redhat.com>, Cao jin <caoj.fnst@cn.fujitsu.com>,
 xiaoqiang zhao <zxq_yx_007@163.com>
References: <20230213184338.46712-1-philmd@linaro.org>
 <20230213184338.46712-9-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230213184338.46712-9-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.092,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Hi Jason, do you Ack this patch?

On 13/2/23 19:43, Philippe Mathieu-Daudé wrote:
> Define TYPE_PCI_NE2000 and the QOM PCI_NE2000() macro.
> Use PCI_NE2000() instead of DO_UPCAST().
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/net/ne2000-pci.c | 18 ++++++++++++------
>   1 file changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/net/ne2000-pci.c b/hw/net/ne2000-pci.c
> index edc6689d33..0332e7f616 100644
> --- a/hw/net/ne2000-pci.c
> +++ b/hw/net/ne2000-pci.c
> @@ -30,10 +30,16 @@
>   #include "ne2000.h"
>   #include "sysemu/sysemu.h"
>   
> -typedef struct PCINE2000State {
> +#define TYPE_PCI_NE2000 "ne2k_pci"
> +OBJECT_DECLARE_SIMPLE_TYPE(PCINE2000State, PCI_NE2000)
> +
> +struct PCINE2000State {
> +    /*< private >*/
>       PCIDevice dev;
> +    /*< public >*/
> +
>       NE2000State ne2000;
> -} PCINE2000State;
> +};
>   
>   static const VMStateDescription vmstate_pci_ne2000 = {
>       .name = "ne2000",
> @@ -54,7 +60,7 @@ static NetClientInfo net_ne2000_info = {
>   
>   static void pci_ne2000_realize(PCIDevice *pci_dev, Error **errp)
>   {
> -    PCINE2000State *d = DO_UPCAST(PCINE2000State, dev, pci_dev);
> +    PCINE2000State *d = PCI_NE2000(pci_dev);
>       NE2000State *s;
>       uint8_t *pci_conf;
>   
> @@ -77,7 +83,7 @@ static void pci_ne2000_realize(PCIDevice *pci_dev, Error **errp)
>   
>   static void pci_ne2000_exit(PCIDevice *pci_dev)
>   {
> -    PCINE2000State *d = DO_UPCAST(PCINE2000State, dev, pci_dev);
> +    PCINE2000State *d = PCI_NE2000(pci_dev);
>       NE2000State *s = &d->ne2000;
>   
>       qemu_del_nic(s->nic);
> @@ -87,7 +93,7 @@ static void pci_ne2000_exit(PCIDevice *pci_dev)
>   static void ne2000_instance_init(Object *obj)
>   {
>       PCIDevice *pci_dev = PCI_DEVICE(obj);
> -    PCINE2000State *d = DO_UPCAST(PCINE2000State, dev, pci_dev);
> +    PCINE2000State *d = PCI_NE2000(pci_dev);
>       NE2000State *s = &d->ne2000;
>   
>       device_add_bootindex_property(obj, &s->c.bootindex,
> @@ -117,7 +123,7 @@ static void ne2000_class_init(ObjectClass *klass, void *data)
>   }
>   
>   static const TypeInfo ne2000_info = {
> -    .name          = "ne2k_pci",
> +    .name          = TYPE_PCI_NE2000,
>       .parent        = TYPE_PCI_DEVICE,
>       .instance_size = sizeof(PCINE2000State),
>       .class_init    = ne2000_class_init,


