Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F968399127
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 19:09:12 +0200 (CEST)
Received: from localhost ([::1]:45250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loUMg-0003qi-Rm
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 13:09:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1loULf-0001tP-3L; Wed, 02 Jun 2021 13:08:07 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:39427)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1loULd-0007OJ-GW; Wed, 02 Jun 2021 13:08:06 -0400
Received: by mail-ej1-x634.google.com with SMTP id l1so4928509ejb.6;
 Wed, 02 Jun 2021 10:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JGPis0AW+aaH4wBbSop936myvgD2dj3LgszAZSmfYV8=;
 b=RHfTLCVu6mWIFdLUE8yzTZn4nY+/VHYjsoY9lWtLMCtgxUmV7/f7Ae/8EeViEjL91z
 4MKyZl4p380USIjAZ0uJTOpWZuY6WNNyYGIsPPB4ngCUsITyL34KgJGKXWFii26SOOwG
 K1coHH4kD2upBUJpcd/vVmstcmxVhcvGplXskf0FrqmNDD8Nu/mkImpte4M5CFLefXKL
 2lzgHaN11ib26n19CuHP0lykDfvbzXpVnuTOaxpzXS05Mje9sw7CVPp0AwRbGbTA84Md
 7z1wB8yXOX7k7LsUL7cyvz/KkbLfdKtzRBd5X/JAPcKl3NEETQws9HCKAYCCphAOxkls
 s/XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=JGPis0AW+aaH4wBbSop936myvgD2dj3LgszAZSmfYV8=;
 b=ZxuuOiOMNSdpES3/Z4jEjBSu7DTEEmJl49U8VLiwDjZkSczNedMWU5E/KQJ3nIaukH
 ZyXn9OSrSQD3OJLgtCF4YEx4u9knOjWKL7e/i1EdqOeuOzEx4ikA3sg1H2AqR6ohiQWz
 3CZBuzMbAOh1ffouUEp8GrFjHgdqqPFIW8aDL22O1btSNLze0OVSDrN3CgyRjIGPSChT
 5/R2YaKg/zAhJPtOrDUeyK0PWue5reLN0TbKSQqhmm21JymcvNdX2NdWIdzxmiQOOmpo
 REoFw55/0dk8uvCoj5nlJCuH437NLHsIfrsc4rDYv9Zy4A/vn9U4hkDLV3sHcl2+BWLC
 QHzA==
X-Gm-Message-State: AOAM530Z8QRog11LFk5tud/ZVl1wgHnEjYuXLxSFJAHBYP4dPxEGKTdU
 kBrT/KTXZVmBC5m+jmqA8nsq960VxiGYDA==
X-Google-Smtp-Source: ABdhPJwTreU1kY/nXSvCFBvP94OYqA41D6OeqbwB8f3yifGkCgoQArl/PMU0+dIDEsEbBmCqSoOOoQ==
X-Received: by 2002:a17:906:278f:: with SMTP id
 j15mr28531334ejc.388.1622653683221; 
 Wed, 02 Jun 2021 10:08:03 -0700 (PDT)
Received: from x1w.redhat.com (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id h7sm298407ejp.24.2021.06.02.10.08.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 10:08:01 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] trivial: Fix some typos
Date: Wed,  2 Jun 2021 19:07:56 +0200
Message-Id: <20210602170759.2500248-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x634.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fix few typos:=0D
. Uncoditional -> Unconditional=0D
. havn't -> haven't=0D
. stdin -> stdio=0D
=0D
Philippe Mathieu-Daud=C3=A9 (3):=0D
  misc: Fix "havn't" typo=0D
  target/mips: Fix 'Uncoditional' typo=0D
  scripts/oss-fuzz: Fix typo in documentation=0D
=0D
 hw/usb/desc-msos.c                             | 2 +-=0D
 target/mips/tcg/translate.c                    | 6 +++---=0D
 target/s390x/translate.c                       | 6 ++++--=0D
 tcg/tcg-op.c                                   | 2 +-=0D
 tcg/arm/tcg-target.c.inc                       | 6 ++++--=0D
 tcg/sparc/tcg-target.c.inc                     | 6 ++++--=0D
 scripts/oss-fuzz/reorder_fuzzer_qtest_trace.py | 2 +-=0D
 7 files changed, 18 insertions(+), 12 deletions(-)=0D
=0D
-- =0D
2.26.3=0D
=0D

