Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F75414C42
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 16:40:28 +0200 (CEST)
Received: from localhost ([::1]:48982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT3QB-0006Fu-As
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 10:40:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mT3O8-00056P-S5
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 10:38:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44878)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mT3O7-0005Vz-6u
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 10:38:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632321498;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WhJnbtR3qz7IstY9OeOP0h858EOjooS0Y9ECyPberKY=;
 b=K7Co+++PnDlMVIx2cAMfJJKgF34Zu4T58ND4jcR268Zu6ZQExXFEE3Oa94hJI6VcATOtb6
 S3IVytF8JEC/mSzwE4lU7e4i+ZT8OnVodF93XQutycTZjdM6fypEzHruAZM2a8vAbmu9m+
 vbNCUBqhzFk/TFu0YWabPhKuCfvEoMM=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-484-vg6QIgI1NZe72zGQtFDETw-1; Wed, 22 Sep 2021 10:38:09 -0400
X-MC-Unique: vg6QIgI1NZe72zGQtFDETw-1
Received: by mail-ed1-f69.google.com with SMTP id
 ec14-20020a0564020d4e00b003cf5630c190so3368784edb.3
 for <qemu-devel@nongnu.org>; Wed, 22 Sep 2021 07:38:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WhJnbtR3qz7IstY9OeOP0h858EOjooS0Y9ECyPberKY=;
 b=zNuv21RQusFAggaQp0hNZFcVQEx8nXcw6cKRdYSh1uDqy+ZqXJWDsXT3sxHssXZ5ya
 8rOgBr25yEogTKPf0f+JEJ2y2qKPa9wQP/lUHt1JblKp52cx1bwMbBxWmwznUskfeKuc
 475zy7zf5xs+zkb7z+33iIlUBo6Ys2CkfZ0mGMN21qqjNRGDFHD0UhiIXDa37Tvr/Ihm
 YaukusEs9w4hYANx0W20ZBNsjOSG4sPS32lp/OcWjcSLI3wqigGe9TEI3jvYBmvqR5ef
 hChQrbCmjK2uWpLDBaot9rhfVBVoOS1H9NI3E7P0ts7/2KBhXCTKNhcCcOj10xcfRlyC
 hC2A==
X-Gm-Message-State: AOAM531VJq1rc9OUE1fBmLyv1WNeab5sCqGW4NwJSQqp7GsNwIh9jKht
 bBxGLmEZPbvbMPkE/aZxaGBd08wStDbXyybyNyW6kH0Xk0PkYGMj/1UgW8P+UesYcPRijvuS4z4
 d9pV/6XzfUQCDOSE=
X-Received: by 2002:a17:906:1299:: with SMTP id
 k25mr41517845ejb.139.1632321488281; 
 Wed, 22 Sep 2021 07:38:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw65c0zSNYyDiScszy254DAiGdsILcD1UpRItxuWRu/Wlvb1XnNzvXfKUbfYT0vqbEJTBqIgw==
X-Received: by 2002:a17:906:1299:: with SMTP id
 k25mr41517820ejb.139.1632321488032; 
 Wed, 22 Sep 2021 07:38:08 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id f19sm1291021edv.91.2021.09.22.07.38.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Sep 2021 07:38:07 -0700 (PDT)
Date: Wed, 22 Sep 2021 16:38:06 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eric Auger <eauger@redhat.com>
Subject: Re: [PATCH v3 11/35] acpi: nvdimm_build_ssdt: use
 acpi_table_begin()/acpi_table_end() instead of build_header()
Message-ID: <20210922163806.70ff365c@redhat.com>
In-Reply-To: <9ae86080-3833-9620-5132-ad04b77ef14f@redhat.com>
References: <20210907144814.741785-1-imammedo@redhat.com>
 <20210907144814.741785-12-imammedo@redhat.com>
 <9ae86080-3833-9620-5132-ad04b77ef14f@redhat.com>
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
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
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
Cc: mst@redhat.com, qemu-devel@nongnu.org, xiaoguangrong.eric@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 20 Sep 2021 18:41:30 +0200
Eric Auger <eauger@redhat.com> wrote:

> Hi Igor,
> 
> On 9/7/21 4:47 PM, Igor Mammedov wrote:
> > it replaces error-prone pointer arithmetic for build_header() API,
> > with 2 calls to start and finish table creation,
> > which hides offsets magic from API user.
> > 
> > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> > ---
> > v3:
> >   * s/acpi_init_table|acpi_table_composed/acpi_table_begin|acpi_table_end/
> > 
> > CC: xiaoguangrong.eric@gmail.com
> > ---
> >  hw/acpi/nvdimm.c | 18 ++++++++++--------
> >  1 file changed, 10 insertions(+), 8 deletions(-)
> > 
> > diff --git a/hw/acpi/nvdimm.c b/hw/acpi/nvdimm.c
> > index 15f6ca82ca..e050b47c2b 100644
> > --- a/hw/acpi/nvdimm.c
> > +++ b/hw/acpi/nvdimm.c
> > @@ -1274,14 +1274,15 @@ static void nvdimm_build_ssdt(GArray *table_offsets, GArray *table_data,
> >                                NVDIMMState *nvdimm_state,
> >                                uint32_t ram_slots, const char *oem_id)
> >  {
> > +    int mem_addr_offset;
> >      Aml *ssdt, *sb_scope, *dev;
> > -    int mem_addr_offset, nvdimm_ssdt;
> > +    AcpiTable table = { .sig = "SSDT", .rev = 1,
> > +                        .oem_id = oem_id, .oem_table_id = "NVDIMM" };
> >  
> >      acpi_add_table(table_offsets, table_data);
> >  
> > +    acpi_table_begin(&table, table_data);
> >      ssdt = init_aml_allocator();
> > -    acpi_data_push(ssdt->buf, sizeof(AcpiTableHeader));
> > -
> >      sb_scope = aml_scope("\\_SB");
> >  
> >      dev = aml_device("NVDR");
> > @@ -1310,8 +1311,6 @@ static void nvdimm_build_ssdt(GArray *table_offsets, GArray *table_data,
> >      aml_append(sb_scope, dev);
> >      aml_append(ssdt, sb_scope);
> >  
> > -    nvdimm_ssdt = table_data->len;
> > -
> >      /* copy AML table into ACPI tables blob and patch header there */
> >      g_array_append_vals(table_data, ssdt->buf->data, ssdt->buf->len);
> >      mem_addr_offset = build_append_named_dword(table_data,
> > @@ -1323,10 +1322,13 @@ static void nvdimm_build_ssdt(GArray *table_offsets, GArray *table_data,
> >      bios_linker_loader_add_pointer(linker,
> >          ACPI_BUILD_TABLE_FILE, mem_addr_offset, sizeof(uint32_t),
> >          NVDIMM_DSM_MEM_FILE, 0);
> > -    build_header(linker, table_data,
> > -        (void *)(table_data->data + nvdimm_ssdt),
> > -                 "SSDT", table_data->len - nvdimm_ssdt, 1, oem_id, "NVDIMM");
> >      free_aml_allocator();
> > +    /*
> > +     * must be executed as the last so that pointer patching command above
> > +     * would be executed by guest before it recalculates checksum which were
> > +     * scheduled by acpi_table_composed()  
> s/acpi_table_composed/acpi_table_end.
fixed it up:

    /*                                                                           
     * must be executed as the last so that pointer patching command above       
     * would be executed by guest before it recalculated checksum which were     
     * scheduled by acpi_table_end()                                             
     */ 
 
> also the sentence may need some rewording.
> 
> Wonder if that kind of comment still is useful. Maybe this should be put
> once in the doc comment of acpi_table_end() in [PATCH v3 01/35] acpi:
> add helper routines to initialize ACPI tables, for future users to pay
> attention that it shall be called at the very end.

I'll keep comment for now, and add patch to add something similar to
acpi_table_end() later or drop it if I come up with a way to actually
enforce expected linker order.

 
> Besides
> 
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
> 
> Eric
> 
> 
> > +     */
> > +    acpi_table_end(linker, &table);
> >  }
> >  
> >  void nvdimm_build_srat(GArray *table_data)
> >   
> 


