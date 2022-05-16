Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83774528BCD
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 19:20:15 +0200 (CEST)
Received: from localhost ([::1]:52092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqeOE-0000UC-LI
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 13:20:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nqd4w-0001VD-VE
 for qemu-devel@nongnu.org; Mon, 16 May 2022 11:56:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40501)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nqd4v-0003Lt-8S
 for qemu-devel@nongnu.org; Mon, 16 May 2022 11:56:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652716572;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SxsTlTbHkyYrRZRZ1DigcCQTTTxMf1/2YftPkrocfhU=;
 b=dRceaHevGlbrjsZYUIOkxThIGAHZfjbQRtv1BplIKuzxrAzP89+TgDVoyd+62xenRHwArd
 J/sluPWBPuFEn8SA9rEobzfagVcy042vIPM8BCaborp24jxCph2ZnKLkT3D3YDMnEa7UWW
 OWg9xID5u88NbOSR49Za95yoKbKgfkE=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-375-8cCFRfJtO5WiTCaldDVZyw-1; Mon, 16 May 2022 11:56:11 -0400
X-MC-Unique: 8cCFRfJtO5WiTCaldDVZyw-1
Received: by mail-ej1-f69.google.com with SMTP id
 hr42-20020a1709073faa00b006f4dc7f0be1so6009416ejc.22
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 08:56:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SxsTlTbHkyYrRZRZ1DigcCQTTTxMf1/2YftPkrocfhU=;
 b=R7qMvWmqOD5dzdSmHzyc/tZc7+5BzDOAbm3eocFXx3YtLwgbvaU1z5x9tmlUGweUTC
 gwqXz2f2LJX547qnM7Da4o75rLmRMR169po5NbfUsiwzdwraAUa/OJdBXPhiRjP9ldX1
 qW2TRWwvsz4m9+9GHA3POx/wlXc2y79n0YhWI87Z0nxOvchN80gfcEPFEMB5cS0vnkxx
 8iAlIs1T35c3pqdDCxWo8qQiC5AGTFa63C9p6XSaAZjl+W9+5rpMmuYN/wFWvT7ICJYe
 dMH69iOCaNWv3cLJTcgz1I385yV73EAdH+XgRi0BoHd2rI59Oliy97zqQW7Yjzb/HJHJ
 FiYw==
X-Gm-Message-State: AOAM532nZg52KWQi0Nzffyy5gog0lcdQg/I+aOHKghkSlH+dEzenB1U0
 upFkQYaLeTyFB92rtFGG+vyzAaFtYSEbbGxOveABBJMKuxxqV8r4CjuJTyVKk+bm4g8PSLNY+K9
 vSVHWWz9qbKmy82KbTuLz0/AFJiHIqsGuGL920QecQbtK1d0y/7sVhwQUTdhoSo72Q68=
X-Received: by 2002:a17:907:72c4:b0:6f4:ad52:b9fd with SMTP id
 du4-20020a17090772c400b006f4ad52b9fdmr15850531ejc.128.1652716569817; 
 Mon, 16 May 2022 08:56:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJztpB6dKXBb7HdfLBssMU7OGViEHJnomuS+4IBqjjukRmNuUGSvabiao8DrtxQgIWKKDtxOIg==
X-Received: by 2002:a17:907:72c4:b0:6f4:ad52:b9fd with SMTP id
 du4-20020a17090772c400b006f4ad52b9fdmr15850513ejc.128.1652716569538; 
 Mon, 16 May 2022 08:56:09 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 hx16-20020a170906847000b006f3ef214da7sm60090ejc.13.2022.05.16.08.56.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 08:56:08 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Konstantin Kostiuk <kkostiuk@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PULL 03/23] qga-vss: Use the proper operator to free memory
Date: Mon, 16 May 2022 17:55:43 +0200
Message-Id: <20220516155603.1234712-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220516155603.1234712-1-pbonzini@redhat.com>
References: <20220516155603.1234712-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PP_MIME_FAKE_ASCII_TEXT=0.999, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Konstantin Kostiuk <kkostiuk@redhat.com>

volume_name_wchar is allocated by 'void* operator new [](long long unsigned int)

Signed-off-by: Konstantin Kostiuk <kkostiuk@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20220512154909.331481-1-kkostiuk@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 qga/vss-win32/requester.cpp | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/qga/vss-win32/requester.cpp b/qga/vss-win32/requester.cpp
index 4513324dd2..b371affeab 100644
--- a/qga/vss-win32/requester.cpp
+++ b/qga/vss-win32/requester.cpp
@@ -354,12 +354,12 @@ void requester_freeze(int *num_vols, void *mountpoints, ErrorSet *errset)
             if (FAILED(hr)) {
                 err_set(errset, hr, "failed to add %S to snapshot set",
                         volume_name_wchar);
-                delete volume_name_wchar;
+                delete[] volume_name_wchar;
                 goto out;
             }
             num_mount_points++;
 
-            delete volume_name_wchar;
+            delete[] volume_name_wchar;
         }
 
         if (num_mount_points == 0) {
-- 
2.36.0


