Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8859348E8FD
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 12:13:27 +0100 (CET)
Received: from localhost ([::1]:37458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8KWM-000831-M9
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 06:13:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n8KMC-0003Xs-0j; Fri, 14 Jan 2022 06:02:56 -0500
Received: from [2a00:1450:4864:20::42f] (port=39727
 helo=mail-wr1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n8KMA-0002zo-9U; Fri, 14 Jan 2022 06:02:55 -0500
Received: by mail-wr1-x42f.google.com with SMTP id s1so14965279wra.6;
 Fri, 14 Jan 2022 03:02:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=t/G7JZA9GQDFGfYcKoq7rnD+jJp/08VTYN/09/cRKc4=;
 b=X3EnmfRzzUCkoKzau5pNnZ7iZ+INseRQ75C1ofylalMX35Y+WBDgf63tSrFdlRtmkE
 1RDXrAlKxXoJ/LIpqzSUPWdEJhaGIlWYaP1esYACXAaThenXrolN2IZxgxT+5J39O7tf
 5s18Wu+2nzl3U1GsTI/vXDZq3yjjnYQssPJ2sYp4/cle1aTEyxIa+q33XEslVWkNe5/4
 Sc+SQaZOF5Ht82sLMEoPn4964FDR1qrVMkaKe8APogfjFrMVpz9QkLAE8k+OkbkIAONu
 7L4SQopTl5UrzOoRb1/mxsUgRsSbRk+FhktijIblNYpJym+DjHzkDOEn6KtFr8taDPkw
 XbRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=t/G7JZA9GQDFGfYcKoq7rnD+jJp/08VTYN/09/cRKc4=;
 b=cx17F7OSPfEP03XK2pU+9g5DqLEqSXl1EdN7kYqScjqudRH/m+vJVZ61y6K9/iA2lK
 2k0yYEjAVtuN6qpf3n8VBvzMj/OfLPx3jOtB91rfu8D2QGltet3YklW2f0fmdLWV4oyE
 kSRWGYSnJddOOxgvp7z6qr+sriLd5WKeVWDSsQNLMNeimi3PhJ+C6BUE1FRgsxyLb2hi
 NWTPoqFDMAajbnevwqhTdMR5HAixqSMDHkxUB9VHAeN7yyZpt/FjWRp836SFXW89hqMs
 divpOiLiwiYB4UXKtemJPJaY98HOtkIYUxfNxIdkqfnYkSRqYwV8s35X7yqq47on9aCv
 0aww==
X-Gm-Message-State: AOAM531Xk2x8fdugUMLLQOhH4v1mZM5CeEIsHL962u7HwbeVqn/Pee04
 VYM6HxD3/rzjCnpxLPO0zT0=
X-Google-Smtp-Source: ABdhPJw1Lp+pfkjhVE9hqZpenPO4cc2wMslXnA7d/8vNWyF1R90+TCqWN2cNZc8fAi3rAX94d3L6pw==
X-Received: by 2002:adf:cd8f:: with SMTP id q15mr2214666wrj.118.1642158171105; 
 Fri, 14 Jan 2022 03:02:51 -0800 (PST)
Received: from ?IPV6:2a01:e34:ec40:49e0:48b5:8fce:b44b:d951?
 ([2a01:e34:ec40:49e0:48b5:8fce:b44b:d951])
 by smtp.gmail.com with ESMTPSA id v13sm5729254wro.90.2022.01.14.03.02.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Jan 2022 03:02:50 -0800 (PST)
Message-ID: <abbe1a9b-96ea-26d5-0375-1eeb7f5e4e42@amsat.org>
Date: Fri, 14 Jan 2022 12:02:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: [PATCH] Mark remaining global TypeInfo instances as const
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Laurent Vivier <laurent@vivier.eu>, "Michael S. Tsirkin" <mst@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Corey Minyard <minyard@acm.org>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Jason Wang <jasowang@redhat.com>, =?UTF-8?Q?Herv=c3=a9_Poussineau?=
 <hpoussin@reactos.org>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, Fam Zheng
 <fam@euphon.net>, Beniamino Galvani <b.galvani@gmail.com>,
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Havard Skinnemoen <hskinnemoen@google.com>, Tyrone Ting
 <kfting@nuvoton.com>, Alex Williamson <alex.williamson@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 "open list:Raspberry Pi" <qemu-arm@nongnu.org>,
 "open list:e500" <qemu-ppc@nongnu.org>,
 "open list:S390 PCI" <qemu-s390x@nongnu.org>
References: <20220113171038.18128-1-shentey@gmail.com>
In-Reply-To: <20220113171038.18128-1-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 13/1/22 18:10, Bernhard Beschow wrote:
> More than 1k of TypeInfo instances are already marked as const. Mark the
> remaining ones, too.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/core/generic-loader.c   | 2 +-
>   hw/core/guest-loader.c     | 2 +-
>   hw/display/bcm2835_fb.c    | 2 +-
>   hw/display/i2c-ddc.c       | 2 +-
>   hw/display/macfb.c         | 4 ++--
>   hw/display/virtio-vga.c    | 2 +-
>   hw/dma/bcm2835_dma.c       | 2 +-
>   hw/i386/pc_piix.c          | 2 +-
>   hw/i386/sgx-epc.c          | 2 +-
>   hw/intc/bcm2835_ic.c       | 2 +-
>   hw/intc/bcm2836_control.c  | 2 +-
>   hw/ipmi/ipmi.c             | 4 ++--
>   hw/mem/nvdimm.c            | 2 +-
>   hw/mem/pc-dimm.c           | 2 +-
>   hw/misc/bcm2835_mbox.c     | 2 +-
>   hw/misc/bcm2835_powermgt.c | 2 +-
>   hw/misc/bcm2835_property.c | 2 +-
>   hw/misc/bcm2835_rng.c      | 2 +-
>   hw/misc/pvpanic-isa.c      | 2 +-
>   hw/misc/pvpanic-pci.c      | 2 +-
>   hw/net/fsl_etsec/etsec.c   | 2 +-
>   hw/ppc/prep_systemio.c     | 2 +-
>   hw/ppc/spapr_iommu.c       | 2 +-
>   hw/s390x/s390-pci-bus.c    | 2 +-
>   hw/s390x/sclp.c            | 2 +-
>   hw/s390x/tod-kvm.c         | 2 +-
>   hw/s390x/tod-tcg.c         | 2 +-
>   hw/s390x/tod.c             | 2 +-
>   hw/scsi/lsi53c895a.c       | 2 +-
>   hw/sd/allwinner-sdhost.c   | 2 +-
>   hw/sd/aspeed_sdhci.c       | 2 +-
>   hw/sd/bcm2835_sdhost.c     | 2 +-
>   hw/sd/cadence_sdhci.c      | 2 +-
>   hw/sd/npcm7xx_sdhci.c      | 2 +-
>   hw/usb/dev-mtp.c           | 2 +-
>   hw/usb/host-libusb.c       | 2 +-
>   hw/vfio/igd.c              | 2 +-
>   hw/virtio/virtio-pmem.c    | 2 +-
>   qom/object.c               | 4 ++--
>   39 files changed, 42 insertions(+), 42 deletions(-)
> 
> diff --git a/hw/core/generic-loader.c b/hw/core/generic-loader.c
> index 9a24ffb880..eaafc416f4 100644
> --- a/hw/core/generic-loader.c
> +++ b/hw/core/generic-loader.c
> @@ -207,7 +207,7 @@ static void generic_loader_class_init(ObjectClass *klass, void *data)
>       set_bit(DEVICE_CATEGORY_MISC, dc->categories);
>   }
>   
> -static TypeInfo generic_loader_info = {
> +static const TypeInfo generic_loader_info = {

Good cleanup. If you use a sed expression to automatically replace,
it would be nice to mention it (see i.e. commit f548f20176cb5f4406).

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

To avoid further non-const static TypeInfo introduced, we should
add a check in scripts/checkpatch.pl. Maybe a simple "static TypeInfo"
line comparison is enough. Do you mind having a look for a patch?

Thanks,

Phil.

