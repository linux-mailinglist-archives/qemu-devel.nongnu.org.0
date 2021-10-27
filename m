Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 870A343C136
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 06:17:03 +0200 (CEST)
Received: from localhost ([::1]:36504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfaN4-0006D4-GO
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 00:17:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfaKU-0004My-CC
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 00:14:22 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:52082)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfaKS-0003g3-L7
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 00:14:22 -0400
Received: by mail-wm1-x331.google.com with SMTP id z200so515257wmc.1
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 21:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gwRR0kuLG7fnaclPtlCAL5fZgzDG9n9cByX/vyjw9DI=;
 b=cVD2mSv8J1u/078qmZ91f6jgtM49jW92AHUY+2svqUWKCXOchfoVy1WnoLpawW6yh9
 ro8L5ttTLXkkCLoikrHtsneJZ8133hEIccv4wDWIQecQnjxw1wInCiA+D5kj7quuBVlB
 1qJRd/ZpPJG1fZkwLaVXhISAv1rj6feAtfMYc3PFVbahFKZQhCzU+KawlnZmnPBt3aBZ
 Sfx/fCy52fOX/Sqxe/enBxE1bk9Q5vM/iAW9ZMrykCZcMbDh4FfJ1Aq9wtvAIJH/cPPv
 bWQ63Jw7Vsqbe33lznjdmltyc7OTaDME0s4jJ2OfPCKRXufsnAPeraf35ZyqjhYQpyGy
 tfRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=gwRR0kuLG7fnaclPtlCAL5fZgzDG9n9cByX/vyjw9DI=;
 b=zy/8jhdBKyG1fpVFEP4HmzTwcBxBbQaUi+8E4qCRo86bqm+OyjUx5GTJzE0wUY1cfE
 RTl88t3dytE82tBrwcOdTkNIyFkgjgyPw9m0/7EeWg8aEiKe2OTbcfYXtGg9Co47F8Q9
 w4WCgDSrtK1qBEXTzm218E9BB6MLzdcbOWNpGjzJDj4uAAOFIrc0kodqUnyz131zoNGw
 qfCKgLg5xPyX+mcHbyf4+F40dNrPhrUh91eYKI/gHPP68Sb7YHEJbUj7/+6fX9an4TwX
 91H9pLWZ1prcGaqFxuauYupxAhibZsece/3vFdCEgMEWhr6DFQiu35bWTO+ooThOnPrV
 kygw==
X-Gm-Message-State: AOAM5337PmmSYUQmy5c4LNxz7ePjZuk6FTpHhYN7OAzhJMqwjl1KCpTw
 0d0eROpussjOo1XwK1p+BHp1K4aa2Vk=
X-Google-Smtp-Source: ABdhPJysfKQU8KzaYliBUHa839DewzjwWJ3pke04qxz6GuJj0J+8KxJU8RX4+v4z39X8Upw0xbkM1Q==
X-Received: by 2002:a1c:ac86:: with SMTP id v128mr3031008wme.3.1635308058873; 
 Tue, 26 Oct 2021 21:14:18 -0700 (PDT)
Received: from x1w.redhat.com (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id h22sm2455477wmq.42.2021.10.26.21.14.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 21:14:18 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/4] MAINTAINERS: Sanitize 'MIPS TCG CPUs' section
Date: Wed, 27 Oct 2021 06:14:12 +0200
Message-Id: <20211027041416.1237433-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: libvir-list@redhat.com, Richard Henderson <richard.henderson@linaro.org>,
 Paul Burton <paulburton@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move various files unrelated to MIPS TCG frontend into=0D
new sections.=0D
=0D
Since v1:=0D
- Do not add Paul without his consent=0D
- un-deprecate nanoMIPS=0D
=0D
Philippe Mathieu-Daud=C3=A9 (4):=0D
  MAINTAINERS: Add MIPS general architecture support entry=0D
  MAINTAINERS: Add entries to cover MIPS CPS / GIC hardware=0D
  MAINTAINERS: Split MIPS TCG frontend vs MIPS machines/hardware=0D
  MAINTAINERS: Agree to maintain nanoMIPS TCG frontend=0D
=0D
 docs/about/deprecated.rst | 23 ---------------------=0D
 MAINTAINERS               | 43 +++++++++++++++++++++++++--------------=0D
 2 files changed, 28 insertions(+), 38 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D

