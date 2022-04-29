Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 359FA514F7C
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 17:30:55 +0200 (CEST)
Received: from localhost ([::1]:58678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkSa6-0003Qy-AQ
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 11:30:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nkSSl-0001hW-7j
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 11:23:19 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:40782)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nkSSj-00067U-IX
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 11:23:18 -0400
Received: by mail-ed1-x530.google.com with SMTP id p18so9462200edr.7
 for <qemu-devel@nongnu.org>; Fri, 29 Apr 2022 08:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=56Uzcfx5/2ZAiMjWDbw7MTVY0cGXIk+YsRTnWPe9dig=;
 b=KNZKKKXvqgvR01TNDVWNhtThYLmN98ZGZwjz4xF1pNXADauN/kbwtfyUny/kofJvuo
 7hSPIZhhe7zLrEEJzKFSP1vsUU38TGdRmIv05TRbGnIvyfqcO9/0vZIJtsR20Mgh3sL4
 COODLdD8Hz/66DV/cKUUk0UzLx8/3z7daYiHIsR7HA9FRvpcXuQ4LRk7/3608kn4vhVM
 8b3aR+d2+NPww5xEXpWUVvDAv2yfx84xJ5LJIcrbv9z9rNENg9ZKV61E/YK9KgZVj1QZ
 c5b9hgShzsmL2THHgBtYH4TuuVkOEF70wxg9mgOQ6NOKlcg+kv4cZqwxQTqm0lbyWOI7
 pILQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=56Uzcfx5/2ZAiMjWDbw7MTVY0cGXIk+YsRTnWPe9dig=;
 b=uzLuah2tAZCgdlRRnBvwVwdZtg8piCzyJGG5+Q4sEBAF5LyAlfZdJs0nrNR4a5naaa
 CpiXMkir+0ZS4QDCm4/9kpXlu2RTgC0QoK0wh61GB8/LlRZaVjWYmoVpUk5kDAoM/oDw
 CCrM1WTUEXcKiewbh1Z29BpZL3tnO3L0nef+/9m+7h7kb/ZaQ2xz/Jlh5k0HLLeDghcv
 O/VrAdVOJvIlfJmuGibl+/Gmyd9wkT8fIwlvgOaTCKi2t8TqpdI7k+STd4oCvUP4dwVb
 KHaJYCesW9xw9e1LUIr14aB2fJUgMjuH7LXNnjr9DYLG2SqPxPNdKf3TztHVyT3LWtwp
 8Q/w==
X-Gm-Message-State: AOAM533ScFHQIlUjUFnJH1741wEyoit3d+PmstZhd9/UYlJRo+rmE1WN
 p0AkoTvmoabA6c00QgpZB7iT4f3pVlyUYA==
X-Google-Smtp-Source: ABdhPJzkofTncL9V3jk5nx97TXxh98EbrwnbLh3J3+Hm0tFr954begNSgCwZMjU8KRzwi3B0lvIofQ==
X-Received: by 2002:aa7:c6c3:0:b0:425:b13b:94f with SMTP id
 b3-20020aa7c6c3000000b00425b13b094fmr41365806eds.313.1651245796072; 
 Fri, 29 Apr 2022 08:23:16 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 w25-20020a170907271900b006f3ef214dd6sm736395ejk.60.2022.04.29.08.23.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Apr 2022 08:23:15 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 03/25] qga-vss: always build qga-vss.tlb when qga-vss.dll is
 built
Date: Fri, 29 Apr 2022 17:22:50 +0200
Message-Id: <20220429152312.335715-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220429152312.335715-1-pbonzini@redhat.com>
References: <20220429152312.335715-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x530.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PP_MIME_FAKE_ASCII_TEXT=0.999, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Konstantin Kostiuk <kkostiuk@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Konstantin Kostiuk <kkostiuk@redhat.com>

Signed-off-by: Konstantin Kostiuk <kkostiuk@redhat.com>
Message-Id: <20220428181541.300619-1-kkostiuk@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 qga/vss-win32/meson.build | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/qga/vss-win32/meson.build b/qga/vss-win32/meson.build
index 71c50d0866..26c5dd6e0e 100644
--- a/qga/vss-win32/meson.build
+++ b/qga/vss-win32/meson.build
@@ -23,8 +23,6 @@ qga_vss = shared_module(
   ]
 )
 
-all_qga += qga_vss
-
 if midl.found()
   gen_tlb = custom_target('gen-tlb',
                           input: 'qga-vss.idl',
@@ -36,3 +34,5 @@ else
                           output: 'qga-vss.tlb',
                           command: [widl, '-t', '@INPUT@', '-o', '@OUTPUT@'])
 endif
+
+all_qga += [ qga_vss, gen_tlb ]
-- 
2.35.1



