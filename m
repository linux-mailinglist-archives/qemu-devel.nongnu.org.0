Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E935797D5
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 12:44:24 +0200 (CEST)
Received: from localhost ([::1]:41516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDkiE-0006lb-Qt
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 06:44:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oDkgp-0005CG-0i
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 06:42:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58476)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oDkgl-0004R7-WD
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 06:42:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658227371;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ky7sETGeYYlApGuyeYaNfIpK2ZyK3yUxOd5kvCb50Ac=;
 b=UjZFU6LCa0ZI0odPPpo0ikwHmeW5j2Bv7/A4QVq3ZvDsETpb2lIyyox+mni0lg6iVmtVV0
 imDr0aSg132pwy30eo6WIQjQBB9MYYXc+BIAWRwEVCKjWDc54SAGMz+0wnpDpru656NwTy
 G3DWLo6Iq80NnfamJHtN+JHKmipRSTE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-662-B3YqpDCRPp6ULgbOiNPFnw-1; Tue, 19 Jul 2022 06:42:49 -0400
X-MC-Unique: B3YqpDCRPp6ULgbOiNPFnw-1
Received: by mail-wm1-f70.google.com with SMTP id
 r82-20020a1c4455000000b003a300020352so6050670wma.5
 for <qemu-devel@nongnu.org>; Tue, 19 Jul 2022 03:42:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=ky7sETGeYYlApGuyeYaNfIpK2ZyK3yUxOd5kvCb50Ac=;
 b=Xi4LoRHCCwhJyiaZmXap57Ug3+84ejT6Hmek19pzJhlMrraB8j0Yd1YdLBrMw8COsY
 VUwzuJ11ieHfuS39feG3Ayn2oAyyhJejNT78ZMyKfFIjfoRPN4t1p80qBMIs4cG6u0/C
 7OVKRFaPSry+LtsmfiOTStOEuAMIvs2dhJkpWBgIgbmZ7ImxYQAB9dvl9mrokrhujG2U
 /QEI3IOTaY0OsfGtbZV17qDVHPc1+fUpjCdVVtS/kwP/k3RQUjk2m6nYSNm2Y3Od5LpW
 L9v529IDz07bmcd9+5tTxecokarIMmq0lp7b8waBdzXu0X6ZNZGx3po6B9AS9ayWl0BR
 4TDQ==
X-Gm-Message-State: AJIora+4ii5WZ0cZ+Ji3vRc2QGTzooLKRreRlUHoDn52oeZaaFzlKtaW
 0SzxZW07B5qKlaFdL2yfwvAGifdzgXZ9oUFhsncUPoJLjVzwZJucMktSDWhaNG4RXXSIAzqf326
 EQcLFoO2e9s6mdm0=
X-Received: by 2002:a05:600c:64a:b0:3a3:25d5:fa5 with SMTP id
 p10-20020a05600c064a00b003a325d50fa5mr1108958wmm.125.1658227368726; 
 Tue, 19 Jul 2022 03:42:48 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1u0ASZCN7gCwFv4R6hMVRhIfbGMpyxpIs/hQ6kA+N/nBfNY/LeWFDe/33rp0cuEaNEm+T391w==
X-Received: by 2002:a05:600c:64a:b0:3a3:25d5:fa5 with SMTP id
 p10-20020a05600c064a00b003a325d50fa5mr1108939wmm.125.1658227368460; 
 Tue, 19 Jul 2022 03:42:48 -0700 (PDT)
Received: from [10.33.198.128] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 n16-20020a05600c465000b003a03ae64f57sm17080900wmo.8.2022.07.19.03.42.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Jul 2022 03:42:48 -0700 (PDT)
Message-ID: <6dc76218-2281-4319-165b-c42086ee7157@redhat.com>
Date: Tue, 19 Jul 2022 12:42:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: Roman Kagan <rvkagan@yandex-team.ru>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 yc-core@yandex-team.ru, "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>
References: <20220719080123.553981-1-rvkagan@yandex-team.ru>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v2] hw/pci/pci_bridge: ensure PCIe slots have only one slot
In-Reply-To: <20220719080123.553981-1-rvkagan@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19/07/2022 10.01, Roman Kagan wrote:
> It's possible to create non-working configurations by attaching a device
> to a derivative of PCIe slot (pcie-root-port, ioh3420, etc) and
> specifying a slot number other that zero, e.g.:
> 
>      -device pcie-root-port,id=s0,... \
>      -device virtio-blk-pci,bus=s0,addr=4,...
> 
> Make QEMU reject such configurations and only allow addr=0 on the
> secondary bus of a PCIe slot.
> 
> To verify this new behavior, add two basic qtests for the PCIe bridges
> that may be affected by change: pcie-root-port and x3130.  For the
> former, two testcases are included, one positive for slot #0 and one
> negative for (arbitrary) slot #4; for the latter, only a positive
> testcase for slot #4 is included.
> 
> Signed-off-by: Roman Kagan <rvkagan@yandex-team.ru>
> ---
> v1 -> v2:
> - use object_dynamic_cast (without assert) [Vladimir]
> - add explaining comment [Michael]
> - add tests
> (I've only had a chance to run tests against x86; hope I didn't mess
> them up for other arches)

With my s390x hat on: This should not affect s390x - we're not using PCIe there.

>   hw/pci/pci_bridge.c               |  6 +++
>   tests/qtest/pcie-root-port-test.c | 77 +++++++++++++++++++++++++++++++
>   tests/qtest/xio3130-test.c        | 54 ++++++++++++++++++++++
>   tests/qtest/meson.build           |  2 +
>   4 files changed, 139 insertions(+)
>   create mode 100644 tests/qtest/pcie-root-port-test.c
>   create mode 100644 tests/qtest/xio3130-test.c
> 
> diff --git a/hw/pci/pci_bridge.c b/hw/pci/pci_bridge.c
> index da34c8ebcd..23e1701d06 100644
> --- a/hw/pci/pci_bridge.c
> +++ b/hw/pci/pci_bridge.c
> @@ -33,6 +33,7 @@
>   #include "qemu/units.h"
>   #include "hw/pci/pci_bridge.h"
>   #include "hw/pci/pci_bus.h"
> +#include "hw/pci/pcie_port.h"
>   #include "qemu/module.h"
>   #include "qemu/range.h"
>   #include "qapi/error.h"
> @@ -386,6 +387,11 @@ void pci_bridge_initfn(PCIDevice *dev, const char *typename)
>       br->windows = pci_bridge_region_init(br);
>       QLIST_INIT(&sec_bus->child);
>       QLIST_INSERT_HEAD(&parent->child, sec_bus, sibling);
> +
> +    /* PCIe slot derivatives are bridges with a single slot; enforce that */
> +    if (object_dynamic_cast(OBJECT(dev), TYPE_PCIE_SLOT)) {
> +        sec_bus->slot_reserved_mask = ~1u;
> +    }
>   }
>   
>   /* default qdev clean up function for PCI-to-PCI bridge */
> diff --git a/tests/qtest/pcie-root-port-test.c b/tests/qtest/pcie-root-port-test.c
> new file mode 100644
> index 0000000000..a1f3d84d75
> --- /dev/null
> +++ b/tests/qtest/pcie-root-port-test.c
> @@ -0,0 +1,77 @@
> +/*
> + * QTest testcase for generic PCIe root port
> + *
> + * Copyright (c) 2022 Yandex N.V.
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "libqtest-single.h"

Do you really need libqtest-single.h here? libqtest.h should be enough, 
shouldn't it?

> +/*
> + * Let QEMU choose the bus and slot for the device under test.  It may even be
> + * a non-PCIe bus but it's ok for the purpose of the test.
> + */
> +static const char *common_args = "-device pcie-root-port,id=s0"
> +                                 ",port=1,chassis=1,multifunction=on";
> +
> +static void test_slot0(void)
> +{
> +    QTestState *qts;
> +    QDict *resp;
> +
> +    /* attach a PCIe device into slot0 of the root port */
> +    qts = qtest_init(common_args);
> +    /* PCIe root port is known to be supported, use it as a leaf device too */
> +    resp = qtest_qmp(qts, "{'execute': 'device_add', 'arguments': {"
> +                     "'driver': 'pcie-root-port', "
> +                     "'id': 'port1', "
> +                     "'bus': 's0', "
> +                     "'chassis': 5, "
> +                     "'addr': '0'"
> +                     "} }");
> +    g_assert_nonnull(resp);
> +    g_assert(!qdict_haskey(resp, "event"));
> +    g_assert(!qdict_haskey(resp, "error"));
> +    qobject_unref(resp);
> +
> +    qtest_quit(qts);
> +}
> +
> +static void test_slot4(void)
> +{
> +    QTestState *qts;
> +    QDict *resp;
> +
> +    /* attach a PCIe device into slot4 of the root port should be rejected */
> +    qts = qtest_init(common_args);
> +    /* PCIe root port is known to be supported, use it as a leaf device too */
> +    resp = qtest_qmp(qts, "{'execute': 'device_add', 'arguments': {"
> +                     "'driver': 'pcie-root-port', "
> +                     "'id': 'port1', "
> +                     "'bus': 's0', "
> +                     "'chassis': 5, "
> +                     "'addr': '4'"
> +                     "} }");
> +    qmp_expect_error_and_unref(resp, "GenericError");
> +
> +    qtest_quit(qts);
> +}
> +
> +int main(int argc, char **argv)
> +{
> +    int ret;
> +
> +    g_test_init(&argc, &argv, NULL);
> +
> +    qtest_add_func("/pcie-root-port/slot0", test_slot0);
> +    qtest_add_func("/pcie-root-port/slot4", test_slot4);
> +
> +    ret = g_test_run();
> +
> +    qtest_end();

Please drop the qtest_end() - you're already using qtest_quit in the 
individual tests.

> +    return ret;
> +}
> diff --git a/tests/qtest/xio3130-test.c b/tests/qtest/xio3130-test.c
> new file mode 100644
> index 0000000000..3a937889b9
> --- /dev/null
> +++ b/tests/qtest/xio3130-test.c
> @@ -0,0 +1,54 @@
> +/*
> + * QTest testcase for TI X3130 PCIe switch
> + *
> + * Copyright (c) 2022 Yandex N.V.
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "libqtest-single.h"

dito - please switch to libqtest.h

> +/*
> + * Let QEMU choose the bus and slot for the device under test.  It may even be
> + * a non-PCIe bus but it's ok for the purpose of the test.
> + */
> +static const char *common_args = "-device x3130-upstream,id=s0";
> +
> +static void test_slot4(void)
> +{
> +    QTestState *qts;
> +    QDict *resp;
> +
> +    /* attach a downstream port into slot4 of the upstream port */
> +    qts = qtest_init(common_args);
> +    resp = qtest_qmp(qts, "{'execute': 'device_add', 'arguments': {"
> +                     "'driver': 'xio3130-downstream', "
> +                     "'id': 'port1', "
> +                     "'bus': 's0', "
> +                     "'chassis': 5, "
> +                     "'addr': '4'"
> +                     "} }");
> +    g_assert_nonnull(resp);
> +    g_assert(!qdict_haskey(resp, "event"));
> +    g_assert(!qdict_haskey(resp, "error"));
> +    qobject_unref(resp);
> +
> +    qtest_quit(qts);
> +}
> +
> +int main(int argc, char **argv)
> +{
> +    int ret;
> +
> +    g_test_init(&argc, &argv, NULL);
> +
> +    qtest_add_func("/x3130/slot4", test_slot4);
> +
> +    ret = g_test_run();
> +
> +    qtest_end();

Drop qtest_end() also here.

> +    return ret;
> +}
> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index 31287a9173..19cab1bc35 100644
> --- a/tests/qtest/meson.build
> +++ b/tests/qtest/meson.build
> @@ -54,6 +54,7 @@ qtests_i386 = \
>     (config_all_devices.has_key('CONFIG_I82801B11') ? ['i82801b11-test'] : []) +             \
>     (config_all_devices.has_key('CONFIG_IOH3420') ? ['ioh3420-test'] : []) +                  \
>     (config_all_devices.has_key('CONFIG_LPC_ICH9') ? ['lpc-ich9-test'] : []) +              \
> +  (config_all_devices.has_key('CONFIG_PCIE_PORT') ? ['pcie-root-port-test'] : []) +         \
>     (config_all_devices.has_key('CONFIG_USB_UHCI') ? ['usb-hcd-uhci-test'] : []) +            \
>     (config_all_devices.has_key('CONFIG_USB_UHCI') and                                        \
>      config_all_devices.has_key('CONFIG_USB_EHCI') ? ['usb-hcd-ehci-test'] : []) +            \
> @@ -63,6 +64,7 @@ qtests_i386 = \
>     (config_all_devices.has_key('CONFIG_TPM_TIS_ISA') ? ['tpm-tis-test'] : []) +              \
>     (config_all_devices.has_key('CONFIG_TPM_TIS_ISA') ? ['tpm-tis-swtpm-test'] : []) +        \
>     (config_all_devices.has_key('CONFIG_RTL8139_PCI') ? ['rtl8139-test'] : []) +              \
> +  (config_all_devices.has_key('CONFIG_XIO3130') ? ['xio3130-test'] : []) +                  \
>     (config_all_devices.has_key('CONFIG_E1000E_PCI_EXPRESS') ? ['fuzz-e1000e-test'] : []) +   \
>     (config_all_devices.has_key('CONFIG_MEGASAS_SCSI_PCI') ? ['fuzz-megasas-test'] : []) +    \
>     (config_all_devices.has_key('CONFIG_LSI_SCSI_PCI') ? ['fuzz-lsi53c895a-test'] : []) +     \

  Thomas


