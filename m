Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96FDE33B082
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 12:00:35 +0100 (CET)
Received: from localhost ([::1]:39002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLkxc-0001Wn-Jx
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 07:00:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lLkvu-0000Gt-KM
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 06:58:46 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:37384)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lLkvr-000356-9z
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 06:58:46 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 f22-20020a7bc8d60000b029010c024a1407so19983358wml.2
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 03:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dfROLXraVaYyvDmHZ3vdmaOZACVNFZ1UtXzct9XNM1U=;
 b=kg0QC6/iciqxcr45eA3amOjmQs+coPhOwmhGV3vHpBFMsSpiGQNK+qdFD+++DsjNhO
 vMCt79icm4jnEHTmYqmohj8w1m4vwvg8XWLbXD1Vh6LX4zXVxl1C27FW01WpVx2nE8SA
 lAh+aCgB0km0/f5Sz3fOzBIZB9nKrVfjVKmID+ttMTk3VSdTkyCJab47cckUzHiSJAsD
 ptF9aW3n/dLqv1EiKvIFiApK39zBOBbs/VrSQAXt+x0gXj5XRY+c95iKEZF6Y1yEFPWN
 SvnnLP9490Exhl343ecWSi2/1RLYKvQQdnwQzyJxJr0Nz2ik7DvtHyI+7sX9V8bkFgH2
 5w7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dfROLXraVaYyvDmHZ3vdmaOZACVNFZ1UtXzct9XNM1U=;
 b=k0jsGkm8MeVRwtYMZkeY9vLebN4ufdBQwb0Jkmd5ojI8E2c6ni5afO1BHSal7cAh4G
 BQPaKrVoMgdn8xp9iB4VCWUX/P+M2mAo8464halr56005RYVbQ8asl+fsnDJJmjUJ7X6
 sAIWPK3C9oH21DpensO6srrVyjylrzkKtHBVOJJlnaXapRcf4Cpv9eFvhRQvbY9tlSe5
 Woteze9H+TU9lgxyXO3B80MXDnKmuEwk+nX2NVEjkKmOiKK714cZN+ZSEGBe028LyQDx
 FQh8tCev7TB7RaQ16kj7B9DxvwAXZc/icmrqbIRM3zVf8faG0arV/oEQuCP+eCynESmb
 ivaQ==
X-Gm-Message-State: AOAM532ykWVNgjstvTL6MR6gbIKKLHyCCh3jvj0TXVC01caCvPcXzgYW
 fnDCKHjF6FAckGrmSqHhQE4Im4LtbPU=
X-Google-Smtp-Source: ABdhPJwpscDw0jjfL8CADuBYU1u18hWG7VIyn7oz2amTTbYR4VsJiRp3O8CCzxnFMdwc88e2gKYvuA==
X-Received: by 2002:a7b:c2fa:: with SMTP id e26mr24944231wmk.102.1615805921618; 
 Mon, 15 Mar 2021 03:58:41 -0700 (PDT)
Received: from localhost.localdomain ([197.61.219.7])
 by smtp.googlemail.com with ESMTPSA id r11sm18538747wrm.26.2021.03.15.03.58.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 03:58:41 -0700 (PDT)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] util/compatfd.c: Fixed styling and replaced malloc 
Date: Mon, 15 Mar 2021 12:58:12 +0200
Message-Id: <20210315105814.5188-1-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Mahmoud Mandour <ma.mandourr@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In this small series, I fix two styling issues that were causing
errors when the checkpatch.pl scritp was run against the 
file util/compatfd.c. 
Also, I replace a call to malloc() and its respective call 
to free() with GLib's allocation and deallocation.

Used g_malloc() because the allocation is already small and its better
if the system aborts on failure of such small allocations. 

Mahmoud Mandour (2):
  util/compatfd.c: Fixed style issues
  util/compatfd.c: Replaced a malloc call with g_malloc.

 util/compatfd.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

-- 
2.25.1


