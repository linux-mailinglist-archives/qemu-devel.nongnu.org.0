Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A953C81D6
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 11:39:28 +0200 (CEST)
Received: from localhost ([::1]:51042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3bMV-0004vJ-3Y
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 05:39:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3bK2-00020H-Ml
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 05:36:54 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:44886)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3bK1-0004Kh-87
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 05:36:54 -0400
Received: by mail-wr1-x429.google.com with SMTP id f9so2354182wrq.11
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 02:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uHeHl3pMrRvL9Wr2ptGPC5oRo8vbMCPQj9p2Od1ROSQ=;
 b=eTr7XmaVtou0Yp9fFXqZt00qHTouoEJgFyYT00FJfyM/wqb0p7XQ2BCkgpjW2INoWS
 Peq0Iy+Xo57ZJklCDTXsP0+b9QVa6cawpv91qRGOfPqIb221dfyEtA09bXnhcC7kXuZL
 fClCzBhZD5zSWkJMJxJMbxee5+Qziuy1+3udAgmuF6aTGP/tDPXmJSYIB1Ka8AFdtCFV
 oTJWXiopG7SMEeA3DTv9qHcJrIN4h5JK0kiWh2voH0XSqqFr3/lHUmvs7SPLbqk6bCSY
 605vRGq7pwAv6qQpWsyt5ZdIzrtf4Nee3jWExednAK5kPa50SD8XbBgEkntdqHu/Gzzx
 QZWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uHeHl3pMrRvL9Wr2ptGPC5oRo8vbMCPQj9p2Od1ROSQ=;
 b=CqekM9IwfkRRraAddlBctQ8x/CuXJ30fYYfg22K7d3YGtgpaIwnogfZLT/mYSzbR6N
 TkUGDUsUJgcdXX25ukeFRGdQojtlnd5d2UEwHAwVm2lQTNgtNlk5s8dj3iGVfAICezmk
 QvxKhNHJcQivIHGOtez06HpEyfz+u2Tg9Td9qMEG/OV9/gTbIjns7ocoIDdszqDy999T
 Iu5FUGJyMIV1Y866ZkZ3/CRCfbwVOm9F0M5uEW4ecNOzfmh8GY+JLW7Ir6cr6PFzrvxY
 7kJTJwhdV/TLudRd/hqXgkejuEpRndM0ra0FXA0lM7zk9BGuCnBJyBNZAEbV9gzIGP89
 s+ew==
X-Gm-Message-State: AOAM530kPQyfPCHiv8m91pfrrVBb+EeH/BihtOieZ/S18ypGUSHv2NJU
 Lyp0gn5eCE2OQPHYKChmzGmOag==
X-Google-Smtp-Source: ABdhPJx+3Tm/snDgHcSz8GNMHQT5npFsA5mzwT1Hd95qxN4vxn6x8IOEqkYIDs3WWdEZwGe9Sk8ZNA==
X-Received: by 2002:adf:f50e:: with SMTP id q14mr11604001wro.183.1626255411889; 
 Wed, 14 Jul 2021 02:36:51 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id z16sm2018564wrl.8.2021.07.14.02.36.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 02:36:45 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 730CD1FF92;
 Wed, 14 Jul 2021 10:36:39 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 06/21] .mailmap: fix up some broken commit authors
Date: Wed, 14 Jul 2021 10:36:23 +0100
Message-Id: <20210714093638.21077-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210714093638.21077-1-alex.bennee@linaro.org>
References: <20210714093638.21077-1-alex.bennee@linaro.org>
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
Cc: Nick Hudson <hnick@vmware.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Marek Dolata <mkdolata@us.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fixes: 49a6f3bffb ("target/arm: Correct the encoding of MDCCSR_EL0 and DBGDSCRint")
Fixes: 5a07192a04 ("target/i386: Fix handling of k_gs_base register in 32-bit mode in gdbstub")
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Nick Hudson <hnick@vmware.com>
Cc: Marek Dolata <mkdolata@us.ibm.com>
---
 .mailmap | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/.mailmap b/.mailmap
index a1bd659817..082ff893ab 100644
--- a/.mailmap
+++ b/.mailmap
@@ -27,6 +27,10 @@ Paul Brook <paul@codesourcery.com> pbrook <pbrook@c046a42c-6fe2-441c-8c8c-714662
 Thiemo Seufer <ths@networkno.de> ths <ths@c046a42c-6fe2-441c-8c8c-71466251a162>
 malc <av1474@comtv.ru> malc <malc@c046a42c-6fe2-441c-8c8c-71466251a162>
 
+# Corrupted Author fields
+Marek Dolata <mkdolata@us.ibm.com> mkdolata@us.ibm.com <mkdolata@us.ibm.com>
+Nick Hudson <hnick@vmware.com> hnick@vmware.com <hnick@vmware.com>
+
 # There is also a:
 #    (no author) <(no author)@c046a42c-6fe2-441c-8c8c-71466251a162>
 # for the cvs2svn initialization commit e63c3dc74bf.
-- 
2.20.1


