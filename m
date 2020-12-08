Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A6DF2D2FAC
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 17:29:30 +0100 (CET)
Received: from localhost ([::1]:36992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmfrl-0005iU-Dp
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 11:29:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kmflH-0001bT-Ir
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 11:22:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:38326)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kmflD-0007h5-Oj
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 11:22:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607444562;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k885aNYqhxoJLaos0R3P3MIwCPHxMLkrMSizTXw6ZzE=;
 b=Nw/REeBIRRZkoLTTqa2hMKNed8H6mEVz39whJ3raBapR5OitC7od7PPo+/za3a9hAQJHR/
 rnifAtSxim4igjgjRJ/XHVImD49QNB20E09kd9K4ejkJEElrQjxm/csz+3h2YxcLz9wHjc
 64GLeFBaPcMGe0y95SBRKVcR5WY1/0w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-340-UCLi0tCpP0y6Ii339vXg5Q-1; Tue, 08 Dec 2020 11:22:38 -0500
X-MC-Unique: UCLi0tCpP0y6Ii339vXg5Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3238280EDB3;
 Tue,  8 Dec 2020 16:22:37 +0000 (UTC)
Received: from localhost (unknown [10.40.208.65])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E11665D9E2;
 Tue,  8 Dec 2020 16:22:27 +0000 (UTC)
Date: Tue, 8 Dec 2020 17:22:25 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Marian Posteuca <posteuca@mutex.one>
Subject: Re: [PATCH] acpi: Permit OEM ID and OEM table ID fields to be changed
Message-ID: <20201208172225.333bd4d4@redhat.com>
In-Reply-To: <20201206212823.16333-1-posteuca@mutex.one>
References: <20201206212823.16333-1-posteuca@mutex.one>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun,  6 Dec 2020 23:28:23 +0200
Marian Posteuca <posteuca@mutex.one> wrote:

> Qemu's ACPI table generation sets the fields OEM ID and OEM table ID
> to "BOCHS " and "BXPCxxxx" where "xxxx" is replaced by the ACPI
> table name.
> 
> Some games like Red Dead Redemption 2 seem to check the ACPI OEM ID
> and OEM table ID for the strings "BOCHS" and "BXPC" and if they are
> found, the game crashes(this may be an intentional detection
> mechanism to prevent playing the game in a virtualized environment).
> 
> This patch allows you to override these default values.
> 
> The feature can be used in this manner:
>   qemu -acpidefault oem_id=ABCDEF,oem_table_id=EFGH
> 
> The oem_id string must be exactly 6 bytes in size, and the
> oem_table_id string must be exactly 4 bytes in size. If either of
> these parameters is not set, the current default values will be
> used for the one missing.
> 
> This does not affect the -acpitable option (for user-defined ACPI
> tables), which has precedence over -acpidefault option.
>
> Signed-off-by: Marian Posteuca <posteuca@mutex.one>
> ---
>  hw/acpi/aml-build.c         | 51 +++++++++++++++++++++++++++++++---
>  hw/arm/virt-acpi-build.c    |  2 +-
>  hw/i386/acpi-build.c        |  2 +-
>  hw/i386/acpi-microvm.c      |  2 +-
>  include/hw/acpi/aml-build.h |  6 ++--
>  qemu-options.hx             | 18 ++++++++++++
>  softmmu/vl.c                | 55 +++++++++++++++++++++++++++++++++++++
>  7 files changed, 126 insertions(+), 10 deletions(-)
> 
> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> index 3792ba96ce..033d6a743d 100644
> --- a/hw/acpi/aml-build.c
> +++ b/hw/acpi/aml-build.c
> @@ -28,6 +28,9 @@
>  #include "hw/boards.h"
>  #include "hw/acpi/tpm.h"
>  
> +#define ACPI_BUILD_APPNAME6 "BOCHS "
> +#define ACPI_BUILD_APPNAME4 "BXPC"
> +
>  static GArray *build_alloc_array(void)
>  {
>      return g_array_new(false, true /* clear */, 1);
> @@ -1538,6 +1541,47 @@ Aml *aml_object_type(Aml *object)
>      return var;
>  }
>  
> +void acpi_get_oem_id_default(unsigned char *oem_id)
> +{
> +    QemuOpts *opts;
> +    const char *opt_oem_id = NULL;
> +
> +    opts = qemu_opts_find(qemu_find_opts("acpidefault"), NULL);
> +    if (opts) {
> +        opt_oem_id = qemu_opt_get(opts, "oem_id");
> +    }
> +
> +    if (opt_oem_id == NULL) {
> +        memcpy(oem_id, ACPI_BUILD_APPNAME6, 6);
> +    } else {
> +        memcpy(oem_id, opt_oem_id, 6);
> +    }
> +}
> +
> +void acpi_get_oem_table_id_default(const char *sig,
> +                                   unsigned char *oem_table_id)
> +{
> +    QemuOpts *opts;
> +    const char *opt_oem_table_id = NULL;
> +
> +    opts = qemu_opts_find(qemu_find_opts("acpidefault"), NULL);
> +    if (opts) {
> +        opt_oem_table_id = qemu_opt_get(opts, "oem_table_id");
> +    }
> +
> +    if (opt_oem_table_id == NULL) {
> +        memcpy(oem_table_id, ACPI_BUILD_APPNAME4, 4);
> +        if (sig) {
> +            memcpy(oem_table_id + 4, sig, 4);
> +        }
> +    } else {
> +        memcpy(oem_table_id, opt_oem_table_id, 4);
> +        if (sig) {
> +            memcpy(oem_table_id + 4, sig, 4);
> +        }
> +    }
> +}

think about aml-build as a library, it shouldn't access random (CLI) stuff
outside itself unless there isn't any other way around problem.

I'd prefer to extend build_header() and its callers to pass ids as arguments,
and make acpi_build() figure out if it should use default or user provided values.

more exactly since we are taking about game which I'd assume only pc machine
needs this change.
I'd suggest to add respective properties to pc_machine_class_init(),
and drop all manual option handling you are adding here.
Then pc_machine_initfn() can set default values for them and if user provides
id properties it will override defaults automatically.
All that's left is for acpi_build() to pass property values from machine
to table building functions.


>  void
>  build_header(BIOSLinker *linker, GArray *table_data,
>               AcpiTableHeader *h, const char *sig, int len, uint8_t rev,
> @@ -1552,18 +1596,17 @@ build_header(BIOSLinker *linker, GArray *table_data,
>      if (oem_id) {
>          strncpy((char *)h->oem_id, oem_id, sizeof h->oem_id);
>      } else {
> -        memcpy(h->oem_id, ACPI_BUILD_APPNAME6, 6);
> +        acpi_get_oem_id_default(h->oem_id);
>      }
>  
>      if (oem_table_id) {
>          strncpy((char *)h->oem_table_id, oem_table_id, sizeof(h->oem_table_id));
>      } else {
> -        memcpy(h->oem_table_id, ACPI_BUILD_APPNAME4, 4);
> -        memcpy(h->oem_table_id + 4, sig, 4);
> +        acpi_get_oem_table_id_default(sig, h->oem_table_id);
>      }
>  
>      h->oem_revision = cpu_to_le32(1);
> -    memcpy(h->asl_compiler_id, ACPI_BUILD_APPNAME4, 4);
> +    acpi_get_oem_table_id_default(NULL, h->asl_compiler_id);
>      h->asl_compiler_revision = cpu_to_le32(1);
>      /* Checksum to be filled in by Guest linker */
>      bios_linker_loader_add_checksum(linker, ACPI_BUILD_TABLE_FILE,
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 9747a6458f..cbeb8f8262 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -734,10 +734,10 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>      {
>          AcpiRsdpData rsdp_data = {
>              .revision = 2,
> -            .oem_id = ACPI_BUILD_APPNAME6,
>              .xsdt_tbl_offset = &xsdt,
>              .rsdt_tbl_offset = NULL,
>          };
> +        acpi_get_oem_id_default(rsdp_data.oem_id);
>          build_rsdp(tables->rsdp, tables->linker, &rsdp_data);
>      }
>  
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index 1f5c211245..5e75ebdcc3 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -2555,10 +2555,10 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
>      {
>          AcpiRsdpData rsdp_data = {
>              .revision = 0,
> -            .oem_id = ACPI_BUILD_APPNAME6,
>              .xsdt_tbl_offset = NULL,
>              .rsdt_tbl_offset = &rsdt,
>          };
> +        acpi_get_oem_id_default(rsdp_data.oem_id);
>          build_rsdp(tables->rsdp, tables->linker, &rsdp_data);
>          if (!pcmc->rsdp_in_ram) {
>              /* We used to allocate some extra space for RSDP revision 2 but
> diff --git a/hw/i386/acpi-microvm.c b/hw/i386/acpi-microvm.c
> index d34a301b84..04db8ce0ac 100644
> --- a/hw/i386/acpi-microvm.c
> +++ b/hw/i386/acpi-microvm.c
> @@ -215,10 +215,10 @@ static void acpi_build_microvm(AcpiBuildTables *tables,
>          AcpiRsdpData rsdp_data = {
>              /* ACPI 2.0: 5.2.4.3 RSDP Structure */
>              .revision = 2, /* xsdt needs v2 */
> -            .oem_id = ACPI_BUILD_APPNAME6,
>              .xsdt_tbl_offset = &xsdt,
>              .rsdt_tbl_offset = NULL,
>          };
> +        acpi_get_oem_id_default(rsdp_data.oem_id);
>          build_rsdp(tables->rsdp, tables->linker, &rsdp_data);
>      }
>  
> diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
> index fe0055fffb..a5527ac4ad 100644
> --- a/include/hw/acpi/aml-build.h
> +++ b/include/hw/acpi/aml-build.h
> @@ -7,9 +7,6 @@
>  /* Reserve RAM space for tables: add another order of magnitude. */
>  #define ACPI_BUILD_TABLE_MAX_SIZE         0x200000
>  
> -#define ACPI_BUILD_APPNAME6 "BOCHS "
> -#define ACPI_BUILD_APPNAME4 "BXPC"
> -
>  #define ACPI_BUILD_TABLE_FILE "etc/acpi/tables"
>  #define ACPI_BUILD_RSDP_FILE "etc/acpi/rsdp"
>  #define ACPI_BUILD_TPMLOG_FILE "etc/tpm/log"
> @@ -399,6 +396,9 @@ Aml *aml_concatenate(Aml *source1, Aml *source2, Aml *target);
>  Aml *aml_object_type(Aml *object);
>  
>  void build_append_int_noprefix(GArray *table, uint64_t value, int size);
> +void acpi_get_oem_id_default(unsigned char *oem_id);
> +void acpi_get_oem_table_id_default(const char *sig,
> +                                   unsigned char *oem_table_id);
>  void
>  build_header(BIOSLinker *linker, GArray *table_data,
>               AcpiTableHeader *h, const char *sig, int len, uint8_t rev,
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 2c83390504..09147621e5 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -3455,6 +3455,24 @@ SRST
>      from ./my\_blob.bin.
>  ERST
>  
> +DEF("acpidefault", HAS_ARG, QEMU_OPTION_acpidefault,
> +    "-acpidefault oem_id=<OEMID>,oem_table_id=<OEMTABLEID>\n"
> +    "                set default OEM ID (6 bytes) and OEM table ID (4 bytes)\n",
> +    QEMU_ARCH_ALL)
> +SRST
> +``-acpidefault oem_id=oem-id,oem_table_id=oem-table-id``
> +    Set the default OEM ID and OEM table ID used in ACPI tables.  The
> +    OEM ID should be 6 bytes (pad with spaces if needed), and the OEM
> +    table ID should be 4 bytes.
> +
> +    If not set, qemu uses ``BOCHS`` and ``BXPCxxxx`` where
> +    xxxx is the table name (eg. ``BXPCRSDT`` in the RSDT table).
> +
> +    If you are adding user-defined ACPI tables on the qemu command line,
> +    use ``-acpitable`` instead.  The defaults here will not be used in this
> +    case.
> +ERST
> +
>  DEF("serial", HAS_ARG, QEMU_OPTION_serial, \
>      "-serial dev     redirect the serial port to char device 'dev'\n",
>      QEMU_ARCH_ALL)
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index e6e0ad5a92..59d071feb6 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -506,6 +506,24 @@ static QemuOptsList qemu_fw_cfg_opts = {
>      },
>  };
>  
> +static QemuOptsList qemu_acpidefault_opts = {
> +    .name = "acpidefault",
> +    .merge_lists = true,
> +    .head = QTAILQ_HEAD_INITIALIZER(qemu_acpidefault_opts.head),
> +    .desc = {
> +        {
> +            .name = "oem_id",
> +            .type = QEMU_OPT_STRING,
> +            .help = "Set default OEM ID (6 bytes)",
> +        }, {
> +            .name = "oem_table_id",
> +            .type = QEMU_OPT_STRING,
> +            .help = "Set default OEM table ID (4 bytes)",
> +        },
> +        { /* end of list */ }
> +    },
> +};
> +
>  /**
>   * Get machine options
>   *
> @@ -2092,6 +2110,30 @@ static int parse_fw_cfg(void *opaque, QemuOpts *opts, Error **errp)
>      return 0;
>  }
>  
> +static int check_acpi_option(QemuOpts *opts)
> +{
> +    const char *oem_id;
> +    const char *oem_table_id;
> +
> +    oem_id = qemu_opt_get(opts, "oem_id");
> +    if (oem_id) {
> +        if (strlen(oem_id) != 6) {
> +            error_report("-acpidefault oem_id parameter must be 6 bytes long");
> +            return -1;
> +        }
> +    }
> +    oem_table_id = qemu_opt_get(opts, "oem_table_id");
> +    if (oem_table_id) {
> +        size_t len = strlen(oem_table_id);
> +        if (len != 4) {
> +            error_report("-acpidefault oem_table_id parameter "
> +                         "must be 4 bytes long");
> +            return -1;
> +        }
> +    }
> +    return 0;
> +}
> +
>  static int device_help_func(void *opaque, QemuOpts *opts, Error **errp)
>  {
>      return qdev_device_help(opts);
> @@ -2948,6 +2990,7 @@ void qemu_init(int argc, char **argv, char **envp)
>      qemu_add_opts(&qemu_icount_opts);
>      qemu_add_opts(&qemu_semihosting_config_opts);
>      qemu_add_opts(&qemu_fw_cfg_opts);
> +    qemu_add_opts(&qemu_acpidefault_opts);
>      module_call_init(MODULE_INIT_OPTS);
>  
>      runstate_init();
> @@ -3490,6 +3533,13 @@ void qemu_init(int argc, char **argv, char **envp)
>                      exit(1);
>                  }
>                  break;
> +            case QEMU_OPTION_acpidefault:
> +                opts = qemu_opts_parse_noisily(qemu_find_opts("acpidefault"),
> +                                               optarg, false);
> +                if (opts == NULL) {
> +                    exit(1);
> +                }
> +                break;
>              case QEMU_OPTION_preconfig:
>                  preconfig_exit_requested = false;
>                  break;
> @@ -4387,6 +4437,11 @@ void qemu_init(int argc, char **argv, char **envp)
>      qemu_opts_foreach(qemu_find_opts("fw_cfg"),
>                        parse_fw_cfg, fw_cfg_find(), &error_fatal);
>  
> +     if (check_acpi_option(qemu_opts_find(qemu_find_opts("acpidefault"),
> +                                         NULL)) < 0) {
> +        exit(1);
> +    }
> +
>      /* init USB devices */
>      if (machine_usb(current_machine)) {
>          if (foreach_device_config(DEV_USB, usb_parse) < 0)


