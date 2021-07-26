Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86FF23D5B8F
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 16:29:16 +0200 (CEST)
Received: from localhost ([::1]:35052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m81bX-0000l5-Iy
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 10:29:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m81WJ-0005jV-OY
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 10:23:51 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:33382)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m81WI-0008TX-37
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 10:23:51 -0400
Received: by mail-wr1-x435.google.com with SMTP id q3so11389729wrx.0
 for <qemu-devel@nongnu.org>; Mon, 26 Jul 2021 07:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1SF2wV60jHXpA3/icP5948eF0SHHMvzDyypIB3tlxP8=;
 b=dbHTRdhfOgl6Vgp0Zt7GiL44umoKZVLFrc4odmfVULSChFxBeg35TxdtuAx63qP0ei
 VCXvMw9k56TSY4oGDXU+2D3WjU4Yksof7512PYFzORhE0oVTrFZKNHSwgWvy21e/uJSi
 WJKpUWGYfcKGfc/GP6qEVGfkYIwA0y2GksIR1Uq94wwRtgGSelcEG6jhELqXqBpdlwEj
 1dNeJ+8Bm8CVhjABS8xlutZi4SVWFZyNqBpSF6fkFznjdVRkQsfTuH7fraReGyPHul+P
 9KYVdjvIdSHinBffHwnZ4AHj5xrIDBHZTEosPzHGvRUkUF8pOchXjORbPjgtG/HHQTAi
 D9ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1SF2wV60jHXpA3/icP5948eF0SHHMvzDyypIB3tlxP8=;
 b=EsVNCaCQuXYdJzad6WGbYfJkvmlItlja87Yw1Rss5Dw31OY+A4eR8EgzUw43g67EPC
 ZvCbpmQSsE+JausFo9jl6+iplhCdNQdg0kRrOR4Xx6+q4q71j4zkGUwfhX1I8eXBRGnu
 OxZG3mTTb5ZiP6CyM+8SkmwlQAGlNnWVtttUVAeVk1F5gbzQh4ZgDMl8583KchcSOaSY
 foW6VolP5LwxIZksA3p9WVrYB7XLShi6xywcwhV16+gab54R5RQHAysXwubLopvjTYIK
 k5qokQ7XB9+rYDxDmQUwswgx4AM7J4PDr/U7+DUYTDrwmG2k5uc53GzmCPpal96Q2TRE
 IWFg==
X-Gm-Message-State: AOAM533F1fEi+9A/4uPZEqMLjzGgiVj3YpPD0OYU4J8vWLB6Lb8cVJ6Z
 KrzhxySxTZ1moIGe6MTLDMPkgpHxaqBerQ==
X-Google-Smtp-Source: ABdhPJyVw2FNMuMyo9z9mKboe0pdB+lK1vxXqHOa/kQ18rPdlPDSCcXhwpgLvWJqXGG2jbD+1FBZVQ==
X-Received: by 2002:a05:6000:1841:: with SMTP id
 c1mr19037308wri.423.1627309428721; 
 Mon, 26 Jul 2021 07:23:48 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id 6sm13823427wmi.3.2021.07.26.07.23.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 07:23:48 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.1 09/10] docs/about/removed-features: Fix markup error
Date: Mon, 26 Jul 2021 15:23:37 +0100
Message-Id: <20210726142338.31872-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210726142338.31872-1-peter.maydell@linaro.org>
References: <20210726142338.31872-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
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
Cc: Juan Quintela <quintela@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The section describing the removed feature "-usbdevice ccid" had a
typo so the markup started with single backtick and ended with double
backtick; fix it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/about/removed-features.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/about/removed-features.rst b/docs/about/removed-features.rst
index 28bb035043d..07d597847c9 100644
--- a/docs/about/removed-features.rst
+++ b/docs/about/removed-features.rst
@@ -124,7 +124,7 @@ devices.  Drives the board doesn't pick up can no longer be used with
 '''''''''''''''''''''''''''''''''''''
 
 This option was undocumented and not used in the field.
-Use `-device usb-ccid`` instead.
+Use ``-device usb-ccid`` instead.
 
 RISC-V firmware not booted by default (removed in 5.1)
 ''''''''''''''''''''''''''''''''''''''''''''''''''''''
-- 
2.20.1


