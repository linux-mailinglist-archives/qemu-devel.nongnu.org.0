Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8718D3D3E35
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 19:08:45 +0200 (CEST)
Received: from localhost ([::1]:47834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6yfE-0000Z6-Hg
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 13:08:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m6ybI-0000cT-VV
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 13:04:41 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:45017)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m6ybG-0005cW-7N
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 13:04:40 -0400
Received: by mail-wr1-x42e.google.com with SMTP id z7so3037918wrn.11
 for <qemu-devel@nongnu.org>; Fri, 23 Jul 2021 10:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4ME/DhYbbAOS6+k+ybuAkCZ132eA+5pNIcupBcMpXZc=;
 b=nl7inRgOybmDELvrXlBq1RtYpSdVVkN4F9Etmjz1rUVL4b7dnPlU2OVDOHrvy7Kw2V
 m+EXtNO5wMjhqmuq2u598ZowKdYSEvMnUpD75ghJnbcHUr16LBMRb/kKaur9GvrNtOVE
 6PlFTk3oYTXu+mo9YSCBwIm7KqyCFaSYiSdPPJeOEItCSFWcIPIYMA4D0hvBqcYGlFtI
 zUoTXXw2kwGvJxYImIctfto53122wK0WLNMaxP75F3zVr0CzrHK/G5xfjvg93xqmtKzD
 xxKhKeJNwYt3n39ovy4FhaJNfaY8OLTHn6Wj897uF/EkEPBZn1H8gwv6KI973Z3FGpaS
 4nQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4ME/DhYbbAOS6+k+ybuAkCZ132eA+5pNIcupBcMpXZc=;
 b=a6fVoy79pvT7fD40r1gqd37rkPv+3Eno5aI9mBt9OBcbdiOnS1ETsG/C4gvLHXDWjL
 YeIHZ1qwfs3vybskHGXqE+SUvQ+ZEAJyCXtBQFEtvkWUzryV7pYM2J7dGvovSp/3s7qY
 PTjjvmE9hzcMHQmgJFoNJtMQa2m8WiKzC1iDP7b9MUsdXb6IOojyEzr/ybuBgjEmftfb
 O8q3OgW8Vfdme7qJEypxOSrz96BQq0z6WSPWX2Snfv51Fpn1ex6fFUKzV+y24NrIoezo
 ElXSbNKSgknzeUi8775iAvuiyqOPIpVRuhLTnC+eLIm1tPFMlTT8XdiI4ZogPhKFdjLm
 iojA==
X-Gm-Message-State: AOAM533SirA/IBv0RaATruYBeBFiV+dP7qwLoap1bwFmp8hbJiaiNo3v
 SBsg6HmRzRBcszOR125ofOJz1Q==
X-Google-Smtp-Source: ABdhPJxJD2XehorFWFfBZFLsjhZ8hj78G9RExX5CNAAJkcVbnP4wknGq8pvM+YszwY/hMQ6Ps2ZrRw==
X-Received: by 2002:a05:6000:1107:: with SMTP id
 z7mr6536189wrw.228.1627059876908; 
 Fri, 23 Jul 2021 10:04:36 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id p2sm20842355wmd.15.2021.07.23.10.04.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 10:04:29 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B66F41FF91;
 Fri, 23 Jul 2021 18:03:54 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 05/28] contrib/gitdm: add some new aliases to fix up commits
Date: Fri, 23 Jul 2021 18:03:31 +0100
Message-Id: <20210723170354.18975-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210723170354.18975-1-alex.bennee@linaro.org>
References: <20210723170354.18975-1-alex.bennee@linaro.org>
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Yuval Shaia <yuval.shaia.ml@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Cc: Yuval Shaia <yuval.shaia.ml@gmail.com>
Message-Id: <20210720232703.10650-6-alex.bennee@linaro.org>

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


