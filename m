Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D4BC342D1C
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Mar 2021 14:39:58 +0100 (CET)
Received: from localhost ([::1]:49232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNbpd-0004kh-5B
	for lists+qemu-devel@lfdr.de; Sat, 20 Mar 2021 09:39:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lNbn3-00032A-SM
 for qemu-devel@nongnu.org; Sat, 20 Mar 2021 09:37:17 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:45595)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lNbn0-0004Ei-1b
 for qemu-devel@nongnu.org; Sat, 20 Mar 2021 09:37:17 -0400
Received: by mail-ed1-x536.google.com with SMTP id bx7so14012979edb.12
 for <qemu-devel@nongnu.org>; Sat, 20 Mar 2021 06:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qI7RaKP8t/8kWu2Q3Cb45ubBjt2y6/gFWrDLRt5E2Mc=;
 b=hx+UJ8USWUegHtaFYV7gh417KuK4mwsCUcUsBM62IYYe8f5qSx398HPnoqP6UKdOgj
 AJvxYTu0AZ3QCCpqPkANPwxq8GqHVj94I+pY8hNPeF5pbRi+vz3fzZ/BtKM1J/BEWTyC
 SITk0ZbjJYG323bvMetoivkWpyX3sDEGmsXbyYoA3c/eNgvoBzSlLBMukmwG05GC904a
 o+QJH0giQ1AX/vptL/QGZ3mzfwzYO7XrqE2eCticXxT6ZYUU53LmiPvKfFw3PLgelsl8
 2MxEjeCLhq+7pO8LHPdkZYBpvqVs0GeU1VntZmPPDwZmrqOI4Bvvb/WlXWyFCvsciv+y
 HT8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qI7RaKP8t/8kWu2Q3Cb45ubBjt2y6/gFWrDLRt5E2Mc=;
 b=g2PyAlu7IsDvA0j5gSR73pxky1fIldL00OLKV9TULophmMxo4Kdz1mIHC7bKRgktQV
 xle5lqU8PtFYw6wTlAVDYjzHKuUrxQdb94XJ3LhfbTKlHrs2tZESfLEePeAImmr2kkZL
 2nXianLilvBRnS3jypS5dPx4MOWDgwIpE5kUBiJ+Q9NTbxQJEasUT3PhVBqN6k+iOKFK
 uQ9GZP3orXGe+F31qeg6cZ8UgVKjqYBW3/laCJNoJmoeX8RcVIKhh5tZ3KTCUCAa4AHV
 BQH5+h1d+LEqy4IDF+2boUtUl2hti9MheXFNReJssEQ+uu9mV3/MQUguvjFce5FJUyne
 iq1g==
X-Gm-Message-State: AOAM531aN1efag2Xhpa29PkIHpirlVvaYAzkSlDI4Z6vpRQP9xMI84XC
 VPSyQqwimXoAylFJicn+qjCYYw==
X-Google-Smtp-Source: ABdhPJyhH4sqpt6vCKQ2uZiQRomklsgcIW5nCoP4JKAfqtpm+lNANzUISPreGg/HL9dSmwhYD+GGSQ==
X-Received: by 2002:a05:6402:27d4:: with SMTP id
 c20mr15658543ede.271.1616247430777; 
 Sat, 20 Mar 2021 06:37:10 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id i2sm6120086edy.72.2021.03.20.06.37.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Mar 2021 06:37:07 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id DF5521FF8C;
 Sat, 20 Mar 2021 13:37:06 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 02/14] docs/devel: include the plugin API information from
 the headers
Date: Sat, 20 Mar 2021 13:36:54 +0000
Message-Id: <20210320133706.21475-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210320133706.21475-1-alex.bennee@linaro.org>
References: <20210320133706.21475-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x536.google.com
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
Cc: Aaron Lindsay <aaron@os.amperecomputing.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We have kerneldoc tags for the headers so we might as well extract
them into our developer documentation whilst we are at it.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Aaron Lindsay <aaron@os.amperecomputing.com>
Message-Id: <20210312172821.31647-4-alex.bennee@linaro.org>
---
 docs/devel/tcg-plugins.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/docs/devel/tcg-plugins.rst b/docs/devel/tcg-plugins.rst
index 39ce86ed96..18c6581d85 100644
--- a/docs/devel/tcg-plugins.rst
+++ b/docs/devel/tcg-plugins.rst
@@ -63,6 +63,11 @@ valid during the lifetime of the callback so it is important that any
 information that is needed is extracted during the callback and saved
 by the plugin.
 
+API
+===
+
+.. kernel-doc:: include/qemu/qemu-plugin.h
+
 Usage
 =====
 
-- 
2.20.1


