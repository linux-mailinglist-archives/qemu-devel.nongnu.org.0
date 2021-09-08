Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0881D403373
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 06:44:53 +0200 (CEST)
Received: from localhost ([::1]:39688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNpS7-0005nq-IL
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 00:44:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mNpQa-00057Z-Nr
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 00:43:16 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:35700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mNpQY-0002i6-QQ
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 00:43:16 -0400
Received: by mail-pg1-x533.google.com with SMTP id e7so1270089pgk.2
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 21:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20150623.gappssmtp.com; s=20150623;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=VTd0z7AbZEDGMX542122OVUqdbbwB4bY8hAAvVMaS+k=;
 b=FphmHpQiRKuWhNTxqkx8k7PByaZltF9IvT2Ru7sIRXcQCJXbdIGuVhIiW/iIZxXPKs
 WztZchnhh1bInG1cdsZA0XosnBO2nmgmIXKEOwKo2oN3nCphjPXM0RMe3zqS4tJuHYJg
 6pGEx3t0pBN8pOkdO7wbkw2KELiAXsptIyVkD3VODElK9v+q53eDe6EeOgaAj0TXqMRY
 vo2p0rAJP1LskmBfU6qCvzwLMl3qI39AyvN8dxg+GggbCBk/KcPAt2JWaeZKlAasxIa5
 2yg+OC3tz5HQtw3WiVSTKYH0cSF/BGvkun/ff/4wZX4Y6VenKTz3IivAanKeiXyhq2yg
 CmDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=VTd0z7AbZEDGMX542122OVUqdbbwB4bY8hAAvVMaS+k=;
 b=R2Dz3TvYvyVhCw7Oi33SEmZFNCscKDURS8CbhnBsjTQVWO9Z2chfBSF6bXNWJoqV7G
 B9GE2JOgA/4Kqb3YuyN4/poFGaDAHFPLqIEbcQn2YwTEXqrkCEeOP/j6a9Hf9F/oUTAf
 AebnUCM2/tjNQpZFYISFNNuyU6rZ5HbXmI4OQsqsWKPyPYfDv+KHDqzfu1pis4zQHTt4
 5Lq8Z3c8s2AcvgyVP5r/Cdl05ZIauI+ZYXVBGHeaIXvX864gfvFAeLz+U10CCqWqwsSi
 jYtnr/5beTlePMZY94R3yTKMFYLbFAwT/n3i4eMDYF9XyfBEWUXlUzI22BkGJlpgt3V1
 COVQ==
X-Gm-Message-State: AOAM530giMk0axLwtwQeFZ7lWzPOtsY29PHAS2NhKWhHpftcNaObssN5
 +sutinJfhVogc7OGb+10oX8Syw==
X-Google-Smtp-Source: ABdhPJwBoOhTbYR53aogvkaXmF64p5MWzxk1du3MhdwQgokfsyxeApk4IIYNdldEMO3N/j3XOcxf+g==
X-Received: by 2002:a63:4344:: with SMTP id q65mr1836541pga.364.1631076192449; 
 Tue, 07 Sep 2021 21:43:12 -0700 (PDT)
Received: from anisinha-lenovo ([203.163.242.70])
 by smtp.googlemail.com with ESMTPSA id l22sm877816pgo.45.2021.09.07.21.43.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 21:43:11 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Wed, 8 Sep 2021 10:13:05 +0530 (IST)
X-X-Sender: anisinha@anisinha-lenovo
To: Ani Sinha <ani@anisinha.ca>
Subject: Re: [PATCH] hw/i386/acpi-build: adjust q35 IO addr range for acpi
 pci hotplug
In-Reply-To: <20210908041139.2219253-1-ani@anisinha.ca>
Message-ID: <alpine.DEB.2.22.394.2109081012120.2227929@anisinha-lenovo>
References: <20210908041139.2219253-1-ani@anisinha.ca>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: none client-ip=2607:f8b0:4864:20::533;
 envelope-from=ani@anisinha.ca; helo=mail-pg1-x533.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, jusual@redhat.com,
 qemu-devel@nongnu.org, Igor Mammedov <imammedo@redhat.com>, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On Wed, 8 Sep 2021, Ani Sinha wrote:

> Change caf108bc58790 ("hw/i386/acpi-build: Add ACPI PCI hot-plug methods to Q35")
> selects an IO address range for acpi based PCI hotplug for q35 arbitrarily. It
> starts at address 0x0cc4 and ends at 0x0cdb. It was assumed that this address
> range was free and available. However, upon more testing, it seems this address
> range to be not available for some latest versions of windows. Hence, this
> change modifies the IO address range so that windows can allocate the address
> range without any conflict. The new address range would start at 0x0dd4 and end
> at address 0x0deb.
>
> This change has been tested using a Windows Server 2019 guest VM.
>

I realize that this breaks bios-tables-test.c which I will correct if we
are ok with this fix.

--- /tmp/asl-0FVI90.dsl	2021-09-08 10:05:59.260579343 +0530
+++ /tmp/asl-7TYI90.dsl	2021-09-08 10:05:59.252579221 +0530
@@ -1,30 +1,30 @@
 /*
  * Intel ACPI Component Architecture
  * AML/ASL+ Disassembler version 20190509 (64-bit version)
  * Copyright (c) 2000 - 2019 Intel Corporation
  *
  * Disassembling to symbolic ASL+ operators
  *
- * Disassembly of tests/data/acpi/q35/DSDT, Wed Sep  8 10:05:59 2021
+ * Disassembly of /tmp/aml-QVYI90, Wed Sep  8 10:05:59 2021
  *
  * Original Table Header:
  *     Signature        "DSDT"
  *     Length           0x00002061 (8289)
  *     Revision         0x01 **** 32-bit table (V1), no 64-bit math
support
- *     Checksum         0xE5
+ *     Checksum         0x90
  *     OEM ID           "BOCHS "
  *     OEM Table ID     "BXPC    "
  *     OEM Revision     0x00000001 (1)
  *     Compiler ID      "BXPC"
  *     Compiler Version 0x00000001 (1)
  */
 DefinitionBlock ("", "DSDT", 1, "BOCHS ", "BXPC    ", 0x00000001)
 {
     Scope (\)
     {
         OperationRegion (DBG, SystemIO, 0x0402, One)
         Field (DBG, ByteAcc, NoLock, Preserve)
         {
             DBGB,   8
         }

@@ -226,46 +226,46 @@
             Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource
Settings
             {
                 IO (Decode16,
                     0x0070,             // Range Minimum
                     0x0070,             // Range Maximum
                     0x01,               // Alignment
                     0x08,               // Length
                     )
                 IRQNoFlags ()
                     {8}
             })
         }
     }

     Scope (_SB.PCI0)
     {
-        OperationRegion (PCST, SystemIO, 0x0CC4, 0x08)
+        OperationRegion (PCST, SystemIO, 0x0DD4, 0x08)
         Field (PCST, DWordAcc, NoLock, WriteAsZeros)
         {
             PCIU,   32,
             PCID,   32
         }

-        OperationRegion (SEJ, SystemIO, 0x0CCC, 0x04)
+        OperationRegion (SEJ, SystemIO, 0x0DDC, 0x04)
         Field (SEJ, DWordAcc, NoLock, WriteAsZeros)
         {
             B0EJ,   32
         }

-        OperationRegion (BNMR, SystemIO, 0x0CD4, 0x08)
+        OperationRegion (BNMR, SystemIO, 0x0DE4, 0x08)
         Field (BNMR, DWordAcc, NoLock, WriteAsZeros)
         {
             BNUM,   32,
             PIDX,   32
         }

         Mutex (BLCK, 0x00)
         Method (PCEJ, 2, NotSerialized)
         {
             Acquire (BLCK, 0xFFFF)
             BNUM = Arg0
             B0EJ = (One << Arg1)
             Release (BLCK)
             Return (Zero)
         }

@@ -3185,34 +3185,34 @@
                     0x0620,             // Range Minimum
                     0x0620,             // Range Maximum
                     0x01,               // Alignment
                     0x10,               // Length
                     )
             })
         }

         Device (PHPR)
         {
             Name (_HID, "PNP0A06" /* Generic Container Device */)  //
_HID: Hardware ID
             Name (_UID, "PCI Hotplug resources")  // _UID: Unique ID
             Name (_STA, 0x0B)  // _STA: Status
             Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource
Settings
             {
                 IO (Decode16,
-                    0x0CC4,             // Range Minimum
-                    0x0CC4,             // Range Maximum
+                    0x0DD4,             // Range Minimum
+                    0x0DD4,             // Range Maximum
                     0x01,               // Alignment
                     0x18,               // Length
                     )
             })
         }
     }

     Scope (\)
     {
         Name (_S3, Package (0x04)  // _S3_: S3 System State
         {
             One,
             One,
             Zero,
             Zero
         })


> Fixes: caf108bc58790 ("hw/i386/acpi-build: Add ACPI PCI hot-plug methods to Q35")
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/561
>
> Signed-off-by: Ani Sinha <ani@anisinha.ca>
> ---
>  include/hw/acpi/ich9.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/hw/acpi/ich9.h b/include/hw/acpi/ich9.h
> index a329ce43ab..b68c5a2174 100644
> --- a/include/hw/acpi/ich9.h
> +++ b/include/hw/acpi/ich9.h
> @@ -29,7 +29,7 @@
>  #include "hw/acpi/acpi_dev_interface.h"
>  #include "hw/acpi/tco.h"
>
> -#define ACPI_PCIHP_ADDR_ICH9 0x0cc4
> +#define ACPI_PCIHP_ADDR_ICH9 0x0dd4
>
>  typedef struct ICH9LPCPMRegs {
>      /*
> --
> 2.25.1
>
>

