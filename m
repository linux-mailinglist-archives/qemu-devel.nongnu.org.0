Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA3EB2D114F
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 14:05:45 +0100 (CET)
Received: from localhost ([::1]:40502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmGD2-0006fu-BE
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 08:05:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kmG5n-0004cu-CF
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 07:58:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50238)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kmG5T-0004Wg-Am
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 07:58:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607345874;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e68U+w1dG8ClaK/r5O8bL2rOSddYYTRUgIPMdjWHdcQ=;
 b=B+iyMFuddSy/hmMmWaPo7LTWJLBswJcmPNqhw08j76cL5wA4Ye2/HRPaDelyXubPbLbOXp
 9zDHLNOnvR1qJNFS2nmbDYh8to5uZMLTJJZyKQQz9/JKHzNx/zRXvcYtJBLpkNX1nNPAnj
 A819BmBFQI9qo43vnqPxGPn76JVUjZM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-218-QhYxJe66O_ivvT2KaWbcYg-1; Mon, 07 Dec 2020 07:57:51 -0500
X-MC-Unique: QhYxJe66O_ivvT2KaWbcYg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 77DD61012EB0;
 Mon,  7 Dec 2020 12:57:45 +0000 (UTC)
Received: from localhost (unknown [10.40.208.65])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2DCD2648A9;
 Mon,  7 Dec 2020 12:57:43 +0000 (UTC)
Date: Mon, 7 Dec 2020 13:57:42 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Ankur Arora <ankur.a.arora@oracle.com>
Subject: Re: [PATCH 5/8] x86: acpi: let the firmware handle pending "CPU
 remove" events in SMM
Message-ID: <20201207135742.5c9962f0@redhat.com>
In-Reply-To: <533b92b0-1eae-f24d-b90b-f7f174dbf305@oracle.com>
References: <20201204170939.1815522-1-imammedo@redhat.com>
 <20201204170939.1815522-6-imammedo@redhat.com>
 <533b92b0-1eae-f24d-b90b-f7f174dbf305@oracle.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: lersek@redhat.com, qemu-devel@nongnu.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 6 Dec 2020 22:20:27 -0800
Ankur Arora <ankur.a.arora@oracle.com> wrote:

> On 2020-12-04 9:09 a.m., Igor Mammedov wrote:
> > if firmware and QEMU negotiated CPU hotunplug support, generate
> > _EJ0 method so that it will mark CPU for removal by firmware and
> > pass control to it by triggering SMI.
> > 
> > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> > ---
> >   include/hw/acpi/cpu.h |  1 +
> >   hw/acpi/cpu.c         | 15 +++++++++++++--
> >   hw/i386/acpi-build.c  |  1 +
> >   3 files changed, 15 insertions(+), 2 deletions(-)
> > 
> > diff --git a/include/hw/acpi/cpu.h b/include/hw/acpi/cpu.h
> > index d71edde456..999caaf510 100644
> > --- a/include/hw/acpi/cpu.h
> > +++ b/include/hw/acpi/cpu.h
> > @@ -51,6 +51,7 @@ void cpu_hotplug_hw_init(MemoryRegion *as, Object *owner,
> >   typedef struct CPUHotplugFeatures {
> >       bool acpi_1_compatible;
> >       bool has_legacy_cphp;
> > +    bool fw_unplugs_cpu;
> >       const char *smi_path;
> >   } CPUHotplugFeatures;
> >   
> > diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c
> > index 811218f673..bded2a837f 100644
> > --- a/hw/acpi/cpu.c
> > +++ b/hw/acpi/cpu.c
> > @@ -341,6 +341,7 @@ const VMStateDescription vmstate_cpu_hotplug = {
> >   #define CPU_INSERT_EVENT  "CINS"
> >   #define CPU_REMOVE_EVENT  "CRMV"
> >   #define CPU_EJECT_EVENT   "CEJ0"
> > +#define CPU_FW_EJECT_EVENT "CEJF"
> >   
> >   void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
> >                       hwaddr io_base,
> > @@ -393,7 +394,10 @@ void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
> >           aml_append(field, aml_named_field(CPU_REMOVE_EVENT, 1));  
> 
>    Bit 2: Device remove event, used to distinguish device for which
>          no device eject request to OSPM was issued. Firmware must
>          ignore this bit.
> 
> >           /* initiates device eject, write only */
> >           aml_append(field, aml_named_field(CPU_EJECT_EVENT, 1));  
> 
>    Bit 3: reserved and should be ignored by OSPM
> 
> > -        aml_append(field, aml_reserved_field(4));
> > +        aml_append(field, aml_reserved_field(1));
> > +        /* tell firmware to do device eject, write only */
> > +        aml_append(field, aml_named_field(CPU_FW_EJECT_EVENT, 1));
> > +        aml_append(field, aml_reserved_field(2));  
> 
> Shouldn't this be instead:
> 
> > -        aml_append(field, aml_reserved_field(4));
> > +        /* tell firmware to do device eject, write only */
> > +        aml_append(field, aml_named_field(CPU_FW_EJECT_EVENT, 1));
> > +        aml_append(field, aml_reserved_field(3));  
> 

yes, it should be this way,
I'll fix in v2

>    Bit 4: if set to 1, OSPM requests firmware to perform device eject.
>    Bit 5-7: reserved and should be ignored by OSPM
> 
> Otherwise AFAICS CPU_FW_EJECT_EVENT would correspond to bit 5.
> 
> 
> Ankur
> 
> >           aml_append(field, aml_named_field(CPU_COMMAND, 8));
> >           aml_append(cpu_ctrl_dev, field);
> >   
> > @@ -428,6 +432,7 @@ void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
> >           Aml *ins_evt = aml_name("%s.%s", cphp_res_path, CPU_INSERT_EVENT);
> >           Aml *rm_evt = aml_name("%s.%s", cphp_res_path, CPU_REMOVE_EVENT);
> >           Aml *ej_evt = aml_name("%s.%s", cphp_res_path, CPU_EJECT_EVENT);
> > +        Aml *fw_ej_evt = aml_name("%s.%s", cphp_res_path, CPU_FW_EJECT_EVENT);
> >   
> >           aml_append(cpus_dev, aml_name_decl("_HID", aml_string("ACPI0010")));
> >           aml_append(cpus_dev, aml_name_decl("_CID", aml_eisaid("PNP0A05")));
> > @@ -470,7 +475,13 @@ void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
> >   
> >               aml_append(method, aml_acquire(ctrl_lock, 0xFFFF));
> >               aml_append(method, aml_store(idx, cpu_selector));
> > -            aml_append(method, aml_store(one, ej_evt));
> > +            if (opts.fw_unplugs_cpu) {
> > +                aml_append(method, aml_store(one, fw_ej_evt));
> > +                aml_append(method, aml_store(aml_int(OVMF_CPUHP_SMI_CMD),
> > +                           aml_name("%s", opts.smi_path)));
> > +            } else {
> > +                aml_append(method, aml_store(one, ej_evt));
> > +            }
> >               aml_append(method, aml_release(ctrl_lock));
> >           }
> >           aml_append(cpus_dev, method);
> > diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> > index 9036e5594c..475e76f514 100644
> > --- a/hw/i386/acpi-build.c
> > +++ b/hw/i386/acpi-build.c
> > @@ -1586,6 +1586,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
> >           CPUHotplugFeatures opts = {
> >               .acpi_1_compatible = true, .has_legacy_cphp = true,
> >               .smi_path = pm->smi_on_cpuhp ? "\\_SB.PCI0.SMI0.SMIC" : NULL,
> > +            .fw_unplugs_cpu = pm->smi_on_cpu_unplug,
> >           };
> >           build_cpus_aml(dsdt, machine, opts, pm->cpu_hp_io_base,
> >                          "\\_SB.PCI0", "\\_GPE._E02");
> >   
> 


