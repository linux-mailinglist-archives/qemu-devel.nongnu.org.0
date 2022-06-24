Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD587559CFE
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 17:08:19 +0200 (CEST)
Received: from localhost ([::1]:48920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4kuv-0006nB-1H
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 11:08:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1o4krc-0002a3-37
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 11:04:52 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:2639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1o4krZ-0002di-Nf
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 11:04:51 -0400
Received: from fraeml739-chm.china.huawei.com (unknown [172.18.147.207])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4LV0l26y7tz67yRq;
 Fri, 24 Jun 2022 23:04:14 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml739-chm.china.huawei.com (10.206.15.220) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 24 Jun 2022 17:04:46 +0200
Received: from localhost (10.81.207.131) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Fri, 24 Jun
 2022 16:04:45 +0100
Date: Fri, 24 Jun 2022 16:04:42 +0100
To: Brice Goglin <Brice.Goglin@inria.fr>
CC: QEMU Developers <qemu-devel@nongnu.org>, Liu Jingqi
 <jingqi.liu@intel.com>, Eduardo Habkost <eduardo@habkost.net>, "Marcel
 Apfelbaum" <marcel.apfelbaum@gmail.com>, Philippe =?ISO-8859-1?Q?Mathieu-D?=
 =?ISO-8859-1?Q?aud=E9?= <f4bug@amsat.org>, Yanan Wang
 <wangyanan55@huawei.com>, Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH 0/4] hmat acpi: Don't require initiator value in -numa
Message-ID: <20220624160442.00002af2@Huawei.com>
In-Reply-To: <d7e41f9c-745d-3ef2-31c3-c5e5921fc025@inria.fr>
References: <d7e41f9c-745d-3ef2-31c3-c5e5921fc025@inria.fr>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.81.207.131]
X-ClientProxiedBy: lhreml735-chm.china.huawei.com (10.201.108.86) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@Huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>

On Thu, 23 Jun 2022 16:56:58 +0200
Brice Goglin <Brice.Goglin@inria.fr> wrote:

> Brice Goglin (4):
>    hmat acpi: Don't require initiator value in -numa
>    tests: acpi: add and whitelist *.hmat-noinitiator expected blobs
>    tests: acpi: q35: add test for hmat nodes without initiators
>    tests: acpi: q35: update expected blobs *.hmat-noinitiators]
Hi Brice,

Given I reviewed on your github prior to you sending this and you've addressed
the few minor things I raised.

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Nice to tidy this up.

Jonathan

> 
>   hw/core/machine.c                             |   4 +-
>   tests/data/acpi/q35/APIC.acpihmat-noinitiator | Bin 0 -> 144 bytes
>   tests/data/acpi/q35/DSDT.acpihmat-noinitiator | Bin 0 -> 8553 bytes
>   tests/data/acpi/q35/FACP.acpihmat-noinitiator | Bin 0 -> 244 bytes
>   tests/data/acpi/q35/HMAT.acpihmat-noinitiator | Bin 0 -> 288 bytes
>   tests/data/acpi/q35/SRAT.acpihmat-noinitiator | Bin 0 -> 312 bytes
>   tests/qtest/bios-tables-test.c                |  45 ++++++++++++++++++
>   7 files changed, 46 insertions(+), 3 deletions(-)
>   create mode 100644 tests/data/acpi/q35/APIC.acpihmat-noinitiator
>   create mode 100644 tests/data/acpi/q35/DSDT.acpihmat-noinitiator
>   create mode 100644 tests/data/acpi/q35/FACP.acpihmat-noinitiator
>   create mode 100644 tests/data/acpi/q35/HMAT.acpihmat-noinitiator
>   create mode 100644 tests/data/acpi/q35/SRAT.acpihmat-noinitiator
> 


