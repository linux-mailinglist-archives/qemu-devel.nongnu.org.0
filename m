Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 364BC39BDF6
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 19:04:22 +0200 (CEST)
Received: from localhost ([::1]:50878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpDF7-0003jC-AG
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 13:04:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpCkU-0007sw-8v
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 12:32:42 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:45678)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpCkS-00025K-80
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 12:32:41 -0400
Received: by mail-wr1-x434.google.com with SMTP id z8so9889785wrp.12
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 09:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=T5Otzi7s7hlRC+aw9fJv8J9Wjbg5nAbpIivh9IdigL8=;
 b=LJ0el1L6WupgMwudXB24M6QmkErVD5gVaWie17x8mH5lPE66JPonxEpSNLuvJWYY6X
 hEWzavu7OdgKmVsIg99T4RQ+IpIJZx88Bk5TzQpaJO5qZuOJk8OETOrDPa67k5roIEic
 GtmcJ91W4HZaX+mKWJ7wobb++/IBN5gIS1WLV6X/eVQGP05MvmRyTNRAkEmj2IaP5XwS
 ZCC37NmkIKGScSihyOZAf62IZTzT3ETou8YYk332b4DVZT6GOxRkO+F3hA8F9J/7xuoS
 XwQyPYL/4uuhmYKM4U13Moh+YUggKcXF2sO5FMWGln9zPUb2e1130hrl7r0YTeFhl2Ep
 FAhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=T5Otzi7s7hlRC+aw9fJv8J9Wjbg5nAbpIivh9IdigL8=;
 b=rRsEua0zgpBAo69T/zFOPZBqX33WLM1yMR8iYqMoQyaWeo8JTZiGtr5MQzBsGFOAwm
 MXw637oioUhf45hJR+6Z+fa9Wet1wgn0LgyeTW6+hdbrPbU9vVyYqQ7mdCpaN7ouPa1i
 0aPYIYcHtkeDGwis9WfGnjjnJOUqQaKopyfDqyd/yA1pD7aUM/ZWNCl6y2aF0f0Bt30n
 kyY6fUx6BbkSB823InsO2mf5wX2WwWX/fhG1Z683k7KKvjLh2CYvPsniMNDLMc57aBu3
 H+h0BB5veA/Kac2vvYMFNFxznBmym3JQ2cTegPm/YIYiu5tQRh+2UDtEfqBH1joO3W44
 uUPg==
X-Gm-Message-State: AOAM531ar8vR/ApR0Y12DKT418a1jkMtdxzAs9KFcDOL86FHOj2pgkC9
 /I7xgm9WmLF7k0vGl52X+mtRsg==
X-Google-Smtp-Source: ABdhPJztBs9KkH9EVXSMrFMh3FHeCAI0RYm87g8BzQ2iOO3pEo+L5UddmUdt8xB1KAU0cQkJe2u9wg==
X-Received: by 2002:adf:ebc4:: with SMTP id v4mr4721123wrn.217.1622824358639; 
 Fri, 04 Jun 2021 09:32:38 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id p12sm8462680wme.43.2021.06.04.09.32.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 09:32:37 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id F2F9D1FFAC;
 Fri,  4 Jun 2021 16:53:14 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v16 23/99] target/arm: only build psci for TCG
Date: Fri,  4 Jun 2021 16:51:56 +0100
Message-Id: <20210604155312.15902-24-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604155312.15902-1-alex.bennee@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Alexander Graf <agraf@csgraf.de>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Claudio Fontana <cfontana@suse.de>

We do not move psci.c to tcg/ because we expect other
hypervisors to use it (waiting for HVF enablement).

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Cc: Alexander Graf <agraf@csgraf.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/meson.build | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/arm/meson.build b/target/arm/meson.build
index 0172937b40..a9fdada0cc 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -19,8 +19,12 @@ arm_softmmu_ss.add(files(
   'arm-powerctl.c',
   'machine.c',
   'monitor.c',
+))
+
+arm_softmmu_ss.add(when: 'CONFIG_TCG', if_true: files(
   'psci.c',
 ))
+
 arm_user_ss = ss.source_set()
 
 subdir('tcg')
-- 
2.20.1


