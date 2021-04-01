Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A9A351282
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 11:41:27 +0200 (CEST)
Received: from localhost ([::1]:49236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRtpO-0006T9-Qg
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 05:41:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lRtnD-0005a7-0O
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 05:39:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:27281)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lRtn9-0007jz-UK
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 05:39:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617269945;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=T+se/5mTiAgAH536orvPybAUb2A6mrIQSgLkYGbYhmg=;
 b=F8VCSQHM/+G9METoCZX2ggQbv4lifE1PHZv0yVmJnqj6e6K5IQGTF0VJ2AtAp5ep1aDNyg
 Lperw8tLL2UxuAqLdVD0oInCpTBV0ORt4OM7WlIRYi1UxAckHI4SBKvJw/TUv4IVqZN7Eo
 2Y1FybaiuilAn7ivz9cJewz/+qtoc0c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-542-wFCOppchMGSwPjoMYknbNQ-1; Thu, 01 Apr 2021 05:39:04 -0400
X-MC-Unique: wFCOppchMGSwPjoMYknbNQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7568B107B7C3;
 Thu,  1 Apr 2021 09:39:03 +0000 (UTC)
Received: from redhat.com (ovpn-114-106.ams2.redhat.com [10.36.114.106])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 53D8510016FD;
 Thu,  1 Apr 2021 09:38:58 +0000 (UTC)
Date: Thu, 1 Apr 2021 10:38:55 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Vincent Bernat <vincent@bernat.ch>
Subject: Re: [PATCH v2 2/2] hw/smbios: retrieve PCI address from specified
 device for Type 41
Message-ID: <YGWUrw9wgOI1E3aN@redhat.com>
References: <20210401082544.16522-1-vincent@bernat.ch>
 <20210401082544.16522-2-vincent@bernat.ch>
MIME-Version: 1.0
In-Reply-To: <20210401082544.16522-2-vincent@bernat.ch>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 01, 2021 at 10:25:44AM +0200, Vincent Bernat wrote:
> Instead of specifying the PCI address manually, the device can be
> specified by ID:
> 
>     $QEMU -netdev user,id=internet
>           -device virtio-net-pci,mac=50:54:00:00:00:42,netdev=internet,id=internet-dev \
>           -smbios type=41,designation='Onboard LAN',instance=1,kind=ethernet,pcidev=internet-dev
> 
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
>  hw/smbios/smbios.c | 47 +++++++++++++++++++++-------------------------
>  qemu-options.hx    |  2 +-
>  2 files changed, 22 insertions(+), 27 deletions(-)

It doesn't really make sense to have this as a separate patch
when it is deleting half the code you added in the previous
patch. Just merge them together as one.

> 
> diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
> index 46a08652dff4..0f390e03453c 100644
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
> @@ -134,12 +135,8 @@ static QEnumLookup type41_kind_lookup = {
>      .size = 10
>  };
>  struct type41_instance {
> -    const char *designation;
> +    const char *designation, *pcidev;
>      uint8_t instance, kind;
> -    struct {
> -        uint16_t segment;
> -        uint8_t bus, device;
> -    } pci;
>      QTAILQ_ENTRY(type41_instance) next;
>  };
>  static QTAILQ_HEAD(, type41_instance) type41 = QTAILQ_HEAD_INITIALIZER(type41);
> @@ -403,10 +400,9 @@ static const QemuOptDesc qemu_smbios_type41_opts[] = {
>          .type = QEMU_OPT_NUMBER,
>          .help = "device type instance",
>      },{
> -        .name = "pci",
> +        .name = "pcidev",
>          .type = QEMU_OPT_STRING,
>          .help = "PCI device",
> -        .def_value_str = "0:0.0",
>      },
>      { /* end of list */ }
>  };
> @@ -837,9 +833,23 @@ static void smbios_build_type_41_table(void)
>          SMBIOS_TABLE_SET_STR(41, reference_designation_str, t41->designation);
>          t->device_type = t41->kind;
>          t->device_type_instance = t41->instance;
> -        t->segment_group_number = cpu_to_le16(t41->pci.segment);
> -        t->bus_number = t41->pci.bus;
> -        t->device_number = t41->pci.device;
> +
> +        if (t41->pcidev) {
> +            PCIDevice *pdev = NULL;
> +            int rc = pci_qdev_find_device(t41->pcidev, &pdev);
> +            if (rc == 0) {
> +                /*
> +                 * TODO: Extract the appropriate value. Most of the
> +                 * time, this will be 0.
> +                 */
> +                t->segment_group_number = cpu_to_le16(0);

Hmm, tricky, as it requires interpreting the PCI topology. Wonder if
there's any helper that can do the hard work for you

> +                t->bus_number = pci_dev_bus_num(pdev);
> +                t->device_number = pdev->devfn;
> +            } else {
> +                fprintf(stderr, "%s: cannot find PCI device %s\n",
> +                        __func__, t41->pcidev);

This isn't terminating execution which looks like a bug.

Modify this method to have an 'Error **errp' parameter and
use 'error_setg' to report it.  You'll need to modify the
smbios_get_tables caller to have an 'Error **errp' too.

For the callers of smbios_get_tables(), you can then just pass
in '&error_fatal', to make it print the error + exit.

> +            }
> +        }
>  
>          SMBIOS_BUILD_TABLE_POST;
>          instance++;
> @@ -1301,7 +1311,6 @@ void smbios_entry_add(QemuOpts *opts, Error **errp)
>          case 41: {
>              struct type41_instance *t;
>              Error *local_err = NULL;
> -            int pseg, pbus, pdevice, pfunction;
>  
>              if (!qemu_opts_validate(opts, qemu_smbios_type41_opts, errp)) {
>                  return;
> @@ -1324,21 +1333,7 @@ void smbios_entry_add(QemuOpts *opts, Error **errp)
>                  return;
>              }
>              t->instance = qemu_opt_get_number(opts, "instance", 1);
> -            if (sscanf(qemu_opt_get(opts, "pci"), "%x:%x:%x.%x",
> -                       &pseg,
> -                       &pbus,
> -                       &pdevice,
> -                       &pfunction) != 4) {
> -                error_setg(errp, "unable to parse %s: %s",
> -                           qemu_opt_get(opts, "pci"),
> -                           g_strerror(errno));
> -                free(t);
> -                return;
> -            }
> -            t->pci.segment = pseg;
> -            t->pci.bus = pbus;
> -            t->pci.device = ((uint8_t)pdevice << 3) +
> -                ((uint8_t)pfunction & 0x7);
> +            save_opt(&t->pcidev, opts, "pcidev");
>  
>              QTAILQ_INSERT_TAIL(&type41, t, next);
>              return;
> diff --git a/qemu-options.hx b/qemu-options.hx
> index eb2de7c372c7..e6e54f9bd1f3 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -2371,7 +2371,7 @@ DEF("smbios", HAS_ARG, QEMU_OPTION_smbios,
>      "-smbios type=17[,loc_pfx=str][,bank=str][,manufacturer=str][,serial=str]\n"
>      "               [,asset=str][,part=str][,speed=%d]\n"
>      "                specify SMBIOS type 17 fields\n"
> -    "-smbios type=41[,designation=str][,kind=str][,instance=%d][,pci=%x:%x:%x.%x]\n"
> +    "-smbios type=41[,designation=str][,kind=str][,instance=%d][,pcidev=str]\n"
>      "                specify SMBIOS type 41 fields\n",
>      QEMU_ARCH_I386 | QEMU_ARCH_ARM)
>  SRST
> -- 
> 2.31.0
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


