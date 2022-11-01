Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 547C861505F
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Nov 2022 18:16:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1optbu-0000rg-Ti; Tue, 01 Nov 2022 11:55:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1optbn-0000qm-Ly
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 11:55:23 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1optbe-0002OU-Jo
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 11:55:20 -0400
Received: from frapeml100004.china.huawei.com (unknown [172.18.147.207])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4N1vgn59fTz687x5;
 Tue,  1 Nov 2022 23:53:25 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (7.191.163.240) by
 frapeml100004.china.huawei.com (7.182.85.167) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 1 Nov 2022 16:55:07 +0100
Received: from localhost (10.122.247.231) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Tue, 1 Nov
 2022 15:55:06 +0000
Date: Tue, 1 Nov 2022 15:55:05 +0000
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: Stefan Hajnoczi <stefanha@gmail.com>, <qemu-devel@nongnu.org>, "Peter
 Maydell" <peter.maydell@linaro.org>, Hesham Almatary
 <hesham.almatary@huawei.com>
Subject: Re: HMAT patches failure (was Re: [PULL 00/86] pci,pc,virtio:
 features, tests, fixes, cleanups)
Message-ID: <20221101155505.000003fe@huawei.com>
In-Reply-To: <20221101063027-mutt-send-email-mst@kernel.org>
References: <20221031124928.128475-1-mst@redhat.com>
 <CAJSP0QXz+7Yvde1-N4OjQQ+Vo95UsQoOONmRXQsBg8wEJFaC3g@mail.gmail.com>
 <20221101063027-mutt-send-email-mst@kernel.org>
Organization: Huawei Technologies R&D (UK) Ltd.
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.122.247.231]
X-ClientProxiedBy: lhrpeml100004.china.huawei.com (7.191.162.219) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Reply-to:  Jonathan Cameron <Jonathan.Cameron@huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, 1 Nov 2022 06:32:05 -0400
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Mon, Oct 31, 2022 at 04:06:03PM -0400, Stefan Hajnoczi wrote:
> > Here is another CI failure:
> >=20
> > qemu-system-i386: current -smp configuration requires kernel irqchip
> > and X2APIC API support.
> > Broken pipe
> > ../tests/qtest/libqtest.c:179: kill_qemu() tried to terminate QEMU
> > process but encountered exit status 1 (expected 0)
> > TAP parsing error: Too few tests run (expected 49, got 22)

Got a bit thrown by this which is unrelated to the HMAT series.  Given I bi=
sected it...

   bios-tables-test: add test for number of cores > 255
seems to be issue.  I'll take a look into why shortly.


> > (test program exited with status code -6)
> > =E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95
> > 6/202 qemu:qtest+qtest-i386 / qtest-i386/test-hmp OK 7.46s 9 subtests p=
assed
> > =E2=96=B6 7/202 ERROR:../tests/qtest/bios-tables-test.c:533:test_acpi_a=
sl:
> > assertion failed: (all_tables_match) ERROR
> > 7/202 qemu:qtest+qtest-aarch64 / qtest-aarch64/bios-tables-test ERROR
> > 108.34s killed by signal 6 SIGABRT =20
> > >>> G_TEST_DBUS_DAEMON=3D/builds/qemu-project/qemu/tests/dbus-vmstate-d=
aemon.sh QTEST_QEMU_BINARY=3D./qemu-system-aarch64 MALLOC_PERTURB_=3D89 /bu=
ilds/qemu-project/qemu/build/tests/qtest/bios-tables-test --tap -k =20
> > =E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95 =E2=9C=80 =E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=
=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=
=E2=80=95
> > stderr:
> > acpi-test: Warning! APIC binary file mismatch. Actual
> > [aml:/tmp/aml-UKB6U1], Expected
> > [aml:tests/data/acpi/virt/APIC.acpihmatvirt].
> > See source file tests/qtest/bios-tables-test.c for instructions on how
> > to update expected files.
> > to see ASL diff between mismatched files install IASL, rebuild QEMU
> > from scratch and re-run tests with V=3D1 environment variable set**
> > ERROR:../tests/qtest/bios-tables-test.c:533:test_acpi_asl: assertion
> > failed: (all_tables_match)

Ah. I'd failed to notice you said to drop first patch. Now replicating.
Looks like the tables introduced for HMAT need updating to take into account
changes made earlier in your pull request (version numbers etc)


Jonathan

> > (test program exited with status code -6)
> >=20
> > https://gitlab.com/qemu-project/qemu/-/jobs/3253817453 =20
>=20
>=20
> Hesham Jonathan pls take a look, if you post a fixup today
> or early tomorrow I can squash it
> and then this patchset can still be included in the release.
>=20
> Thanks!
>=20


