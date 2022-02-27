Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C5B94C59D4
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Feb 2022 07:58:54 +0100 (CET)
Received: from localhost ([::1]:33256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nODW6-0005OB-AK
	for lists+qemu-devel@lfdr.de; Sun, 27 Feb 2022 01:58:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nODU5-0003xc-Aq
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 01:56:45 -0500
Received: from [2607:f8b0:4864:20::629] (port=38527
 helo=mail-pl1-x629.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nODU2-0002Ep-NM
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 01:56:44 -0500
Received: by mail-pl1-x629.google.com with SMTP id h17so2612422plc.5
 for <qemu-devel@nongnu.org>; Sat, 26 Feb 2022 22:56:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=F5djDTyBGY2DWHsG9oTEZyyMNbcEzItLnFUrsv3IRIk=;
 b=rv0bYpstzA9IZS7IiZlWjr1HpBQN2jbU09H4wsKEVCF1vHPvMjQkGjjZzmmQ8w6R2r
 weUXY/Eww6hWS6IdzJvio6RKHmXl8yYIyWolzDTC0Lp06/8iR5X0DUbiRyEBJpIgybzU
 jnojsVJOcGUHl0PKOk/yxwc2I94KPWl8rEUue+dRjnG/wdTpjf0ioaBw55CFpstK2Wdt
 9xYGib7HoV4TAfDA/jnw0QU0Y2sneIoK6mhsTbShW5CaazEaBhwD3hoQn1+s2FZddaP8
 H+mplU4eEJHLONua2OQE8Eu3pUopy0Oyk+bDelesCGkyRf5hpEKFANw1PfhwgQ1lIHeW
 4MjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=F5djDTyBGY2DWHsG9oTEZyyMNbcEzItLnFUrsv3IRIk=;
 b=vvjMy39rWWvPduPcYAnESTbO1mr991vc5evK304kWDHQ4np2KT4W2pK0QsLLbGBuqr
 zGgWM3gMWlYOOPMxpfTonSBZjhJ80kWwIGAXoKmBMvswvauUDR7ivsT378vaRNPnV39E
 g73WlgFeOkq0HzITrRDnNgWC/JNDqAFyfRnHzzosLJq2/5EazFT2Ci6qsg2eppums3ou
 psDBPpoG0SJDeLtzwLmAsdUQvBIOCdP8zIE/M07u+bnAivQLZU9zcoDZ38IS9+khCom9
 yoTSFcR9G9GiaE1iU6e+nk5crN0FPw3jbvUbLh07fmU3WDNp8e/anMYbdN03uwdyFqnk
 XP4g==
X-Gm-Message-State: AOAM532O08XM6bZxPG8zQg9jbdWDMstRdQ/CNgRB2ZnhUB/5kgjeKG78
 aijyBal4baLJfNQdhQnMwayGww==
X-Google-Smtp-Source: ABdhPJw6giP9D5RAH3u1xlQ+UWDqJgqVhjXPXDjep1RiBzXQFvbhuXgimPLIxhl2gV2FE8oraaWx+Q==
X-Received: by 2002:a17:902:b945:b0:14e:e5c4:7bcd with SMTP id
 h5-20020a170902b94500b0014ee5c47bcdmr15100768pls.48.1645944999177; 
 Sat, 26 Feb 2022 22:56:39 -0800 (PST)
Received: from anisinha-lenovo ([115.96.134.68])
 by smtp.googlemail.com with ESMTPSA id
 m6-20020a62f206000000b004e152bc0527sm8805130pfh.153.2022.02.26.22.56.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Feb 2022 22:56:38 -0800 (PST)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Sun, 27 Feb 2022 12:26:33 +0530 (IST)
X-X-Sender: anisinha@anisinha-lenovo
To: Liav Albani <liavalb@gmail.com>
Subject: Re: [PATCH v3 3/4] hw/acpi: add indication for i8042 in IA-PC boot
 flags of the FADT table
In-Reply-To: <20220226063019.1112654-4-liavalb@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2202271222230.1249418@anisinha-lenovo>
References: <20220226063019.1112654-1-liavalb@gmail.com>
 <20220226063019.1112654-4-liavalb@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::629
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::629;
 envelope-from=ani@anisinha.ca; helo=mail-pl1-x629.google.com
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

> This can allow the guest OS to determine more easily if i8042 controller
> is present in the system or not, so it doesn't need to do probing of the
> controller, but just initialize it immediately, before enumerating the
> ACPI AML namespace.
>
> Signed-off-by: Liav Albani <liavalb@gmail.com>
> ---
>  hw/acpi/aml-build.c         | 7 ++++++-
>  hw/i386/acpi-build.c        | 8 ++++++++
>  hw/i386/acpi-microvm.c      | 9 +++++++++
>  include/hw/acpi/acpi-defs.h | 1 +
>  4 files changed, 24 insertions(+), 1 deletion(-)
>
> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> index 8966e16320..ef5f4cad87 100644
> --- a/hw/acpi/aml-build.c
> +++ b/hw/acpi/aml-build.c
> @@ -2152,7 +2152,12 @@ void build_fadt(GArray *tbl, BIOSLinker *linker, const AcpiFadtData *f,
>      build_append_int_noprefix(tbl, 0, 1); /* DAY_ALRM */
>      build_append_int_noprefix(tbl, 0, 1); /* MON_ALRM */
>      build_append_int_noprefix(tbl, f->rtc_century, 1); /* CENTURY */
> -    build_append_int_noprefix(tbl, 0, 2); /* IAPC_BOOT_ARCH */
> +    /* IAPC_BOOT_ARCH */
> +    if (f->rev == 1) {
> +        build_append_int_noprefix(tbl, 0, 2);
> +    } else {
> +        build_append_int_noprefix(tbl, f->iapc_boot_arch, 2);
> +    }

Like a suggested in the previous iteration, please add a comment here to
specify why you are adding this only for rev !=1 . Also please mention
that your change only affects q35 machines since i440fx uses rev 1 (ref to
acpi_get_pm_info()).


>      build_append_int_noprefix(tbl, 0, 1); /* Reserved */
>      build_append_int_noprefix(tbl, f->flags, 4); /* Flags */
>
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index ebd47aa26f..65dbc1ec36 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -192,6 +192,14 @@ static void init_common_fadt_data(MachineState *ms, Object *o,
>              .address = object_property_get_uint(o, ACPI_PM_PROP_GPE0_BLK, NULL)
>          },
>      };
> +    /*
> +     * second bit of 16 but

wow, you even retained my typo here! :-)


>IAPC_BOOT_ARCH indicates presence of 8042 or
> +     * equivalent micro controller. See table 5-10 of APCI spec version 2.0
> +     * (the earliest acpi revision that supports this).
> +     */
> +
> +    fadt.iapc_boot_arch = isa_check_device_existence("i8042") ? 0x0002 : 0x0000;
> +
>      *data = fadt;
>  }
>
> diff --git a/hw/i386/acpi-microvm.c b/hw/i386/acpi-microvm.c
> index 68ca7e7fc2..e5f89164be 100644
> --- a/hw/i386/acpi-microvm.c
> +++ b/hw/i386/acpi-microvm.c
> @@ -189,6 +189,15 @@ static void acpi_build_microvm(AcpiBuildTables *tables,
>          .reset_val = ACPI_GED_RESET_VALUE,
>      };
>
> +    /*
> +     * second bit of 16 but IAPC_BOOT_ARCH indicates presence of 8042 or
>

ditto as above.

 +     * equivalent micro controller. See table 5-10 of APCI spec version 2.0
> +     * (the earliest acpi revision that supports this).
> +     */
> +
> +    pmfadt.iapc_boot_arch = isa_check_device_existence("i8042") ? 0x0002
> +                            : 0x0000;
> +
>      table_offsets = g_array_new(false, true /* clear */,
>                                          sizeof(uint32_t));
>      bios_linker_loader_alloc(tables->linker,
> diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
> index c97e8633ad..2b42e4192b 100644
> --- a/include/hw/acpi/acpi-defs.h
> +++ b/include/hw/acpi/acpi-defs.h
> @@ -77,6 +77,7 @@ typedef struct AcpiFadtData {
>      uint16_t plvl2_lat;        /* P_LVL2_LAT */
>      uint16_t plvl3_lat;        /* P_LVL3_LAT */
>      uint16_t arm_boot_arch;    /* ARM_BOOT_ARCH */
> +    uint16_t iapc_boot_arch;   /* IAPC_BOOT_ARCH */
>      uint8_t minor_ver;         /* FADT Minor Version */
>
>      /*
> --
> 2.35.1
>
>

