Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 060D2139940
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jan 2020 19:47:20 +0100 (CET)
Received: from localhost ([::1]:54416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ir4kA-0003Qa-RR
	for lists+qemu-devel@lfdr.de; Mon, 13 Jan 2020 13:47:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57204)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <drjones@redhat.com>) id 1ir4ix-0002He-M2
 for qemu-devel@nongnu.org; Mon, 13 Jan 2020 13:46:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <drjones@redhat.com>) id 1ir4iw-0004Bj-1W
 for qemu-devel@nongnu.org; Mon, 13 Jan 2020 13:46:03 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:55483
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <drjones@redhat.com>) id 1ir4iv-0004Au-ST
 for qemu-devel@nongnu.org; Mon, 13 Jan 2020 13:46:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578941161;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Q4ObEYBRxIr5fchCJoZYCDsLE6HuwS5q2rVELGd2+v8=;
 b=Qvurka2NdniY5SezkqIhOQAkCeNqN5bWScV1OuKE7tE/5V8zYoD+X/Et+un8UXa8qlUBTE
 +8PWWwKTVn25ngRGV8+I6saN6t234lCaVVt3/G3MmNr/FX87CilOEuM0NuLJB69AW0piED
 9DbfqdW+X64EUCS1F8PUdYLhzkCWHJk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-225-AyAcUEL0MdqFSFd0TkEsxw-1; Mon, 13 Jan 2020 13:45:56 -0500
X-MC-Unique: AyAcUEL0MdqFSFd0TkEsxw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5C1AF18557F1;
 Mon, 13 Jan 2020 18:45:54 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F031160BE2;
 Mon, 13 Jan 2020 18:45:49 +0000 (UTC)
Date: Mon, 13 Jan 2020 19:45:47 +0100
From: Andrew Jones <drjones@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [kvm-unit-tests PATCH v2 16/16] arm/arm64: ITS: pending table
 migration test
Message-ID: <20200113184547.zqilrexm27hpkkou@kamzik.brq.redhat.com>
References: <20200110145412.14937-1-eric.auger@redhat.com>
 <20200110145412.14937-17-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200110145412.14937-17-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, kvm@vger.kernel.org,
 maz@kernel.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 andre.przywara@arm.com, yuzenghui@huawei.com, alexandru.elisei@arm.com,
 kvmarm@lists.cs.columbia.edu, eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 10, 2020 at 03:54:12PM +0100, Eric Auger wrote:
> Add two new migration tests. One testing the migration of
> a topology where collection were unmapped. The second test
> checks the migration of the pending table.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>  arm/gic.c         | 148 ++++++++++++++++++++++++++++++++++++++++++++++
>  arm/unittests.cfg |  16 ++++-
>  2 files changed, 163 insertions(+), 1 deletion(-)
> 
> diff --git a/arm/gic.c b/arm/gic.c
> index bf4b5ba..cb976c3 100644
> --- a/arm/gic.c
> +++ b/arm/gic.c
> @@ -170,6 +170,7 @@ static void lpi_handler(struct pt_regs *regs __unused)
>  	smp_rmb(); /* pairs with wmb in lpi_stats_expect */
>  	lpi_stats.observed.cpu_id = smp_processor_id();
>  	lpi_stats.observed.lpi_id = irqnr;
> +	acked[lpi_stats.observed.cpu_id]++;
>  	smp_wmb(); /* pairs with rmb in check_lpi_stats */
>  }
>  
> @@ -207,6 +208,18 @@ static void check_lpi_stats(void)
>  	}
>  }
>  
> +static void check_lpi_hits(int *expected)
> +{
> +	int i;
> +
> +	for (i = 0; i < nr_cpus; i++) {
> +		if (acked[i] != expected[i])
> +			report(false, "expected %d LPIs on PE #%d, %d observed",
> +			       expected[i], i, acked[i]);
> +		}
> +	report(true, "check LPI on all vcpus");
> +}
> +
>  static void gicv2_ipi_send_self(void)
>  {
>  	writel(2 << 24 | IPI_IRQ, gicv2_dist_base() + GICD_SGIR);
> @@ -641,6 +654,18 @@ static int its_prerequisites(int nb_cpus)
>  	return 0;
>  }
>  
> +static void set_lpi(struct its_device *dev, u32 eventid, u32 physid,
> +		    struct its_collection *col)
> +{
> +	if (!dev || !col)
> +		report_abort("wrong device or collection");
> +
> +	its_send_mapti(dev, physid, eventid, col);
> +
> +	set_lpi_config(physid, LPI_PROP_DEFAULT);
> +	its_send_invall(col);
> +}
> +
>  /*
>   * Setup the configuration for those mappings:
>   * dev_id=2 event=20 -> vcpu 3, intid=8195
> @@ -765,6 +790,121 @@ static void test_its_migration(void)
>  	check_lpi_stats();
>  }
>  
> +static void test_migrate_unmapped_collection(void)
> +{
> +	struct its_collection *col;
> +	struct its_device *dev2, *dev7;
> +	u8 config;
> +
> +	if (its_setup1())
> +		return;
> +
> +	col = its_create_collection(nr_cpus - 1, nr_cpus - 1);
> +	dev2 = its_get_device(2);
> +	dev7 = its_get_device(7);
> +
> +	/* MAPTI with the collection unmapped */
> +	set_lpi(dev2, 0, 8192, col);
> +
> +	puts("Now migrate the VM, then press a key to continue...\n");
> +	(void)getchar();
> +	report(true, "Migration complete");
> +
> +	/* on the destination, map the collection */
> +	its_send_mapc(col, true);
> +
> +	lpi_stats_expect(2, 8196);
> +	its_send_int(dev7, 255);
> +	check_lpi_stats();
> +
> +	config = get_lpi_config(8192);
> +	report(config == LPI_PROP_DEFAULT,
> +	       "Config of LPI 8192 was properly migrated");
> +
> +	lpi_stats_expect(nr_cpus - 1, 8192);
> +	its_send_int(dev2, 0);
> +	check_lpi_stats();
> +
> +	/* unmap the collection */
> +	its_send_mapc(col, false);
> +
> +	lpi_stats_expect(-1, -1);
> +	its_send_int(dev2, 0);
> +	check_lpi_stats();
> +
> +	/* remap event 0 onto lpiid 8193 */
> +	set_lpi(dev2, 0, 8193, col);
> +	lpi_stats_expect(-1, -1);
> +	its_send_int(dev2, 0);
> +	check_lpi_stats();
> +
> +	/* remap the collection */
> +	its_send_mapc(col, true);
> +	lpi_stats_expect(nr_cpus - 1, 8193);
> +}
> +
> +static void test_its_pending_migration(void)
> +{
> +	struct its_device *dev;
> +	struct its_collection *collection[2];
> +	int expected[NR_CPUS];
> +	u64 pendbaser;
> +	void *ptr;
> +	int i;
> +
> +	if (its_prerequisites(4))
> +		return;
> +
> +	dev = its_create_device(2 /* dev id */, 8 /* nb_ites */);
> +	its_send_mapd(dev, true);
> +
> +	collection[0] = its_create_collection(nr_cpus - 1, nr_cpus - 1);
> +	collection[1] = its_create_collection(nr_cpus - 2, nr_cpus - 2);
> +	its_send_mapc(collection[0], true);
> +	its_send_mapc(collection[1], true);
> +
> +	/* disable lpi at redist level */
> +	gicv3_rdist_ctrl_lpi(nr_cpus - 1, false);
> +	gicv3_rdist_ctrl_lpi(nr_cpus - 2, false);
> +
> +	/* even lpis are assigned to even cpu */
> +	for (i = 0; i < 256; i++) {
> +		struct its_collection *col = i % 2 ? collection[0] :
> +						     collection[1];
> +		int vcpu = col->target_address >> 16;
> +
> +		its_send_mapti(dev, 8192 + i, i, col);
> +		set_lpi_config(8192 + i, LPI_PROP_DEFAULT);
> +		set_pending_table_bit(vcpu, 8192 + i, true);
> +	}
> +	its_send_invall(collection[0]);
> +	its_send_invall(collection[1]);
> +
> +	/* Set the PTZ bit on each pendbaser */
> +
> +	expected[nr_cpus - 1] = 128;
> +	expected[nr_cpus - 2] = 128;
> +
> +	ptr = gicv3_data.redist_base[nr_cpus - 1] + GICR_PENDBASER;
> +	pendbaser = readq(ptr);
> +	writeq(pendbaser & ~GICR_PENDBASER_PTZ, ptr);
> +
> +	ptr = gicv3_data.redist_base[nr_cpus - 2] + GICR_PENDBASER;
> +	pendbaser = readq(ptr);
> +	writeq(pendbaser & ~GICR_PENDBASER_PTZ, ptr);
> +
> +	gicv3_rdist_ctrl_lpi(nr_cpus - 1, true);
> +	gicv3_rdist_ctrl_lpi(nr_cpus - 2, true);
> +
> +	puts("Now migrate the VM, then press a key to continue...\n");
> +	(void)getchar();
> +	report(true, "Migration complete");
> +
> +	mdelay(1000);
> +
> +	check_lpi_hits(expected);
> +}
> +
>  int main(int argc, char **argv)
>  {
>  	if (!gic_init()) {
> @@ -803,6 +943,14 @@ int main(int argc, char **argv)
>  		report_prefix_push(argv[1]);
>  		test_its_migration();
>  		report_prefix_pop();
> +	} else if (!strcmp(argv[1], "its-pending-migration")) {
> +		report_prefix_push(argv[1]);
> +		test_its_pending_migration();
> +		report_prefix_pop();
> +	} else if (!strcmp(argv[1], "its-migrate-unmapped-collection")) {
> +		report_prefix_push(argv[1]);
> +		test_migrate_unmapped_collection();
> +		report_prefix_pop();
>  	} else if (strcmp(argv[1], "its-introspection") == 0) {
>  		report_prefix_push(argv[1]);
>  		test_its_introspection();
> diff --git a/arm/unittests.cfg b/arm/unittests.cfg
> index 29e2efc..911f0b7 100644
> --- a/arm/unittests.cfg
> +++ b/arm/unittests.cfg
> @@ -145,7 +145,21 @@ file = gic.flat
>  smp = $MAX_SMP
>  accel = kvm
>  extra_params = -machine gic-version=3 -append 'its-migration'
> -groups = its migration
> +groups = migration
> +
> +[its-pending-migration]
> +file = gic.flat
> +smp = $MAX_SMP
> +accel = kvm
> +extra_params = -machine gic-version=3 -append 'its-pending-migration'
> +groups = migration
> +
> +[its-migrate-unmapped-collection]
> +file = gic.flat
> +smp = $MAX_SMP
> +accel = kvm
> +extra_params = -machine gic-version=3 -append 'its-migrate-unmapped-collection'
> +groups = migration

Why drop the 'its' group?

Thanks,
drew

>  
>  # Test PSCI emulation
>  [psci]
> -- 
> 2.20.1
> 


