Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B933238FF86
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 12:49:53 +0200 (CEST)
Received: from localhost ([::1]:36578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llUdE-0002Bm-QA
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 06:49:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1llUao-00004y-G2
 for qemu-devel@nongnu.org; Tue, 25 May 2021 06:47:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36132)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1llUae-0005B2-KL
 for qemu-devel@nongnu.org; Tue, 25 May 2021 06:47:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621939631;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Io/gtPiUsGrqL3zsjei2ki4eFXmSzRnaKxipOW1dItU=;
 b=BkPZ1s4VY4IRkj4+u7IZ2VCsO3XNt+e8mjjC+5PjYJLpFWog+Y8LfLU4VyyHWJleTVlgnT
 s/lifVL0TVk/7NtHX7LW9B0mMn7bzD7xGz+sg9wIKAvIKEjxpqQgR/KkDTjHrOnt3IjB4a
 IrFVo/LcH33n44W63w/ZMDap5qC2nP4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-411-2Ch_jZOtOlCvl70EGvdsjA-1; Tue, 25 May 2021 06:47:10 -0400
X-MC-Unique: 2Ch_jZOtOlCvl70EGvdsjA-1
Received: by mail-wr1-f69.google.com with SMTP id
 n2-20020adfb7420000b029010e47b59f31so14280100wre.9
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 03:47:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Io/gtPiUsGrqL3zsjei2ki4eFXmSzRnaKxipOW1dItU=;
 b=Nlh7cjl6YWTUP1Dy1iWSDi2ZrE0ZMlxzHqBeKdAbUou/lfd3k8TAJyMpBxebZQd2lb
 9v0Sn3ILWbVTupAYSul83RYPY0IUB1WkELcOKbSYvxJy8n5qiamv+YhgaGWnEHOTDIhw
 /NjXGwrn1eWbOwzvKJpyG/ScbfET5ajvgBxGt+zjXWqczXQuoIiIjo78RSAtFb0XcLJm
 lCjvJFIVy6mltMCWBjwn5SnGEV89j3/wJ2DS7wWZA7n6QUc3DViqYrMzpEoQ9dmnmCKo
 rXcjryO+FoBrehIhDoNlBKvLav0Gxy8FySNPorin8Edrrbgg0RkomYQkxX74gDDLwKZy
 /bIg==
X-Gm-Message-State: AOAM533fQGEK8xdVUX+kUVFQm7LvjPjBkwhI1mmyUXhCH+bmGuOeRYPz
 ExzbRCTPzvhCW7v2NCQAk7WBudI1YABaaF41KXRbJEZwb39o7fCgeHnY/IoQbghSCyoaD5Kmx8P
 4kZ7PlxgnbxAiiAUUiCAKwsf0tOj7WVLllqDOHl0l4IRNRR4JmUQIl2A04nwKUxR4
X-Received: by 2002:a5d:688d:: with SMTP id h13mr26410667wru.362.1621939628585; 
 Tue, 25 May 2021 03:47:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyzDG5gRhnEWvV1N/4oQtoUHKUcSEwlEZZ7VTHATIAKGMuoUNzY2fisqai9PS71ENHRZwuVvA==
X-Received: by 2002:a5d:688d:: with SMTP id h13mr26410644wru.362.1621939628432; 
 Tue, 25 May 2021 03:47:08 -0700 (PDT)
Received: from localhost.localdomain (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id b15sm15206992wru.64.2021.05.25.03.47.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 03:47:08 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/3] meson: List modules built in summary
Date: Tue, 25 May 2021 12:46:48 +0200
Message-Id: <20210525104648.4060904-4-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210525104648.4060904-1-philmd@redhat.com>
References: <20210525104648.4060904-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Instead of guessing the modules built, list them. Example:

  Modules
    audio                        : spice
    block                        : curl dmg-bz2 gluster iscsi rbd ssh
    chardev                      : spice
    hw-display                   :
    hw-s390x                     : virtio-gpu-ccw
    hw-usb                       : redirect smartcard
    ui                           : egl-headless gtk opengl spice-app spice-core

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 meson.build | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meson.build b/meson.build
index 5ca1bd36292..54b97ace207 100644
--- a/meson.build
+++ b/meson.build
@@ -2738,6 +2738,17 @@
 summary_info += {'FUSE lseek':        fuse_lseek.found()}
 summary(summary_info, bool_yn: true, section: 'Dependencies')
 
+# Modules
+summary_info = {}
+foreach d, list : modules
+  k = []
+    foreach m, _ : list
+      k += [m]
+    endforeach
+  summary_info += {d: ' '.join(k)}
+endforeach
+summary(summary_info, bool_yn: true, section: 'Modules')
+
 if not supported_cpus.contains(cpu)
   message()
   warning('SUPPORT FOR THIS HOST CPU WILL GO AWAY IN FUTURE RELEASES!')
-- 
2.26.3


