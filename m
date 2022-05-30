Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E886537AB2
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 14:36:48 +0200 (CEST)
Received: from localhost ([::1]:41528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvedb-0002eu-6t
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 08:36:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nveS2-0005JJ-44
 for qemu-devel@nongnu.org; Mon, 30 May 2022 08:24:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nveRy-0005L7-KL
 for qemu-devel@nongnu.org; Mon, 30 May 2022 08:24:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653913485;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=sZruPTrWkHwg0W5O133lP94Uy4ZzezhJ3tHgsYNhd90=;
 b=OPXSFgUg+0haFVmKPT2Ep5r//lJB0Ahrjy9aZQt6XC2MbxWQ7rQ6dQ4ao7rX7tmr5EiRZc
 uz9NJQIUlms5eezSNLAj7YFk8g0ITimqAJqFuvFE33+4Cv2kDunV62U5QfzL2tkvJcLtD5
 P6ohMmYZcovssgGd7Dxtid+ZkcLnHz4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-663-IOMb08nmNqyjU7YwDGPmcQ-1; Mon, 30 May 2022 08:24:43 -0400
X-MC-Unique: IOMb08nmNqyjU7YwDGPmcQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 m10-20020a05600c3b0a00b003948b870a8dso9656158wms.2
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 05:24:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sZruPTrWkHwg0W5O133lP94Uy4ZzezhJ3tHgsYNhd90=;
 b=1xORcLtF/WQS+uIwdyPDBe7JtOlOrY4u2bNmpIKIGQ8KFpcmLF5b1FubDWGuU04zJ9
 CI1k5DECLHnOzyLvPu0mVxNsHz8eVg+MGub+cj0aImvnTZZcDrs4fFBM1mAgPsQsGo0Y
 S4eIA/S653QBX+ZevygUT2cFtRsF9RBLxM9f5x7J7LC+p/1+URqGSLttSUHH9W8Ry2T0
 A5qaCGfPE3Hw2rsCfkndgwtJ9b9LiYYnOeO9eiYQXKewtsS3TevCMPxCmGw/IVOvggH/
 Rwmz+hNPgtxMk32C6Cy7pG8CX3B7OGSg0zTtzt0UVTrS3ufkkhrtW0wUTQxtGFN+YVlY
 jeUg==
X-Gm-Message-State: AOAM532twKj4M4/mkH4RP33D7loBvRTPntSxbTkWpxJpr7e9Zt7X8SPu
 xQ/l1XJyxKC71WkOOctpOlbwPQ/B2HgNebhM9YCfiSQn1qVsCN2mRIQ4HrNO8kdB6kuXXE4HKAF
 MqXrriUDap6DZiFmx0+Td91KBNH8CSRWzrQwZy/KeLYehq9tOPkcG/nT2bnre5sVz4zU=
X-Received: by 2002:a05:600c:3595:b0:399:fd8f:2c00 with SMTP id
 p21-20020a05600c359500b00399fd8f2c00mr9762679wmq.97.1653913482136; 
 Mon, 30 May 2022 05:24:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwZn9B4BgczMByiHCnrFmlN4RN54HzvK+GZbC7EDFqRE84J7X0+iVsSL5SfnXilDS8vPNBE5A==
X-Received: by 2002:a05:600c:3595:b0:399:fd8f:2c00 with SMTP id
 p21-20020a05600c359500b00399fd8f2c00mr9762639wmq.97.1653913481577; 
 Mon, 30 May 2022 05:24:41 -0700 (PDT)
Received: from goa-sendmail ([93.56.169.184]) by smtp.gmail.com with ESMTPSA id
 g12-20020adfd1ec000000b0020c5253d8f2sm5562846wrd.62.2022.05.30.05.24.40
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 05:24:41 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] build: add a "make modules" target
Date: Mon, 30 May 2022 14:24:40 +0200
Message-Id: <20220530122440.683780-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meson.build b/meson.build
index bf318d9cbb..011cd2ff6b 100644
--- a/meson.build
+++ b/meson.build
@@ -3285,6 +3285,7 @@ foreach m : block_mods + softmmu_mods
                 install: true,
                 install_dir: qemu_moddir)
 endforeach
+alias_target('modules', emulator_modules)
 
 softmmu_ss.add(authz, blockdev, chardev, crypto, io, qmp)
 common_ss.add(qom, qemuutil)
-- 
2.36.1


