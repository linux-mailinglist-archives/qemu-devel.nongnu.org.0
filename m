Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F29303D67F3
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 22:12:43 +0200 (CEST)
Received: from localhost ([::1]:42432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m86xv-0003U1-2i
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 16:12:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m86wV-0002eq-Di
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 16:11:15 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:44881)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m86wT-00007b-Rn
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 16:11:15 -0400
Received: by mail-pl1-x630.google.com with SMTP id c11so12987452plg.11
 for <qemu-devel@nongnu.org>; Mon, 26 Jul 2021 13:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UkG0kakO/+JwZW0U6IApa2uq/LS8lVTW4uTiPKl0TQU=;
 b=UOexswVzraIC54zyOeyiOCdywI3357FpjaeO6cP1lZ2kBIn/c/sIgPQZtyuMz7wXEX
 v+67e6qPGOvHR+ZmzD1IMPQYa5Hpxt2ShCTbA0SsgcDG0KFVL/xWcg02PsqINI+7CuLZ
 2yY7+mUtZ+wCuz5liDmmE/pS60ZKIix8BBM7EoUQw+mnsSeduDGlLB/gcjvjmJ+vsL8l
 Qo6PsavUi+dQ6vf2+5DJNASY5XI1a4To2weOyqjPoKCCSdUKl31G9zGI0OcEUSpzA32w
 AyVrLrusG15uG/8FYzhhjlveA3RibjYel/yfRjD+rV7QmtMPkL6rmiC34eHD8PZ4X2Dz
 Saeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UkG0kakO/+JwZW0U6IApa2uq/LS8lVTW4uTiPKl0TQU=;
 b=EBhpvq+yppPlo2mCxwApv6mYtD37wpkdnjhUNCKkpdsqFPqiEd0AZRylLu90h8sKUy
 EZE+1NnVTrni+3vtG1kXwH07BEWKtJ2eYUD83f/aHEY5N/vuyX15B+lmLsfJW4r76I0i
 lktofb8dNqfjZPJeaDyVl2NZIMKqaLInvDV2NCaK5GQCtp/CiEMn9cbeQL7rwVEtAnCY
 NHwNtJPWUveCynfY7gBl9fxkDTPEEoSpPDWR3k5LHGNBDfovJc2UttFs7j/bp3IgQ09J
 Dmfvv4ND/OmvcdIRA9DniA3e0iVfgGtn50puOIzZUdouUwWTDFM76dhyO8Duh4lSWyRj
 X5ig==
X-Gm-Message-State: AOAM531BErEpG3tXnScz+qM4Hwc8CUOWLLgv5e3t52xD+YTVmu5Rf88K
 XcHFW7VLRreJIJqWyd2qkvivHis7QVahFA==
X-Google-Smtp-Source: ABdhPJxozbXiO5aNfZQOnB7apEmK2ha2TE42y4OdODsx7evSud84mMQ1JLhfZWn95/vhdmRl5im9vw==
X-Received: by 2002:a17:90b:3b47:: with SMTP id
 ot7mr628936pjb.149.1627330271919; 
 Mon, 26 Jul 2021 13:11:11 -0700 (PDT)
Received: from cloudburst.home
 (2603-800c-3202-ffa7-497b-6ae4-953c-7ad1.res6.spectrum.com.
 [2603:800c:3202:ffa7:497b:6ae4:953c:7ad1])
 by smtp.gmail.com with ESMTPSA id 10sm533272pjc.41.2021.07.26.13.11.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 13:11:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] fixup! target/arm: Add sve-default-vector-length cpu property
Date: Mon, 26 Jul 2021 10:11:09 -1000
Message-Id: <20210726201109.1875632-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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
Cc: peter.maydell@linaro.org, drjones@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

---
 docs/system/arm/cpu-features.rst | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/docs/system/arm/cpu-features.rst b/docs/system/arm/cpu-features.rst
index 79b87f7c5f..67847a5cc1 100644
--- a/docs/system/arm/cpu-features.rst
+++ b/docs/system/arm/cpu-features.rst
@@ -385,5 +385,6 @@ defined to mirror the Linux kernel parameter file
 is in units of bytes and must be between 16 and 8192.  
 If not specified, the default vector length is 64.
 
-If the default length is larger than the maximum vector length enabled
-with ``sve<N>`` properties, the actual vector length will be reduced.
+If the default length is larger than the maximum vector length enabled,
+the actual vector length will be reduced.  Note that the maximum vector
+length supported by QEMU is 256.
-- 
2.25.1


