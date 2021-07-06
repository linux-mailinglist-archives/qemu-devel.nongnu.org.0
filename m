Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C2443BDA0B
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 17:22:13 +0200 (CEST)
Received: from localhost ([::1]:34960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0mto-00020S-5F
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 11:22:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m0mfQ-0005ZU-7r
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 11:07:20 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:37798)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m0mfN-0007GA-KM
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 11:07:19 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 r9-20020a7bc0890000b02901f347b31d55so2009957wmh.2
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 08:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oS1S2allDRCwTqJLfgxd4YbJAktd2ptss87hkbFVJp0=;
 b=vd28U50abaB0K+EHlla1Z4ey6uf78Usr8ds32f7Ge058vfisF55SWoSk1jIg2YRtcC
 IywZyCY/cbk99+SqFKgKpGKboEtsdtN8Zjo8QrMjqxWytXpQqpJiHH/bXUjPsEYreyN/
 djSvlXGaS/J7IgUZS62DtdvLC8MxPf7585ZvHRO2eDElOgV/ITqxjMiRWvb0lblt5T5I
 6m+A+J/s9ZLPtK1o4vFjLAMxjvhGRoPxJ9LAD7dAOy0zNW9Hljh6KjMi9wlOPRHnlZhr
 CSOb2silf0/bqfyGiZkntSI3gP6VMY+CJvjUh0x87Ej2SpswDTBwu4Rf5j+DYDQwzus6
 6P6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oS1S2allDRCwTqJLfgxd4YbJAktd2ptss87hkbFVJp0=;
 b=l2bNscW1c3CeMyWdSmYmLVrJ4kTFqs/sBgbKN+mqtB7B9PMYzHeQVGbQDaSewH2kyM
 QC4VOFFBOPWj6OkVb3ErLTI12Sl6a9Ryd+As7E0o4PQOqhKJWX1L083uY0ealZ/Y2Lio
 Yy4aEmIP9n0Gxzd5Kd+u4WV4vO84MeOD7ONUp/RWF42jPD734BUglrHS+glnFALAqZdf
 FyXTVX+vZUQ5QNMJFplqj3NF+OkjlO0e+v60GLSPvst6AlKVFwNdqQPVuijBsZitgPdu
 IotUy25hiiWqHbevPeSRrmMgJJLvSxlpM3yPtIObrzXThSV9oV98EsN3JfHIO3pxhWZP
 TJEw==
X-Gm-Message-State: AOAM532R3QkPn/SMOs5pxDoArZ+CPNbhnaZibRdHZsFPaAbSA4Z2f2Q1
 RqW45ThnACRk/wckN0VAjV06RQ==
X-Google-Smtp-Source: ABdhPJyukiALebnwYY6SjGQoj0Hsh5cRJgkwuROwRb06WRazoFvnL5DbTMlyY4dJS0Abp/olrBBmCg==
X-Received: by 2002:a05:600c:1992:: with SMTP id
 t18mr1316164wmq.165.1625584036134; 
 Tue, 06 Jul 2021 08:07:16 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id b12sm4783230wrt.78.2021.07.06.08.07.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 08:07:12 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E07F61FFBF;
 Tue,  6 Jul 2021 15:58:21 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 39/39] MAINTAINTERS: Added myself as a reviewer for TCG
 Plugins
Date: Tue,  6 Jul 2021 15:58:17 +0100
Message-Id: <20210706145817.24109-40-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210706145817.24109-1-alex.bennee@linaro.org>
References: <20210706145817.24109-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
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
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com, Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mahmoud Mandour <ma.mandourr@gmail.com>

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210623125458.450462-6-ma.mandourr@gmail.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index ee456e5fb4..77b304afac 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2982,6 +2982,7 @@ F: include/tcg/
 TCG Plugins
 M: Alex Bennée <alex.bennee@linaro.org>
 R: Alexandre Iooss <erdnaxe@crans.org>
+R: Mahmoud Mandour <ma.mandourr@gmail.com>
 S: Maintained
 F: docs/devel/tcg-plugins.rst
 F: plugins/
-- 
2.20.1


