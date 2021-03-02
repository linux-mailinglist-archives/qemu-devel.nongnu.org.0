Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5158329703
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 09:51:05 +0100 (CET)
Received: from localhost ([::1]:53140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH0kC-0003Rd-3y
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 03:51:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lH0iJ-0002ph-Vq
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 03:49:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26328)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lH0iD-0006gm-FE
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 03:49:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614674940;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ytyQVv4GnNNE6mkgOp6ZQwF9sShM3g1kSkIOJznsfqM=;
 b=BlyUV3+AjAPSoqGtNIqolL1ub8HeMQomtdeKGYpq0sFlLcvq2EzVUEg4G/b4kVLsVMJZpd
 itLK6JFokktLyrAeS/qeGLQdbwiBR1MvXgXI1JbUzCVjLdckNW7HnKfFA6NCsMUwwCnAtn
 J1x8f/DF9IkyhmuzOw3BkdGuJbwKDcU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-108-3O2li4iCN0C44EEBeImdwQ-1; Tue, 02 Mar 2021 03:48:56 -0500
X-MC-Unique: 3O2li4iCN0C44EEBeImdwQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1420C100A8FD;
 Tue,  2 Mar 2021 08:48:55 +0000 (UTC)
Received: from MiWiFi-RA69-srv (unknown [10.40.208.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4BA5962665;
 Tue,  2 Mar 2021 08:48:49 +0000 (UTC)
Date: Tue, 2 Mar 2021 09:48:47 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Vitaly Cheptsov <cheptsov@ispras.ru>
Subject: Re: [PATCH] i386/acpi: restore device paths for pre-5.1 vms
Message-ID: <20210302094847.4baf87ad@MiWiFi-RA69-srv>
In-Reply-To: <20210301195919.9333-1-cheptsov@ispras.ru>
References: <20210301195919.9333-1-cheptsov@ispras.ru>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-stable@nongnu.org, Thomas Lamprecht <t.lamprecht@proxmox.com>,
 qemu-devel@nongnu.org, "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon,  1 Mar 2021 22:59:18 +0300
Vitaly Cheptsov <cheptsov@ispras.ru> wrote:

> After fixing the _UID value for the primary PCI root bridge in
> af1b80ae it was discovered that this change updates Windows
> configuration in an incompatible way causing network configuration
> failure unless DHCP is used. More details provided on the list:
> 
> https://lists.gnu.org/archive/html/qemu-devel/2021-02/msg08484.html
> 
> This change reverts the _UID update from 1 to 0 for q35 and i440fx
> VMs before version 5.2 to maintain the original behaviour when
> upgrading.
> 
> Cc: qemu-stable@nongnu.org
> Cc: qemu-devel@nongnu.org
> Reported-by: Thomas Lamprecht <t.lamprecht@proxmox.com>
> Suggested-by: Michael S. Tsirkin <mst@redhat.com>
> Signed-off-by: Vitaly Cheptsov <cheptsov@ispras.ru>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/i386/acpi-build.c | 4 ++--
>  hw/i386/pc_piix.c    | 2 ++
>  hw/i386/pc_q35.c     | 2 ++
>  include/hw/i386/pc.h | 1 +
>  4 files changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index 31a5f6f4a5..442b4629a9 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -1277,7 +1277,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
>          dev = aml_device("PCI0");
>          aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0A03")));
>          aml_append(dev, aml_name_decl("_ADR", aml_int(0)));
> -        aml_append(dev, aml_name_decl("_UID", aml_int(0)));
> +        aml_append(dev, aml_name_decl("_UID", aml_int(pcmc->pci_root_uid)));
>          aml_append(sb_scope, dev);
>          aml_append(dsdt, sb_scope);
>  
> @@ -1296,7 +1296,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
>          aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0A08")));
>          aml_append(dev, aml_name_decl("_CID", aml_eisaid("PNP0A03")));
>          aml_append(dev, aml_name_decl("_ADR", aml_int(0)));
> -        aml_append(dev, aml_name_decl("_UID", aml_int(0)));
> +        aml_append(dev, aml_name_decl("_UID", aml_int(pcmc->pci_root_uid)));
>          aml_append(dev, build_q35_osc_method());
>          aml_append(sb_scope, dev);
>          if (mcfg_valid) {
> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> index 2904b40163..46cc951073 100644
> --- a/hw/i386/pc_piix.c
> +++ b/hw/i386/pc_piix.c
> @@ -405,6 +405,7 @@ static void pc_i440fx_machine_options(MachineClass *m)
>  {
>      PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
>      pcmc->default_nic_model = "e1000";
> +    pcmc->pci_root_uid = 0;
>  
>      m->family = "pc_piix";
>      m->desc = "Standard PC (i440FX + PIIX, 1996)";
> @@ -448,6 +449,7 @@ static void pc_i440fx_5_1_machine_options(MachineClass *m)
>      compat_props_add(m->compat_props, hw_compat_5_1, hw_compat_5_1_len);
>      compat_props_add(m->compat_props, pc_compat_5_1, pc_compat_5_1_len);
>      pcmc->kvmclock_create_always = false;
> +    pcmc->pci_root_uid = 1;
>  }
>  
>  DEFINE_I440FX_MACHINE(v5_1, "pc-i440fx-5.1", NULL,
> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
> index 0a212443aa..53450190f5 100644
> --- a/hw/i386/pc_q35.c
> +++ b/hw/i386/pc_q35.c
> @@ -329,6 +329,7 @@ static void pc_q35_machine_options(MachineClass *m)
>  {
>      PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
>      pcmc->default_nic_model = "e1000e";
> +    pcmc->pci_root_uid = 0;
>  
>      m->family = "pc_q35";
>      m->desc = "Standard PC (Q35 + ICH9, 2009)";
> @@ -375,6 +376,7 @@ static void pc_q35_5_1_machine_options(MachineClass *m)
>      compat_props_add(m->compat_props, hw_compat_5_1, hw_compat_5_1_len);
>      compat_props_add(m->compat_props, pc_compat_5_1, pc_compat_5_1_len);
>      pcmc->kvmclock_create_always = false;
> +    pcmc->pci_root_uid = 1;
>  }
>  
>  DEFINE_Q35_MACHINE(v5_1, "pc-q35-5.1", NULL,
> diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
> index c9d194a5e7..d4c3d73c11 100644
> --- a/include/hw/i386/pc.h
> +++ b/include/hw/i386/pc.h
> @@ -105,6 +105,7 @@ struct PCMachineClass {
>      int legacy_acpi_table_size;
>      unsigned acpi_data_size;
>      bool do_not_add_smb_acpi;
> +    int pci_root_uid;
>  
>      /* SMBIOS compat: */
>      bool smbios_defaults;


