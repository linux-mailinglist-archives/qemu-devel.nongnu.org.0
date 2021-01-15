Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67C132F7E47
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 15:32:54 +0100 (CET)
Received: from localhost ([::1]:39526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0Q9l-0005oa-ET
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 09:32:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l0PEc-0001Mo-Q2
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:33:50 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:55118)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l0PEa-000894-Vr
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:33:50 -0500
Received: by mail-wm1-x32a.google.com with SMTP id i63so7376596wma.4
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 05:33:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dUtwtJbUZsSTf0W75DM+q3KlG12586cM2haaQCIRHuk=;
 b=VLD33elQ3q3lJW2HhLrmNQronVELMi2mRbDhRTENVB8YnttDZvBflhnr63X8IQQATS
 zk7Nl8OV0UHnfFKxbfd4D3DFbjyHGt2moHv8VXJCpD41Q2rohYHB9264XZkloc1dBsep
 JGA20tSu/95Y8+S7sRqMhw029OOEcpd9f/DYOJrD6oScDYIR5FpKHOLyDLO7nN8Sfq3k
 RUxmeaKFFbn+kbb6BwSaZZzv/vtU+ME9YBewsuEvXKOY1TqozMBowSQ+Ez3V+MEVw5Oh
 nYdS/fAXovbh+X4B4CikvXIr2VBYGEge/4of61QxLAWUq+G21LLkXqoFTWyA6Y38dC7L
 NE2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dUtwtJbUZsSTf0W75DM+q3KlG12586cM2haaQCIRHuk=;
 b=FQOUn58cTPNHbQ9j9pXfx3+iedf9B+MuKXCAtIU371QO90GNtKQS6oRsXLHXVZtCiB
 JvC7JOBuXwNBXMD5EcU1J4cTTEBQcN3at6odknBr5BulRBeWZcusVgn6ql1fMsbvHZ1w
 XxSq7oDpnyyRrbUgHlhzUCQ11LZqE3E/BU9OUyyk6VlGriFLRoeVvjRGMZWZh1OZ0dbH
 C5GuMmcbNoj+kHVXU1nNk/4WZcm+0MLW/BgTRw425CDCh20dv7UPYa+TVW8WqZ9ssfID
 3fqSIlHNbGmFwhgEfss6SACHc8+CHFQmkfJG0bpbp9WtMS+7FAXVgaXU0zjgR5jV3crK
 Urtg==
X-Gm-Message-State: AOAM530pFi5AYdzNRZVhl4hBezyYCs9UKsbrvlrSF7HFyc4WyAZ//0wO
 QkTwcc92W/1Vq4H+x9HPhjp5Ww==
X-Google-Smtp-Source: ABdhPJzomV2wxcw0IyAGVkHwJp6sehildIyWP42C0aYLsoS1kWVPoQzJ2bhDe0dEKZplYfOenPZGfA==
X-Received: by 2002:a7b:cb9a:: with SMTP id m26mr8713365wmi.130.1610717627562; 
 Fri, 15 Jan 2021 05:33:47 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id t1sm15325867wro.27.2021.01.15.05.33.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 05:33:40 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 29EEC1FF9B;
 Fri, 15 Jan 2021 13:08:31 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 12/30] scripts/checkpatch.pl: fix git-show invocation to
 include diffstat
Date: Fri, 15 Jan 2021 13:08:10 +0000
Message-Id: <20210115130828.23968-13-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210115130828.23968-1-alex.bennee@linaro.org>
References: <20210115130828.23968-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
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
Cc: Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Without this checkpatch keeps complaining about new/changed files even
when MAINTAINERS has been updated. Normal invocations of checkpatch on
patch files rather than commit IDs are unaffected.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210114165730.31607-13-alex.bennee@linaro.org>

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 88c858f67c..e47ad878d8 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -399,7 +399,7 @@ if ($chk_branch) {
 	my $num_patches = @patches;
 	for my $hash (@patches) {
 		my $FILE;
-		open($FILE, '-|', "git", "show", $hash) ||
+		open($FILE, '-|', "git", "show", "--patch-with-stat", $hash) ||
 			die "$P: git show $hash - $!\n";
 		while (<$FILE>) {
 			chomp;
-- 
2.20.1


