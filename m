Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C145BF4FE
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 05:50:59 +0200 (CEST)
Received: from localhost ([::1]:44678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaqlG-0001sO-FB
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 23:50:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oaqjC-0000E4-S3
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 23:48:50 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:39464)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oaqjA-00056F-Bs
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 23:48:50 -0400
Received: by mail-pg1-x535.google.com with SMTP id r23so4680542pgr.6
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 20:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:message-id:in-reply-to:subject:cc:to:date
 :from:from:to:cc:subject:date;
 bh=jnHuIl8/YV0NnqiWIQrPxHg951D+z8Vy+MbuOzpTNEc=;
 b=N4xM4tt47EtW72g5kbFQwUmkiwuUIw0WxEj8ZOhv5vCA6rJ9nsW/J20iv4rWLA26JN
 7VaxLRwWv81/OXlLuSXzr39yuFUnL/cnsdycflEpXsi3W3994NFyg94Xam5qnqVRYi9o
 +i57vrDBYOxOu70YYFO/KxpxJeFroKbqLEAJfqxKJhWe59qMUhavlyN7nGmp+V8R43HB
 P1pQmbVUK7UzAZbD4ZA6rrR9gKYsyPF/YhuD4FUyOx8CYhVwNL6Am/yXzYrAQvs8GiB6
 FKQACrq0wJv184DXZI3RLpfTpkpwtuPqEZW4rxWzowAmAQIjtpwJsL4g7vS3Xe462QVK
 esDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:references:message-id:in-reply-to:subject:cc:to:date
 :from:x-gm-message-state:from:to:cc:subject:date;
 bh=jnHuIl8/YV0NnqiWIQrPxHg951D+z8Vy+MbuOzpTNEc=;
 b=dNxgvt8iPs8U+BOn2tuRa7W/T0IDekTAffhB9CpHBDaKWjQrL6+lF940ySWZEwaArP
 XcjdD4BFY5GjauTe/q+VNoGn1ybvUzDVwPyEGvZZOIxfDsUF2qgb9j25J6dazKztI2Vi
 IbUoj1r77xpOD/x1vBoVZf+kLCz3ckiE6bLBcIzpp63pchAmKw0UKJne6Y+fmujrNclY
 h7ExSsceAKSLB4EaURkv9kpVwYdu+7u6ff7if+Nw5SAjNSgJj4lnvJc0sv2hkrxGaM9U
 B2RtrtvyMkBecUsReN7S1pRwXcQMpIkFJ3SoeSh19yj3c3RAD9KTGIaIFrSH50OXFF1e
 6XUw==
X-Gm-Message-State: ACrzQf0yNqFP7RUlwBTwDFqg8OjMhmDM07qG72BC9+auzpFL1ixYUE28
 rvjYX7uQLQQsSBClmVMVys66Dw==
X-Google-Smtp-Source: AMsMyM5/GgNmTa7928/9tKUCkGe9BWjN1An/TchkZKj60ta8fAGnbSvw5mNjhuXtcgli9XpAZ6I2PA==
X-Received: by 2002:a05:6a00:1a0e:b0:547:1cf9:40e8 with SMTP id
 g14-20020a056a001a0e00b005471cf940e8mr26901648pfv.82.1663732126572; 
 Tue, 20 Sep 2022 20:48:46 -0700 (PDT)
Received: from anisinha-lenovo ([203.163.244.51])
 by smtp.googlemail.com with ESMTPSA id
 13-20020a17090a0ccd00b001fabcd994c1sm748286pjt.9.2022.09.20.20.48.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 20:48:46 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Wed, 21 Sep 2022 09:18:40 +0530 (IST)
To: Miguel Luis <miguel.luis@oracle.com>
cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, mst@redhat.com, 
 imammedo@redhat.com, ani@anisinha.ca, shannon.zhaosl@gmail.com, 
 peter.maydell@linaro.org
Subject: Re: [PATCH 2/3] acpi: arm/virt: build_gtdt: fix invalid 64-bit
 physical addresses
In-Reply-To: <20220920162137.75239-3-miguel.luis@oracle.com>
Message-ID: <975ce98f-265-1db5-4bb1-2d1ec3113ca@anisinha.ca>
References: <20220920162137.75239-1-miguel.luis@oracle.com>
 <20220920162137.75239-3-miguel.luis@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: none client-ip=2607:f8b0:4864:20::535;
 envelope-from=ani@anisinha.ca; helo=mail-pg1-x535.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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



On Tue, 20 Sep 2022, Miguel Luis wrote:

> Per the ACPI 6.5 specification, on the GTDT Table Structure, the Counter Control
> Block Address and Counter Read Block Address fields of the GTDT table should be
> set to 0xFFFFFFFFFFFFFFFF if not provided, rather than 0x0.
>
> Fixes: 41041e57085 ("acpi: arm/virt: build_gtdt: use acpi_table_begin()/acpi_table_end() instead of build_header()")
>
> Signed-off-by: Miguel Luis <miguel.luis@oracle.com>

Reviewed-by: Ani Sinha <ani@anisinha.ca>

> ---
>  hw/arm/virt-acpi-build.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 9b3aee01bf..13c6e3e468 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -592,8 +592,7 @@ build_gtdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>      acpi_table_begin(&table, table_data);
>
>      /* CntControlBase Physical Address */
> -    /* FIXME: invalid value, should be 0xFFFFFFFFFFFFFFFF if not impl. ? */
> -    build_append_int_noprefix(table_data, 0, 8);
> +    build_append_int_noprefix(table_data, 0xFFFFFFFFFFFFFFFF, 8);
>      build_append_int_noprefix(table_data, 0, 4); /* Reserved */
>      /*
>       * FIXME: clarify comment:
> @@ -618,7 +617,7 @@ build_gtdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>      /* Non-Secure EL2 timer Flags */
>      build_append_int_noprefix(table_data, irqflags, 4);
>      /* CntReadBase Physical address */
> -    build_append_int_noprefix(table_data, 0, 8);
> +    build_append_int_noprefix(table_data, 0xFFFFFFFFFFFFFFFF, 8);
>      /* Platform Timer Count */
>      build_append_int_noprefix(table_data, 0, 4);
>      /* Platform Timer Offset */
> --
> 2.36.0
>
>

