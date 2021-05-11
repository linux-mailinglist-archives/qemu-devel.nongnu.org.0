Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C36F37AB7A
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 18:07:01 +0200 (CEST)
Received: from localhost ([::1]:54572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgUuR-0004BJ-Ko
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 12:06:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lgUih-00066N-FF
 for qemu-devel@nongnu.org; Tue, 11 May 2021 11:54:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lgUid-0001mr-BP
 for qemu-devel@nongnu.org; Tue, 11 May 2021 11:54:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620748486;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1HW5KiXU9x1fyjWrXkjRzFNAMXJe988ypEDYDhTK8zM=;
 b=Yiy1fLCmLILuq5x+MHcqOEMCqsJlDU+aLyLsft1eS9nRmgTqs6iSs7TYNwObdhjv+PU0Wa
 d+xyVTLbZZ7sGXgQvH04mcQFTLYyEYb+xL82pFsJdeJEivjYk60gcuS0gY5zpegSfoy/F/
 KDMyCocA9BkFOElgysmXlI3ytUPQ5kI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-157-LlOgz2s_N1i6F43h2BMxIg-1; Tue, 11 May 2021 11:54:42 -0400
X-MC-Unique: LlOgz2s_N1i6F43h2BMxIg-1
Received: by mail-wm1-f72.google.com with SMTP id
 f8-20020a1c1f080000b0290169855914dfso43091wmf.3
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 08:54:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1HW5KiXU9x1fyjWrXkjRzFNAMXJe988ypEDYDhTK8zM=;
 b=OutBSHfvxwZ3+vGGqAVvydnnSppmOXhIyVyTd+wKemZ/zqaz+pXceX3baqA6MkaSBW
 xluMUe4U4iKoG/UPAOAfFvE1+8sq48KKBnif3XftoGxzljaS5+9FgAP0On+/0L8JtpmV
 oVTXaaMvEFwk3RtjYeeW6ApI6kYn00Fzc67eTlvoLd8uaVyuSJOsaCbcPN8ROkPOhZX/
 bBc0UbcYE4p2UrJ7sffGXBv/iSKceXjB0iDoaBGBU3wMMWSu273Rv1W5PT1MlKR0QDeO
 Uy/zBwN8f+DOY6Z6yGdsGKTGgpx1VTKYP2e/+vI8bOWTqaM6M6SO6qqbwO77ytagmud/
 MbqA==
X-Gm-Message-State: AOAM531gM32mamR+9yNATFbFOEmTaHqzxwteEwk6yzrtlQdf880krkSe
 R6OpuO4a/g9/c6qJuf9S0cXKaa9MggjH0OPV7ofrIB6GujbFA20imXt2hogdjQkITPIFSrfFHCq
 hs9ZnbYiYPlTPZAd7ELuvFhwynsJl2DedaPsCfcWHw7dZuZVd+7G/NOYypUX4081P
X-Received: by 2002:a05:600c:3542:: with SMTP id
 i2mr6388874wmq.171.1620748481193; 
 Tue, 11 May 2021 08:54:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyxMHNyXU7OI0Rx0yEkzor2GY7dmBWwl1ffVtys89xpItKXh9siPamKM9v20ayzQsdaEWLxrw==
X-Received: by 2002:a05:600c:3542:: with SMTP id
 i2mr6388849wmq.171.1620748480957; 
 Tue, 11 May 2021 08:54:40 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id f1sm691996wrr.63.2021.05.11.08.54.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 May 2021 08:54:40 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 5/5] meson: Do not use internal fdt library if user asked
 for the system one
Date: Tue, 11 May 2021 17:53:54 +0200
Message-Id: <20210511155354.3069141-6-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210511155354.3069141-1-philmd@redhat.com>
References: <20210511155354.3069141-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Greg Kurz <groug@kaod.org>, qemu-ppc@nongnu.org,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If the user explicitly asked for the system libfdt library, but
the library is not usable (usually too old), we should not silently
default to the internal one.
Respect the user decision, and only default to 'internal' if in
auto mode.

Fixes: fbb4121d592 ("dtc: Convert Makefile bits to meson bits")
Reported-by: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
BugLink: https://bugs.launchpad.net/qemu/+bug/1907427
Fixes: https://gitlab.com/qemu-project/qemu/-/issues/255
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index 0b41ff41188..1ffb4bccdb2 100644
--- a/meson.build
+++ b/meson.build
@@ -1612,7 +1612,7 @@
        int main(void) { fdt_check_full(NULL, 0); return 0; }''',
          dependencies: fdt)
       fdt_opt = 'system'
-    elif have_internal
+    elif have_internal and fdt_opt in ['enabled', 'auto']
       fdt_opt = 'internal'
     else
       fdt_opt = 'disabled'
-- 
2.26.3


