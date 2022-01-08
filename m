Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACAF44880DA
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 03:12:37 +0100 (CET)
Received: from localhost ([::1]:56890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n61Dg-0002se-Qs
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 21:12:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n60Bv-00077u-7q
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 20:06:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n60Bt-0002vx-KD
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 20:06:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641604001;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IyIX4Y52IesbNq4lnMucnk8E/SfIhuYQ0BGXFbD8E9s=;
 b=F92LFwlQ6S3fmCMuKfkgCrwEHCA5opcCwFiEhb4g8L5v60bFEO8kZFUtV/qz9UAJkBA+3v
 dtB35WfLF+8tLejoVD280Aj1vVrJnzK8jJfbamtIDl2SXL3yMYGroh55LYLl/+C3sYLNKN
 D6jhWzTyF9QcvRiKWkyvUdPzlyNJLG8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-31-EfLrh7b0OgeADAh8XcrZBw-1; Fri, 07 Jan 2022 20:06:40 -0500
X-MC-Unique: EfLrh7b0OgeADAh8XcrZBw-1
Received: by mail-wm1-f72.google.com with SMTP id
 bh10-20020a05600c3d0a00b00347aa76728fso1881092wmb.9
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 17:06:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=IyIX4Y52IesbNq4lnMucnk8E/SfIhuYQ0BGXFbD8E9s=;
 b=yRVNr365Sl3Q9DTEMVroaxewou6/23XWPs9N0W3pkAUZgrA/6meIwgQ2MUkc9e940M
 7hYXrceFoXOSSE0TSdP7yXBWzNfEC/yl7I1b/PFcNiPhemdfLeF/TyY2hRIjcAPbvvhD
 fDNmHXIH28ZyA2B9MTTZkKORiR1rwlQ9irtzfqoO05gmISWI+sMpxD9qr63siEpXkm4x
 N2edDUCL/wNxOzTQkTTk0thfIQ7WrFD14GcChVa5gVrScZmHp5ewqEHFiz9mPaUVu8sJ
 gUKZ5KoLROOv+zu1DVczPibAflsafPjcZfz42vGLam+crUSPepJuvJ2cy5kQzFiC0DvQ
 MtyA==
X-Gm-Message-State: AOAM533m8wgsT2BsEPKDT9A9b6bRFqBcQrc6fsR8zD48/UJXv9opo1Ey
 SGMiwzHseAtDiUcUx44EIoIV3tAuSud3z4VTuDmfbOp0/Z1lTEsUUCgM1OFgZNfN9WBxpg/+/oM
 lzcqdon75xA7PZ+2xPSroC01+Emvmjy01v4KHbuiYl5Q79Dw87eLggzS7tnbu
X-Received: by 2002:a05:6000:2c9:: with SMTP id
 o9mr56545466wry.377.1641603998711; 
 Fri, 07 Jan 2022 17:06:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw8mMiV1Rcr0RM7JQv13Obs0riJGaFIPRIyuUpAWiqAu5KxPYvPmBr/1sB3U5WFEn86P11NkQ==
X-Received: by 2002:a05:6000:2c9:: with SMTP id
 o9mr56545454wry.377.1641603998558; 
 Fri, 07 Jan 2022 17:06:38 -0800 (PST)
Received: from redhat.com ([147.161.13.99])
 by smtp.gmail.com with ESMTPSA id s8sm276415wra.9.2022.01.07.17.06.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 17:06:38 -0800 (PST)
Date: Fri, 7 Jan 2022 20:06:36 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v3 55/55] tests: acpi: Add updated TPM related tables
Message-ID: <20220108003423.15830-56-mst@redhat.com>
References: <20220108003423.15830-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220108003423.15830-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Ani Sinha <ani@anisinha.ca>, Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefan Berger <stefanb@linux.ibm.com>

The updated TPM related tables have the following additions:

   Device (TPM)
   {
       Name (_HID, "MSFT0101" /* TPM 2.0 Security Device */)  // _HID: Hardware ID
+      Name (_STR, "TPM 2.0 Device")  // _STR: Description String
+      Name (_UID, One)  // _UID: Unique ID
       Name (_STA, 0x0F)  // _STA: Status
       Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings

Cc: Michael S. Tsirkin <mst@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Cc: Ani Sinha <ani@anisinha.ca>
Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
Acked-by: Ani Sinha <ani@anisinha.ca>
Message-id: 20211223022310.575496-4-stefanb@linux.ibm.com
Message-Id: <20220104175806.872996-4-stefanb@linux.ibm.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h |   2 --
 tests/data/acpi/q35/DSDT.tis.tpm12          | Bin 8894 -> 8900 bytes
 tests/data/acpi/q35/DSDT.tis.tpm2           | Bin 8894 -> 8921 bytes
 3 files changed, 2 deletions(-)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index 5d80e408d4..dfb8523c8b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,3 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/q35/DSDT.tis.tpm12",
-"tests/data/acpi/q35/DSDT.tis.tpm2",
diff --git a/tests/data/acpi/q35/DSDT.tis.tpm12 b/tests/data/acpi/q35/DSDT.tis.tpm12
index 0ebdf6fbd77967f1ab5d5337b7b1fed314cfaca8..fb9dd1f0599afd6b555ea570ecd00a3bb227aa84 100644
GIT binary patch
delta 50
zcmdnzdc>8>CD<k8h!O(><KvB7q6(a@S~2m#PVoZ1lQk6FnOs#T7b=LdgnGI#Zf;Sq
GVgdkr91X<)

delta 45
zcmX@&y3du%CD<iopArKDqxwcJQ3Xza&6xOLr+5MP$r=joO#Uj93l&5+_b6B}0RSYz
B3@!iw

diff --git a/tests/data/acpi/q35/DSDT.tis.tpm2 b/tests/data/acpi/q35/DSDT.tis.tpm2
index dcbb7f0af377425db53130e8ba1c62c09c22e006..00d732e46f5d9d056e557bd026fa30f9db3b8c30 100644
GIT binary patch
delta 70
zcmdnzdefE5CD<k8rV;}KBgaNAQ3Wn9?U?vrr+5J;?a7)7ZcJWklM5BZ#e;Z50(=#W
a^b8bSQp+-vQyDnoLp@y>H@7HQF#!OXcoHoD

delta 46
zcmccVy3du%CD<iopArKD<D-pSq6%F8nlbUgPVoZnnv*pZ+?f1TCKoD*Z(gim#smOL
C=M6sq

-- 
MST


