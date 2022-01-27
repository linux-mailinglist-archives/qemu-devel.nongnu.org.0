Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A3449E638
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 16:38:27 +0100 (CET)
Received: from localhost ([::1]:57794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD6qq-0002fG-SJ
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 10:38:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nD6Hp-0001fJ-90
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 10:02:10 -0500
Received: from [2a00:1450:4864:20::430] (port=34419
 helo=mail-wr1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nD6Hn-00012o-Fp
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 10:02:08 -0500
Received: by mail-wr1-x430.google.com with SMTP id f17so5375517wrx.1
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 07:02:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=m4fh0R6FgFoRTj+GRlE9TXzpItN1qxhCKNYW/hllSfE=;
 b=n6PsAUniqqUr1B/AlqLoyQWcSVSzk+f0MqcfupBdjCNHK+NBIJ8KBOU19rp6oeH8Xw
 RVsP8XHVY9O4oLEp0pd9dloJ2KixFG1mgyBKqUphZRw99Dyme7ia23oQbS0a11iep3Jl
 pkJofeQ3eLJwL/ubJr2+aWvs+MsR0p2Si/61XCoPqx4odPgQN1ahtrk9FOZgqaPNLQoq
 /LAfmOHjrzgvXegnCAN9F5TSIbkPDU/QAFl+6AxC/D/6JYuI21kesU+Mzuv3RetwfRJv
 dKDBZpy0hbuBKsZNh+OoppW4+6Yk1vvFGvzvpr7ua7jWpOn7uDBfidL31i18mKSPwn50
 oTGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=m4fh0R6FgFoRTj+GRlE9TXzpItN1qxhCKNYW/hllSfE=;
 b=0439Ic5TRvGwagefYrdNfegmeW908nxaFOs6vjxMQaHXBsnWWpzoE15DTARqKslH3V
 qjHHoKv5lxL//7JD74pXA17sLC9HqqGdog0jbfhFkvSf3vGAo8xEPQwBXZkyEW5E3aP2
 BLVqUCBGFvg5rvRLD05b1jPv9c7EUQZYCfsyvNxFJpWntF9EP3a9ZLWn4znXRAXL0k3M
 l/Cl1n3HKbRfPjClozCCsdttSF5e8CYrCRbDCtmpUEzD3D4P59q48/yNo5opy8uuzfjr
 lBJurSWkWAoJHez8C7ysu7AAHLFHfUc6qEH12poHh+RvKOri41uhdt9oQ+zaOhaSxyJ6
 XK/w==
X-Gm-Message-State: AOAM5319q2EY8ZtWKNMfcjqlSf+TmfU8uec8wmAQuzOUpidfxEROxOZy
 LN0DudcKi5EbvxSg5xaDSXRjtw==
X-Google-Smtp-Source: ABdhPJzebZu/9zwWG4DYS432eJzMM4t96TLfFCXdwkrWy6p7vmzDHZmZbt3gVJRmChvrlqT3AE0yxw==
X-Received: by 2002:a5d:64c3:: with SMTP id f3mr3277342wri.459.1643295725500; 
 Thu, 27 Jan 2022 07:02:05 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r7sm6477006wma.39.2022.01.27.07.02.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 07:02:04 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5F8ED1FFB7;
 Thu, 27 Jan 2022 15:02:03 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH] docs/devel: mention our .editorconfig
Date: Thu, 27 Jan 2022 15:01:59 +0000
Message-Id: <20220127150159.1489286-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::430
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ideally we should keep all our automatic formatting gubins in here.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 docs/devel/style.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/docs/devel/style.rst b/docs/devel/style.rst
index 793a8d4280..9e66d133e1 100644
--- a/docs/devel/style.rst
+++ b/docs/devel/style.rst
@@ -12,6 +12,10 @@ patches before submitting.
 Formatting and style
 ********************
 
+The repository includes a ``.editorconfig`` file which can help with
+getting the right settings for your preferred $EDITOR. See
+`<https://editorconfig.org/>`_ for details.
+
 Whitespace
 ==========
 
-- 
2.30.2


