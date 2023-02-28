Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B6C26A5A11
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 14:38:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pX0B9-0001nQ-1A; Tue, 28 Feb 2023 08:38:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pX0B1-0001mt-Mx
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 08:37:59 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pX0Az-0000nb-Ve
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 08:37:55 -0500
Received: by mail-wr1-x42e.google.com with SMTP id q16so9791427wrw.2
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 05:37:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vrM+Jzvvr11us9zAruSNQhpzPzpITmPlXpsveZHFKTk=;
 b=E6w1O3HYm1H/aSnr4DLxh0YJCt/S5nx5bu+215cPhZ4TJZJ8puRvkNuJ0jgHhcyBYZ
 rSFBwh5+utUabnwo/bpFm4mK7JXIE6VNxvWQe8wPlwmLZGxoIS2pNPvVZtjIU3FNVF9b
 mRc8pi8WkSbd1bMV8CaCREQplAtyNDxT9Y3s0U7mkH5x1gNP1PHChW7CGLLYaURdAVMS
 P0i9iBKCjFDKHr+msVWPpK87KGG97DVkdDAqah7FhXkP89QndE6PE+vA0PdRh0+5hGfX
 4QySbsHr3pqLP5qEklM2BRNoEAYe5vCvMztFMYlYCcwOCL5qHJBlCyPwpGybgHHHOlFw
 51xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vrM+Jzvvr11us9zAruSNQhpzPzpITmPlXpsveZHFKTk=;
 b=IBMtoYXBSKmv9iTe75KsF77PmJp09OMmVzLl0KE7GqjK0lgmN4U1brSgg/1/nVfPHi
 Zm8A9WgFxjLeYAnxpNWNf5IRFygG0nFxVM/DRDFZ94G7304g0XDztlg7BWufAm6dlhSw
 pAIIJi8T8KrSNudcadJLnNSJ9aZ7eU3JV+uUHwPO6LvA86BJi8gW7Av/uOYUyDX7r5rz
 dSazwOkuZIdSuPp/D20YXXHUqRa2KK2Qx001ZyNyg66M6LdlGV/At5uDctmxxoZW5zp7
 P+/kIgZ4lfgWpltPGZgDIZie0K99NrU4jbT/uI+3OwQkasTEUqrpA3cOJI10rrIhhx+R
 IvEQ==
X-Gm-Message-State: AO0yUKVFcfCsUNICYrIloSERmH35GcSH7VLE32NpvGCpnq4PQZ26n7V7
 RQ3zReecRw39Awvw9fQ0wCMVFjVkenelxROv
X-Google-Smtp-Source: AK7set8KNstNyTWiyuOtFhNdwivjc0dlLuTCuPRqHufjP8g67QIZM+sWnHGTdTNPWnNSJN+cV3MYcg==
X-Received: by 2002:a5d:5009:0:b0:2c5:5a65:79a0 with SMTP id
 e9-20020a5d5009000000b002c55a6579a0mr2497840wrt.53.1677591472007; 
 Tue, 28 Feb 2023 05:37:52 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 w15-20020adfee4f000000b002be5bdbe40csm9804458wro.27.2023.02.28.05.37.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Feb 2023 05:37:51 -0800 (PST)
Message-ID: <0655fae9-80db-c26b-ded1-406fd82c1331@linaro.org>
Date: Tue, 28 Feb 2023 14:37:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 2/2] hw/pci: Trace IRQ routing on PCI topology
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>, BALATON Zoltan <balaton@eik.bme.hu>
References: <20230211152239.88106-1-philmd@linaro.org>
 <20230211152239.88106-3-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230211152239.88106-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
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

ping

On 11/2/23 16:22, Philippe Mathieu-Daudé wrote:
> Trace how IRQ are rooted from EP to RC.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/pci/pci.c        | 8 ++++++++
>   hw/pci/trace-events | 1 +
>   2 files changed, 9 insertions(+)
> 
> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> index 805e4b0c68..2e785e3aef 100644
> --- a/hw/pci/pci.c
> +++ b/hw/pci/pci.c
> @@ -279,9 +279,13 @@ static void pci_change_irq_level(PCIDevice *pci_dev, int irq_num, int change)
>   {
>       PCIBus *bus;
>       for (;;) {
> +        int dev_irq = irq_num;
>           bus = pci_get_bus(pci_dev);
>           assert(bus->map_irq);
>           irq_num = bus->map_irq(pci_dev, irq_num);
> +        trace_pci_route_irq(dev_irq, DEVICE(pci_dev)->canonical_path, irq_num,
> +                            pci_bus_is_root(bus) ? "root-complex"
> +                                    : DEVICE(bus->parent_dev)->canonical_path);
>           if (bus->set_irq)
>               break;
>           pci_dev = bus->parent_dev;
> @@ -1600,8 +1604,12 @@ PCIINTxRoute pci_device_route_intx_to_irq(PCIDevice *dev, int pin)
>       PCIBus *bus;
>   
>       do {
> +        int dev_irq = pin;
>           bus = pci_get_bus(dev);
>           pin = bus->map_irq(dev, pin);
> +        trace_pci_route_irq(dev_irq, DEVICE(dev)->canonical_path, pin,
> +                            pci_bus_is_root(bus) ? "root-complex"
> +                                    : DEVICE(bus->parent_dev)->canonical_path);
>           dev = bus->parent_dev;
>       } while (dev);
>   
> diff --git a/hw/pci/trace-events b/hw/pci/trace-events
> index aaf46bc92d..42430869ce 100644
> --- a/hw/pci/trace-events
> +++ b/hw/pci/trace-events
> @@ -3,6 +3,7 @@
>   # pci.c
>   pci_update_mappings_del(const char *dev, uint32_t bus, uint32_t slot, uint32_t func, int bar, uint64_t addr, uint64_t size) "%s %02x:%02x.%x %d,0x%"PRIx64"+0x%"PRIx64
>   pci_update_mappings_add(const char *dev, uint32_t bus, uint32_t slot, uint32_t func, int bar, uint64_t addr, uint64_t size) "%s %02x:%02x.%x %d,0x%"PRIx64"+0x%"PRIx64
> +pci_route_irq(int dev_irq, const char *dev_path, int parent_irq, const char *parent_path) "IRQ %d @%s -> IRQ %d @%s"
>   
>   # pci_host.c
>   pci_cfg_read(const char *dev, uint32_t bus, uint32_t slot, uint32_t func, unsigned offs, unsigned val) "%s %02x:%02x.%x @0x%x -> 0x%x"


