Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11BBA3AA176
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 18:37:03 +0200 (CEST)
Received: from localhost ([::1]:58488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltYXG-0003vu-3f
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 12:37:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ltYK8-00024p-KR
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 12:23:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31240)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ltYK6-0002gw-7J
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 12:23:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623860605;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4C/sIPJIJ9x04mkRkFeW0rAiiCZBP7NEySvc0zgDkpg=;
 b=F22BaJortXzpapze8NoX9kZ/x3h9fExXipAbTfsR2GqElS0HFIPuS9TuYrTIO7PEQX0TMi
 OVCJDxRtu6syLHgSvkGwgGTHbz/8Zhx4VI92KBD94b06CcFoGIuL0rbLPr2t5hL3xDjRY4
 aUdUaBlq8KC1twIvVOuNkQl/LedvhlU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-143-BlT3Ez_cNoeUvgN4Nzp8Qw-1; Wed, 16 Jun 2021 12:22:53 -0400
X-MC-Unique: BlT3Ez_cNoeUvgN4Nzp8Qw-1
Received: by mail-wm1-f72.google.com with SMTP id
 w186-20020a1cdfc30000b02901ced88b501dso1498548wmg.2
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 09:22:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4C/sIPJIJ9x04mkRkFeW0rAiiCZBP7NEySvc0zgDkpg=;
 b=BBMdCeQTAXzNMORSTo9sMQ90H0F0/OZMJ559Zx8o5oMGQvwPaQsV0UjduIA+C5C4bT
 /GhFtkbOPiD3zJylQQEbuzYYcdU1GVFI7tZ0pyfF2upm/G2BHDn+dog45xlp1Ynb2kPN
 9ch/mMoFyIOuZ7KKWfG8WgwcJ3ratKwG4TMRB9aDLO9aWa2SjWc3yvbWMpLaL0s6vRj6
 ZvCq8AQZF8PThooWnnXDPRPXd9ZBoHAg32UvNvQKlYsRqxzaHUedySq+MXpcHe4ddAs6
 GLUtTwqAwpQBHkMyKfS77gtK84iw7sIV4LXwHL78Z6O+Na3ycs/MCA6E9yBpEqrCVjX5
 /IUA==
X-Gm-Message-State: AOAM533Y3Ppx13LWxnuA7ZO0Tai16ltxUzvcsmvNG7YUhivltbqPdMix
 4KvXfAc6HoLGnqgXO7pc+5gR7LaVcb2oYd8UE9JW/UE8hcR/cxcXtdk8Y4LcXnoZRvwVa3FnAGH
 tKPRd05HXeTZRf0EU00RV0mp757ZHwcVKBhGbAcrgrX7ulW/Txps8bAZNmmnVLu6c
X-Received: by 2002:a5d:4291:: with SMTP id k17mr318617wrq.40.1623860572401;
 Wed, 16 Jun 2021 09:22:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyAamDTN9kWttapdnDQOX34c8MVdT1YlKYD3s8JWP5qlCI7qF1YLTNBTzWLSCps8TQNrMir4A==
X-Received: by 2002:a5d:4291:: with SMTP id k17mr318596wrq.40.1623860572254;
 Wed, 16 Jun 2021 09:22:52 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id s7sm2487468wru.67.2021.06.16.09.22.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 09:22:51 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 6/7] ui/vnc: Use qcrypto_tls_session_check_role()
Date: Wed, 16 Jun 2021 18:22:24 +0200
Message-Id: <20210616162225.2517463-7-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210616162225.2517463-1-philmd@redhat.com>
References: <20210616162225.2517463-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Avoid accessing QCryptoTLSCreds internals by using
the qcrypto_tls_session_check_role() helper.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 ui/vnc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/ui/vnc.c b/ui/vnc.c
index b3d4d7b9a5f..c7c8454b873 100644
--- a/ui/vnc.c
+++ b/ui/vnc.c
@@ -4080,9 +4080,9 @@ void vnc_display_open(const char *id, Error **errp)
         }
         object_ref(OBJECT(vd->tlscreds));
 
-        if (vd->tlscreds->endpoint != QCRYPTO_TLS_CREDS_ENDPOINT_SERVER) {
-            error_setg(errp,
-                       "Expecting TLS credentials with a server endpoint");
+        if (!qcrypto_tls_session_check_role(vd->tlscreds,
+                                            QCRYPTO_TLS_CREDS_ENDPOINT_SERVER,
+                                            errp)) {
             goto fail;
         }
     }
-- 
2.31.1


