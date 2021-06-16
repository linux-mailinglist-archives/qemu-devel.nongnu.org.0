Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C54C73A9E06
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 16:47:54 +0200 (CEST)
Received: from localhost ([::1]:50158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltWpd-0005Mn-9a
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 10:47:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1ltWnh-0003sR-NY
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 10:45:53 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:34329)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1ltWnQ-0006sD-Em
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 10:45:47 -0400
Received: by mail-pg1-x535.google.com with SMTP id g22so2172114pgk.1
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 07:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ab+kPipAmJUe6xuHGWQn78LPj0JVzqgRPd3pTtBtL+k=;
 b=lF98dDecFe1MQrZpaZtDVAUgMfFBrr4Q7IRAWlFQrQrI5QkYy35zivpsTxlrKV2mC/
 3iZhnnXTOigYmR+bROsHhTI4ZPQcRCDsFWmNK4CXOPNVlph0u5Pd4gRsHdJW/FkHjnSf
 qXyssxfppga0/tqEUaFmmnp9SG+MZdc3R5WX+HpT832dHPQQ5EaPTIajEx9CAoSyw4CR
 goRn/u1k1TFZetGX61EOcB9NXa/kS+Peeklb6yeObqawC+a+KtiQVrMHrTMfPUi5CeCS
 5YUAjt6fUcHRg55EAmKot2UVZlx/esRKUKLqY0tU6cbV/OEC3uW2e+hy9FjjgDqEGhlt
 OA0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ab+kPipAmJUe6xuHGWQn78LPj0JVzqgRPd3pTtBtL+k=;
 b=TEx0f/bsdZrtUUO7yi0oS0ms0W521qFt8CBssyPF16U0/NcNwOPsO0fyTmfgzGsXF0
 TpCUtaprzZxPQYNIprJ8ae9R9MlyZ1O+LqbcADLbT/0rl5ETtuN8Trz9DPaHuwv/XRF+
 SGKb/Du9kkcbPwFtBi6W27m9/PtBbXI8n2QJOSXm65z1B/YkR/DtE/RS3yxmnMr4Ke7W
 8rc/O9Z5P2VEpLUx+3f9l+LSzLWNMqpTya9AuUNJXLSBRh/XCzsMHzV6IsmTfMA/R/Cc
 k30iQHYYwk9ol1OvnQoyERBAiEDRY2oDQUPJHzfd5dIcXTBPxHPs3n5UmONjxrLkDSs8
 ce0A==
X-Gm-Message-State: AOAM533VVN0UPAhRiRMBg0IRpCzMPdJX8Csi+Cg33d6xGCauOIzxt95K
 9jZFLk45M+IbHr01us9T2Fiwjc90bZWTKQ==
X-Google-Smtp-Source: ABdhPJymmSTOJoNcYaKqYxgs79NDyz1pTj2s0r+G5iMDpHGlunjyUxqaXjsZsYQeMZ7lHsT8rXeoWA==
X-Received: by 2002:a63:eb4f:: with SMTP id b15mr5482843pgk.2.1623854734014;
 Wed, 16 Jun 2021 07:45:34 -0700 (PDT)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:40bd:72ed:2c81:7963])
 by smtp.gmail.com with ESMTPSA id c207sm2443027pfb.86.2021.06.16.07.45.32
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 16 Jun 2021 07:45:33 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH 0/1] input: Add lang1 and lang2 to QKeyCode
Date: Wed, 16 Jun 2021 23:45:21 +0900
Message-Id: <20210616144522.55643-1-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pg1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch adds two QKeyCodes. The corresponding path for ui/keycodemapdb
titled "Add QEMU QKeyCode 'lang1' and 'lang2'" will shortly be submitted.
This patch should be applied *before* applying the patch for
ui/keycodemapdb, or it causes build failures.

Akihiko Odaki (1):
  input: Add lang1 and lang2 to QKeyCode

 qapi/ui.json | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

-- 
2.30.1 (Apple Git-130)


