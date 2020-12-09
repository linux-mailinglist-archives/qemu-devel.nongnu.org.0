Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D80342D496A
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 19:49:03 +0100 (CET)
Received: from localhost ([::1]:45758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn4WM-0003hu-Rx
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 13:49:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kn3sl-00021Z-43
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:08:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:21557)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kn3sb-0007xH-5Q
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:08:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607537275;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RXU9oHUsBTnreSZxooPdG4q/TIo+LgrSLDWhpXXsVuM=;
 b=iKMq+BFB3rfxGOF3YW8g2A9XiANqDnbg3nGwrOyPachrhpFUmOauiFu/5TJng0DBQExr+i
 m/lKRRgaBYuLxz1+Ulj6XL9ygPnj5t7G902+LYdcAiV7kTa2SCkeoJFQ3JCOuEK0T1zwCQ
 6RFu6UOJ2WOiwtv8fY3pUDFuHsfRxwc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-260-vWqoprHDOdWHd4rLWyN6-Q-1; Wed, 09 Dec 2020 13:07:54 -0500
X-MC-Unique: vWqoprHDOdWHd4rLWyN6-Q-1
Received: by mail-wr1-f70.google.com with SMTP id d26so745311wrb.1
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 10:07:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=RXU9oHUsBTnreSZxooPdG4q/TIo+LgrSLDWhpXXsVuM=;
 b=OO5IwdUTzhKc1KPTufRG5c+wIznbUBDh9urkyKJMvZVyZQaey2/XkMgbreoNBIOOPf
 EWId86CL/bY0arnQ6oa9UJeu3bHKZl+tJyRLu260omg+JcF83DIUbvHPeak0Rgjppufa
 tX6Ui7ZRgvfmMRrsuEGOncy/dhZlu/iUGy4pB1iBm7uT39uT1pFGKtn0fEiQV0KQOTbv
 Ye1wDHwJPt5mR0VX8edy2v0auSaF+1iYEbZj4EIPVbwbMTOWUIM5eAB026mF+1WV4tzT
 t+Pt5+KkOUL08aWQTzltwZwauqdcjzEBmkNe2Jxtif/hkHiNEyYeaXDm0AiDhTk/+/7Z
 e6Eg==
X-Gm-Message-State: AOAM532yG13RV29BVbIpsPFW7+cNkdQt22IUtkYawpy01mpQdwLxcEB2
 +39kMCC2D590ITWQbSUHdvc1lA0oLoJ89rBdRtG0u0vlr/RM6ArCaIlhF8rm2Dg0QCGcz7mZA9P
 Q5fkw7QoUX9BvBoM4Kh7hAYxyrH3stLuPntUbo9bE08NYbWBWrq4Q3wF7F3xs
X-Received: by 2002:a5d:630b:: with SMTP id i11mr4162384wru.404.1607537272255; 
 Wed, 09 Dec 2020 10:07:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwYcEwAx1WbbHVb3la3KcUw1rw/qCmSe6DBydPDtU2JcbHMTG9im9o3Zil8XiOYCglPAkpnrw==
X-Received: by 2002:a5d:630b:: with SMTP id i11mr4162350wru.404.1607537271997; 
 Wed, 09 Dec 2020 10:07:51 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id k7sm5842917wrn.63.2020.12.09.10.07.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 10:07:51 -0800 (PST)
Date: Wed, 9 Dec 2020 13:07:49 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 14/65] unit-test: The files changed.
Message-ID: <20201209180546.721296-15-mst@redhat.com>
References: <20201209180546.721296-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201209180546.721296-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Yubo Miao <miaoyubo@huawei.com>,
 Jiahui Cen <cenjiahui@huawei.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yubo Miao <miaoyubo@huawei.com>

The unit-test is seperated into three patches:
1. The files changed and list in bios-tables-test-allowed-diff.h
2. The unit-test
3. The binary file and clear bios-tables-test-allowed-diff.h

The ASL diff would also be listed.
Sice there are 1000+lines diff, some changes would be omitted.

  * Original Table Header:
  *     Signature        "DSDT"
- *     Length           0x000014BB (5307)
+ *     Length           0x00001E7A (7802)
  *     Revision         0x02
- *     Checksum         0xD1
+ *     Checksum         0x57
  *     OEM ID           "BOCHS "
  *     OEM Table ID     "BXPCDSDT"
  *     OEM Revision     0x00000001 (1)

+        Device (PC80)
+        {
+            Name (_HID, "PNP0A08" /* PCI Express Bus */)  // _HID: Hardware ID
+            Name (_CID, "PNP0A03" /* PCI Bus */)  // _CID: Compatible ID
+            Name (_ADR, Zero)  // _ADR: Address
+            Name (_CCA, One)  // _CCA: Cache Coherency Attribute
+            Name (_SEG, Zero)  // _SEG: PCI Segment
+            Name (_BBN, 0x80)  // _BBN: BIOS Bus Number
+            Name (_UID, 0x80)  // _UID: Unique ID
+            Name (_STR, Unicode ("pxb Device"))  // _STR: Description String
+            Name (_PRT, Package (0x80)  // _PRT: PCI Routing Table
+            {
+                Package (0x04)
+                {
+                    0xFFFF,
+                    Zero,
+                    GSI0,
+                    Zero
+                },
+

Packages are omitted.

+                Package (0x04)
+                {
+                    0x001FFFFF,
+                    0x03,
+                    GSI2,
+                    Zero
+                }
+            })
+            Device (GSI0)
+            {
+                Name (_HID, "PNP0C0F" /* PCI Interrupt Link Device */)  // _HID: Hardware ID
+                Name (_UID, Zero)  // _UID: Unique ID
+                Name (_PRS, ResourceTemplate ()  // _PRS: Possible Resource Settings
+                {
+                    Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, )
+                    {
+                        0x00000023,
+                    }
+                })
+                Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
+                {
+                    Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, )
+                    {
+                        0x00000023,
+                    }
+                })
+                Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
+                {
+                }
+            }

GSI1,2,3 are omitted.

+            Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
+            {
+                WordBusNumber (ResourceProducer, MinFixed, MaxFixed, PosDecode,
+                    0x0000,             // Granularity
+                    0x0080,             // Range Minimum
+                    0x0080,             // Range Maximum
+                    0x0000,             // Translation Offset
+                    0x0001,             // Length
+                    ,, )
+            })
+            Name (SUPP, Zero)
+            Name (CTRL, Zero)
+            Method (_OSC, 4, NotSerialized)  // _OSC: Operating System Capabilities
+            {
+                CreateDWordField (Arg3, Zero, CDW1)
+                If ((Arg0 == ToUUID ("33db4d5b-1ff7-401c-9657-7441c03dd766") /* PCI Host Bridge Device */))
+                {
+                    CreateDWordField (Arg3, 0x04, CDW2)
+                    CreateDWordField (Arg3, 0x08, CDW3)
+                    SUPP = CDW2 /* \_SB_.PC80._OSC.CDW2 */
+                    CTRL = CDW3 /* \_SB_.PC80._OSC.CDW3 */
+                    CTRL &= 0x1F
+                    If ((Arg1 != One))
+                    {
+                        CDW1 |= 0x08
+                    }
+
+                    If ((CDW3 != CTRL))
+                    {
+                        CDW1 |= 0x10
+                    }
+
+                    CDW3 = CTRL /* \_SB_.PC80.CTRL */
+                    Return (Arg3)
+                }
+                Else
+                {
+                    CDW1 |= 0x04
+                    Return (Arg3)
+                }
+            }

DSM is are omitted

         Device (PCI0)
         {
             Name (_HID, "PNP0A08" /* PCI Express Bus */)  // _HID: Hardware ID
                     WordBusNumber (ResourceProducer, MinFixed, MaxFixed, PosDecode,
                         0x0000,             // Granularity
                         0x0000,             // Range Minimum
-                        0x00FF,             // Range Maximum
+                        0x007F,             // Range Maximum
                         0x0000,             // Translation Offset
-                        0x0100,             // Length
+                        0x0080,             // Length

Signed-off-by: Yubo Miao <miaoyubo@huawei.com>
Signed-off-by: Jiahui Cen <cenjiahui@huawei.com>
Message-Id: <20201119014841.7298-8-cenjiahui@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..90c53925fc 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,2 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/virt/DSDT.pxb",
-- 
MST


