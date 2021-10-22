Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4763D437C5A
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 19:58:47 +0200 (CEST)
Received: from localhost ([::1]:34532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdyoY-0003hc-Db
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 13:58:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mdyc9-0004b0-9j
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 13:45:58 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:35686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mdyc6-0002Wd-JP
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 13:45:55 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 84-20020a1c0457000000b003232b0f78f8so4311959wme.0
 for <qemu-devel@nongnu.org>; Fri, 22 Oct 2021 10:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OhA5vUqAlGrmdGt+gD4KY99Scb1fQoGgu4zXfzpASJk=;
 b=lMBu7y/83Qdoqy3gK7WWAcDdbp3P+kFZikojGZlRFSvrkEWZO3VqNQiYPBvdiXbU+8
 g/IZqWCErpUyaKOPjca1QkjiHHMU5KVA7m/cR4rp/+nwl0b1ax0klI7TNrrNPDUtVe8Q
 TrG8hO7y8xRJdzQdBWnk/uwgOOW+RnOrevOp09TXoARl6L+i5RtTnqxouXpQNG343GAi
 HUUsH6arVrR561bPmWQ7H+MXc/E2AbfJU+LqhWLWo85f10hqtJ0dqHuHnT/HZA6eDUWD
 GxdGdiuUvMcjBoZXsSQEpu13X1Q74QVlfrHQbZU58nOJntvvWVSc/Qvyvja4TVS7gawV
 1m0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=OhA5vUqAlGrmdGt+gD4KY99Scb1fQoGgu4zXfzpASJk=;
 b=5JWCwGfLRWEsnmVPN41w+3zP4UZAqbh0kHRKBNKXwmiL9cChUbXx+ZepRU86YYRTHw
 47G1YYQRhr8AhPATRs6QpWAJ8niYkp9CWhoW4SXBwaZUMaQ/foqFpK16AnQbNMv21qSN
 O33WEyYucomsXRgsm7P1UHqYg28B9wIh1WnuUBplks1j7nmDDE3keSM6pz8j3548VzP8
 o3kjM0NdFvejydQ1YD0/tnbTSTihvJAa9RM0qtkSXhOcT7k+l7KCpD+ckSZxDgAZJjAT
 pvXZPof3IYhForr45cGcMtZSIwp9TN3R6jo0V8kPfB4dl9yc9BT1tiX+Sz4j+OZr7z8y
 dGRQ==
X-Gm-Message-State: AOAM533rFyOAm27ENr1VDCOakUl9kLNpeb213y8k0kNrpCK7a/dyqrO0
 wX6llQWrvbL2qPJ26b/ITSHYjnP2q8s=
X-Google-Smtp-Source: ABdhPJzEfP0qxALCslqT5hArKlVnt2UcR155enQ2D4uvSghT/4Kbhx0Nx1iAGI1r9w9zi0aN2NmIIg==
X-Received: by 2002:a7b:c0c6:: with SMTP id s6mr1206756wmh.135.1634924752299; 
 Fri, 22 Oct 2021 10:45:52 -0700 (PDT)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 v13sm4214947wrp.11.2021.10.22.10.45.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Oct 2021 10:45:51 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] target/mips: MSA opcode fixes
Date: Fri, 22 Oct 2021 19:45:47 +0200
Message-Id: <20211022174550.36937-1-f4bug@amsat.org>
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
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fix a pair of MSA opcodes, and update the MSA_IR config register=0D
in the Loongson-3A4000 model.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (3):=0D
  target/mips: Fix MSA MADDV.B opcode=0D
  target/mips: Fix MSA MSUBV.B opcode=0D
  target/mips: Fix Loongson-3A4000 MSAIR config register=0D
=0D
 target/mips/tcg/msa_helper.c | 64 ++++++++++++++++++------------------=0D
 target/mips/cpu-defs.c.inc   |  1 +=0D
 2 files changed, 33 insertions(+), 32 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D

