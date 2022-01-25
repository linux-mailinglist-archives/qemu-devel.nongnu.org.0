Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D11FB49B6E4
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 15:52:34 +0100 (CET)
Received: from localhost ([::1]:54152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCNBR-00036a-O0
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 09:52:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nCLz6-0001rZ-Ic
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 08:35:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51017)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nCLz3-0007r8-Gu
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 08:35:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643117738;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Iezvwt8GFXIpqvQxMYi343NFdqiIfulD4s5AtZkMezU=;
 b=QLpmbu5MqMiGpcuMyGT4d4Laf/EKoLtRMvt5pM28XWYdTBfpyuca1Cl297CGMIPA1hW7Jm
 PTPtk9vHHXMiWwAamsOZYI8qgH8XY11R8dKesmBMWQsZsWXQtB20rnZxtFQXCmukV5SV7G
 jB5ztlqEbJpDdk7jIcQnb8UprwgNEUE=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-161-3o4pZQGBPOyaPgjFQtOyGg-1; Tue, 25 Jan 2022 08:35:37 -0500
X-MC-Unique: 3o4pZQGBPOyaPgjFQtOyGg-1
Received: by mail-ej1-f72.google.com with SMTP id
 o4-20020a170906768400b006a981625756so3533887ejm.0
 for <qemu-devel@nongnu.org>; Tue, 25 Jan 2022 05:35:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Iezvwt8GFXIpqvQxMYi343NFdqiIfulD4s5AtZkMezU=;
 b=2I6mfZTd/TuJPSRCTfojpeNZgANkFpSnaY6V4aBmU3vjn3WksMxY0jYENUxHEjeuw7
 0Li0JhPWY6yQBkhbC0R1pyF4++WaEN/lQO0EqF9rGAlmBxNnqTNjsPTtFha8xSaikNoE
 0qpLr2V+sjA9aqn0JaFVZbokTEY0DxRUJOr28HcV0BVprRHwJI883q2VJhd5Hh9hx968
 j5V/D2GXCHGrTFlMiqLBizw4c1+kncMY3z0l6OxcWTdJZhcoFbNTjGHq4KMMUPp4liNa
 G8VBz/JG47JK4GN23JECpMtQzaRbleMiCiixx3vKPBkdsjbbRUDSFq5F5mnJRCPxlcjr
 Mxjg==
X-Gm-Message-State: AOAM531MiU9BzHrNfb5wy9ITd7DU5NCbVZd8q/w83uZYixKrtD7zp2+V
 /JRHRnnXZYv/xhfPa/juj3Shu1L2U2y42bm7z/D2EitUPVB/rT4RDnITXxZHmoG2mk6DmYGh5wt
 44z+7MTch4eg6/pg=
X-Received: by 2002:a17:906:a213:: with SMTP id
 r19mr16238960ejy.329.1643117735417; 
 Tue, 25 Jan 2022 05:35:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw9g3VZO0AN9tu6VwDxdFPV5PnfEGls58J+sJe8T3SRZKZcHvrf/nkxO6XY+6kci6HPQ+vVbw==
X-Received: by 2002:a17:906:a213:: with SMTP id
 r19mr16238938ejy.329.1643117735127; 
 Tue, 25 Jan 2022 05:35:35 -0800 (PST)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id pg25sm6304743ejb.174.2022.01.25.05.35.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jan 2022 05:35:34 -0800 (PST)
Date: Tue, 25 Jan 2022 14:35:33 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Patrick Venture <venture@google.com>
Subject: Re: [PATCH v2] hw/smbios: Add table 4 parameter, "processor-id"
Message-ID: <20220125143533.5d8e2848@redhat.com>
In-Reply-To: <20220124201151.833769-1-venture@google.com>
References: <20220124201151.833769-1-venture@google.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.158,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: ani@anisinha.ca, Titus Rwantare <titusr@google.com>,
 Peter Foley <pefoley@google.com>, qemu-devel@nongnu.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 24 Jan 2022 12:11:51 -0800
Patrick Venture <venture@google.com> wrote:

> This parameter is to be used in the processor_id lower 32-bit entry in
> the type 4 table.  The upper 32-bits represent the features for the CPU.
> This patch leaves those as 0 when the lower 32-bits are set.

Did you forget to update commit message ^^^^ ?

Other than that patch looks good to me,
so with commit message fixed:

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> This parameter is set as optional and if left will use the values from
> the CPU model.
> 
> This enables hiding the host information from the guest and allowing AMD
> VMs to run pretending to be Intel for some userspace software concerns.
> 
> Reviewed-by: Peter Foley <pefoley@google.com>
> Reviewed-by: Titus Rwantare <titusr@google.com>
> Signed-off-by: Patrick Venture <venture@google.com>
> ---
> v2: Added to SRST options list, upgraded to full 64-bit value.
> ---
>  hw/smbios/smbios.c | 19 ++++++++++++++++---
>  qemu-options.hx    |  3 ++-
>  2 files changed, 18 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
> index 7397e56737..385b69b0c9 100644
> --- a/hw/smbios/smbios.c
> +++ b/hw/smbios/smbios.c
> @@ -104,9 +104,11 @@ static struct {
>      const char *sock_pfx, *manufacturer, *version, *serial, *asset, *part;
>      uint64_t max_speed;
>      uint64_t current_speed;
> +    uint64_t processor_id;
>  } type4 = {
>      .max_speed = DEFAULT_CPU_SPEED,
> -    .current_speed = DEFAULT_CPU_SPEED
> +    .current_speed = DEFAULT_CPU_SPEED,
> +    .processor_id = 0,
>  };
>  
>  static struct {
> @@ -327,6 +329,10 @@ static const QemuOptDesc qemu_smbios_type4_opts[] = {
>          .name = "part",
>          .type = QEMU_OPT_STRING,
>          .help = "part number",
> +    }, {
> +        .name = "processor-id",
> +        .type = QEMU_OPT_NUMBER,
> +        .help = "processor id",
>      },
>      { /* end of list */ }
>  };
> @@ -669,8 +675,13 @@ static void smbios_build_type_4_table(MachineState *ms, unsigned instance)
>      t->processor_type = 0x03; /* CPU */
>      t->processor_family = 0x01; /* Other */
>      SMBIOS_TABLE_SET_STR(4, processor_manufacturer_str, type4.manufacturer);
> -    t->processor_id[0] = cpu_to_le32(smbios_cpuid_version);
> -    t->processor_id[1] = cpu_to_le32(smbios_cpuid_features);
> +    if (type4.processor_id == 0) {
> +        t->processor_id[0] = cpu_to_le32(smbios_cpuid_version);
> +        t->processor_id[1] = cpu_to_le32(smbios_cpuid_features);
> +    } else {
> +        t->processor_id[0] = cpu_to_le32((uint32_t)type4.processor_id);
> +        t->processor_id[1] = cpu_to_le32(type4.processor_id >> 32);
> +    }
>      SMBIOS_TABLE_SET_STR(4, processor_version_str, type4.version);
>      t->voltage = 0;
>      t->external_clock = cpu_to_le16(0); /* Unknown */
> @@ -1292,6 +1303,8 @@ void smbios_entry_add(QemuOpts *opts, Error **errp)
>              save_opt(&type4.serial, opts, "serial");
>              save_opt(&type4.asset, opts, "asset");
>              save_opt(&type4.part, opts, "part");
> +            /* If the value is 0, it will take the value from the CPU model. */
> +            type4.processor_id = qemu_opt_get_number(opts, "processor-id", 0);
>              type4.max_speed = qemu_opt_get_number(opts, "max-speed",
>                                                    DEFAULT_CPU_SPEED);
>              type4.current_speed = qemu_opt_get_number(opts, "current-speed",
> diff --git a/qemu-options.hx b/qemu-options.hx
> index ec90505d84..6256417935 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -2527,6 +2527,7 @@ DEF("smbios", HAS_ARG, QEMU_OPTION_smbios,
>      "                specify SMBIOS type 3 fields\n"
>      "-smbios type=4[,sock_pfx=str][,manufacturer=str][,version=str][,serial=str]\n"
>      "              [,asset=str][,part=str][,max-speed=%d][,current-speed=%d]\n"
> +    "              [,processor-id=%d]\n"
>      "                specify SMBIOS type 4 fields\n"
>      "-smbios type=11[,value=str][,path=filename]\n"
>      "                specify SMBIOS type 11 fields\n"
> @@ -2552,7 +2553,7 @@ SRST
>  ``-smbios type=3[,manufacturer=str][,version=str][,serial=str][,asset=str][,sku=str]``
>      Specify SMBIOS type 3 fields
>  
> -``-smbios type=4[,sock_pfx=str][,manufacturer=str][,version=str][,serial=str][,asset=str][,part=str]``
> +``-smbios type=4[,sock_pfx=str][,manufacturer=str][,version=str][,serial=str][,asset=str][,part=str][,processor-id=%d]``
>      Specify SMBIOS type 4 fields
>  
>  ``-smbios type=11[,value=str][,path=filename]``


