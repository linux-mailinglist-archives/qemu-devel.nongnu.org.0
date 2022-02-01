Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ADE84A6662
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 21:53:09 +0100 (CET)
Received: from localhost ([::1]:53256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nF09E-00011O-1t
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 15:53:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nExnX-0008Co-2f
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 13:22:36 -0500
Received: from [2a00:1450:4864:20::52a] (port=42741
 helo=mail-ed1-x52a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nExmZ-0000d3-Uk
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 13:21:41 -0500
Received: by mail-ed1-x52a.google.com with SMTP id p12so36197010edq.9
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 10:21:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=M6RNPmxjiFjo3NTc8G7waDVI2z0/bumKvAkX8vG0+kk=;
 b=oqxylzY2aPYDadhZmeTh7Z9ojeDPmg9xI/QfoDhs6+rHUHQh+of4kxzQGdoLcTIvN0
 ofNi8sHlHXCPGHmGywuCGlseQ7ACq+j2ZErz+hSsrUtjqZEWuIAXjiS2Wum20ZeQjbzA
 NtYFbKu5uDmj1utip9YnIxDDw7gejaYYF3m/X9cM7580z9vVNY96ffCgDbeB8Ctrvt9c
 Zy982QqHM99dyxCYSnuySSZTVX9j1tgqxzShHYdOXGM0v1lOoOyWUNnxPy1vfL+DWTyh
 nbifsBP9t7mooXg85fbxrrh66dvkwyWgjvbxjU7ndFFdexNu/hgv644sXA+gpQoCsE9h
 OvqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=M6RNPmxjiFjo3NTc8G7waDVI2z0/bumKvAkX8vG0+kk=;
 b=zNR7O3HAXYXTOMHFKoBWAQ8A5Ldtex04Nx9nubMQAx1olUFwydDcTVXmgPhTTGvokB
 +/hkwPp/fOYj4KKivhvg8rqlgcz9zRyo/mTm/hEaDDiVov1KuMbhe1jLr3UjeTrSg92a
 +ImflX22/mqEbgbqBdDZhzeVmeqsz8HITmsqkBPBiLDHDcATPnn2Ezz9lH9pHjGB5tlk
 CWBiqrfMl1jiVoOfr3+M3oH9rf3Lz7Y1IqxBv58XXYU2pNv06CgLZudcGBm4oJRC1FT6
 PJVVOpKgXmER26EKpCrdPRKNYZ3mTzTlcrxq+xlPVojsRxiKUS5vmnuiLjI6d3jZzkpB
 YYZQ==
X-Gm-Message-State: AOAM532OIyLOwyp0ZwzZNzgypk0QsFFxvqOgG5kfMVwuaUgHyVsflxYG
 F9F/+v0Hod9l1zEXI6hnrASXCw==
X-Google-Smtp-Source: ABdhPJxt1qirJTcIs+uy3XCIBspEXDvPOWNQiAIFcZOrpsDBpsEmfJwhVISQKY9WzDjbwYEESFK9Eg==
X-Received: by 2002:aa7:c30e:: with SMTP id l14mr5165098edq.452.1643739665135; 
 Tue, 01 Feb 2022 10:21:05 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id bl12sm14818947ejb.75.2022.02.01.10.20.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 10:20:57 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E2F3A1FFC4;
 Tue,  1 Feb 2022 18:20:51 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 12/25] docs/devel: mention our .editorconfig
Date: Tue,  1 Feb 2022 18:20:37 +0000
Message-Id: <20220201182050.15087-13-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220201182050.15087-1-alex.bennee@linaro.org>
References: <20220201182050.15087-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: fam@euphon.net, berrange@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>, aaron@os.amperecomputing.com,
 robhenry@microsoft.com, f4bug@amsat.org, mahmoudabdalghany@outlook.com,
 minyihh@uci.edu, cota@braap.org, Luke.Craig@ll.mit.edu, pbonzini@redhat.com,
 kuhn.chenqun@huawei.com, ma.mandourr@gmail.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ideally we should keep all our automatic formatting gubins in here.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220127150159.1489286-1-alex.bennee@linaro.org>
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


