Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5702C484483
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 16:27:48 +0100 (CET)
Received: from localhost ([::1]:40168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4lj1-00051k-7B
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 10:27:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1n4lXD-0006uD-Oy
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 10:15:35 -0500
Received: from [2607:f8b0:4864:20::62d] (port=44793
 helo=mail-pl1-x62d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1n4lXB-00027l-UD
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 10:15:35 -0500
Received: by mail-pl1-x62d.google.com with SMTP id h1so24082391pls.11
 for <qemu-devel@nongnu.org>; Tue, 04 Jan 2022 07:15:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=zcUFUa/RtDuy2i7gm6X+J6VhFThhKYo+09+fRZfPAs8=;
 b=BDpkGy+rSda+83Dt/MWxvcsuk+F4mPusvGNTTDU8jctgAOPnet35yu6+xk8fvr0ZXm
 KfJWllMkRMipnOMzgpr8+Dd18RNYPBw7KDfsYJ4aoiSQ0OsYmMTnelgepenvs7ysC8we
 HKf3vr1DxH2HXhpkWZissx8TcMuygEepF2QhSrZxWktHxAnxV980OClKn6lMAHkl+/FI
 aapd1MBPAoURlFtQRiQxEdPZWJZM7P36B295OfT3ho2aRCnHwZoo9jydjqb3RJQaynDs
 +Sft4PlmE/Js1Vcy6vjyrRb4Xvqw/AFA5Y5rQodXl13ejqsylTQtF7SOZS3PqJCRIptt
 f3Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=zcUFUa/RtDuy2i7gm6X+J6VhFThhKYo+09+fRZfPAs8=;
 b=NOo8VQtnQWP+Oz2uBpwiE3uUB/+vTgl2AmRYnikvSM1r1gEf6lZOHVk7fMqzmh8VD3
 005n7dbyVEN/Bwh7KmiKymk3tGIoTSlvZCnvv8xd00WLZ3bBl7rI+PrVaWaZ4eLoG+Rx
 UyKk4MK3+wByAQGNXnqrfJgZwvfU1lAUt91JymkdWvxHUIM0l6CimUtY7gp5NYvSc2OT
 CWj4V9s5RvqFNUQPee5ee/PcHPiNMerTD1r+R19FnsHsEgF5l564x54IwQAawteJBCLL
 i1tL8kAELZ/DQRqgcgU92JfPekYkHq5NEqWZ4nFoE2jRZvbmED3abyWEWK4aU9nnok6N
 pKCg==
X-Gm-Message-State: AOAM532SUlSbtBVGtx++dZKys/wJGo/OVFqUiOIa+3Bk6bORSQjokGA0
 /gaA4gxzdEd5iHaZUDr3nPP6iw==
X-Google-Smtp-Source: ABdhPJyI1gm4s9+YYnDO81salF2yH9seKf3xbFeceqoa0/TPPNRZsDlvjUmDDEwL1fHKecjIT+LhEQ==
X-Received: by 2002:a17:902:e884:b0:148:b91b:d7e2 with SMTP id
 w4-20020a170902e88400b00148b91bd7e2mr48866704plg.87.1641309331184; 
 Tue, 04 Jan 2022 07:15:31 -0800 (PST)
Received: from [10.25.18.11] ([138.199.24.26])
 by smtp.googlemail.com with ESMTPSA id
 nk23sm41516145pjb.16.2022.01.04.07.15.28
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 04 Jan 2022 07:15:30 -0800 (PST)
Date: Tue, 4 Jan 2022 20:45:24 +0530 (IST)
From: Ani Sinha <ani@anisinha.ca>
X-X-Sender: ani@athabasca.local
To: Stefan Berger <stefanb@linux.ibm.com>
Subject: Re: [PATCH v4 2/3] acpi: tpm: Add missing device identification
 objects
In-Reply-To: <1b32e29a-36fc-7275-e856-97a12585e0a3@linux.ibm.com>
Message-ID: <alpine.OSX.2.20.2201042044240.27406@athabasca.local>
References: <20211223022310.575496-1-stefanb@linux.ibm.com>
 <20211223022310.575496-3-stefanb@linux.ibm.com>
 <20220104105506.17ed9209@redhat.com>
 <1b32e29a-36fc-7275-e856-97a12585e0a3@linux.ibm.com>
User-Agent: Alpine 2.20 (OSX 67 2015-01-07)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62d
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::62d;
 envelope-from=ani@anisinha.ca; helo=mail-pl1-x62d.google.com
X-Spam_score_int: 8
X-Spam_score: 0.8
X-Spam_bar: /
X-Spam_report: (0.8 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: Igor Mammedov <imammedo@redhat.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On Tue, 4 Jan 2022, Stefan Berger wrote:

>
> On 1/4/22 04:55, Igor Mammedov wrote:
> > On Wed, 22 Dec 2021 21:23:09 -0500
> > Stefan Berger <stefanb@linux.ibm.com> wrote:
> >
> > > Add missing device identification objects _STR and _UID. They will appear
> > why, does it break anything or it's just cosmetic?
>
> I don't know about whether any software needs these entries but it's driven by
> this:
>
> https://gitlab.com/qemu-project/qemu/-/issues/708

Ok so you might want to add
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/708

in the commit message. Please see:
https://www.qemu.org/docs/master/devel/submitting-a-patch.html#write-a-meaningful-commit-message

>
> >
> > > as files 'description' and 'uid' under Linux sysfs.
> > >
> > > Cc: Shannon Zhao <shannon.zhaosl@gmail.com>
> > > Cc: Michael S. Tsirkin <mst@redhat.com>
> > > Cc: Igor Mammedov <imammedo@redhat.com>
> > > Cc: Ani Sinha <ani@anisinha.ca>
> > > Fixes: https://gitlab.com/qemu-project/qemu/-/issues/708
> > > Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
> > > Message-id: 20211110133559.3370990-3-stefanb@linux.ibm.com
> > > ---
> > >   hw/arm/virt-acpi-build.c | 1 +
> > >   hw/i386/acpi-build.c     | 8 ++++++++
> > >   2 files changed, 9 insertions(+)
> > >
> > > diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> > > index d0f4867fdf..f2514ce77c 100644
> > > --- a/hw/arm/virt-acpi-build.c
> > > +++ b/hw/arm/virt-acpi-build.c
> > > @@ -229,6 +229,7 @@ static void acpi_dsdt_add_tpm(Aml *scope,
> > > VirtMachineState *vms)
> > >         Aml *dev = aml_device("TPM0");
> > >       aml_append(dev, aml_name_decl("_HID", aml_string("MSFT0101")));
> > > +    aml_append(dev, aml_name_decl("_STR", aml_string("TPM 2.0 Device")));
> > >       aml_append(dev, aml_name_decl("_UID", aml_int(0)));
> > >         Aml *crs = aml_resource_template();
> > > diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> > > index 8383b83ee3..2fb70847cb 100644
> > > --- a/hw/i386/acpi-build.c
> > > +++ b/hw/i386/acpi-build.c
> > > @@ -1812,11 +1812,15 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
> > >                       dev = aml_device("TPM");
> > >                       aml_append(dev, aml_name_decl("_HID",
> > >                                                     aml_string("MSFT0101")));
> > > +                    aml_append(dev,
> > > +                               aml_name_decl("_STR",
> > > +                                             aml_string("TPM 2.0
> > > Device")));
> > >                   } else {
> > >                       dev = aml_device("ISA.TPM");
> > >                       aml_append(dev, aml_name_decl("_HID",
> > >                                                     aml_eisaid("PNP0C31")));
> > >                   }
> > > +                aml_append(dev, aml_name_decl("_UID", aml_int(1)));
> > why it's 1, and not 0 as in virt-arm?
>
> Marc-Andre and I looked at machines with hardware TPMs and that's what we
> found there as well, a '1'.
>
>
> >
> > >                     aml_append(dev, aml_name_decl("_STA", aml_int(0xF)));
> > >                   crs = aml_resource_template();
> > > @@ -1844,6 +1848,8 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
> > >       if (TPM_IS_CRB(tpm)) {
> > >           dev = aml_device("TPM");
> > >           aml_append(dev, aml_name_decl("_HID", aml_string("MSFT0101")));
> > > +        aml_append(dev, aml_name_decl("_STR",
> > > +                                      aml_string("TPM 2.0 Device")));
> > >           crs = aml_resource_template();
> > >           aml_append(crs, aml_memory32_fixed(TPM_CRB_ADDR_BASE,
> > >                                              TPM_CRB_ADDR_SIZE,
> > > AML_READ_WRITE));
> > > @@ -1851,6 +1857,8 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
> > >             aml_append(dev, aml_name_decl("_STA", aml_int(0xf)));
> > >
> > no necessary ^^^ empty line
> fixed
> >
> > > +        aml_append(dev, aml_name_decl("_UID", aml_int(1)));
> > > +
> > >           tpm_build_ppi_acpi(tpm, dev);
> > >             aml_append(sb_scope, dev);
>

