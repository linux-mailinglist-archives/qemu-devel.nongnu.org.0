Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E24AFE0B
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Sep 2019 15:49:57 +0200 (CEST)
Received: from localhost ([::1]:51278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i830O-0006iV-VF
	for lists+qemu-devel@lfdr.de; Wed, 11 Sep 2019 09:49:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35090)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1i82xY-0004mO-6s
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 09:47:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1i82xX-0000hn-0u
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 09:47:00 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59188)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>)
 id 1i82xS-0000aG-Tz; Wed, 11 Sep 2019 09:46:55 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 8379118CB908;
 Wed, 11 Sep 2019 13:46:53 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6A6F410016EB;
 Wed, 11 Sep 2019 13:46:48 +0000 (UTC)
Date: Wed, 11 Sep 2019 15:46:46 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Message-ID: <20190911154646.624469f4@redhat.com>
In-Reply-To: <20190904085629.13872-12-shameerali.kolothum.thodi@huawei.com>
References: <20190904085629.13872-1-shameerali.kolothum.thodi@huawei.com>
 <20190904085629.13872-12-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.63]); Wed, 11 Sep 2019 13:46:53 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH-for-4.2 v10 11/11] tests: Add bios tests to
 arm/virt
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
Cc: peter.maydell@linaro.org, sameo@linux.intel.com, shannon.zhaosl@gmail.com,
 ard.biesheuvel@linaro.org, qemu-devel@nongnu.org, xuwei5@hisilicon.com,
 linuxarm@huawei.com, eric.auger@redhat.com, qemu-arm@nongnu.org,
 sebastien.boeuf@intel.com, lersek@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 4 Sep 2019 09:56:29 +0100
Shameer Kolothum <shameerali.kolothum.thodi@huawei.com> wrote:

> This adds numamem and memhp tests for arm/virt platform
> 
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  tests/bios-tables-test-allowed-diff.h |  1 +
>  tests/bios-tables-test.c              | 49 +++++++++++++++++++++++++++
>  2 files changed, 50 insertions(+)
> 
> diff --git a/tests/bios-tables-test-allowed-diff.h b/tests/bios-tables-test-allowed-diff.h
> index 7b4adbc822..d181a4da4a 100644
> --- a/tests/bios-tables-test-allowed-diff.h
> +++ b/tests/bios-tables-test-allowed-diff.h
> @@ -1,2 +1,3 @@
>  /* List of comma-separated changed AML files to ignore */
>  "tests/data/acpi/virt/DSDT",
> +"tests/data/acpi/virt/SRAT",
> diff --git a/tests/bios-tables-test.c b/tests/bios-tables-test.c
> index a356ac3489..1d6f330d53 100644
> --- a/tests/bios-tables-test.c
> +++ b/tests/bios-tables-test.c
> @@ -871,6 +871,53 @@ static void test_acpi_piix4_tcg_dimm_pxm(void)
>      test_acpi_tcg_dimm_pxm(MACHINE_PC);
>  }
>  
> +static void test_acpi_virt_tcg_memhp(void)
> +{
> +    test_data data = {
> +        .machine = "virt",
> +        .accel = "tcg",
> +        .uefi_fl1 = "pc-bios/edk2-aarch64-code.fd",
> +        .uefi_fl2 = "pc-bios/edk2-arm-vars.fd",
> +        .cd = "tests/data/uefi-boot-images/bios-tables-test.aarch64.iso.qcow2",
> +        .ram_start = 0x40000000ULL,
> +        .scan_len = 256ULL * 1024 * 1024,
> +    };
> +
> +    data.variant = ".memhp";
> +    test_acpi_one(" -cpu cortex-a57"
> +                  " -object memory-backend-ram,id=ram0,size=128M"
> +                  " -object memory-backend-ram,id=ram1,size=128M"
> +                  " -numa node,memdev=ram0 -numa node,memdev=ram1"
> +                  " -numa dist,src=0,dst=1,val=21",
> +                  &data);
> +
> +    free_test_data(&data);
> +
> +}
> +
> +static void test_acpi_virt_tcg_numamem(void)
> +{
> +    test_data data = {
> +        .machine = "virt",
> +        .accel = "tcg",
> +        .uefi_fl1 = "pc-bios/edk2-aarch64-code.fd",
> +        .uefi_fl2 = "pc-bios/edk2-arm-vars.fd",
> +        .cd = "tests/data/uefi-boot-images/bios-tables-test.aarch64.iso.qcow2",
> +        .ram_start = 0x40000000ULL,
> +        .scan_len = 128ULL * 1024 * 1024,
> +    };
> +
> +    data.variant = ".numamem";
> +    test_acpi_one(" -cpu cortex-a57"
> +                  " -object memory-backend-ram,id=ram0,size=128M"
> +                  " -numa node,memdev=ram0",
> +                  &data);
> +
> +    free_test_data(&data);
> +
> +}
> +
>  static void test_acpi_virt_tcg(void)
>  {
>      test_data data = {
> @@ -917,6 +964,8 @@ int main(int argc, char *argv[])
>          qtest_add_func("acpi/q35/dimmpxm", test_acpi_q35_tcg_dimm_pxm);
>      } else if (strcmp(arch, "aarch64") == 0) {
>          qtest_add_func("acpi/virt", test_acpi_virt_tcg);
> +        qtest_add_func("acpi/virt/numamem", test_acpi_virt_tcg_numamem);
> +        qtest_add_func("acpi/virt/memhp", test_acpi_virt_tcg_memhp);
>      }
>      ret = g_test_run();
>      boot_sector_cleanup(disk);


