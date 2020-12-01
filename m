Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C9822C99B8
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 09:41:18 +0100 (CET)
Received: from localhost ([::1]:52574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk1Dp-000420-En
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 03:41:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kk1CY-0002qi-DC
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 03:40:00 -0500
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:35535)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kk1CW-0004uB-SO
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 03:39:58 -0500
Received: by mail-wr1-x443.google.com with SMTP id r3so1342773wrt.2
 for <qemu-devel@nongnu.org>; Tue, 01 Dec 2020 00:39:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uwmEya4K/8Bs9uRrDlHLuB6k79teKoy3wzBh0SKp8NQ=;
 b=f+JHi/e4fP78lS5ZNdpPSIKlsWAkTiF8Xev9Hm//d5K+ii0qSo/9IdQwGacuYdWbcD
 AHBR37gtuc3xlqyWERhL53/Y0ElG2NmkqD/y/WHK3rCY8Uyy4BzDAEw1WJtpVMRbPT53
 1r1KkYip6+jNjoJiIbe4YqrCQvjF7YNVTbSYnKPGWa0JD+HtvGA5N7zrmwZubLxgiRyx
 MtrJtbDujqc7p8+lstUnFJEP5r2aTjALFEN5fW1MH1ThiOhakocbkbbD0JcQnzl1SdUd
 K5mNlBIJK2K0nSHqv8/MOZBw1SkSxUnOTH+SMTZctnIgIMzHggLFZ862bbVucwPRQsEm
 E3Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=uwmEya4K/8Bs9uRrDlHLuB6k79teKoy3wzBh0SKp8NQ=;
 b=XrGpEqO7kA89omvlSJ/ymgLhbLJOJRWpLYoqx1r7aC7T+Prv+RtPYH9mDKOzJUoQn2
 Z67NyjBKqmqZlvoIV6DMiapAaY+scbyg5XwgAbSGEIRQBLMVs2a3hLwCVsno4rTFY4HV
 j2wCgURRPuh8d/uX2lahgH7nxF1vJXajaWfraU4tr0aXiQbgUAtMf9ry6zApeF/vl05e
 JoqAoOIQ65eSvUUeI4DFpBlXlGqXLudEjak0l+/cYAYcbBvFjJDSjtm6Hx7l9bG6sclR
 ZCgaJCMg42+mmtsbC2h0a2BFcZH5fFfEgUpw7DOsm5cplCqrwBpmgi7pIWo34oOtg7KB
 q05A==
X-Gm-Message-State: AOAM530gB/rnhy7oQ1ScAL1gbcmO/3OI8W948cbHF1klTp6y1HdJR33D
 ABz+f3tNNlTvCYWIZrFT2s4ElJcSHLs=
X-Google-Smtp-Source: ABdhPJwT3Rbmepqj/LacbtSeWiH//knihWe+sYQT1SdDLxx7W2qO6CndyJZm95AIb/uDp87PDA6GlQ==
X-Received: by 2002:a5d:504f:: with SMTP id h15mr2332493wrt.402.1606811994356; 
 Tue, 01 Dec 2020 00:39:54 -0800 (PST)
Received: from localhost.localdomain (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id b83sm1608991wmd.48.2020.12.01.00.39.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Dec 2020 00:39:53 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org, Huacai Chen <chenhc@lemote.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 0/2] linux-user: Add support for MIPS Loongson 2F/3E
Date: Tue,  1 Dec 2020 09:39:49 +0100
Message-Id: <20201201083951.2745111-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x443.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>, Meng Zhuo <mengzhuo1203@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Update the ELF HWCAP bits and set the Loongson instructions=0D
so we can run 2F/3E userland binaries.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (2):=0D
  linux-user: Update HWCAP bits from linux 5.7=0D
  linux-user: Add support for MIPS Loongson 2F/3E=0D
=0D
 linux-user/elfload.c | 15 +++++++++++++++=0D
 1 file changed, 15 insertions(+)=0D
=0D
-- =0D
2.26.2=0D
=0D

