Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1100E47D6A0
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 19:25:35 +0100 (CET)
Received: from localhost ([::1]:47540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n06Iw-0007co-5g
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 13:25:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n066x-0004ij-H5; Wed, 22 Dec 2021 13:13:11 -0500
Received: from [2607:f8b0:4864:20::f33] (port=44839
 helo=mail-qv1-xf33.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n066u-0004m1-Br; Wed, 22 Dec 2021 13:13:11 -0500
Received: by mail-qv1-xf33.google.com with SMTP id kd9so3023536qvb.11;
 Wed, 22 Dec 2021 10:13:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=kX5Xsq6vXPd5t1Oj21wtfaVpdAn5a0LlenkOwqvfMVo=;
 b=m0AFC3Gct2AjwpWRLlnTOTAIX768UNlLEBwdDOY+OkD2ujsYFgd072HGR680YwYoeV
 6en+OFNiDzAdBBDQFRNnXuT9GSlJEMZz2QG2TOYskX2yyyn9twEA0Z5RSq9Wq7vCAu66
 0nOOmTz7uAx+Rkj9QtrcVCm+p4ILcAPId+Y1XhRsGmnkgS8+9miZCBf7VRmgT5c/Uq2o
 4tSih8hDgqv0M0L3aQAgIsqBf/DAEQ9Gjkfuy0Gl6Q5k/+F95FWFwsR+QJrBzz0Q+goD
 QODWEPdDqV8dsjaDHwDHqeTwz9S6XFf6EG4IoBK03tH+6+tpxiTR5b+OYbP0zu6cm7cA
 rJJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=kX5Xsq6vXPd5t1Oj21wtfaVpdAn5a0LlenkOwqvfMVo=;
 b=kRgNtkDZG1tvnoKS9Yb/FNdXwQEJIrsv7BcGhPQq/4QpoAWh2E4Myk1QatZxOGthVw
 k0apWo5cpBX0d3mgpQBz3p2jNtVPwJmzuYJrRe+3SSpXbaQhXfVThiBPXGXIDnrO9ht1
 7IAQLhvGn4EAL9VU6mrKCqY9P4k0q0aKoYBZ2nL2ZWy05w8f6VMowbz5ETZX0R4HKKlY
 hIhejlMNXDclpqEzm0f3Z17ZyvVLb5QFh8DK6g8ESzG0JpQtcAwwcmhhhI9Z2JBpvosk
 DoXQSyFw442R2KBOQGk2paQiKtjITe7xHth9yPR/5UXwvWGdwiyO7XbaEo9rXyWpttO3
 U5eQ==
X-Gm-Message-State: AOAM5307ulkEyE1TE3dxOXnntb9xneER13XExQ6J1KUW4bJMede1ERrA
 NKHOj0iV+0EpmBwGQ7pIXqk=
X-Google-Smtp-Source: ABdhPJw6lCDGoCvx8kCpsC48yZ1rPn8QRbjLyudWCZ8hzXB5zTmRq5AEIk6C7FH6+dsIbg6/Z4NnEw==
X-Received: by 2002:a05:6214:c42:: with SMTP id
 r2mr3444473qvj.69.1640196786346; 
 Wed, 22 Dec 2021 10:13:06 -0800 (PST)
Received: from ?IPV6:2804:431:c7c6:7ce4:b718:2cc0:32df:97ee?
 ([2804:431:c7c6:7ce4:b718:2cc0:32df:97ee])
 by smtp.gmail.com with ESMTPSA id k8sm2356448qko.130.2021.12.22.10.13.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Dec 2021 10:13:06 -0800 (PST)
Message-ID: <79be1148-d539-667f-97f5-0a774459cc21@gmail.com>
Date: Wed, 22 Dec 2021 15:13:03 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 4/5] ppc/pnv: Attach PHB3 root port device when defaults
 are enabled
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
References: <20211222063817.1541058-1-clg@kaod.org>
 <20211222063817.1541058-5-clg@kaod.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20211222063817.1541058-5-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::f33
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f33;
 envelope-from=danielhb413@gmail.com; helo=mail-qv1-xf33.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.694,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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



On 12/22/21 03:38, Cédric Le Goater wrote:
> This cleanups the PHB3 model a bit more since the root port is an
> independent device and it will ease our task when adding user created
> PHB3s.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   include/hw/pci-host/pnv_phb3.h |  2 --
>   hw/pci-host/pnv_phb3.c         |  8 --------
>   hw/ppc/pnv.c                   | 14 ++++++++++++++
>   3 files changed, 14 insertions(+), 10 deletions(-)
> 
> diff --git a/include/hw/pci-host/pnv_phb3.h b/include/hw/pci-host/pnv_phb3.h
> index e9c13e6bd821..2e423c3890bc 100644
> --- a/include/hw/pci-host/pnv_phb3.h
> +++ b/include/hw/pci-host/pnv_phb3.h
> @@ -155,8 +155,6 @@ struct PnvPHB3 {
>   
>       PnvPBCQState pbcq;
>   
> -    PnvPHB3RootPort root;
> -
>       QLIST_HEAD(, PnvPhb3DMASpace) dma_spaces;
>   
>       PnvChip *chip;
> diff --git a/hw/pci-host/pnv_phb3.c b/hw/pci-host/pnv_phb3.c
> index 9c4451ca0d1c..39f03bd256d0 100644
> --- a/hw/pci-host/pnv_phb3.c
> +++ b/hw/pci-host/pnv_phb3.c
> @@ -980,10 +980,6 @@ static void pnv_phb3_instance_init(Object *obj)
>       /* Power Bus Common Queue */
>       object_initialize_child(obj, "pbcq", &phb->pbcq, TYPE_PNV_PBCQ);
>   
> -    /* Root Port */
> -    object_initialize_child(obj, "root", &phb->root, TYPE_PNV_PHB3_ROOT_PORT);
> -    qdev_prop_set_int32(DEVICE(&phb->root), "addr", PCI_DEVFN(0, 0));
> -    qdev_prop_set_bit(DEVICE(&phb->root), "multifunction", false);
>   }
>   
>   static void pnv_phb3_realize(DeviceState *dev, Error **errp)
> @@ -1051,10 +1047,6 @@ static void pnv_phb3_realize(DeviceState *dev, Error **errp)
>   
>       pci_setup_iommu(pci->bus, pnv_phb3_dma_iommu, phb);
>   
> -    /* Add a single Root port */
> -    qdev_prop_set_uint8(DEVICE(&phb->root), "chassis", phb->chip_id);
> -    qdev_prop_set_uint16(DEVICE(&phb->root), "slot", phb->phb_id);
> -    qdev_realize(DEVICE(&phb->root), BUS(pci->bus), &error_fatal);
>   }
>   
>   void pnv_phb3_update_regions(PnvPHB3 *phb)
> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
> index 9de8b8353014..6edfd6876fd0 100644
> --- a/hw/ppc/pnv.c
> +++ b/hw/ppc/pnv.c
> @@ -1156,6 +1156,17 @@ static void pnv_chip_icp_realize(Pnv8Chip *chip8, Error **errp)
>       }
>   }
>   
> +/* Attach a root port device */
> +static void pnv_phb_attach_root_port(PCIHostState *pci, int id,
> +                                     const char *name)
> +{
> +    PCIDevice *root = pci_new(PCI_DEVFN(0, 0), name);
> +
> +    qdev_prop_set_uint8(&root->qdev, "chassis", id);
> +    qdev_prop_set_uint16(&root->qdev, "slot", id);
> +    pci_realize_and_unref(root, pci->bus, &error_fatal);
> +}
> +
>   static void pnv_chip_power8_realize(DeviceState *dev, Error **errp)
>   {
>       PnvChipClass *pcc = PNV_CHIP_GET_CLASS(dev);
> @@ -1250,6 +1261,9 @@ static void pnv_chip_power8_realize(DeviceState *dev, Error **errp)
>           if (!sysbus_realize(SYS_BUS_DEVICE(phb), errp)) {
>               return;
>           }
> +
> +        pnv_phb_attach_root_port(PCI_HOST_BRIDGE(phb), phb->phb_id,
> +                                 TYPE_PNV_PHB3_ROOT_PORT);
>       }
>   }
>   
> 

