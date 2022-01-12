Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E50048C77E
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 16:46:28 +0100 (CET)
Received: from localhost ([::1]:36996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7fpT-0001Pd-DC
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 10:46:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1n7fPR-0000yY-53
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 10:19:33 -0500
Received: from [2607:f8b0:4864:20::1030] (port=42507
 helo=mail-pj1-x1030.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1n7fPO-0000XU-TY
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 10:19:32 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 a1-20020a17090a688100b001b3fd52338eso4222943pjd.1
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 07:19:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=hvpo7dH5INJE/CiPSOTE7seLz/x4RdmWmbHXyyUHGMA=;
 b=JHmxT0UGx+bBimgvWfdxRVKpqD92dhhsUx3neLmeEon/4BoSpwn7adie67Lbhc+0+P
 wOLT0eRX8mA6EkLVyJMfbHD6Z2KcM3TJAb9DOkgjZBMR5TnmmaMhaH+LcXTOLSDEV7nZ
 OO5jJcFgtGkCJOvGLFFzcA6ofyVK4j9k1IAAd+suLhV3fWv35ZA9VcSyc5FQTA7kG+vO
 VPEAXFbXa2q0sn6AMSsCtXs8uPUzfuTJZFYCr470j8OhnZ+HW8Pg5EDJBdiqhK0GNBW9
 pnfvK9ekI5yLHmTZvB37ZPu2B9SDmVnNl6F9d7W2kBKQwzR5+Tpztor4IoYdCNIUE467
 tasw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=hvpo7dH5INJE/CiPSOTE7seLz/x4RdmWmbHXyyUHGMA=;
 b=fiGaFa/oexJl2QrVYW2NyGurE33WhKiNBoOb5ssDIriA8kQmDaUrSJDlTWV1PCPmAr
 6pGdv4YdUw9yKkK5SzFV3wkW/qWFHlKCGTuhuvt09rnWQfRAK21fyAuBImVQO56s75+2
 wlhcs0oQIV7BanAzsL7LaFmJ7bOooL/HMfSxYmyGMf7RgZFDkSd4C8rCS4rIpIp6nlNv
 aKShUChRDru+L2O30+tbOV5QgfDcl6afMYGJDYTB40tOHg00JT1ihXILxNK8FfL0cfV+
 /eUVAwjotEYaWWsPic1onulOYkX6XJ4m1oyz5RsOZCOfw09/ZvxmVI/GxrEalPWgccQf
 7tLA==
X-Gm-Message-State: AOAM531ViwcfimcGby+1bLHy/K4U2oshGGXSG3ip4FfdOuMU8ykIUnIg
 5M8lF8FLyq1DX9B3V5ikR50llQ==
X-Google-Smtp-Source: ABdhPJxVoC2K/zy+h1PsjECo/2a4IqZAg8PjKO7kKfUAbiXlntetcvD9B1hLHILRy4RXlahiPgQfVg==
X-Received: by 2002:a17:90b:4a0e:: with SMTP id
 kk14mr81438pjb.12.1642000769004; 
 Wed, 12 Jan 2022 07:19:29 -0800 (PST)
Received: from [10.6.18.10] ([84.252.93.8])
 by smtp.googlemail.com with ESMTPSA id k2sm9188pfc.53.2022.01.12.07.19.26
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 12 Jan 2022 07:19:28 -0800 (PST)
Date: Wed, 12 Jan 2022 20:49:23 +0530 (IST)
From: Ani Sinha <ani@anisinha.ca>
X-X-Sender: ani@athabasca.local
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH 3/4] acpi: fix OEM ID/OEM Table ID padding
In-Reply-To: <20220112130332.1648664-4-imammedo@redhat.com>
Message-ID: <alpine.OSX.2.20.2201122047350.60839@athabasca.local>
References: <20220112130332.1648664-1-imammedo@redhat.com>
 <20220112130332.1648664-4-imammedo@redhat.com>
User-Agent: Alpine 2.20 (OSX 67 2015-01-07)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1030
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::1030;
 envelope-from=ani@anisinha.ca; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: qemu-stable@nongnu.org, "Michael S . Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, "Dmitry V . Orekhov" <dima.orekhov@gmail.com>,
 Marian Postevca <posteuca@mutex.one>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On Wed, 12 Jan 2022, Igor Mammedov wrote:

> Commit [2] broke original '\0' padding of OEM ID and OEM Table ID
> fields in headers of ACPI tables. While it doesn't have impact on
> default values since QEMU uses 6 and 8 characters long values
> respectively, it broke usecase where IDs are provided on QEMU CLI.
> It shouldn't affect guest (but may cause licensing verification
> issues in guest OS).
> One of the broken usecases is user supplied SLIC table with IDs
> shorter than max possible length, where [2] mangles IDs with extra
> spaces in RSDT and FADT tables whereas guest OS expects those to
> mirror the respective values of the used SLIC table.
>
> Fix it by replacing whitespace padding with '\0' padding in
> accordance with [1] and expectations of guest OS
>
> 1) ACPI spec, v2.0b
>        17.2 AML Grammar Definition
>        ...
>        //OEM ID of up to 6 characters. If the OEM ID is
>        //shorter than 6 characters, it can be terminated
>        //with a NULL character.
>
> 2)
> Fixes: 602b458201 ("acpi: Permit OEM ID and OEM table ID fields to be changed")
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/707
> Reported-by: Dmitry V. Orekhov <dima.orekhov@gmail.com>
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> Cc: qemu-stable@nongnu.org

Reviewed-by: Ani Sinha <ani@anisinha.ca>

> ---
>  hw/acpi/aml-build.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> index b3b3310df3..65148d5b9d 100644
> --- a/hw/acpi/aml-build.c
> +++ b/hw/acpi/aml-build.c
> @@ -1724,9 +1724,9 @@ void acpi_table_begin(AcpiTable *desc, GArray *array)
>      build_append_int_noprefix(array, 0, 4); /* Length */
>      build_append_int_noprefix(array, desc->rev, 1); /* Revision */
>      build_append_int_noprefix(array, 0, 1); /* Checksum */
> -    build_append_padded_str(array, desc->oem_id, 6, ' '); /* OEMID */
> +    build_append_padded_str(array, desc->oem_id, 6, '\0'); /* OEMID */
>      /* OEM Table ID */
> -    build_append_padded_str(array, desc->oem_table_id, 8, ' ');
> +    build_append_padded_str(array, desc->oem_table_id, 8, '\0');
>      build_append_int_noprefix(array, 1, 4); /* OEM Revision */
>      g_array_append_vals(array, ACPI_BUILD_APPNAME8, 4); /* Creator ID */
>      build_append_int_noprefix(array, 1, 4); /* Creator Revision */
> --
> 2.31.1
>
>

