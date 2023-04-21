Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 708EF6EA71E
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 11:36:31 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppn9G-0008Fk-Rk; Fri, 21 Apr 2023 05:33:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ppn9B-0008Ey-3b
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 05:33:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ppn99-00033L-Qk
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 05:33:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682069619;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=miZ3caixvSzIMJGCwUwQ5pmV5rVaoDsa/ATAW82Zcww=;
 b=W2KwJe4PV9P0S/RZ+r0Tuk9pPU/akUbyylNF73emnmcOY+tzYpQlnqiDOWuHGrao3144lb
 N8jci0jVe+sSYpZkOr+gmJVvXbOuHV0ApRzexdEx94lSkgOBixTBuomxV5GueHw0fCeEX+
 nMUvwNAAKud4OmJx13zus7Zft2Ou8/Q=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-247-vSl9lE9-PmeJMkW3PhOlqw-1; Fri, 21 Apr 2023 05:33:33 -0400
X-MC-Unique: vSl9lE9-PmeJMkW3PhOlqw-1
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-94a34e35f57so117086666b.3
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 02:33:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682069612; x=1684661612;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=miZ3caixvSzIMJGCwUwQ5pmV5rVaoDsa/ATAW82Zcww=;
 b=im1vP5h36ULmYJeTvOcWMT+PjYAFyDfvQHZKBEi8frktjWl/ECFPwy/hm0dxvvDNVU
 tjs+I7H3d6fms7FcjUip0ap4lEJdIMmLa+osAK/OzNBYOVqbeGv0dnZX0fHcFp3GHImL
 ElYgRrg9JTTRe94t5IeXQaOPCMTARGl7NVrwW8aJy2tri9vNP0Zo450mxwE9lrONkLuD
 8sci1uJz2fCKpaUr5CvXN0Sm2GktmbfXk6+5T7Kyy4ae9GhZADxfc/l4sVlzi1s/xQ2R
 dLONV/ZAoSdRPKgSmwN2CWb3lzt0PZLZasfyji6Sh1cG4wNBcp2xFoLi+q3AavjnfRV9
 +HYA==
X-Gm-Message-State: AAQBX9eoXG1a3KQ2mksHXNTlwcjnr7/06tSd3FdX0o3WLV5S9JBF+rx9
 cQPg1d/p53Toc3GUkaDnHBTLYHJab9EcVDDZMQZBJVkq5GaXLCbOqRiQSYzJC9za8jOv6VdwVCH
 MA3F7ktq8zgczDOCauQWgskSLJrj52Auh9gK2ljDBQvkusyOafa9za1eQW4R77WxFAWC2sj6JfM
 vVpw==
X-Received: by 2002:a17:907:a684:b0:933:3814:e0f4 with SMTP id
 vv4-20020a170907a68400b009333814e0f4mr1748413ejc.16.1682069611920; 
 Fri, 21 Apr 2023 02:33:31 -0700 (PDT)
X-Google-Smtp-Source: AKy350bi8Q1nfXVqjwH8KE6Yz4+3UdkrZQhz8DbfiiLire2HB3S7qXyKt+KgLac74PMQopOY4zDjmg==
X-Received: by 2002:a17:907:a684:b0:933:3814:e0f4 with SMTP id
 vv4-20020a170907a68400b009333814e0f4mr1748393ejc.16.1682069611440; 
 Fri, 21 Apr 2023 02:33:31 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 v26-20020a170906b01a00b009538cee14dasm1831172ejy.93.2023.04.21.02.33.30
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Apr 2023 02:33:30 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/25] coverity: update COMPONENTS.md
Date: Fri, 21 Apr 2023 11:33:01 +0200
Message-Id: <20230421093316.17941-11-pbonzini@redhat.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230421093316.17941-1-pbonzini@redhat.com>
References: <20230421093316.17941-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hexagon is split into two components because it has hundreds of false positives
in the generated files.

capstone and slirp have been removed.

hw/nvme is added to block.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/coverity-scan/COMPONENTS.md | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/scripts/coverity-scan/COMPONENTS.md b/scripts/coverity-scan/COMPONENTS.md
index 639dcee45a01..7c48e0f1d215 100644
--- a/scripts/coverity-scan/COMPONENTS.md
+++ b/scripts/coverity-scan/COMPONENTS.md
@@ -12,6 +12,9 @@ avr
 cris
   ~ (/qemu)?((/include)?/hw/cris/.*|/target/cris/.*)
 
+hexagon-gen (component should be ignored in analysis)
+  ~ (/qemu)?(/target/hexagon/.*generated.*)
+
 hexagon
   ~ (/qemu)?(/target/hexagon/.*)
 
@@ -64,14 +67,11 @@ audio
   ~ (/qemu)?((/include)?/(audio|hw/audio)/.*)
 
 block
-  ~ (/qemu)?(/block.*|(/include?)(/hw)?/(block|storage-daemon)/.*|(/include)?/hw/ide/.*|/qemu-(img|io).*|/util/(aio|async|thread-pool).*)
+  ~ (/qemu)?(/block.*|(/include?)/(block|storage-daemon)/.*|(/include)?/hw/(block|ide|nvme)/.*|/qemu-(img|io).*|/util/(aio|async|thread-pool).*)
 
 char
   ~ (/qemu)?(/qemu-char\.c|/include/sysemu/char\.h|(/include)?/hw/char/.*)
 
-capstone
-  ~ (/qemu)?(/capstone/.*)
-
 crypto
   ~ (/qemu)?((/include)?/crypto/.*|/hw/.*/crypto.*)
 
@@ -108,9 +108,6 @@ qemu-ga
 scsi
   ~ (/qemu)?(/scsi/.*|/hw/scsi/.*|/include/hw/scsi/.*)
 
-slirp (component should be ignored in analysis)
-  ~ (/qemu)?(/slirp/.*)
-
 tcg
   ~ (/qemu)?(/accel/tcg/.*|/replay/.*|/(.*/)?softmmu.*)
 
-- 
2.40.0


