Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B864F3EFD8C
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 09:12:36 +0200 (CEST)
Received: from localhost ([::1]:36634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGFkY-0000aa-Hn
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 03:12:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laramglazier@gmail.com>)
 id 1mGFhD-0006H3-3I
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 03:09:07 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:33603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <laramglazier@gmail.com>)
 id 1mGFhB-0008Cy-Pt
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 03:09:06 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 a201-20020a1c7fd2000000b002e6d33447f9so2980730wmd.0
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 00:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hg6+KpJbnguAJ/gNGg9PINyByK29TuOzCc8uKqHAZlM=;
 b=NFP0ZfN/P19GTzUXmCjeLs1TIn+U9I3CAAVTMqfFlvDK5IS5LPcOL2xLYb63M+26dV
 TIBAwNF1P+T9UOpkZC7N7VCJO5Tcdxvx+e8UnO+HdLd2mBUaaxBVi001RDclgTAhofHs
 WadTy/7Jh8cfU4nkDi5rVGgbfb9KEUpItdE4+WM+L/OYp4pgtoYKGLHGyfWX7eSA0a3I
 /ijdVJHnl1uHJZ2ONmfd393iYOGUmrAAxLKyLmlIKKMH9GUTopj+7qt4N92rs2FHceGm
 2vSHX0PRQgjBrs9t5Zri21qcO/HAwuGI7KxNc+ODXU55fZyg4KMcDWZZW31FWyYm+XVU
 U7eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hg6+KpJbnguAJ/gNGg9PINyByK29TuOzCc8uKqHAZlM=;
 b=oEik2reBXTyl3TAT74yejHnXF9H2dvVvAf5PR5cZdIdppEQswiAh8zVS4WZBxG8PVh
 F7OqLnMkvPi1xtckTencWKDBqV3C66DV4oJV7JK6f0hCm5QPOarZ5JtiVgOcan2GZ8Xd
 k/RONwawMDF5SZ638rYGO3YMHDK2ZaIXHkddQrnC75cIhui7SDuTVyZgQ/N7dG3Fk5lp
 Q/lxIpK2YCBy2YJGWP1yIUnYP26axN9gSk/95OXvN3QUJhZ/MFCIm0gOezI78Zq8lNEb
 fDs/YDbA5wLl6CqyHfrl1+BA7UG2kWE1DADWjN7JxThAplrTu1GPafXfMDvsnrGA5+DS
 6j2Q==
X-Gm-Message-State: AOAM530e+84iTZHv++MeP/6qZI+qh7xQNY3a1PaTAK1AYCOgRyPbj51V
 cEIRwyQJxKQ2Z4WlA5rVs0phBmYq3lw=
X-Google-Smtp-Source: ABdhPJwzzPkGNsGgXPyzKc7C7YK4NmwMb2IWljn0qdWXijpFYyHKd4DWzpAccwcK4KIV34tH1vGOzQ==
X-Received: by 2002:a1c:2381:: with SMTP id j123mr7098271wmj.68.1629270543350; 
 Wed, 18 Aug 2021 00:09:03 -0700 (PDT)
Received: from laral.fritz.box
 (200116b82b53c5004989ea3bb9da8dea.dip.versatel-1u1.de.
 [2001:16b8:2b53:c500:4989:ea3b:b9da:8dea])
 by smtp.gmail.com with ESMTPSA id w18sm4902609wrg.68.2021.08.18.00.09.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 00:09:02 -0700 (PDT)
From: Lara Lazier <laramglazier@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/4] target/i386: V_IRQ masking and V_TPR fixes
Date: Wed, 18 Aug 2021 09:08:33 +0200
Message-Id: <20210818070838.44344-1-laramglazier@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=laramglazier@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: pbonzini@redhat.com, Lara Lazier <laramglazier@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Patch 2 adds VGIF capability to mask virtual interrupts.
Patches 3 and 4 fix bugs related to vTPR, while patch 1 refactors
int_ctl into the state structure to simplify the fixes in the
following patches.

Lara Lazier (4):
  target/i386: Moved int_ctl into CPUX86State structure
  target/i386: Added VGIF V_IRQ masking capability
  target/i386: Added ignore TPR check in ctl_has_irq
  target/i386: Added changed priority check for VIRQ

 slirp                                |  2 +-
 target/i386/cpu.c                    |  9 ++--
 target/i386/cpu.h                    | 18 ++++++++
 target/i386/machine.c                | 22 +++++++++-
 target/i386/tcg/seg_helper.c         |  2 +-
 target/i386/tcg/sysemu/misc_helper.c | 11 ++++-
 target/i386/tcg/sysemu/svm_helper.c  | 62 +++++++++++-----------------
 7 files changed, 79 insertions(+), 47 deletions(-)

-- 
2.25.1


