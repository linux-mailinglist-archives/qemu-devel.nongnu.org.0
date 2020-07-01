Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8126211055
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jul 2020 18:13:53 +0200 (CEST)
Received: from localhost ([::1]:42406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jqfMu-0000Zq-La
	for lists+qemu-devel@lfdr.de; Wed, 01 Jul 2020 12:13:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jqfL7-0007Cj-PJ
 for qemu-devel@nongnu.org; Wed, 01 Jul 2020 12:12:01 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:53467)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jqfL3-0006G8-Tj
 for qemu-devel@nongnu.org; Wed, 01 Jul 2020 12:12:00 -0400
Received: by mail-wm1-x341.google.com with SMTP id j18so23022160wmi.3
 for <qemu-devel@nongnu.org>; Wed, 01 Jul 2020 09:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BBffCZL4rhQjmLcb7DbSXKvb7rWt+5qOaQZPKAkL8/s=;
 b=ITFugC/2DGnizkOpFZy+T/jSMldMEDDF2DDE49rW9ozyRLMkBDd+G49Pmq2S56wa6F
 28aVHs2wDhsnAwiOhrIPkBRTc49Vm8I7Fy1ZmraH7We902RrKfrco/KI1jmZeocZuGFv
 aFUS/d+JmvHg1L9Zmr3NlXfcTliEERspxkjLhe32Lq5/TinxP4MIZAjW4u/v1He1wLcK
 o7pdaljxE0JxFLeF7g2tKg0r0BnfHNk65GE77L7Lp9SW541qLDBR5/fq0SKymnFnpHHx
 F5lFLkrCwj7zWGxZRoKuCpnjByOxqHOo+1m2UF2CcNKkkV7x8gB9qoPcciwqQZqDrJbc
 ZXuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BBffCZL4rhQjmLcb7DbSXKvb7rWt+5qOaQZPKAkL8/s=;
 b=FBwqsTkBVUIluZOJ1J0Y5Xq3sPCxQDurtvoDUurQih/C+zpvjAlY6MGLVpLVkE/ZFm
 BXDmjoGf3w3cNlobRM2h5TAkOPLvZFjXgr/f36lS5dba2TZ2nUu7QTtuJ9mS4PIYmxyG
 0i9bIlSD9QpI1+jpd2K9RsMcnWTfSioL/z5KhYGLJ9VycQU/DU0/c4enfxbwdlFwkfXb
 qutCHNPvUx8S4ywUP/fPYSW5UK8GvCcXjOcv5VALBnnHvXz8xCa0d86dgQafaOkRI15T
 r5wUswtcVP6jr2WYMu5UnDtEH91d+MBucJVNI3br0MsZG0wRRO1qNToFw7F1hvmqH/Tj
 L/5g==
X-Gm-Message-State: AOAM531zowccIdGe7X1jc5f1OQXVIkLdN4/QSWpSZm9cZdv8kHI22Veb
 D9ZoVLaXi8+E5XYXg108t5Hcvg==
X-Google-Smtp-Source: ABdhPJzFf/bFScomuNamQLqX//6ceS2shTKmFGPGOl9j72G0izx/z3xRi+XsymZeFOVvl6WsOwfCwQ==
X-Received: by 2002:a1c:f203:: with SMTP id s3mr26509643wmc.126.1593619915617; 
 Wed, 01 Jul 2020 09:11:55 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id q188sm7568465wma.46.2020.07.01.09.11.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jul 2020 09:11:54 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 524851FF7E;
 Wed,  1 Jul 2020 17:11:53 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 0/3] some docs (booting, mttcg, icount)
Date: Wed,  1 Jul 2020 17:11:50 +0100
Message-Id: <20200701161153.30988-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x341.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

This is the current state of documentation patches. They didn't get
much review the first time around so I present them as a series. I
Think we should merge them unless anyone want to argue they actively
muddy our document situation?

The following have no reviews:

 - docs/devel: convert and update MTTCG design document
 - docs/booting.rst: start documenting the boot process

Alex Bennée (3):
  docs/booting.rst: start documenting the boot process
  docs/devel: convert and update MTTCG design document
  docs/devel: add some notes on tcg-icount for developers

 docs/devel/index.rst                          |   2 +
 ...ti-thread-tcg.txt => multi-thread-tcg.rst} |  52 +++---
 docs/devel/tcg-icount.rst                     |  89 ++++++++++
 docs/interop/booting.rst                      | 159 ++++++++++++++++++
 docs/interop/index.rst                        |   1 +
 5 files changed, 284 insertions(+), 19 deletions(-)
 rename docs/devel/{multi-thread-tcg.txt => multi-thread-tcg.rst} (90%)
 create mode 100644 docs/devel/tcg-icount.rst
 create mode 100644 docs/interop/booting.rst

-- 
2.20.1


