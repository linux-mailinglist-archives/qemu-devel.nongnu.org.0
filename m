Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F2E241057F
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Sep 2021 11:34:02 +0200 (CEST)
Received: from localhost ([::1]:42394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRWjR-0001za-FH
	for lists+qemu-devel@lfdr.de; Sat, 18 Sep 2021 05:34:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mRWhP-0008KE-HN
 for qemu-devel@nongnu.org; Sat, 18 Sep 2021 05:31:55 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:45653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mRWhM-0003cO-Ko
 for qemu-devel@nongnu.org; Sat, 18 Sep 2021 05:31:54 -0400
Received: by mail-wr1-x435.google.com with SMTP id d21so19141519wra.12
 for <qemu-devel@nongnu.org>; Sat, 18 Sep 2021 02:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xWYtDan3pEXu3qMZtaWU1X/f9DRe7zuT6HxLtpUUEf0=;
 b=LmVKCcQm6eOMl4vSZKldWOrEhOFCcozG08PhDLf7Fw5E150h8Rh2unXXzRmpoPkS87
 CUxwzmMGjL+5nK1h5Gf6RJoMmRIp91wiObmrzgwQ+OivboXJr9dDrGM8FTKhVW8k6vDi
 2brgiDNRSm+TZo86uyvrEOS8KHe2HZRkECD44SXZ7pjbx+nMMjK8Z7OEluKnNMs1nvwV
 QDR030wxEKlFKTgXKT+WC2TIwJPoBAo/V4xn33cDCI+jtTDZ9AOpZxcy4GguoB/j8rPn
 3BX1u5Gqxb3H29xcQKs++0k2N3wPGybLIcBGmScSABmDHCD3CnwQz74bZfQb9xuFlFI6
 mdVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=xWYtDan3pEXu3qMZtaWU1X/f9DRe7zuT6HxLtpUUEf0=;
 b=fEx8cMCZdte4U85f9xP3zaPyG79fyR4qBZZxML4+l1GJ3JZLrtg41zAqivxVCh3OSy
 9wYtW0CTEOKDOBLnGxxOE2o2TN18nm4RGSMcoBi5JoaM7R7EjQSIbGBBlZ3bO+72xUdK
 ZRroRD8TNI5t07KhjYg74GKs4a7P4b2mdygLa00BJoOAhIpUPXuMXi9+M10WC8d0+ClW
 PGh9ueUiQuYRED0ipMXoks0MixXcfWGSwCS/mW6zWUyUPszYwjiT7xdzYwYf7n004gUP
 ci4R77rBy3hazG1zT7oajzcSUPz3YlGg3xo+sIJUfZsjLfo0piKwNWgjAamDHTUqPNbR
 Onow==
X-Gm-Message-State: AOAM533ISvCahAPJiChDO3ZmJtNuTXP2mTTIF4otTiIJhLS+sVDwA/XZ
 QTdD+oQuIDbdm0PK4Z5ZNWLK2d4jD1g=
X-Google-Smtp-Source: ABdhPJyxdDrJMWE84e5vxCvEYE52i+tfGvxmZCrn+Gtgwur24D4XbUN/3f7bBSBQVcaTlvpax7mUkA==
X-Received: by 2002:a5d:4b0b:: with SMTP id v11mr17446282wrq.359.1631957510821; 
 Sat, 18 Sep 2021 02:31:50 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id j14sm9233858wrp.21.2021.09.18.02.31.50
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Sep 2021 02:31:50 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/3] meson: bump submodule to 0.58.2
Date: Sat, 18 Sep 2021 11:31:38 +0200
Message-Id: <20210918093140.5797-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210918093140.5797-1-pbonzini@redhat.com>
References: <20210918093140.5797-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x435.google.com
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



