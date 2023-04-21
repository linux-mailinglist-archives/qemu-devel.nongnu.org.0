Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D786EAF66
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 18:44:29 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pptqY-0004x9-OZ; Fri, 21 Apr 2023 12:42:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kariem.taha2.7@gmail.com>)
 id 1pptqW-0004w6-Km
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 12:42:52 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kariem.taha2.7@gmail.com>)
 id 1pptqU-000366-RH
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 12:42:52 -0400
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-2f95231618aso1264821f8f.1
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 09:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682095368; x=1684687368;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Y4SM9YeBIclfjzNxYz14AKGlZQIua6BW7879c1Pfusg=;
 b=I6TObotonJBYu7m5XFh6RZfOlr8dFWVBmlpKP9Rc4tdvN3QyaYAW/udP/13n000Aol
 2g40yf8eGpKs8i0NurHmvbhgSvoa9QHGSpI6aN5kzdpBAWga+1oCvcsyg3IP4A/l2Yki
 qKFAdSoIaTrh4WyLGvJr8TVQaOtHsX+vwnVBiNs2YNJ2+xMANW2jF8qcKUDb8IZySOGP
 41lNm6OG3qctQrXHqeWhiWENz0em8DkVdd/t+jQVvoQZkenr2xHzKyUmw/hIv9t/7WUr
 bTncbxrICNUPfhCQptWd9jmufVazN6YHTBBwZvdzf+x/ez/nYL1LXYRmo8Sh/luFdN3d
 +tGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682095368; x=1684687368;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Y4SM9YeBIclfjzNxYz14AKGlZQIua6BW7879c1Pfusg=;
 b=C19d/0RI1wsljbGTacLIudjfMh54Hf7BPSZeLdrIl/Pg4UnUvY+9jk7VlbIO+cP5Zf
 xA0znmrQnHnaaPBe589wYa6kImDShL9ABpvEFxJmO6vqUkNGx2aG5M35zkL5rO15MDWm
 x/IBg33Uj74klmNLt/bF/Vhb0KKWb3Jhb/IVLb/x1G1PgFNWMJk2VARIDpSWvGMQMbxK
 oLWHnTDY75JA5vWm9NLdEeFh7y9GcgciiUqBHdYRQQo92JWh3YALqVBijh9fDFlWKH4+
 cF3wVVHRUTG27Q59uL/0ncPAYqcx9tdGtO6H4hucVt9F91FKqR11SlZaCUTxof8dt8QD
 BZ6A==
X-Gm-Message-State: AAQBX9ch32lA+1VWtkFN8Qz7uftP+Uhvonwxal4hr+4N7mS4f65Pmc5D
 hfHFXZQcPo26Qz5TScHYG8DSuGXJQJM=
X-Google-Smtp-Source: AKy350Y/taEI2gCbPXN+mpOC9/VOlQXWmLYfnOy4eg8NfDyvSrLTqOfIq25XqaNMmWqSDYVpemmi9w==
X-Received: by 2002:a5d:4d06:0:b0:2e5:d4f4:c43b with SMTP id
 z6-20020a5d4d06000000b002e5d4f4c43bmr4941762wrt.55.1682095368558; 
 Fri, 21 Apr 2023 09:42:48 -0700 (PDT)
Received: from karim.my.domain ([197.39.145.151])
 by smtp.gmail.com with ESMTPSA id
 z16-20020a05600c221000b003ee1b2ab9a0sm5266658wml.11.2023.04.21.09.42.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Apr 2023 09:42:48 -0700 (PDT)
From: Karim Taha <kariem.taha2.7@gmail.com>
To: qemu-devel@nongnu.org
Cc: imp@bsdimp.com,
	Karim Taha <kariem.taha2.7@gmail.com>
Subject: [PATCH v3 00/11] Contribution task implementations,
 for the 'FreeBSD user emulation improvements' project.
Date: Fri, 21 Apr 2023 18:41:49 +0200
Message-Id: <20230421164200.2913-1-kariem.taha2.7@gmail.com>
X-Mailer: git-send-email 2.40.0
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=kariem.taha2.7@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Upstream the implementations of bind(2), connect(2), accept(2) and
getpeername(2) system calls from the blitz branch of the bsd-user fork hosted at
https://github.com/qemu-bsd-user/qemu-bsd-user/tree/blitz.

Karim Taha (1):
  Signed-off-by: Karim Taha <kariem.taha2.7@gmail.com>

Sean Bruno (1):
  Signed-off-by: Karim Taha <kariem.taha2.7@gmail.com>

Stacey Son (7):
  Signed-off-by: Karim Taha <kariem.taha2.7@gmail.com>
  Signed-off-by: Karim Taha <kariem.taha2.7@gmail.com>
  Signed-off-by: Karim Taha <kariem.taha2.7@gmail.com>
  Signed-off-by: Karim Taha <kariem.taha2.7@gmail.com>
  Signed-off-by: Karim Taha <kariem.taha2.7@gmail.com>
  Signed-off-by: Karim Taha <kariem.taha2.7@gmail.com>
  Signed-off-by: Karim Taha <kariem.taha2.7@gmail.com>

Warner Losh (2):
  Signed-off-by: Karim Taha <kariem.taha2.7@gmail.com>
  Signed-off-by: Karim Taha <kariem.taha2.7@gmail.com>

 bsd-user/bsd-socket.c         | 108 +++++++++++++++++++++++++
 bsd-user/bsd-socket.h         | 143 ++++++++++++++++++++++++++++++++
 bsd-user/freebsd/os-syscall.c |  21 +++++
 bsd-user/main.c               |  16 +++-
 bsd-user/meson.build          |   1 +
 bsd-user/qemu-bsd.h           |  36 +++++++++
 bsd-user/syscall_defs.h       | 148 ++++++++++++++++++++++++++++++++++
 7 files changed, 472 insertions(+), 1 deletion(-)
 create mode 100644 bsd-user/bsd-socket.c
 create mode 100644 bsd-user/bsd-socket.h
 create mode 100644 bsd-user/qemu-bsd.h

-- 
2.40.0


