Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08EFA314381
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 00:11:06 +0100 (CET)
Received: from localhost ([::1]:49408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9FgP-0001Oq-1u
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 18:11:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l9BCd-0003WF-It
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 13:24:03 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:42029)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l9BCX-0006El-Oe
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 13:23:58 -0500
Received: by mail-wr1-x433.google.com with SMTP id r21so2150206wrr.9
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 10:23:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BLWzLjUfsLqLzWMs+J77xBL5O0bPOMZrdfzCWZyojPE=;
 b=cvEcn73BcvDO44LSKAHov81EzuSKHnNe8WCKC1urwKltApGAbNKxhd/6/tYCBgaxGH
 w002uHfHJS2AAGiREghCAC+QAEzwhfR8izQ54xn0aAso8jwY6/CogfZ07gtzks3f3GWX
 OasW7tiqTzEaEnIq3yAEhDN7JcqPwR004ZaYEom3J6GjfaEQkGDY4A7CLBi/0n4GCsTI
 /Gdpk92g7SxUU/0RM8WQ9TNUye7STapHTkYB8F+D1n74NXn9Zl0dYB27EgmNqQfWwYnY
 AYtHERKmsIDPOe5DVJXlZSY7a1KSuxREOjIedtXY1eWxlyDLyQSlV7d1gt3mYldta1+j
 6glA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=BLWzLjUfsLqLzWMs+J77xBL5O0bPOMZrdfzCWZyojPE=;
 b=S05VzLUxm9WGPSHSPMthpkdPBLIdsdXa3XcizH6EOTDUnoPdPYXQtRCfl4KIgNkvNO
 D/NMRZtQXJSPKR87qKkKh7EYYs4GR/VPnpZVTVIUznfT8FSfcw8xhJA0QHiXw+K4QfVK
 /kZNE67l5ORTS3BGG5n9aApi6ykCUwPRhclPC0KX3+Ilw9rVh8x2duX8SSiqnd2bCYvy
 k6Nl06bDzTCmK8LrMf0fItL8qqDHGr/h8bIvpNZGM8fRc86w2bRT0UzIVd+SAp339jjt
 VOcTSQF3CcG81f20o74YHA7FfB6eRXaSnr9+FgZPxouzMZWbIcztqEgINj3k5Vb3n2GK
 6qFQ==
X-Gm-Message-State: AOAM533pZpqkyvKR5ZHaN/2l1fRwaWolXDMeBBUrqKjlUjT+7Mc2hqTt
 X91Q1GUIBtC9EZIPL+EVhFh30QvvxBgleA==
X-Google-Smtp-Source: ABdhPJxG3E7qxDDWdYi7TfPHSEDIaelrs+PEeRmCGBoKSk/Ez5sj0VkzYWJXEl0JPhND6JgBy208sg==
X-Received: by 2002:a5d:640c:: with SMTP id z12mr21210233wru.342.1612808636548; 
 Mon, 08 Feb 2021 10:23:56 -0800 (PST)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 x22sm19670wmc.25.2021.02.08.10.23.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 10:23:56 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 25/46] meson: Merge trace_events_subdirs array
Date: Mon,  8 Feb 2021 19:23:10 +0100
Message-Id: <20210208182331.58897-26-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210208182331.58897-1-pbonzini@redhat.com>
References: <20210208182331.58897-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Claudio Fontana <cfontana@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

The trace_events_subdirs array is split in two different
locations, merge it as one.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Claudio Fontana <cfontana@suse.de>
Message-Id: <20210122204441.2145197-7-philmd@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build | 28 +++++++++++++---------------
 1 file changed, 13 insertions(+), 15 deletions(-)

diff --git a/meson.build b/meson.build
index 0ca73d0102..da21812064 100644
--- a/meson.build
+++ b/meson.build
@@ -1744,7 +1744,20 @@ trace_events_subdirs = [
   'accel/kvm',
   'accel/tcg',
   'crypto',
+  'hw/core',
+  'qapi',
+  'qom',
   'monitor',
+  'target/arm',
+  'target/hppa',
+  'target/i386',
+  'target/i386/kvm',
+  'target/mips',
+  'target/ppc',
+  'target/riscv',
+  'target/s390x',
+  'target/sparc',
+  'util',
 ]
 if have_user
   trace_events_subdirs += [ 'linux-user' ]
@@ -1817,21 +1830,6 @@ if have_system
     'ui',
   ]
 endif
-trace_events_subdirs += [
-  'hw/core',
-  'qapi',
-  'qom',
-  'target/arm',
-  'target/hppa',
-  'target/i386',
-  'target/i386/kvm',
-  'target/mips',
-  'target/ppc',
-  'target/riscv',
-  'target/s390x',
-  'target/sparc',
-  'util',
-]
 
 vhost_user = not_found
 if 'CONFIG_VHOST_USER' in config_host
-- 
2.29.2



