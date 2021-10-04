Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF1A24208D0
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 11:55:04 +0200 (CEST)
Received: from localhost ([::1]:49620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXKgZ-0005BB-Pf
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 05:55:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mXKJo-0000uy-L1
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 05:31:36 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:43650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mXKJl-0007Be-Dh
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 05:31:32 -0400
Received: by mail-ed1-x535.google.com with SMTP id p11so9192201edy.10
 for <qemu-devel@nongnu.org>; Mon, 04 Oct 2021 02:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/Pxn4hLvHFl7SP+PJwZ9WLDfJ3iclWlvQDwWKU4dNjY=;
 b=c4hk5CtRbcDWSPFS0gz5ypGifH7w884XkesqpTttFkSKJZVnzN9/4yTUxFdjIdX9SP
 OcFDbGPxXPu2aodKRr5TqL3ONHVi/oTAAIQF5GSQOdxdkSIwLI1hORud5XXwH5OXL4cu
 wFvQ4xHXHc1rygrwozf848RIlHWlbTwa0hDiJgeyh1vhlnPKnGBqja5lU6NGGJNKeLyk
 iMxFtNKMgKl4PpfokpHOyBHWwYePKpw4oh4UoaB4ak374Clu1L0Z2vAtFUWwNkvP3O6F
 HSQMpTJBiHhxYfKpOha4wYQPZM+Xg06FBA/Tf6oWEQSB3KX0u3JCIA5kMFkQTj/XUM62
 cByw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=/Pxn4hLvHFl7SP+PJwZ9WLDfJ3iclWlvQDwWKU4dNjY=;
 b=AizAcM9JGuB60wbmLAAKpHQGavz/EfA+k3MiY9T+SZKLprGqWPrbpqOKak59lGSmiM
 VDrfFZg1CEb43NCzhEmTHICgZXlYMPiiyUQP9PmOWI+zg41HzGVsb2vZzTML2xiGy3c5
 /TsJZ0vS1OBxvwz6OC7LVkrCjShYCowro0i2LAD0+pM95kUhFew/bl3TjtnWXqvlYLGV
 hrnxqbDTBVE8KCuG56oQJnIBHi8Q5mc3DhUWzxi3bwBv/DeAMpPz03t3lB2IBlsK2IFG
 QM0iM+e/GjUfeY3HQ859BAK2iEC6Td4w3ZSrBAzFzoX5ifR/wpx9nggn+6oWGCWyw3rN
 2ARg==
X-Gm-Message-State: AOAM532Ag0b1tVQ+u6UIG8a5VCsozgLsH1y6Z6h73E9Qx/s0XGToyw+7
 zHAPX3f41famFlvJ78kn1c3zyFUY0j4=
X-Google-Smtp-Source: ABdhPJxFFDTHBS7brb3H4dNGPELoVPF5si7FtruW3sARFlsOui2jDeJqrOvB6zgcNB2wXxQCsiz9rg==
X-Received: by 2002:a17:906:3882:: with SMTP id
 q2mr16401491ejd.396.1633339886665; 
 Mon, 04 Oct 2021 02:31:26 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id d21sm5007143edp.27.2021.10.04.02.31.13
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 02:31:26 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/5] meson: bump submodule to 0.59.2
Date: Mon,  4 Oct 2021 11:30:49 +0200
Message-Id: <20211004093053.87883-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211004093053.87883-1-pbonzini@redhat.com>
References: <20211004093053.87883-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x535.google.com
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

The update to 0.57 has been delayed due to it causing warnings for
some actual issues, but it brings in important bugfixes and new
features.  0.58 also brings in a bugfix that is useful for modinfo.

Important bugfixes:

- 0.57: https://github.com/mesonbuild/meson/pull/7760, build: use PIE
objects for non-PIC static libraries if b_pie=true

- 0.57: https://github.com/mesonbuild/meson/pull/7900, thus avoiding
unnecessary rebuilds after running meson.

- 0.58.2: https://github.com/mesonbuild/meson/pull/8900, fixes for
passing extract_objects() to custom_target (useful for modinfo)

Features:

- 0.57: the keyval module has now been stabilized

- 0.57: env argument to custom_target (useful for hexagon)

- 0.57: Feature parity between "meson test" and QEMU's TAP driver

- 0.57: https://github.com/mesonbuild/meson/pull/8231, allows bringing
back version numbers in the configuration summary

- 0.59: Utility methods for feature objects

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meson b/meson
index 776acd2a80..b25d94e7c7 160000
--- a/meson
+++ b/meson
@@ -1 +1 @@
-Subproject commit 776acd2a805c9b42b4f0375150977df42130317f
+Subproject commit b25d94e7c77fda05a7fdfe8afe562cf9760d69da
-- 
2.31.1



