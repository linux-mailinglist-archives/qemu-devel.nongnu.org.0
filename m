Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 319524BF27E
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 08:14:15 +0100 (CET)
Received: from localhost ([::1]:54956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMPNF-0005q0-Sq
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 02:14:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nMPM7-00058Y-Pc
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 02:13:03 -0500
Received: from [2607:f8b0:4864:20::430] (port=44771
 helo=mail-pf1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nMPM5-0001Rg-Lt
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 02:13:03 -0500
Received: by mail-pf1-x430.google.com with SMTP id y11so11055267pfi.11
 for <qemu-devel@nongnu.org>; Mon, 21 Feb 2022 23:13:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=TRsDbYqP5gJZHu/pRwfog6W5ZBLcbYdrLDe/QgDRmk4=;
 b=ZPZ0Zx052jAKZdUaTojNIjEyH53BfPTxR/AzJf6jXcLJwEvmH1E9pXSVsMJkBqMUX/
 MIAdelGOTLiU37MzNkK5vaS0+VdfOOSIu1FJojhaCRDGVtCyiOrf0ATWVRdqCUjYWCK0
 PNWZpOZjWLQnqGNJmrARIr+e9Z+nQje93B1gKT3DDucwJpDTD8kkCw3b8OS1x+iYRWRR
 zArxJuwnLZV7vSlNGHpnFZaQe1PNoa1AgZS47YMW+3EzDkaqWPcr/iLNDG0GrPZzJkux
 1eR34FFRgAPavj8DFYVQMX08C2A6YjMRzR64jveO74rwWvoTIyVkL0URwV6rH4NpUCVU
 CCzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=TRsDbYqP5gJZHu/pRwfog6W5ZBLcbYdrLDe/QgDRmk4=;
 b=EWq4oO/q42Shn0S7IeADDo22L5HeyS6iXiATGASLzEru5UeKLPtJzXkoh21wn66Kq3
 vbWE4SrYGxNHOBVHzYRnNO835B+h6okB4YoIUa7Lxse4OtBlDlZSB3xKzc5mrH8ZE1aU
 taCcZldM02Qaivu095zCCDiP2RgSVltoDl+CrIUwjy+Z9/kk4g7kg4z6S/lDij8YSW5p
 yTJ0o0zCKJX5glmUy8Q3XfQANtAsfW6nE/T3z7z5l836YmCb+D+p6LFWmRYcpvQp+EUj
 jqpEyN6XJGamSNr5AKQAisVxBbjbkwcV9Ua99ae3XI/L2zssVpz7hsqn3mvSBQCWhjP/
 YgtA==
X-Gm-Message-State: AOAM532j/xzvHvf70jgsRbTQD47MNvuMvp4I8yGKiYFLtSjlULEMydUB
 TJ8xpjFNz7+0sAeaIF1dbxOAwA==
X-Google-Smtp-Source: ABdhPJzAY8eM8epj6kSYmlPqKwMxfsB5qkt4XrRiE5N+HzmLF+TVoN8BhsV978Od1tXQOPLyrAdE2w==
X-Received: by 2002:a05:6a00:2389:b0:4c9:f19c:1e52 with SMTP id
 f9-20020a056a00238900b004c9f19c1e52mr23723059pfc.35.1645513980270; 
 Mon, 21 Feb 2022 23:13:00 -0800 (PST)
Received: from anisinha-lenovo ([115.96.128.14])
 by smtp.googlemail.com with ESMTPSA id lk8sm1526069pjb.47.2022.02.21.23.12.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Feb 2022 23:12:59 -0800 (PST)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Tue, 22 Feb 2022 12:42:54 +0530 (IST)
X-X-Sender: anisinha@anisinha-lenovo
To: Liav Albani <liavalb@gmail.com>
Subject: Re: [PATCH v2 2/2] hw/acpi: add indication for i8042 in IA-PC boot
 flags of the FADT table
In-Reply-To: <20220221191323.617323-3-liavalb@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2202221226340.697295@anisinha-lenovo>
References: <20220221191323.617323-1-liavalb@gmail.com>
 <20220221191323.617323-3-liavalb@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::430
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::430;
 envelope-from=ani@anisinha.ca; helo=mail-pf1-x430.google.com
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


>      };
> +    if (isa_check_device_existence("i8042")) {
> +        /* Indicates if i8042 is present or not */
> +        fadt.iapc_boot_arch = (1 << 1);
> +    }
> +
>      *data = fadt;
>  }
>

We do these things slightly differently. how about

/*
* second bit of 16 but IAPC_BOOT_ARCH indicates presence of 8042 or
equivalent
micro controller. See table 5-10 of APCI spec version 2.0 (the earliest
acpi revision that supports this).
*/

fadt.iapc_boot_arch = isa_check_device_existence("i8042")? 0x0002:0x0000;

> diff --git a/hw/i386/acpi-microvm.c b/hw/i386/acpi-microvm.c
> index 68ca7e7fc2..756c69b3b0 100644
> --- a/hw/i386/acpi-microvm.c
> +++ b/hw/i386/acpi-microvm.c
> @@ -189,6 +189,11 @@ static void acpi_build_microvm(AcpiBuildTables *tables,
>          .reset_val = ACPI_GED_RESET_VALUE,
>      };
>
> +    if (isa_check_device_existence("i8042")) {
> +        /* Indicates if i8042 is present or not */
> +        pmfadt.iapc_boot_arch = (1 << 1);
> +    }
> +

Ditto.

