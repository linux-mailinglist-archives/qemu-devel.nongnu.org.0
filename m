Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9422D5FA361
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 20:31:05 +0200 (CEST)
Received: from localhost ([::1]:46408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohxYO-0000jt-DD
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 14:31:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ohwc6-0002y1-DW
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 13:30:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51132)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ohwc0-00074M-QY
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 13:30:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665423044;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=J8UxNmNb6BFssnqxntW2+QMQWj8bFAflVBTk3/hujDw=;
 b=OnUqifXJaePXKuckMFAc738ldnPVfTX3YZ0PoCwZpgE74JeYOdSzxb9e88qkWintbSpxsw
 TYtO7tYyIJkGx86c+7DIIPOIBL2osboSKu+y6QXHaXsibCS3XuLnk8ZkaCA4/pe1tqCJI3
 y/1/c+YIUy6/IJk91p0eIcPTlfly960=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-374-t7dF3SeyNFeLBfuvnC6sWA-1; Mon, 10 Oct 2022 13:30:43 -0400
X-MC-Unique: t7dF3SeyNFeLBfuvnC6sWA-1
Received: by mail-wm1-f69.google.com with SMTP id
 h129-20020a1c2187000000b003bf635eac31so4255975wmh.4
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 10:30:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J8UxNmNb6BFssnqxntW2+QMQWj8bFAflVBTk3/hujDw=;
 b=luZ7FbDI+EDIszUwHgTFSMci0sJvZBoFt+05s6+NSSXIjbz5l3puo8/wBNCKpsHy9l
 Q/UySDQVP0jXTxP0t+I4ThH6JDjjzc2sfCXyRkKYni4+doU9QH1zNMfhG09E7rNQCbM4
 T1VtzfdR8DlCi5mpe7bA/qzcMt4toAkFxy6NG0C87+mEAjmSfR4YgiivELf92PCX27jU
 M8oTaSdLOasNd7++QF9+lUx1ETdbR4AYck8YctjcSSiuy9KitBrocVTSAymRbqZe0seW
 TkVzhSZkV2sI1PPOdh0GkzbEg4Ep/pHPyHDgdbyoixExRenlQbM7HYeqlWQ2awdHTeV9
 5BPw==
X-Gm-Message-State: ACrzQf2honztYxBTC8yuXrVyP8EzQ9lpgv7X2sx/gSkeITKQIyyAyTRD
 k8cYskaUIYH+l+p5dis2HzTcLOqfKHbVqpTnckJv72BsbsG4O6H3GMP12QlzmHevX+R1/JW4XDc
 aGK+U3KALhio0YqYdgr3E5Ot0m3nPSBoJEMoVnUUR0fgSiuF+UNEIg3MTyIqS
X-Received: by 2002:a05:600c:3c8a:b0:3b4:eff4:a94f with SMTP id
 bg10-20020a05600c3c8a00b003b4eff4a94fmr20286690wmb.105.1665423041551; 
 Mon, 10 Oct 2022 10:30:41 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM65GBSKLvoQAds+ETQntjzZ5F8PS5Ooz2sizqAwSMQW153mY9lmXEtTV8BLr1vzJRaMVkcN9Q==
X-Received: by 2002:a05:600c:3c8a:b0:3b4:eff4:a94f with SMTP id
 bg10-20020a05600c3c8a00b003b4eff4a94fmr20286668wmb.105.1665423041112; 
 Mon, 10 Oct 2022 10:30:41 -0700 (PDT)
Received: from redhat.com ([2.55.183.131]) by smtp.gmail.com with ESMTPSA id
 k2-20020a5d6d42000000b0022e049586c5sm9364198wri.28.2022.10.10.10.30.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 10:30:40 -0700 (PDT)
Date: Mon, 10 Oct 2022 13:30:37 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Miguel Luis <miguel.luis@oracle.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>
Subject: [PULL 27/55] tests/acpi: virt: update ACPI GTDT binaries
Message-ID: <20221010172813.204597-28-mst@redhat.com>
References: <20221010172813.204597-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221010172813.204597-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Miguel Luis <miguel.luis@oracle.com>

Step 6 & 7 of the bios-tables-test.c documented procedure.

Differences between disassembled ASL files for GTDT:

    @@ -13,14 +13,14 @@
     [000h 0000   4]                    Signature : "GTDT"    [Generic Timer Description Table]
     [004h 0004   4]                 Table Length : 00000060
     [008h 0008   1]                     Revision : 02
    -[009h 0009   1]                     Checksum : 8C
    +[009h 0009   1]                     Checksum : 9C
     [00Ah 0010   6]                       Oem ID : "BOCHS "
     [010h 0016   8]                 Oem Table ID : "BXPC    "
     [018h 0024   4]                 Oem Revision : 00000001
     [01Ch 0028   4]              Asl Compiler ID : "BXPC"
     [020h 0032   4]        Asl Compiler Revision : 00000001

    -[024h 0036   8]        Counter Block Address : 0000000000000000
    +[024h 0036   8]        Counter Block Address : FFFFFFFFFFFFFFFF
     [02Ch 0044   4]                     Reserved : 00000000

     [030h 0048   4]         Secure EL1 Interrupt : 0000001D
    @@ -46,16 +46,16 @@
                                     Trigger Mode : 0
                                         Polarity : 0
                                        Always On : 0
    -[050h 0080   8]   Counter Read Block Address : 0000000000000000
    +[050h 0080   8]   Counter Read Block Address : FFFFFFFFFFFFFFFF

     [058h 0088   4]         Platform Timer Count : 00000000
     [05Ch 0092   4]        Platform Timer Offset : 00000000

     Raw Table Data: Length 96 (0x60)

    -    0000: 47 54 44 54 60 00 00 00 02 8C 42 4F 43 48 53 20  // GTDT`.....BOCHS
    +    0000: 47 54 44 54 60 00 00 00 02 9C 42 4F 43 48 53 20  // GTDT`.....BOCHS
         0010: 42 58 50 43 20 20 20 20 01 00 00 00 42 58 50 43  // BXPC    ....BXPC
    -    0020: 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    +    0020: 01 00 00 00 FF FF FF FF FF FF FF FF 00 00 00 00  // ................
         0030: 1D 00 00 00 00 00 00 00 1E 00 00 00 04 00 00 00  // ................
         0040: 1B 00 00 00 00 00 00 00 1A 00 00 00 00 00 00 00  // ................
    -    0050: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    +    0050: FF FF FF FF FF FF FF FF 00 00 00 00 00 00 00 00  // ................

Signed-off-by: Miguel Luis <miguel.luis@oracle.com>
Message-Id: <20220920162137.75239-4-miguel.luis@oracle.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Acked-by: Ani Sinha <ani@anisinha.ca>
---
 tests/qtest/bios-tables-test-allowed-diff.h |   3 ---
 tests/data/acpi/virt/GTDT                   | Bin 96 -> 96 bytes
 tests/data/acpi/virt/GTDT.memhp             | Bin 96 -> 96 bytes
 tests/data/acpi/virt/GTDT.numamem           | Bin 96 -> 96 bytes
 4 files changed, 3 deletions(-)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index 957bd1b4f6..dfb8523c8b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,4 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/virt/GTDT",
-"tests/data/acpi/virt/GTDT.memhp",
-"tests/data/acpi/virt/GTDT.numamem",
diff --git a/tests/data/acpi/virt/GTDT b/tests/data/acpi/virt/GTDT
index 9408b71b59c0e0f2991c0053562280155b47bc0b..6f8cb9b8f30b55f4c93fe515982621e3db50feb2 100644
GIT binary patch
delta 45
kcmYdD;BpUf2}xjJU|^avkxPo>KNL*VQ4xT#fs$YV0LH=;ng9R*

delta 45
jcmYdD;BpUf2}xjJU|{N*$R))AWPrg$9Tfo>8%6^Foy!E8

diff --git a/tests/data/acpi/virt/GTDT.memhp b/tests/data/acpi/virt/GTDT.memhp
index 9408b71b59c0e0f2991c0053562280155b47bc0b..6f8cb9b8f30b55f4c93fe515982621e3db50feb2 100644
GIT binary patch
delta 45
kcmYdD;BpUf2}xjJU|^avkxPo>KNL*VQ4xT#fs$YV0LH=;ng9R*

delta 45
jcmYdD;BpUf2}xjJU|{N*$R))AWPrg$9Tfo>8%6^Foy!E8

diff --git a/tests/data/acpi/virt/GTDT.numamem b/tests/data/acpi/virt/GTDT.numamem
index 9408b71b59c0e0f2991c0053562280155b47bc0b..6f8cb9b8f30b55f4c93fe515982621e3db50feb2 100644
GIT binary patch
delta 45
kcmYdD;BpUf2}xjJU|^avkxPo>KNL*VQ4xT#fs$YV0LH=;ng9R*

delta 45
jcmYdD;BpUf2}xjJU|{N*$R))AWPrg$9Tfo>8%6^Foy!E8

-- 
MST


