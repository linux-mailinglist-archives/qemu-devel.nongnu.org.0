Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B9239DEEF
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 16:37:06 +0200 (CEST)
Received: from localhost ([::1]:48830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqGNF-0003B0-LF
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 10:37:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lqGJb-0003Ew-3m
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 10:33:19 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:53775)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lqGJZ-0000Op-BS
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 10:33:18 -0400
Received: by mail-wm1-x32f.google.com with SMTP id h3so10204544wmq.3
 for <qemu-devel@nongnu.org>; Mon, 07 Jun 2021 07:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8wY8xOMGbmc+p/CncxVaITnpCcAwvAmU9tqM+XkzmY4=;
 b=DT6dBAgIhTvn1hveizIcCFuYbTmkxhTFkGQUx6arfLM9tfEh4V6UPzNOp2zbnZCPT3
 3GiI5uri/xL3YZkJlnApRSk3DYFAk600MylwBm7DSqufIsSGdfZFSfpZXaoJsUdH6/PN
 UyiKKZLgduaGvXleRp49gwyuQz+6Ey6dK1Wn35pBJxcQ99J1DInm5Ij7q6ICPBLzMUpc
 FddxhDNOqW16wBO6gOyPiFFOHYDR4XtIxpfugxbt42Hlz/B4Dxv4Lkcz/mG3735m/K01
 +nETRaiBYpiG3KS5CkgrpNVewBj9IANC60se8NphEKHrt3G2k9FrXfu54FCdFeclKh/N
 bN/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8wY8xOMGbmc+p/CncxVaITnpCcAwvAmU9tqM+XkzmY4=;
 b=M9w8pYuUjSHowA/P12BoqDaCJ7WNHjdiVd76+pq5ycQ4DQK2Ur7WUmH9DcehoZcvJc
 a7CFEJhLm1BuOkL8gi2yEObudaUxoUS84fv1537/3GpuUAffVdzyCov95DgOi1q1eQNY
 Qbqv5OjF28/jGP9d31dbE5pCZBwLASvpBwwswZfUOjzZKeLK1aODsrjrmmwhPvtXNHRD
 D8oEVCH0IBfoc1fzZtptKfHB18XW/W1vyuk6SsgSDj23t/pUxX3+pahdGINwwJ8eTWOA
 Aof63Hy3B+K7AIUOdsWMH0vtS15NFwxvNxOCOCWEKT8FPkIGYHugFzTk/xlByrjkFWJe
 FS6g==
X-Gm-Message-State: AOAM530gPlMffVY+QE6QhvvC9p8lUmjCL6bIsQnHQ05iU7fLa60ZmV84
 EaiDoznOipMDU25MZBcvURb77w==
X-Google-Smtp-Source: ABdhPJxzVZe6LsqfUF8v2sX3WMrzv1ltXVDnw/AEX/6oISRqIZiK6XS1h/IYOogPpTkjnpZ/kyVrhw==
X-Received: by 2002:a1c:c256:: with SMTP id s83mr16893496wmf.86.1623076396043; 
 Mon, 07 Jun 2021 07:33:16 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id h9sm14280306wmb.35.2021.06.07.07.33.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 07:33:08 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4EBB91FF96;
 Mon,  7 Jun 2021 15:33:04 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 8/8] scripts/checkpatch.pl: process .c.inc and .h.inc files as
 C source
Date: Mon,  7 Jun 2021 15:33:03 +0100
Message-Id: <20210607143303.28572-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210607143303.28572-1-alex.bennee@linaro.org>
References: <20210607143303.28572-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
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
 Luis Pires <luis.pires@eldorado.org.br>,
 Matheus Ferst <matheus.ferst@eldorado.org.br>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

Change the regex used to determine whether a file should be processed as
C source to include .c.inc and .h.inc extensions.

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
Message-Id: <20210520195142.941261-1-matheus.ferst@eldorado.org.br>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 3d185cceac..bbcd25ae05 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -12,7 +12,7 @@ use Term::ANSIColor qw(:constants);
 my $P = $0;
 $P =~ s@.*/@@g;
 
-our $SrcFile    = qr{\.(?:h|c|cpp|s|S|pl|py|sh)$};
+our $SrcFile    = qr{\.(?:(h|c)(\.inc)?|cpp|s|S|pl|py|sh)$};
 
 my $V = '0.31';
 
@@ -1671,7 +1671,7 @@ sub process {
 		}
 
 # check we are in a valid C source file if not then ignore this hunk
-		next if ($realfile !~ /\.(h|c|cpp)$/);
+		next if ($realfile !~ /\.((h|c)(\.inc)?|cpp)$/);
 
 # Block comment styles
 
-- 
2.20.1


