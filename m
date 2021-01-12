Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA54F2F3BAE
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 22:03:38 +0100 (CET)
Received: from localhost ([::1]:57700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzQpF-0004x3-AR
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 16:03:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kzQne-0003lS-VT
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 16:02:00 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:51806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kzQnd-0007lr-EV
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 16:01:58 -0500
Received: by mail-wm1-x331.google.com with SMTP id g8so3138972wme.1
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 13:01:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TOBGGpm+K+gkiUQ+Ey331bbthA4vSnrGqmpWQkRIjIE=;
 b=qmoi+fJ3itq48zzWleVY64/vKWqwkboKEaU2imYNz94VHKet5/9ExmGGujnNWEb6hJ
 C0mTwvj2U5f3KKtlt8bKUTef5RAyPG8DlO78etyUZTUSk90lJopByXs5OV58j8zDWVoH
 k+enfXhzjVJdT94N8d6RcyS/IONz4Ux4PWE0WPw/0s4NotZ3z4xEPxFQbCWlfdgjw63d
 eAI59j1g5mAjyOc2XlBgDCgQ87UC9InT45SCacTLdYbKqI0dH8vdUabQZTfaG6wVMIYC
 iDZKojFb6tOGArnYYaoynHioJQd8X22+9Ae94zWuhKQUR77aR1JpEEKljIJcwpZEiHBw
 R6EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=TOBGGpm+K+gkiUQ+Ey331bbthA4vSnrGqmpWQkRIjIE=;
 b=QXfWu/HTSK6OiqruvwtX7I/Uyd+O7PRF+ANGEz6Dk62K539D4A7hGKCwdFazUZxqG1
 gcSD18nJmiQJInRE9XCSJoyKOgdllTm5B0bKXJn7oxveGOGqAp1MjHcEp8aHIMNwFufW
 VUoavueWSwgeuXQZ1RLV+3CzMynPLSZra8UseXw9k8+RYbUqI1HEhZUkK4xEEJy5gikM
 k/SWFzzdwrkLHZsSDj/5ETFAlp+5at8Tr/Tl/OqqaQb88LlYn//hIHIU/N1eg1MZ5szR
 EGHdons4WZfH/90SYKG+0s1AUAyuklkCb97jIh3Afj/T3jN2lUkf6wv3lMzI5SpxEmUX
 Mjmg==
X-Gm-Message-State: AOAM5325oAoec9JYbX1cmgCJe1yBKLihclEqzUurK2qAOON++n6mpvFt
 jDId+Q9Y6e22o6BOsFqHWU2UyMKMsdo=
X-Google-Smtp-Source: ABdhPJxRFD3rhqzcSRv5ZtIphEYYHGMxZd4HsBboxVnYQSxi9ALWxWDLetVf7bSHQYZGqn7de8LLMA==
X-Received: by 2002:a1c:4684:: with SMTP id t126mr954756wma.165.1610485315303; 
 Tue, 12 Jan 2021 13:01:55 -0800 (PST)
Received: from x1w.redhat.com (190.red-83-57-173.dynamicip.rima-tde.net.
 [83.57.173.190])
 by smtp.gmail.com with ESMTPSA id z22sm5232569wml.1.2021.01.12.13.01.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 13:01:54 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] target/mips: Remove vendor specific CPU definitions
Date: Tue, 12 Jan 2021 22:01:49 +0100
Message-Id: <20210112210152.2072996-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Trivial patches to sanitize MIPS CPU definitions.=0D
=0D
Based-on: mips-next=0D
=0D
Philippe Mathieu-Daud=C3=A9 (3):=0D
  target/mips: Remove CPU_R5900 definition=0D
  target/mips: Remove CPU_NANOMIPS32 definition=0D
  target/mips: Remove vendor specific CPU definitions=0D
=0D
 target/mips/mips-defs.h    |  9 ---------=0D
 target/mips/cpu-defs.c.inc | 16 +++++++++-------=0D
 2 files changed, 9 insertions(+), 16 deletions(-)=0D
=0D
-- =0D
2.26.2=0D
=0D

