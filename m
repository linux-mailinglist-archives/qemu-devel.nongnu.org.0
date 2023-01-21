Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A4C8676674
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Jan 2023 14:16:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJDi7-0001qQ-Fu; Sat, 21 Jan 2023 08:15:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pJDi4-0001qF-GR
 for qemu-devel@nongnu.org; Sat, 21 Jan 2023 08:15:04 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pJDi2-0000Q5-T0
 for qemu-devel@nongnu.org; Sat, 21 Jan 2023 08:15:04 -0500
Received: by mail-pl1-x62b.google.com with SMTP id p24so7564566plw.11
 for <qemu-devel@nongnu.org>; Sat, 21 Jan 2023 05:15:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=MyDJ9xaLjNQNkkKZ7TUrwwCIg9MHqDreiMzzaIK0ViQ=;
 b=v5BSAqe/Yaj0c+weJf80tx4vBdWa42wn1/e097Zc8VM9OtzBpxhPCGYz6pTUEjci6E
 yjJZBHd6ttyxNRX/K+QLD0H+CRbiVhd4lKbxur3IfkpnqmwMNBjbSJP/1d1pJ9qs+Yf9
 CWgCkPVVolr4gEWa3Kh4jnnxELwvdyzDWFkR1r1gwkKmTErR4ijN690ZW2wBwOGUnjry
 ys6UMffhMQvfWIz6KsgzUkCcTNPwE7OoKrF+VHE8oDlcTggNiN9TD8LUKnFaVEhuqu44
 5xMYkeMs3MNX2XfGzdy8DDy0JlwwoJjqU5rThlWkyZ8jW8uADuiv+Xzdn5uL4jaqC27q
 1WOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MyDJ9xaLjNQNkkKZ7TUrwwCIg9MHqDreiMzzaIK0ViQ=;
 b=pShIUgKrW0a4vpxnBMUPAwNz0Cs7tWglE/+uQzTcxeDLOD6K3Wz2YlvrbcEa7ktr+d
 H7DocYAsr5r6E1ppNGJ+OBQrp5Q8rknFrpmRH+bfwuaKXPXaL6mDZl6PGj104c4Wq8qa
 3K6qyXn6Irkmkq5neaN6HDQy6Eqj+TGh+DLvNZ9u3Y0Quksaf3dOg+OBbw2oXUw5eBqn
 9ULEySASNSBRjMu7skSOvl0hgcse8oVRJxJMBm6+yYiU1kGlLPldfbiCNBxVGfFaINx8
 fLE1hcgqz+dSvdpkmAdSNnYxC6I/wWZfibd+8ZuredvDkYo80/TNbnq4MZQwZVqWcY0r
 dGrQ==
X-Gm-Message-State: AFqh2kqh7sLaDekUBSfUV9TG6Rb6maEfmB4oB4YOmP+dJW6sOywnbIkd
 GLNJCcRLgtIMcThCt1e8GVf+rvzAiZIrmnXHiR6qhg==
X-Google-Smtp-Source: AMrXdXuaGbUgg5Pc4zTC4JuQlCd/gvmiPtv6BPO7SCeZ4GWNAf0rL/Dny6afg4LvvtKdS6+Jp93E99BaahDtnfjRsbI=
X-Received: by 2002:a17:90a:c784:b0:229:2631:e8 with SMTP id
 gn4-20020a17090ac78400b00229263100e8mr1783467pjb.215.1674306900476; Sat, 21
 Jan 2023 05:15:00 -0800 (PST)
MIME-Version: 1.0
References: <d64812ad-5c7f-ac9e-bb87-ebc8451c3602@landley.net>
In-Reply-To: <d64812ad-5c7f-ac9e-bb87-ebc8451c3602@landley.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 21 Jan 2023 13:14:49 +0000
Message-ID: <CAFEAcA8zsvLErJXJZG+HzKzWjACO9RH9PRbO3XemxnP=6TZJvg@mail.gmail.com>
Subject: Re: Commit 145e2198d749 broke mips big endian.
To: Rob Landley <rob@landley.net>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Phil_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Sat, 21 Jan 2023 at 10:45, Rob Landley <rob@landley.net> wrote:
>
> wget https://landley.net/toybox/downloads/binaries/mkroot/0.8.9/mips.tgz extract
> and ./run-qemu.sh in there. Before this commit it goes:

Hi; does this patchset fix the regression for you?
https://lore.kernel.org/qemu-devel/20230118095751.49728-1-philmd@linaro.org/
("[PATCH v2 0/2] hw/pci-host/gt64120: Fix regression on big-endian targets")

thanks
-- PMM

