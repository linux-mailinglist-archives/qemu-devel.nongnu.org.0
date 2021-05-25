Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B09E038FF8B
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 12:51:09 +0200 (CEST)
Received: from localhost ([::1]:40980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llUeS-0005Fi-H1
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 06:51:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1llUae-0008Ud-Rb
 for qemu-devel@nongnu.org; Tue, 25 May 2021 06:47:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38465)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1llUaa-00058u-4B
 for qemu-devel@nongnu.org; Tue, 25 May 2021 06:47:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621939627;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sGUjgQc86yka3JivfX33XNE9207swmMQeXgTKAFQ6Bo=;
 b=MLs+C6rFpXigiXChzXGwsTEcmTGPPq8tqBXRrpV9FqXEMwa8Wqyn29ZNFufrNx2WAlWJeA
 jSMp9gBphK2qvtvntJcsexO1K09f9Ci3eH9fBAOzulEE9SQYIBVzVX9AOVRHZUgCrtVKL4
 LLKLl/FoNsVUqyZ0PG0khRN9DkziK5w=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-385-UEt6lvxlNIyzwTsn9Z4cfQ-1; Tue, 25 May 2021 06:47:05 -0400
X-MC-Unique: UEt6lvxlNIyzwTsn9Z4cfQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 x10-20020adfc18a0000b029010d83c83f2aso14392340wre.8
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 03:47:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sGUjgQc86yka3JivfX33XNE9207swmMQeXgTKAFQ6Bo=;
 b=IF2mLgKwGGF8jtwrFb5J+LCaOKlRWo5OeCum2gvEftMRZMoPiDLMhliPxPUzv4UbgS
 6PsIopgfu6YlMAlmzA2ukk3LGqHL3yKjIRghYWimtfcLs2z7TNRSRohsZXJ0SFZyqze5
 RSvlXi80em00uNWNcUsbRjMaL0xAaLXHABRFGnWO7DXGN4syAeUs8SstqikY+KfGV5SE
 sHHJLlAjc+ziirDJjCShCCfcS+cVdlGlZlPZ/i03Qm7GqlrVdMJ7LxbSYly0LbWMtO9i
 rpyCnFcMyiuo2FrK+vf7bDf1yjrviWp1jhcZ/5iGwiZmfStakD3xWFzC++ND3JTd4/OY
 7iZA==
X-Gm-Message-State: AOAM53016aOEagoAKP0nD3uG920VeKWNymlL2SJUBbXr/1CgT3WBEgKJ
 ba/ZJCFAoRHCp/KiW1BUBn+7dz1LRCvOqcfc1GNGIQmNVZ3nZatSxRbSxtGtVvDAV3LtLMVC0BX
 /bhRMyEB+FVD3RxGtzseo1GYLomUH8z0xELkaEqIXWqIik9tthuQLcNReJe26BGrC
X-Received: by 2002:a5d:690b:: with SMTP id t11mr24238294wru.250.1621939624285; 
 Tue, 25 May 2021 03:47:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxdB4QDtRRJiAhusc05G2MPjPPsvzE3w7/V7Vv8+MiIXa4ZHMf6K1006ZSnWX+9FgwsYmpEzg==
X-Received: by 2002:a5d:690b:: with SMTP id t11mr24238276wru.250.1621939624151; 
 Tue, 25 May 2021 03:47:04 -0700 (PDT)
Received: from localhost.localdomain (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id r5sm12521600wmh.23.2021.05.25.03.47.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 03:47:03 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] meson: List if X11 dependency is detected
Date: Tue, 25 May 2021 12:46:47 +0200
Message-Id: <20210525104648.4060904-3-philmd@redhat.com>
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

It is sometimes useful to know if X11 is detected.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 meson.build | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meson.build b/meson.build
index 2a7d69cf428..5ca1bd36292 100644
--- a/meson.build
+++ b/meson.build
@@ -2671,6 +2671,7 @@
 summary_info += {'SDL support':       sdl.found()}
 summary_info += {'SDL image support': sdl_image.found()}
 # TODO: add back version
+summary_info += {'X11 support':       x11.found()}
 summary_info += {'GTK support':       gtk.found()}
 summary_info += {'pixman':            pixman.found()}
 # TODO: add back version
-- 
2.26.3


