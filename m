Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60C654BED7B
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 23:55:19 +0100 (CET)
Received: from localhost ([::1]:40340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMHaQ-00070G-5Z
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 17:55:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nMHY5-0004NL-0W
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 17:52:53 -0500
Received: from [2a00:1450:4864:20::529] (port=33323
 helo=mail-ed1-x529.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nMHY3-0002V5-4V
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 17:52:52 -0500
Received: by mail-ed1-x529.google.com with SMTP id s14so15057314edw.0
 for <qemu-devel@nongnu.org>; Mon, 21 Feb 2022 14:52:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:subject:in-reply-to:references:message-id:mime-version
 :content-transfer-encoding;
 bh=iOlGmr8Ym+/JOwstdVPbhIQXhreCwtqK7DIis9pAAhY=;
 b=c0wmnm5SV64JPyhlBWNR7pwJvAD8XUW7Hv2uKh7C2Ei253eKKrAeWmWKZCH8VWe/P3
 NW3C+4uX22zErs4edfFVsQGJyZZB1cvybPuCF3VeYl0hixBzdgNXgXNKAJoATQAq8w4x
 IY3ro/9s9EYaDtEpGxMOhQJPUki4eh/zmuPLTQjzUV/U0KJ4PkNW+XIB8+FVH5wX6JEb
 0yAOImtdVPO8cG2AYFkSkJBWbkV9HJblpda49dNSbQ7+JEDSn6LMpAxlUpTCdHURr9h3
 TIX0tTlBVO4i5OoW2o946MRp1xP0sEwvj6fidhVaaol6M0PBD5hot3jiwMnYVW2YRWgD
 GNbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:subject:in-reply-to:references
 :message-id:mime-version:content-transfer-encoding;
 bh=iOlGmr8Ym+/JOwstdVPbhIQXhreCwtqK7DIis9pAAhY=;
 b=EsIjwnSHfcx9amV6F39GjJ7dt8DwEK5w1C22YAJL5cHvlRgeTRPDc9KcBg7uVmEfde
 V0KBx9ACOrMrDeuW12qycarpSKxOiFfWYog2jCAZE+txypUEjyy0LEoF9OCsK27VMmdL
 zyzXa47Xib1O0/RHex6hAkJWc+f31t8j33SWJN6E72cUyYPYZ+RiCBpDFVVJV5ug9ffO
 4hfXKjbjWosQgW8CcqzUrj/xzqMVLssH+9YX/weK8cR4YXMTAtRhCmuDHKist589UB8g
 iyMeQbIYkDmJUFCrknLnQtVVTnOzTMggXr5krSlhwFUS/0cFfVoAWIc0Xfckqyh1SzPd
 B2jg==
X-Gm-Message-State: AOAM530P9WzlSsRCxxXbOz1EZ1o4VWvJnwUXQclVKgvftwolTG1MbnwB
 xlvY4G07KWRTMM4ImqP2lZ0=
X-Google-Smtp-Source: ABdhPJyxvY4s1InBUVkc8sgTspzrz1YRyWsjc7kX2hVE+aY3ViaDUviCYu7ZqgltNtdfFjOfOj8NOQ==
X-Received: by 2002:a05:6402:b8f:b0:3fd:90e9:ddac with SMTP id
 cf15-20020a0564020b8f00b003fd90e9ddacmr23779179edb.405.1645483968659; 
 Mon, 21 Feb 2022 14:52:48 -0800 (PST)
Received: from [127.0.0.1] (dynamic-077-013-203-064.77.13.pool.telefonica.de.
 [77.13.203.64])
 by smtp.gmail.com with ESMTPSA id 7sm5243690edw.37.2022.02.21.14.52.48
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 21 Feb 2022 14:52:48 -0800 (PST)
Date: Mon, 21 Feb 2022 22:52:44 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?=
 <philippe.mathieu.daude@gmail.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH 0/2] Resolve some redundant property accessors
In-Reply-To: <a71843c3-0d0b-5d42-4712-386f2d189ff3@gmail.com>
References: <20220217225351.140095-1-shentey@gmail.com>
 <a71843c3-0d0b-5d42-4712-386f2d189ff3@gmail.com>
Message-ID: <8BC26E05-EF78-464E-A5AC-E0E6CB7F2659@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::529
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x529.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Am 21=2E Februar 2022 22:28:00 UTC schrieb "Philippe Mathieu-Daud=C3=A9" <p=
hilippe=2Emathieu=2Edaude@gmail=2Ecom>:
>On 17/2/22 23:53, Bernhard Beschow wrote:
>> The QOM API already provides appropriate accessors, so reuse them=2E
>>=20
>> Testing done:
>>=20
>>    :$ make check
>>    Ok:                 569
>>    Expected Fail:      0
>>    Fail:               0
>>    Unexpected Pass:    0
>>    Skipped:            178
>>    Timeout:            0
>>=20
>> Bernhard Beschow (2):
>>    hw/vfio/pci-quirks: Resolve redundant property getters
>>    hw/riscv/sifive_u: Resolve redundant property accessors
>
>Good cleanup=2E
>
>You might want to play with Coccinelle spatch [*] to clean all uses:

Hi Philippe,

thanks for your review!

I've manually inspected most (all?) of them and found that the remaining s=
etters were non-trivial, i=2Ee=2E they do some extra stuff such as checking=
 boundaries or invoking some extra actions=2E Do you have an idea how to de=
al with that?

Regards,
Bernhard

>$ git grep object_property_add\(=2E*uint
>hw/acpi/ich9=2Ec:446:    object_property_add(obj, ACPI_PM_PROP_GPE0_BLK,=
=20
>"uint32",
>hw/i386/sgx-epc=2Ec:47:    object_property_add(obj, SGX_EPC_SIZE_PROP,=20
>"uint64", sgx_epc_get_size,
>hw/intc/apic_common=2Ec:462:    object_property_add(obj, "id", "uint32",
>hw/mem/pc-dimm=2Ec:175:    object_property_add(obj, PC_DIMM_SIZE_PROP,=20
>"uint64", pc_dimm_get_size,
>hw/misc/aspeed_lpc=2Ec:420:    object_property_add(obj, "idr1", "uint32",=
=20
>aspeed_kcs_get_register_property,
>hw/misc/aspeed_lpc=2Ec:422:    object_property_add(obj, "odr1", "uint32",=
=20
>aspeed_kcs_get_register_property,
>hw/misc/aspeed_lpc=2Ec:424:    object_property_add(obj, "str1", "uint32",=
=20
>aspeed_kcs_get_register_property,
>hw/misc/aspeed_lpc=2Ec:426:    object_property_add(obj, "idr2", "uint32",=
=20
>aspeed_kcs_get_register_property,
>hw/misc/aspeed_lpc=2Ec:428:    object_property_add(obj, "odr2", "uint32",=
=20
>aspeed_kcs_get_register_property,
>hw/misc/aspeed_lpc=2Ec:430:    object_property_add(obj, "str2", "uint32",=
=20
>aspeed_kcs_get_register_property,
>hw/misc/aspeed_lpc=2Ec:432:    object_property_add(obj, "idr3", "uint32",=
=20
>aspeed_kcs_get_register_property,
>hw/misc/aspeed_lpc=2Ec:434:    object_property_add(obj, "odr3", "uint32",=
=20
>aspeed_kcs_get_register_property,
>hw/misc/aspeed_lpc=2Ec:436:    object_property_add(obj, "str3", "uint32",=
=20
>aspeed_kcs_get_register_property,
>hw/misc/aspeed_lpc=2Ec:438:    object_property_add(obj, "idr4", "uint32",=
=20
>aspeed_kcs_get_register_property,
>hw/misc/aspeed_lpc=2Ec:440:    object_property_add(obj, "odr4", "uint32",=
=20
>aspeed_kcs_get_register_property,
>hw/misc/aspeed_lpc=2Ec:442:    object_property_add(obj, "str4", "uint32",=
=20
>aspeed_kcs_get_register_property,
>hw/misc/npcm7xx_mft=2Ec:493:        object_property_add(obj, "max_rpm[*]"=
,=20
>"uint32",
>hw/nvme/ctrl=2Ec:6856:    object_property_add(obj,=20
>"smart_critical_warning", "uint8",
>hw/pci-host/q35=2Ec:224:    object_property_add(obj,=20
>PCI_HOST_PROP_PCI_HOLE_START, "uint32",
>hw/pci-host/q35=2Ec:228:    object_property_add(obj,=20
>PCI_HOST_PROP_PCI_HOLE_END, "uint32",
>hw/pci-host/q35=2Ec:232:    object_property_add(obj,=20
>PCI_HOST_PROP_PCI_HOLE64_START, "uint64",
>hw/pci-host/q35=2Ec:236:    object_property_add(obj,=20
>PCI_HOST_PROP_PCI_HOLE64_END, "uint64",
>hw/ppc/spapr_drc=2Ec:584:    object_property_add(obj, "index", "uint32",=
=20
>prop_get_index,
>hw/riscv/sifive_u=2Ec:736:    object_property_add(obj, "msel", "uint32",
>hw/riscv/sifive_u=2Ec:743:    object_property_add(obj, "serial", "uint32"=
,
>hw/sensor/adm1272=2Ec:497:    object_property_add(obj, "vin", "uint16",
>hw/sensor/adm1272=2Ec:501:    object_property_add(obj, "vout", "uint16",
>hw/sensor/adm1272=2Ec:505:    object_property_add(obj, "iout", "uint16",
>hw/sensor/adm1272=2Ec:509:    object_property_add(obj, "pin", "uint16",
>hw/sensor/max34451=2Ec:730:        object_property_add(obj, "vout[*]",=20
>"uint16",
>hw/sensor/max34451=2Ec:740:        object_property_add(obj,=20
>"temperature[*]", "uint16",
>hw/vfio/pci-quirks=2Ec:1621:    object_property_add(OBJECT(vdev),=20
>"nvlink2-tgt", "uint64",
>hw/vfio/pci-quirks=2Ec:1682:    object_property_add(OBJECT(vdev),=20
>"nvlink2-tgt", "uint64",
>hw/vfio/pci-quirks=2Ec:1688:    object_property_add(OBJECT(vdev),=20
>"nvlink2-link-speed", "uint32",
>net/colo-compare=2Ec:1390:    object_property_add(obj, "compare_timeout",=
=20
>"uint64",
>net/colo-compare=2Ec:1394:    object_property_add(obj,=20
>"expired_scan_cycle", "uint32",
>net/colo-compare=2Ec:1398:    object_property_add(obj, "max_queue_size",=
=20
>"uint32",
>softmmu/memory=2Ec:1262:    object_property_add(OBJECT(mr), "priority",=
=20
>"uint32",
>softmmu/memory=2Ec:1266:    object_property_add(OBJECT(mr), "size", "uint=
64",
>target/arm/cpu64=2Ec:863:    object_property_add(obj, "sve-max-vq",=20
>"uint32", cpu_max_get_sve_max_vq,
>tests/unit/test-qdev-global-props=2Ec:155:    object_property_add(obj,=20
>"prop1", "uint32", prop1_accessor, prop1_accessor,
>tests/unit/test-qdev-global-props=2Ec:157:    object_property_add(obj,=20
>"prop2", "uint32", prop2_accessor, prop2_accessor,
>
>[*] https://coccinelle=2Egitlabpages=2Einria=2Efr/website/


