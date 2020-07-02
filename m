Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E2C5212B80
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jul 2020 19:49:32 +0200 (CEST)
Received: from localhost ([::1]:48312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jr3L1-0005XE-A0
	for lists+qemu-devel@lfdr.de; Thu, 02 Jul 2020 13:49:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jr3Ab-000418-Gb; Thu, 02 Jul 2020 13:38:45 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:34151)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jr3AW-0007Of-1F; Thu, 02 Jul 2020 13:38:45 -0400
Received: by mail-ed1-x52b.google.com with SMTP id a8so23642654edy.1;
 Thu, 02 Jul 2020 10:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=x+alTzY1GOz+kv+Wjlp3+EqQ38OLVjfJxlmuRS8PUdk=;
 b=B9QaYg+VEngQm85Xtqh0zAcwIPDt4cl/Iw9q1QiO6mZvWqwc8VyVrVKxa6/3oJmy1m
 RXBSSxB/FzI2HawtbYvb7fGJzjJM6OAZyMRw1gtwcMilS3/6wH3PtiTQdBD7Hx5uZcGN
 pKNiUsHk7u7JmdN4+mh3hG0cZCuYGjjURxvLApvAbhyF7hABfeRHEwZAaOCM64zy5LZd
 RMcXtVmxg6PwsOeOKTMhBpiyd4Yu3nrok9nT9CNja9fB8hjjN/zWeM8AcnPZkdzmuBlX
 kMzrBapXPr5bApr2ogdjrxkVmeqAmCNCftr1wREyqq908YG5y1ZLy//V5omZwv3cFvKB
 Je4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=x+alTzY1GOz+kv+Wjlp3+EqQ38OLVjfJxlmuRS8PUdk=;
 b=bEDi/m7O1G+GFB9ApnKcHAg6U1Egd3gmx1/KPYw2CuN/fuABa79PYBrUZjSGWM2stX
 sRzU/KXjklcQvvKprlHM3ILM/bKbhc2oz3AOC7h/1Jr3/w3dNmXdur8CPKxxnFq1krLp
 SNQSz56fHwDTWibAmOjyMa/9cfax5WVE+KicuqEVkEz95LzewWdKnDMAEzfb1gF/KlE6
 ribzPTzV0xAcbbe6PvtuPO+IRxnQtWoPwXjORGjb8zN7XDG3gk4Mi8LaAcjodHBXNncV
 ytHk4l7z03vWjKO5TB7yGAeUczRzRy2b/IGgX90or8Od+WotI0iQU+Z3jlaDafr6JbfD
 ksCg==
X-Gm-Message-State: AOAM53273dmfpw2HSXk4ZRZ2AUVsDAadKlUSgA3xXWPE+FcU7Jmdlkuy
 gB5QUCAD9BpNavUGnOdYDfFUqwN0I6A=
X-Google-Smtp-Source: ABdhPJyjZegCn0dV0s+KuThoVRn/tp8tbruO9IhUcbBcG8Txm4z0llbnevu0ucpWQKhVVSOyfcDfBA==
X-Received: by 2002:aa7:d6cf:: with SMTP id x15mr35178107edr.164.1593711517944; 
 Thu, 02 Jul 2020 10:38:37 -0700 (PDT)
Received: from x1w.redhat.com (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id w20sm5710344eds.21.2020.07.02.10.38.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jul 2020 10:38:37 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 15/19] .mailmap: Display correct email address for Peter
 Maydell
Date: Thu,  2 Jul 2020 19:38:14 +0200
Message-Id: <20200702173818.14651-16-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200702173818.14651-1-f4bug@amsat.org>
References: <20200702173818.14651-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x52b.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fix Peter Maydell email address in the following commit:

  $ git log --format=fuller --committer='petmay01@cam-vm-266.(none)'
  commit 0d4abda8f7328c8911c1d020bb6961650eaf7801
  Author:     Peter Maydell <peter.maydell@linaro.org>
  AuthorDate: Fri Jul 20 13:34:49 2012 +0100
  Commit:     Peter Maydell <petmay01@cam-vm-266.(none)>
  CommitDate: Fri Jul 20 13:34:49 2012 +0100

Cc: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 .mailmap | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.mailmap b/.mailmap
index 9bc80771e0..2fa882d239 100644
--- a/.mailmap
+++ b/.mailmap
@@ -144,6 +144,7 @@ Pavel Dovgaluk <Pavel.Dovgaluk@ispras.ru>
 Peter Crosthwaite <crosthwaite.peter@gmail.com>
 Peter Crosthwaite <peter.crosthwaite@petalogix.com>
 Peter Crosthwaite <peter.crosthwaite@xilinx.com>
+Peter Maydell <peter.maydell@linaro.org> <petmay01@cam-vm-266.(none)>
 Prasad J Pandit <pjp@fedoraproject.org>
 Prasad J Pandit <ppandit@redhat.com>
 Qiao Nuohan <qiaonuohan@cn.fujitsu.com>
-- 
2.21.3


