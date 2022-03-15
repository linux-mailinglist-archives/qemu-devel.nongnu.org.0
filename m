Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF0D54D96B2
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 09:48:54 +0100 (CET)
Received: from localhost ([::1]:50626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU2rN-00042r-OP
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 04:48:53 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nU2g5-0008Pt-Nm
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 04:37:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27918)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nU2g4-00041F-Cf
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 04:37:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647333431;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WJ5TjYfliDYkbjZRA6L+zUkTY8TurSq5k/0S6YFPcIw=;
 b=Dx2YWV9wdaJ+gKOF+L1tcUY6hqRw9BG5qjnL5ehdATXFnvS5UdEtP1OduU7ZxH+9CVrh5h
 NwxRTsg8wChsoHXV6W0wvx2vDZ6LfRwKt3A10lMrKBm+hbyZ1W5mzI4K1r49qFGdO6bNDN
 Q/Fzr0dUs0hsKA6GnZk+vfuiKe5x9zM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-652-7UtuSH-sNCWErxsL8i-BhA-1; Tue, 15 Mar 2022 04:37:09 -0400
X-MC-Unique: 7UtuSH-sNCWErxsL8i-BhA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 97A3B10665A2;
 Tue, 15 Mar 2022 08:37:08 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.196.67])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4F1F37CB812;
 Tue, 15 Mar 2022 08:37:08 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 527C218003A3; Tue, 15 Mar 2022 09:37:02 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 07/11] tests/acpi: update expected data files
Date: Tue, 15 Mar 2022 09:36:52 +0100
Message-Id: <20220315083656.1949517-8-kraxel@redhat.com>
In-Reply-To: <20220315083656.1949517-1-kraxel@redhat.com>
References: <20220315083656.1949517-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The switch to edk2 RELEASE builds changes the memory layout a bit,
resulting in a acpi table change.

See commits ca26041500eb ("edk2: switch to release builds") and
3891a5996fee ("edk2: update binaries to stable202202")

 DefinitionBlock ("", "SSDT", 1, "BOCHS ", "NVDIMM", 0x00000001)
 {
     Scope (\_SB)
     {
         Device (NVDR)
         {
             Name (_HID, "ACPI0012" /* NVDIMM Root Device */)  // _HID: Hardware ID
             Method (NCAL, 5, Serialized)
             {
                 Local6 = MEMA /* \MEMA */
                 {
                     Return (NCAL (Arg0, Arg1, Arg2, Arg3, 0x02))
                 }
             }

             Device (NV02)
             {
                 Name (_ADR, 0x03)  // _ADR: Address
                 Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                 {
                     Return (NCAL (Arg0, Arg1, Arg2, Arg3, 0x03))
                 }
             }
         }
     }

-    Name (MEMA, 0x43D10000)
+    Name (MEMA, 0x43F50000)
 }

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Acked-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/data/acpi/virt/SSDT.memhp | Bin 736 -> 736 bytes
 1 file changed, 0 insertions(+), 0 deletions(-)

diff --git a/tests/data/acpi/virt/SSDT.memhp b/tests/data/acpi/virt/SSDT.memhp
index 375d7b6fc85a484f492a26ccd355c205f2c34473..4c363a6d95a7e2e826568c85f5719127748e7932 100644
GIT binary patch
delta 22
dcmaFB`hb-yIM^lR0TTlQqx43uD@;sZodHo~2HXGu

delta 22
dcmaFB`hb-yIM^lR0TTlQqy0v%D@;rmodHrj2HXGu

-- 
2.35.1


