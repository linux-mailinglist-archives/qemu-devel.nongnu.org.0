Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 616B733C4BD
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 18:46:37 +0100 (CET)
Received: from localhost ([::1]:45248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLrIa-0007b1-At
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 13:46:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lLrBa-0002xL-Qu
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 13:39:22 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:53859)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lLrBY-0006wD-Jx
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 13:39:22 -0400
Received: by mail-wm1-x329.google.com with SMTP id g20so8622241wmk.3
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 10:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2fdnCYcGz/rNz0f0M+8dUoADYZZ+wtTRYedFfAAe2jw=;
 b=AtaEbmYOhMS9fc8v4UC/ad7G4SRclAIN+2SQhGp1kE63SRYfmu6RE7fo+SX7eyYeVf
 PviyxW/USXOLQKx3Rdx2h9OxkypjWi+GeCg52RnnMJJHVWXr5jSrM1ljs1eGSEgfBO1u
 qLVTuH/npPvXac8CX5kbMK7ROAN/bFfOfivC2swkfBU/aJRqQrzP1f8+JAAcEYI36vgf
 PTpGCI2oKdXhuSCI2+IzSi4Htwzd3lG8DYWNFj9qrdOVv0a0a6vpBZp5trZlnAYZXnax
 MhTabAJgmfr966HmXpw8TmO4MrutaQvK9r7Z/PikDjmv47djR0bNK6DXSmx69Pw6wSaz
 iDEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=2fdnCYcGz/rNz0f0M+8dUoADYZZ+wtTRYedFfAAe2jw=;
 b=tBLnIEpgsbVTQESMlGA5HlXfZXifwqNqJr4qGbE9ZCIt3v4jjH9trp9AKw+OaC6t8P
 XPJXnJ9eI/EXiJmJlbb8FIC5nO0R+If/cTWaFCGj7wxRQvYFrnmkePWkg26ecJkjGsMZ
 8D5r/eY0XRo+lvXSmatZE0nkGNiw8btKCgCq3yomTNHPU30aQO7bmE8Ts9Dg7S0R/Lel
 p47+Y9Ysvlkrvs4/JogCky5eIifU86I2MzRwJ9zMiXjgSIJz0+k9YTRMmziKyIlBYp1T
 mTvVqRis+eddvtkqCkjlOT/4QSJhSf9UkkjcakOyjgKF9PL0BWpnGkh2Ht3PC67BIvzV
 5sYg==
X-Gm-Message-State: AOAM533aHcBFe9wdyCQ4KC7ANOMsvsa1ujH+eZjpagRS6qsMHztKps6t
 Bm4BREEdyuWLkYXtVZfRZ6EaFXAwQlA=
X-Google-Smtp-Source: ABdhPJxRUdBI3axY0Z5wHvS9FbnlhshPm4jD+MLJhY6tS5mkHG16FAl7CcQlj9xdEOemcFDxBJQtYw==
X-Received: by 2002:a05:600c:4f4f:: with SMTP id
 m15mr767209wmq.29.1615829958830; 
 Mon, 15 Mar 2021 10:39:18 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:add:ec09:c399:bc87:7b6c:fb2a])
 by smtp.gmail.com with ESMTPSA id
 m132sm295613wmf.45.2021.03.15.10.39.18 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 10:39:18 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 3/5] meson: bump submodule to 0.57.1
Date: Mon, 15 Mar 2021 18:39:10 +0100
Message-Id: <20210315173912.197857-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210315173912.197857-1-pbonzini@redhat.com>
References: <20210315173912.197857-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The main advantage of 0.57 is that it fixes
https://github.com/mesonbuild/meson/pull/7900, thus avoiding unnecessary
rebuilds after running meson.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meson b/meson
index 776acd2a80..7182685b22 160000
--- a/meson
+++ b/meson
@@ -1 +1 @@
-Subproject commit 776acd2a805c9b42b4f0375150977df42130317f
+Subproject commit 7182685b2241e88340b6c3340afba59a26be213f
-- 
2.29.2



