Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B09408AFB
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 14:22:17 +0200 (CEST)
Received: from localhost ([::1]:43508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPkyW-0001lI-QM
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 08:22:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mPkbC-0002wo-Gj
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 07:58:11 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:42945)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mPkbB-000640-3O
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 07:58:10 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 u19-20020a7bc053000000b002f8d045b2caso6410139wmc.1
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 04:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PeFhdW3ldj9N2neDhskeRk7Vv8dHVOjd4x2dNblRlbI=;
 b=HQLbnm0DUqp8wnLsI9H45ds/dsHO1stJPa+kAspz3ldH1pYVp24wZsqWfJg/fN/iPz
 vM4uSxFTRfoQF1HSBGkFQ+OTbsP1BdY4jtdnmJkScTY0UcK48Bm4pw/LRGx4yClxB4ow
 xrBd08qRT+uCbuk1cswggF6SI6oKNRGkhFlE8g7bjqsjul8C4kYV/bLOFoiM0ffuVcoE
 1sz9l4MftjhMXeNi+D1gpVIbJNHYiV8E1bELhfUgo2XHC5bpZV9718DDnBSZnuAAZZE3
 6Z9aj6y0w/JpvjHRPFAnVlAV+eFuTaacRjgD6XVmTWUuND5Csg92HLQ0ZiE6twOfmoP2
 ZtvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=PeFhdW3ldj9N2neDhskeRk7Vv8dHVOjd4x2dNblRlbI=;
 b=nN7ohmx4RuIxJWGmBmqmYpf4WFMl+I4XDRRf3kVCDO/On7WsDqdMRyS2bFJC8nsLYb
 XoTPYiPWSQUaKm8qi3YYQYZao3Hh6qJDE6YLeYs9S2Voqyng/spP1jMq9csRRNrXWYBN
 rH7jLHNzz23lr6epW4DOODugdU6wnc0DXnRB77KmARXBLSLUp8WwukG/Moj+Ki1G/tkY
 jgJDl6RruutjJdK+krTumH6eOm0y+3D0nCLgI+QhHb7iukKEjJznSD98vrOEGsSmB/Dm
 2EbET47LV+uwkMbpvdaBOOkLct3O0ex4twxYoyNUzGOZ7LFeTi0FrF0TtyYxVQZwZXYM
 3CmA==
X-Gm-Message-State: AOAM533JNfwNFVoFVTXtFpiobSihgGH8JHvYRq0Z2tAfuTwOkERQEwvI
 zq7bCPsiplX6EqeAeZepv5Lqyggisos=
X-Google-Smtp-Source: ABdhPJw5IS4S9i/GQ0TKzvWKdtpBYWsv+nYLv7igr9SuZUHJwJbDOwJFKQRe6jjDpGlqgFaUbgcrIw==
X-Received: by 2002:a1c:3b41:: with SMTP id i62mr10856058wma.38.1631534287837; 
 Mon, 13 Sep 2021 04:58:07 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id n186sm6011037wme.31.2021.09.13.04.58.07
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 04:58:07 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 16/21] meson: remove dead variable
Date: Mon, 13 Sep 2021 13:57:37 +0200
Message-Id: <20210913115742.533197-17-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210913115742.533197-1-pbonzini@redhat.com>
References: <20210913115742.533197-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x336.google.com
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

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 ui/meson.build | 2 --
 1 file changed, 2 deletions(-)

diff --git a/ui/meson.build b/ui/meson.build
index 7faa42eb3f..a73beb0e54 100644
--- a/ui/meson.build
+++ b/ui/meson.build
@@ -105,8 +105,6 @@ if config_host.has_key('CONFIG_SPICE') and config_host.has_key('CONFIG_GIO')
   ui_modules += {'spice-app': spice_ss}
 endif
 
-keymap_gen = find_program('keycodemapdb/tools/keymap-gen')
-
 keymaps = [
   ['atset1', 'qcode'],
   ['linux', 'qcode'],
-- 
2.31.1



