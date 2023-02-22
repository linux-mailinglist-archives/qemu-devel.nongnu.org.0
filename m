Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53E2F69F876
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 16:57:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUrTg-00068U-9J; Wed, 22 Feb 2023 10:56:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pUrTa-000665-IB
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 10:56:14 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pUrTY-0008LD-2o
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 10:56:14 -0500
Received: by mail-pl1-x62f.google.com with SMTP id h14so9375477plf.10
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 07:56:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
 :subject:from:to:cc:subject:date:message-id:reply-to;
 bh=hWlKEo0GD3g9gDpV+1644YfmAujfkYBPs52S74w+SrU=;
 b=rXDKvuUpXF+V/BXf2QEneEY17Jy97aMApOrG82ComOuYc5wWKNEdU1UR7wM1CdI256
 l9OpzokH2VPfjeba57PvR1xw/sSm+qKM/8hZtUSJpB6SGoqVsub6ZC13YpABK+1bAp69
 Rb0XqJdUJGI7isib+7J0bXipcxLgZjqVXel1VI8671s3+1sdhyL/eWgJjo+athfPYAcK
 UmcXPsq5JRZvSz0nSS7OOMsnsrFiEFD+t1GzLub2fOshqO5fL/Du///t4kSKX18lIhwI
 p7SLwsfNV9EPQNdBG9b4GZ25eXpn93WGSYYi/noH0aZX2tXr/QXf5pcbYMlJlcNLb54C
 Qvzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
 :subject:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hWlKEo0GD3g9gDpV+1644YfmAujfkYBPs52S74w+SrU=;
 b=2p6aXHS2PQYatV8lwTZEp4aIpGbOx5d4HFoan+hDPu73Y99ck40nXHc5Mdpkjc3jcQ
 EuqKh4PIkIxFt0lBfKeeyC/MEMXL/pe8+Rwl14qs1qvqPTYpx0fSXw4/4O0jNDbHkoiS
 JtbNlpkVvW6Q+N5OqIf2K7FfZUAsxtODZiVBcf6teETzYbwW/9nirLzIIybHkBa1pTWf
 ltUYJ/KPrMTauSkKYMoXSmAEhCOF0ALEIhp66soNCVTLSypoaJ9EXXO8Zy8+HBS3PCha
 RuvVE5MydtjTnodaPnoGZIrxER3ek1Ug7kKc/rWgng9wtuGF3OXhHqC9J1VecznQN2O6
 dq7A==
X-Gm-Message-State: AO0yUKUk5tqtsqccyHpk9+x5ie1ZmPIHryCRtTqAG1ksOR8GCripo0MA
 RfA3F1JWpzXjiuihWShzT/hf0ZJwAH5TfFWV
X-Google-Smtp-Source: AK7set/m9PWJBHjtISQKkQyMketWotvRXhPx0147C2xYJnpaSK/o/nbw0MNbdLbU3HgMX2oRjeD/Vg==
X-Received: by 2002:a17:903:27c3:b0:19c:a3be:d9f5 with SMTP id
 km3-20020a17090327c300b0019ca3bed9f5mr2883722plb.48.1677081370206; 
 Wed, 22 Feb 2023 07:56:10 -0800 (PST)
Received: from localhost ([50.221.140.188]) by smtp.gmail.com with ESMTPSA id
 g12-20020a170902fe0c00b0019bd934434esm10274987plj.53.2023.02.22.07.56.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Feb 2023 07:56:09 -0800 (PST)
Subject: [PATCH] gitlab-ci.yml: edk2: Move to Ubuntu 22.04
Date: Wed, 22 Feb 2023 07:53:41 -0800
Message-Id: <20230222155341.10127-1-palmer@rivosinc.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: qemu-devel@nongnu.org, Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: f4bug@amsat.org
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=palmer@rivosinc.com; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The OpenSBI docker images have started tripping up on Ubuntu 18.04,
which is about to hit EOL.  So let's just move to 22.04 for EDK2 as
well.

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
Just like the other one I don't know how to test this and I'm not at all
familiar with the CI so it might just be broken.
---
 .gitlab-ci.d/edk2/Dockerfile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.gitlab-ci.d/edk2/Dockerfile b/.gitlab-ci.d/edk2/Dockerfile
index bbe50ff832..053891d810 100644
--- a/.gitlab-ci.d/edk2/Dockerfile
+++ b/.gitlab-ci.d/edk2/Dockerfile
@@ -1,7 +1,7 @@
 #
 # Docker image to cross-compile EDK2 firmware binaries
 #
-FROM ubuntu:18.04
+FROM ubuntu:22.04
 
 MAINTAINER Philippe Mathieu-Daudé <f4bug@amsat.org>
 
-- 
2.39.1


