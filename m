Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E97E84A3D97
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 07:21:58 +0100 (CET)
Received: from localhost ([::1]:36754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEQ4b-0000Bt-Dk
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 01:21:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nEQ03-0006yf-EY
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 01:17:15 -0500
Received: from [2a00:1450:4864:20::635] (port=42733
 helo=mail-ej1-x635.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nEQ01-0005Is-HD
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 01:17:15 -0500
Received: by mail-ej1-x635.google.com with SMTP id m4so39563602ejb.9
 for <qemu-devel@nongnu.org>; Sun, 30 Jan 2022 22:17:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BRdd4MquKtfEaG70l3NEOQbNAz5yESxkjeT1q0mQUaA=;
 b=LdCPJjBSnBdcAM2B30w8wHQp4Y5QbjVgTUQzfLRTugVOav7R3CHm3PVNKyd2wqudJy
 ps9L2VDNEnlrIaQwomp/E6GnjpIM1xHq/FGmzhg8OWp9fTOPu37zXT2FtQn8v4NctNEG
 Yr3BZV4Ya8CwxeD/+OVytWXSp2lI1qOKhOuDDt764Cu3I68j6T2G8ay5M+7Wh1zIxOiZ
 y/KKiSIhcHpqFwGY9BRUuvM+HNZs0ICBlvW82gagtFNmW1wOZUvVnlkwatJrXWX7F75o
 kbbiTewdWDqDXYHSbp48QPtXBW1pPlTv2xVV6wq0dHc+QQRRjnhawRRaE7ORySa8Nr7b
 QFkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BRdd4MquKtfEaG70l3NEOQbNAz5yESxkjeT1q0mQUaA=;
 b=E7WW4OCneO3aj90dj1+ZzoSmR4ytQmRm1YdzED//sx9ucLTI4N02wEUI1puPKeglwN
 WVIJxjYTyltfAqcG/NnOzkmfo+ksED5L3An5Mru56Iq7WB2IR0hnHPANBeHVhcyLC3x2
 Ba5UOMX1e3uw87Gh0Oa3Qs2yRIKn1jpvbJH8cnEQe25PAkLMaNpzsa2UTq85v4zD9/cP
 Q830k0y7NFJ0J/RDC0VDoEyQNWxccU++jcitlIPJFhPIbjFKh7fdWz1JwHmz8P5jGMqP
 U7An/NUSTqp+mtR67mbLDjXf6qWrFqKCfnUCte0y7UZq0lU780W9B6vE71gxBuTJYrtI
 sm5w==
X-Gm-Message-State: AOAM532GVfh7qODEmWBpnHM/1TQKbif7b0RtSHKagYQmwqb0BV1ZtiPr
 zMYBWlyourUi/KDpFswBUJThdStxq8nLUQyAGelXvA==
X-Google-Smtp-Source: ABdhPJyH6anEDNZAmS1/6S31JAZ0/8yYKRbq5AR2UEwnn5ZGibwWkVQ671VQtKbeQdrx1gTKc2IO+edUDBeackBH9ws=
X-Received: by 2002:a17:907:9493:: with SMTP id
 dm19mr15800944ejc.51.1643609831255; 
 Sun, 30 Jan 2022 22:17:11 -0800 (PST)
MIME-Version: 1.0
References: <20220112130332.1648664-1-imammedo@redhat.com>
 <20220112130332.1648664-4-imammedo@redhat.com>
In-Reply-To: <20220112130332.1648664-4-imammedo@redhat.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Mon, 31 Jan 2022 11:47:00 +0530
Message-ID: <CAARzgwyc4UkvDSfu_tg8PqvG9VUZWVuPgVv5NRWqAguJgc8Thw@mail.gmail.com>
Subject: Re: [PATCH 3/4] acpi: fix OEM ID/OEM Table ID padding
To: Igor Mammedov <imammedo@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::635
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::635;
 envelope-from=ani@anisinha.ca; helo=mail-ej1-x635.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: qemu-stable@nongnu.org, "Michael S . Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, "Dmitry V . Orekhov" <dima.orekhov@gmail.com>,
 Marian Postevca <posteuca@mutex.one>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jan 12, 2022 at 6:33 PM Igor Mammedov <imammedo@redhat.com> wrote:
>
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

On the other hand, from
https://uefi.org/specs/ACPI/6.4/21_ACPI_Data_Tables_and_Table_Def_Language/ACPI_Data_Tables.html
,

"For example, the OEM ID and OEM Table ID in the common ACPI table
header (shown above) are fixed at six and eight characters,
respectively. They are not necessarily null terminated"

I also checked version 5 and the verbiage is the same. I think not
terminating with a null is not incorrect.

>
> 2)
> Fixes: 602b458201 ("acpi: Permit OEM ID and OEM table ID fields to be changed")
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/707
> Reported-by: Dmitry V. Orekhov <dima.orekhov@gmail.com>
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> Cc: qemu-stable@nongnu.org
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

