Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ABA72DE9CA
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 20:34:02 +0100 (CET)
Received: from localhost ([::1]:55000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqLVo-0007vj-QD
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 14:34:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3wAPdXwMKCkEvfzjrrjoh.frpthpx-ghyhoqrqjqx.ruj@flex--scw.bounces.google.com>)
 id 1kqLUD-0006j1-Qe
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 14:32:21 -0500
Received: from mail-qk1-x749.google.com ([2607:f8b0:4864:20::749]:39046)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3wAPdXwMKCkEvfzjrrjoh.frpthpx-ghyhoqrqjqx.ruj@flex--scw.bounces.google.com>)
 id 1kqLUB-0007tN-Sf
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 14:32:21 -0500
Received: by mail-qk1-x749.google.com with SMTP id u67so2773863qkd.6
 for <qemu-devel@nongnu.org>; Fri, 18 Dec 2020 11:32:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:message-id:mime-version:subject:from:to:cc;
 bh=dOovq1HyDrqfZRA7cyTxANlCUU7vbRrdubbQgpxlZkc=;
 b=W5ZfrX1+SJsouf2U+84ShA+rSs7H0RlkgcLGnrUaTSGtu+SrOjoMDTWOv27urruFz+
 Y0+QX4B31I+JQcOwbNWy/vXKXKgXlap9JKHmYbf9U5HjQBlT0lTnSliiF1O0i+6aldd0
 9fZV0w/acMTA5QigP+bqe79lIzlzWCYHkCV5urRdGelKjXv6vIR/UHUCx0u25PUgOCR+
 WpDHh5T0K6Px8ERCp/LAqIQ7CRpGV0cHN5fSsX0Rpfsx8yo2aobxiF9AI6R7MGmQg0Ar
 505J/KND4L/wfuat4SKX1kB8EAjqExP7WB4HfULUAo8snr/RDfOkPsxeLNaJvCw1C18e
 7sbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
 :to:cc;
 bh=dOovq1HyDrqfZRA7cyTxANlCUU7vbRrdubbQgpxlZkc=;
 b=Ktv3p7t2WhTUUKRA7NIywKPAIUJy3dfBxBQ9bvzd8TVXi5MT5hCATJ0Azk/z1274I6
 SABmsakgH+jw7dj2MiPlVvsRY5qO+9EdUzDZUA7Fw1S2+L3HdQL6vTccVq4kiCiLy43E
 BxnGQ62+uzt/eaCR98U6wM2fhyAyArmzNT423h4JE/nk75sleMKDAovZaiscKX/sORPG
 3nocXD4fNPZHFTT/RgpBddzlgzvCmZNwSkKCjfSQOeNlbJt8qHQ2qVrYCF56YuHPqFHK
 9owyUsMTjMdljoDCrwfOMwEZQXXMNa9B79QELtx48JJKGO4gr/S1sjvnhoLKWreTxZZ0
 lAJQ==
X-Gm-Message-State: AOAM532VWOCB5mIdUyL4slT5cnF10cLxfzawIwi4op8Zp8VaAhVvDcn8
 lRNkgwYZj5X4TCVks6ktQNBsTRmya1V/ORwvzYJrwUu1yqa5F2zidUR9nuozvLv2fLjcFUg6cJr
 zhxU/3GEDauX0oYDeMoRqVUNHxg/CNQuUZAj1+R222ru6pQG5q6fU
X-Google-Smtp-Source: ABdhPJzBcEpJtudVzm8OgLoP5imVJrik4Zw2K3XoFN/37En0JyGy4UG/P0eieX2uFNwutcNYOPAX6TA=
X-Received: from scw-glinux.svl.corp.google.com
 ([2620:15c:2ce:200:f693:9fff:fef4:29b5])
 (user=scw job=sendgmr) by 2002:a0c:a8dd:: with SMTP id
 h29mr6101554qvc.24.1608319936974; 
 Fri, 18 Dec 2020 11:32:16 -0800 (PST)
Date: Fri, 18 Dec 2020 11:32:09 -0800
Message-Id: <20201218193213.3566856-1-scw@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.29.2.684.gfbc64c5ab5-goog
Subject: [PATCH v3 0/4] fcntl and sockopt options
To: qemu-devel@nongnu.org, laurent@vivier.eu
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::749;
 envelope-from=3wAPdXwMKCkEvfzjrrjoh.frpthpx-ghyhoqrqjqx.ruj@flex--scw.bounces.google.com;
 helo=mail-qk1-x749.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
Cc: Shu-Chun Weng <scw@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: Shu-Chun Weng <scw@google.com>
From: Shu-Chun Weng via <qemu-devel@nongnu.org>

Hi Laurent,

This is a series of 4 patches in 2 groups, putting into a single thread for
easier tracking.

[PATCH v3 1/4] linux-user: Support F_ADD_SEALS and F_GET_SEALS fcntls
  An incidental follow up on
  https://lists.nongnu.org/archive/html/qemu-devel/2019-09/msg01925.html

[PATCH v3 2/4] linux-user: add missing UDP get/setsockopt option
[PATCH v3 3/4] linux-user: add missing IPv6 get/setsockopt option
[PATCH v3 4/4] linux-user: Add IPv6 options to do_print_sockopt()
  Updated https://lists.nongnu.org/archive/html/qemu-devel/2019-09/msg01317.html
  to consistently add them in get/setsockopt

v1 -> v2:
  Address comments on the first 5 (was 3) patches.
  Fix style problems.

v2 -> v3:
  Split off first four reviewed changes into own group per
  https://lists.nongnu.org/archive/html/qemu-devel/2020-12/msg05149.html
  Rebase to master on Dec 18, 2020

Shu-Chun Weng (4):
  linux-user: Support F_ADD_SEALS and F_GET_SEALS fcntls
  linux-user: add missing UDP get/setsockopt option
  linux-user: add missing IPv6 get/setsockopt option
  linux-user: Add IPv6 options to do_print_sockopt()

 linux-user/strace.c       | 153 ++++++++++++++++++++++++++++++++++++--
 linux-user/syscall.c      |  20 ++++-
 linux-user/syscall_defs.h |  14 ++--
 3 files changed, 172 insertions(+), 15 deletions(-)

-- 
2.29.2.684.gfbc64c5ab5-goog


