Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B06346691
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 18:43:10 +0100 (CET)
Received: from localhost ([::1]:53556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOl3c-0001Qx-Va
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 13:43:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lOkHM-0006oq-4x
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 12:53:16 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:42652)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lOkHK-0002oU-GB
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 12:53:15 -0400
Received: by mail-ej1-x634.google.com with SMTP id hq27so28247535ejc.9
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 09:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=38YJNB9Ogff3zSddosbf0AluinWmSMypRv1mu6k0zgc=;
 b=RkRWSUyP3q3F5SpgkEp+FIa7rvEBp2LiWwLw71O4pZvphuKdjB4msRrMn+nxy+zVdi
 XTpjqM0p1pqjSn90IlDT5u9G32LjRRPenmMpDAu+rqyBS0QcpZAUcm0muFODpInYSor9
 SKsjCjlh5op3YgAMg0NjKoWTPnQzMy6nhNNBteFR7Z+aRXE1dUk+rXOPATLs1SrzV4a3
 MXA06+TIIdxs8z3U3++o9jZ9GKCGHf9wYiTTUUlLPcgqwFk9eOP1zf3tfBgBOrwL5kqM
 u/eIm6rfcKI1ElHknigK0PRZ6dGzq5+ogYm87dCQuolRODKxu9LtQ7Pl4h9cwttIWIkA
 /wog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=38YJNB9Ogff3zSddosbf0AluinWmSMypRv1mu6k0zgc=;
 b=OrnW1/B1EdiwMcN9rjJTVFU3q8uY2dxPxcP87O/H/NyHqti5KLGqdRSg8XA5raE+t7
 8iaD/1OXvO5nxK6Pyf4Rts1SgvQ6wXU1hIsYIh2Xd3MDBNILm7b79ImB+q07YrLCpWKp
 /+tyG1tJAyvmENNFfjyn0ts0cGLaK5ta6VBcJY4aD7yOpLA1r16KbJCZL6uxSRXCwvJ8
 ymE1rIes7fGMJXOUFbJZlZ3BXurzdthW9hKwVwzhJUG1o4XhsnCKKGQbejeFqOOfIzel
 NVOF3KywRZjAK/tR4YFE/VJp8eOUBAPi8d/Fud3+T30zLkO8Wu8i+H3D/j5uXENENzUe
 Nefw==
X-Gm-Message-State: AOAM530YvxoRUCa8h6W2urPjzoWZebHawNVOvfAV3XBsKXK8IznHWWq0
 3Pe4Xt/Db4z77pKIs+L9O+JS2w==
X-Google-Smtp-Source: ABdhPJx/4PHuSOLP1+1u3dlXWwrgzqqTIqSl8uKQiHUiflkHg+RCX+11AytKMvlUHBTVzJgei+eKhw==
X-Received: by 2002:a17:907:3d01:: with SMTP id
 gm1mr5925546ejc.214.1616518392968; 
 Tue, 23 Mar 2021 09:53:12 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id v15sm13109264edw.28.2021.03.23.09.53.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 09:53:11 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id DE3CE1FF8C;
 Tue, 23 Mar 2021 16:53:08 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 02/22] docs/devel: include the plugin API information from
 the headers
Date: Tue, 23 Mar 2021 16:52:48 +0000
Message-Id: <20210323165308.15244-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210323165308.15244-1-alex.bennee@linaro.org>
References: <20210323165308.15244-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x634.google.com
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
Cc: Aaron Lindsay <aaron@os.amperecomputing.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We have kerneldoc tags for the headers so we might as well extract
them into our developer documentation whilst we are at it.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Aaron Lindsay <aaron@os.amperecomputing.com>
Message-Id: <20210312172821.31647-4-alex.bennee@linaro.org>
Message-Id: <20210320133706.21475-3-alex.bennee@linaro.org>
---
 docs/devel/tcg-plugins.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/docs/devel/tcg-plugins.rst b/docs/devel/tcg-plugins.rst
index 39ce86ed96..18c6581d85 100644
--- a/docs/devel/tcg-plugins.rst
+++ b/docs/devel/tcg-plugins.rst
@@ -63,6 +63,11 @@ valid during the lifetime of the callback so it is important that any
 information that is needed is extracted during the callback and saved
 by the plugin.
 
+API
+===
+
+.. kernel-doc:: include/qemu/qemu-plugin.h
+
 Usage
 =====
 
-- 
2.20.1


