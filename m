Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45DFEB3D41
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Sep 2019 17:05:22 +0200 (CEST)
Received: from localhost ([::1]:35670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i9sZ6-0003QO-FZ
	for lists+qemu-devel@lfdr.de; Mon, 16 Sep 2019 11:05:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53581)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <paolo.bonzini@gmail.com>) id 1i9sCn-0006I7-4U
 for qemu-devel@nongnu.org; Mon, 16 Sep 2019 10:42:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1i9sCl-0007Pm-HG
 for qemu-devel@nongnu.org; Mon, 16 Sep 2019 10:42:16 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:53560)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1i9sCl-0007PL-88
 for qemu-devel@nongnu.org; Mon, 16 Sep 2019 10:42:15 -0400
Received: by mail-wm1-x32b.google.com with SMTP id i16so66533wmd.3
 for <qemu-devel@nongnu.org>; Mon, 16 Sep 2019 07:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=qBDro2giL3yKmpBcWouyjZdZj6DkaNRvbVZ4F52Urqc=;
 b=Uy5I00YoR6QZNcCHg0GO34eEQ+dOyeSalui4EIjgMxdRmdddh04KsDEEkQZlQDoI7w
 vLoLFaeEP18J7NasZmlP3AlqC3dflywVwigjSQ4ZmCbS6MJc70WmzeuhxGjh8e9uFcrD
 GzisGljFz0zDRh4e/HRGsCSbo2nmCbSJsxiWOPt9DKFJlreTMMSOEkJC1JxkK92geLQs
 umKlRMaGeRGXZMxBuWVmpwKRZ0nHFcqiCA7Cd9Ac6ZKh604A+xhtP7EtjqkJOpKWS0oP
 dxhTzMwSXzMVBNo8/co7cczlUaOpej2LVC0KjXWgnLcV8da+GcMsVtDkg/V+anmTT+RF
 4AuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references;
 bh=qBDro2giL3yKmpBcWouyjZdZj6DkaNRvbVZ4F52Urqc=;
 b=EieQo6Il/8ouvEF4IqpxTAmtJXSOOOt9hm5/peQYlGR2aQ0aGpwWYjUJMRse7JdoNw
 NbFGH8wpHoazypMeUvqwTUW6i9h7sf5RTAx1Y/BWfHabmIs7oRgrA/G0LuOV2AEk6SUs
 edi8uupd2WMoZDlyyplERmNvAl6Wm2EglA8OH6OZ5nYFXMgUFg4kPNLcnvGdran0w2Ho
 69kbeFIDfibDtrw6DvTiTYrjNObug0G/GVCzeVMkvz2cNl5Ecn4AH8q9RtPc1zehA8jo
 ggIt85ery3jbZ2/qhKWcqxFij5fAhRlo9eJfAYpNQ/IJuUFnFcMrnLIEqvDNqDazddbY
 Sk2A==
X-Gm-Message-State: APjAAAVKRU6Yb5oEFyZOQ1RW9q69Nj4Sb/TI/k9a5tw7Reb0nIKsr/CE
 EUog5gxTsDkKOqELv0MhlnePJgOx
X-Google-Smtp-Source: APXvYqx3hlHbaEFZIviI00ch2wJLL+lmkTjtGW94KJT3ngqB/w2rjLuBleOS8iDjQN8/SWMGY7E3sw==
X-Received: by 2002:a7b:c391:: with SMTP id s17mr66082wmj.94.1568644933985;
 Mon, 16 Sep 2019 07:42:13 -0700 (PDT)
Received: from 640k.lan ([93.56.166.5])
 by smtp.gmail.com with ESMTPSA id i14sm17024298wra.78.2019.09.16.07.42.12
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 16 Sep 2019 07:42:13 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 16 Sep 2019 16:41:43 +0200
Message-Id: <1568644929-9124-4-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1568644929-9124-1-git-send-email-pbonzini@redhat.com>
References: <1568644929-9124-1-git-send-email-pbonzini@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::32b
Subject: [Qemu-devel] [PULL 03/29] exec.c: get nodes_nb_alloc with one MAX
 calculation
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
Cc: Wei Yang <richardw.yang@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Wei Yang <richardw.yang@linux.intel.com>

The purpose of these two MAX here is to get the maximum of these three
variables:

    A: map->nodes_nb + nodes
    B: map->nodes_nb_alloc
    C: alloc_hint

We can write it like MAX(A, B, C). Since the if condition says A > B,
this means MAX(A, B, C) = MAX(A, C).

This patch just simplify the calculation a bit.

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
Message-Id: <20190321082555.21118-4-richardw.yang@linux.intel.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 exec.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/exec.c b/exec.c
index 8e0c400..ff3cb3e 100644
--- a/exec.c
+++ b/exec.c
@@ -227,8 +227,7 @@ static void phys_map_node_reserve(PhysPageMap *map, unsigned nodes)
 {
     static unsigned alloc_hint = 16;
     if (map->nodes_nb + nodes > map->nodes_nb_alloc) {
-        map->nodes_nb_alloc = MAX(map->nodes_nb_alloc, alloc_hint);
-        map->nodes_nb_alloc = MAX(map->nodes_nb_alloc, map->nodes_nb + nodes);
+        map->nodes_nb_alloc = MAX(alloc_hint, map->nodes_nb + nodes);
         map->nodes = g_renew(Node, map->nodes, map->nodes_nb_alloc);
         alloc_hint = map->nodes_nb_alloc;
     }
-- 
1.8.3.1



