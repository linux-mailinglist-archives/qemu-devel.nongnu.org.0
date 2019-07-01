Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8856711B94
	for <lists+qemu-devel@lfdr.de>; Thu,  2 May 2019 16:36:27 +0200 (CEST)
Received: from localhost ([127.0.0.1]:52166 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hMCow-0004Ac-K2
	for lists+qemu-devel@lfdr.de; Thu, 02 May 2019 10:36:22 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42269)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1hMCdY-0003gW-SF
	for qemu-devel@nongnu.org; Thu, 02 May 2019 10:24:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1hMCdX-0001Bb-Pa
	for qemu-devel@nongnu.org; Thu, 02 May 2019 10:24:36 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33521)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1hMCdX-0001AK-Hk
	for qemu-devel@nongnu.org; Thu, 02 May 2019 10:24:35 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A858D3087948;
	Thu,  2 May 2019 14:24:30 +0000 (UTC)
Received: from Igors-MacBook-Pro (unknown [10.40.205.168])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 921F8182CC;
	Thu,  2 May 2019 14:24:26 +0000 (UTC)
Date: Thu, 2 May 2019 16:24:20 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Wei Xu <xuwei5@hisilicon.com>
Message-ID: <20190502162420.6c8280c8@Igors-MacBook-Pro>
In-Reply-To: <b87a2b31-0389-2df0-42a6-a1593d437fcd@hisilicon.com>
References: <1556170489-131927-12-git-send-email-imammedo@redhat.com>
	<1556211116-172721-1-git-send-email-xuwei5@huawei.com>
	<20190426135412.758769f9@Igors-MacBook-Pro.local>
	<b87a2b31-0389-2df0-42a6-a1593d437fcd@hisilicon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.45]);
	Thu, 02 May 2019 14:24:32 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v3 11/13] tests: acpi: add simple arm/virt
 testcase
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
	mst@redhat.com, linuxarm@huawei.com,
	shameerali.kolothum.thodi@huawei.com, qemu-devel@nongnu.org,
	x00249684 <xuwei5@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 26 Apr 2019 17:28:10 +0100
Wei Xu <xuwei5@hisilicon.com> wrote:

> Hi Igor,
> 
> On 4/26/2019 12:54 PM, Igor Mammedov wrote:
> > On Fri, 26 Apr 2019 00:51:56 +0800
> > x00249684 <xuwei5@huawei.com> wrote:
> > 
> >> Hi Igor,
> >>
> >> +static void test_acpi_virt_tcg(void)
> >> +{
> >> +    test_data data = {
> >> +        .machine = "virt",
> >> +        .uefi_fl1 = "pc-bios/edk2-aarch64-code.fd",
> >> +        .uefi_fl2 = "pc-bios/edk2-arm-vars.fd",
> >> +        .cd = "tests/data/uefi-boot-images/bios-tables-test.aarch64.iso.qcow2",
> >> +        .ram_start = 0x40000000ULL,
> >> +        .scan_len = 128ULL * 1024 * 1024,
> >> +    };
> >> +
> >> +    test_acpi_one("-cpu cortex-a57 ", &data);
> >>
> >> Replaced the cortex-a57 with host and succesfully tested on the hisilicon arm64 
> >> D05 board. Otherwise it failed with "kvm_init_vcpu failed: Invalid argument".
> >> Is it possilbe to set the cpu type like numa-test.c?
> > 
> > I think it works with numa-test because it uses TCG only but in case of bios-tables-test
> > it uses accel="kvm:tcg" to leverage KVM capabilities whenever possible to speed up test.
> > 
> > Now back to our ARM test case, uefi requirement is to use 64bit CPU (hence it was cortex-a57)
> > however unlike x86 it obviously breaks since KVM accelerator on ARM host is used
> > and it doesn't work with anything other than 'host' cpu model.
> > 
> > I think we still want to use KVM whenever possible, but problem lies in that
> > user (testcase) doesn't have an idea if KVM accelerator is available and host is 64 CPU.
> > 
> > to sum up we need to support 2 modes:
> >   1. host is 64 ARM, use kvm with -cpu host
> >   2. all other cases use tcg with -cpu cortex-a57
> > 
> > I can hack to probe if /dev/kvm is accessible and host is 64 bit and use #1
> > otherwise fallback to #2
> > or as quick fix do only #2 initially and think about a better solution to #1 
> 
> Thanks!
> Fine to me.
> 
> > 
> > Is there any other suggestions/opinions how to approach issue/proceed.
> 
> To check the host cpu architecture is ARM or not, maybe we can check the value
> of "CPU implementer" is 0x41 or not from the /proc/cpuinfo.

it turned out it's more complicated.
we also should pick a correct GIC depending on host's CPU and that
changes ACPI tables, so it will worn on some hosts and fail on other.

I'll add a patch to enable test case to pick accelerator and force TCG
for ARM tests for now.

> 
> Best Regards,
> Wei
> 
> > 
> > PS:
> > we probably would like to reuse this not only for acpi tests but also for other
> > arm/virt test cases that involve running guest code. 
> > 
> >> Thanks!
> >>
> >> Best Regards,
> >> Wei
> > 
> > 
> > .
> > 
> 


