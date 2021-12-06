Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05CE84691D7
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Dec 2021 09:55:50 +0100 (CET)
Received: from localhost ([::1]:36134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mu9mn-0002YC-3m
	for lists+qemu-devel@lfdr.de; Mon, 06 Dec 2021 03:55:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mu9lI-0001q5-D3
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 03:54:16 -0500
Received: from [2a00:1450:4864:20::533] (port=39874
 helo=mail-ed1-x533.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mu9lG-0005Qr-WE
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 03:54:16 -0500
Received: by mail-ed1-x533.google.com with SMTP id w1so39809445edc.6
 for <qemu-devel@nongnu.org>; Mon, 06 Dec 2021 00:54:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=p2piBi8Ozx4jTHEUdEu9+IfOYxwK0Xlxc+q8XX5+gtc=;
 b=zXHvwkHCK3+dIB/XTRPsMitFTQcAgiSXnEA2buXmGlngL8Zn3jcnzc4kuDhhfRfgLH
 +2iET69hKRD0QglbMjHRkdESoOT7JBAayBdQimGpglYs3uX5JZxkvIUO1DxzbWJIMuaT
 FdNX31PqCR3RheFe91u+hw9d4TEuB5FPGqQkQ9kwHaNim15idKU4/ow/fDSOGVCQTdhe
 C0nLo5NTTN2EbvEMZa1276LR/uog5GUt/yL+6ZcGB7ZPzMaozmC+r/5e7QGejGWCVv1B
 61+L1ykJgJdoXjBeYH/hoUvXlW7kRA5s9B4JNdAL6lX8KYKdAz3QdQ9VZ2S7CTk796Lz
 5MxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=p2piBi8Ozx4jTHEUdEu9+IfOYxwK0Xlxc+q8XX5+gtc=;
 b=owj2URIDG1EYIJWOVYQqaOYoraOKNgcLQmaSrGK28/bB+IgqWlP2F3Uj5zF/6e5FnW
 dwzJTYmOagL2Q1Ozz6OHPBfDD9gqSCYqpIGBJAjjaqjLMOtxIfkMCU8LpxxQSYpDmxSE
 6ue5Kej0mkypkiJuQinTahRa370dBb3OSlIS+wfmS8NNGfDfink3rwoZqNY7U5tSHel5
 MW7noAa2nR+iJ7e6qmZmLhzknsOE9v1dBPbS6v/DPYg+cg0qVldWsGdymidPKNgRut3c
 6Bk3k3RRHklXXYZLiZB2W1lZvM4ebzfRvdXXHb8Wi6ANUU+lYBRtdLLSmR/VD7vwXCH+
 TqKQ==
X-Gm-Message-State: AOAM5319yKBTAX4xr+2GkYvq4T7ZxhaudlGN83a7xLKSD+0v00t/3NZ7
 0y27/ESFCsPl5FG0skXr05wUSFxzBEQUtSnplRaB3A==
X-Google-Smtp-Source: ABdhPJwhePIU2pv8Iz75U74oWIZY3e4Xq1QVfd/Pnu61GmzD//lnBp+n3dFbZ+24DqRteex115PK3WJs/MTwYzgHw3Q=
X-Received: by 2002:a17:906:a08d:: with SMTP id
 q13mr43602856ejy.465.1638780850907; 
 Mon, 06 Dec 2021 00:54:10 -0800 (PST)
MIME-Version: 1.0
References: <1638472142-14396-1-git-send-email-eric.devolder@oracle.com>
 <1638472142-14396-8-git-send-email-eric.devolder@oracle.com>
In-Reply-To: <1638472142-14396-8-git-send-email-eric.devolder@oracle.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Mon, 6 Dec 2021 14:24:00 +0530
Message-ID: <CAARzgwyVo5R7db4GYTzftBOqYpKRLTdexf1E0=qdXA+TLgCdmg@mail.gmail.com>
Subject: Re: [PATCH v9 07/10] ACPI ERST: create ACPI ERST table for pc/x86
 machines
To: Eric DeVolder <eric.devolder@oracle.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::533
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::533;
 envelope-from=ani@anisinha.ca; helo=mail-ed1-x533.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: berrange@redhat.com, ehabkost@redhat.com, mst@redhat.com,
 konrad.wilk@oracle.com, qemu-devel@nongnu.org, pbonzini@redhat.com,
 imammedo@redhat.com, boris.ostrovsky@oracle.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Dec 3, 2021 at 12:40 AM Eric DeVolder <eric.devolder@oracle.com> wrote:
>
> This change exposes ACPI ERST support for x86 guests.
>
> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>

Reviewed-by: Ani Sinha <ani@anisinha.ca>

> ---
>  hw/i386/acpi-build.c   | 15 +++++++++++++++
>  hw/i386/acpi-microvm.c | 15 +++++++++++++++
>  include/hw/acpi/erst.h |  5 +++++
>  3 files changed, 35 insertions(+)
>
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index a99c6e4..55bca28 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -43,6 +43,7 @@
>  #include "sysemu/tpm.h"
>  #include "hw/acpi/tpm.h"
>  #include "hw/acpi/vmgenid.h"
> +#include "hw/acpi/erst.h"
>  #include "sysemu/tpm_backend.h"
>  #include "hw/rtc/mc146818rtc_regs.h"
>  #include "migration/vmstate.h"
> @@ -74,6 +75,8 @@
>  #include "hw/acpi/hmat.h"
>  #include "hw/acpi/viot.h"
>
> +#include CONFIG_DEVICES
> +
>  /* These are used to size the ACPI tables for -M pc-i440fx-1.7 and
>   * -M pc-i440fx-2.0.  Even if the actual amount of AML generated grows
>   * a little bit, there should be plenty of free space since the DSDT
> @@ -2566,6 +2569,18 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
>                      ACPI_DEVICE_IF(x86ms->acpi_dev), x86ms->oem_id,
>                      x86ms->oem_table_id);
>
> +#ifdef CONFIG_ACPI_ERST
> +    {
> +        Object *erst_dev;
> +        erst_dev = find_erst_dev();
> +        if (erst_dev) {
> +            acpi_add_table(table_offsets, tables_blob);
> +            build_erst(tables_blob, tables->linker, erst_dev,
> +                       x86ms->oem_id, x86ms->oem_table_id);
> +        }
> +    }
> +#endif
> +
>      vmgenid_dev = find_vmgenid_dev();
>      if (vmgenid_dev) {
>          acpi_add_table(table_offsets, tables_blob);
> diff --git a/hw/i386/acpi-microvm.c b/hw/i386/acpi-microvm.c
> index 196d318..68ca7e7 100644
> --- a/hw/i386/acpi-microvm.c
> +++ b/hw/i386/acpi-microvm.c
> @@ -30,6 +30,7 @@
>  #include "hw/acpi/bios-linker-loader.h"
>  #include "hw/acpi/generic_event_device.h"
>  #include "hw/acpi/utils.h"
> +#include "hw/acpi/erst.h"
>  #include "hw/i386/fw_cfg.h"
>  #include "hw/i386/microvm.h"
>  #include "hw/pci/pci.h"
> @@ -40,6 +41,8 @@
>  #include "acpi-common.h"
>  #include "acpi-microvm.h"
>
> +#include CONFIG_DEVICES
> +
>  static void acpi_dsdt_add_virtio(Aml *scope,
>                                   MicrovmMachineState *mms)
>  {
> @@ -207,6 +210,18 @@ static void acpi_build_microvm(AcpiBuildTables *tables,
>                      ACPI_DEVICE_IF(x86ms->acpi_dev), x86ms->oem_id,
>                      x86ms->oem_table_id);
>
> +#ifdef CONFIG_ACPI_ERST
> +    {
> +        Object *erst_dev;
> +        erst_dev = find_erst_dev();
> +        if (erst_dev) {
> +            acpi_add_table(table_offsets, tables_blob);
> +            build_erst(tables_blob, tables->linker, erst_dev,
> +                       x86ms->oem_id, x86ms->oem_table_id);
> +        }
> +    }
> +#endif
> +
>      xsdt = tables_blob->len;
>      build_xsdt(tables_blob, tables->linker, table_offsets, x86ms->oem_id,
>                 x86ms->oem_table_id);
> diff --git a/include/hw/acpi/erst.h b/include/hw/acpi/erst.h
> index 9d63717..b747fe7 100644
> --- a/include/hw/acpi/erst.h
> +++ b/include/hw/acpi/erst.h
> @@ -16,4 +16,9 @@ void build_erst(GArray *table_data, BIOSLinker *linker, Object *erst_dev,
>
>  #define TYPE_ACPI_ERST "acpi-erst"
>
> +/* returns NULL unless there is exactly one device */
> +static inline Object *find_erst_dev(void)
> +{
> +    return object_resolve_path_type("", TYPE_ACPI_ERST, NULL);
> +}
>  #endif
> --
> 1.8.3.1
>

