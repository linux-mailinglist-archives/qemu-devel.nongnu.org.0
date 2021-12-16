Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E1F2476E6F
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 10:59:50 +0100 (CET)
Received: from localhost ([::1]:33498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxnYD-0001Ap-J0
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 04:59:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mxnWl-0008LD-VV
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 04:58:19 -0500
Received: from [2607:f8b0:4864:20::92b] (port=46638
 helo=mail-ua1-x92b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mxnWi-0003wC-Vr
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 04:58:19 -0500
Received: by mail-ua1-x92b.google.com with SMTP id 30so46153320uag.13
 for <qemu-devel@nongnu.org>; Thu, 16 Dec 2021 01:58:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Bqw6QzxPGu3VxhV0sX2H45pIl5mjYSPLVoNdo5INgAI=;
 b=KFeShXPUZp5ZnyIKhTofqz2jLapXB6MtkufhM9PF7GjkUB1dviK511uxaWmsRsalK4
 BHe3KJPIYcXcNa+r/sMgSyjU9jkspYQiY99sz93I4gCCH4QT4KxfT4PtjmCjjLtuMmpS
 04bnw5MkDRGaJsNxENlmQCsOQqQOm62ldz79etqZW1egjnqaNPik1Fzo8elRA11lY0lD
 7rOuS8+oh/CAvd1MF01XX1l1v3kzUWJfKiUgOQJ0tPh+bSUU0j2P+l2krzmZk5Mwy3Wt
 kG1IR8WfwwYAuHaYODExRIsATtzkuJ0DtZay/e/oeEhM3E8HVHgSNq8kLhWEgUtCaUX8
 c0KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Bqw6QzxPGu3VxhV0sX2H45pIl5mjYSPLVoNdo5INgAI=;
 b=mLIWPIggeCbYINSyGEVFuTVdCalrObwcqf2ZD86bvf7vR+tidvxZWnAb28yD7BEIfs
 xwfGONnCM73VraXEBxToRkyS/Mm4naN6jbietN2Khd+Qqzmj4gk9Cr00vVEzQ8vHltYs
 wB+fi5P3VU0EfFjaalxs7fnA7+ObjYJwWQFEUmnzfENbBdZQNM6vtkggaMB0lAJEkOMH
 mvpqmhzBy/l1Z47Ia5AJ2UfISt4cyI27Qb5O1r9yrBvvlIMKRHUPVPH5PR1MrsAnN2RG
 dNtanX2J/xlp6Ynu4ZzFwH8Z6TQulcY33ZAW7hf2hyeC9i6HeUaD8Lr34UsUHueE4Gpv
 d7tA==
X-Gm-Message-State: AOAM532qzWlkOvjFqAFD+y2GE/NXAHCN/L/cbWtH27h6hzkh152sSFBV
 bxcxvyxfGDasKPzdaFGYungzgA==
X-Google-Smtp-Source: ABdhPJxcTt5tvVu8Lmw9DRNxsfFc2FvBEVBHrKCe7Kz1XhrstM2k/lplRelTwmStT/Nq41mDQ3tXeQ==
X-Received: by 2002:a05:6102:2856:: with SMTP id
 az22mr347835vsb.71.1639648695644; 
 Thu, 16 Dec 2021 01:58:15 -0800 (PST)
Received: from myrica (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net.
 [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id y7sm962470uac.3.2021.12.16.01.58.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 01:58:15 -0800 (PST)
Date: Thu, 16 Dec 2021 09:57:52 +0000
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PULL 31/33] tests/acpi: add test case for VIOT
Message-ID: <YbsNoEUfJRsqtKmF@myrica>
References: <20211215104049.2030475-1-peter.maydell@linaro.org>
 <20211215104049.2030475-32-peter.maydell@linaro.org>
 <54ed293c-9f7a-f82d-7a6d-35d51eb45b77@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <54ed293c-9f7a-f82d-7a6d-35d51eb45b77@linaro.org>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::92b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::92b;
 envelope-from=jean-philippe@linaro.org; helo=mail-ua1-x92b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Dec 15, 2021 at 04:59:10PM -0800, Richard Henderson wrote:
> On 12/15/21 2:40 AM, Peter Maydell wrote:
> > From: Jean-Philippe Brucker <jean-philippe@linaro.org>
> > 
> > Add two test cases for VIOT, one on the q35 machine and the other on
> > virt. To test complex topologies the q35 test has two PCIe buses that
> > bypass the IOMMU (and are therefore not described by VIOT), and two
> > buses that are translated by virtio-iommu.
> > 
> > Reviewed-by: Eric Auger <eric.auger@redhat.com>
> > Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> > Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> > Message-id: 20211210170415.583179-7-jean-philippe@linaro.org
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> >   tests/qtest/bios-tables-test.c | 38 ++++++++++++++++++++++++++++++++++
> >   1 file changed, 38 insertions(+)
> 
> I should have been more careful while applying.  The aarch64 host failure
> for this is not transient as I first assumed:
> 
> PASS 5 qtest-aarch64/bios-tables-test /aarch64/acpi/virt/oem-fields
> qemu-system-aarch64: kvm_init_vcpu: kvm_arch_init_vcpu failed (0): Invalid argument
> Broken pipe
> ERROR qtest-aarch64/bios-tables-test - too few tests run (expected 6, got 5)
> make: *** [Makefile.mtest:312: run-test-37] Error 1

I'm guessing adding "tcg_only = true", like all other virt machine tests
in this file, should work around this, but I don't really understand the
problem because I can't reproduce it on my aarch64 host (I'm running
"configure --target-list=aarch64-softmmu" followed by "make -j10
check-qtest V=1" in a loop)

Does the attached patch fix it for you?

Thanks,
Jean

--- 8< ---
From 6da0e4d98022d173c79e3caab273b226617d5943 Mon Sep 17 00:00:00 2001
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
Date: Thu, 16 Dec 2021 09:15:06 +0000
Subject: [PATCH] tests/qtest/bios-tables-test: Only run VIOT test on TCG

The VIOT test does not always work under KVM on the virt machine:

  PASS 5 qtest-aarch64/bios-tables-test /aarch64/acpi/virt/oem-fields
  qemu-system-aarch64: kvm_init_vcpu: kvm_arch_init_vcpu failed (0): Invalid argument
  Broken pipe

Make it TCG only.

Reported-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 tests/qtest/bios-tables-test.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 58df53b15b..9a468e29eb 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -1489,6 +1489,7 @@ static void test_acpi_virt_viot(void)
 {
     test_data data = {
         .machine = "virt",
+        .tcg_only = true,
         .uefi_fl1 = "pc-bios/edk2-aarch64-code.fd",
         .uefi_fl2 = "pc-bios/edk2-arm-vars.fd",
         .cd = "tests/data/uefi-boot-images/bios-tables-test.aarch64.iso.qcow2",
-- 
2.34.1


