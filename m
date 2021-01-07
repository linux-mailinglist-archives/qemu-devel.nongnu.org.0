Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0561C2ECDB1
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 11:22:07 +0100 (CET)
Received: from localhost ([::1]:41884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxSQf-0001Jf-Hy
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 05:22:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kxSOG-00081i-8t
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 05:19:36 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:35475)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kxSOE-000506-NT
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 05:19:36 -0500
Received: by mail-pj1-x1029.google.com with SMTP id b5so3437639pjl.0
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 02:19:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dv3dQJ7lJ9YDzuYE4z77unIhArNvQJZ5y4A8eoaBZHw=;
 b=pCvMqCGX3kSLaiWr+hdEhUtCAUCKss7vJYE6nrEAiyzxd8hKuqw+P4tIgJtbX1csrw
 Eof+RNTEQl3C9I+E8vy0E0WmfSZMPGvURH5lLT/zJg9euFinIZiORQjkm6bS4Hyhlw5b
 vjF2UyyfCpts5v8WJ9dqp4XTISqvQOagfUyOSOBUXjlduNUz5qsPUIbMpPPcVmiXAKcW
 nf0TBVPuXY8Q/i7rPZEP+w7jQjVzuSjmorQmc5rVbSy7MzYJl7CGVbTAPyt43FEa03bV
 E3wrVVVARtap/YbnuRhe4XVoGPskeFkl20pw94zM9/iOxJ9hvzwk+7pXmh9wBSZpguDw
 0djw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dv3dQJ7lJ9YDzuYE4z77unIhArNvQJZ5y4A8eoaBZHw=;
 b=Edi4ZwTFIAmNci1+SZul0aKaYNGdo4+F/wl/QD59oirKIYj1lKdit3GgDSLxZmuNLf
 cX1f237wMuUlnx6Zw6bqGif2SaaztySpo8qOIT5fBqk8A3kaByA6W9MaMtlNvItEkFUn
 2wgmju7A+PPU5yfvb31NYLAt6BMLUoajImU4jAFICF6y4qpPi1g4hgFj3lkB1vPMhL2H
 Cfzobe7Fm69KfB3LmG2Ym/KkhmbPYfCMFm9Qx3ryLWAtdg1SZDF1Geqhw7WCBy9QQPFl
 fmopWRVs8DSP0Ei7dSvarGzefEAM8HIbu+B5aDtb3i6kHo1hZ5xZ6MH3enmp++jjLt2F
 7thw==
X-Gm-Message-State: AOAM533ENQbvh7S4cK2JOiT1DkBeebkX5sc3QIknVt9mrtvr5wzAVizw
 xNGvjjjc/Zoaq1xC/67YlH0c81tNMnrQcM93
X-Google-Smtp-Source: ABdhPJx+9IqnR8D/I0mrE1GVZFEZNu5m04wGvRQM8da8NLWsRKu6k1kAo2EYbbNNERMgZGcpq1HzTg==
X-Received: by 2002:a17:902:c583:b029:da:b32c:cf9f with SMTP id
 p3-20020a170902c583b02900dab32ccf9fmr8616104plx.44.1610014772880; 
 Thu, 07 Jan 2021 02:19:32 -0800 (PST)
Received: from localhost.localdomain ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id s5sm4934662pju.9.2021.01.07.02.19.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 02:19:31 -0800 (PST)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 0/5] Misc meson fixes along test-vmstate fixes
Date: Thu,  7 Jan 2021 02:19:14 -0800
Message-Id: <20210107101919.80-1-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.29.2.windows.3
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=luoyonggang@gmail.com; helo=mail-pj1-x1029.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, Ed Maste <emaste@freebsd.org>,
 Yonggang Luo <luoyonggang@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

V1-V2=0D
Fixes whpx: Fixes include of whp-dispatch.h in whpx.h by=0D
  the suggestion of Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>=0D
Add new patch whpx: move whpx_lapic_state from header to c file=0D
=0D
The test-vmstate can be passed under win32 too=0D
so enable it on win32,=0D
This is based on Bonzini's upstream tag along=0D
=0D
Yonggang Luo (5):=0D
  cirrus/msys2: Exit powershell with $LastExitCode=0D
  cirrus/msys2: Cache msys2 mingw in a better way.=0D
  maintainers: Add me as Windows Hosted Continuous Integration=0D
    maintainer=0D
  whpx: Fixes include of whp-dispatch.h in whpx.h=0D
  whpx: move whpx_lapic_state from header to c file=0D
=0D
 .cirrus.yml                  | 119 ++++++++++++++++++++---------------=0D
 MAINTAINERS                  |   6 ++=0D
 include/sysemu/whpx.h        |   9 +--=0D
 target/i386/whpx/whpx-apic.c |   7 +++=0D
 4 files changed, 84 insertions(+), 57 deletions(-)=0D
=0D
-- =0D
2.29.2.windows.3=0D
=0D

