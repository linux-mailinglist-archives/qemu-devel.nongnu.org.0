Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC916E6515
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Oct 2019 20:25:36 +0100 (CET)
Received: from localhost ([::1]:46770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iOoAR-0007xy-4b
	for lists+qemu-devel@lfdr.de; Sun, 27 Oct 2019 15:25:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40001)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1iOo7V-00053a-PE
 for qemu-devel@nongnu.org; Sun, 27 Oct 2019 15:22:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1iOo7T-00074j-Id
 for qemu-devel@nongnu.org; Sun, 27 Oct 2019 15:22:33 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:35984)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1iOo7S-00074E-5f
 for qemu-devel@nongnu.org; Sun, 27 Oct 2019 15:22:30 -0400
Received: by mail-wm1-x32a.google.com with SMTP id c22so6961332wmd.1
 for <qemu-devel@nongnu.org>; Sun, 27 Oct 2019 12:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=H0U/vSKQNSzVKs5+gXvk1/r2i8YP7vWsP8A9OnycACc=;
 b=IG/4j3ypTzmUi/eteNuU/7n44ERa2IJa1l6o6ZAlwUPKh7GCHv502d/E80nBBWl1K8
 xjAEdjG3fh8FZV454IMBflUL9Xqi9/vFMXAuMg5nqgBJJT4FaToEV7C9zQJYiNxAVm7P
 M+RBPcUsr7++gWVmVplTE4ebBmHLWN1zDeOgdnJgQPvV2TFTfRFwEwBoHe3tBwrRcwo1
 FyOWbAdpx6MmmYXdKO3nPFyfQwrmDukL+wo6B9oBCy3RYhj+G64GSOKUogVvD6ZBCNhZ
 haDYQKnpU+N497YaOqcls6bVhdV7VLGTE9JOQjObWxkFtSIX02remQ1YwJZMkH1tqKcS
 8aCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=H0U/vSKQNSzVKs5+gXvk1/r2i8YP7vWsP8A9OnycACc=;
 b=IfmC0shBcUhMN+ormGjiCHtI0b0OekxLwogA0dUvuU4/m3QTtwhwRYLrbcf/atiYAB
 vheYT6dq8nbgO43tjYbEuThILjtBZ2/EEqV5hTdUcxfcKD5BsqWKzdEmsuh8ccTkMbjN
 2PPg/jyOVUL+zjAq2y3F7aGo80xrH++gb2SEzWuMt7U9JVYQaopPxVe34pztKumsWhtz
 terNndh5AGtdfKniSnIp1P6DpxBE0tUcZoFsZHVhn0zjd5MqKKxK92fkKyLyurwWCmxA
 lyZfTK28pCReC3MxlE76lltO0q4opVbE7+bUOA3cni1vM3d+UCQC7GCqacrNAEs784LQ
 E3/g==
X-Gm-Message-State: APjAAAUWalbr5cpxiopwtkw/5XCYMemmSeHrIMlrxCUaFLpiJaYSUJte
 mqS+++0QHyN6h9Hc0g/YY/D96g==
X-Google-Smtp-Source: APXvYqypgvd8hYwN2R1IWot9ILQLbD6EKF38cR6xRs2rrIkBoCMdP1lvbJ0ebBicUMRMjL0W/Y9KVQ==
X-Received: by 2002:a1c:f305:: with SMTP id q5mr12489495wmq.137.1572204145553; 
 Sun, 27 Oct 2019 12:22:25 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id f8sm8432161wmb.37.2019.10.27.12.22.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Oct 2019 12:22:24 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B4FFB1FF8F;
 Sun, 27 Oct 2019 19:22:23 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 2/3] contrib/gitdm: add Andrey to the individual group
Date: Sun, 27 Oct 2019 19:22:22 +0000
Message-Id: <20191027192223.10855-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191027192223.10855-1-alex.bennee@linaro.org>
References: <20191027192223.10855-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::32a
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
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Acked-by: Andrey Smirnov <andrew.smirnov@gmail.com>

diff --git a/contrib/gitdm/group-map-individuals b/contrib/gitdm/group-map-individuals
index bcb50e325cc..cf8a2ce3671 100644
--- a/contrib/gitdm/group-map-individuals
+++ b/contrib/gitdm/group-map-individuals
@@ -15,3 +15,4 @@ samuel.thibault@ens-lyon.org
 aurelien@aurel32.net
 balaton@eik.bme.hu
 e.emanuelegiuseppe@gmail.com
+andrew.smirnov@gmail.com
-- 
2.20.1


