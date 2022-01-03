Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E5E0482EB4
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Jan 2022 08:22:53 +0100 (CET)
Received: from localhost ([::1]:59938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4HgB-0000Vh-JY
	for lists+qemu-devel@lfdr.de; Mon, 03 Jan 2022 02:22:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1n4HYu-0006LC-Ao
 for qemu-devel@nongnu.org; Mon, 03 Jan 2022 02:15:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53313)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1n4HYq-0005jK-Fu
 for qemu-devel@nongnu.org; Mon, 03 Jan 2022 02:15:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641194113;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8nC9z+6T0i+tCYkqJ/oedQP1aR2rRESfpkMLcgMi8ek=;
 b=CnONRmS8ty/548piKuO/P4hO9BApbAdTL2Fi4shyJgb6ryEWTF13XAMlbFNBdeUy9JdSf2
 K7vUkrgXnEveJBMiKLlGuB7WB5LFThuP+W0BtDr+kxvVoFSZjCJekAeU2HxJQb0yV7R8Kc
 5HThtcGK6XFqtE1hgElUMm/dnwQisqI=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-534-Wi3Iytl9Ndmp_xbYWelB2A-1; Mon, 03 Jan 2022 02:15:12 -0500
X-MC-Unique: Wi3Iytl9Ndmp_xbYWelB2A-1
Received: by mail-ed1-f69.google.com with SMTP id
 z8-20020a056402274800b003f8580bfb99so22301017edd.11
 for <qemu-devel@nongnu.org>; Sun, 02 Jan 2022 23:15:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8nC9z+6T0i+tCYkqJ/oedQP1aR2rRESfpkMLcgMi8ek=;
 b=sET/zlE31wFYpwNrRKw7UiBl8bW6rHxD/0zyZDZJya1Yhm6YdNV71VUyVHdsVlFQTv
 AHNZAk+apxGCJPWs2frWcI6XTTFRU+tnYHJPfOjVxLr1eWIFO0w+urHyuc52Z2o746dl
 tpBJ1TiVbPCueqH7Q6n5optsKTYcyRwdmyrOw04ZGb8X5I5aO4xxmAWQPkRvetkMMSdN
 UEwy0yyrc1biX1XC0QPEpUAWsdGpz2m6lJtw/OfmQfowa54FfBxSylrqQ0AsFkdZXpNV
 Chxho+vfk1DdZpqFTYguUlohxY73ac4iVNHR/6/0rE16NzLg2w8h53d4U21YHHrV+hHA
 jChQ==
X-Gm-Message-State: AOAM531FeRuZq8jZ0Mo6sYPJ3bneGMon+mG7jt9xw6byBmkHxjZeRaan
 /7mRjg/yTXzWlfZkCOWLEWVsbOyJ1o8Fg5fGiuwmTe6veOEZXqrdrvmQYzfVQFKi61r2is6VOxX
 5HW/fEiSBhzOEBJD6AtdFqk2mdCh2heJBqU5qTU0+xP6Roa79NgfwcDYbYdtFAuHMTdU=
X-Received: by 2002:a17:907:72c6:: with SMTP id
 du6mr31215206ejc.552.1641194111171; 
 Sun, 02 Jan 2022 23:15:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwqgInwhis85UWqz/hU4mctdfr87J90Qg+kRLZpQqMkpQYJzQK/heZa0lzLfpLvXXFYjtMh0g==
X-Received: by 2002:a17:907:72c6:: with SMTP id
 du6mr31215190ejc.552.1641194110771; 
 Sun, 02 Jan 2022 23:15:10 -0800 (PST)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id j17sm5700117ejg.164.2022.01.02.23.15.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Jan 2022 23:15:10 -0800 (PST)
Date: Mon, 3 Jan 2022 08:15:09 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH 1/4] acpi: fix QEMU crash when started with SLIC table
Message-ID: <20220103081509.6904b942@redhat.com>
In-Reply-To: <20211227193120.1084176-2-imammedo@redhat.com>
References: <20211227193120.1084176-1-imammedo@redhat.com>
 <20211227193120.1084176-2-imammedo@redhat.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.37, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-stable@nongnu.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

CCing, qemu-stable@

On Mon, 27 Dec 2021 14:31:17 -0500
Igor Mammedov <imammedo@redhat.com> wrote:

> if QEMU is started with used provided SLIC table blob,
> 
>   -acpitable sig=SLIC,oem_id='CRASH ',oem_table_id="ME",oem_rev=00002210,asl_compiler_id="",asl_compiler_rev=00000000,data=/dev/null
> it will assert with:
> 
>   hw/acpi/aml-build.c:61:build_append_padded_str: assertion failed: (len <= maxlen)
> 
> and following backtrace:
> 
>   ...
>   build_append_padded_str (array=0x555556afe320, str=0x555556afdb2e "CRASH ME", maxlen=0x6, pad=0x20) at hw/acpi/aml-build.c:61
>   acpi_table_begin (desc=0x7fffffffd1b0, array=0x555556afe320) at hw/acpi/aml-build.c:1727
>   build_fadt (tbl=0x555556afe320, linker=0x555557ca3830, f=0x7fffffffd318, oem_id=0x555556afdb2e "CRASH ME", oem_table_id=0x555556afdb34 "ME") at hw/acpi/aml-build.c:2064
>   ...
> 
> which happens due to acpi_table_begin() expecting NULL terminated
> oem_id and oem_table_id strings, which is normally the case, but
> in case of user provided SLIC table, oem_id points to table's blob
> directly and as result oem_id became longer than expected.
> 
> Fix issue by handling oem_id consistently and make acpi_get_slic_oem()
> return NULL terminated strings.
> 
> PS:
> After [1] refactoring, oem_id semantics became inconsistent, where
> NULL terminated string was coming from machine and old way pointer
> into byte array coming from -acpitable option. That used to work
> since build_header() wasn't expecting NULL terminated string and
> blindly copied the 1st 6 bytes only.
> 
> However commit [2] broke that by replacing build_header() with
> acpi_table_begin(), which was expecting NULL terminated string
> and was checking oem_id size.
> 
> 1) 602b45820 ("acpi: Permit OEM ID and OEM table ID fields to be changed")
> 2)
> Fixes: 4b56e1e4eb08 ("acpi: build_fadt: use acpi_table_begin()/acpi_table_end() instead of build_header()")
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/786
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> ---
>  hw/acpi/core.c       | 4 ++--
>  hw/i386/acpi-build.c | 2 ++
>  2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/acpi/core.c b/hw/acpi/core.c
> index 1e004d0078..3e811bf03c 100644
> --- a/hw/acpi/core.c
> +++ b/hw/acpi/core.c
> @@ -345,8 +345,8 @@ int acpi_get_slic_oem(AcpiSlicOem *oem)
>          struct acpi_table_header *hdr = (void *)(u - sizeof(hdr->_length));
>  
>          if (memcmp(hdr->sig, "SLIC", 4) == 0) {
> -            oem->id = hdr->oem_id;
> -            oem->table_id = hdr->oem_table_id;
> +            oem->id = g_strndup(hdr->oem_id, 6);
> +            oem->table_id = g_strndup(hdr->oem_table_id, 8);
>              return 0;
>          }
>      }
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index 8383b83ee3..0234fe7588 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -2723,6 +2723,8 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
>  
>      /* Cleanup memory that's no longer used. */
>      g_array_free(table_offsets, true);
> +    g_free(slic_oem.id);
> +    g_free(slic_oem.table_id);
>  }
>  
>  static void acpi_ram_update(MemoryRegion *mr, GArray *data)


