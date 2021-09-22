Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C7A414C66
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 16:48:55 +0200 (CEST)
Received: from localhost ([::1]:56190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT3YM-0003tf-0P
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 10:48:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mT3Wy-0002bI-6t
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 10:47:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39157)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mT3WZ-0004sh-Dj
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 10:47:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632322022;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/mBOx389Hl4hjnDGmf0oJ2TTiSMWSCOhj0meYYpoSw0=;
 b=IW3b3FwhwR16j1Fzd1yQKxIENxtwpwdCmt3ISGHph73d66ggG5AqF8J4XhtSuUfhhlkiU4
 0fTGktwZz6aYp4iPezUmAMHhw8R5R4u9KHdDCmRpwWqM85GEIA3Fvt4TeV6vn/wbDf2i+r
 Zk2DvAWguo3R1RCL1z4kVSpJ1gQqCzM=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-75-E0LuHp34M-mHJ37PHrd3Gg-1; Wed, 22 Sep 2021 10:47:00 -0400
X-MC-Unique: E0LuHp34M-mHJ37PHrd3Gg-1
Received: by mail-ed1-f72.google.com with SMTP id
 d1-20020a50f681000000b003d860fcf4ffso3275436edn.22
 for <qemu-devel@nongnu.org>; Wed, 22 Sep 2021 07:47:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/mBOx389Hl4hjnDGmf0oJ2TTiSMWSCOhj0meYYpoSw0=;
 b=8LW8B3S9D0IoWJN82+l3wzjUjsZvSf1m8CUC5SwnmAGHzpE2D3Y7kCil72pqzPywZk
 yt4K4vm4co/+MInB+W8I2KSEJaPLHi8rN9nlUJa3d1MH/l0xwEkJ61pjDmmHSLwi7fbg
 Pa+Fbu1BPl46n/RJ+r2tZ85JcpmB6uPzUORTsVP+tpJBC0GlXEURaDmAiD31olNmCZwb
 0axX74N5P7MOmmPVMQHGsqRepRyDWI0xgxHsiWGU1ci9Bc4ZpfIzz82KN66YBBuCK7L7
 6DY6+m8pcf9TWICXJa+6OSyICbt7kvgzmre8zZIKMc24/CQYZ6WjDhaIjmSZHP49xqer
 10Eg==
X-Gm-Message-State: AOAM531beLZsdveC844N13FjuNvlDW+1L+6nWY5EUfkNXdNCbLqT1nh3
 pCoFi0swT0oXRpPpCE5dyZmtxq4vUAW20SlzQ5uENoynMMS9oQ78VDBEja5s/Ce7xK1+0eHpTi6
 9vpylh2/MpadIPXY=
X-Received: by 2002:a17:906:d541:: with SMTP id
 cr1mr43389185ejc.81.1632322019092; 
 Wed, 22 Sep 2021 07:46:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzIiWvtw2JQju6w8Sk98xCJa5YP/8donjrygB+wf9VzwAWOalK93ZiHDlmY98UGW8pmpMjk/w==
X-Received: by 2002:a17:906:d541:: with SMTP id
 cr1mr43389162ejc.81.1632322018778; 
 Wed, 22 Sep 2021 07:46:58 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id g10sm1177134ejj.44.2021.09.22.07.46.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Sep 2021 07:46:58 -0700 (PDT)
Date: Wed, 22 Sep 2021 16:46:57 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eric Auger <eauger@redhat.com>
Subject: Re: [PATCH v3 12/35] acpi: vmgenid_build_acpi: use
 acpi_table_begin()/acpi_table_end() instead of build_header()
Message-ID: <20210922164657.0ea21a7a@redhat.com>
In-Reply-To: <5938a956-e67f-be8d-2a31-e9e068597afb@redhat.com>
References: <20210907144814.741785-1-imammedo@redhat.com>
 <20210907144814.741785-13-imammedo@redhat.com>
 <5938a956-e67f-be8d-2a31-e9e068597afb@redhat.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
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
Cc: qemu-devel@nongnu.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 22 Sep 2021 09:23:16 +0200
Eric Auger <eauger@redhat.com> wrote:

> On 9/7/21 4:47 PM, Igor Mammedov wrote:
> > it replaces error-prone pointer arithmetic for build_header() API,
> > with 2 calls to start and finish table creation,
> > which hides offsets magic from API user.
> > 
> > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> > ---
> > v3:
> >   * s/acpi_init_table|acpi_table_composed/acpi_table_begin|acpi_table_end/
> > ---
> >  hw/acpi/vmgenid.c | 16 +++++++---------
> >  1 file changed, 7 insertions(+), 9 deletions(-)
> > 
> > diff --git a/hw/acpi/vmgenid.c b/hw/acpi/vmgenid.c
> > index 4f41a13ea0..95f94a2510 100644
> > --- a/hw/acpi/vmgenid.c
> > +++ b/hw/acpi/vmgenid.c
> > @@ -29,6 +29,8 @@ void vmgenid_build_acpi(VmGenIdState *vms, GArray *table_data, GArray *guid,
> >      Aml *ssdt, *dev, *scope, *method, *addr, *if_ctx;
> >      uint32_t vgia_offset;
> >      QemuUUID guid_le;
> > +    AcpiTable table = { .sig = "SSDT", .rev = 1,
> > +                        .oem_id = oem_id, .oem_table_id = "VMGENID" };
> >  
> >      /* Fill in the GUID values.  These need to be converted to little-endian
> >       * first, since that's what the guest expects
> > @@ -42,15 +44,12 @@ void vmgenid_build_acpi(VmGenIdState *vms, GArray *table_data, GArray *guid,
> >      g_array_insert_vals(guid, VMGENID_GUID_OFFSET, guid_le.data,
> >                          ARRAY_SIZE(guid_le.data));
> >  
> > -    /* Put this in a separate SSDT table */
> > +    /* Put VMGNEID into a separate SSDT table */
> > +    acpi_table_begin(&table, table_data);
> >      ssdt = init_aml_allocator();
> >  
> > -    /* Reserve space for header */
> > -    acpi_data_push(ssdt->buf, sizeof(AcpiTableHeader));
> > -
> >      /* Storage for the GUID address */
> > -    vgia_offset = table_data->len +
> > -        build_append_named_dword(ssdt->buf, "VGIA");
> > +    vgia_offset = table_data->len + build_append_named_dword(ssdt->buf, "VGIA");  
> not mandated but well

dropped

> 
> >      scope = aml_scope("\\_SB");
> >      dev = aml_device("VGEN");
> >      aml_append(dev, aml_name_decl("_HID", aml_string("QEMUVGID")));
> > @@ -116,9 +115,8 @@ void vmgenid_build_acpi(VmGenIdState *vms, GArray *table_data, GArray *guid,
> >          ACPI_BUILD_TABLE_FILE, vgia_offset, sizeof(uint32_t),
> >          VMGENID_GUID_FW_CFG_FILE, 0);
> >  
> > -    build_header(linker, table_data,
> > -        (void *)(table_data->data + table_data->len - ssdt->buf->len),
> > -        "SSDT", ssdt->buf->len, 1, oem_id, "VMGENID");
> > +    /* must be called after above command to ensure correct table checksum */  
> ditto
I'd prefer to keep this reminder until there is a way to
enforce valid order.

> > +    acpi_table_end(linker, &table);
> >      free_aml_allocator();
> >  }
> >  
> >   
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
> 
> Eric
> 


