Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 314CA2CB707
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 09:26:36 +0100 (CET)
Received: from localhost ([::1]:55644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkNT9-0005bB-7q
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 03:26:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNCF-0002gm-Bm
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:09:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45528)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNC9-0003ce-NN
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:09:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606896541;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Hc2sUJNPHxm3+YyKaEs1U6FlSeXyT0qB03hKc1hWp/o=;
 b=VYoTps3eqzdRiPJxlWLNjQm7sj2kJCf1I6fj6FDIM6Vw9GEjTVaTegTphXKGLuD3W/aqDs
 QcoCj9e0hOzwtuv6vmt6X73BEeguAwA0xlomfCf8AZ94oUP2x4bVseoYOCfkGwqMZrwTFa
 uZILUfl/SGdtyeMtgnZ0VpRvKVAfkgA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-211-JtxKvuEiPteQY91AclHt-g-1; Wed, 02 Dec 2020 03:08:59 -0500
X-MC-Unique: JtxKvuEiPteQY91AclHt-g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7206B8558EF
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:08:58 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 405A65C1B4
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:08:58 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 021/113] alpha: remove bios_name
Date: Wed,  2 Dec 2020 03:07:17 -0500
Message-Id: <20201202080849.4125477-22-pbonzini@redhat.com>
In-Reply-To: <20201202080849.4125477-1-pbonzini@redhat.com>
References: <20201202080849.4125477-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20201026143028.3034018-2-pbonzini@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/alpha/dp264.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/alpha/dp264.c b/hw/alpha/dp264.c
index 4d24518d1d..c4d407a9f1 100644
--- a/hw/alpha/dp264.c
+++ b/hw/alpha/dp264.c
@@ -107,7 +107,7 @@ static void clipper_init(MachineState *machine)
        but one explicitly written for the emulation, we might as
        well load it directly from and ELF image.  */
     palcode_filename = qemu_find_file(QEMU_FILE_TYPE_BIOS,
-                                bios_name ? bios_name : "palcode-clipper");
+                                      machine->firmware ?: "palcode-clipper");
     if (palcode_filename == NULL) {
         error_report("no palcode provided");
         exit(1);
-- 
2.26.2



