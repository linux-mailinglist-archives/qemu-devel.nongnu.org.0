Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 488CB40CB46
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 18:54:35 +0200 (CEST)
Received: from localhost ([::1]:35340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQYB8-0001js-AU
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 12:54:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mQY0Y-0003Rs-LH
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 12:43:39 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:39560)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mQY0T-0006Yi-EP
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 12:43:38 -0400
Received: by mail-ed1-x529.google.com with SMTP id h17so5880383edj.6
 for <qemu-devel@nongnu.org>; Wed, 15 Sep 2021 09:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xWYtDan3pEXu3qMZtaWU1X/f9DRe7zuT6HxLtpUUEf0=;
 b=DrpeZsUo2M6JkHVwfxTq5KbTWMz6AXOM/uNYF7+uiwo7XImB25Evhz76V9xjB0Grav
 OyNGiwF52mBM+T/o94hdjACR47oVGnF97J+4fKZ0v1sF4I1Yq5mFhqsZyo3HwEAR55UE
 XIryXgCvJxvpXxSxn/WKm6exzgo3JQROegC2ZvrOh4fUpq0WeXnSaVe/DYjxJyMrBDM1
 ZwGVXpVl5XnBbtqAB8yt1BWAgSa3mELZGuDUQYU5XminOkabsD+FaYcHmEdgabiJ86UL
 vi1VR2ddrhd1yB001mH/8P15uuH+UA5/rCHVJOM5ZJ3FcBXdmt16uf47Zd7wdakLKp9Q
 /4gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=xWYtDan3pEXu3qMZtaWU1X/f9DRe7zuT6HxLtpUUEf0=;
 b=W0B1s5JhLw6T8EBDR1yaXU7pz3UJpFi1pbbXAXSHIuBma2Od3etWBwGPdYRoxMCHVz
 pr/NJvFwGdweCWEuMwqP0fh7grt2/G6hH4v8QVSg0qSuezXltf05XzrpMsJxjPxCsT3A
 Fe8j4zyW1Ddka+qErfuxEUNm/A1ywED6aMkOn2BbsBXTi42B6luv7fXDngZPeScdtqgd
 ipIHwAsgsNrUVTqSCSdM1G4A8F7WpP8oJb/OtLYB1VLWvXkn0Q55M7ywBoJCycZNdpq5
 wgzkLK8W38qBxzfhrzhYf+inS4yavC2cdPLwtPHnI0/t0c19zvEjn0wNnUguRyu/VItK
 FfLA==
X-Gm-Message-State: AOAM533p2luck2YjnakJ578AhGFsImPIh6i30X5OYBlZi2OpWJXTED2Z
 rxMwIMQy8hyycWzZeSMfOcql6wSAHdU=
X-Google-Smtp-Source: ABdhPJygqcFdwr4I+LQP12QVfrHD4wZ06s3aRKYVvJx6Z1RHaHOOX4oQjBFoHKpY7ZeK8/mwy1mtsA==
X-Received: by 2002:aa7:ce14:: with SMTP id d20mr992385edv.132.1631724211487; 
 Wed, 15 Sep 2021 09:43:31 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id v1sm238319ejd.31.2021.09.15.09.43.30
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Sep 2021 09:43:31 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/4] meson: bump submodule to 0.58.2
Date: Wed, 15 Sep 2021 18:43:26 +0200
Message-Id: <20210915164329.13815-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210915164329.13815-1-pbonzini@redhat.com>
References: <20210915164329.13815-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x529.google.com
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

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meson b/meson
index 776acd2a80..8bcd4c72e3 160000
--- a/meson
+++ b/meson
@@ -1 +1 @@
-Subproject commit 776acd2a805c9b42b4f0375150977df42130317f
+Subproject commit 8bcd4c72e321705cb6cde02c684ffd2ec5cc8843
-- 
2.31.1



