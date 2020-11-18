Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FFD62B7B15
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 11:21:39 +0100 (CET)
Received: from localhost ([::1]:57052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfKao-0001li-5O
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 05:21:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kfKZ1-0008TY-B4
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 05:19:47 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:43785)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kfKYz-0003ea-2t
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 05:19:46 -0500
Received: by mail-ed1-x532.google.com with SMTP id q16so1376784edv.10
 for <qemu-devel@nongnu.org>; Wed, 18 Nov 2020 02:19:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kKOZV4H+Rb4UxhsVAweT4jg+C6owtYn3IOkHdqTi6DY=;
 b=axnP2HY5WTP1gx8qGPwIlTzXc9C0hsXsATTqMRQ4RicbfoXkCVQjByb08sjM3vlxLR
 eibZseo7VVtM2hUJhxlPwt5Zb93DtueGpPN9WJaEAP04MOPuwXOJf6s0zFGIE5QQqDYx
 eUXphvJkVljzP9fitgbYkkmvJ9Fo/223qkhqorMkKSibR020YdCb/E9kKpmJB5KWyT+y
 HVsyWcFOK2kzurARnmo/KGkVNK7c20JzsuGh4SXCjUN9tYkEF8C27Blqn9/nC2Ch03k1
 oQLCbbD6Y9KbzyyTfE52CEhZ68HeUdRQt17UMpkst55jXl460m6VA9GpW3n0mmc6FuXr
 d0EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=kKOZV4H+Rb4UxhsVAweT4jg+C6owtYn3IOkHdqTi6DY=;
 b=JEPNgdxwSteWUsPurdSQtPeECvcy88HrJfoDoH59WspCersY1RXcQa8WDI6+j8dMUK
 Mt46nxaGrPWVD7No9aH7BasicZS4u57XIBw6kaY/t37fo4NZunW3uGn93bVnpvFwD874
 /hiXQxdcDsyWOZz/zwSfTPC80p0iFVLktDhMEMupHA/TLQJr/C88i1XIFa80HC8a8cn3
 eBVj1S6N3/jny2CpRiFlleKamH7Q6INFI/4RT9x1Wl9S/CEsCpa88+ovMncAniFX9hRv
 avKTOm71HraM91teYvn42CLyl7yn6PzWWFEPt2n/UsFNjFWtuqfGXxdY1XaTr+rVOFXM
 rUwA==
X-Gm-Message-State: AOAM530nxrqbgUQS1ahIa0BCAmHHun1QNHkcf+/2FH2k8x3lunYdlvqk
 trttrc4rZpyQZZRwQCOvT1k7yO9sYGk=
X-Google-Smtp-Source: ABdhPJztTiSKPkS3AD9XmZTHWZo2sAP32Lnn7DqV4VGFKO8061bGaz/+KulqFn55Qafhud3xJbkmDQ==
X-Received: by 2002:aa7:da01:: with SMTP id r1mr25779030eds.45.1605694783114; 
 Wed, 18 Nov 2020 02:19:43 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id f24sm13230052edx.90.2020.11.18.02.19.42
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Nov 2020 02:19:42 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/7] HVF and Windows changes for QEMU 5.2-rc
Date: Wed, 18 Nov 2020 11:19:33 +0100
Message-Id: <20201118101940.132594-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x532.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 66a300a107ec286725bdc943601cbd4247b82158:

  Update version for v5.2.0-rc2 release (2020-11-17 22:58:10 +0000)

are available in the Git repository at:

  https://gitlab.com/bonzini/qemu.git tags/for-upstream

for you to fetch changes up to 29cf16db23e605769f6d89c47a1d45ef3373b88e:

  buildsys: Help git-diff adding .gitattributes config file (2020-11-18 09:33:16 +0100)

----------------------------------------------------------------
Bugfixes for HVF and Windows builds.

----------------------------------------------------------------
Jessica Clarke (2):
      hvf: Gate RDTSCP on CPU_BASED2_RDTSCP, not just CPU_BASED_TSC_OFFSET
      hvf: Fix segment selector format

Philippe Mathieu-Daudé (1):
      buildsys: Help git-diff adding .gitattributes config file

Stefan Weil (3):
      meson: Fix argument for makensis (build regression)
      docs: Fix some typos (found by codespell)
      meson: Fix build with --disable-guest-agent-msi

Yonggang Luo (1):
      meson: Fixes curses detection on msys2

 .gitattributes                |  2 ++
 docs/can.txt                  |  8 ++++----
 docs/interop/vhost-user.rst   |  2 +-
 docs/replay.txt               |  2 +-
 docs/specs/ppc-spapr-numa.rst |  2 +-
 docs/system/deprecated.rst    |  4 ++--
 docs/tools/virtiofsd.rst      |  2 +-
 hw/vfio/igd.c                 |  2 +-
 meson.build                   | 13 +++++++++----
 qga/meson.build               | 36 +++++++++++++++++++-----------------
 scripts/nsis.py               |  2 +-
 target/i386/hvf/x86.h         |  8 ++++----
 target/i386/hvf/x86_cpuid.c   |  4 ++++
 13 files changed, 50 insertions(+), 37 deletions(-)
 create mode 100644 .gitattributes
-- 
2.28.0


