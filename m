Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A52894DC52D
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 12:58:58 +0100 (CET)
Received: from localhost ([::1]:55634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUomP-00025E-CC
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 07:58:57 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nUokR-0000BD-F2
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 07:56:55 -0400
Received: from [2607:f8b0:4864:20::42d] (port=33366
 helo=mail-pf1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nUokP-0008Dy-Hw
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 07:56:54 -0400
Received: by mail-pf1-x42d.google.com with SMTP id s42so6703422pfg.0
 for <qemu-devel@nongnu.org>; Thu, 17 Mar 2022 04:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZcAv85sTRWpiVkt1YI+h/MseEyNVchFMFrYcVAwiHsY=;
 b=bqXkXhpExRCCvTs6EbfYpTG/HgLWnFaqLF0y5ZQl+VPILlbKwwWu8GQro8pSoYQww1
 isuHOlh3RkFpcYdfEAeTJZmW8s8L/bgiNTtWcy5qUCMMbdwVhEADtNQdxUR3oi/KQlIS
 TqWr1i7rtkzqcW28ch+eUBxlKcGKD79SuMgRqFjckiNd7xrRgv1qfQ+13Mxuwa7cWnP7
 H3LTGhn3Loa1EgEVu0pZRaILSv87+jR2UcyyAhW4aMQamm92gkgewECza3g6J3y/ahBD
 yNZcKIfAlMM5aWNlzy0WFXuJB6AehBDYDtmYSye/tlMsvMa98VdJPYSbr54j/8L2BDpI
 wUIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZcAv85sTRWpiVkt1YI+h/MseEyNVchFMFrYcVAwiHsY=;
 b=uLoH0b9vywwgjXZZcMKjlFC00RxVmFmkdL1J8zB3WXc4N70OXxA6AqDzLIwwDHthOb
 u0NQvnjpZFQHPJHpXqYiH+9R8jKzkcPU/o5PmPXaLp5mAhhJFMsfgqzG8S/RX5nhLOLN
 YhS8YGRC6OVDYXZgPNnOyYtW6gUrjmhHVW4laZzjcA95UBTQoJZFWFXf/GOKeLF5xbI4
 WL1nVqxZH38WZxH1n6YimtPBJ5N5n3TnlFJVJBw0YIaqsE0n+qaPGGQlPw/xOkYEF4+F
 ayIqLjYqVv0/JdymN/o2J7y9NvEJI1E4OOY3rgC1JibjIgDnkpBde8pf5J6mf6PV3LOx
 FnrQ==
X-Gm-Message-State: AOAM531wB/KDRb1b3llJd4KlZ33tz70grQ98p6yozTg38pbbnvVL4puH
 lQ+s8rJrvaxnOrQZPJ9o9vjEQi/iFlY=
X-Google-Smtp-Source: ABdhPJwk0MEj8+Rs1JsYI9xeHmid6scsQAFRybXkJElGLYjOfFnIcKo3KRFYZ2ZIsWhRbSQa8YE6Vw==
X-Received: by 2002:a63:e70f:0:b0:380:d919:beb with SMTP id
 b15-20020a63e70f000000b00380d9190bebmr3434633pgi.58.1647518211941; 
 Thu, 17 Mar 2022 04:56:51 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 p186-20020a62d0c3000000b004f6fa49c4b9sm6262667pfg.218.2022.03.17.04.56.49
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 17 Mar 2022 04:56:51 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH-for-7.0 v3 0/2] cocoa: run qemu_init in the main thread
Date: Thu, 17 Mar 2022 12:56:42 +0100
Message-Id: <20220317115644.37276-1-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x42d.google.com
X-Spam_score_int: 23
X-Spam_score: 2.3
X-Spam_bar: ++
X-Spam_report: (2.3 / 5.0 requ) AC_FROM_MANY_DOTS=2.996, BAYES_00=-1.9,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Akihiko Odaki <akihiko.odaki@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Since v2:
- Extracted code movement in preliminary patch

v2: https://lore.kernel.org/qemu-devel/20220316160300.85438-1-philippe.mathieu.daude@gmail.com/
v1: https://lore.kernel.org/qemu-devel/20220307151004.578069-1-pbonzini@redhat.com/

Paolo Bonzini (1):
  ui/cocoa: run qemu_init in the main thread

Philippe Mathieu-Daudé (1):
  ui/cocoa: Code movement

 softmmu/main.c |  12 ++--
 ui/cocoa.m     | 152 +++++++++++++++++++++----------------------------
 2 files changed, 73 insertions(+), 91 deletions(-)

-- 
2.34.1


