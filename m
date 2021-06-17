Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 107583ABAED
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 19:53:43 +0200 (CEST)
Received: from localhost ([::1]:60776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltwD0-00010x-4j
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 13:53:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltw6C-00032Z-Fx
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 13:46:40 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:34476)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltw6B-0002oB-24
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 13:46:40 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 u5-20020a7bc0450000b02901480e40338bso5283393wmc.1
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 10:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=J7L2MFPMWas0GMRTQzdq8uvVPo/6FafEKTNPt9VsL5A=;
 b=h9aKmt5K8jnBh1C+0v2cLbZHF3O6WbtuTkdXzjcNVnwAdIIgU0mr3x5pe78xaYLkID
 D+v6u+T6oGSoLZF3NB0hG2wl9Lc1dyMpwVfL+GoMKSklfsjlpBX9sOtn9FuAsWVK/JAu
 bqYac4LfpSq2Jq/2kVS/JsjgcxfJCiOXcyPFXGKbk6wZmkG5S0dP9LgG2VaNgsyYzvU5
 ymG3VIUc59pibKmUurbTF0UUoMM06yLOm7DvNOItoPorLhqKRDXrlh8W6PDYWI93WKWM
 jRxV1ewDlb6fBurdNYnbxltef4cy2eyqFifefsgK4c/kMjvQn7WBEYYKUuPdJhSYW1i7
 qbbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=J7L2MFPMWas0GMRTQzdq8uvVPo/6FafEKTNPt9VsL5A=;
 b=sA8ZN7cu1W6IuWWytlzB8d/ZVKSefOxedrq91KY8J9KuX8s9Y5r9g5Bl1SLN0sfCbB
 ljcepZpa6V8h1qp87cnpAvnMYf2vEiJ5DqGW0rMaQ8r9gMRfqyrH3R5xDp7RbrqxRfe4
 90a8FR7ss6DzIT05xwzaUFLCG+csIhKMO+eI+C8U+nOW/mxzZwdYNd6iig3i7z5Q9Oi4
 eOXY100zFS7Imvaw4E9pGHqT9/PwUi8KB3wOkB/XAq9Ym8vNoQJLplsIjAiDxuv3RS60
 /f5l6I/skmSlSUKDsXMdvg4Y1ahq/WMZxZMFKhmrRRN21+ORs7dImz98MSWwiHyGWME0
 7OaQ==
X-Gm-Message-State: AOAM530O0gW4PRcTWc/PXzBfB0wijdP/wXVkNO5nw1T/hWc1EvrtyUG0
 E/R1rgA27HJMu4vIIgdgbNkUYgVh342ieQ==
X-Google-Smtp-Source: ABdhPJwFXA9sIZIjR2QoMTvJusqK5xSu7ytnacjJOA5rFg1HfUjJ34WC6RsXmBYFHkGcB9W9Cun+NA==
X-Received: by 2002:a05:600c:2207:: with SMTP id
 z7mr633727wml.177.1623951997667; 
 Thu, 17 Jun 2021 10:46:37 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id l16sm8911590wmj.47.2021.06.17.10.46.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 10:46:37 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] target/mips: Simplify MSA decodetree
Date: Thu, 17 Jun 2021 19:46:34 +0200
Message-Id: <20210617174636.2902654-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x330.google.com
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
 Richard Henderson <richard.henderson@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Merge MSA32 & MSA64.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (2):=0D
  target/mips: Remove pointless gen_msa()=0D
  target/mips: Merge msa32/msa64 decodetree definitions=0D
=0D
 target/mips/tcg/{msa32.decode =3D> msa.decode} |  8 +++++---=0D
 target/mips/tcg/msa64.decode                 | 17 ----------------=0D
 target/mips/tcg/msa_translate.c              | 21 +++++---------------=0D
 target/mips/tcg/meson.build                  |  3 +--=0D
 4 files changed, 11 insertions(+), 38 deletions(-)=0D
 rename target/mips/tcg/{msa32.decode =3D> msa.decode} (74%)=0D
 delete mode 100644 target/mips/tcg/msa64.decode=0D
=0D
-- =0D
2.31.1=0D
=0D

