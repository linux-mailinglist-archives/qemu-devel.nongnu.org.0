Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED1DE2C0515
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 13:00:02 +0100 (CET)
Received: from localhost ([::1]:44322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khAVk-0002iZ-NM
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 07:00:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1khAG4-0005AY-3j
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 06:43:48 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:44474)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1khAG1-0002oh-Rz
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 06:43:47 -0500
Received: by mail-wr1-x42e.google.com with SMTP id 64so4861556wra.11
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 03:43:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=TTlHQda6TfnO9fASXtlgP/M+v+JLTjiG7Y+Xy9D52kQ=;
 b=o1B0D/T48NNwvxtd2HGjB21jsTj5SL063E8s6P7ngDkJ/NkoFQg+dhPRZCi4WkiKLB
 bJqTWmILRmspShYxwiFinD4Umfasymj57c3htDKnrsmDOaftBuaIcG53xQhvFk/r90dO
 ny4+uSQ1lJAux9MRehG7BjE2uyiJzMIdaEfqT3N9pzEIFvKCNIKp0rmXxICo8Xp0ShmS
 ra3MDaiCCUG0YNt9wspc+lxnQ5nYfPVP/tpsD6oC8CcppgVOCian4IuShs3XoCKdT7eS
 7dU5OgeQiJplee2wdeVue9whxqhmyz0OFZ9c/zBvt10munpOLg7Is2KExr+o/ZPUA0sJ
 yqdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TTlHQda6TfnO9fASXtlgP/M+v+JLTjiG7Y+Xy9D52kQ=;
 b=P6U5O5vW1mt/Cj9m9irxAZMK4WEIWKz6IJJ5f23Ti2FKWzcAXbwHMrkgbLu8DoRMjx
 QeUDvpkUxtCR8k4BjFJFqz2QeZToATQ+toCvFj/r/2c1HPVFFeU/7/CSmIQgsF0v6niW
 wiLpJ+njb/A5x0aN8LANe5hwWqUUFgJOPisD7A+IG6x8+dECOwl1pn4B9wltdowLLWHi
 WLwiw4KSh2v+KkJ7vv5kWNrFaB4yCd4TWCMNFC8qvmxa1s9SuyU4zwVNhNEf0eswP5A2
 6TU2lTt9rYwZlIYwOPTEyGbsu+kohGIjjr12OHHZKiURD+jgHRXPWsStFdos00mvkoYo
 D+dw==
X-Gm-Message-State: AOAM532os6qR57WB7XrVMEcn58vNBQ9dSJGAm3ODhuUkeQ3N7vt5S3va
 GaRZTJoAyrkkAAtTM6W3cxSExjib6KOTlQ==
X-Google-Smtp-Source: ABdhPJwl5kr4jflu0G5AkPS/1tJ8unYkrQIq0jGpotFnfGMxwD0s33Iy/HwZ4fMxiCbAk0CPoW+Spg==
X-Received: by 2002:a5d:46c6:: with SMTP id g6mr32199079wrs.170.1606131824190; 
 Mon, 23 Nov 2020 03:43:44 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g186sm50836495wma.1.2020.11.23.03.43.43
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2020 03:43:43 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 24/24] docs/system/pr-manager.rst: Fix minor docs nits
Date: Mon, 23 Nov 2020 11:43:15 +0000
Message-Id: <20201123114315.13372-25-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201123114315.13372-1-peter.maydell@linaro.org>
References: <20201123114315.13372-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fix a couple of nits in pr-manager.rst:
 * the title marker for the top level heading is overlength
 * stray capital 'R' in the middle of a sentence

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---
 docs/system/pr-manager.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/docs/system/pr-manager.rst b/docs/system/pr-manager.rst
index 3f5b9f94dcd..b19a0c15e66 100644
--- a/docs/system/pr-manager.rst
+++ b/docs/system/pr-manager.rst
@@ -1,8 +1,8 @@
-======================================
+===============================
 Persistent reservation managers
-======================================
+===============================
 
-SCSI persistent Reservations allow restricting access to block devices
+SCSI persistent reservations allow restricting access to block devices
 to specific initiators in a shared storage setup.  When implementing
 clustering of virtual machines, it is a common requirement for virtual
 machines to send persistent reservation SCSI commands.  However,
-- 
2.20.1


