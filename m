Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 445DF1F638B
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Jun 2020 10:26:48 +0200 (CEST)
Received: from localhost ([::1]:47510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jjIXv-0003ia-4c
	for lists+qemu-devel@lfdr.de; Thu, 11 Jun 2020 04:26:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jjITx-0005dS-6p
 for qemu-devel@nongnu.org; Thu, 11 Jun 2020 04:22:41 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:25462
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jjITv-0007AG-KZ
 for qemu-devel@nongnu.org; Thu, 11 Jun 2020 04:22:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591863759;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=FSjH9NKn3VO/G12rdVGk2OT+s6dKRLGx1wAgVoovIRE=;
 b=RSiFVrjKrmS6+OxZiNC6vlAUWNVVTuTG9Svsm9VQU+EhxrB6iS5S/fa9qTSDALXkCRSuAz
 u6u6KNC6J2bK4IsZ8jwMWuFRAHjKDHVdA8zidLyvWsmyslVLvTjqybhGrkaz0DJ6LbKeny
 Bq6SwP4ksWGbM5K0JYzHGZ/lGKVmQ48=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-471-yAF1cdgKPZucPMSVqahrVA-1; Thu, 11 Jun 2020 04:22:37 -0400
X-MC-Unique: yAF1cdgKPZucPMSVqahrVA-1
Received: by mail-wm1-f72.google.com with SMTP id a18so842169wmm.3
 for <qemu-devel@nongnu.org>; Thu, 11 Jun 2020 01:22:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=FSjH9NKn3VO/G12rdVGk2OT+s6dKRLGx1wAgVoovIRE=;
 b=GrKtQDKMC7JYnKujGpMjB50XN1CVzavwkA8/XEyA+jLGSvPHh38DzW1d2bscPxkrVp
 pNfXt1whMF6TjRK2+WHIs9FdE4J3Cj09ZliAd8+NBHF5ucwnhFbThy6OkQRGX3ZJPx9f
 urQwW0yWLpLnR/ySBicYSFOD8rSnnhYT9957XVJ+ov1b75PBhohXce2hBEa6cbYFvuDS
 +OzgCxV76crd3EvSYcZMMAcLIxv7uxhoYwoZGtGSwACfPgwqfFOgyYFWeW7evq0QT7uj
 CJrw5FOGOszmpTOEQZReTS3SKSc+ckzlBhcy0bjkeo7k+aszH82EKdhk0T7aiufqG9bF
 iFAA==
X-Gm-Message-State: AOAM533Uresg7Tr95MjZRADcx4oc3r5WHhaADRzdAReLqHf7bzsOurhX
 7+h0XFufEsh/RxXFXDo47/oww0h/2gCpKExbtMi6L3B2bkYW27WA7MKvUDvYzRPVbhWMi3xxXzP
 R3qn1RRyEEgL5phM=
X-Received: by 2002:a5d:49c5:: with SMTP id t5mr8377178wrs.18.1591863756190;
 Thu, 11 Jun 2020 01:22:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyIbFPXz8wQng9fBc8gobdk5+kZ1pIwiO017+PW/P4HfrQJZg9jvq77TQvnPFHm7j4Vd2vURA==
X-Received: by 2002:a5d:49c5:: with SMTP id t5mr8377132wrs.18.1591863755721;
 Thu, 11 Jun 2020 01:22:35 -0700 (PDT)
Received: from [192.168.1.38] (181.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id q8sm2836529wmq.1.2020.06.11.01.22.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Jun 2020 01:22:34 -0700 (PDT)
Subject: Re: [PATCH v8 02/10] acpi: move aml builder code for floppy device
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
References: <20200611072919.16638-1-kraxel@redhat.com>
 <20200611072919.16638-3-kraxel@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Autocrypt: addr=philmd@redhat.com; keydata=
 mQINBDXML8YBEADXCtUkDBKQvNsQA7sDpw6YLE/1tKHwm24A1au9Hfy/OFmkpzo+MD+dYc+7
 bvnqWAeGweq2SDq8zbzFZ1gJBd6+e5v1a/UrTxvwBk51yEkadrpRbi+r2bDpTJwXc/uEtYAB
 GvsTZMtiQVA4kRID1KCdgLa3zztPLCj5H1VZhqZsiGvXa/nMIlhvacRXdbgllPPJ72cLUkXf
 z1Zu4AkEKpccZaJspmLWGSzGu6UTZ7UfVeR2Hcc2KI9oZB1qthmZ1+PZyGZ/Dy+z+zklC0xl
 XIpQPmnfy9+/1hj1LzJ+pe3HzEodtlVA+rdttSvA6nmHKIt8Ul6b/h1DFTmUT1lN1WbAGxmg
 CH1O26cz5nTrzdjoqC/b8PpZiT0kO5MKKgiu5S4PRIxW2+RA4H9nq7nztNZ1Y39bDpzwE5Sp
 bDHzd5owmLxMLZAINtCtQuRbSOcMjZlg4zohA9TQP9krGIk+qTR+H4CV22sWldSkVtsoTaA2
 qNeSJhfHQY0TyQvFbqRsSNIe2gTDzzEQ8itsmdHHE/yzhcCVvlUzXhAT6pIN0OT+cdsTTfif
 MIcDboys92auTuJ7U+4jWF1+WUaJ8gDL69ThAsu7mGDBbm80P3vvUZ4fQM14NkxOnuGRrJxO
 qjWNJ2ZUxgyHAh5TCxMLKWZoL5hpnvx3dF3Ti9HW2dsUUWICSQARAQABtDJQaGlsaXBwZSBN
 YXRoaWV1LURhdWTDqSAoUGhpbCkgPHBoaWxtZEByZWRoYXQuY29tPokCVQQTAQgAPwIbDwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4AWIQSJweePYB7obIZ0lcuio/1u3q3A3gUCXsfWwAUJ
 KtymWgAKCRCio/1u3q3A3ircD/9Vjh3aFNJ3uF3hddeoFg1H038wZr/xi8/rX27M1Vj2j9VH
 0B8Olp4KUQw/hyO6kUxqkoojmzRpmzvlpZ0cUiZJo2bQIWnvScyHxFCv33kHe+YEIqoJlaQc
 JfKYlbCoubz+02E2A6bFD9+BvCY0LBbEj5POwyKGiDMjHKCGuzSuDRbCn0Mz4kCa7nFMF5Jv
 piC+JemRdiBd6102ThqgIsyGEBXuf1sy0QIVyXgaqr9O2b/0VoXpQId7yY7OJuYYxs7kQoXI
 6WzSMpmuXGkmfxOgbc/L6YbzB0JOriX0iRClxu4dEUg8Bs2pNnr6huY2Ft+qb41RzCJvvMyu
 gS32LfN0bTZ6Qm2A8ayMtUQgnwZDSO23OKgQWZVglGliY3ezHZ6lVwC24Vjkmq/2yBSLakZE
 6DZUjZzCW1nvtRK05ebyK6tofRsx8xB8pL/kcBb9nCuh70aLR+5cmE41X4O+MVJbwfP5s/RW
 9BFSL3qgXuXso/3XuWTQjJJGgKhB6xXjMmb1J4q/h5IuVV4juv1Fem9sfmyrh+Wi5V1IzKI7
 RPJ3KVb937eBgSENk53P0gUorwzUcO+ASEo3Z1cBKkJSPigDbeEjVfXQMzNt0oDRzpQqH2vp
 apo2jHnidWt8BsckuWZpxcZ9+/9obQ55DyVQHGiTN39hkETy3Emdnz1JVHTU0Q==
Message-ID: <d3798ec3-18e2-0d56-5f1a-f3a1e157561f@redhat.com>
Date: Thu, 11 Jun 2020 10:22:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200611072919.16638-3-kraxel@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/11 03:29:33
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/11/20 9:29 AM, Gerd Hoffmann wrote:
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>  hw/block/fdc.c       | 83 ++++++++++++++++++++++++++++++++++++++++++++
>  hw/i386/acpi-build.c | 83 --------------------------------------------
>  stubs/cmos.c         |  7 ++++
>  stubs/Makefile.objs  |  1 +
>  4 files changed, 91 insertions(+), 83 deletions(-)
>  create mode 100644 stubs/cmos.c
> 
> diff --git a/hw/block/fdc.c b/hw/block/fdc.c
> index c5fb9d6ece77..b4d2eaf66dcd 100644
> --- a/hw/block/fdc.c
> +++ b/hw/block/fdc.c
> @@ -32,6 +32,8 @@
>  #include "qapi/error.h"
>  #include "qemu/error-report.h"
>  #include "qemu/timer.h"
> +#include "hw/i386/pc.h"
> +#include "hw/acpi/aml-build.h"
>  #include "hw/irq.h"
>  #include "hw/isa/isa.h"
>  #include "hw/qdev-properties.h"
> @@ -2765,6 +2767,85 @@ void isa_fdc_get_drive_max_chs(FloppyDriveType type,
>      (*maxc)--;
>  }
>  
> +static Aml *build_fdinfo_aml(int idx, FloppyDriveType type)
> +{
> +    Aml *dev, *fdi;
> +    uint8_t maxc, maxh, maxs;
> +
> +    isa_fdc_get_drive_max_chs(type, &maxc, &maxh, &maxs);
> +
> +    dev = aml_device("FLP%c", 'A' + idx);
> +
> +    aml_append(dev, aml_name_decl("_ADR", aml_int(idx)));
> +
> +    fdi = aml_package(16);
> +    aml_append(fdi, aml_int(idx));  /* Drive Number */
> +    aml_append(fdi,
> +        aml_int(cmos_get_fd_drive_type(type)));  /* Device Type */
> +    /*
> +     * the values below are the limits of the drive, and are thus independent
> +     * of the inserted media
> +     */
> +    aml_append(fdi, aml_int(maxc));  /* Maximum Cylinder Number */
> +    aml_append(fdi, aml_int(maxs));  /* Maximum Sector Number */
> +    aml_append(fdi, aml_int(maxh));  /* Maximum Head Number */
> +    /*
> +     * SeaBIOS returns the below values for int 0x13 func 0x08 regardless of
> +     * the drive type, so shall we
> +     */
> +    aml_append(fdi, aml_int(0xAF));  /* disk_specify_1 */
> +    aml_append(fdi, aml_int(0x02));  /* disk_specify_2 */
> +    aml_append(fdi, aml_int(0x25));  /* disk_motor_wait */
> +    aml_append(fdi, aml_int(0x02));  /* disk_sector_siz */
> +    aml_append(fdi, aml_int(0x12));  /* disk_eot */
> +    aml_append(fdi, aml_int(0x1B));  /* disk_rw_gap */
> +    aml_append(fdi, aml_int(0xFF));  /* disk_dtl */
> +    aml_append(fdi, aml_int(0x6C));  /* disk_formt_gap */
> +    aml_append(fdi, aml_int(0xF6));  /* disk_fill */
> +    aml_append(fdi, aml_int(0x0F));  /* disk_head_sttl */
> +    aml_append(fdi, aml_int(0x08));  /* disk_motor_strt */
> +
> +    aml_append(dev, aml_name_decl("_FDI", fdi));
> +    return dev;
> +}
> +
> +static void fdc_isa_build_aml(ISADevice *isadev, Aml *scope)
> +{
> +    Aml *dev;
> +    Aml *crs;
> +    int i;
> +
> +#define ACPI_FDE_MAX_FD 4
> +    uint32_t fde_buf[5] = {
> +        0, 0, 0, 0,     /* presence of floppy drives #0 - #3 */
> +        cpu_to_le32(2)  /* tape presence (2 == never present) */
> +    };
> +
> +    crs = aml_resource_template();
> +    aml_append(crs, aml_io(AML_DECODE16, 0x03F2, 0x03F2, 0x00, 0x04));
> +    aml_append(crs, aml_io(AML_DECODE16, 0x03F7, 0x03F7, 0x00, 0x01));
> +    aml_append(crs, aml_irq_no_flags(6));
> +    aml_append(crs,
> +        aml_dma(AML_COMPATIBILITY, AML_NOTBUSMASTER, AML_TRANSFER8, 2));
> +
> +    dev = aml_device("FDC0");
> +    aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0700")));
> +    aml_append(dev, aml_name_decl("_CRS", crs));
> +
> +    for (i = 0; i < MIN(MAX_FD, ACPI_FDE_MAX_FD); i++) {
> +        FloppyDriveType type = isa_fdc_get_drive_type(isadev, i);
> +
> +        if (type < FLOPPY_DRIVE_TYPE_NONE) {
> +            fde_buf[i] = cpu_to_le32(1);  /* drive present */
> +            aml_append(dev, build_fdinfo_aml(i, type));
> +        }
> +    }
> +    aml_append(dev, aml_name_decl("_FDE",
> +               aml_buffer(sizeof(fde_buf), (uint8_t *)fde_buf)));
> +
> +    aml_append(scope, dev);
> +}
> +
>  static const VMStateDescription vmstate_isa_fdc ={
>      .name = "fdc",
>      .version_id = 2,
> @@ -2798,11 +2879,13 @@ static Property isa_fdc_properties[] = {
>  static void isabus_fdc_class_init(ObjectClass *klass, void *data)
>  {
>      DeviceClass *dc = DEVICE_CLASS(klass);
> +    ISADeviceClass *isa = ISA_DEVICE_CLASS(klass);
>  
>      dc->realize = isabus_fdc_realize;
>      dc->fw_name = "fdc";
>      dc->reset = fdctrl_external_reset_isa;
>      dc->vmsd = &vmstate_isa_fdc;
> +    isa->build_aml = fdc_isa_build_aml;
>      device_class_set_props(dc, isa_fdc_properties);
>      set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
>  }
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index 473cbdfffd05..7726d5c0f7cb 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -937,85 +937,6 @@ static void build_hpet_aml(Aml *table)
>      aml_append(table, scope);
>  }
>  
> -static Aml *build_fdinfo_aml(int idx, FloppyDriveType type)
> -{
> -    Aml *dev, *fdi;
> -    uint8_t maxc, maxh, maxs;
> -
> -    isa_fdc_get_drive_max_chs(type, &maxc, &maxh, &maxs);
> -
> -    dev = aml_device("FLP%c", 'A' + idx);
> -
> -    aml_append(dev, aml_name_decl("_ADR", aml_int(idx)));
> -
> -    fdi = aml_package(16);
> -    aml_append(fdi, aml_int(idx));  /* Drive Number */
> -    aml_append(fdi,
> -        aml_int(cmos_get_fd_drive_type(type)));  /* Device Type */
> -    /*
> -     * the values below are the limits of the drive, and are thus independent
> -     * of the inserted media
> -     */
> -    aml_append(fdi, aml_int(maxc));  /* Maximum Cylinder Number */
> -    aml_append(fdi, aml_int(maxs));  /* Maximum Sector Number */
> -    aml_append(fdi, aml_int(maxh));  /* Maximum Head Number */
> -    /*
> -     * SeaBIOS returns the below values for int 0x13 func 0x08 regardless of
> -     * the drive type, so shall we
> -     */
> -    aml_append(fdi, aml_int(0xAF));  /* disk_specify_1 */
> -    aml_append(fdi, aml_int(0x02));  /* disk_specify_2 */
> -    aml_append(fdi, aml_int(0x25));  /* disk_motor_wait */
> -    aml_append(fdi, aml_int(0x02));  /* disk_sector_siz */
> -    aml_append(fdi, aml_int(0x12));  /* disk_eot */
> -    aml_append(fdi, aml_int(0x1B));  /* disk_rw_gap */
> -    aml_append(fdi, aml_int(0xFF));  /* disk_dtl */
> -    aml_append(fdi, aml_int(0x6C));  /* disk_formt_gap */
> -    aml_append(fdi, aml_int(0xF6));  /* disk_fill */
> -    aml_append(fdi, aml_int(0x0F));  /* disk_head_sttl */
> -    aml_append(fdi, aml_int(0x08));  /* disk_motor_strt */
> -
> -    aml_append(dev, aml_name_decl("_FDI", fdi));
> -    return dev;
> -}
> -
> -static Aml *build_fdc_device_aml(ISADevice *fdc)
> -{
> -    int i;
> -    Aml *dev;
> -    Aml *crs;
> -
> -#define ACPI_FDE_MAX_FD 4
> -    uint32_t fde_buf[5] = {
> -        0, 0, 0, 0,     /* presence of floppy drives #0 - #3 */
> -        cpu_to_le32(2)  /* tape presence (2 == never present) */
> -    };
> -
> -    dev = aml_device("FDC0");
> -    aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0700")));
> -
> -    crs = aml_resource_template();
> -    aml_append(crs, aml_io(AML_DECODE16, 0x03F2, 0x03F2, 0x00, 0x04));
> -    aml_append(crs, aml_io(AML_DECODE16, 0x03F7, 0x03F7, 0x00, 0x01));
> -    aml_append(crs, aml_irq_no_flags(6));
> -    aml_append(crs,
> -        aml_dma(AML_COMPATIBILITY, AML_NOTBUSMASTER, AML_TRANSFER8, 2));
> -    aml_append(dev, aml_name_decl("_CRS", crs));
> -
> -    for (i = 0; i < MIN(MAX_FD, ACPI_FDE_MAX_FD); i++) {
> -        FloppyDriveType type = isa_fdc_get_drive_type(fdc, i);
> -
> -        if (type < FLOPPY_DRIVE_TYPE_NONE) {
> -            fde_buf[i] = cpu_to_le32(1);  /* drive present */
> -            aml_append(dev, build_fdinfo_aml(i, type));
> -        }
> -    }
> -    aml_append(dev, aml_name_decl("_FDE",
> -               aml_buffer(sizeof(fde_buf), (uint8_t *)fde_buf)));
> -
> -    return dev;
> -}
> -
>  static Aml *build_kbd_device_aml(void)
>  {
>      Aml *dev;
> @@ -1054,7 +975,6 @@ static Aml *build_mouse_device_aml(void)
>  
>  static void build_isa_devices_aml(Aml *table)
>  {
> -    ISADevice *fdc = pc_find_fdc0();
>      bool ambiguous;
>  
>      Aml *scope = aml_scope("_SB.PCI0.ISA");
> @@ -1062,9 +982,6 @@ static void build_isa_devices_aml(Aml *table)
>  
>      aml_append(scope, build_kbd_device_aml());
>      aml_append(scope, build_mouse_device_aml());
> -    if (fdc) {
> -        aml_append(scope, build_fdc_device_aml(fdc));
> -    }
>  
>      if (ambiguous) {
>          error_report("Multiple ISA busses, unable to define IPMI ACPI data");
> diff --git a/stubs/cmos.c b/stubs/cmos.c
> new file mode 100644
> index 000000000000..416cbe4055ff
> --- /dev/null
> +++ b/stubs/cmos.c
> @@ -0,0 +1,7 @@
> +#include "qemu/osdep.h"
> +#include "hw/i386/pc.h"
> +
> +int cmos_get_fd_drive_type(FloppyDriveType fd0)
> +{
> +    return 0;
> +}
> diff --git a/stubs/Makefile.objs b/stubs/Makefile.objs
> index c1e43ac68f87..df2cbfe68ca0 100644
> --- a/stubs/Makefile.objs
> +++ b/stubs/Makefile.objs
> @@ -1,4 +1,5 @@
>  stub-obj-y += blk-commit-all.o
> +stub-obj-y += cmos.o
>  stub-obj-y += cpu-get-clock.o
>  stub-obj-y += cpu-get-icount.o
>  stub-obj-y += dump.o
> 


