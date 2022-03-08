Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC4BF4D1B4C
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 16:03:17 +0100 (CET)
Received: from localhost ([::1]:57622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRbMr-0006D7-0F
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 10:03:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nRbGr-00061g-6s
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 09:57:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22415)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nRbGp-0000Nu-RH
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 09:57:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646751423;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AOuaxJrh/udoArFGv/EGvn5dbRXrbeeU/NAK4ZX8Ur8=;
 b=SsyIVvUJPdP9//HrU8Xhb+Vb2Ph8Hgy/Puwn1BQ7cjQwxzqacs+otlLGDe636EL5LvGGaB
 uDPctBilHNCXQ9SMW4BZNRc1ex8bGelkKMI3/pQ2fXRT4Rlp5O7SUMOkKtTs3NWTNUzyR9
 j/v4iWunCq3v5rW9UglwUpnp4bZHeL8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-630-cwEhAc1bPyeJB0cOuDe7hg-1; Tue, 08 Mar 2022 09:57:00 -0500
X-MC-Unique: cwEhAc1bPyeJB0cOuDe7hg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2C42B80EDB2;
 Tue,  8 Mar 2022 14:56:59 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.99])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DA34F865BE;
 Tue,  8 Mar 2022 14:56:58 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 9E21F18009A6; Tue,  8 Mar 2022 15:55:27 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 11/11] MAINTAINERS: take edk2
Date: Tue,  8 Mar 2022 15:55:21 +0100
Message-Id: <20220308145521.3106395-12-kraxel@redhat.com>
In-Reply-To: <20220308145521.3106395-1-kraxel@redhat.com>
References: <20220308145521.3106395-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 68adaac373c7..ad1c9a7ea133 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3144,7 +3144,7 @@ F: docs/interop/firmware.json
 
 EDK2 Firmware
 M: Philippe Mathieu-Daudé <f4bug@amsat.org>
-R: Gerd Hoffmann <kraxel@redhat.com>
+M: Gerd Hoffmann <kraxel@redhat.com>
 S: Supported
 F: hw/i386/*ovmf*
 F: pc-bios/descriptors/??-edk2-*.json
-- 
2.35.1


