Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 364E14992C6
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 21:28:21 +0100 (CET)
Received: from localhost ([::1]:38150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nC5wq-00041C-8o
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 15:28:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nC5lH-0006aO-Ah
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 15:16:26 -0500
Received: from [2a00:1450:4864:20::635] (port=40601
 helo=mail-ej1-x635.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nC5lF-0003E1-5I
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 15:16:22 -0500
Received: by mail-ej1-x635.google.com with SMTP id p15so24641362ejc.7
 for <qemu-devel@nongnu.org>; Mon, 24 Jan 2022 12:16:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=K7aKO1RVrESioDmXfc/uQzaqAxN2cIWA1gbroKbEYuQ=;
 b=Z5Bet9DqysPKxyhgeUq9KXdNuFd2UCg282eMOy6Nqw7hqXNCEfkk/BNC8QGyr6HH9b
 Lh8HQTr5KNXlVzBRInKI5GygIml+ZQn98SQS8fSwI3GAUAXZonkEwWEqP8xTI9wKYSD5
 4pRYvT0aVoqFrGrB7LYB+PwVRX//IFYvu1hV2ulSsrcdKLyKkPG5yKdP27z6pyDQgJG8
 HJshybk7WUmH4aUqP/P2kBMUQ7b3xshLHd9YLhSb07LdW/Z/NJXCBvHVRuREHvVAZaYn
 1tzBrbUyqrLQ4MlxhsRUapfX+DRzNnrCKLlb5rErT3vfs0L0ntYpyjZ0vjWnvwakNhHc
 16KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=K7aKO1RVrESioDmXfc/uQzaqAxN2cIWA1gbroKbEYuQ=;
 b=Md3jmz2SdKngHTyifHEY3ErV7YtIhcjBr7LGBFH7hD1l7meT87s4QYFeELhWvFxOnc
 gHRo8BUGw9oef5Nxuh6oX65GNwJiryIGJEatjjDe6mZyUfQT+AabTI1mAthMsyGYKZlr
 jUVDC82g6JlrMsB0zvsBq7xbuNEOFuaHcBuavD7ZOcrFViq70YuRideRQJAa0d78CBNv
 n0Q0P8SX9z84/P7mWlwhXGAgPPG+WPiFU089QmcG0LfUYk5qvFfHxrTUZcL6fCUyqOH2
 6qe8fdds6bn0J1aqQOFwtQoZcji40UdH+/M9IObBhmbp9Koub6WUCk5Wb739F2sU+qP6
 qpVA==
X-Gm-Message-State: AOAM533RT80jIQZQ0/wErYjSBfkZWkmEQW6FVkQ6zCqw1pbCjCiK0E6s
 9+Y/6WZXv0cAGucJIP2X2iFgzA==
X-Google-Smtp-Source: ABdhPJzPLiA9Dnx9kGzaCY4sX+NQua31G9wTMTXTkrrxTrGrVF4BPYPADeGr0jbE9H+xJSgaUyEggg==
X-Received: by 2002:a17:907:72d2:: with SMTP id
 du18mr5821491ejc.524.1643055379049; 
 Mon, 24 Jan 2022 12:16:19 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r15sm5242379ejz.72.2022.01.24.12.16.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 12:16:14 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D11301FFBD;
 Mon, 24 Jan 2022 20:16:08 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 05/22] MAINTAINERS: Cover lcitool submodule with build test
 / automation
Date: Mon, 24 Jan 2022 20:15:51 +0000
Message-Id: <20220124201608.604599-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220124201608.604599-1-alex.bennee@linaro.org>
References: <20220124201608.604599-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::635
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x635.google.com
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 aaron@os.amperecomputing.com, robhenry@microsoft.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 mahmoudabdalghany@outlook.com, minyihh@uci.edu, cota@braap.org,
 Luke.Craig@ll.mit.edu, kuhn.chenqun@huawei.com, ma.mandourr@gmail.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

lcitool is used by build test / automation, we want maintainers
to get notified if the submodule is updated.

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220121154134.315047-2-f4bug@amsat.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e4b3a4bcdf..6d5539d46f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3579,6 +3579,7 @@ F: .travis.yml
 F: scripts/ci/
 F: tests/docker/
 F: tests/vm/
+F: tests/lcitool/
 F: scripts/archive-source.sh
 W: https://gitlab.com/qemu-project/qemu/pipelines
 W: https://travis-ci.org/qemu/qemu
-- 
2.30.2


