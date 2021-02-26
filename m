Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4FB33261DE
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 12:17:33 +0100 (CET)
Received: from localhost ([::1]:42140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFb7k-00052q-BG
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 06:17:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lFb6q-0004dU-RI
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 06:16:36 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:51385)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lFb6p-0002uN-2X
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 06:16:36 -0500
Received: by mail-wm1-x32b.google.com with SMTP id g11so3386018wmh.1
 for <qemu-devel@nongnu.org>; Fri, 26 Feb 2021 03:16:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HHzWegQAun95d3wCnNSfG6kUdobnsd8+Z9JBauUsPWo=;
 b=pmze6lv6H/VulN5K2+XU2bsdRa7RnUi9ACXezq7BJoGRjC8rK01rh+LjpJ5CvuZlnU
 hNBe+sY6epcsWsg85b2MxeFrG7FwcWYpqbIE6UbrB37b90PDFPr+25Zd442evkxwQ33a
 yKYqS075/rRau5PLz6EVtpLt7OwrSIiwFA6Ogdc9Z5hst+vWPolr6e6iv1Z2ZtkSMQ/D
 ZszoE4ZAYvXv18Zb9JKgoFNciDcedAx7VVDMl/3uk5aHBBpS0dVRd1GrNZMw/s4SzGqQ
 V6laBYPNbL3zS8seLnXNJqe0GBamnfU73tXjP3HeP4IxLT4oiyh4Pp4WRNJ/F7iU8nUX
 kNBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HHzWegQAun95d3wCnNSfG6kUdobnsd8+Z9JBauUsPWo=;
 b=aszOYza2XP8fDt5MAed6cnVaaZYiDKToOBvONwFNSBUdiiCz/0JQ46Bswh44HHI04F
 dLuCD3nJFdJ9JerWDiI2UDIu79k4m2UCTCw+Nld7z5BAsPN+rDQ9sbY6CIvKcHbwzF78
 VVTjabWhS/Tz/kZ3BxNCbCXZ0u3m26jD/edBVXCVYoVLiTDdKisDOkIhNw4/+TIUDPiJ
 1Dre6Y1wU5ddzZL4Y2khLeeOv4J5rBUQddqehHi5psNlBy9nR7PhdHz41mFnrbpWR6kj
 pEkDf71ncioUeZuSVViaoYOLIX6SdfeH35UNXsa9P4HWDFzRG3cd29mnhozmVfCNaNA5
 KXig==
X-Gm-Message-State: AOAM532UZKQA8ev8HZxK8zVuR9qakqJndhYpJhdunp/+blQZY5LpUaUk
 celfIYzG/Z+S9Vww650T7Cu25w==
X-Google-Smtp-Source: ABdhPJx0gOF/lZhT0fX3gXaX4XMlnpZLa/vd0hf/ko9C+F/vrgRZytbagDdjzJaR/jEDKchPUaWO6g==
X-Received: by 2002:a1c:1d14:: with SMTP id d20mr2381554wmd.36.1614338193426; 
 Fri, 26 Feb 2021 03:16:33 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id h22sm12574234wmb.36.2021.02.26.03.16.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 03:16:32 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 72F5E1FF7E;
 Fri, 26 Feb 2021 11:16:31 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org,
	rust-vmm@lists.opendev.org
Subject: [VHOST USER SPEC PATCH] vhost-user.rst: add clarifying language about
 protocol negotiation
Date: Fri, 26 Feb 2021 11:16:19 +0000
Message-Id: <20210226111619.21178-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: virtio-dev@lists.oasis-open.org, "Michael S. Tsirkin" <mst@redhat.com>,
 viresh.kumar@linaro.org, Jiang Liu <gerry@linux.alibaba.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 stratos-dev@op-lists.linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In practice the protocol negotiation between vhost master and slave
occurs before the final feature negotiation between backend and
frontend. This has lead to an inconsistency between the rust-vmm vhost
implementation and the libvhost-user library in their approaches to
checking if all the requirements for REPLY_ACK processing were met.
As this is purely a function of the protocol negotiation and not of
interest to the frontend lets make the language clearer about the
requirements for a successfully negotiated protocol feature.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Jiang Liu <gerry@linux.alibaba.com>
---
 docs/interop/vhost-user.rst | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/docs/interop/vhost-user.rst b/docs/interop/vhost-user.rst
index d6085f7045..3ac221a8c7 100644
--- a/docs/interop/vhost-user.rst
+++ b/docs/interop/vhost-user.rst
@@ -301,12 +301,22 @@ If *slave* detects some error such as incompatible features, it may also
 close the connection. This should only happen in exceptional circumstances.
 
 Any protocol extensions are gated by protocol feature bits, which
-allows full backwards compatibility on both master and slave.  As
-older slaves don't support negotiating protocol features, a feature
+allows full backwards compatibility on both master and slave. As older
+slaves don't support negotiating protocol features, a device feature
 bit was dedicated for this purpose::
 
   #define VHOST_USER_F_PROTOCOL_FEATURES 30
 
+However as the protocol negotiation something that only occurs between
+parts of the backend implementation it is permissible to for the master
+to mask the feature bit from the guest. As noted for the
+``VHOST_USER_GET_PROTOCOL_FEATURES`` and
+``VHOST_USER_SET_PROTOCOL_FEATURES`` messages this occurs before a
+final ``VHOST_USER_SET_FEATURES`` comes from the guest. So the
+enabling of protocol features need only require the advertising of the
+feature by the slave and the successful get/set protocol features
+sequence.
+  
 Starting and stopping rings
 ---------------------------
 
-- 
2.20.1


