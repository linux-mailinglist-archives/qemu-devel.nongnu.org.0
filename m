Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13E9624C0C8
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Aug 2020 16:43:38 +0200 (CEST)
Received: from localhost ([::1]:44988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k8lmz-0006et-5d
	for lists+qemu-devel@lfdr.de; Thu, 20 Aug 2020 10:43:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1k8lly-0005vj-Aw
 for qemu-devel@nongnu.org; Thu, 20 Aug 2020 10:42:34 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:26677
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1k8llw-0002kE-AV
 for qemu-devel@nongnu.org; Thu, 20 Aug 2020 10:42:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597934551;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H3oR1PqFhdcDNFbBPdmkDEblkNOPsgQeBUmabLslgYA=;
 b=htw7tgU1OcNaDONFkK1jtCcAGVkOz8tPzDhYwgZpMe90IxHFz8BGtlFaBqE0ykevs6uZ+y
 tC5k4H4t7Tc/ZY9/BahomLaHEQOwLNUqWGk682KibRdI+57r8yxljhUH/UPpCIu668GB50
 lDD8qMpB8wUB11QyP/gO+bS1iMBDRqM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-493-hx57Md3aOcWhRXAKtsFkaw-1; Thu, 20 Aug 2020 10:42:29 -0400
X-MC-Unique: hx57Md3aOcWhRXAKtsFkaw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7941A1007380;
 Thu, 20 Aug 2020 14:42:27 +0000 (UTC)
Received: from localhost (unknown [10.43.2.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EB72F16E27;
 Thu, 20 Aug 2020 14:42:17 +0000 (UTC)
Date: Thu, 20 Aug 2020 16:42:16 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PULL 3/3] hw: add compat machines for 5.2
Message-ID: <20200820164216.1510cddd@redhat.com>
In-Reply-To: <20200820163508.5c2fce23@redhat.com>
References: <20200819152258.703874-1-ehabkost@redhat.com>
 <20200819152258.703874-4-ehabkost@redhat.com>
 <20200820163508.5c2fce23@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=imammedo@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/20 08:28:03
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>,
 David Hildenbrand <david@redhat.com>, qemu-ppc@nongnu.org,
 Richard Henderson <rth@twiddle.net>, Cornelia Huck <cohuck@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Andrew Jones <drjones@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 20 Aug 2020 16:35:08 +0200
Igor Mammedov <imammedo@redhat.com> wrote:

> On Wed, 19 Aug 2020 11:22:58 -0400
> Eduardo Habkost <ehabkost@redhat.com> wrote:
> 
> > From: Cornelia Huck <cohuck@redhat.com>
> > 
> > Add 5.2 machine types for arm/i440fx/q35/s390x/spapr.
> > 
> > Reviewed-by: Andrew Jones <drjones@redhat.com>
> > Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> > Reviewed-by: Greg Kurz <groug@kaod.org>
> > Acked-by: Christian Borntraeger <borntraeger@de.ibm.com>
> > Acked-by: David Gibson <david@gibson.dropbear.id.au>
> > Acked-by: Thomas Huth <thuth@redhat.com>
> > Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> > Message-Id: <20200819144016.281156-1-cohuck@redhat.com>
> > Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>  
> 
> Is this the latest version of the patch?
> It doesn't apply cleanly on top of the current master.
Sorry for noise,
it was messed up tree on my side,
after clean checkout it applies fine.

> 
> > ---
> >  include/hw/boards.h        |  3 +++
> >  include/hw/i386/pc.h       |  3 +++
> >  hw/arm/virt.c              |  9 ++++++++-
> >  hw/core/machine.c          |  3 +++
> >  hw/i386/pc.c               |  3 +++
> >  hw/i386/pc_piix.c          | 14 +++++++++++++-
> >  hw/i386/pc_q35.c           | 13 ++++++++++++-
> >  hw/ppc/spapr.c             | 15 +++++++++++++--
> >  hw/s390x/s390-virtio-ccw.c | 14 +++++++++++++-
> >  9 files changed, 71 insertions(+), 6 deletions(-)
> > 
> > diff --git a/include/hw/boards.h b/include/hw/boards.h
> > index 426ce5f625..bc5b82ad20 100644
> > --- a/include/hw/boards.h
> > +++ b/include/hw/boards.h
> > @@ -319,6 +319,9 @@ struct MachineState {
> >      } \
> >      type_init(machine_initfn##_register_types)
> >  
> > +extern GlobalProperty hw_compat_5_1[];
> > +extern const size_t hw_compat_5_1_len;
> > +
> >  extern GlobalProperty hw_compat_5_0[];
> >  extern const size_t hw_compat_5_0_len;
> >  
> > diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
> > index 3d7ed3a55e..fe52e165b2 100644
> > --- a/include/hw/i386/pc.h
> > +++ b/include/hw/i386/pc.h
> > @@ -193,6 +193,9 @@ void pc_system_firmware_init(PCMachineState *pcms, MemoryRegion *rom_memory);
> >  void pc_madt_cpu_entry(AcpiDeviceIf *adev, int uid,
> >                         const CPUArchIdList *apic_ids, GArray *entry);
> >  
> > +extern GlobalProperty pc_compat_5_1[];
> > +extern const size_t pc_compat_5_1_len;
> > +
> >  extern GlobalProperty pc_compat_5_0[];
> >  extern const size_t pc_compat_5_0_len;
> >  
> > diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> > index ecfee362a1..acf9bfbece 100644
> > --- a/hw/arm/virt.c
> > +++ b/hw/arm/virt.c
> > @@ -2546,10 +2546,17 @@ static void machvirt_machine_init(void)
> >  }
> >  type_init(machvirt_machine_init);
> >  
> > +static void virt_machine_5_2_options(MachineClass *mc)
> > +{
> > +}
> > +DEFINE_VIRT_MACHINE_AS_LATEST(5, 2)
> > +
> >  static void virt_machine_5_1_options(MachineClass *mc)
> >  {
> > +    virt_machine_5_2_options(mc);
> > +    compat_props_add(mc->compat_props, hw_compat_5_1, hw_compat_5_1_len);
> >  }
> > -DEFINE_VIRT_MACHINE_AS_LATEST(5, 1)
> > +DEFINE_VIRT_MACHINE(5, 1)
> >  
> >  static void virt_machine_5_0_options(MachineClass *mc)
> >  {
> > diff --git a/hw/core/machine.c b/hw/core/machine.c
> > index 8d1a90c6cf..cf5f2dfaeb 100644
> > --- a/hw/core/machine.c
> > +++ b/hw/core/machine.c
> > @@ -28,6 +28,9 @@
> >  #include "hw/mem/nvdimm.h"
> >  #include "migration/vmstate.h"
> >  
> > +GlobalProperty hw_compat_5_1[] = {};
> > +const size_t hw_compat_5_1_len = G_N_ELEMENTS(hw_compat_5_1);
> > +
> >  GlobalProperty hw_compat_5_0[] = {
> >      { "pci-host-bridge", "x-config-reg-migration-enabled", "off" },
> >      { "virtio-balloon-device", "page-poison", "false" },
> > diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> > index 47c5ca3e34..9aa813949c 100644
> > --- a/hw/i386/pc.c
> > +++ b/hw/i386/pc.c
> > @@ -97,6 +97,9 @@
> >  #include "fw_cfg.h"
> >  #include "trace.h"
> >  
> > +GlobalProperty pc_compat_5_1[] = {};
> > +const size_t pc_compat_5_1_len = G_N_ELEMENTS(pc_compat_5_1);
> > +
> >  GlobalProperty pc_compat_5_0[] = {
> >  };
> >  const size_t pc_compat_5_0_len = G_N_ELEMENTS(pc_compat_5_0);
> > diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> > index b789e83f9a..c5ba70ca17 100644
> > --- a/hw/i386/pc_piix.c
> > +++ b/hw/i386/pc_piix.c
> > @@ -426,7 +426,7 @@ static void pc_i440fx_machine_options(MachineClass *m)
> >      machine_class_allow_dynamic_sysbus_dev(m, TYPE_VMBUS_BRIDGE);
> >  }
> >  
> > -static void pc_i440fx_5_1_machine_options(MachineClass *m)
> > +static void pc_i440fx_5_2_machine_options(MachineClass *m)
> >  {
> >      PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
> >      pc_i440fx_machine_options(m);
> > @@ -435,6 +435,18 @@ static void pc_i440fx_5_1_machine_options(MachineClass *m)
> >      pcmc->default_cpu_version = 1;
> >  }
> >  
> > +DEFINE_I440FX_MACHINE(v5_2, "pc-i440fx-5.2", NULL,
> > +                      pc_i440fx_5_2_machine_options);
> > +
> > +static void pc_i440fx_5_1_machine_options(MachineClass *m)
> > +{
> > +    pc_i440fx_5_2_machine_options(m);
> > +    m->alias = NULL;
> > +    m->is_default = false;
> > +    compat_props_add(m->compat_props, hw_compat_5_1, hw_compat_5_1_len);
> > +    compat_props_add(m->compat_props, pc_compat_5_1, pc_compat_5_1_len);
> > +}
> > +
> >  DEFINE_I440FX_MACHINE(v5_1, "pc-i440fx-5.1", NULL,
> >                        pc_i440fx_5_1_machine_options);
> >  
> > diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
> > index a3e607a544..0cb9c18cd4 100644
> > --- a/hw/i386/pc_q35.c
> > +++ b/hw/i386/pc_q35.c
> > @@ -353,7 +353,7 @@ static void pc_q35_machine_options(MachineClass *m)
> >      m->max_cpus = 288;
> >  }
> >  
> > -static void pc_q35_5_1_machine_options(MachineClass *m)
> > +static void pc_q35_5_2_machine_options(MachineClass *m)
> >  {
> >      PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
> >      pc_q35_machine_options(m);
> > @@ -361,6 +361,17 @@ static void pc_q35_5_1_machine_options(MachineClass *m)
> >      pcmc->default_cpu_version = 1;
> >  }
> >  
> > +DEFINE_Q35_MACHINE(v5_2, "pc-q35-5.2", NULL,
> > +                   pc_q35_5_2_machine_options);
> > +
> > +static void pc_q35_5_1_machine_options(MachineClass *m)
> > +{
> > +    pc_q35_5_2_machine_options(m);
> > +    m->alias = NULL;
> > +    compat_props_add(m->compat_props, hw_compat_5_1, hw_compat_5_1_len);
> > +    compat_props_add(m->compat_props, pc_compat_5_1, pc_compat_5_1_len);
> > +}
> > +
> >  DEFINE_Q35_MACHINE(v5_1, "pc-q35-5.1", NULL,
> >                     pc_q35_5_1_machine_options);
> >  
> > diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> > index 0ae293ec94..1c8d0981b3 100644
> > --- a/hw/ppc/spapr.c
> > +++ b/hw/ppc/spapr.c
> > @@ -4579,15 +4579,26 @@ static void spapr_machine_latest_class_options(MachineClass *mc)
> >      }                                                                \
> >      type_init(spapr_machine_register_##suffix)
> >  
> > +/*
> > + * pseries-5.2
> > + */
> > +static void spapr_machine_5_2_class_options(MachineClass *mc)
> > +{
> > +    /* Defaults for the latest behaviour inherited from the base class */
> > +}
> > +
> > +DEFINE_SPAPR_MACHINE(5_2, "5.2", true);
> > +
> >  /*
> >   * pseries-5.1
> >   */
> >  static void spapr_machine_5_1_class_options(MachineClass *mc)
> >  {
> > -    /* Defaults for the latest behaviour inherited from the base class */
> > +    spapr_machine_5_2_class_options(mc);
> > +    compat_props_add(mc->compat_props, hw_compat_5_1, hw_compat_5_1_len);
> >  }
> >  
> > -DEFINE_SPAPR_MACHINE(5_1, "5.1", true);
> > +DEFINE_SPAPR_MACHINE(5_1, "5.1", false);
> >  
> >  /*
> >   * pseries-5.0
> > diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
> > index e72c61d2ea..f4ea6a9545 100644
> > --- a/hw/s390x/s390-virtio-ccw.c
> > +++ b/hw/s390x/s390-virtio-ccw.c
> > @@ -801,14 +801,26 @@ bool css_migration_enabled(void)
> >      }                                                                         \
> >      type_init(ccw_machine_register_##suffix)
> >  
> > +static void ccw_machine_5_2_instance_options(MachineState *machine)
> > +{
> > +}
> > +
> > +static void ccw_machine_5_2_class_options(MachineClass *mc)
> > +{
> > +}
> > +DEFINE_CCW_MACHINE(5_2, "5.2", true);
> > +
> >  static void ccw_machine_5_1_instance_options(MachineState *machine)
> >  {
> > +    ccw_machine_5_2_instance_options(machine);
> >  }
> >  
> >  static void ccw_machine_5_1_class_options(MachineClass *mc)
> >  {
> > +    ccw_machine_5_2_class_options(mc);
> > +    compat_props_add(mc->compat_props, hw_compat_5_1, hw_compat_5_1_len);
> >  }
> > -DEFINE_CCW_MACHINE(5_1, "5.1", true);
> > +DEFINE_CCW_MACHINE(5_1, "5.1", false);
> >  
> >  static void ccw_machine_5_0_instance_options(MachineState *machine)
> >  {  
> 
> 


