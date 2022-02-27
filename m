Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E89944C59E3
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Feb 2022 08:30:27 +0100 (CET)
Received: from localhost ([::1]:45880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOE0e-00072e-Rv
	for lists+qemu-devel@lfdr.de; Sun, 27 Feb 2022 02:30:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nODyQ-0006GO-BY
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 02:28:06 -0500
Received: from [2607:f8b0:4864:20::102d] (port=46676
 helo=mail-pj1-x102d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nODyO-0000Q8-Kj
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 02:28:06 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 j10-20020a17090a94ca00b001bc2a9596f6so8609862pjw.5
 for <qemu-devel@nongnu.org>; Sat, 26 Feb 2022 23:27:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=G50btztooWhTvAehOYk+wL4yjhDTLneDiz3Zeko1HXA=;
 b=uoeBEImL5+z5e/tVg20pUYcEaLsFlVELuf9IiWX5YXmzovRXnqJs0x3L4ebjeKv40h
 csqXr0cC228/+MYGiF2PZuVpXA5ke7V2EFoinon1bvA8005VHvKzk99V0rWeiOTB2Yi0
 0YutJiBYPq3m1TfJdl8bHahF6ZGaWqwzm7GzbYXtR50/n238e2Jpv9YUYvSwoH6lOkjg
 k84x6vXRGSTqIrKjlI7NTduzwTAyDON1eKx9NFMAHFgEsAPp8+ZB1uerukrK9bk3Z52n
 nos8fvK7h46fy/xnGACO87r/4WUGRkGwiPL7BI+8wbmDv83vFw98dUujMfugjfja4xa9
 i4sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=G50btztooWhTvAehOYk+wL4yjhDTLneDiz3Zeko1HXA=;
 b=l/efzeDrowUszFmXTySo8Rl/ehx5ff2Y2FHNAaI9YZoTbCsQ5kZepo2N8YOFVbYZYZ
 O9n1PaUSwPvLihYZVmWSUCWx9Pat7X0seyx//CiyVuYHh6HEK3K0xpPHxNCDpOy2sfPS
 gmGhtRq9n9kzTYYsrXyA7upv1WzK5AMB9pBkWGthdYEptzzioZ+IDrBCuZ7u1rwMGcCk
 ai1MKRg9Aj+5z6kCRGGfGJarXkhY06ZgYH/S2Ed12SbNhuEPCzHK5UlCPzHuNVb27cE8
 E27zz/B5gzaVpuUAmgWnxs1cXFCk45vcyFszyVy1P0HNmeW2y0MLtmZH556E/+T80fwD
 SlHg==
X-Gm-Message-State: AOAM533kbsXbUZQ3VlIH2GnwHEQSyPfPpUSMGzzeRf2/yqFYH4+VR3LH
 UIbC+AIqachfoYisvHbZGlISVA==
X-Google-Smtp-Source: ABdhPJzRdtD+Imlyuo3rI/QNHpI1pItT0K4d6FtqU3NyMf1nNz1/C1lB8Gtx6H48ZDkmKz7nI9jejQ==
X-Received: by 2002:a17:903:18d:b0:150:b6d:64cd with SMTP id
 z13-20020a170903018d00b001500b6d64cdmr15132707plg.123.1645946874217; 
 Sat, 26 Feb 2022 23:27:54 -0800 (PST)
Received: from anisinha-lenovo ([115.96.134.68])
 by smtp.googlemail.com with ESMTPSA id
 x11-20020a056a00188b00b004e1c075c6fbsm8855398pfh.52.2022.02.26.23.27.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Feb 2022 23:27:53 -0800 (PST)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Sun, 27 Feb 2022 12:57:48 +0530 (IST)
X-X-Sender: anisinha@anisinha-lenovo
To: Liav Albani <liavalb@gmail.com>
Subject: Re: [PATCH v3 1/4] hw/isa: add function to check for existence of
 device by its type
In-Reply-To: <20220226063019.1112654-2-liavalb@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2202271254280.1249418@anisinha-lenovo>
References: <20220226063019.1112654-1-liavalb@gmail.com>
 <20220226063019.1112654-2-liavalb@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102d
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::102d;
 envelope-from=ani@anisinha.ca; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: ani@anisinha.ca, imammedo@redhat.com, qemu-devel@nongnu.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On Sat, 26 Feb 2022, Liav Albani wrote:

> This function enumerates all attached ISA devices in the machine, and
> tries to compare a given device type name to the enumerated devices.
> For example, this can help other code to determine if a i8042 controller
> exists in the machine.
>
> Signed-off-by: Liav Albani <liavalb@gmail.com>
> ---
>  hw/isa/isa-bus.c     | 23 +++++++++++++++++++++++
>  include/hw/isa/isa.h |  1 +
>  2 files changed, 24 insertions(+)
>
> diff --git a/hw/isa/isa-bus.c b/hw/isa/isa-bus.c
> index 6c31398dda..663aa36d29 100644
> --- a/hw/isa/isa-bus.c
> +++ b/hw/isa/isa-bus.c
> @@ -222,6 +222,29 @@ void isa_build_aml(ISABus *bus, Aml *scope)
>      }
>  }
>
> +bool isa_check_device_existence(const char *typename)
> +{
> +    /*
> +     * If there's no ISA bus, we know for sure that the checked ISA device type
> +     * doesn't exist in the machine.
> +     */
> +    if (isabus == NULL) {

nit: I would do if (!isabus) instead to keep uniformity with other parts
of the code.

> +        return false;
> +    }
> +
> +    BusChild *kid;
> +    ISADevice *dev;
> +
> +    QTAILQ_FOREACH(kid, &isabus->parent_obj.children, sibling) {
> +        dev = ISA_DEVICE(kid->child);
> +        const char *object_type = object_get_typename(OBJECT(dev));
> +        if (object_type && strcmp(object_type, typename) == 0) {

nit: I would do !strcmp() instead.

> +            return true;
> +        }
> +    }
> +    return false;
> +}
> +
>  static void isabus_dev_print(Monitor *mon, DeviceState *dev, int indent)
>  {
>      ISADevice *d = ISA_DEVICE(dev);
> diff --git a/include/hw/isa/isa.h b/include/hw/isa/isa.h
> index d4417b34b6..65f0c7e28c 100644
> --- a/include/hw/isa/isa.h
> +++ b/include/hw/isa/isa.h
> @@ -99,6 +99,7 @@ IsaDma *isa_get_dma(ISABus *bus, int nchan);
>  MemoryRegion *isa_address_space(ISADevice *dev);
>  MemoryRegion *isa_address_space_io(ISADevice *dev);
>  ISADevice *isa_new(const char *name);
> +bool isa_check_device_existence(const char *typename);

Please provide documentation for this function in line with other
functions like isa_register_ioport() and isa_register_portio_list()  in
the same header.

