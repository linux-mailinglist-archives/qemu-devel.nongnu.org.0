Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31F603C2622
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 16:41:47 +0200 (CEST)
Received: from localhost ([::1]:38536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1rhK-0004uC-2E
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 10:41:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m1rWa-0004zr-GK
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 10:30:40 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:44780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m1rWO-0005aR-Hr
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 10:30:38 -0400
Received: by mail-wr1-x436.google.com with SMTP id f9so6747826wrq.11
 for <qemu-devel@nongnu.org>; Fri, 09 Jul 2021 07:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7hYG9gx99ZdrMKH78PnqlgUjRUSFo9m2QUAYrIofBos=;
 b=O4n7Kawz7UFei5kbP3yCwe84zFkQSLEtEtIh26keQ3+6Cc4mbLr++wIoFi2Q08BQyr
 ZEgiHHKVhTX5TOMCYIXs/MgKUwREaekVn3ExrD/4+pm0Fup6u/KxO5tdBHZQ7CJbwI6b
 v+IrNV3XrCf+Py27nuU1ExRgKjCJ1XCOCpyyEpQmO5HyrVko9EWR2gbdxFPXkunBOcLb
 QmwceyID5shxQGrulVuvVxH6EgSDu6uk1/eD+n/eZJKaIDLxYi6lyEShgsRq6FoEXXzI
 wx/hOYQ4ysK/hk7RRDYUNvjocRg3A2RjKDbEsqk+XPdIgCCUP4Fd3HnI0rqYPi7J3nXx
 POsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7hYG9gx99ZdrMKH78PnqlgUjRUSFo9m2QUAYrIofBos=;
 b=iLto9zbFPRPT4e7tZ5oYigSIcqskWwjUa3IZ2jrpdrhb2h/zDwLm5JEIlnnORFEg5G
 xaVWDZWx54WGGchbLDtGJ8dOI4owWk4WaKkfal846DagA4J7erjgyfmSZHWDSaIZQDYB
 fQTrkBgfzFnKXd8JLqEdnfpfvNLkmFEy4r0Y41Aia35xfALjKISlYh9UVle8dpvCgoqB
 JCPnuXXqHq0BE4h1RpBcmHQbhHZ9CAJnCzwZVVRa9sCiyRpQle2w7UrNByH1UCUz18Pe
 MBs0mMvzpMhDu87INcaJBJCacymqyjYlb2fsKJ+boykxqKe17VkFsKdT/UiFzCBN0bgc
 g0cw==
X-Gm-Message-State: AOAM533ReQ3BpvYSndjFELx3+8bn7oI0zeIEiLTyfwENnmOtCnbiKlTY
 2BaE/c7tE1Ugt3mz6yTc4z7eGg==
X-Google-Smtp-Source: ABdhPJys1QfWeY92omwglEoMuh9wBPtX55e0tOAvevyk1S4eG7LDC25mydSw6TaNFHr29bZvTHTOMw==
X-Received: by 2002:adf:dc82:: with SMTP id r2mr17206567wrj.33.1625841025902; 
 Fri, 09 Jul 2021 07:30:25 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id t22sm5231739wmi.22.2021.07.09.07.30.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jul 2021 07:30:23 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D08C91FF9D;
 Fri,  9 Jul 2021 15:30:09 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v3 16/40] tests/docker: fix mistakes in fedora package list
Date: Fri,  9 Jul 2021 15:29:41 +0100
Message-Id: <20210709143005.1554-17-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210709143005.1554-1-alex.bennee@linaro.org>
References: <20210709143005.1554-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, minyihh@uci.edu,
 berrange@redhat.com, kuhn.chenqun@huawei.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, f4bug@amsat.org,
 robhenry@microsoft.com, Willian Rampazzo <willianr@redhat.com>,
 mahmoudabdalghany@outlook.com, aaron@os.amperecomputing.com, cota@braap.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com, ma.mandourr@gmail.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel P. Berrangé <berrange@redhat.com>

libblockdev-mpath-devel is not used by QEMU, rather it wants
device-mapper-multipath-devel.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210623142245.307776-9-berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/docker/dockerfiles/fedora.docker | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tests/docker/dockerfiles/fedora.docker b/tests/docker/dockerfiles/fedora.docker
index 4a0a84eb43..f667f03cc5 100644
--- a/tests/docker/dockerfiles/fedora.docker
+++ b/tests/docker/dockerfiles/fedora.docker
@@ -28,7 +28,6 @@ ENV PACKAGES \
     libaio-devel \
     libasan \
     libattr-devel \
-    libblockdev-mpath-devel \
     libcacard-devel \
     libcap-ng-devel \
     libcurl-devel \
-- 
2.20.1


