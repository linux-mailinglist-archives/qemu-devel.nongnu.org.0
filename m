Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACEA632B8BE
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 15:53:16 +0100 (CET)
Received: from localhost ([::1]:36120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHSsF-0002n8-Ns
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 09:53:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lHSpX-000859-84
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 09:50:27 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:44885)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lHSpV-0003Xy-90
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 09:50:26 -0500
Received: by mail-wr1-x429.google.com with SMTP id h98so23964644wrh.11
 for <qemu-devel@nongnu.org>; Wed, 03 Mar 2021 06:50:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=E99V4n6lOwxCalYgYqNMR8keVMCIGXSuqZSWRw9fGWg=;
 b=VpHTL+U2NJcrrGdvX2/E8e2nr4L5124FCFZqNmwYi79wAJEdOSmfL439vF5s3qW9LH
 /3HoWRf7wJ8w8co4lsq5bLfdXWvi1osF65F8PARWnJkSdurBuhZcTt898YsI+FW4S3b4
 j7LW4SviqcvqtMn2ypuHIP4q8CBdkMH9zhEXSX26/AKwWoH7BUpPuXJNM5cVLlTMcodG
 Q9FQutKKCWyMlD60sa+9x8XtPfVUel19ERLgSNHtFtq0d/OnQmfez/AtwfiMuN3ebg5U
 BBwRpstqlDFemMqS3PZYbkGVmHKtEFKOIVha0klKYorphmo1b8zBN5X5nfmlIzI0Syl/
 UbEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=E99V4n6lOwxCalYgYqNMR8keVMCIGXSuqZSWRw9fGWg=;
 b=QwMwoch1j2d1nbEpyJPZT6oZQKOZ+MdfGxt6jUtW85pNPPxW4z3yk+IIzvikeB/lep
 cseJx7EdY84AFkoqu70Cn8lYsbC1kzXfw1oyOEGHeT2jWosTeRkK7wF5tRFfUOOBU8od
 q6sqtbg6n32iKPZUqzlVJfcdphBO1bXpb9EHa8wnNgaKeJFTwJDep038zvr51lwC/t/f
 ydiDBqZgp3eahb/LdPR2LngCiXDAUyA8J0bv5N+oodwgwbcGw3bmNC8rEQu64oxo3dTK
 y5EGxwlh371chCvO4c50I9HsDNm0ea0Sx0mjiiABwC1/mCvi3v0kdnj3Hxn4DFHMR+H6
 HNZA==
X-Gm-Message-State: AOAM532He35nvkdNvKoV6Fuumj7tqRDF6fmeUjDOGm7ZDNk894FYaO6R
 8PRC2UQTZLuR+vLBVp2AOkVJWQ==
X-Google-Smtp-Source: ABdhPJzR+9w9RsML0MV31T0YFywILM7jIqB7PSckw+dGI0uIND9TBqg/TUYcwbJ2hxAdtulfIp11wg==
X-Received: by 2002:a5d:5487:: with SMTP id h7mr4510654wrv.348.1614783023270; 
 Wed, 03 Mar 2021 06:50:23 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id q25sm6014109wmq.15.2021.03.03.06.50.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 06:50:22 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 588C21FF7E;
 Wed,  3 Mar 2021 14:50:21 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] vhost-user.rst: add clarifying language about protocol
 negotiation
Date: Wed,  3 Mar 2021 14:50:11 +0000
Message-Id: <20210303145011.14547-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
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
Cc: Jiang Liu <gerry@linux.alibaba.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, stefanha@redhat.com,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Make the language about feature negotiation explicitly clear about the
handling of the VHOST_USER_F_PROTOCOL_FEATURES feature bit. Try and
avoid the sort of bug introduced in vhost.rs REPLY_ACK processing:

  https://github.com/rust-vmm/vhost/pull/24

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Jiang Liu <gerry@linux.alibaba.com>
Message-Id: <20210226111619.21178-1-alex.bennee@linaro.org>

---
v2
  - use Stefan's suggested wording
  - Be super explicit in the message descriptions
---
 docs/interop/vhost-user.rst | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/docs/interop/vhost-user.rst b/docs/interop/vhost-user.rst
index 2918d7c757..7c1fb8c209 100644
--- a/docs/interop/vhost-user.rst
+++ b/docs/interop/vhost-user.rst
@@ -307,6 +307,18 @@ bit was dedicated for this purpose::
 
   #define VHOST_USER_F_PROTOCOL_FEATURES 30
 
+Note that VHOST_USER_F_PROTOCOL_FEATURES is the UNUSED (30) feature
+bit defined in `VIRTIO 1.1 6.3 Legacy Interface: Reserved Feature Bits
+<https://docs.oasis-open.org/virtio/virtio/v1.1/cs01/virtio-v1.1-cs01.html#x1-4130003>`_.
+VIRTIO devices do not advertise this feature bit and therefore VIRTIO
+drivers cannot negotiate it.
+
+This reserved feature bit was reused by the vhost-user protocol to add
+vhost-user protocol feature negotiation in a backwards compatible
+fashion. Old vhost-user master and slave implementations continue to
+work even though they are not aware of vhost-user protocol feature
+negotiation.
+
 Ring states
 -----------
 
@@ -865,7 +877,8 @@ Front-end message types
   Get the protocol feature bitmask from the underlying vhost
   implementation.  Only legal if feature bit
   ``VHOST_USER_F_PROTOCOL_FEATURES`` is present in
-  ``VHOST_USER_GET_FEATURES``.
+  ``VHOST_USER_GET_FEATURES``.  It does not need to be acknowledged by
+  ``VHOST_USER_SET_FEATURES``.
 
 .. Note::
    Back-ends that report ``VHOST_USER_F_PROTOCOL_FEATURES`` must
@@ -881,7 +894,8 @@ Front-end message types
   Enable protocol features in the underlying vhost implementation.
 
   Only legal if feature bit ``VHOST_USER_F_PROTOCOL_FEATURES`` is present in
-  ``VHOST_USER_GET_FEATURES``.
+  ``VHOST_USER_GET_FEATURES``.  It does not need to be acknowledged by
+  ``VHOST_USER_SET_FEATURES``.
 
 .. Note::
    Back-ends that report ``VHOST_USER_F_PROTOCOL_FEATURES`` must support
-- 
2.20.1


