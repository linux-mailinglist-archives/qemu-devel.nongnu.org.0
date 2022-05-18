Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1555452B7A6
	for <lists+qemu-devel@lfdr.de>; Wed, 18 May 2022 12:18:13 +0200 (CEST)
Received: from localhost ([::1]:38952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrGkt-0003fq-SH
	for lists+qemu-devel@lfdr.de; Wed, 18 May 2022 06:18:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nrGgr-0002IH-F0
 for qemu-devel@nongnu.org; Wed, 18 May 2022 06:14:01 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:46859)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nrGgp-0006ip-MM
 for qemu-devel@nongnu.org; Wed, 18 May 2022 06:14:01 -0400
Received: by mail-ed1-x536.google.com with SMTP id j28so2294379eda.13
 for <qemu-devel@nongnu.org>; Wed, 18 May 2022 03:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WL+yvRfm7KH7iwHqkzIBv4JplsCg1iM+6KHO6ohkDio=;
 b=gnn2PW1fKRPjZcuV2YZg7yFmzgU/Z1wtCt7/GY16L0DX8nIdfBVvVZ5c7vhL7xksth
 a65h4nvYdMOvI04JecNixNbwVS1g0rmL1Qozscb/Vvo3hKig22VqOzU0+dinSxyCOfIE
 GELOhHCYYbpCpB94MuaMateDLWZNVHGFtEfaeNWp+O8tEcNPsASgj8wfxd6oiesJCGfx
 gGw/0wQOmZWuw7FiPjVUlFMHt+9C57m3CKfR6oOpuvpXKtrZi1mb5X4UCKGdUwARWjpa
 BlNHwmuU7zwOvFuiIkpxeE5MTWdYBvGa6g1cK5Dv+wOP2jlyH5+TSjYMPt2wDUKhEx7Q
 b5CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WL+yvRfm7KH7iwHqkzIBv4JplsCg1iM+6KHO6ohkDio=;
 b=diM1Xy5/5ZXV8SDHnmVs03FzEtFkfXpCUmoibHtg+oEk6xVrvoZ+bSlClHVqGztgb+
 On+lq0tJO8FMUvEEmBDOp/Ow/jYFkoeJZyEjUsfMRZq4+ypPFZJ6kwN9tyxVte6+UjGR
 +dw02bsLyx1zJS78l6ilRZiruoM9Pevigdc65Ey8YxASPzCIr/7yQA5x1xUjvtSK1YHg
 fb8EqeyULAgj3WXh9wjBtkTlkrzoxsHoQMvqCFyTrXPpB/f9UjPOBskIG4a8TyDJ2vt3
 UXhFholoOX4IZsTEBTCOxHN978rYkoYZdxhjNhgdPu7tYOU2oUgPaySFEVMa/kkGjIiU
 H8gw==
X-Gm-Message-State: AOAM532ZSpbHLW3oo4lI7JLCz6VFER4mIIslu/XdddlTp52qX12DIjeR
 5ZfYOFVy4dSq+Vsm0thF6Ubww9/+YQaTUD2RSthwOQ==
X-Google-Smtp-Source: ABdhPJwaHIcbWjmnhb4aAPaYesdaKo0RhteOwOSwE93/y0YWUxIcSl/j/tLBZoFVojv+ZOy1hKlqWn3Aam5hjFIeiV8=
X-Received: by 2002:a05:6402:254c:b0:427:db53:dfb0 with SMTP id
 l12-20020a056402254c00b00427db53dfb0mr23434037edb.176.1652868836120; Wed, 18
 May 2022 03:13:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220516152610.1963435-1-imammedo@redhat.com>
 <20220516152610.1963435-3-imammedo@redhat.com>
In-Reply-To: <20220516152610.1963435-3-imammedo@redhat.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Wed, 18 May 2022 15:43:45 +0530
Message-ID: <CAARzgwx8xAse_ZsxnJ3cbezymB5X22vSq4xwt9w48v_1GhxKgQ@mail.gmail.com>
Subject: Re: [PATCH 02/35] acpi: make isa_build_aml() support AcpiDevAmlIf
 interface
To: Igor Mammedov <imammedo@redhat.com>
Cc: qemu-devel@nongnu.org, mst@redhat.com, minyard@acm.org, 
 stefanb@linux.vnet.ibm.com, marcandre.lureau@redhat.com, kraxel@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2a00:1450:4864:20::536;
 envelope-from=ani@anisinha.ca; helo=mail-ed1-x536.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Mon, May 16, 2022 at 8:56 PM Igor Mammedov <imammedo@redhat.com> wrote:
>
> To allow incremental conversion from ISADeviceClass::build_aml
> to AcpiDevAmlIf, add support for the later without removing
> the former. Once conversion is complete, another commit will
> drop ISADeviceClass::build_aml related code.
>
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>

Reviewed-by: Ani Sinha <ani@anisinha.ca>

> ---
>  hw/isa/isa-bus.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/hw/isa/isa-bus.c b/hw/isa/isa-bus.c
> index cd5ad3687d..237e2cee12 100644
> --- a/hw/isa/isa-bus.c
> +++ b/hw/isa/isa-bus.c
> @@ -24,6 +24,7 @@
>  #include "hw/sysbus.h"
>  #include "sysemu/sysemu.h"
>  #include "hw/isa/isa.h"
> +#include "hw/acpi/acpi_aml_interface.h"
>
>  static ISABus *isabus;
>
> @@ -196,8 +197,12 @@ void isa_build_aml(ISABus *bus, Aml *scope)
>      QTAILQ_FOREACH(kid, &bus->parent_obj.children, sibling) {
>          dev = ISA_DEVICE(kid->child);
>          dc = ISA_DEVICE_GET_CLASS(dev);
> +        bool has_build_dev_aml = !!object_dynamic_cast(OBJECT(dev),
> +                                                       TYPE_ACPI_DEV_AML_IF);
>          if (dc->build_aml) {
>              dc->build_aml(dev, scope);
> +        } else if (has_build_dev_aml) {
> +            call_dev_aml_func(DEVICE(dev), scope);
>          }
>      }
>  }
> --
> 2.31.1
>

