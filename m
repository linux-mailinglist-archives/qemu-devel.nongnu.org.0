Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4517235213D
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 23:01:19 +0200 (CEST)
Received: from localhost ([::1]:34548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lS4RJ-0006Y7-2U
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 17:01:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lS4PD-00063v-Q9
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 16:59:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26931)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lS4P7-0001xc-79
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 16:59:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617310738;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ECDjhBBIkOfaEgKgVxhSEl4jmYn8QEhstPGTbhGqQvg=;
 b=CQDVzgS8iN84ZruuEli7MyAFkpwJB78rQJUwYK5p5Ps+lKGtzgVR9BxvQ7CjvJ0JLr+6nm
 r+dhyRq8p+Qlj+oakIgo4Kg4EhwF7hDAHoH9LZK0PCn9PDb38YMwu1ieo2QgVGsE4oPs56
 p1kcst/HMaL9gqZpHxln1Lt3+blY5iY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-541-41SeTTvpNmSM9ExRbcf0TQ-1; Thu, 01 Apr 2021 16:58:55 -0400
X-MC-Unique: 41SeTTvpNmSM9ExRbcf0TQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 195867FE85;
 Thu,  1 Apr 2021 20:58:54 +0000 (UTC)
Received: from localhost (unknown [10.40.208.10])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3FDF119C46;
 Thu,  1 Apr 2021 20:58:48 +0000 (UTC)
Date: Thu, 1 Apr 2021 22:58:46 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Vincent Bernat <vincent@bernat.ch>
Subject: Re: [PATCH v3] hw/smbios: support for type 41 (onboard devices
 extended information)
Message-ID: <20210401225846.411ebd76@redhat.com>
In-Reply-To: <20210401122658.37842-1-vincent@bernat.ch>
References: <20210401122658.37842-1-vincent@bernat.ch>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: "Daniel P . =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>,
 qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu,  1 Apr 2021 14:26:58 +0200
Vincent Bernat <vincent@bernat.ch> wrote:

> Type 41 defines the attributes of devices that are onboard. The
> original intent was to imply the BIOS had some level of control over
> the enablement of the associated devices.
> 
> If network devices are present in this table, by default, udev will
> name the corresponding interfaces enoX, X being the instance number.
> Without such information, udev will fallback to using the PCI ID and
> this usually gives ens3 or ens4. This can be a bit annoying as the
> name of the network card may depend on the order of options and may
> change if a new PCI device is added earlier on the commande line.
> Being able to provide SMBIOS type 41 entry ensure the name of the
> interface won't change and helps the user guess the right name without
> booting a first time.
> 
> This can be invoked with:
> 
>     $QEMU -netdev user,id=internet
>           -device virtio-net-pci,mac=50:54:00:00:00:42,netdev=internet,id=internet-dev \
>           -smbios type=41,designation='Onboard LAN',instance=1,kind=ethernet,pcidev=internet-dev

an ACPI alternative was merged recently (current master).
assigning 'designation=' wasn't implemented there, but important part
of giving users control over PCI devices 'eno' index is implemented.

When I looked into the issue, smbios way was a bit over-kill for the task
and didn't really work if hotplug were used.

See, for example how to use new feature:
 https://www.mail-archive.com/qemu-devel@nongnu.org/msg794164.html


> The PCI segment is assumed to be 0. This should hold true for most
> cases.
> 
>     $ dmidecode -t 41
>     # dmidecode 3.3
>     Getting SMBIOS data from sysfs.
>     SMBIOS 2.8 present.
> 
>     Handle 0x2900, DMI type 41, 11 bytes
>     Onboard Device
>             Reference Designation: Onboard LAN
>             Type: Ethernet
>             Status: Enabled
>             Type Instance: 1
>             Bus Address: 0000:00:09.0
> 
>     $ ip -brief a
>     lo               UNKNOWN        127.0.0.1/8 ::1/128
>     eno1             UP             10.0.2.14/24 fec0::5254:ff:fe00:42/64 fe80::5254:ff:fe00:42/64
> 
> Signed-off-by: Vincent Bernat <vincent@bernat.ch>
> ---
>  hw/arm/virt.c                |   7 ++-
>  hw/i386/fw_cfg.c             |   4 +-
>  hw/smbios/smbios.c           | 112 ++++++++++++++++++++++++++++++++++-
>  include/hw/firmware/smbios.h |  14 ++++-
>  qemu-options.hx              |   7 ++-
>  5 files changed, 138 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index aa2bbd14e090..840ec0af02db 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -53,6 +53,7 @@
>  #include "sysemu/kvm.h"
>  #include "hw/loader.h"
>  #include "exec/address-spaces.h"
> +#include "qapi/error.h"
>  #include "qemu/bitops.h"
>  #include "qemu/error-report.h"
>  #include "qemu/module.h"
> @@ -1524,8 +1525,10 @@ static void virt_build_smbios(VirtMachineState *vms)
>                          vmc->smbios_old_sys_ver ? "1.0" : mc->name, false,
>                          true, SMBIOS_ENTRY_POINT_30);
>  
> -    smbios_get_tables(MACHINE(vms), NULL, 0, &smbios_tables, &smbios_tables_len,
> -                      &smbios_anchor, &smbios_anchor_len);
> +    smbios_get_tables(MACHINE(vms), NULL, 0,
> +                      &smbios_tables, &smbios_tables_len,
> +                      &smbios_anchor, &smbios_anchor_len,
> +                      &error_fatal);
>  
>      if (smbios_anchor) {
>          fw_cfg_add_file(vms->fw_cfg, "etc/smbios/smbios-tables",
> diff --git a/hw/i386/fw_cfg.c b/hw/i386/fw_cfg.c
> index e48a54fa364b..4e68d5dea438 100644
> --- a/hw/i386/fw_cfg.c
> +++ b/hw/i386/fw_cfg.c
> @@ -22,6 +22,7 @@
>  #include "hw/nvram/fw_cfg.h"
>  #include "e820_memory_layout.h"
>  #include "kvm/kvm_i386.h"
> +#include "qapi/error.h"
>  #include CONFIG_DEVICES
>  
>  struct hpet_fw_config hpet_cfg = {.count = UINT8_MAX};
> @@ -78,7 +79,8 @@ void fw_cfg_build_smbios(MachineState *ms, FWCfgState *fw_cfg)
>      }
>      smbios_get_tables(ms, mem_array, array_count,
>                        &smbios_tables, &smbios_tables_len,
> -                      &smbios_anchor, &smbios_anchor_len);
> +                      &smbios_anchor, &smbios_anchor_len,
> +                      &error_fatal);
>      g_free(mem_array);
>  
>      if (smbios_anchor) {
> diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
> index f22c4f5b734e..8d26564972c3 100644
> --- a/hw/smbios/smbios.c
> +++ b/hw/smbios/smbios.c
> @@ -27,6 +27,7 @@
>  #include "hw/firmware/smbios.h"
>  #include "hw/loader.h"
>  #include "hw/boards.h"
> +#include "hw/pci/pci.h"
>  #include "smbios_build.h"
>  
>  /* legacy structures and constants for <= 2.0 machines */
> @@ -118,6 +119,28 @@ static struct {
>      uint16_t speed;
>  } type17;
>  
> +static QEnumLookup type41_kind_lookup = {
> +    .array = (const char *const[]) {
> +        "other",
> +        "unknown",
> +        "video",
> +        "scsi",
> +        "ethernet",
> +        "tokenring",
> +        "sound",
> +        "pata",
> +        "sata",
> +        "sas",
> +    },
> +    .size = 10
> +};
> +struct type41_instance {
> +    const char *designation, *pcidev;
> +    uint8_t instance, kind;
> +    QTAILQ_ENTRY(type41_instance) next;
> +};
> +static QTAILQ_HEAD(, type41_instance) type41 = QTAILQ_HEAD_INITIALIZER(type41);
> +
>  static QemuOptsList qemu_smbios_opts = {
>      .name = "smbios",
>      .head = QTAILQ_HEAD_INITIALIZER(qemu_smbios_opts.head),
> @@ -358,6 +381,32 @@ static const QemuOptDesc qemu_smbios_type17_opts[] = {
>      { /* end of list */ }
>  };
>  
> +static const QemuOptDesc qemu_smbios_type41_opts[] = {
> +    {
> +        .name = "type",
> +        .type = QEMU_OPT_NUMBER,
> +        .help = "SMBIOS element type",
> +    },{
> +        .name = "designation",
> +        .type = QEMU_OPT_STRING,
> +        .help = "reference designation string",
> +    },{
> +        .name = "kind",
> +        .type = QEMU_OPT_STRING,
> +        .help = "device type",
> +        .def_value_str = "other",
> +    },{
> +        .name = "instance",
> +        .type = QEMU_OPT_NUMBER,
> +        .help = "device type instance",
> +    },{
> +        .name = "pcidev",
> +        .type = QEMU_OPT_STRING,
> +        .help = "PCI device",
> +    },
> +    { /* end of list */ }
> +};
> +
>  static void smbios_register_config(void)
>  {
>      qemu_add_opts(&qemu_smbios_opts);
> @@ -773,6 +822,41 @@ static void smbios_build_type_32_table(void)
>      SMBIOS_BUILD_TABLE_POST;
>  }
>  
> +static void smbios_build_type_41_table(Error **errp)
> +{
> +    unsigned instance = 0;
> +    struct type41_instance *t41;
> +
> +    QTAILQ_FOREACH(t41, &type41, next) {
> +        SMBIOS_BUILD_TABLE_PRE(41, 0x2900 + instance, true);
> +
> +        SMBIOS_TABLE_SET_STR(41, reference_designation_str, t41->designation);
> +        t->device_type = t41->kind;
> +        t->device_type_instance = t41->instance;
> +
> +        if (t41->pcidev) {
> +            PCIDevice *pdev = NULL;
> +            int rc = pci_qdev_find_device(t41->pcidev, &pdev);
> +            if (rc != 0) {
> +                error_setg(errp,
> +                           "No PCI device %s for SMBIOS type 41 entry %s",
> +                           t41->pcidev, t41->designation);
> +                return;
> +            }
> +            /*
> +             * TODO: Extract the appropriate value. Most of the
> +             * time, this will be 0.
> +             */
> +            t->segment_group_number = cpu_to_le16(0);
> +            t->bus_number = pci_dev_bus_num(pdev);
> +            t->device_number = pdev->devfn;
> +        }
> +
> +        SMBIOS_BUILD_TABLE_POST;
> +        instance++;
> +    }
> +}
> +
>  static void smbios_build_type_127_table(void)
>  {
>      SMBIOS_BUILD_TABLE_PRE(127, 0x7F00, true); /* required */
> @@ -883,7 +967,8 @@ void smbios_get_tables(MachineState *ms,
>                         const struct smbios_phys_mem_area *mem_array,
>                         const unsigned int mem_array_size,
>                         uint8_t **tables, size_t *tables_len,
> -                       uint8_t **anchor, size_t *anchor_len)
> +                       uint8_t **anchor, size_t *anchor_len,
> +                       Error **errp)
>  {
>      unsigned i, dimm_cnt;
>  
> @@ -928,6 +1013,7 @@ void smbios_get_tables(MachineState *ms,
>  
>          smbios_build_type_32_table();
>          smbios_build_type_38_table();
> +        smbios_build_type_41_table(errp);
>          smbios_build_type_127_table();
>  
>          smbios_validate_table(ms);
> @@ -1224,6 +1310,30 @@ void smbios_entry_add(QemuOpts *opts, Error **errp)
>              save_opt(&type17.part, opts, "part");
>              type17.speed = qemu_opt_get_number(opts, "speed", 0);
>              return;
> +        case 41: {
> +            struct type41_instance *t;
> +            Error *local_err = NULL;
> +
> +            if (!qemu_opts_validate(opts, qemu_smbios_type41_opts, errp)) {
> +                return;
> +            }
> +            t = g_new0(struct type41_instance, 1);
> +            save_opt(&t->designation, opts, "designation");
> +            t->kind = qapi_enum_parse(&type41_kind_lookup,
> +                                      qemu_opt_get(opts, "kind"),
> +                                      0, &local_err) + 1;
> +            t->kind |= 0x80;     /* enabled */
> +            if (local_err != NULL) {
> +                error_propagate(errp, local_err);
> +                g_free(t);
> +                return;
> +            }
> +            t->instance = qemu_opt_get_number(opts, "instance", 1);
> +            save_opt(&t->pcidev, opts, "pcidev");
> +
> +            QTAILQ_INSERT_TAIL(&type41, t, next);
> +            return;
> +        }
>          default:
>              error_setg(errp,
>                         "Don't know how to build fields for SMBIOS type %ld",
> diff --git a/include/hw/firmware/smbios.h b/include/hw/firmware/smbios.h
> index 02a0ced0a09f..5a0dd0c8cfff 100644
> --- a/include/hw/firmware/smbios.h
> +++ b/include/hw/firmware/smbios.h
> @@ -258,6 +258,17 @@ struct smbios_type_32 {
>      uint8_t boot_status;
>  } QEMU_PACKED;
>  
> +/* SMBIOS type 41 - Onboard Devices Extended Information */
> +struct smbios_type_41 {
> +    struct smbios_structure_header header;
> +    uint8_t reference_designation_str;
> +    uint8_t device_type;
> +    uint8_t device_type_instance;
> +    uint16_t segment_group_number;
> +    uint8_t bus_number;
> +    uint8_t device_number;
> +} QEMU_PACKED;
> +
>  /* SMBIOS type 127 -- End-of-table */
>  struct smbios_type_127 {
>      struct smbios_structure_header header;
> @@ -273,5 +284,6 @@ void smbios_get_tables(MachineState *ms,
>                         const struct smbios_phys_mem_area *mem_array,
>                         const unsigned int mem_array_size,
>                         uint8_t **tables, size_t *tables_len,
> -                       uint8_t **anchor, size_t *anchor_len);
> +                       uint8_t **anchor, size_t *anchor_len,
> +                       Error **errp);
>  #endif /* QEMU_SMBIOS_H */
> diff --git a/qemu-options.hx b/qemu-options.hx
> index fd21002bd61d..e6e54f9bd1f3 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -2370,7 +2370,9 @@ DEF("smbios", HAS_ARG, QEMU_OPTION_smbios,
>      "                specify SMBIOS type 11 fields\n"
>      "-smbios type=17[,loc_pfx=str][,bank=str][,manufacturer=str][,serial=str]\n"
>      "               [,asset=str][,part=str][,speed=%d]\n"
> -    "                specify SMBIOS type 17 fields\n",
> +    "                specify SMBIOS type 17 fields\n"
> +    "-smbios type=41[,designation=str][,kind=str][,instance=%d][,pcidev=str]\n"
> +    "                specify SMBIOS type 41 fields\n",
>      QEMU_ARCH_I386 | QEMU_ARCH_ARM)
>  SRST
>  ``-smbios file=binary``
> @@ -2432,6 +2434,9 @@ SRST
>  
>  ``-smbios type=17[,loc_pfx=str][,bank=str][,manufacturer=str][,serial=str][,asset=str][,part=str][,speed=%d]``
>      Specify SMBIOS type 17 fields
> +
> +``-smbios type=41[,designation=str][,kind=str][,instance=%d][,dev=str]``
> +    Specify SMBIOS type 41 fields
>  ERST
>  
>  DEFHEADING()


