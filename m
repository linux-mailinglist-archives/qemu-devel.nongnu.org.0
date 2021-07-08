Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB31B3C1636
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 17:42:30 +0200 (CEST)
Received: from localhost ([::1]:42294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1WAX-00014b-AW
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 11:42:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m1Vn4-0000pA-0u
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:18:14 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:45963)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m1Vmy-0008FR-U9
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:18:13 -0400
Received: by mail-ed1-x52d.google.com with SMTP id t3so8994741edt.12
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 08:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/Iv10jXl0e7Uri5p1LK00hnQfO9Q7szAFv5OMxF4rGU=;
 b=n+/N2+OmVGiMcY+aCbw5zD3yF8vycZUuTCU2efxkNc5fDik5vQ6NZWrEg43tomhzWK
 U5+naVg+GOAEgdlxrOWwoFhOqKipBKZWPeCldgFD13CQFo6EpG6i7mWOCB/rBjqUIX7V
 vboFP0P0Y/h2Taw0aK/IM0Rv048uWkvqk50BcdD71v2xOQjElxow89ocREqZogly7ZN3
 WIOv014xJ6VgyQBR7p+Ezk/3dirJ84RVQObyFWCfg+WwOG2M7nkvLC4oIt0nMjoV3e01
 a0r5c2Xy0OBNtG6LtyQFUdpOqP+g3+LjeyyYuZNne/D8NC+HGp3qU4VLkIK3nlbNJ0wD
 9RKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=/Iv10jXl0e7Uri5p1LK00hnQfO9Q7szAFv5OMxF4rGU=;
 b=Gsz6lznukhxU/V75He0laSjlMJHRHfaHa0N3ko3+vHlQhUa19IXxiE5yuQzd+u4Awf
 Z5WOINoZU+ySGv2uExXEMAznQRVoAJxIJSqoar0wFiK+mvguO7oAtPgdDKC5Dra902IA
 BKzY8rDXCzcT8btxgql+O+dklS/je4clLLdr/Yk5WbXP1YNmK64se0rre6aROZQqzntp
 sxbIRCGgCPcSuRnQ1vkpOWhXbwUkNTpYpOoHXrGNAavY5E1ERMcyCBp+yK9Q5U+Tm3eJ
 Mu+P8lYx9h/o8zieiMuJCdmPoMGyeZNL6NYz7klQPXloNKVCDVhbTH3c4XmP2NCmx3Eb
 njoA==
X-Gm-Message-State: AOAM530GZO3CF+wWrOuC08EtKlN+J9Wm+SzhF0H7TO0elhSxg+axTWHD
 CWpMt45ZRdQ1EF9LY9xpWsCx/e5OGEU=
X-Google-Smtp-Source: ABdhPJxawCmKPDUp0fuIjfKTl0aIc/OX56jtV2ZINOedP3qOFEx8Auz3YOFLxu9SQ40HoOt+SlPGrA==
X-Received: by 2002:aa7:cd85:: with SMTP id x5mr39074313edv.115.1625757487701; 
 Thu, 08 Jul 2021 08:18:07 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id ak16sm1103694ejc.17.2021.07.08.08.18.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 08:18:07 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 25/48] modules: add documentation for module sourcesets
Date: Thu,  8 Jul 2021 17:17:25 +0200
Message-Id: <20210708151748.408754-26-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210708151748.408754-1-pbonzini@redhat.com>
References: <20210708151748.408754-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, "Jose R . Ziviani" <jziviani@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gerd Hoffmann <kraxel@redhat.com>

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Jose R. Ziviani <jziviani@suse.de>
Message-Id: <20210624103836.2382472-22-kraxel@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 docs/devel/build-system.rst | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/docs/devel/build-system.rst b/docs/devel/build-system.rst
index 7ef36f42d0..fd1650442e 100644
--- a/docs/devel/build-system.rst
+++ b/docs/devel/build-system.rst
@@ -272,6 +272,23 @@ Target-dependent emulator sourcesets:
     target_arch += {'arm': arm_ss}
     target_softmmu_arch += {'arm': arm_softmmu_ss}
 
+Module sourcesets:
+  There are two dictionaries for modules: `modules` is used for
+  target-independent modules and `target_modules` is used for
+  target-dependent modules.  When modules are disabled the `module`
+  source sets are added to `softmmu_ss` and the `target_modules`
+  source sets are added to `specific_ss`.
+
+  Both dictionaries are nested.  One dictionary is created per
+  subdirectory, and these per-subdirectory dictionaries are added to
+  the toplevel dictionaries.  For example::
+
+    hw_display_modules = {}
+    qxl_ss = ss.source_set()
+    ...
+    hw_display_modules += { 'qxl': qxl_ss }
+    modules += { 'hw-display': hw_display_modules }
+
 Utility sourcesets:
   All binaries link with a static library `libqemuutil.a`.  This library
   is built from several sourcesets; most of them however host generated
-- 
2.31.1



