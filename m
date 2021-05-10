Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C22B3799DB
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 00:16:54 +0200 (CEST)
Received: from localhost ([::1]:41216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgECq-0006GL-Ul
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 18:16:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1lgEBU-0004In-8O
 for qemu-devel@nongnu.org; Mon, 10 May 2021 18:15:28 -0400
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b]:41536)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1lgEBR-00013n-34
 for qemu-devel@nongnu.org; Mon, 10 May 2021 18:15:27 -0400
Received: by mail-oi1-x22b.google.com with SMTP id c3so17168308oic.8
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 15:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AI91YiaGIw4KNvoUgx32LJKteAfmEdbhm/HFd4ivYXw=;
 b=RnYScSqz4j6g84uzK6d/n7/H3/dQyrSxcHvHBYvuM8MU2aS3kv1fIhG5rt9qzseWjB
 eBnxLL5J/9I0qyS/5U4u8iDwZqf0EL+upebxi0G6Q6QBcmidS8kkSWq41mgL9cCOxiTm
 oM1j0qwZPn87g28EYv5Q8u73gPWLU28ojbSZPpvMjdgu911/MrghnbVJ9wPln+EH9CnQ
 rF4MXSgmoN/NaEGo05IpL2RrexCcfnaGLuV+WGm15K4XyhDL+lfHwP9H24SCeJulI+Rn
 OSKqZA5OIY0XoBeeoT4wbTZbXrBN+gCN3aZjNBfCOSZylmZsz2ZncoGJBeg8Xvobc1Vf
 fTQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AI91YiaGIw4KNvoUgx32LJKteAfmEdbhm/HFd4ivYXw=;
 b=AWPdquzWo/9nwlz3zMG4ZU2SfNRoG7owLz6RaRIWFUD5Oqyd/r76cdtilxDhW89yNb
 JQVbSezALNxuHexi/6GNVri49ew0G42/AIeBf+1ekzkesLNTtraHNx4l9QHpuN6OiP3Y
 KKhl2Fdz9pD3p9TU32X3gtGWETiEn9RZ9Mh03axx5Hybj0uD7jEYJxS/MAZGcU8kv4C/
 bfdcX4zq0l9w6PBVTo3u9me9SgPACpq17TEb4+vdpzrSQM1Z45RiOvww91tKjpvssxVs
 LGntSY7u0FbYtRbKUO4GUmJDqIRhYxPoct5fkunUnwW1UeR+PeU4WJU/YKfWr2EY/y2c
 sweQ==
X-Gm-Message-State: AOAM530hXWpRrbwS97UQjbSkujBYq/qr1c5fkkMHi7E94ozVK3Nbg9aX
 wO4RH03rEbYIeRXa1zQfHlvbahoBPWyZAA==
X-Google-Smtp-Source: ABdhPJyu9OrYBAvaEgJgrL7oAuo8EQfFa0lwpBgLwqhph8KcdetUFjD2ekS8kB1B0dIfUbmqVEpiSw==
X-Received: by 2002:aca:f1c6:: with SMTP id
 p189mr19546648oih.135.1620684920605; 
 Mon, 10 May 2021 15:15:20 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id p64sm2874405oib.57.2021.05.10.15.15.19
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 10 May 2021 15:15:20 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] bsd-user cleanup
Date: Mon, 10 May 2021 16:15:08 -0600
Message-Id: <20210510221511.14205-1-imp@bsdimp.com>
X-Mailer: git-send-email 2.22.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::22b;
 envelope-from=imp@bsdimp.com; helo=mail-oi1-x22b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: kevans@freebsd.org, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Three more bsd-user cleanups.

The general plan after these patches is to get and keep i386 working as I flush
out the loader, the basic system calls, system tracing, etc.  I'll move files
around so they are like the current bsd-user tree.  Once that's all done, I'll
add the different architectures we currently support. Sparc64 was removed from
FreeBSD and never really worked in bsd-user, so would need to be deleted
eventually anyway. If we do it at the start of the series, we'll reduce the
burden on getting the other things in w/o ditching functionality we'll need in
the end.

Short term, this just removes sparc from the build, deletes a file that's
not in the final product and renames a bsd-specific structure to have
a bsd name, not a linux one.

Warner Losh (3):
  bsd-user: remove target_signal.h, it's unused
  bsd-user: Stop building the sparc platforms
  bsd-user: rename linux_binprm to bsd_binprm

 bsd-user/bsdload.c                           |  4 +--
 bsd-user/elfload.c                           |  4 +--
 bsd-user/i386/target_signal.h                | 20 ---------------
 bsd-user/qemu.h                              |  7 +++--
 bsd-user/signal.c                            |  1 -
 bsd-user/sparc/target_signal.h               | 27 --------------------
 bsd-user/sparc64/target_signal.h             | 27 --------------------
 bsd-user/x86_64/target_signal.h              | 19 --------------
 default-configs/targets/sparc-bsd-user.mak   |  3 ---
 default-configs/targets/sparc64-bsd-user.mak |  4 ---
 10 files changed, 7 insertions(+), 109 deletions(-)
 delete mode 100644 bsd-user/i386/target_signal.h
 delete mode 100644 bsd-user/sparc/target_signal.h
 delete mode 100644 bsd-user/sparc64/target_signal.h
 delete mode 100644 bsd-user/x86_64/target_signal.h
 delete mode 100644 default-configs/targets/sparc-bsd-user.mak
 delete mode 100644 default-configs/targets/sparc64-bsd-user.mak

-- 
2.22.1


