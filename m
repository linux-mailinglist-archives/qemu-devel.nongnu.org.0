Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 476B7AFE1C
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Sep 2019 15:51:37 +0200 (CEST)
Received: from localhost ([::1]:51312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i8320-0008KY-CP
	for lists+qemu-devel@lfdr.de; Wed, 11 Sep 2019 09:51:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35758)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1i830x-0007nZ-AK
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 09:50:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1i830w-0002ct-7r
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 09:50:31 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54822)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>)
 id 1i830u-0002au-1F; Wed, 11 Sep 2019 09:50:28 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 30259368FF;
 Wed, 11 Sep 2019 13:50:27 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A3B705C21E;
 Wed, 11 Sep 2019 13:50:16 +0000 (UTC)
Date: Wed, 11 Sep 2019 15:50:15 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20190911155015.3627b072@redhat.com>
In-Reply-To: <CAFEAcA8sEhgOXnj-DGo04pSnpTObO+EeC94yrdGEikKq0=2QeA@mail.gmail.com>
References: <20190904085629.13872-1-shameerali.kolothum.thodi@huawei.com>
 <20190904085629.13872-11-shameerali.kolothum.thodi@huawei.com>
 <CAFEAcA8sEhgOXnj-DGo04pSnpTObO+EeC94yrdGEikKq0=2QeA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.30]); Wed, 11 Sep 2019 13:50:27 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH-for-4.2 v10 10/11] tests: add dummy ACPI
 tables for arm/virt board
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
Cc: Samuel Ortiz <sameo@linux.intel.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>, mst@redhat.com,
 QEMU Developers <qemu-devel@nongnu.org>, Xu Wei <xuwei5@hisilicon.com>,
 Linuxarm <linuxarm@huawei.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm <qemu-arm@nongnu.org>,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 Eric Auger <eric.auger@redhat.com>, sebastien.boeuf@intel.com,
 Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 11 Sep 2019 13:57:06 +0100
Peter Maydell <peter.maydell@linaro.org> wrote:

> On Wed, 4 Sep 2019 at 09:58, Shameer Kolothum
> <shameerali.kolothum.thodi@huawei.com> wrote:
> >
> > This patch is in preparation for adding numamem and memhp tests
> > to arm/virt board so that 'make check' is happy. This may not
> > be required once the scripts are run and new tables are
> > generated with ".numamem" and ".memhp" extensions.
> >
> > Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> > ---
> > I am not sure this is the right way to do this. But without this, when
> > the numamem and memhp tests are added, you will get,
> >
> > Looking for expected file 'tests/data/acpi/virt/SRAT.numamem'
> > Looking for expected file 'tests/data/acpi/virt/SRAT'
> > **
> > ERROR:tests/bios-tables-test.c:327:load_expected_aml: assertion failed: (exp_sdt.aml_file)
> >
> > ---
> >  tests/data/acpi/virt/SLIT | Bin 0 -> 48 bytes
> >  tests/data/acpi/virt/SRAT | Bin 0 -> 224 bytes
> >  2 files changed, 0 insertions(+), 0 deletions(-)
> >  create mode 100644 tests/data/acpi/virt/SLIT
> >  create mode 100644 tests/data/acpi/virt/SRAT  
> 
> Do the tests pass with this patch and without the
> patch that adds the tests? (That is, can we keep the
> two patches separate without breaking bisection, or
> do we need to squash them together?)
> 
> I'll leave it to somebody who understands the ACPI
> tests stuff to answer whether there's a better way to
I'd squash this patch into 11/11 test case,
CCing Michael (since he's the one who applies ACPI patches)

> do this.
> 
> thanks
> -- PMM
> 


