Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CE8A35574E
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 17:07:57 +0200 (CEST)
Received: from localhost ([::1]:42900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTnJ6-0004SK-D4
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 11:07:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lTnCO-0006R9-0h
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 11:01:00 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:53190)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lTnCM-00053x-2p
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 11:00:59 -0400
Received: by mail-wm1-x32d.google.com with SMTP id d191so7534408wmd.2
 for <qemu-devel@nongnu.org>; Tue, 06 Apr 2021 08:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/OvWpiidAusoiWgG9DBS0zzwzX7wVU4NPq1QWT+0XUo=;
 b=szAzUoEb7bOV9Ezy7Pg8ME0PBDXF6ksbv6yu2h6f977yDctrgzmDGZiXgdUXarW9Ec
 t70HI4gKr6MyfO+ZwaL2RsR3IRCyYx33dFr+lsweYoHb0eCq8PTr62GsZHbwy2fsn23A
 smzooUop6X1Vh/aNzqqlQta69Om6QhX49nfnsjeenglBkzmZXIofN4Kd8rQFr8HWRghF
 5NAT9oFthMSKnrSTLVP4zDt4BrCrmBfijua+ZpAqKZuGMZnruQNppSHa7o1xrLwNFx52
 iH+v6UNYsMmz73s/WEHzONUvPZQhRMCNDNpThWB2tIUBhBupkwbKYvq2ZlwyczGYOZjk
 Stgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/OvWpiidAusoiWgG9DBS0zzwzX7wVU4NPq1QWT+0XUo=;
 b=rhOO5xHrBtsJUgUSs0Lo+rwv1JU5nqlQBYHQo/QGL4ZAvpOi1ZcBIwCqgTSr/Hi32q
 5Ghcfo8qSh2Uz6DP4EyZ8Fmz5mdSfmt1dYPgIWVWnA0a8J1Z14bOjhMkXrFeLmAWEnyU
 FG6CHJ9Rhcwu7XmaTBofEfAwBGbrp6ke/+ycoFHye2LWaraYNLXoqJNABw21gEJTDVz/
 g9tjkyFxUpoR/YTfaGQA/si5aDj7xq3CU37r6bl0vUlzDuLbwVE/TeIYFrbFsitKrX/9
 QSaSinyx1ZYVjQgFyr1sKgzDB9xYHrlt7oD8vsPwmq/ZbkjVAt0HnQCt1aRjoac3G9dN
 lodw==
X-Gm-Message-State: AOAM533prBAyEe3CJswc/csm6Ks3SH0R3475BPkyIOglCRZRX4EFeX8d
 1cJvb4mgo8nI2V6rjE3iuHY/YQ==
X-Google-Smtp-Source: ABdhPJy+WCItRqa3zFL9RGZbzDMNPg4oiBrW3i7Jv8AD2eyTtrF/Ese2Es/VWuORvBgUBSEtKGXMNA==
X-Received: by 2002:a1c:b689:: with SMTP id g131mr2498452wmf.138.1617721255755; 
 Tue, 06 Apr 2021 08:00:55 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id g64sm3924864wme.36.2021.04.06.08.00.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Apr 2021 08:00:50 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7E0271FF91;
 Tue,  6 Apr 2021 16:00:42 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 05/11] tests/tcg/i386: expand .data sections for system tests
Date: Tue,  6 Apr 2021 16:00:35 +0100
Message-Id: <20210406150041.28753-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210406150041.28753-1-alex.bennee@linaro.org>
References: <20210406150041.28753-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Newer compilers might end up putting some data in .data.rel.local
which was getting skipped resulting in hilarious confusion on some
tests. Fix that.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20210401102530.12030-6-alex.bennee@linaro.org>

diff --git a/tests/tcg/i386/system/kernel.ld b/tests/tcg/i386/system/kernel.ld
index 92de525e93..27ea5bbe04 100644
--- a/tests/tcg/i386/system/kernel.ld
+++ b/tests/tcg/i386/system/kernel.ld
@@ -12,7 +12,7 @@ SECTIONS {
 	}
 
 	.data : {
-		*(.data)
+		*(.data*)
 		__load_en = .;
 	}
 
-- 
2.20.1


