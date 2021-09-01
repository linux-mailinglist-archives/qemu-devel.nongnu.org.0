Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 827DA3FD4E0
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 10:06:42 +0200 (CEST)
Received: from localhost ([::1]:45748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLLGb-0001HO-Iz
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 04:06:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mLLDa-0007Z0-Ft
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 04:03:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42057)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mLLDY-0000tU-1m
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 04:03:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630483410;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2EFasJRPaWNSp5dBYvRrNqey6IACM0MXhZC7bnd/8GE=;
 b=hAyXUrJsvDV6gUyxeKED61cpM4SAr/8hvkfs1oeaLaGvuccUaAQ8V6w8h+zxxMiB5XUFku
 9OvvNXhK4jLKZSyyYU6Yl5Sz7Z/oD6Xqc8varMLMqUv7P1K6LV6W0BTd8JkCQ8BqMLBlEz
 6+O1BJ56GozW8wDD1kc/yZOy9oi2iSs=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-18-Xl2ffqnUMTWluQ_HeH5rTg-1; Wed, 01 Sep 2021 04:03:27 -0400
X-MC-Unique: Xl2ffqnUMTWluQ_HeH5rTg-1
Received: by mail-wm1-f69.google.com with SMTP id
 g3-20020a1c2003000000b002e751c4f439so2455548wmg.7
 for <qemu-devel@nongnu.org>; Wed, 01 Sep 2021 01:03:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2EFasJRPaWNSp5dBYvRrNqey6IACM0MXhZC7bnd/8GE=;
 b=VUtk8LkdyBMOG5aEndi6E4hvqPmBq2ZiQE953R9o40MOipwPoAJ8fdMIwWftS9oYxs
 u9MU/51hO8EYyOQYw2pFHyu2F8SUEMCiLcVuM+Hnq9bUP9DJsAdZQghJzRB2nKwbMb5O
 WmqylkuqpuyiPRRy6eH0koIyZ+/uwoj74xx2uqCEnVyJf8PIDPBO11COsO43lfaSjrsq
 tTvNaDUzHCQmLH3ZQnRZnvxF0l8jWdvS4czxXRhMMSe2WQs2+uwCas4cH3j/rJwXMhij
 o3U6uxIwM4KYHj5js0mfp29IXm2iT6Qy+1RhIIksunAvWEOphLXTtv+KJoPeaCBUgYZn
 xJvQ==
X-Gm-Message-State: AOAM533qoxeGhTrhyC0P41Ku6Ev/V4zXAlmzIcdHellQ88trgw4OJGO5
 lTeSAnUdGHtfw1TiX+0D9rZaZntzJfQJjeR1cPH44Lymc2ec797a9NHd0euUQdK4g9gVReEx2xe
 YUZfPWb7WY3eXX/U=
X-Received: by 2002:a05:600c:4293:: with SMTP id
 v19mr8233387wmc.32.1630483406313; 
 Wed, 01 Sep 2021 01:03:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy/Lw5HxgSYrVDmRgT5T046SScHwnN04GoogL83QuNkOTI10JBP7Q/3FGzeohubE7jr8GIMHg==
X-Received: by 2002:a05:600c:4293:: with SMTP id
 v19mr8233357wmc.32.1630483405953; 
 Wed, 01 Sep 2021 01:03:25 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id b24sm4367376wmj.43.2021.09.01.01.03.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Sep 2021 01:03:25 -0700 (PDT)
Date: Wed, 1 Sep 2021 10:03:24 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Shashi Mallela <shashi.mallela@linaro.org>
Subject: Re: [PATCH v7 10/10] tests/data/acpi/virt: Update IORT files for ITS
Message-ID: <20210901100324.3ce458f6@redhat.com>
In-Reply-To: <20210805223002.144855-11-shashi.mallela@linaro.org>
References: <20210805223002.144855-1-shashi.mallela@linaro.org>
 <20210805223002.144855-11-shashi.mallela@linaro.org>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, mst@redhat.com, rad@semihalf.com,
 qemu-devel@nongnu.org, eric.auger@redhat.com, qemu-arm@nongnu.org,
 leif@nuviainc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

not directly related to the patch but while I was testing IORT testcase
(https://github.com/imammedo/qemu acpi-tests)
after rebase to 6.1, I get test failure due to change in MADT table vs
expected blobs made in 6.0 time and it does look like ABI change
(what is bad, it also happens to virt-6.0 machine type).
Can ARM folks check if we didn't break something?

acpi-test: Warning! APIC mismatch. Actual [asl:/tmp/asl-1TCW80.dsl, aml:/tmp/aml-OUIW80], Expected [asl:/tmp/asl-O8DW80.dsl, aml:tests/data/acpi/virt/APIC].
--- /tmp/asl-O8DW80.dsl	2021-09-01 03:49:02.311023292 -0400
+++ /tmp/asl-1TCW80.dsl	2021-09-01 03:49:02.311023292 -0400
@@ -1,78 +1,82 @@
 /*
  * Intel ACPI Component Architecture
  * AML/ASL+ Disassembler version 20180629 (64-bit version)
  * Copyright (c) 2000 - 2018 Intel Corporation
  * 
- * Disassembly of tests/data/acpi/virt/APIC, Wed Sep  1 03:49:02 2021
+ * Disassembly of /tmp/aml-OUIW80, Wed Sep  1 03:49:02 2021
  *
  * ACPI Data Table [APIC]
  *
  * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue
  */
 
 [000h 0000   4]                    Signature : "APIC"    [Multiple APIC Description Table (MADT)]
-[004h 0004   4]                 Table Length : 000000A8
+[004h 0004   4]                 Table Length : 000000B4
 [008h 0008   1]                     Revision : 03
-[009h 0009   1]                     Checksum : 50
+[009h 0009   1]                     Checksum : CA
 [00Ah 0010   6]                       Oem ID : "BOCHS "
 [010h 0016   8]                 Oem Table ID : "BXPC    "
 [018h 0024   4]                 Oem Revision : 00000001
 [01Ch 0028   4]              Asl Compiler ID : "BXPC"
 [020h 0032   4]        Asl Compiler Revision : 00000001
 
 [024h 0036   4]           Local Apic Address : 00000000
 [028h 0040   4]        Flags (decoded below) : 00000000
                          PC-AT Compatibility : 0
 
 [02Ch 0044   1]                Subtable Type : 0C [Generic Interrupt Distributor]
 [02Dh 0045   1]                       Length : 18
 [02Eh 0046   2]                     Reserved : 0000
 [030h 0048   4]        Local GIC Hardware ID : 00000000
 [034h 0052   8]                 Base Address : 0000000008000000
 [03Ch 0060   4]               Interrupt Base : 00000000
-[040h 0064   1]                      Version : 02
+[040h 0064   1]                      Version : 03
 [041h 0065   3]                     Reserved : 000000
 
 [044h 0068   1]                Subtable Type : 0B [Generic Interrupt Controller]
 [045h 0069   1]                       Length : 4C
 [046h 0070   2]                     Reserved : 0000
 [048h 0072   4]         CPU Interface Number : 00000000
 [04Ch 0076   4]                Processor UID : 00000000
 [050h 0080   4]        Flags (decoded below) : 00000001
                            Processor Enabled : 1
           Performance Interrupt Trigger Mode : 0
           Virtual GIC Interrupt Trigger Mode : 0
 [054h 0084   4]     Parking Protocol Version : 00000000
 [058h 0088   4]        Performance Interrupt : 00000017
 [05Ch 0092   8]               Parked Address : 0000000000000000
-[064h 0100   8]                 Base Address : 0000000008010000
-[06Ch 0108   8]     Virtual GIC Base Address : 0000000008040000
-[074h 0116   8]  Hypervisor GIC Base Address : 0000000008030000
+[064h 0100   8]                 Base Address : 0000000000000000
+[06Ch 0108   8]     Virtual GIC Base Address : 0000000000000000
+[074h 0116   8]  Hypervisor GIC Base Address : 0000000000000000
 [07Ch 0124   4]        Virtual GIC Interrupt : 00000000
 [080h 0128   8]   Redistributor Base Address : 0000000000000000
 [088h 0136   8]                    ARM MPIDR : 0000000000000000
 /**** ACPI subtable terminates early - may be older version (dump table) */
 
-[090h 0144   1]                Subtable Type : 0D [Generic MSI Frame]
-[091h 0145   1]                       Length : 18
+[090h 0144   1]                Subtable Type : 0E [Generic Interrupt Redistributor]
+[091h 0145   1]                       Length : 10
 [092h 0146   2]                     Reserved : 0000
-[094h 0148   4]                 MSI Frame ID : 00000000
-[098h 0152   8]                 Base Address : 0000000008020000
-[0A0h 0160   4]        Flags (decoded below) : 00000001
-                                  Select SPI : 1
-[0A4h 0164   2]                    SPI Count : 0040
-[0A6h 0166   2]                     SPI Base : 0050
+[094h 0148   8]                 Base Address : 00000000080A0000
+[09Ch 0156   4]                       Length : 00F60000
 
-Raw Table Data: Length 168 (0xA8)
+[0A0h 0160   1]                Subtable Type : 0F [Generic Interrupt Translator]
+[0A1h 0161   1]                       Length : 14
+[0A2h 0162   2]                     Reserved : 0000
+[0A4h 0164   4]               Translation ID : 00000000
+[0A8h 0168   8]                 Base Address : 0000000008080000
+[0B0h 0176   4]                     Reserved : 00000000
 



