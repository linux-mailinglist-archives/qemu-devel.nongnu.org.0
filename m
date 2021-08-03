Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 523333DF6AB
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 22:56:53 +0200 (CEST)
Received: from localhost ([::1]:39318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mB1T2-0000HM-Bn
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 16:56:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mB1Ok-0000nf-QO
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 16:52:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51084)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mB1Oj-00088A-7i
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 16:52:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628023944;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wK1Xu5JhENTpsRwRTEKAhUpFEUB412r3ZpP4JDIjNQA=;
 b=ceis7nOjT60MIBt9Cua3UqfWTpyOQeACqU6LVLscXMN+gQ6Pnl71ivCY62FSI/7POXcLPV
 z/x7BE0SZkRm0VKqVi5Leq7YNK6KCSfHGF2Mr9Tex2X1f2LrjJ08Fhr7HBayiTGyXyGtCW
 75K4RRmE2uHB0iy6CWpj0zmZiBzQML4=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-586-k4kEzLuVNz6fKwukihAkAA-1; Tue, 03 Aug 2021 16:52:23 -0400
X-MC-Unique: k4kEzLuVNz6fKwukihAkAA-1
Received: by mail-ed1-f70.google.com with SMTP id
 d6-20020a50f6860000b02903bc068b7717so267479edn.11
 for <qemu-devel@nongnu.org>; Tue, 03 Aug 2021 13:52:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wK1Xu5JhENTpsRwRTEKAhUpFEUB412r3ZpP4JDIjNQA=;
 b=F3Zg7s7mF0+QHdkqUVm8zpQnKGwwNITT2i1lDy6imIHPomM/zMED6Li3yOYZvmFgPV
 56yXcIDPyNTdl9Q3ScQvXaAZmeW6mqFIrgnCLz50mWURafgaEJty93NVQSJMzO7EIo39
 bjW7PjG08Cmm3NPV5tJAr1Eet9XkjPVU6kA+wZ+ALLwK/2b2ylIdKH+kFgUA5LXvPK2k
 cIFr/XjUKX6gTku/DzD1IbBF9Q/8KQW19is6z8R+g16njI4iD12bLOxbeVypNyeOLa3n
 RqL1E904gCPWNejm6ClodGaOXBaB30nkD1a/H8Ar3b9XXrVxdGkBg5b2FHLYPCluS2Gl
 oKMQ==
X-Gm-Message-State: AOAM533PzSvpBkFipmrUP/3sk8UJH8I1lJdJko6hiC6lQB32Hj8Xx9RP
 key27Q1GD8pBIi8waO+Ut98s2m9I+BGL1YkUTrGQkB7ubW0zjJKdqqsU3j3gjHGMVJNwdNBkQTW
 IhgzdkJ71iw05BWUIgffZY+DsQIbk5taVH4dEPb1QnOkeKGC/v4k5/65VSER/
X-Received: by 2002:aa7:dc18:: with SMTP id b24mr28159994edu.343.1628023941799; 
 Tue, 03 Aug 2021 13:52:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy3RzyNXhxzJWCFIJz9xmigBRt1GCaOxxuwW5R2m8cSUq7CgZGATpWyGSnGmQvKtpg60yFq3g==
X-Received: by 2002:aa7:dc18:: with SMTP id b24mr28159977edu.343.1628023941625; 
 Tue, 03 Aug 2021 13:52:21 -0700 (PDT)
Received: from redhat.com ([2.55.141.248])
 by smtp.gmail.com with ESMTPSA id qa34sm6666352ejc.120.2021.08.03.13.52.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 13:52:21 -0700 (PDT)
Date: Tue, 3 Aug 2021 16:52:18 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 5/5] Drop _DSM 5 from expected DSDTs on ARM
Message-ID: <20210803205043.165034-6-mst@redhat.com>
References: <20210803205043.165034-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210803205043.165034-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

diff -rup /tmp/old/tests/data/acpi/microvm/DSDT.pcie.dsl /tmp/new/tests/data/acpi/microvm/DSDT.pcie.dsl
--- /tmp/old/tests/data/acpi/microvm/DSDT.pcie.dsl	2021-08-03 16:22:52.289295442 -0400
+++ /tmp/new/tests/data/acpi/microvm/DSDT.pcie.dsl	2021-08-03 16:22:40.102286317 -0400
@@ -1302,14 +1302,9 @@ DefinitionBlock ("", "DSDT", 2, "BOCHS "
                     {
                         Return (Buffer (One)
                         {
-                             0x21                                             // !
+                             0x01                                             // .
                         })
                     }
-
-                    If ((Arg2 == 0x05))
-                    {
-                        Return (Zero)
-                    }
                 }

                 Return (Buffer (One)

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h |   5 -----
 tests/data/acpi/microvm/DSDT.pcie           | Bin 3031 -> 3023 bytes
 tests/data/acpi/virt/DSDT                   | Bin 5204 -> 5196 bytes
 tests/data/acpi/virt/DSDT.memhp             | Bin 6565 -> 6557 bytes
 tests/data/acpi/virt/DSDT.numamem           | Bin 5204 -> 5196 bytes
 tests/data/acpi/virt/DSDT.pxb               | Bin 7695 -> 7679 bytes
 6 files changed, 5 deletions(-)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index 8a7fe463c5..dfb8523c8b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,6 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/virt/DSDT",
-"tests/data/acpi/virt/DSDT.memhp",
-"tests/data/acpi/virt/DSDT.numamem",
-"tests/data/acpi/virt/DSDT.pxb",
-"tests/data/acpi/microvm/DSDT.pcie",
diff --git a/tests/data/acpi/microvm/DSDT.pcie b/tests/data/acpi/microvm/DSDT.pcie
index 3fb373fd970f0a33f30f57b1917720754396f0e9..765f14ef3d1e54d3cadccbf0a880f8adb73b3f1f 100644
GIT binary patch
delta 51
zcmcaEeqNl*CD<k8JU0Ua(~XH-(oCK^H>#U6GCFLIXMD`bp&RcK?8~x1ak3Y;JR{@e
HBJNZGj^hr8

delta 59
zcmX>veqEf)CD<k8IyVCYlgC6ZX(q>A8`aGj89g?~Gd||zFpYN!_GMY1IoXR_o>OrF
P`{XPx)+G#+v$#_M_<|6J

diff --git a/tests/data/acpi/virt/DSDT b/tests/data/acpi/virt/DSDT
index 134d8ae5b602e0aaade6756b99c9abca45279284..c47503990715d389914fdf9c8bccb510761741ac 100644
GIT binary patch
delta 50
zcmcbjaYlp7CD<jzM}&caY5qhmX~y=AYLc8xe#;j-a&mF##=8XjvMf-X>?thI$T+!B
G_%Q%n84Z^J

delta 58
zcmX@3aYcj6CD<h-M1+BXiGL!OG-LlpHAzk;w-t*WIk`AY<6VM%Sr%wc_7s-qR9wJ5
OIg5*R3B%+};l}{F`45)>

diff --git a/tests/data/acpi/virt/DSDT.memhp b/tests/data/acpi/virt/DSDT.memhp
index 140976b23ebea792bec12435a2a547ac5f5cd8f9..bae36cdd397473afe3923c52f030641a5ab19d5d 100644
GIT binary patch
delta 52
zcmZ2#JlB}ZCD<iot|S8k(}9Ux(o7xGH>yi;GWjiE?8wQ*p&RcK?8~x1ak8hdJR{@g
ILSYj&0ETJ})&Kwi

delta 60
zcmbPhywsS>CD<iosU!mfll??4X{Lr58`UK^ncP+^cI4#ZFpYN!_GMY1IoVTKo>OrF
Q`{XPx)+G#^Glfmq0PR!{)&Kwi

diff --git a/tests/data/acpi/virt/DSDT.numamem b/tests/data/acpi/virt/DSDT.numamem
index 134d8ae5b602e0aaade6756b99c9abca45279284..c47503990715d389914fdf9c8bccb510761741ac 100644
GIT binary patch
delta 50
zcmcbjaYlp7CD<jzM}&caY5qhmX~y=AYLc8xe#;j-a&mF##=8XjvMf-X>?thI$T+!B
G_%Q%n84Z^J

delta 58
zcmX@3aYcj6CD<h-M1+BXiGL!OG-LlpHAzk;w-t*WIk`AY<6VM%Sr%wc_7s-qR9wJ5
OIg5*R3B%+};l}{F`45)>

diff --git a/tests/data/acpi/virt/DSDT.pxb b/tests/data/acpi/virt/DSDT.pxb
index 46b9c4cad5d65cb1b578410fb3168b70a05021be..fbd78f44c4785d19759daea909fe6d6f9a6e6b01 100644
GIT binary patch
delta 78
zcmeCT`ESkT66_N4UzUM^Y5znn8OFOC)g?F?9XC60Hgj_5#=8XjvMf-Xd|F7Ji*bn{
YGb2NEli%{ie}uSD<QN$z>&QL^0Gn_Z9smFU

delta 94
zcmexw-EYI?66_MfFUP>ZG;bo84CB3x>Jprco|_#wn>jg5<6VM%Sr%wc{v#tVq_}{6
hauyfs5{4y$%!~}tO>Qd|e-YwBQNsyWGg(IVF#z_a8;k$|

-- 
MST


