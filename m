Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B76303646A8
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 17:03:21 +0200 (CEST)
Received: from localhost ([::1]:42006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYVQm-0003SM-Kg
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 11:03:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lYVIj-0003kV-OA
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 10:55:01 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:34751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lYVIi-00074n-0I
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 10:55:01 -0400
Received: by mail-wr1-x436.google.com with SMTP id r7so22360371wrm.1
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 07:54:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AJ9m89LqMP6JqoZX9kb8/L/8kKBGmEH5iou5hRLkrKc=;
 b=rAGg1mbh51sNbTgVfi6Jlr15k/Kac9xyLwf6BdZJ2PjattS9BwXMNfKfsEqMe0BIeb
 rzwfxmlxfqnzffCsI1th7ATgyWn2IjSeWmKa2emz+rnxc0devOOFeVakVDYvPdTU1bSU
 saYLpxCtryCNKnG/yRJj9uGBOHm+U5dpMqhPrgllY6H2fn76dptBQPcYzwQB6Wc4scTH
 eSlginKbSzCyEDy0WXeyp333d3fI//NCdrceWCnmJotSRl4SOkISnI2kaLuC72guerIW
 E6bC5zybROpQP72ocNX1VDD8ZLoV3HeEi41mMXMTHtb7WRTWaTVNCxMqZWWFPxy57c27
 PUpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AJ9m89LqMP6JqoZX9kb8/L/8kKBGmEH5iou5hRLkrKc=;
 b=ggVStm4nHRRjvCCHO1Km5J3QGErWuThAA824MdoLcXnsyF8MkPNAfbaxPehwJADNgA
 f5TmsdFDFBn0JOmvEBovPqRsMRBrkXfT4BUBOI9n9Afv9zEd0/ZRaA8xyMf5o0AtHPWr
 rwI7JfENqDeys2yd4wJFpyDlwB4SX4Mp0leikoE+hwt1oYqlBbf3O8Ige7glpCProbE8
 6UYKrrWmkI0TrR3oXUrTBWvvPdf1NxhgsWa99ZEavHCEwdJ50eaKHOIfwgwtiFEfiI4k
 fEn4HYAOMv/xYpHDp/AxM/rJ2KKJDCLk5VVDD16UPAVu3D3XQFbVtAlOvWILMwDoMbbW
 C8HA==
X-Gm-Message-State: AOAM532/gGG7z8/kKpkDbv4EveM95tMiLiq9s926fmPkHgL9FDRar6yU
 1fTBcuMPO7OFJAyxyEA0urO74Q==
X-Google-Smtp-Source: ABdhPJzdCI6sdAadj29X663VhGXgNJbXK7E6DJvYG5Oto+MajwbfE48yxPmxrKIYtZ6bj6YZOjCV7g==
X-Received: by 2002:adf:e985:: with SMTP id h5mr14931026wrm.155.1618844098692; 
 Mon, 19 Apr 2021 07:54:58 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id a8sm25648612wrh.91.2021.04.19.07.54.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 07:54:55 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 11F8E1FF9E;
 Mon, 19 Apr 2021 15:54:37 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 15/25] configure: Emit HOST_CC to config-host.mak
Date: Mon, 19 Apr 2021 15:54:25 +0100
Message-Id: <20210419145435.14083-16-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210419145435.14083-1-alex.bennee@linaro.org>
References: <20210419145435.14083-1-alex.bennee@linaro.org>
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
Cc: fam@euphon.net, berrange@redhat.com,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, f4bug@amsat.org,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>

this is needed by the tricore-tcg-tests as tricore-gcc is not easily
available. Thus we rely on the HOST_CC to do the preprocessing of the
tricore assembly files.

Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210305170045.869437-6-kbastian@mail.uni-paderborn.de>
---
 configure | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configure b/configure
index 4f374b4889..bb86c72479 100755
--- a/configure
+++ b/configure
@@ -6139,6 +6139,7 @@ echo "GENISOIMAGE=$genisoimage" >> $config_host_mak
 echo "MESON=$meson" >> $config_host_mak
 echo "NINJA=$ninja" >> $config_host_mak
 echo "CC=$cc" >> $config_host_mak
+echo "HOST_CC=$host_cc" >> $config_host_mak
 if $iasl -h > /dev/null 2>&1; then
   echo "CONFIG_IASL=$iasl" >> $config_host_mak
 fi
-- 
2.20.1


