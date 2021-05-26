Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1485391D92
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 19:09:13 +0200 (CEST)
Received: from localhost ([::1]:58542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llx1s-0000zw-Dl
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 13:09:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1llwxp-0006TM-Hx
 for qemu-devel@nongnu.org; Wed, 26 May 2021 13:05:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60317)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1llwxn-0003rJ-Vw
 for qemu-devel@nongnu.org; Wed, 26 May 2021 13:05:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622048699;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zJWoGpGBb9XoVGl1zEB1CPuzVYBaioPmWvxlvBAi+gE=;
 b=eELeJ4BCn4Ued3dSS1L6t9Rrc6J9rnS+VLTJRSPC2BEvFAJYJ/XVSdnkzUXJTGUFOD8RHK
 82CQ+sRjl3ZbuPB4Y0mDwFfOor9OX1Bb5Wvie7MIQiFWnv2rmg2Bg+ApefHacTHCsuM1c6
 p/JsB+wxTJb6BR4dzCP9SMzP2noWLkU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-174-wPtkeK0oOQWTWsl-C0NbmQ-1; Wed, 26 May 2021 13:04:56 -0400
X-MC-Unique: wPtkeK0oOQWTWsl-C0NbmQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 h9-20020a1cb7090000b029016d3f0b6ce4so620510wmf.9
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 10:04:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zJWoGpGBb9XoVGl1zEB1CPuzVYBaioPmWvxlvBAi+gE=;
 b=NAD7dyPhA2bh0eG50e1YQAO8qGasqI76RED9AyjZH5+QCnv5wCAU/VZ317kMtENGn5
 +GrHkh9W8S81Zc0PJWASloe7z79mequFEh5frmC26TlPvWEtY2ML4MpFo8Fm1rhOU7kk
 t5K9bb1YG3yA+vdySLx2V/0Zxw4UNMJBjeIn0FE7Ws3DAqGDATEaHCp7PEK0VMZIZj0o
 F26P17nN/L8n9gkQ/vFxDCSfs4dOiYDmksELSfJa09u4Dsm6H84FFi9Kj96FxvRKbibW
 Ig4jK2P+rOzkkMouX3FjMaYyDAeUZFYMDnllGSRaB0DZ/h8sueraY0rW8ZmGvbUNtK1S
 Ac2w==
X-Gm-Message-State: AOAM5313sIprBRr0iYBxQk1hzAXaHOK0oGFNrtIN2wVJMsPkZGRSNTqe
 igDzDH6VqEHMs98QvN9UhYqsyMcJ3+0QL2fL+FFnyB3cgGXrOd03XqFQtcDxbWzzqLuM719nvBX
 yw+8BksSs50RkpDBMe+JTC2u3bMkvxZG/vAi5Pt6Y63VsqVbthdbBaMJp/U3dxgh4
X-Received: by 2002:a1c:f016:: with SMTP id a22mr12679085wmb.65.1622048694996; 
 Wed, 26 May 2021 10:04:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxoRr4qsueZR1YBjBWEhnIEDlIbwUS5WQiHRtKfPxFjsuOY5TMi2TkOJm3hfc7s5i2b1uLjig==
X-Received: by 2002:a1c:f016:: with SMTP id a22mr12679045wmb.65.1622048694817; 
 Wed, 26 May 2021 10:04:54 -0700 (PDT)
Received: from localhost.localdomain (64.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.64])
 by smtp.gmail.com with ESMTPSA id n10sm20650630wrw.37.2021.05.26.10.04.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 10:04:54 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 01/12] MAINTAINERS: Add qtest/arm-cpu-features.c to ARM TCG
 CPUs section
Date: Wed, 26 May 2021 19:04:21 +0200
Message-Id: <20210526170432.343588-2-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210526170432.343588-1-philmd@redhat.com>
References: <20210526170432.343588-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We want the ARM maintainers and the qemu-arm@ list to be
notified when this file is modified. Add an entry to the
'ARM TCG CPUs' section in the MAINTAINERS file.

Acked-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index a77f2465694..52757b08540 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -156,6 +156,7 @@ S: Maintained
 F: target/arm/
 F: tests/tcg/arm/
 F: tests/tcg/aarch64/
+F: tests/qtest/arm-cpu-features.c
 F: hw/arm/
 F: hw/cpu/a*mpcore.c
 F: include/hw/cpu/a*mpcore.h
-- 
2.26.3


