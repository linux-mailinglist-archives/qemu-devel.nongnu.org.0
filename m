Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3028E6EA313
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 07:25:22 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppjFU-0003R9-7u; Fri, 21 Apr 2023 01:23:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kariem.taha2.7@gmail.com>)
 id 1ppjFQ-0003Qe-3i
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 01:23:52 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kariem.taha2.7@gmail.com>)
 id 1ppjFO-0001cz-Au
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 01:23:51 -0400
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-2f917585b26so1200122f8f.0
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 22:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682054627; x=1684646627;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Y4SM9YeBIclfjzNxYz14AKGlZQIua6BW7879c1Pfusg=;
 b=bnV4uxqaqLRySo1vdtOuq1zJ05Cqp4zPxTgJJnuDiB31FAzVWQrWVPB9nJhzuP6BSv
 dviuPlM7aDMmLzcgeefcSSebyBTX6AzmyPjy/P94vFzrnh8tYmw0EuAUQ7fsMQxVzIuG
 JzWQS1LMwuVHQlTCOZ6J+sna8efHVW3DE/qA7p6eUVftZhdw6G784n4GiEsjKRyhBUh4
 txgAQHoKzv7rqFPaIunUxdxw+qZlyYth/VgFlza4IpPw1SJvudIMcCM/hNV9NxeHRRvh
 6jNqBowOlqpySFGV4zn6P562KTHc5wgYquI6HUv+AHSVrGAa2+C4bfGKDO74xXSm7ryt
 TQXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682054627; x=1684646627;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Y4SM9YeBIclfjzNxYz14AKGlZQIua6BW7879c1Pfusg=;
 b=jO2sYWGSU+gqUpXp8+qmriVCv2afJ9/RyD0tSNFLaSJX4oiarssh8RGFbyXhZOAJ/N
 6SzxzANQBy5ajV8pKlV43O36++XaaT5TyaXICqCsUzQp9j9n8OuJNC7hFINEczqbVvWi
 /K8yJaQBoONwuikdxU6uS0N48mJTACt54JLlLJtglcLR/g8ONlg/QMMVq4AB17IPNcO8
 2IscICmklRVXwiZW/UPBFIhFc6kuzh5resek3QaWvWviuYQ6xAlgyriq4v345OiIDcQj
 FQtq7SyUJZALjalaB1GgbHNpA+9oGpo04zJOSA0XFq5kwwpTs/3XVyyg2y2XjY11muIz
 A+Ww==
X-Gm-Message-State: AAQBX9fbznq0bCTt5OMvT4nkhTkmokGtGbFDsiDMaVHpxvZrzoBetpzp
 tDLLQXY8tIWNVnV9xdbWNz5i/pLI3MxKIw==
X-Google-Smtp-Source: AKy350avN5FJnMrev2STEXqjO5lJFoQ6FE41/ZPg8iMwyyQnyA8PHE8BMg23T4VggMYRiwaqUz2ARA==
X-Received: by 2002:adf:ef8a:0:b0:2fe:c0ea:18a5 with SMTP id
 d10-20020adfef8a000000b002fec0ea18a5mr2759249wro.58.1682054627599; 
 Thu, 20 Apr 2023 22:23:47 -0700 (PDT)
Received: from karim.my.domain ([197.39.145.151])
 by smtp.gmail.com with ESMTPSA id
 t13-20020a7bc3cd000000b003f173c566b5sm3813475wmj.5.2023.04.20.22.23.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 22:23:47 -0700 (PDT)
From: Karim Taha <kariem.taha2.7@gmail.com>
X-Google-Original-From: Karim Taha <krm.taha@outlook.com>
To: qemu-devel@nongnu.org
Cc: imp@bsdimp.com,
	Karim Taha <krm.taha@outlook.com>
Subject: [PATCH 00/11] Contribution task implementations,
 for the 'FreeBSD user emulation improvements' project.
Date: Fri, 21 Apr 2023 07:22:44 +0200
Message-Id: <20230421052255.5603-1-krm.taha@outlook.com>
X-Mailer: git-send-email 2.40.0
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=kariem.taha2.7@gmail.com; helo=mail-wr1-x42f.google.com
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


