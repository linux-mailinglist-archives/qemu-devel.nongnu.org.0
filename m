Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 943FB422F3B
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 19:32:01 +0200 (CEST)
Received: from localhost ([::1]:52672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXoIK-0006eU-KA
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 13:32:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mXnYE-0007r1-T8
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 12:44:23 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:33778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mXnYC-0003yr-AQ
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 12:44:21 -0400
Received: by mail-ed1-x52e.google.com with SMTP id p13so1229958edw.0
 for <qemu-devel@nongnu.org>; Tue, 05 Oct 2021 09:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/Pxn4hLvHFl7SP+PJwZ9WLDfJ3iclWlvQDwWKU4dNjY=;
 b=WSgLPw6hw4NDLkZ74/NwCsJGpCrfsXRqtRXnj7nzil/7Nv4fbZ8lg0evoQ8wNTpE+j
 fpX4QCMNawsgFQOu2rgpFxOth6CdhhxTalMjRWLiivve1kgFzRgn37y+Xo/JsWySvuC1
 nujl6DG4puOg38QjXC+tU/ZXVlge2ZEUWt8Nn8GxNI6u68sGgSaZRWbz3xrxFQnmDHeS
 9Hf9j+r7Coxi0AB4Qyz9Vwj+BeLKanMOI0Lur/RMsjG4Gb2e7/IDqNnzMSJxpU+FjauO
 3KRQov8DM8ZnC4736xFaz+fEKhaI5FLRJqGMXE9chygHA+vX5jZL+AD2ee6jun7YBNPe
 9ZfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=/Pxn4hLvHFl7SP+PJwZ9WLDfJ3iclWlvQDwWKU4dNjY=;
 b=FBjPIkMNlPQ6UISxI7Xz38PI39eQrj60LYvFqMCCXf3femu9aRq6QTwOnbmgXXTA7G
 8pr3gVFTjhuuOerTD9YCeXByuC0VfWlj33l6lrVDJXqEzVY2eAbd6nrmH/qfZz0Y/A3C
 7HuKmCAK0dMFt0H1uVkVz2nfOn82jE/5mSUThvxwuyJSURWAcdanLfxdP3D70GZ1f/d7
 tPzjr/nGK7IfzaFKsp8PvxRczljwTnHLuPAFM2GB6HNWDYjwWveq98qtNIYpLIndupYN
 KppZtEiPf+7yUrHV74ug77RNy8u7E9ydVFTSlsNld/+DIycxiNIWcyhAJ796PJmwv9xd
 UPpw==
X-Gm-Message-State: AOAM533BWiz9XF/Njkv/1pqRCSaud5srX+47YYeMQmFdPYDWiIN8OLFK
 ANhsWzqNl9yFsaw/XGbAQGK/hfopCT4=
X-Google-Smtp-Source: ABdhPJyqkC7N4pNVEM4BOVnXTVD0eCADTAFo9ShdTLCKMUecuMcl+Lb5SS4VF6+ikdgjDsPtRk2rdw==
X-Received: by 2002:a17:906:3ce2:: with SMTP id
 d2mr26528131ejh.410.1633452259015; 
 Tue, 05 Oct 2021 09:44:19 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id x14sm6101392edd.25.2021.10.05.09.44.18
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 09:44:18 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 08/12] meson: bump submodule to 0.59.2
Date: Tue,  5 Oct 2021 18:44:04 +0200
Message-Id: <20211005164408.288128-9-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211005164408.288128-1-pbonzini@redhat.com>
References: <20211005164408.288128-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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



