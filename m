Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E161961E11D
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Nov 2022 09:55:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orbPi-0001dj-4Q; Sun, 06 Nov 2022 03:53:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1orbPc-0001bQ-DE
 for qemu-devel@nongnu.org; Sun, 06 Nov 2022 03:53:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1orbPa-0002xg-MA
 for qemu-devel@nongnu.org; Sun, 06 Nov 2022 03:53:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667724830;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zWbMzkqJgDXOr6NW2yG11jDl9qhFdNJ29Vs/I+sbgC4=;
 b=RUaQ2LAXbmwKcE9rQhWztw4pdt9zzvzKq2WAzsN9hDdGGQOznOWGWAHYROmyv0aruAruDC
 26nvNb3z2QuJ8r6g+w2MXnSnTUAPHSg4Cw9BBfUHZ4OHrMH1LJzIoDBsGzPRs5jCDHOO+t
 0NwGzgOMF/Y5vw/rlsODF5+xHtNnrAA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-124-n1QHksn7OHme9cHmWmC7lw-1; Sun, 06 Nov 2022 03:53:48 -0500
X-MC-Unique: n1QHksn7OHme9cHmWmC7lw-1
Received: by mail-wm1-f69.google.com with SMTP id
 l42-20020a05600c1d2a00b003cf8e70c1ecso3320253wms.4
 for <qemu-devel@nongnu.org>; Sun, 06 Nov 2022 01:53:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zWbMzkqJgDXOr6NW2yG11jDl9qhFdNJ29Vs/I+sbgC4=;
 b=KgUBEkA7H8ZGj3g5V3P0Tkal7KBK2Xj+WrN4eRF0ukEot0vBN3aYPT/2HbfnS7nD6N
 W8YZ9lInlTO9WzIuFXo8B51O5CQqO78GrTDNDLNaOBfDxxoFhgDKGrZoltcgTbohPzjB
 98Ckx35dWvSZ4MCshO2VdzPzt7Ux3+RhirBHlhnPTPE8Z0zfivZdJRpzGj4Nqng2myO9
 FdN6MdZ7AQ7AfnDM/h7DnkBMJRs3z/NmLFKuzuXncd3l1vDuEkoyL1ZpfTv8q+aSpm6A
 FkZFGxib9Qwwty2OUtCHnfAjTqxLNEmppL/ZqH2HMTZG8EHq/OWaBN2erSi6w9SVYFZ7
 I1UA==
X-Gm-Message-State: ACrzQf1QvUIAWgrz0sYgRp6Wm+xJRhUQGutbHnuarvrELqJkL6hzyZqX
 8P9vp6SoP0tAcJ8B5RSyrGkh9v9418Cu2ZurWQxzK8Rkj3N5Rku155zXgy0yumf9dNSoYWgd3Sq
 6wkbqIdMnapeK7H4lp0on7bLMwOGZflKVvCSF3CysusWaKLGsU0G9FLjYeyYZXBQxPY8=
X-Received: by 2002:a5d:6088:0:b0:236:bd20:2d07 with SMTP id
 w8-20020a5d6088000000b00236bd202d07mr25142610wrt.165.1667724826976; 
 Sun, 06 Nov 2022 01:53:46 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4R9oPuGRT1/oKML+KrGAD2TCs3wNF/Xe3oC+SnAWes42mT/wrZYKVm3jzgASyn92yOnPp7Yw==
X-Received: by 2002:a5d:6088:0:b0:236:bd20:2d07 with SMTP id
 w8-20020a5d6088000000b00236bd202d07mr25142595wrt.165.1667724826693; 
 Sun, 06 Nov 2022 01:53:46 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:e3ec:5559:7c5c:1928])
 by smtp.gmail.com with ESMTPSA id
 u2-20020a5d4342000000b0022eafed36ebsm4166382wrr.73.2022.11.06.01.53.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Nov 2022 01:53:46 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Stefan Weil <sw@weilnetz.de>
Subject: [PULL 07/12] Add missing include statement for global xml_builtin
Date: Sun,  6 Nov 2022 09:51:10 +0100
Message-Id: <20221106085115.257018-8-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221106085115.257018-1-pbonzini@redhat.com>
References: <20221106085115.257018-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.045,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Stefan Weil <sw@weilnetz.de>

This fixes some compiler warnings with compiler flag
-Wmissing-variable-declarations (tested with clang):

    aarch64_be-linux-user-gdbstub-xml.c:564:19: warning: no previous extern declaration for non-static variable 'xml_builtin' [-Wmissing-variable-declarations]
    aarch64-linux-user-gdbstub-xml.c:564:19: warning: no previous extern declaration for non-static variable 'xml_builtin' [-Wmissing-variable-declarations]
    aarch64-softmmu-gdbstub-xml.c:1763:19: warning: no previous extern declaration for non-static variable 'xml_builtin' [-Wmissing-variable-declarations]

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/feature_to_c.sh | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/feature_to_c.sh b/scripts/feature_to_c.sh
index b1169899c19d..c1f67c8f6a57 100644
--- a/scripts/feature_to_c.sh
+++ b/scripts/feature_to_c.sh
@@ -56,6 +56,7 @@ for input; do
 done
 
 echo
+echo '#include "exec/gdbstub.h"'
 echo "const char *const xml_builtin[][2] = {"
 
 for input; do
-- 
2.38.1


