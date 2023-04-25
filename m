Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F042B6EE44E
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 16:54:29 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prK2b-000372-8J; Tue, 25 Apr 2023 10:53:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slackuj@gmail.com>) id 1prK2U-00036V-00
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 10:53:06 -0400
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <slackuj@gmail.com>) id 1prK2N-0002wL-IC
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 10:53:01 -0400
Received: by mail-qk1-x732.google.com with SMTP id
 af79cd13be357-74e462a540aso171149485a.1
 for <qemu-devel@nongnu.org>; Tue, 25 Apr 2023 07:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682434377; x=1685026377;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=quM4BszjL5SRm4rmqC+aETMtuijMETs6ElMJDFF+cII=;
 b=mCPi68rGH/OHNOLqUkc/25SAjRQR4Ms1CSA3SjM53MZIa5+nIeGKH+YCqEBwTV7XzG
 Ww6lCAVBmHgT21FLG7SU97i5EVY6SBgNlGyMOyEFgpHppzC3LLsxOt+6kgk7Cw8Am8sG
 niPchfC91UF5McE0QV7dBl8tvSbc/+PPMDAxCH3vMiStQSiNXTqox3J3mrX0a85NlcMF
 a7eO3XTX5a/o9Bh/sfjMU59a+2QNDuDsQdqmuw+mwHGLnpvXyc/BfjN3RPdRZCkyObHu
 OsxrbGDg/yf1902Bqo5C80bFqLVDXJQLFM/WepvaGphzFlXIVm3QUTszCfaMSffkXvZo
 60ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682434377; x=1685026377;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=quM4BszjL5SRm4rmqC+aETMtuijMETs6ElMJDFF+cII=;
 b=Jn+jJaliygi3JkUstS9cHNosTXS/o2OofTuhwD1RuQ87kaSV/Ob5yrVpwv36oQpsEH
 5r2IHmzRcHtrYOw/Tyv5+7T7BFiUoSs3WX3ofp7FvP9ebEiq3UYX8MFkBoCmMSx5WbD8
 UumR42VvqrwbME+pjqupF/67lCe9OpsGdIpLoiMaD9F5rTonth59ngFUwgX59tF5d9n2
 7YdRe4tiAnUCfLW1tmuSklCttBGKFgX42pIcbvPDGBRUQkwNkwLsVbgbOfwnRgMsSkHw
 Yeqa+OicLVoldfSB885KnOt3NR9Hy7E4dELL14k+sPGe+FEWbnrFKY9fTEkXYs1hLwk6
 MWIQ==
X-Gm-Message-State: AAQBX9eKq10qbErLOrxM91hC2NEqRaIusDE9NMZ+c9cpa7WdKcwlU2cW
 rAQyhmYjUk7uzRee7081RXkyB5N+iI5sawoGj+zMHBDYFb4=
X-Google-Smtp-Source: AKy350b8dgpKLZpk0L2MopHG+6tTSUdu+WoktLcKCjpwpKDKBF8lo9aqICb8glOc8E5MnH0z6IkqfOBkQQ8knjfYJ+E=
X-Received: by 2002:a05:622a:1194:b0:3e8:eabf:d63 with SMTP id
 m20-20020a05622a119400b003e8eabf0d63mr29238567qtk.0.1682434377300; Tue, 25
 Apr 2023 07:52:57 -0700 (PDT)
MIME-Version: 1.0
From: slack uj <slackuj@gmail.com>
Date: Tue, 25 Apr 2023 20:37:46 +0545
Message-ID: <CAK=ON75xtxvmKRuKz3VOni3cmo2PjzStGUPF_iPzM0vbYH66UA@mail.gmail.com>
Subject: newbie
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000006abd8605fa2a47e8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::732;
 envelope-from=slackuj@gmail.com; helo=mail-qk1-x732.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_40=-0.001, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--0000000000006abd8605fa2a47e8
Content-Type: text/plain; charset="UTF-8"

Hello World!
I am a total newbie!

--0000000000006abd8605fa2a47e8
Content-Type: text/html; charset="UTF-8"

<div dir="ltr"><div>Hello World!</div><div>I am a total newbie!<br></div></div>

--0000000000006abd8605fa2a47e8--

