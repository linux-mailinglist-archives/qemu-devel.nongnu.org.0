Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 759F856D065
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Jul 2022 19:16:42 +0200 (CEST)
Received: from localhost ([::1]:35730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oAaXx-00034Y-DU
	for lists+qemu-devel@lfdr.de; Sun, 10 Jul 2022 13:16:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oAaJb-0007Sx-2z
 for qemu-devel@nongnu.org; Sun, 10 Jul 2022 13:01:56 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:44939)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oAaJZ-0003Pd-ER
 for qemu-devel@nongnu.org; Sun, 10 Jul 2022 13:01:50 -0400
Received: by mail-pl1-x635.google.com with SMTP id q5so2628218plr.11
 for <qemu-devel@nongnu.org>; Sun, 10 Jul 2022 10:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1v3/wckqq7KYJ7X9Xr1gO9bYq9x/4QI0yUUksHCTono=;
 b=WmmMk/Iroz6NbMzSZfIo8F6ADU7f9IPArGeSrbl+Ogl4pIU4zLBs3zd77NKQCncLjR
 05eFysX1RAp9gfUIadf6awnjJ9o1ZW/Co2Jk2bLIJF6cyXy+cEe3bwvsbhND1q+EJJgX
 wUjqGVL/lcYIlMcGURA/DY1aR2m4pbpoRbuxnP2xgvPU5h5F5vb0gGmVNkaNrGuUtW56
 /lNwoxB0hUSqyt14rqFABMfjqr+ELyHrNuIAC8fOyeLIWDPge4ANazq5QC3uzgWEkF/c
 03xrkb3pS02Z9aYUB5hDtZlM/B04i7YrLYoEl3Km/8bSaA87xCSV+g35fcmeal1UMdV5
 wBKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1v3/wckqq7KYJ7X9Xr1gO9bYq9x/4QI0yUUksHCTono=;
 b=t5u9YpebUfOJoTXQ8wnJPBbaObDXlNyAgzV00w4aCWXr9XDUqlPkGa6fORGsYsqGP9
 f7hHZlV2SMiiaa151jiVXhD/Tpe0KxDbQZ3BWasEIpM9CIfQ84X/S4uNZHNG4mvuet8A
 WQdoq5n4CABdce6XjmLsOrzmWl+tck2l8GA28FRRe2jNgrS34AeytH8na3u+W1phTU+L
 +MtLR4nJFWmRTEFrNnQOjwZb5xBtGmgsGTbwTRttNpZUGmfDtBnK29sZ6nGSu1FIUEbs
 6DvA3g8hFsXdqAYd68CiHVx/H7IqXNglQghB+9qxzWTCHHF7UfdzMFkw6Fmm9X4yNvYN
 brlw==
X-Gm-Message-State: AJIora9ERGl6O56vtYX40HEnK7YIxDOk0EoNi2z2NXoOQGvDX/FxWv1D
 1TfFi4kPBg2evVmVwymBm4od+J5XMqXX1svt
X-Google-Smtp-Source: AGRyM1stLIXRSIWgVUYpE1/9c1LT12/9GyCXQKeTl+MfoC8gXrZ6oDhalFzbWo0QCJINfTz13J+k9w==
X-Received: by 2002:a17:90b:3a8b:b0:1f0:127:360d with SMTP id
 om11-20020a17090b3a8b00b001f00127360dmr12783517pjb.64.1657472508542; 
 Sun, 10 Jul 2022 10:01:48 -0700 (PDT)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([115.96.107.107])
 by smtp.googlemail.com with ESMTPSA id
 u14-20020a17090341ce00b0016c19417495sm2930596ple.239.2022.07.10.10.01.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Jul 2022 10:01:48 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
To: qemu-devel@nongnu.org
Cc: thuth@redhat.com, peter.maydell@linaro.org, berrange@redhat.com,
 jsnow@redhat.com, pbonzini@redhat.com, imammedo@redhat.com, mst@redhat.com,
 Ani Sinha <ani@anisinha.ca>
Subject: [PATCH v2 11/11] MAINTAINERS: add myself as the maintainer for acpi
 biosbits pytests
Date: Sun, 10 Jul 2022 22:30:14 +0530
Message-Id: <20220710170014.1673480-12-ani@anisinha.ca>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220710170014.1673480-1-ani@anisinha.ca>
References: <20220710170014.1673480-1-ani@anisinha.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::635;
 envelope-from=ani@anisinha.ca; helo=mail-pl1-x635.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

I wrote the biosbits test framework, the pytest for testing QEMU with biosbits
and all the related changes. Making myself as the maintainer for biosbits
related files and test scripts.

Signed-off-by: Ani Sinha <ani@anisinha.ca>
---
 MAINTAINERS | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index aaa649a50d..32fbd27b66 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1860,6 +1860,11 @@ S: Supported
 F: hw/acpi/viot.c
 F: hw/acpi/viot.h
 
+ACPI/PYTEST/BIOSBITS
+M: Ani Sinha <ani@anisinha.ca>
+S: Supported
+F: tests/pytest/acpi-bits/*
+
 ACPI/HEST/GHES
 R: Dongjiu Geng <gengdongjiu1@gmail.com>
 L: qemu-arm@nongnu.org
-- 
2.25.1


