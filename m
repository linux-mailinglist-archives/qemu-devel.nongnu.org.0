Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9672C37B587
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 07:39:34 +0200 (CEST)
Received: from localhost ([::1]:52632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lghan-0002rS-L0
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 01:39:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lghYf-0000xm-4V
 for qemu-devel@nongnu.org; Wed, 12 May 2021 01:37:21 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:42848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lghYd-0006SV-L6
 for qemu-devel@nongnu.org; Wed, 12 May 2021 01:37:20 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 4-20020a05600c26c4b0290146e1feccd8so2366438wmv.1
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 22:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xmTKmIzhm1zU9f1vTEcKvdqiEavS+TtmHw18bGtJYQk=;
 b=nUAkbNFrR0lZmgwEwP/9+3j9PItMq5hFOYag/9AiiuF5oqosRs/zwFejT2hsj8xb9m
 JG74TZe1dRoqJzo1BShSE3/xeSjUIPpG3q0QRSY1qe7R3dbcJacOBAp0NjPXcQaFByFG
 NzI7lYvKfQRIMd+rSLhVoHxWJDmoYBGgKSEoVxcs5U8pHlHIU1awrmG6mdhQ5r/5O5F2
 QMS8j/MZpGnVfzNZkBrszACXL1FM5tvs8X/u1oKACSyjRhRCbKWM9Qr1ngV5HEM+6wHB
 xo0Pa44+08BBclsLrNzS93QWu2tFfSENnPAxe5PtugAXPbpwPoFbWut1TFyTonNwA6PR
 JrHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=xmTKmIzhm1zU9f1vTEcKvdqiEavS+TtmHw18bGtJYQk=;
 b=EG+145fhQDcS6csKU/jVTmx7AM2WQIqad0AeGg3SSSfaxyDnQN/QXjMbQiEQVuui6x
 gcsiVAY4ai2X8X1Ot//YyGSlGmQmdnX9Gb3qtr6onPOUs+uzkeyicr3dHWGTYILQZ/4v
 04jKmC2OVMIHMcrT8M7XLYET6PWg/dA4Q71DipBOv8BVpY06WieoMGyPj7P0kHt1y5MG
 D2bJ+vOuwLjN85n0yBMvTuC/O7uVuphQ8mBzrG+U2vd7oUUziBICAIr6IpNCHBs4lhJr
 LVZUT80O1KCOalc/LFOYINPrfJoqLoHSbyXIMv3WBWEJmLJWLSY5gxw23mb8NYv/LbGT
 lhWQ==
X-Gm-Message-State: AOAM532L2SAMD2um8IC3BerAeOh2R1c4rDXODwDzeBltHbZ41Jua7Jdm
 bIZOOXg9gJlpwfFpHwX9EAjuOVQrRzwbBg==
X-Google-Smtp-Source: ABdhPJy0og6vZxvvgx+lJwiK71eKzw3bjxuep0TqmBovoeRtzMcxjc4Iwdht6GBppNsT9SeZsAeEuQ==
X-Received: by 2002:a1c:e408:: with SMTP id b8mr6000863wmh.85.1620797837914;
 Tue, 11 May 2021 22:37:17 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id s6sm5933917wms.0.2021.05.11.22.37.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 May 2021 22:37:17 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/6] gitlab-ci: Allow using FreeBSD runners
Date: Wed, 12 May 2021 07:37:08 +0200
Message-Id: <20210512053714.3268162-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
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
Since v1:=0D
- share the FreeBSD jobs, restricted with QEMU_CUSTOM_RUNNER=3Dfreebsd=0D
  so mergeable in mainstream.=0D
=0D
Jobs: https://gitlab.com/philmd/qemu/-/pipelines/301361673=0D
=0D
Based-on: <20210511072952.2813358-1-f4bug@amsat.org>=0D
gitlab-ci: Ease forks pipeline workflow=0D
which itself is based on:=0D
https://gitlab.com/thuth/qemu.git tags/pull-request-2021-05-03=0D
=0D
Philippe Mathieu-Daud=C3=A9 (6):=0D
  gitlab-ci: Extract &environment_variables template=0D
  gitlab-ci: Adapt JOBS variable for FreeBSD runners=0D
  gitlab-ci: Run GNU make via the $MAKE variable=0D
  gitlab-ci: Add ccache in $PATH and display statistics=0D
  gitlab-ci: Simplify before/after script for Avocado based jobs=0D
  gitlab-ci: Add FreeBSD jobs=0D
=0D
 .gitlab-ci.d/buildtest-freebsd.yml  | 59 +++++++++++++++++++++++++++++=0D
 .gitlab-ci.d/buildtest-template.yml | 38 +++++++++++++++----=0D
 .gitlab-ci.d/qemu-project.yml       |  1 +=0D
 3 files changed, 91 insertions(+), 7 deletions(-)=0D
 create mode 100644 .gitlab-ci.d/buildtest-freebsd.yml=0D
=0D
-- =0D
2.26.3=0D
=0D

