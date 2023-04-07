Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FABE6DAF36
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Apr 2023 17:04:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkncE-0007F4-C7; Fri, 07 Apr 2023 11:03:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cconte@redhat.com>) id 1pknTp-00050T-MM
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 10:54:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cconte@redhat.com>) id 1pknTo-0003wJ-1n
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 10:54:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680879259;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=htEWl4Mvn55vZP22dwBybomTrNrGx84tgkSEpE07Fxs=;
 b=EohDrZSXu/7D1gLtjm4oSG6/SgNv+DxXFN8/KZ/V4kk3FUfXfrvW+6OyG2YjbhhjI5XKRB
 FuE/kqJ8D0A/xMVjGSNvu0qzHuukgmOTQno0OwjSSLfEVx66UzOwVRc8fgyMtWduYM5z9E
 DxHmN/J9iTHTXhh/0Qsd4MHOOzwvC8o=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-62-sgOT45TyNcGCiWALdGVAFg-1; Fri, 07 Apr 2023 10:53:10 -0400
X-MC-Unique: sgOT45TyNcGCiWALdGVAFg-1
Received: by mail-wm1-f69.google.com with SMTP id
 p10-20020a05600c358a00b003edf7d484d4so19843317wmq.0
 for <qemu-devel@nongnu.org>; Fri, 07 Apr 2023 07:53:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680879189; x=1683471189;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=htEWl4Mvn55vZP22dwBybomTrNrGx84tgkSEpE07Fxs=;
 b=WSa20o6sIR1lig2DAFukc9xrsbrxVr9AYdLKPaUBwxIr2ja5IiWokXX/3xk8jJ9TxR
 2dtDsQ/RzQDV5ld/IiGCStmdTaie2/GcjP5Ace2FgmTb8MYZ/LiTT81Abkxxops6Wg2X
 BPQ5070zr+EHqf/WF1lFBdiCDZXn2+ZBXRCVLn9bZ3TLg5dIP4e8Avjb2tzArPz0K+4b
 7BkEeNO5DSOJc87WYRR/gi0czpiytLPfAQbATyl9XbK0viWI2wCwqF8/prSIMk5gupxM
 O03/7zXzA7EqTIWDoA0TgEu+EdQiBNvVntrRrkUk6tU4GvsVQdL7hW8kU88qrTPevUBq
 Wh+Q==
X-Gm-Message-State: AAQBX9dIctXrQ7js03dHW3Gg6SQLA565JCFOYiwFp1ChALIjOczhMgFw
 avboMLuA3LttjUz5bvZ9emR7aSJDEFEPsU7W+BU9R2u3YB30FqeVrqi15FC8WHJuRrXROnbz4OM
 fWK8JH8ru7L/1Q3pIyURQThPpIt5GiA4oSKY2aHvusWg3k9X0VPKhHqPyFgYqlCFhQXfII1Ba
X-Received: by 2002:a05:600c:2192:b0:3ed:2b49:eefc with SMTP id
 e18-20020a05600c219200b003ed2b49eefcmr1577580wme.3.1680879188882; 
 Fri, 07 Apr 2023 07:53:08 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZgBBjpgYzCwQC98O6wHa0eDo9ZGcQfv/aSDoL/hvPIetpiopcKFySOUDD8ROJb/mgWw8f+6Q==
X-Received: by 2002:a05:600c:2192:b0:3ed:2b49:eefc with SMTP id
 e18-20020a05600c219200b003ed2b49eefcmr1577564wme.3.1680879188618; 
 Fri, 07 Apr 2023 07:53:08 -0700 (PDT)
Received: from pinkpad.lan ([2001:b07:ad4:d988:168b:4301:918a:373e])
 by smtp.gmail.com with ESMTPSA id
 h4-20020a1ccc04000000b003ed2433aa4asm4812694wmb.41.2023.04.07.07.53.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Apr 2023 07:53:08 -0700 (PDT)
From: Camilla Conte <cconte@redhat.com>
To: qemu-devel@nongnu.org
Cc: Camilla Conte <cconte@redhat.com>
Subject: [PATCH 2/2] Raise crash-test-debian timeout to 90 minutes
Date: Fri,  7 Apr 2023 15:52:52 +0100
Message-Id: <20230407145252.32955-2-cconte@redhat.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230407145252.32955-1-cconte@redhat.com>
References: <20230407145252.32955-1-cconte@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cconte@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 07 Apr 2023 11:02:56 -0400
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

When running on the Kubernetes runner, this CI job is timing out.
Raise the limit to give the job enough time to run.

Signed-off-by: Camilla Conte <cconte@redhat.com>
---
 .gitlab-ci.d/buildtest.yml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
index ba6f551752..893f8c69b4 100644
--- a/.gitlab-ci.d/buildtest.yml
+++ b/.gitlab-ci.d/buildtest.yml
@@ -98,6 +98,7 @@ crash-test-debian:
   needs:
     - job: build-system-debian
       artifacts: true
+  timeout: 90m
   variables:
     IMAGE: debian-amd64
   script:
-- 
2.39.2


