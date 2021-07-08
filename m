Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 339053C1762
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 18:49:33 +0200 (CEST)
Received: from localhost ([::1]:58636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1XDQ-0003iL-7W
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 12:49:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m1WPF-0008Qn-3A
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:57:44 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:36364)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m1WPC-0003ot-T0
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:57:40 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 t14-20020a05600c198eb029020c8aac53d4so19953043wmq.1
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 08:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tIse2WmVqn1P3dM3vTaRYwRUAGuKzmQxu4FnzrKUDJ0=;
 b=c0omBZmF22+HBXLmCFpKcgJLJBIAFikNil5I1hCvdQg5uCXhPgHRUbbkyfbIOxa0aj
 faNYd970LpQrUpDDp0a9mPq83JB/I+GcEVC2p0P2l5Fbc+HSifxMZwVzg0daViOPIEz5
 ZHwruxgnnRt7R/USLpFZy9FklY5nFTCc3tYkwcKbuFYJfWBmoMtjPe0DC8KVFbwsUBsS
 eZPlUHuJXQeqF434IEqOVZi9+pQH56hRqVsrBeTHKWgfX5TqShftQHyXNZlt/mMH7Wck
 8FCZnwmN0FS3KHQoGv8viC8Vb3SsBE3dpV5wYmKQajiGNLMTV4RIVoXYHXf6tkGuCwzL
 uaPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=tIse2WmVqn1P3dM3vTaRYwRUAGuKzmQxu4FnzrKUDJ0=;
 b=W80s7rhqIMztGho7rEHtC6WbI24vFUZAHG/9KLWv3EyfBw8dyHIWFJVEBN10heLrEc
 xq+51OK+KYRwwsuSU5+8j6CE5YUfEFVctR0Qaqze9UY6XFms7eymwtOUmzEZFXuogY8o
 fsre63ytyI0tMjJgXRvvMWqGF9XCH6TZtNCdmLkWCfDf+tt03iGlnzgTqqT7ds3BAZUZ
 Fm3TL+5k/hqIiZkJuB5DQPeFi+8nU6F9h1SjgUY2HV+fplfXM+gopOS6Nkv1Pe6+zpc8
 D/tZEPqmZmtwNh2qG6s5hnvqyEOwoG84wa8VlY4knrkTsxE1XO2cD/CQoiATHYh5BmPa
 iSYQ==
X-Gm-Message-State: AOAM532VPZipo1qOnEJ1c77SZyP+froPzHFEEMAL45h9uTspgKm9WDew
 nQqjQN0aA3KLsWFEXNSjjVuFSZTrlNM=
X-Google-Smtp-Source: ABdhPJx7BxGEmTZSBducQP/cno20YMFCFin61d7/eSH4mrCo2HT3ko7CxeHd2fjZGP94QgQYQVeIXQ==
X-Received: by 2002:a05:600c:4f11:: with SMTP id
 l17mr6086983wmq.121.1625759856876; 
 Thu, 08 Jul 2021 08:57:36 -0700 (PDT)
Received: from x1w.redhat.com (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id c16sm2515081wru.24.2021.07.08.08.57.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 08:57:36 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/2] coverity-scan: Add accelerator and sysemu components
Date: Thu,  8 Jul 2021 17:57:33 +0200
Message-Id: <20210708155735.1805767-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add 'sysemu' component for issues not related to TCG.=0D
=0D
Since v1:=0D
- add accelerator components (Peter)=0D
=0D
Supersedes: <20210619091342.3660495-1-f4bug@amsat.org>=0D
=0D
Philippe Mathieu-Daud=C3=A9 (2):=0D
  coverity-scan: Add a component for each accelerator=0D
  coverity-scan: Add 'sysemu' component=0D
=0D
 scripts/coverity-scan/COMPONENTS.md | 17 +++++++++++++----=0D
 1 file changed, 13 insertions(+), 4 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D

