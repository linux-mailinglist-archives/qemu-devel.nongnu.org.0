Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F6713BF779
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 11:19:50 +0200 (CEST)
Received: from localhost ([::1]:54098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1QCD-0002i1-FV
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 05:19:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1m1QBA-00022z-Ck
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 05:18:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32890)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1m1QB8-0002ad-C4
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 05:18:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625735921;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SH78PKCjYtCFQZePfGiGM3gOraoYVlnBRk+/txdXhaE=;
 b=WXUv4RuMor/oKIHQkUoHXq1cc7i/8PUwevKA44joc4EBz5ZoWLRnO+fA0eb4EX0kaQG4lB
 2RrO2izvo+DrzAceixeAFhUFoApPaHfOX6Xsx4A4PlaQKHxaWX5dqW0LEbu9yPXCL0TcdX
 eS5E5Eua9yZ6ve6MhLolXSZm3jBUmk4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-47-3K9DL2YFNSaetU_OWkgk2g-1; Thu, 08 Jul 2021 05:18:40 -0400
X-MC-Unique: 3K9DL2YFNSaetU_OWkgk2g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7496718D6A2A
 for <qemu-devel@nongnu.org>; Thu,  8 Jul 2021 09:18:39 +0000 (UTC)
Received: from localhost (unknown [10.43.2.75])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5BDB15C1C2;
 Thu,  8 Jul 2021 09:18:34 +0000 (UTC)
Date: Thu, 8 Jul 2021 11:18:33 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH 04/53] tests: acpi: q35: test for x2APIC entries in SRAT
Message-ID: <20210708111833.4e116fe4@redhat.com>
In-Reply-To: <20210702104441-mutt-send-email-mst@kernel.org>
References: <20210625091818.1047980-1-imammedo@redhat.com>
 <20210625091818.1047980-5-imammedo@redhat.com>
 <20210702104441-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.439,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: lvivier@redhat.com, thuth@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 2 Jul 2021 10:45:37 -0400
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Fri, Jun 25, 2021 at 05:17:28AM -0400, Igor Mammedov wrote:
> > Set -smp 1,maxcpus=288 to test for ACPI code that
> > deal with CPUs with large APIC ID (>255).
> > 
> > PS:
> > Test requires KVM and in-kernel irqchip support,
> > so skip test if KVM is not available.
> > 
> > Signed-off-by: Igor Mammedov <imammedo@redhat.com>  
> 
> Why don't we add a new test? Why change an existing one?
> And I'd prefer kvm in the name since it's kvm specific.
> E.g. kvmnumamem.

I've opted for changing existing one as it practically
tests the same ACPI code in 'pc' variant, so changing
q35 'duplicate' variant to handle more than 255 cpus
seemed reasonable to me.

Anyways, I don't have any preferences here so I can
easily change that to a new testcase if you still
prefer it.

as for name, I'll amend it on test respin.
 
> 
> > ---
> > v2:
> >   - switch to qtest_has_accel() API
> > 
> > CC: thuth@redhat.com
> > CC: lvivier@redhat.com
> > ---
> >  tests/qtest/bios-tables-test.c | 11 ++++++++---
> >  1 file changed, 8 insertions(+), 3 deletions(-)
> > 
> > diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> > index 51d3a4e239..ca496819fa 100644
> > --- a/tests/qtest/bios-tables-test.c
> > +++ b/tests/qtest/bios-tables-test.c
> > @@ -1021,7 +1021,7 @@ static void test_acpi_piix4_tcg_nohpet(void)
> >      free_test_data(&data);
> >  }
> >  
> > -static void test_acpi_q35_tcg_numamem(void)
> > +static void test_acpi_q35_kvm_numamem(void)
> >  {
> >      test_data data;
> >  
> > @@ -1029,7 +1029,9 @@ static void test_acpi_q35_tcg_numamem(void)
> >      data.machine = MACHINE_Q35;
> >      data.variant = ".numamem";
> >      test_acpi_one(" -object memory-backend-ram,id=ram0,size=128M"
> > -                  " -numa node -numa node,memdev=ram0", &data);
> > +                  " -numa node -numa node,memdev=ram0"
> > +                  " -machine kernel-irqchip=on -smp 1,maxcpus=288"
> > +                   , &data);
> >      free_test_data(&data);
> >  }
> >  
> > @@ -1506,6 +1508,7 @@ static void test_acpi_oem_fields_virt(void)
> >  int main(int argc, char *argv[])
> >  {
> >      const char *arch = qtest_get_arch();
> > +    const bool has_kvm = qtest_has_accel("kvm");
> >      int ret;
> >  
> >      g_test_init(&argc, &argv, NULL);
> > @@ -1536,7 +1539,6 @@ int main(int argc, char *argv[])
> >          qtest_add_func("acpi/piix4/memhp", test_acpi_piix4_tcg_memhp);
> >          qtest_add_func("acpi/q35/memhp", test_acpi_q35_tcg_memhp);
> >          qtest_add_func("acpi/piix4/numamem", test_acpi_piix4_tcg_numamem);
> > -        qtest_add_func("acpi/q35/numamem", test_acpi_q35_tcg_numamem);
> >          qtest_add_func("acpi/piix4/nosmm", test_acpi_piix4_tcg_nosmm);
> >          qtest_add_func("acpi/piix4/smm-compat",
> >                         test_acpi_piix4_tcg_smm_compat);
> > @@ -1561,6 +1563,9 @@ int main(int argc, char *argv[])
> >          if (strcmp(arch, "x86_64") == 0) {
> >              qtest_add_func("acpi/microvm/pcie", test_acpi_microvm_pcie_tcg);
> >          }
> > +        if (has_kvm) {
> > +            qtest_add_func("acpi/q35/numamem", test_acpi_q35_kvm_numamem);
> > +        }
> >      } else if (strcmp(arch, "aarch64") == 0) {
> >          qtest_add_func("acpi/virt", test_acpi_virt_tcg);
> >          qtest_add_func("acpi/virt/numamem", test_acpi_virt_tcg_numamem);
> > -- 
> > 2.27.0  
> 


