Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B823C8231
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 11:57:00 +0200 (CEST)
Received: from localhost ([::1]:54766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3bdR-00035I-VO
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 05:56:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3bKl-0003KJ-7M
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 05:37:39 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:35595)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3bKj-0004nC-MG
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 05:37:38 -0400
Received: by mail-wr1-x42e.google.com with SMTP id m2so2414026wrq.2
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 02:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7VqwcD3D/wQtp19xfyzwBEQ4cRkVmHpHd0tvUKcvyuU=;
 b=z5wRyZ+4S/x095AucRtZK5DjOZSxzuw8Rk+UbBUP2U+Bnd+D8kYzhLYtzPY63DxNvW
 VnyZ6Y4V2zDyaMo4VYjhLMQtbL0ZwIzGklAHWOB0f0BG66nuR64e0xaAg16BNBmgzhfZ
 /jXVpibujygWbwVelASXF0R8TdQSlfB6cgPOvwtiaGgARtoUc7RdWekQKYOhTtttCK7J
 wQ6qF4xz18427Tz1k8qnJubBJQssDzCGPqbMU674THA7QXgnz0jB+0t0rjtcALb/up/A
 XX96Tcn9HDYumy+ro+OD0UggAScfijFQ8qjuJYzbpPcmvm4NcUe/nTCeyDWvGF9Lr4b/
 o+ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7VqwcD3D/wQtp19xfyzwBEQ4cRkVmHpHd0tvUKcvyuU=;
 b=VqpwEpCdpSSe/tASPLrrWlZOru95jzI64eHw6gE68k4SPG8nBR3GRKxi6gv/ztbvgg
 7+akmQcw3p+FkBrYdT012LA3t5SEBsHygxAXoIhNw0/msRIvnZgUCUUtDJLCfEwJExLw
 uao5CwdLFH5E+FLDd4CUEjiLX+xaW5vC3aq1rhnwFCO71MLsBTGJCTjm76QKSmN9UHq7
 palQPaSFeJzU5DuxLJMw7EpC/Hcmgi72ipjOk/pwyfPAcqgBYOEK8gMUmTk7NqMLYwol
 XGeAUnT6On+Q4OgelQ2MpAJgzh8nZY4J9Mm6Sh3j839BMnOASn+zbrXaY5zZLl4VLRJj
 hjjA==
X-Gm-Message-State: AOAM531U8EDM4ROErbs4S87AcCUc0ScWwe1avabGwLRdJ3Vm5z8HW3XN
 pLQ0ugQbFzDgvJGvSQ8X2ugRCg==
X-Google-Smtp-Source: ABdhPJzpm89DMnsIIMEaAA2/xibs2ZklDdulru4yxzSS3oK6h60F1Ru+HfY17Jo4pD+wba4MHGwS2w==
X-Received: by 2002:a05:6000:108:: with SMTP id
 o8mr11985979wrx.154.1626255454110; 
 Wed, 14 Jul 2021 02:37:34 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id b16sm2064699wrs.51.2021.07.14.02.37.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 02:37:26 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1C55D1FF99;
 Wed, 14 Jul 2021 10:37:20 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 05/21] contrib/gitdm: add some new aliases to fix up commits
Date: Wed, 14 Jul 2021 10:37:03 +0100
Message-Id: <20210714093719.21429-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210714093719.21429-1-alex.bennee@linaro.org>
References: <20210714093719.21429-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Yuval Shaia <yuval.shaia.ml@gmail.com>
---
 contrib/gitdm/aliases | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/contrib/gitdm/aliases b/contrib/gitdm/aliases
index c1e744312f..c6ed215e68 100644
--- a/contrib/gitdm/aliases
+++ b/contrib/gitdm/aliases
@@ -31,6 +31,9 @@ pbrook@c046a42c-6fe2-441c-8c8c-71466251a162 paul@codesourcery.com
 ths@c046a42c-6fe2-441c-8c8c-71466251a162 ths@networkno.de
 malc@c046a42c-6fe2-441c-8c8c-71466251a162 av1474@comtv.ru
 
+# some broken tags
+yuval.shaia.ml.gmail.com yuval.shaia.ml@gmail.com
+
 # There is also a:
 #    (no author) <(no author)@c046a42c-6fe2-441c-8c8c-71466251a162>
 # for the cvs2svn initialization commit e63c3dc74bf.
-- 
2.20.1


