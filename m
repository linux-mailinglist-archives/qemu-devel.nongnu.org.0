Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B152C0516
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 13:00:23 +0100 (CET)
Received: from localhost ([::1]:44698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khAW5-0002ro-5Q
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 07:00:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1khAFu-0004lL-G2
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 06:43:38 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:55929)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1khAFs-0002lC-Ud
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 06:43:38 -0500
Received: by mail-wm1-x32e.google.com with SMTP id c9so17598112wml.5
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 03:43:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=zDNMk2PJRRTvXS2ZqnJB9n1c5ljPH2kwl7Tf8xoGyyU=;
 b=Q9ojOcuZ3SlY415oRKnNn1wCCvLC555fbQ6xbySdn8iuyQsdlCMsI/+hoqH22fle07
 QyhIeK+Fs/QXUnOeXIM4OFTBLTHOlK8+hrqIv0ARiHUtj0Yij3wbHVYYJNI3R7sdYjd5
 +MWR42PFMNzxD5kmb2IMKgAQ6RM3tf38+ZTZ6zJIVEIMqptW8JHflPOmY7bzdS4w3f7y
 HMRw7jeUmlMQ07LWRbaOl4d4EWUrX/ttsqyIz7eZgwvowl0WvLS+kKWTH5q0WZ3Ck/XG
 CkRQQ6yWGirkOvgI/HL1/hdbm+RFNlKzKH43oEiw0XTSEPw+X+9tvQQxc8kSmJ8o2MMD
 Ip0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zDNMk2PJRRTvXS2ZqnJB9n1c5ljPH2kwl7Tf8xoGyyU=;
 b=J+xcoQw2w/lU6LKxI4OXwFCsqaos4jzRWKpm2ZWTKUOoQ36SzsdPFPGBA3Uoi9IIOu
 aeXCnyEGV0q2m8KBJ40VfSkkxnUbeSA86K6AFFI9aTJR2oYCQtP8OvwZwwptSRyWGOFN
 heZ+ZBzuOJ1C3Aiu6OFRKr9AYm/NgeIcyCSSYJ781k9YisRpSX05OxSdQKELcS7R86Yp
 peCs0wb05EAxE00asdn+zVRCCG/pvaNUj4hWELg6U/Oma/eb34d34Ds0GN2eiLJAMPR6
 eJqDpspm0K3ofTvTtKLnkh7R3zrt9JZZh+IoUgVZ6T9Q87/1q+uxNzRiVI8pH9E5eQC9
 ddRg==
X-Gm-Message-State: AOAM533fkdhVGobL7IGjYDE1VJSZArRwUP+qWe9zSkwhnroA/S4XMMEH
 nyHpJA+aRpsXMJcZ9lyx6VmkDHYoeOy/3g==
X-Google-Smtp-Source: ABdhPJzD25emMCkq7yDwmIsdDdmUoOM3J9Q15a0t0KZP1nBaFNLJggQvWJtk5lVcgrsvZoC9g9IZpw==
X-Received: by 2002:a1c:a445:: with SMTP id n66mr24190714wme.51.1606131815377; 
 Mon, 23 Nov 2020 03:43:35 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g186sm50836495wma.1.2020.11.23.03.43.34
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2020 03:43:34 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 16/24] docs: Move virtio-net-failover.rst into the system manual
Date: Mon, 23 Nov 2020 11:43:07 +0000
Message-Id: <20201123114315.13372-17-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201123114315.13372-1-peter.maydell@linaro.org>
References: <20201123114315.13372-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The virtio-net-failover documentation is currently orphan and
not included in any manual; move it into the system manual,
immediately following the general network emulation section.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---
 docs/system/index.rst                     | 1 +
 docs/{ => system}/virtio-net-failover.rst | 0
 2 files changed, 1 insertion(+)
 rename docs/{ => system}/virtio-net-failover.rst (100%)

diff --git a/docs/system/index.rst b/docs/system/index.rst
index c0f685b818e..d0613cd5f72 100644
--- a/docs/system/index.rst
+++ b/docs/system/index.rst
@@ -21,6 +21,7 @@ Contents:
    monitor
    images
    net
+   virtio-net-failover
    usb
    ivshmem
    linuxboot
diff --git a/docs/virtio-net-failover.rst b/docs/system/virtio-net-failover.rst
similarity index 100%
rename from docs/virtio-net-failover.rst
rename to docs/system/virtio-net-failover.rst
-- 
2.20.1


