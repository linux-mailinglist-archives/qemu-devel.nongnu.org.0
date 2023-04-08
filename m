Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6751A6DB7B0
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Apr 2023 02:12:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkwAd-0003BZ-RI; Fri, 07 Apr 2023 20:11:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <casantos@redhat.com>)
 id 1pkwAc-0003B8-0S
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 20:11:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <casantos@redhat.com>)
 id 1pkwAY-0004xB-5H
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 20:11:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680912660;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=EOUnZWgHr3yewzZ84CYw6CF0CpmkfMoZx/iEHJcgiqU=;
 b=b28nU80kT71GiujQ2sgSe6hF1rCdmnjDSnzl0JVxmpdcB0G78ovziyTruCqylyCukv9is6
 yjxTd83x4Tfrs/JpPvNhoRcom9kqZXTkH3g4j2mVmfgSyJRYtYTdpTlb/fKzwKKxU8BlIP
 wzHXRW83f1KePR/AG9VOCkoQyWxy95k=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-144-Zn38R-1KNZSjbCmKaEQGIw-1; Fri, 07 Apr 2023 20:10:58 -0400
X-MC-Unique: Zn38R-1KNZSjbCmKaEQGIw-1
Received: by mail-oi1-f197.google.com with SMTP id
 a9-20020a05680802c900b00388734df7e8so10236220oid.15
 for <qemu-devel@nongnu.org>; Fri, 07 Apr 2023 17:10:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680912657;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EOUnZWgHr3yewzZ84CYw6CF0CpmkfMoZx/iEHJcgiqU=;
 b=pF/ogbBbdqgHbmR405lG3cqX24gPuOcBfkw8PuRhnmwTxJ9Ca/uJO1jY/esjbtsxVR
 jt/cry8s6rm4WHMp+1nnYD0q9Dw6hL9g5vYIn2583IOGatkz8nwe2DKJ/ATmkUgcq5BK
 nRY9mWunZBWK+/EJF8cZb3UfUaR4/3SIm0OrBJjo/Qp1yMzq9kPfbFGRQUG4lEdqoDOd
 rYBVtCs87DIupmU6cB6LH0sPXMNkjBzqAKEwRqk4tQjtNZ9XFveD3ti0BKLzGCjsaeeu
 UGjm+Ly98gaVxgV4oG3JMqcBSK+7eBZBpiei2Whx52yJqU+AyWBiAMfVXo1EJDhDlBCo
 AUNQ==
X-Gm-Message-State: AAQBX9d6yNE6/WwxFEiMhIiIxGtdSl9dvELFzaySIYqJ70vMgjTsmYxT
 PJBvAVwPM/vyNI5i7mRmzSUh5DlntciVsMNl8s4kx4dM9Rq3IbUCjq3DYGUGgLID5qdDPl5rWCk
 6Vu0S1yvPRDTozyabPSmj33DqTRBN7PCtr5SUZXcCgrew71UOZ6zvBR+48j/Mi8xduA5Qm5orjO
 w=
X-Received: by 2002:a05:6870:51f:b0:17e:9b7:387b with SMTP id
 j31-20020a056870051f00b0017e09b7387bmr343725oao.11.1680912657559; 
 Fri, 07 Apr 2023 17:10:57 -0700 (PDT)
X-Google-Smtp-Source: AKy350auXEOro8E73MDURcU0avCJeY7dtsc4ph6lfApeO8oBh8eFn7wpbFiIVYO3/bCVJo1k8Jh2og==
X-Received: by 2002:a05:6870:51f:b0:17e:9b7:387b with SMTP id
 j31-20020a056870051f00b0017e09b7387bmr343714oao.11.1680912657264; 
 Fri, 07 Apr 2023 17:10:57 -0700 (PDT)
Received: from casantos.remote.csb ([177.158.136.22])
 by smtp.gmail.com with ESMTPSA id
 e5-20020a4a8f05000000b0054157801d51sm2074377ool.38.2023.04.07.17.10.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Apr 2023 17:10:56 -0700 (PDT)
From: casantos@redhat.com
To: qemu-devel@nongnu.org
Cc: Carlos Santos <casantos@redhat.com>
Subject: [PATCH V3] tracing: install trace events file only if necessary
Date: Fri,  7 Apr 2023 21:10:49 -0300
Message-Id: <20230408001049.206563-1-casantos@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=casantos@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Carlos Santos <casantos@redhat.com>

It is not useful when configuring with --enable-trace-backends=nop.

Signed-off-by: Carlos Santos <casantos@redhat.com>
---
Changes v1->v2:
  Install based on chosen trace backend, not on chosen emulators.
Changes v2->v3:
  Add missing comma
---
 trace/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/trace/meson.build b/trace/meson.build
index 8e80be895c..833bb57113 100644
--- a/trace/meson.build
+++ b/trace/meson.build
@@ -64,7 +64,7 @@ trace_events_all = custom_target('trace-events-all',
                                  input: trace_events_files,
                                  command: [ 'cat', '@INPUT@' ],
                                  capture: true,
-                                 install: true,
+                                 install: get_option('trace_backends') != 'nop',
                                  install_dir: qemu_datadir)
 
 if 'ust' in get_option('trace_backends')
-- 
2.31.1


