Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 701F4401B0A
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 14:18:51 +0200 (CEST)
Received: from localhost ([::1]:46414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNDaM-0003Wa-7n
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 08:18:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mNDZ3-0002nr-Pr
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 08:17:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36892)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mNDZ1-00031L-Tc
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 08:17:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630930647;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xafqi4bEq3htBPGGbmDdZ/oEial+On+JdZvJO1dVGh0=;
 b=MC/Z0ZCJOmGnhxb63U+y/iZX/Et4Meb+/GvVPdKHHAQ8ibXLO3Tf7WvGLa5vkHPARAFkd6
 YcmmH9Bwd0Nu2n767/A3ME3oAPop9ylNYrIt+CQe3fEi5Cga9Feq3jafM6qkRLq4KPvOas
 ZxvncIunI51+xhobSsMo24XRf0eWASo=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-278-WrwLysgdMDyCkEn_Ke0-uA-1; Mon, 06 Sep 2021 08:17:26 -0400
X-MC-Unique: WrwLysgdMDyCkEn_Ke0-uA-1
Received: by mail-ed1-f71.google.com with SMTP id
 o11-20020a056402038b00b003c9e6fd522bso3463916edv.19
 for <qemu-devel@nongnu.org>; Mon, 06 Sep 2021 05:17:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Xafqi4bEq3htBPGGbmDdZ/oEial+On+JdZvJO1dVGh0=;
 b=fZh7IwS5uJiGW+VBZ+L2WWC2e35wxZwxvZs+FJ3xW8cMEFWbHMQ4hzN8CtihU5u9t2
 7/07aDlAR4OEuDCC0+KcoD4KJES3lGQfFeabQnIbWTG0+m+Rjvuf2SpTMDQ/KK8KZ6/N
 8LYmmTKQR5IVLHbbuVWPF0jUDBMc7s7vSfx+8px+y3eooFYqGi+sCo710APJwGWaUPs5
 TtbuaZwXIST9VQB/w8j1UUi5ElSxywHkKAHOpFAgE3DDMz+PaPXhfW8r9prrI9E+RGLt
 JlgR1IYFGI5LH+Clb9/eeNtVQxxNoTIPxii+aAr3eRsHwRX84kqQepTikYLiy8mF0Rdu
 7jKw==
X-Gm-Message-State: AOAM5300h0W2CbUDRl4hCtr91hDAWGp93z15PHoOjt+1lluERvqT/K3w
 AQr4bwgK7orFq5cT6PdskvqRYEwYAg/a1bST84gbMyMAcWBie/TgQWJxAeTC8EfNp2VjoIF/iub
 lF30qWnC5uXS5vgg=
X-Received: by 2002:a17:907:2677:: with SMTP id
 ci23mr13078617ejc.429.1630930644540; 
 Mon, 06 Sep 2021 05:17:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzmrfT0kEpLKgq5ODFkFmqK4ViOwM5qS6ld5anitEkPf7MmdU8dMnrOmomiJCCr4l0qHf2JPg==
X-Received: by 2002:a17:907:2677:: with SMTP id
 ci23mr13078600ejc.429.1630930644306; 
 Mon, 06 Sep 2021 05:17:24 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id d3sm3855593ejw.18.2021.09.06.05.17.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Sep 2021 05:17:23 -0700 (PDT)
Date: Mon, 6 Sep 2021 14:17:22 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eric Auger <eauger@redhat.com>
Subject: Re: [PATCH v2 01/35] acpi: add helper routines to initialize ACPI
 tables
Message-ID: <20210906141722.30bf80b7@redhat.com>
In-Reply-To: <5ae754db-2f14-d91d-4091-953c1cc83762@redhat.com>
References: <20210708154617.1538485-1-imammedo@redhat.com>
 <20210708154617.1538485-2-imammedo@redhat.com>
 <03839787-0664-afcb-28fb-e95830138815@redhat.com>
 <20210903091221.407cc17e@redhat.com>
 <5ae754db-2f14-d91d-4091-953c1cc83762@redhat.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 3 Sep 2021 09:22:10 +0200
Eric Auger <eauger@redhat.com> wrote:

> Hi Igor,
> 
> On 9/3/21 9:12 AM, Igor Mammedov wrote:
> > On Thu, 2 Sep 2021 14:56:00 +0200
> > Eric Auger <eauger@redhat.com> wrote:
> >   
> >> Hi Igor,
> >>
> >> On 7/8/21 5:45 PM, Igor Mammedov wrote:  
> >>> Patch introduces acpi_init_table()/acpi_table_composed() API
> >>> that hides pointer/offset arithmetic from user as opposed
> >>> to build_header(), to prevent errors caused by it [1].
> >>>
> >>>  acpi_init_table():
> >>>      initializes table header and keeps track of
> >>>      table data/offsets
> >>>  acpi_table_composed():
> >>>      sets actual table length and tells bios loader
> >>>      where table is for the later initialization on
> >>>      guest side.    
> >> might be worth to put those comments in the code as doc comments since
> >> "_composed" terminology is not self-explanatory?  
> > 
> > I'll add doc comments as suggested.
> > A better idea how to name function is welcome as well?  
> acpi_table_build_init()/_complete() or somethink like that giving an
> idea of what it does actually. But you would be obliged to revisit all
> the patches. I think it is good enough if you add the comment.

it's fine to rewrite before it's merged, one of the points
of refactoring is to make current code more clear and concise.

I'll use Michael's suggestion
   acpi_table_begin / acpi_table_end 

> > 
> >   
> >>> 1) commits
> >>>    bb9feea43179 x86: acpi: use offset instead of pointer when using build_header()
> >>>    4d027afeb3a9 Virt: ACPI: fix qemu assert due to re-assigned table data address
> >>>
> >>> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> >>> ---
> >>>  include/hw/acpi/aml-build.h | 14 +++++++++
> >>>  hw/acpi/aml-build.c         | 58 +++++++++++++++++++++++++++++++++++++
> >>>  2 files changed, 72 insertions(+)
> >>>
> >>> diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
> >>> index 471266d739..d590660bd2 100644
> >>> --- a/include/hw/acpi/aml-build.h
> >>> +++ b/include/hw/acpi/aml-build.h
> >>> @@ -413,6 +413,20 @@ Aml *aml_concatenate(Aml *source1, Aml *source2, Aml *target);
> >>>  Aml *aml_object_type(Aml *object);
> >>>  
> >>>  void build_append_int_noprefix(GArray *table, uint64_t value, int size);
> >>> +
> >>> +typedef struct AcpiTable {
> >>> +    const char *sig;
> >>> +    const uint8_t rev;
> >>> +    const char *oem_id;
> >>> +    const char *oem_table_id;
> >>> +    /* private vars tracking table state */
> >>> +    GArray *array;
> >>> +    unsigned table_offset;
> >>> +} AcpiTable;
> >>> +
> >>> +void acpi_init_table(AcpiTable *desc, GArray *array);
> >>> +void acpi_table_composed(BIOSLinker *linker, AcpiTable *table);
> >>> +
> >>>  void
> >>>  build_header(BIOSLinker *linker, GArray *table_data,
> >>>               AcpiTableHeader *h, const char *sig, int len, uint8_t rev,
> >>> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> >>> index d5103e6d7b..c598010144 100644
> >>> --- a/hw/acpi/aml-build.c
> >>> +++ b/hw/acpi/aml-build.c
> >>> @@ -52,6 +52,19 @@ static void build_append_byte(GArray *array, uint8_t val)
> >>>      g_array_append_val(array, val);
> >>>  }
> >>>  
> >>> +static void build_append_padded_str(GArray *array, const char *str,
> >>> +                                    size_t maxlen, char pad)
> >>> +{
> >>> +    size_t i;
> >>> +    size_t len = strlen(str);
> >>> +
> >>> +    g_assert(len <= maxlen);
> >>> +    g_array_append_vals(array, str, len);
> >>> +    for (i = maxlen - len; i > 0; i--) {
> >>> +        g_array_append_val(array, pad);
> >>> +    }
> >>> +}
> >>> +
> >>>  static void build_append_array(GArray *array, GArray *val)
> >>>  {
> >>>      g_array_append_vals(array, val->data, val->len);
> >>> @@ -1692,6 +1705,51 @@ Aml *aml_object_type(Aml *object)
> >>>      return var;
> >>>  }
> >>>  
> >>> +void acpi_init_table(AcpiTable *desc, GArray *array)
> >>> +{
> >>> +
> >>> +    desc->array = array;
> >>> +    desc->table_offset = array->len;
> >>> +
> >>> +    /*
> >>> +     * ACPI spec 1.0b
> >>> +     * 5.2.3 System Description Table Header
> >>> +     */
> >>> +    g_assert(strlen(desc->sig) == 4);
> >>> +    g_array_append_vals(array, desc->sig, 4); /* Signature */    
> >> build_append_padded_str?  
> > 
> > it will do the job even if it's a bit of overkill,
> > signature must be 4 characters long so there is nothing to pad here
> > (at least till this day).
> > Using padded variant may confuse reader in the future,
> > so I'd prefer to keep this line as is.  
> 
> sure it was just a nit
> > 
> >   
> >>> +    build_append_int_noprefix(array, 0, 4); /* Length */
> >>> +    build_append_int_noprefix(array, desc->rev, 1); /* Revision */
> >>> +    build_append_int_noprefix(array, 0, 1); /* Checksum */
> >>> +    build_append_padded_str(array, desc->oem_id, 6, ' '); /* OEMID */
> >>> +    /* OEM Table ID */
> >>> +    build_append_padded_str(array, desc->oem_table_id, 8, ' ');
> >>> +    build_append_int_noprefix(array, 1, 4); /* OEM Revision */
> >>> +    g_array_append_vals(array, ACPI_BUILD_APPNAME8, 4); /* Creator ID */  
> > 
> > here we potentially can reuse build_append_padded_str() if we
> > remove padding in ACPI_BUILD_APPNAME8, but that should wait till
> > refactoring is complete (to avoid breaking incremental refactoring)  
> 
> OK
> >   
> >>> +    build_append_int_noprefix(array, 1, 4); /* Creator Revision */
> >>> +}
> >>> +
> >>> +void acpi_table_composed(BIOSLinker *linker, AcpiTable *desc)
> >>> +{
> >>> +    /*
> >>> +     * ACPI spec 1.0b
> >>> +     * 5.2.3 System Description Table Header
> >>> +     * Table 5-2 DESCRIPTION_HEADER Fields
> >>> +     */
> >>> +    const unsigned checksum_offset = 9;
> >>> +    uint32_t table_len = desc->array->len - desc->table_offset;
> >>> +    uint32_t table_len_le = cpu_to_le32(table_len);
> >>> +    gchar *len_ptr = &desc->array->data[desc->table_offset + 4];
> >>> +
> >>> +    /* patch "Length" field that has been reserved by acpi_init_table()
> >>> +     * to the actual length, i.e. accumulated table length from
> >>> +     * acpi_init_table() till acpi_table_composed()
> >>> +     */
> >>> +    memcpy(len_ptr, &table_len_le, sizeof table_len_le);    
> >> can't you use a garray/build_append function instead to be homogeneous
> >> with the rest of the code?  
> > those are for inserting/adding _new_ values, and won't work here,
> > here we are patching value in place, comment above was supposed
> > to clarify that (I guess it wasn't sufficient),
> > Care to suggest a better comment?  
> 
> I thought  g_array_insert_vals() could do the job. No the comment was
> clear to me actually.      Maybe in acpi_init_table, along with Length
> comment you add a comment saying actual value will be set in composed().

sure, I'll add that.

> 
> Eric
> >   
> >>> +
> >>> +    bios_linker_loader_add_checksum(linker, ACPI_BUILD_TABLE_FILE,
> >>> +        desc->table_offset, table_len, desc->table_offset + checksum_offset);
> >>> +}
> >>> +
> >>>  void
> >>>  build_header(BIOSLinker *linker, GArray *table_data,
> >>>               AcpiTableHeader *h, const char *sig, int len, uint8_t rev,
> >>>     
> >>
> >> Thanks
> >>
> >> Eric
> >>  
> >   
> 


