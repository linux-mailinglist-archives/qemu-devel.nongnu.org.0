Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8820649D499
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 22:36:42 +0100 (CET)
Received: from localhost ([::1]:52766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCpy5-0000O1-DP
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 16:36:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3a7zxYQcKCsA1ktz0xkmuumrk.iuswks0-jk1krtutmt0.uxm@flex--venture.bounces.google.com>)
 id 1nCpuq-0006LR-QT
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 16:33:20 -0500
Received: from [2607:f8b0:4864:20::b49] (port=43894
 helo=mail-yb1-xb49.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3a7zxYQcKCsA1ktz0xkmuumrk.iuswks0-jk1krtutmt0.uxm@flex--venture.bounces.google.com>)
 id 1nCpup-0000Yw-CO
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 16:33:20 -0500
Received: by mail-yb1-xb49.google.com with SMTP id
 g67-20020a25db46000000b0061437d5e4b3so1784819ybf.10
 for <qemu-devel@nongnu.org>; Wed, 26 Jan 2022 13:33:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=fmgrUCJzEHN06qSwVGOzXUmjqBv9CD9Hh/Ruv2P7wp4=;
 b=JbbrZdhVSm9YZkFxIGy3UY+c/UkRkJi4RfnudxeZEmeZCUfcU7yZ+aCxO5hLmzFq/b
 9OAiTjmD7lRDwA/wkgmGagNs34Iu7QZxsu4oXo+oxE4qQHMMGv8lgNVAgyUAbZlYKiGZ
 PLKO0qnUe/mclp9TAmuYEVSa+9Xj24Ph31jligOlN2V6yvf4ZreCHI0AjJhdoPLuuZ7n
 eIQyOvF4IRU0Z4owmNT0fma6nuSyMIr/l1b0LwfrRzHuCxpPCKXVyJcp7pOemBc8qWoK
 Y65CO4HAZGkEX/3cO/HAlBW9mtE2yOUJ29gJ8wovZhVbO6lUqDf/TyxViKFwXkkJA08A
 HVPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=fmgrUCJzEHN06qSwVGOzXUmjqBv9CD9Hh/Ruv2P7wp4=;
 b=gCpmGAb5MFaBp0USIxkD0Ti839DiA4W5gj4bIWmRKOqdHRhH238X1/QU1bSMZc38RR
 UcnsZDd8pOwUTGgNAxYQ/uWynBJtb6aCiKAbtdw2HM13OqJpVonfhH1eB9fKUWi3z90W
 pph8c0x0+ryaWoTk3GgIFheK+yJEiBUilVHlmyHAlpB7YN5FCpbvRwS41uYmjDBUaScJ
 qcOV3OGHwyVHwweL9qD4U53uHvVykTx50umc7x2KWr+gyMLxvGWheVnkQlYya2bA1MmN
 jveMV4kjN9/lUiR9P5yv63ck29NpsYXItQE/EeT8vXq6NpJTuW2ddPvb8OBvICdhotlD
 8RWw==
X-Gm-Message-State: AOAM5325vL53YVifCIa9rIv6vUYuq8hzZxE7RiN1CgNV+2YbEEzrzpWM
 zHyqrg7RCt5XPDTTvJWo4PdEipURNvH/
X-Google-Smtp-Source: ABdhPJy2QtkVXxFimQC+IZjzVhb0LdIQpcgQ0je1hhbQqKBzsLzskukyRO+ytygSUlTdziIaeBHPYb7/pHdz
X-Received: from venture.svl.corp.google.com
 ([2620:15c:2a3:200:c75c:8ce4:97cf:a279])
 (user=venture job=sendgmr) by 2002:a5b:b:: with SMTP id
 a11mr1125133ybp.393.1643232363020; 
 Wed, 26 Jan 2022 13:26:03 -0800 (PST)
Date: Wed, 26 Jan 2022 13:25:57 -0800
Message-Id: <20220126212559.1936290-1-venture@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.35.0.rc0.227.g00780c9af4-goog
Subject: [PATCH v3 0/2] linux-user: check read permissions before how
From: Patrick Venture <venture@google.com>
To: laurent@vivier.eu
Cc: qemu-devel@nongnu.org, scw@google.com, 
 Patrick Venture <venture@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b49
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b49;
 envelope-from=3a7zxYQcKCsA1ktz0xkmuumrk.iuswks0-jk1krtutmt0.uxm@flex--venture.bounces.google.com;
 helo=mail-yb1-xb49.google.com
X-Spam_score_int: -87
X-Spam_score: -8.8
X-Spam_bar: --------
X-Spam_report: (-8.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In sigprocmask check the read permissions first before checking the `how`.

This is done for both: TARGET_NR_sigprocmask and TARGET_NR_rt_sigprocmask

v3:
 * Added missing signature from venture
v2:
 * Update code style during code change
 * Also update check order for TARGET_NR_sigprocmask

Patrick Venture (1):
  linux-user: sigprocmask check read perms first

Shu-Chun Weng (1):
  linux-user: rt_sigprocmask, check read perms first

 linux-user/syscall.c | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

-- 
2.35.0.rc0.227.g00780c9af4-goog


