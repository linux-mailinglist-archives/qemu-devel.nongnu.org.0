Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D211E3728A3
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 12:17:52 +0200 (CEST)
Received: from localhost ([::1]:47344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lds7j-0002pA-Se
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 06:17:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ldrt6-0002gV-WD
 for qemu-devel@nongnu.org; Tue, 04 May 2021 06:02:45 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:41806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ldrt1-0003Aw-Rt
 for qemu-devel@nongnu.org; Tue, 04 May 2021 06:02:44 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 t11-20020a05600c198bb02901476e13296aso980853wmq.0
 for <qemu-devel@nongnu.org>; Tue, 04 May 2021 03:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OWsxh1O/PCMLIPJdNYGt0wcTu1m8kvjY7RzHMHd8hQY=;
 b=iwubV8+E5qgI0J9za3n3PKIDyjmnMHO0HzNz+A5im7cS/TLLgnMl+zavlQbJ9Z/d/B
 mzcY1ZDVayefevvtJJhGVDur7jr+ACKzFFV3yadFlw5jyLUiz2cQBVL3SdS5E+DZpFDh
 ENoh57/oE1vehnE73J3gRFztzElIX1wG1ESw8cQOslzHdEyPcEd4RRUW3o5OeJNgkv31
 3fnFSDbwm+tltp4aO70++z0wi5LIkeI58hG1e6l4nPpWaHvlGgnGFhfxvtpy8WBqZ2em
 mcw7R54KP3rqxUPPyaNtWpimsK/nptXCFI9dIaNaZEZIdYnm1oRwMIJNWX7SWdGDdwpb
 DneQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OWsxh1O/PCMLIPJdNYGt0wcTu1m8kvjY7RzHMHd8hQY=;
 b=Y6pndg+b0KJ1CAfIz+EBvxalhYr5pmRZthFAMOkCnlRFEEKsCS/Ba9zwdoHgmdfs9G
 cDKj3KIhCOkrehRi0bZWZRdB3xLAryNGcKLdOqDgQp9Qj4kSJ0cbpsrIye2RQyOSRv1O
 X86jh9+9bwCKvFqd0NDg4OodkMdLufsBVBo/pnAMMiY9vvEDvmgLXcjdydDX/vJDz2wf
 y9B2SM9ANyjpAjS3g9s9irCIF6tO9YKaOyJF7wG3zTOzn+trRpojLZE8AfuZgV2TA1X1
 X26BWHIUBwCc5FEULcQwn2telMpZ6UVIelphYIYMg25O2xt4oQ84vkkGoI4mgj2IepH0
 E12Q==
X-Gm-Message-State: AOAM531f56quIAVrOx2/VObUF/1MMhrq76z3urqWaYOEbGL7wnsMOMey
 Sj7ACGt9maboB3u6z2DY1lZIsw==
X-Google-Smtp-Source: ABdhPJzM9QTpkWVj5Kau+tT59Hbjqc1zCF3NNsnwb9+KEUheHR/Nu2J1V4MBkMEZVXrQNbdzHB4vxw==
X-Received: by 2002:a7b:c20e:: with SMTP id x14mr25942046wmi.57.1620122558567; 
 Tue, 04 May 2021 03:02:38 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id n2sm2563531wmb.32.2021.05.04.03.02.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 May 2021 03:02:29 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 435591FF93;
 Tue,  4 May 2021 11:02:24 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 07/30] tests/tcg: Use Hexagon Docker image
Date: Tue,  4 May 2021 11:02:00 +0100
Message-Id: <20210504100223.25427-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210504100223.25427-1-alex.bennee@linaro.org>
References: <20210504100223.25427-1-alex.bennee@linaro.org>
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
Cc: fam@euphon.net, Alessandro Di Federico <ale@rev.ng>, berrange@redhat.com,
 f4bug@amsat.org, stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alessandro Di Federico <ale@rev.ng>

[PMD: Split from 'Add Hexagon Docker image' patch]

Signed-off-by: Alessandro Di Federico <ale@rev.ng>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
[AJB: add container_hosts]
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210228222314.304787-5-f4bug@amsat.org>
Message-Id: <20210305092328.31792-6-alex.bennee@linaro.org>
---
 tests/tcg/configure.sh | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/tcg/configure.sh b/tests/tcg/configure.sh
index fa1a4261a4..24cc847688 100755
--- a/tests/tcg/configure.sh
+++ b/tests/tcg/configure.sh
@@ -128,6 +128,11 @@ for target in $target_list; do
       container_image=fedora-cris-cross
       container_cross_cc=cris-linux-gnu-gcc
       ;;
+    hexagon-*)
+      container_hosts=x86_64
+      container_image=debian-hexagon-cross
+      container_cross_cc=hexagon-unknown-linux-musl-clang
+      ;;
     hppa-*)
       container_hosts=x86_64
       container_image=debian-hppa-cross
-- 
2.20.1


