Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CEFE3792A6
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 17:26:48 +0200 (CEST)
Received: from localhost ([::1]:42984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg7nz-000747-45
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 11:26:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lg7kL-0008LQ-GW
 for qemu-devel@nongnu.org; Mon, 10 May 2021 11:23:01 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:41841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lg7kI-0003fZ-Bg
 for qemu-devel@nongnu.org; Mon, 10 May 2021 11:23:00 -0400
Received: by mail-ed1-x52b.google.com with SMTP id v5so8103413edc.8
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 08:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=06V0VUiKYVZFbQhAnjZHRCS14Ow+0xL5S8aFeGazJag=;
 b=QWIP35iZvseTD+QV640eSqCyO6TTQA6vsfA7L9YUeREMK5aQd/58g5Fw+8KnaFYfRt
 8dYnRYehc3jaFF2m5P7DtBcly6/2uYTms7VB6i5Jd7OPqgPsNBRyrXjw1fAg8O0gWN5P
 vbpLWZI2MtvPbRzhOH1nI585JPl5XAViyvADGHGtnwG5o/zYrcrO6VsEDEQajqnBuRWz
 uksr/qXotGvbu/fQxN5NEA9XKrSNiYc/A8/KJBjKBavvgEG2uSQxfCGau6hqHmkN3McL
 ze02+w69lDQqVmj2yjxzwy6ZAHnBctB1wir8gQ868LDu+kVyd5vpBbjDW8ROjErPy/JO
 v4oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=06V0VUiKYVZFbQhAnjZHRCS14Ow+0xL5S8aFeGazJag=;
 b=VydKqFIlR45w1RHRa/J/oWpMr6CJFAN1qf0uq6pLPlB/CYRBRKX9yb5+wRxu5u55+E
 PctVx2WTZMdBX07BhvJWKkG03hjqPinZfKene2/qMqLqFzHlz5j0aOlgcWAH8I0wuS7t
 J7meSUHKqpJhNMjRfrXORnh8cEJRs/qscLnzGLzhU/rngeg4f4Z4h1IUTbey4uHW53Ot
 VxlJrzBNin5Ra/trPecrEinSfpYNNMfMqoSWgMHlZoTb0AEsBymJGpiX2JkGDm04BPoE
 KJq1X8a5+qR2Z7duTX7wfa5AqiIDwjHJbMm0Y0/kw0JpU74meH36OiMGU49JHESdB86V
 CZBA==
X-Gm-Message-State: AOAM532CBlAL73+tYQqak6MmAF2cJNeOKh3lGqDmM2qTv1b/4mt2KdQk
 mG28A+azrfxmhwuveU5/0vNJ+qUyMT07aA==
X-Google-Smtp-Source: ABdhPJwEH222fxnlYFHgJyAae29omJKgzwiLH6SMtZ5Q3E31IgVL/GToWt5Bt4dnM00M/FqkUnlEew==
X-Received: by 2002:a05:6402:644:: with SMTP id
 u4mr30123123edx.386.1620660176269; 
 Mon, 10 May 2021 08:22:56 -0700 (PDT)
Received: from x1w.redhat.com (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id g11sm9306997eje.7.2021.05.10.08.22.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 May 2021 08:22:55 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/4] gitlab-ci: Allow using FreeBSD runners
Date: Mon, 10 May 2021 17:22:50 +0200
Message-Id: <20210510152254.2543047-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Minor shell fixes to use FreeBSD runners.=0D
=0D
Based-on: <20210503104456.1036472-1-thuth@redhat.com>=0D
https://gitlab.com/thuth/qemu.git tags/pull-request-2021-05-03=0D
=0D
Philippe Mathieu-Daud=C3=A9 (4):=0D
  gitlab-ci: Extract &environment_variables template=0D
  gitlab-ci: Adapt JOBS variable for FreeBSD runners=0D
  gitlab-ci: Run GNU make via the $MAKE variable=0D
  gitlab-ci: Add ccache in $PATH and display statistics=0D
=0D
 .gitlab-ci.yml | 36 +++++++++++++++++++++++++++++-------=0D
 1 file changed, 29 insertions(+), 7 deletions(-)=0D
=0D
-- =0D
2.26.3=0D
=0D

