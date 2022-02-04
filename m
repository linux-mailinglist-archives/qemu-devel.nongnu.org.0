Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7B134A9771
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 11:05:44 +0100 (CET)
Received: from localhost ([::1]:50422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFvTM-0006zD-2U
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 05:05:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nFuzB-0005UD-9N
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 04:34:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59337)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nFuz8-0001qd-3t
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 04:34:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643967269;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j0pVsJ3NWLWP2c9E0QXtvTcDSS2CuXgSNqILpsGLFGc=;
 b=BVG/pPVONV7uGiTW/5wMEVfJfXPdv12i7A8knEae0V7xHzT9m9Q4SkvAQ8yMnJE/dcQYl7
 uk4i6lXDOaPnIqOd7H3QYbs7dqlff0ru8C9p7NYld9izgxy0eS3BStduK4OdoEIIdbat+4
 MIctvm49OHG2kNsoRMqrqvfKMXsM5Q4=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-546-ZLKGosG7OZGPxmS4d9vQLQ-1; Fri, 04 Feb 2022 04:34:27 -0500
X-MC-Unique: ZLKGosG7OZGPxmS4d9vQLQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 j1-20020aa7c341000000b0040417b84efeso2963889edr.21
 for <qemu-devel@nongnu.org>; Fri, 04 Feb 2022 01:34:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=j0pVsJ3NWLWP2c9E0QXtvTcDSS2CuXgSNqILpsGLFGc=;
 b=cuWauraSlcZazqU7HHq5gSY049P/OnvpAulQopjMH4KIwmKwq7RqWlPuN/36jrsY84
 rdAmZpNHb6e40L5oqTMRS196HWQoqzSqupwsNZr24FBd02bkSZrO1Xn+1IIBx1wa0XvY
 P8xROU7Kk6xslB7uP7IG/5lOYcX8nTJyWsQ3CTgzEb5Zxh6OueAklpCLkqLQU0B9KdhP
 9l/BvBrCrA9ythxnWL7jmjlsMLiWwuNKlHFbCK4BqOkzaa2B6iK0gHy2poGny+XKOfHO
 uhLzJ7l9eAYnqHtIOY6eUTvZSCBve2T123HJRxryVnqoSXBpHY0VSRP/ZO1gfXcz4doj
 TLXA==
X-Gm-Message-State: AOAM530B33JgvKXKrFQYZmY/6aYc/C1yLojAZdUmZ1U5TxbesVOSt7k+
 2sQfuXflS9QY1/e9F78MTRuQvHNZxKIEn0Hy/PVXN/tCwZiPP43ODvTyhPk5lzAf7PkrYQQSOrg
 flZTyV+wMUx4SCUU=
X-Received: by 2002:a17:907:7292:: with SMTP id
 dt18mr1735336ejc.589.1643967266533; 
 Fri, 04 Feb 2022 01:34:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzn4C1NbCH7Z7NVCr6QVVEbCsFOb/HEsJTLJxyqgirqs6jLZeAvmNk+5i80Ksgy0PSsajMzXQ==
X-Received: by 2002:a17:907:7292:: with SMTP id
 dt18mr1735314ejc.589.1643967266186; 
 Fri, 04 Feb 2022 01:34:26 -0800 (PST)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id by22sm469741ejb.5.2022.02.04.01.34.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 01:34:25 -0800 (PST)
Date: Fri, 4 Feb 2022 10:34:23 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Subject: Re: [PATCH v2] hw/smbios: fix memory corruption for large guests
 due to handle overlap
Message-ID: <20220204103423.71ec5c6b@redhat.com>
In-Reply-To: <20220203130957.2248949-1-ani@anisinha.ca>
References: <20220203130957.2248949-1-ani@anisinha.ca>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.092,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: gsomlo@gmail.com, kraxel@redhat.com, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu,  3 Feb 2022 18:39:57 +0530
Ani Sinha <ani@anisinha.ca> wrote:

subj talks about memory corruption but the commit message
doesn't explain how memory is corrupted, so either subj or
commit message is wrong.


> The current implementation of smbios table handle assignment does not leave
> enough gap between tables 17 and table 19 for guests with larger than 8 TB of
> memory. This change fixes this issue. This change calculates if additional
> space between the tables need to be set aside and then reserves that additional
> space.

please redo commit message in form,

 1. what's broken
 2. symptoms + way to reproduce
 3. how this patch fixes the issue


> Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=2023977
> 
> Signed-off-by: Ani Sinha <ani@anisinha.ca>
> ---
>  hw/smbios/smbios.c | 29 +++++++++++++++++++++++------
>  1 file changed, 23 insertions(+), 6 deletions(-)
> 
> changelog:
> v2: make sure we do not overlap table 19 and table 32 addresses.


that made me thinking about why do we have to hard partitions
handle ranges in the first place and live with a risk to hit
similar bug in the future.

It would be if we were starting at some base for the first table
and then just increment it for every following table.

But we have to leave current handles layout as is, to avoid
braking migration, since SMBIOS tables aren't migrated
over wire, so src and dst have to build exact copies.

So question is it is worth to have legacy SMBIOS code and
introduce a new handle layout + memory_region re-sizable SMBIOS
tables like we did with ACPI ones.

That way we we will be free to change SMBIOS tables
at will without a risk of breaking migration and without
need to add compat knob for every change to keep src and
dst binary compatible.

But that's a bigger refactoring for just a fix,
so I'd go ahead with fixing handles first
and than do refactoring on top.
 
PS:
For this fix tables blob is surely binary not compatible
when we are hitting handles overlap.
But I'm inclined to not adding compat knob with justification
that current code produces invalid tables (with duplicate handles)
and we shouldn't maintain bug (have compat knob) for this.
The risk we would be taking here would be the same (invalid handles)
if src migrated in the middle of reading tables and that is
limited only to old (<=2.4) machines without DMA enabled fwcfg.


> diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
> index 6013df1698..ccac4c1b3a 100644
> --- a/hw/smbios/smbios.c
> +++ b/hw/smbios/smbios.c
> @@ -743,13 +743,16 @@ static void smbios_build_type_16_table(unsigned dimm_cnt)
>  
>  #define MAX_T17_STD_SZ 0x7FFF /* (32G - 1M), in Megabytes */
>  #define MAX_T17_EXT_SZ 0x80000000 /* 2P, in Megabytes */
> +#define T17_BASE 0x1100
> +#define T19_BASE 0x1300
> +#define T32_BASE 0x2000

open coded numbers cleanup should be a separate patch
as it's not related to the actual fix.

>  static void smbios_build_type_17_table(unsigned instance, uint64_t size)
>  {
>      char loc_str[128];
>      uint64_t size_mb;
>  
> -    SMBIOS_BUILD_TABLE_PRE(17, 0x1100 + instance, true); /* required */
> +    SMBIOS_BUILD_TABLE_PRE(17, T17_BASE + instance, true); /* required */
>  
>      t->physical_memory_array_handle = cpu_to_le16(0x1000); /* Type 16 above */
>      t->memory_error_information_handle = cpu_to_le16(0xFFFE); /* Not provided */
> @@ -785,12 +788,13 @@ static void smbios_build_type_17_table(unsigned instance, uint64_t size)
>      SMBIOS_BUILD_TABLE_POST;
>  }
>  
> -static void smbios_build_type_19_table(unsigned instance,
> +static void smbios_build_type_19_table(unsigned instance, unsigned offset,
>                                         uint64_t start, uint64_t size)
>  {
>      uint64_t end, start_kb, end_kb;
>  
> -    SMBIOS_BUILD_TABLE_PRE(19, 0x1300 + instance, true); /* required */
> +    SMBIOS_BUILD_TABLE_PRE(19, T19_BASE + \
> +                           offset + instance, true); /* required */
>  
>      end = start + size - 1;
>      assert(end > start);
> @@ -814,7 +818,7 @@ static void smbios_build_type_19_table(unsigned instance,
>  
>  static void smbios_build_type_32_table(void)
>  {
> -    SMBIOS_BUILD_TABLE_PRE(32, 0x2000, true); /* required */
> +    SMBIOS_BUILD_TABLE_PRE(32, T32_BASE, true); /* required */
>  
>      memset(t->reserved, 0, 6);
>      t->boot_status = 0; /* No errors detected */
> @@ -982,7 +986,7 @@ void smbios_get_tables(MachineState *ms,
>                         uint8_t **anchor, size_t *anchor_len,
>                         Error **errp)
>  {
> -    unsigned i, dimm_cnt;
> +    unsigned i, dimm_cnt, offset;
>  
>      if (smbios_legacy) {
>          *tables = *anchor = NULL;
> @@ -1012,6 +1016,19 @@ void smbios_get_tables(MachineState *ms,
>  
>          dimm_cnt = QEMU_ALIGN_UP(current_machine->ram_size, MAX_DIMM_SZ) / MAX_DIMM_SZ;

Michael, Gerd,

Another question is why we split memory on 16Gb chunks, to begin with.
Maybe instead of doing so, we should just add 1 type17 entry describing
whole system RAM size. In which case we don't need this dance around
handle offsets anymore.

>  
> +        /*
> +         * The offset determines if we need to keep additional space betweeen
> +         * table 17 and table 19 so that they do not overlap. For example,
> +         * for a VM with larger than 8 TB guest memory and DIMM size of 16 GiB,
> +         * the default space between the two tables (T19_BASE - T17_BASE = 512)
> +         * is not enough.
> +         */
> +        offset = (dimm_cnt > (T19_BASE - T17_BASE)) ? \
> +                 dimm_cnt - (T19_BASE - T17_BASE) : 0;
> +
> +        /* we need to make sure table 19 and table 32 do not overlap */
> +        assert((mem_array_size + offset) < (T32_BASE - T19_BASE));

why its' before type 16? I'd suggest to split/move it close to relevant
types.
Also T32_BASE - T19_BASE part doesn't belong to this patch and should be
a separate one with explanation why it's needed.

>          smbios_build_type_16_table(dimm_cnt);
>  
>          for (i = 0; i < dimm_cnt; i++) {
> @@ -1019,7 +1036,7 @@ void smbios_get_tables(MachineState *ms,
>          }
>  
>          for (i = 0; i < mem_array_size; i++) {
> -            smbios_build_type_19_table(i, mem_array[i].address,
> +            smbios_build_type_19_table(i, offset, mem_array[i].address,
>                                         mem_array[i].length);
>          }
 


