Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B3F2F9AB7
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 08:43:37 +0100 (CET)
Received: from localhost ([::1]:57114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1PCK-0002Qj-In
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 02:43:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l1PB5-00020e-2k
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 02:42:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l1PB2-0000km-IT
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 02:42:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610955734;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9VhC8Cl9Q5F5aeyQohLqbCS3SVX8ASRzRGBEEpyKyCs=;
 b=BWsVpXeK7WSfdLNZ8Zn0FL04oiwJAdW3kXM/npMHGjn7fiDIt1UKqu8X/f/zeo5Ee2zp4k
 i3HZdRSaV3JSqxq9np18RVPtCqQHe+l2izufsvVLRWKcdSKxKvu8OVlm0FUT3yZiNsW3dB
 x4DOg4IV/ZHTh00UqwlputGKwNnIUOk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-535-PWEyao73OUC1r5e4wapo5A-1; Mon, 18 Jan 2021 02:42:12 -0500
X-MC-Unique: PWEyao73OUC1r5e4wapo5A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4349F806668;
 Mon, 18 Jan 2021 07:42:11 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-189.ams2.redhat.com [10.36.112.189])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3C4DD71C91;
 Mon, 18 Jan 2021 07:42:07 +0000 (UTC)
Subject: Re: [PATCH 4/4] tests/qtest: add a test case for pvpanic-pci
To: Mihai Carabas <mihai.carabas@oracle.com>, qemu-devel@nongnu.org
References: <1610735646-13313-1-git-send-email-mihai.carabas@oracle.com>
 <1610735646-13313-5-git-send-email-mihai.carabas@oracle.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <aa5eba39-5fc3-597c-cf2a-6f50a898cc33@redhat.com>
Date: Mon, 18 Jan 2021 08:42:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <1610735646-13313-5-git-send-email-mihai.carabas@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.189,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.252, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15/01/2021 19.34, Mihai Carabas wrote:
> Add a test case for pvpanic-pci device. The scenario is the same as pvpapnic
> ISA device, but is using the PCI bus.
> 
> Signed-off-by: Mihai Carabas <mihai.carabas@oracle.com>
> ---
>   tests/qtest/meson.build        |  1 +
>   tests/qtest/pvpanic-pci-test.c | 62 ++++++++++++++++++++++++++++++++++++++++++
>   2 files changed, 63 insertions(+)
>   create mode 100644 tests/qtest/pvpanic-pci-test.c
> 
> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index b050289..f689cad 100644
> --- a/tests/qtest/meson.build
> +++ b/tests/qtest/meson.build
> @@ -20,6 +20,7 @@ endif
>   
>   qtests_pci = \
>     (config_all_devices.has_key('CONFIG_VGA') ? ['display-vga-test'] : []) +                  \
> +  (config_all_devices.has_key('CONFIG_PVPANIC_PCI') ? ['pvpanic-pci-test'] : []) +          \
>     (config_all_devices.has_key('CONFIG_IVSHMEM_DEVICE') ? ['ivshmem-test'] : [])
>   
>   qtests_i386 = \
> diff --git a/tests/qtest/pvpanic-pci-test.c b/tests/qtest/pvpanic-pci-test.c
> new file mode 100644
> index 0000000..79b8065
> --- /dev/null
> +++ b/tests/qtest/pvpanic-pci-test.c
> @@ -0,0 +1,62 @@
> +/*
> + * QTest testcase for PV Panic PCI device
> + *
> + * Copyright (C) 2020 Oracle
> + *
> + * Authors:
> + *     Mihai Carabas <mihai.carabas@oracle.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> + * See the COPYING file in the top-level directory.
> + *
> + */
> +
> +#include "qemu/osdep.h"
> +#include "libqos/libqtest.h"
> +#include "qapi/qmp/qdict.h"
> +#include "libqos/pci.h"
> +#include "libqos/pci-pc.h"
> +#include "hw/pci/pci_regs.h"
> +
> +static void test_panic(void)
> +{
> +    uint8_t val;
> +    QDict *response, *data;
> +    QTestState *qts;
> +    QPCIBus *pcibus;
> +    QPCIDevice *dev;
> +    QPCIBar bar;
> +
> +    qts = qtest_init("-device pvpanic-pci");
> +    pcibus = qpci_new_pc(qts, NULL);
> +    dev = qpci_device_find(pcibus, QPCI_DEVFN(0x4, 0x0));
> +    qpci_device_enable(dev);
> +    bar = qpci_iomap(dev, 0, NULL);
> +
> +    qpci_memread(dev, bar, 0, &val, sizeof(val));
> +    g_assert_cmpuint(val, ==, 3);
> +
> +    val = 1;
> +    qpci_memwrite(dev, bar, 0, &val, sizeof(val));
> +
> +    response = qtest_qmp_eventwait_ref(qts, "GUEST_PANICKED");
> +    g_assert(qdict_haskey(response, "data"));
> +    data = qdict_get_qdict(response, "data");
> +    g_assert(qdict_haskey(data, "action"));
> +    g_assert_cmpstr(qdict_get_str(data, "action"), ==, "pause");
> +    qobject_unref(response);
> +
> +    qtest_quit(qts);
> +}
> +
> +int main(int argc, char **argv)
> +{
> +    int ret;
> +
> +    g_test_init(&argc, &argv, NULL);
> +    qtest_add_func("/pvpanic-pci/panic", test_panic);
> +
> +    ret = g_test_run();
> +
> +    return ret;
> +}
> 

Acked-by: Thomas Huth <thuth@redhat.com>


