Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4965461ED04
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Nov 2022 09:38:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orxdG-0006T6-Tc; Mon, 07 Nov 2022 03:37:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1orxce-0006Ik-MK
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 03:36:52 -0500
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1orxcW-0003DR-MT
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 03:36:44 -0500
Received: by mail-io1-xd2d.google.com with SMTP id b2so8233213iof.12
 for <qemu-devel@nongnu.org>; Mon, 07 Nov 2022 00:36:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vWvFkMzbNfuN3T9ycmOR3Ly7KRh745p0B2y401uZoc4=;
 b=b5ZFVYujkco3kHZTqOQwvtRshd1u22JLx119PykUlx1EbjsZTqWAVa1y7erzAJkQHP
 ohdLo+eOKn6WzQzuqgOncWU9+z3xp53INZuq23NElF7Po7dxlT7kKWjwu6Kepy5UlcSL
 P8Q5qqacTQvw4Q0FB/fxQoUrnCy0xhnabOJCJohejk4E8v2ku6KfTeBKoQaGI2/k9mAI
 b05Y3PHSv9a+wtGoiFFNJHZb4ufetDECOI2x07poLGNj2MBG3ql87kNp+ppm7nznelWk
 jp2kGKJSY7M41A0uq30f2GpBVZFJn8fDO/KAYAgI1baVuI8kA6BwgZpTdrl9ooADrix8
 B6ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vWvFkMzbNfuN3T9ycmOR3Ly7KRh745p0B2y401uZoc4=;
 b=N5jmVNQRQUliGnf0uHMb9HnAGervKKN1Ii3BsbE3GqcETYLvPxN+QrtY3Ifsb9uiO0
 6Y0UsJ/hicox3EUs14K/xFpL1RpMIgAXdnpczfauz35mKDxetPZeIrUxoAq0ZzVGo6t6
 k3MrNo6SzdVvfmjzImqgnl8sGsl881sdv1fwphJRK7KGWQvGD/VA2hjtgWQNhZ5sUwGo
 Q8fi98QQvD2WACvFcz9eikVA6F949dfCLEOKGGX5UpBI67jhNaCAufIEU0LNgVpx7wVO
 uEVw/U3wQMze+NtipvPrUpbrDKEV3jt4JZNvRbUdoEvKbEKDf9x+1dwSd6EQd8CXVVqi
 Lvzw==
X-Gm-Message-State: ACrzQf3PlWs/1T/uNicdJH0TAq1BBJDTQhGIx18yALwbvzqpq08mYve7
 rUltuqAqFcprpc/trLVRTESJJtFu2w7QqYnzdnHDyw==
X-Google-Smtp-Source: AMsMyM4uJ7KnjuRVtg4NbzMZDULHdGEj2OJYsFzsgQNs0L5HJKTyzWeFvXq1EE1X3Gt2yqw8ToAw7710FT4RpjtMvpM=
X-Received: by 2002:a05:6602:346:b0:6bb:f236:ae68 with SMTP id
 w6-20020a056602034600b006bbf236ae68mr28660644iou.161.1667810194937; Mon, 07
 Nov 2022 00:36:34 -0800 (PST)
MIME-Version: 1.0
References: <20221105171116.432921-1-mst@redhat.com>
 <20221105171116.432921-51-mst@redhat.com>
 <CAG4p6K64=LmX75NP4mYX7OFrSqKxsh3nVBzguOj3GvxbH1NwuQ@mail.gmail.com>
In-Reply-To: <CAG4p6K64=LmX75NP4mYX7OFrSqKxsh3nVBzguOj3GvxbH1NwuQ@mail.gmail.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Mon, 7 Nov 2022 14:06:23 +0530
Message-ID: <CAARzgwzau9EjyMmxX6AZG+Z+DT5oOaKBAH0QgZVJtu5LTM3nEg@mail.gmail.com>
Subject: Re: [PULL v3 50/81] tests: acpi: whitelist DSDT before generating
 PCI-ISA bridge AML automatically
To: Bernhard Beschow <shentey@gmail.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org, 
 Peter Maydell <peter.maydell@linaro.org>, Igor Mammedov <imammedo@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: none client-ip=2607:f8b0:4864:20::d2d;
 envelope-from=ani@anisinha.ca; helo=mail-io1-xd2d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Nov 7, 2022 at 3:18 AM Bernhard Beschow <shentey@gmail.com> wrote:
>
>
>
> On Sat, Nov 5, 2022 at 6:27 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>>
>> From: Igor Mammedov <imammedo@redhat.com>
>>
>> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
>> Message-Id: <20221017102146.2254096-3-imammedo@redhat.com>
>> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
>> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
>> ---
>>  tests/qtest/bios-tables-test-allowed-diff.h | 34 +++++++++++++++++++++
>>  1 file changed, 34 insertions(+)
>>
>> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/b=
ios-tables-test-allowed-diff.h
>> index dfb8523c8b..570b17478e 100644
>> --- a/tests/qtest/bios-tables-test-allowed-diff.h
>> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
>> @@ -1 +1,35 @@
>>  /* List of comma-separated changed AML files to ignore */
>> +"tests/data/acpi/pc/DSDT",
>> +"tests/data/acpi/pc/DSDT.acpierst",
>> +"tests/data/acpi/pc/DSDT.acpihmat",
>> +"tests/data/acpi/pc/DSDT.bridge",
>> +"tests/data/acpi/pc/DSDT.cphp",
>> +"tests/data/acpi/pc/DSDT.dimmpxm",
>> +"tests/data/acpi/pc/DSDT.hpbridge",
>> +"tests/data/acpi/pc/DSDT.hpbrroot",
>> +"tests/data/acpi/pc/DSDT.ipmikcs",
>> +"tests/data/acpi/pc/DSDT.memhp",
>> +"tests/data/acpi/pc/DSDT.nohpet",
>> +"tests/data/acpi/pc/DSDT.numamem",
>> +"tests/data/acpi/pc/DSDT.roothp",
>> +"tests/data/acpi/q35/DSDT",
>> +"tests/data/acpi/q35/DSDT.acpierst",
>> +"tests/data/acpi/q35/DSDT.acpihmat",
>> +"tests/data/acpi/q35/DSDT.applesmc",
>> +"tests/data/acpi/q35/DSDT.bridge",
>
>
> +"tests/data/acpi/q35/DSDT.core-count2"
>
> ... and probably in more patches down the road.

Yes I am seeing this failure too:

68/600 qemu:qtest+qtest-x86_64 / qtest-x86_64/bios-tables-test
                   ERROR          39.95s   killed by signal 6 SIGABRT
>>> QTEST_QEMU_IMG=3D./qemu-img QTEST_QEMU_STORAGE_DAEMON_BINARY=3D./storag=
e-daemon/qemu-storage-daemon MALLOC_PERTURB_=3D138 G_TEST_DBUS_DAEMON=3D/ho=
me/anisinha/workspace/qemu-ani/tests/dbus-vmstate-daemon.sh QTEST_QEMU_BINA=
RY=3D./qemu-system-x86_64 /home/anisinha/workspace/qemu-ani/build/tests/qte=
st/bios-tables-test --tap -k
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95
=E2=9C=80  =E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95
stderr:
acpi-test: Warning! DSDT binary file mismatch. Actual
[aml:/tmp/aml-ARFCV1], Expected
[aml:tests/data/acpi/q35/DSDT.core-count2].
See source file tests/qtest/bios-tables-test.c for instructions on how
to update expected files.
acpi-test: Warning! DSDT mismatch. Actual [asl:/tmp/asl-NTFCV1.dsl,
aml:/tmp/aml-ARFCV1], Expected [asl:/tmp/asl-15QEV1.dsl,
aml:tests/data/acpi/q35/DSDT.core-count2].
**
ERROR:../tests/qtest/bios-tables-test.c:533:test_acpi_asl: assertion
failed: (all_tables_match)



>
> Best regards,
> Bernhard
>
>> +"tests/data/acpi/q35/DSDT.cphp",
>> +"tests/data/acpi/q35/DSDT.cxl",
>> +"tests/data/acpi/q35/DSDT.dimmpxm",
>> +"tests/data/acpi/q35/DSDT.ipmibt",
>> +"tests/data/acpi/q35/DSDT.ipmismbus",
>> +"tests/data/acpi/q35/DSDT.ivrs",
>> +"tests/data/acpi/q35/DSDT.memhp",
>> +"tests/data/acpi/q35/DSDT.mmio64",
>> +"tests/data/acpi/q35/DSDT.multi-bridge",
>> +"tests/data/acpi/q35/DSDT.nohpet",
>> +"tests/data/acpi/q35/DSDT.numamem",
>> +"tests/data/acpi/q35/DSDT.pvpanic-isa",
>> +"tests/data/acpi/q35/DSDT.tis.tpm12",
>> +"tests/data/acpi/q35/DSDT.tis.tpm2",
>> +"tests/data/acpi/q35/DSDT.viot",
>> +"tests/data/acpi/q35/DSDT.xapic",
>> --
>> MST
>>
>>

