Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E634E0C97
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Oct 2019 21:30:19 +0200 (CEST)
Received: from localhost ([::1]:42316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iMzrG-0000Br-AP
	for lists+qemu-devel@lfdr.de; Tue, 22 Oct 2019 15:30:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37476)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1iMznT-0004uB-EZ
 for qemu-devel@nongnu.org; Tue, 22 Oct 2019 15:26:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1iMznS-00025W-HA
 for qemu-devel@nongnu.org; Tue, 22 Oct 2019 15:26:23 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:40667)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1iMznR-000246-IS
 for qemu-devel@nongnu.org; Tue, 22 Oct 2019 15:26:22 -0400
Received: by mail-wr1-x444.google.com with SMTP id o28so19342078wro.7
 for <qemu-devel@nongnu.org>; Tue, 22 Oct 2019 12:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TE2/ZCAXM0Ir/veH6eAjWvYmsY95+T3NphBUd07C2xo=;
 b=ZlfQOeQ+aKBOuEfrd09X17sAVYVE0UAABOtp8Em0wXsrbbT7SD3rOVL6GtLFT5t7zP
 lL+TGpwNbBOaiTzwL//5MznxREiBQVLM2WLnk/xEtFL34vycx1XDC+YgYTllsnWNDfDL
 vav/rqYhajx0fzqVRu5llYfu8piIvD9gJMoWmIcx2/SN+y+s78inUvFTX7Wd1bAQOETu
 1J14b6DwT6cCz+e00ROh++NcKoP2V8uGlaN3NetSKVXNOZJ2JB8xVLW3c6hizCcAspey
 qOZztXbFCshq6wT//zcqhTZuiuRTjyaVaxEPyZvmFn/0zv2X08E3qiAPaMdsGgzH5bCN
 OrUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TE2/ZCAXM0Ir/veH6eAjWvYmsY95+T3NphBUd07C2xo=;
 b=BF4EF6abkPUGcXma9LFE88iR9obHH0x9fLmJnQT9qYT7ChvhnEx1LeR+pg5wzyrYCS
 lNNJAUjb/sRBw5IDvisMGqlp3r+ronKAFRQarUhQ+6MnDLYt+28tv/T1y8WUYciQhJqx
 CVpWidvjIixzqg6u9VhnUyBpaOqzgpPmW/WhR3cWo+WGlIMXKINVXzqMaGk5Lp09x+ep
 pFDnw3ubRNoi9nIB3ydQx5PBY6vBgHyS91AOUrPJqi2O1oJuVeAo+IQj6Ov+pDbcidbz
 E35CHLNC1hSHXuVSZpUkPfyBkAe76ofex74cfdeOb5WrV133RuzPa/0lb1EanQzmblJ4
 MLWQ==
X-Gm-Message-State: APjAAAVesFo0Q84n4Iw2sIDgAyROkbb5HToW/OGEZA5uKZeH6A7CPVWK
 vOnftKkaavw/hv15GydKPo4Ckg==
X-Google-Smtp-Source: APXvYqxE2kKdxkp63yUxscnjKpjUF4yuTGgvzMX8jfEJYU3u0z2BVEZxsDncjNfCTUbTpmg0bsMnSQ==
X-Received: by 2002:adf:a547:: with SMTP id j7mr4813821wrb.154.1571772380189; 
 Tue, 22 Oct 2019 12:26:20 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 6sm3345951wmd.36.2019.10.22.12.26.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Oct 2019 12:26:19 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 99A651FF9F;
 Tue, 22 Oct 2019 20:17:05 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 15/19] iotests: Test 041 only works on certain systems
Date: Tue, 22 Oct 2019 20:17:00 +0100
Message-Id: <20191022191704.6134-16-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191022191704.6134-1-alex.bennee@linaro.org>
References: <20191022191704.6134-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::444
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
Cc: fam@euphon.net, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 stefanb@linux.vnet.ibm.com, richard.henderson@linaro.org, f4bug@amsat.org,
 Max Reitz <mreitz@redhat.com>, cota@braap.org, stefanha@redhat.com,
 marcandre.lureau@redhat.com, pbonzini@redhat.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

041 works fine on Linux, FreeBSD, NetBSD and OpenBSD, but fails on macOS.
Let's mark it as only supported on the systems where we know that it is
working fine.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20191022072135.11188-3-thuth@redhat.com>
---
 tests/qemu-iotests/041 | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/041 b/tests/qemu-iotests/041
index 8568426311e..0326888c980 100755
--- a/tests/qemu-iotests/041
+++ b/tests/qemu-iotests/041
@@ -1123,4 +1123,5 @@ class TestOrphanedSource(iotests.QMPTestCase):
 
 if __name__ == '__main__':
     iotests.main(supported_fmts=['qcow2', 'qed'],
-                 supported_protocols=['file'])
+                 supported_protocols=['file'],
+                 supported_platforms=['linux', 'freebsd', 'netbsd', 'openbsd'])
-- 
2.20.1


