Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD258571A8B
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 14:54:01 +0200 (CEST)
Received: from localhost ([::1]:34370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBFOq-0000Ev-UU
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 08:54:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oBFL7-00035v-9b
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 08:50:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52328)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oBFL4-0001QL-EN
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 08:50:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657630205;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+oHsL0UgmU4ocGnZ7i9v8K9QoHE3jM8d8IY14J+kYAE=;
 b=HGWwkcAugkfMz4P3XdJR85jUXQ9alXE5iRifL5LZx7gvVk9cbn8ZEbYGwwXY0wvJpT2Td8
 xM7xcU9vzo4CXjj3cK7P8xBIl1EMoHmsULIFXJEHhxbLUOA94f0qhDAxBY7X3KtcLxVeeR
 iXDe/ems3O2g9+ZFkh/VuGGHUJDwDnc=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-655-cmmks6LANTuy7Ilw8Ys7ug-1; Tue, 12 Jul 2022 08:50:04 -0400
X-MC-Unique: cmmks6LANTuy7Ilw8Ys7ug-1
Received: by mail-ej1-f71.google.com with SMTP id
 sh39-20020a1709076ea700b0072aa3156a68so2252571ejc.19
 for <qemu-devel@nongnu.org>; Tue, 12 Jul 2022 05:50:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+oHsL0UgmU4ocGnZ7i9v8K9QoHE3jM8d8IY14J+kYAE=;
 b=f56/TYL7ab8K/C77A7SbN7K0M/ZhfSseD9B5+aX19rOuxWLxweAtmkIPRc+2OjtY1n
 C4mJ4YpqR7C78WUF+er3xcaqC2cihVWBXh/B3s18zvfas8HlhIyBPFkZMY+V/2et0dti
 yvT+vrMDekBhQttgU0k58yP/8EROvBQFTSQjBgLVY9xcxqhjp30d6U8VQvqGmhL3lxI0
 XXY1DAg5vE571oscnqZ35NlWt5G/QfKvO9EjMvPzBcUXB/NeadWu8mTaHPWUh2CfeQdZ
 TaLZM5nyA4a0vC5JcmJrwXkzLiR5txbIUaTzBVm6lzqx5NM4/cCOIpkBoEympwFABn7V
 EClw==
X-Gm-Message-State: AJIora8M94/jD2/g8fYSNy7RXjLNg3FflUWQrk3YI1nqHBnZn8Cz8zmw
 r4WXX+Fy8+0XpPoBgXiTnuRvX5iKSpchcwaXg7vfJRHcjZ7eu/cVMX1Q4iJnnNFU41Oayt0V30U
 tTikPIsNgZlES5R6heT3NZTCk3ocxNcbVMQsIr5jEN8+4z7oni/EbotQfGnEspuGotuo=
X-Received: by 2002:a05:6402:5412:b0:435:5997:ccb5 with SMTP id
 ev18-20020a056402541200b004355997ccb5mr30832289edb.167.1657630203290; 
 Tue, 12 Jul 2022 05:50:03 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1ug682Dk4f4UHo5FVdS78vjvDP9FIBwrqN0sFO7K63diZrQ0bWtP1oV9QwCmE/eYrQ9EnxsaQ==
X-Received: by 2002:a05:6402:5412:b0:435:5997:ccb5 with SMTP id
 ev18-20020a056402541200b004355997ccb5mr30832235edb.167.1657630203075; 
 Tue, 12 Jul 2022 05:50:03 -0700 (PDT)
Received: from goa-sendmail ([93.56.169.184]) by smtp.gmail.com with ESMTPSA id
 x21-20020a170906149500b0072b2ef2757csm3733410ejc.180.2022.07.12.05.50.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jul 2022 05:50:02 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Mauro Matteo Cascella <mcascell@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: [PULL 02/18] scsi/lsi53c895a: fix use-after-free in lsi_do_msgout
 (CVE-2022-0216)
Date: Tue, 12 Jul 2022 14:49:40 +0200
Message-Id: <20220712124956.150451-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220712124956.150451-1-pbonzini@redhat.com>
References: <20220712124956.150451-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mauro Matteo Cascella <mcascell@redhat.com>

Set current_req->req to NULL to prevent reusing a free'd buffer in case of
repeated SCSI cancel requests. Thanks to Thomas Huth for suggesting the patch.

Fixes: CVE-2022-0216
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/972
Signed-off-by: Mauro Matteo Cascella <mcascell@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20220705200543.2366809-1-mcascell@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/scsi/lsi53c895a.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/scsi/lsi53c895a.c b/hw/scsi/lsi53c895a.c
index c8773f73f7..99ea42d49b 100644
--- a/hw/scsi/lsi53c895a.c
+++ b/hw/scsi/lsi53c895a.c
@@ -1028,8 +1028,9 @@ static void lsi_do_msgout(LSIState *s)
         case 0x0d:
             /* The ABORT TAG message clears the current I/O process only. */
             trace_lsi_do_msgout_abort(current_tag);
-            if (current_req) {
+            if (current_req && current_req->req) {
                 scsi_req_cancel(current_req->req);
+                current_req->req = NULL;
             }
             lsi_disconnect(s);
             break;
-- 
2.36.1



