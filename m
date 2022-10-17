Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E3EB600D90
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 13:17:15 +0200 (CEST)
Received: from localhost ([::1]:40122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okO7M-0007em-AR
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 07:17:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1okO30-0001eC-AR
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 07:12:42 -0400
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a]:37721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1okO2t-00038a-Ed
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 07:12:40 -0400
Received: by mail-io1-xd2a.google.com with SMTP id o65so8731706iof.4
 for <qemu-devel@nongnu.org>; Mon, 17 Oct 2022 04:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=LHM2tpQuT2VsCzBSJYkyrfoEW228jNo06juwRvL4EaA=;
 b=JIOCyvD6ZOFveM9UAD2gP0ERieEcq0wYTYA5Wk0ORWv5liPw6LfIs5tScmJle0i32b
 uCYNixoz1VLrzASL1bi4TibbwqiHDaOBK0tkRNwJmlSbrYqDqdKCSAAx2FK+VYOLjh2m
 +6X8hESUBrJOxu1J8/LYmt18sXRCO/mOQRDtMJfchSIACpdGRs2KGArGbjg/Mj7sL2s7
 CxlqKBhlCDSND+YyW95cwgiF0qbYEQdOQaEGPFuAtHF+rlPI15zvLdTVli4UzqDq3sGi
 PV6EPvuYwoIAM5GhemmbhehiU7olkj+HrYAp8ZrUqDysom/G0d5BRdFTNqzxfQY4oFpn
 bzhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LHM2tpQuT2VsCzBSJYkyrfoEW228jNo06juwRvL4EaA=;
 b=Ilj8GHQvS2ya116Gm2kL/ThznnwWqATKDyXWXVs8vKYXotJhQEU74dE4/9S7NsQinj
 j2D/HyTNeJJXqqt/USDY5eqh4IPIZ8xcjeXb9loTIr+9yLL8i/SNnQ144fNOy21Hrs9W
 63j/A/T7ZoZlvfg9ksZm2a9KrqPVK0Xe3zs6E+ZN37d54swL5b3gvOG6ZHJhbK8vQjYv
 yYMlpJH6TsyduJSvS1rRabhds9CNbAzOO9cIZSzL0DwN9+SFxZQowFSSYhpjIZAVhzx/
 5llMVdzcsIVm4zxFOSyhlWmYyECAne9nnr/zrAAnoYMXET/bSmkjZeIb1yvpT9/m5L/4
 APKQ==
X-Gm-Message-State: ACrzQf02TXNWYWNNE2kWM9Ms+lf8Ct1AmemaRyGaHV3j01tEDel7sEDX
 VeBmwi/Esne1iViJZc25q/vYWaNpfUwvcMr/4zGsSA==
X-Google-Smtp-Source: AMsMyM5l+EyAS1A7g/ha7w8CRxVIKoH3Vh7S2hVGTzWn0erLFJDGnwvbifTfCLFhQawB8yknEdd4oiWYgE9UnyOVBK0=
X-Received: by 2002:a5d:9f4e:0:b0:6bb:6d59:8b72 with SMTP id
 u14-20020a5d9f4e000000b006bb6d598b72mr4258667iot.28.1666005153983; Mon, 17
 Oct 2022 04:12:33 -0700 (PDT)
MIME-Version: 1.0
References: <20221017102146.2254096-1-imammedo@redhat.com>
 <20221017102146.2254096-7-imammedo@redhat.com>
In-Reply-To: <20221017102146.2254096-7-imammedo@redhat.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Mon, 17 Oct 2022 16:42:22 +0530
Message-ID: <CAARzgwyah+-mQ+unu=oShX++XTfqjTwSnK7ZtJFzTe=vwMUciw@mail.gmail.com>
Subject: Re: [PATCH 06/11] acpi: add get_dev_aml_func() helper
To: Igor Mammedov <imammedo@redhat.com>
Cc: qemu-devel@nongnu.org, mst@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2607:f8b0:4864:20::d2a;
 envelope-from=ani@anisinha.ca; helo=mail-io1-xd2a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

On Mon, Oct 17, 2022 at 3:52 PM Igor Mammedov <imammedo@redhat.com> wrote:
>
> It will be used in followup commits to figure out if
> device has it's own, device specific AML block.
>
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>

Reviewed-by: Ani Sinha <ani@anisinha.ca>

> ---
>  include/hw/acpi/acpi_aml_interface.h | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
>
> diff --git a/include/hw/acpi/acpi_aml_interface.h b/include/hw/acpi/acpi_aml_interface.h
> index ab76f0e55d..436da069d6 100644
> --- a/include/hw/acpi/acpi_aml_interface.h
> +++ b/include/hw/acpi/acpi_aml_interface.h
> @@ -29,11 +29,20 @@ struct AcpiDevAmlIfClass {
>      dev_aml_fn build_dev_aml;
>  };
>
> -static inline void call_dev_aml_func(DeviceState *dev, Aml *scope)
> +static inline dev_aml_fn get_dev_aml_func(DeviceState *dev)
>  {
>      if (object_dynamic_cast(OBJECT(dev), TYPE_ACPI_DEV_AML_IF)) {
>          AcpiDevAmlIfClass *klass = ACPI_DEV_AML_IF_GET_CLASS(dev);
> -        klass->build_dev_aml(ACPI_DEV_AML_IF(dev), scope);
> +        return klass->build_dev_aml;
> +    }
> +    return NULL;
> +}
> +
> +static inline void call_dev_aml_func(DeviceState *dev, Aml *scope)
> +{
> +    dev_aml_fn fn = get_dev_aml_func(dev);
> +    if (fn) {
> +        fn(ACPI_DEV_AML_IF(dev), scope);
>      }
>  }
>
> --
> 2.31.1
>

