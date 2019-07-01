Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F04BB13C92
	for <lists+qemu-devel@lfdr.de>; Sun,  5 May 2019 03:20:30 +0200 (CEST)
Received: from localhost ([127.0.0.1]:34854 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hN5pO-0008M9-5r
	for lists+qemu-devel@lfdr.de; Sat, 04 May 2019 21:20:30 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51765)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1hN5no-00080T-Ly
	for qemu-devel@nongnu.org; Sat, 04 May 2019 21:18:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1hN5nn-0007Aj-M8
	for qemu-devel@nongnu.org; Sat, 04 May 2019 21:18:52 -0400
Received: from mga09.intel.com ([134.134.136.24]:21931)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
	id 1hN5nn-0007A6-Cy
	for qemu-devel@nongnu.org; Sat, 04 May 2019 21:18:51 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 May 2019 18:18:49 -0700
X-ExtLoop1: 1
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
	by orsmga002.jf.intel.com with ESMTP; 04 May 2019 18:18:47 -0700
Date: Sun, 5 May 2019 09:18:21 +0800
From: Wei Yang <richardw.yang@linux.intel.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20190505011821.GC20071@richard>
References: <1556808723-226478-1-git-send-email-imammedo@redhat.com>
	<1556808723-226478-5-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1556808723-226478-5-git-send-email-imammedo@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 134.134.136.24
Subject: Re: [Qemu-devel] [PATCH v4 04/15] tests: acpi: make pointer to RSDP
 64bit
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Wei Yang <richardw.yang@linux.intel.com>
Cc: Andrew Jones <drjones@redhat.com>, Ben Warren <ben@skyportsystems.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Laszlo Ersek <lersek@redhat.com>, qemu-devel@nongnu.org,
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	linuxarm@huawei.com, Shannon Zhao <shannon.zhaosl@gmail.com>,
	Gonglei <arei.gonglei@huawei.com>,
	Wei Yang <richardw.yang@linux.intel.com>, xuwei5@huawei.com,
	xuwei5@hisilicon.com,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, May 02, 2019 at 04:51:52PM +0200, Igor Mammedov wrote:
>In case of UEFI, RSDP doesn't have to be located in lowmem,
>it could be placed at any address. Make sure that test won't
>break if it is placed above the first 4Gb of address space.
>
>PS:
>While at it cleanup some local variables as we don't really
>need them.
>
>Signed-off-by: Igor Mammedov <imammedo@redhat.com>
>Reviewed-by: Philippe Mathieu-Daud� <philmd@redhat.com>

Reviewed-by: Wei Yang <richardw.yang@linux.intel.com>

>---
>v4:
> - move acpi_fetch_rsdp_table(s/uint32_t addr/uint64_t addr/) to
>   this patch where it belongs from
>   "tests: acpi: make RSDT test routine handle XSDT"
>   (Wei Yang <richardw.yang@linux.intel.com>)
>v2:
>  - s/In case of UEFI/In case of UEFI,/ (Laszlo Ersek <lersek@redhat.com>)
>---
> tests/acpi-utils.h       |  2 +-
> tests/acpi-utils.c       |  2 +-
> tests/bios-tables-test.c | 10 ++++------
> 3 files changed, 6 insertions(+), 8 deletions(-)
>
>diff --git a/tests/acpi-utils.h b/tests/acpi-utils.h
>index f55ccf9..1da6c10 100644
>--- a/tests/acpi-utils.h
>+++ b/tests/acpi-utils.h
>@@ -46,7 +46,7 @@ typedef struct {
> 
> uint8_t acpi_calc_checksum(const uint8_t *data, int len);
> uint32_t acpi_find_rsdp_address(QTestState *qts);
>-void acpi_fetch_rsdp_table(QTestState *qts, uint32_t addr, uint8_t *rsdp_table);
>+void acpi_fetch_rsdp_table(QTestState *qts, uint64_t addr, uint8_t *rsdp_table);
> void acpi_fetch_table(QTestState *qts, uint8_t **aml, uint32_t *aml_len,
>                       const uint8_t *addr_ptr, int addr_size, const char *sig,
>                       bool verify_checksum);
>diff --git a/tests/acpi-utils.c b/tests/acpi-utils.c
>index a0d49c4..c216b9e 100644
>--- a/tests/acpi-utils.c
>+++ b/tests/acpi-utils.c
>@@ -51,7 +51,7 @@ uint32_t acpi_find_rsdp_address(QTestState *qts)
>     return off;
> }
> 
>-void acpi_fetch_rsdp_table(QTestState *qts, uint32_t addr, uint8_t *rsdp_table)
>+void acpi_fetch_rsdp_table(QTestState *qts, uint64_t addr, uint8_t *rsdp_table)
> {
>     uint8_t revision;
> 
>diff --git a/tests/bios-tables-test.c b/tests/bios-tables-test.c
>index d6ab121..a164d27 100644
>--- a/tests/bios-tables-test.c
>+++ b/tests/bios-tables-test.c
>@@ -26,7 +26,7 @@
> typedef struct {
>     const char *machine;
>     const char *variant;
>-    uint32_t rsdp_addr;
>+    uint64_t rsdp_addr;
>     uint8_t rsdp_table[36 /* ACPI 2.0+ RSDP size */];
>     GArray *tables;
>     uint32_t smbios_ep_addr;
>@@ -86,13 +86,11 @@ static void test_acpi_rsdp_address(test_data *data)
> 
> static void test_acpi_rsdp_table(test_data *data)
> {
>-    uint8_t *rsdp_table = data->rsdp_table, revision;
>-    uint32_t addr = data->rsdp_addr;
>+    uint8_t *rsdp_table = data->rsdp_table;
> 
>-    acpi_fetch_rsdp_table(data->qts, addr, rsdp_table);
>-    revision = rsdp_table[15 /* Revision offset */];
>+    acpi_fetch_rsdp_table(data->qts, data->rsdp_addr, rsdp_table);
> 
>-    switch (revision) {
>+    switch (rsdp_table[15 /* Revision offset */]) {
>     case 0: /* ACPI 1.0 RSDP */
>         /* With rev 1, checksum is only for the first 20 bytes */
>         g_assert(!acpi_calc_checksum(rsdp_table,  20));
>-- 
>2.7.4

-- 
Wei Yang
Help you, Help me

