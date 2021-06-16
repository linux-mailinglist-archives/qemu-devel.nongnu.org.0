Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23CEF3AA5AC
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 22:52:32 +0200 (CEST)
Received: from localhost ([::1]:49900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltcWV-00005R-1f
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 16:52:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ltcOM-0001YF-Fj
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 16:44:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ltcOK-0000gU-O0
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 16:44:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623876244;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OS+iR2EbHbrCh3GIR2NY+qAi6yiZecwyyt8l9LOb9LA=;
 b=awXbKzEO69RhIFeIdBNN31tuzizAvwCaMnnjgyHhk84ZMtE+dYUZWgBl3x3qDZhaBL+iQ6
 sA9puemvJY/QrW3aHyQovwDvOXOFbQiou700bq9waQChpuapkOplJuXLK9HbXuKGYiwlX3
 1K5gEJa7gtKpRUIfRwW0pDYDR6iOT6s=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-90-lPGtveevPsewcXQpMOk1yQ-1; Wed, 16 Jun 2021 16:44:02 -0400
X-MC-Unique: lPGtveevPsewcXQpMOk1yQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 z4-20020adfe5440000b0290114f89c9931so1841603wrm.17
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 13:44:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OS+iR2EbHbrCh3GIR2NY+qAi6yiZecwyyt8l9LOb9LA=;
 b=Wy79LEmjTVk+KJQ8XvIe3cdLnEk5C2AbmrnENFg6Ym9qd+8s10HBUFfmYmEVByMo1a
 F2DnnYEWbB+XW8mS5b0cZVCkaw61+u3RXFAaZfUNxVJaqriGzZdcYjxBJ5CkeCNrV3qO
 YAb+Hp0BQ2S2IY7Ssqeor7OJLsqiCN368Sq1pTKyV6fNvHZuumjaKnmJONuna9+oi3+l
 Bzw7fG42t2XWPCSrbzUEKaf//Zx1EVA1BWw9qbj/JPLJNleCec3zkl+PTwWugjGr1gnS
 NZaShbjyj4B8bZGsS4CVQYDOlVD0fcVnWCeyWqaXUJeoqdd3sb0h0aAV/j2uwqGaElDJ
 mdFw==
X-Gm-Message-State: AOAM532UvyGoE+6auod+9zxKTzVGXFAMfs5fRp71J5vlJX1y49tix9O/
 iYuLjvig9QhrpPQBS9EZyY3p6Qf5L05Jq7iwaaftrBWfsjrNt4LZbDOciZAasjQhQMs2KRCVewp
 XMn6qG33y/EWbTcx3qkw3KwEkfKvKDiCJxMZVg80UhPZLgDnLZATubSjx1lcg00XX
X-Received: by 2002:a05:6000:180f:: with SMTP id
 m15mr1194026wrh.102.1623876241556; 
 Wed, 16 Jun 2021 13:44:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxlypmYLZSy5nbOxxeZgwxAYN44cERdqWbJ2rG7fb91lYXzRYluBpjGFmb5vPNXvFIZlc6m5w==
X-Received: by 2002:a05:6000:180f:: with SMTP id
 m15mr1193995wrh.102.1623876241362; 
 Wed, 16 Jun 2021 13:44:01 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id w2sm368281wrp.14.2021.06.16.13.43.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 13:44:00 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 05/23] target/i386/cpu: Add missing 'qapi/error.h' header
Date: Wed, 16 Jun 2021 22:43:10 +0200
Message-Id: <20210616204328.2611406-6-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210616204328.2611406-1-philmd@redhat.com>
References: <20210616204328.2611406-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: Laszlo Ersek <lersek@redhat.com>, Brijesh Singh <brijesh.singh@amd.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Connor Kuehl <ckuehl@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Dov Murik <dovmurik@linux.ibm.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit 00b81053244 ("target-i386: Remove assert_no_error usage")
forgot to add the "qapi/error.h" for &error_abort, add it now.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Connor Kuehl <ckuehl@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 target/i386/cpu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index a9fe1662d39..694031e4aec 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -27,6 +27,7 @@
 #include "sysemu/hvf.h"
 #include "kvm/kvm_i386.h"
 #include "sev_i386.h"
+#include "qapi/error.h"
 #include "qapi/qapi-visit-machine.h"
 #include "qapi/qmp/qerror.h"
 #include "qapi/qapi-commands-machine-target.h"
-- 
2.31.1


