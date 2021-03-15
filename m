Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE1633C9C5
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 00:12:15 +0100 (CET)
Received: from localhost ([::1]:50662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLwNi-0005R9-2u
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 19:12:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lLwKN-000136-Nt
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 19:08:48 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:42443)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lLwKL-0001tx-Ci
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 19:08:47 -0400
Received: by mail-wr1-x42f.google.com with SMTP id j2so9504805wrx.9
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 16:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+9efFaSWX0HOPkTVAGn0fUi/WEpSl7fU0r3UNlJv0Kc=;
 b=Qy7LMMOcgRwXVVxCg+iZt8MPHGRvrkE7FOpDQ5sg2D5+R/gzwbtMQF2xtVBoZlhyW8
 hci0RQwkG0hcifHM6m/MYCvK3udiZYKuSQB01lstcBddw3X8KafU59mlvfXaaqElu+6h
 7I29qGXK6t4yOgHPDuokvMhMKl2BeY5+8vW1Ur3hCbyHsR8od2C+kGc3S+L/1uNP0q5f
 avzJPzq37a0SSt3NOUhDQSMY6mjHfgZJqfcbn47sI0DoWV3hetbLj/NRWlwNJGjhfebt
 3YkzimmOqiEsKXBiOqes8EChLKmWuK51WUpYA1wir9LB+3A6j6kp4oRvgs97lh0h36ng
 zGow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=+9efFaSWX0HOPkTVAGn0fUi/WEpSl7fU0r3UNlJv0Kc=;
 b=oPCkdPrzIc8wLYQ0t2P3iN+QjT8bNxgwcXVBE8W+UYEvI4v5vBWIosBMbotBbNEQlR
 sGPSLVXhfNdzH1anPUVGWOSPJrBy8tGhULbqKDP1tPZAjLlU2EGoaI4L2ttbin2Dfses
 Le8sIcGK6lo1eI0krbzVCPdEqqbxm/U2aeYl5xRClIHx99Dm+dWjK83sS/rTBtbJt7gx
 WBOVMxqZ8gu2AfnpjYbuoFR8CTn9vfXY/9OM40Mh3tXNxHMLOvCiRyDpohdkHOyqFZm1
 /sLAUzODiQW19ZQ28jxbgImcBOdlLyvn49Z9Kly3YkqGaM7dINrBxw10nehDbIjJaHer
 e4mA==
X-Gm-Message-State: AOAM530zPCUvMTtut9pDm3e+5yoXlSvNDwR38u5uOREGXI8+/th+SokZ
 YUrfIP5PDrvrJ9cK+0UsWqRJVHCvvjuFfg==
X-Google-Smtp-Source: ABdhPJyFp2phIb5PXZesabXTcv/ItkvxGhJbiPJEbcVCr2jSMOkdW2LaKPc6zg4ApcqiTZvcvU8+Xw==
X-Received: by 2002:adf:f0cb:: with SMTP id x11mr1760594wro.206.1615849720897; 
 Mon, 15 Mar 2021 16:08:40 -0700 (PDT)
Received: from x1w.redhat.com (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id c9sm20174948wrr.78.2021.03.15.16.08.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 16:08:40 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/5] tests/acceptance: Add bFLT loader linux-user test
Date: Tue, 16 Mar 2021 00:08:33 +0100
Message-Id: <20210315230838.2973103-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since v2:=0D
- rebased tests/acceptance/avocado_qemu/__init__.py patches=0D
- extract has_cmd() from virtiofs_submounts.py=0D
- check cpio availability with has_cmd()=0D
=0D
Philippe Mathieu-Daud=C3=A9 (5):=0D
  tests/acceptance: Extract QemuBaseTest from Test=0D
  tests/acceptance: Make pick_default_qemu_bin() more generic=0D
  tests/acceptance: Introduce QemuUserTest base class=0D
  tests/acceptance: Share useful helpers from virtiofs_submounts test=0D
  tests/acceptance: Add bFLT loader linux-user test=0D
=0D
 tests/acceptance/avocado_qemu/__init__.py | 102 ++++++++++++++++++++--=0D
 tests/acceptance/load_bflt.py             |  54 ++++++++++++=0D
 tests/acceptance/virtiofs_submounts.py    |  59 +------------=0D
 3 files changed, 151 insertions(+), 64 deletions(-)=0D
 create mode 100644 tests/acceptance/load_bflt.py=0D
=0D
-- =0D
2.26.2=0D
=0D

