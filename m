Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67FAC4313C2
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 11:43:54 +0200 (CEST)
Received: from localhost ([::1]:49442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcPBR-0002kU-Id
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 05:43:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mcPAN-0001aB-96
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 05:42:47 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:33477)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mcPAL-0000tO-Bp
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 05:42:46 -0400
Received: by mail-wr1-x42f.google.com with SMTP id m22so40356507wrb.0
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 02:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=a+IrY+CB9A9psFI+EBTDXJZBoTjXrm5oUHqESty9xa0=;
 b=Gxejg/jWogfnVwwACaUsAUVWJcK3EJV+4XhYkWe6eirRW6nJ7FtNJqEwMDJQXjf8NL
 CFKtczVBqLmEhrYUtgFBdmcaSU+7hOcV3hvjsI996OCmw98dNoi8xMjVE2uujoJIRCVq
 VS+OlXCWm6jDbTk1alE7s8bJIQZdEuctHaxM3MulVDKZ7gkAAlEcC/eooPm/RUdYJgO4
 nVx3RzQsaVgJI5dnMSRGsDsrrDjCCwoiRtEn8FA1c9kWo7lHnqJJ0s0WRYGT9j3SWPpZ
 FRMHCst0X5AFyLmaIQV0nbxgj+NXSBFWZ4udEzR5jy+ueDFUxiliwppwhJdvqd3gbirQ
 OipA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=a+IrY+CB9A9psFI+EBTDXJZBoTjXrm5oUHqESty9xa0=;
 b=YjElhEDyflId2J35s+JpNwOkVUrc3mNGeG0vUqINBE+pM8q+SUyUrblEwwxCc3KOn4
 uu7reVxx+h/e4QWVHjznryCWK6W4t+S99yXO8brvtwACaL2BST43qlDboWpZWpv/P/Ms
 kkl3IcooHO9/RYKE/NM6MKpu0ZroXwEw5RwGwoyOppyyIDKX3jb8y5j2e8Df/qrSBE2A
 iklCVxs/Fc3hPrGBA7BwhBlk4WncEmWrv6JzVozFVjPTz4lEv9yaKWGHSb/CHeOaQYGc
 0/JenUSd5b5k45rFw4bGhF2n05ErHpXGq0JZ0iOsE9WmCE+Pmw3Ar+qpWEnwKEgEdPiN
 y8OA==
X-Gm-Message-State: AOAM532WkjVNo7GgZFQzGvxG5LJQT1usYtl7A2iFccEMSkP+6bcj3viz
 QymTg3+Jz46VHy7Hc/Uydtg=
X-Google-Smtp-Source: ABdhPJwknaqB0osoTzJNp+WFNmgQuHeApdK6IrSALTBZOGCNK3lMxvzlqOAwfVsLgVUtbtaFBSfCMw==
X-Received: by 2002:a05:6000:1885:: with SMTP id
 a5mr33177746wri.64.1634550163641; 
 Mon, 18 Oct 2021 02:42:43 -0700 (PDT)
Received: from [192.168.1.36] (213.red-81-36-146.dynamicip.rima-tde.net.
 [81.36.146.213])
 by smtp.gmail.com with ESMTPSA id k6sm12413703wri.83.2021.10.18.02.42.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Oct 2021 02:42:43 -0700 (PDT)
Message-ID: <549ece11-990f-a19b-5dfe-508e315a6163@amsat.org>
Date: Mon, 18 Oct 2021 11:42:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH] via-ide: Avoid expensive operations in irq handler
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org
References: <20211018014059.13E65746353@zero.eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211018014059.13E65746353@zero.eik.bme.hu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Huacai Chen <chenhuacai@kernel.org>, John Snow <jsnow@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/18/21 03:36, BALATON Zoltan wrote:
> Cache the pointer to PCI function 0 (ISA bridge, that this IDE device
> has to use for IRQs) in the PCIIDEState and pass that as the opaque
> data for the interrupt handler to eliminate both the need to look up
> function 0 at every interrupt and also a QOM type cast of the opaque
> pointer as that's also expensive (mainly due to qom-debug being
> enabled by default).
> 
> Suggested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>  hw/ide/via.c         | 11 ++++++-----
>  include/hw/ide/pci.h |  1 +
>  2 files changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/ide/via.c b/hw/ide/via.c
> index 82def819c4..30566bc409 100644
> --- a/hw/ide/via.c
> +++ b/hw/ide/via.c
> @@ -104,15 +104,15 @@ static void bmdma_setup_bar(PCIIDEState *d)
>  
>  static void via_ide_set_irq(void *opaque, int n, int level)
>  {
> -    PCIDevice *d = PCI_DEVICE(opaque);
> +    PCIIDEState *d = opaque;
>  
>      if (level) {
> -        d->config[0x70 + n * 8] |= 0x80;
> +        d->parent_obj.config[0x70 + n * 8] |= 0x80;
>      } else {
> -        d->config[0x70 + n * 8] &= ~0x80;
> +        d->parent_obj.config[0x70 + n * 8] &= ~0x80;
>      }

Better not to access parent_obj, so I'd rather keep the previous
code as it. The rest is OK, thanks. If you don't want to respin
I can fix and take via mips-next.

>  
> -    via_isa_set_irq(pci_get_function_0(d), 14 + n, level);
> +    via_isa_set_irq(d->func0, 14 + n, level);
>  }
>  
>  static void via_ide_reset(DeviceState *dev)
> @@ -188,7 +188,8 @@ static void via_ide_realize(PCIDevice *dev, Error **errp)
>      bmdma_setup_bar(d);
>      pci_register_bar(dev, 4, PCI_BASE_ADDRESS_SPACE_IO, &d->bmdma_bar);
>  
> -    qdev_init_gpio_in(ds, via_ide_set_irq, 2);
> +    d->func0 = pci_get_function_0(dev);
> +    qdev_init_gpio_in_named_with_opaque(ds, via_ide_set_irq, d, NULL, 2);
>      for (i = 0; i < 2; i++) {
>          ide_bus_init(&d->bus[i], sizeof(d->bus[i]), ds, i, 2);
>          ide_init2(&d->bus[i], qdev_get_gpio_in(ds, i));
> diff --git a/include/hw/ide/pci.h b/include/hw/ide/pci.h
> index d8384e1c42..89d14abf95 100644
> --- a/include/hw/ide/pci.h
> +++ b/include/hw/ide/pci.h
> @@ -50,6 +50,7 @@ struct PCIIDEState {
>      IDEBus bus[2];
>      BMDMAState bmdma[2];
>      uint32_t secondary; /* used only for cmd646 */
> +    PCIDevice *func0; /* used only by IDE functions of superio chips */
>      MemoryRegion bmdma_bar;
>      MemoryRegion cmd_bar[2];
>      MemoryRegion data_bar[2];
> 

