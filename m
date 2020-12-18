Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 900182DE9F2
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 20:56:07 +0100 (CET)
Received: from localhost ([::1]:45576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqLrC-0000DU-2H
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 14:56:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <33QjdXwMKCmgYIcMUUMRK.IUSWKSa-JKbKRTUTMTa.UXM@flex--scw.bounces.google.com>)
 id 1kqLpK-0007QJ-7O
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 14:54:10 -0500
Received: from mail-qv1-xf4a.google.com ([2607:f8b0:4864:20::f4a]:55365)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <33QjdXwMKCmgYIcMUUMRK.IUSWKSa-JKbKRTUTMTa.UXM@flex--scw.bounces.google.com>)
 id 1kqLpI-0007G7-DS
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 14:54:09 -0500
Received: by mail-qv1-xf4a.google.com with SMTP id j5so2768956qvu.22
 for <qemu-devel@nongnu.org>; Fri, 18 Dec 2020 11:54:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:message-id:mime-version:subject:from:to:cc;
 bh=f/LZ+aughdMqT3MDeeEbaRm5KaqTK4o5PPLmooiFelU=;
 b=bkGk3dCFYfb7i5HNqlyQ/+Arz+Ayqy9/bNysWYEtn/56MzIBV1LN6nNmkBumeQbKrv
 ezQBJzVTCDbiJhmDW0daPXNO8FvOapt/Wd4W0TEXDMBnq2v2w7Rm+53SWRxMjRKN0eb/
 LMXMnVi/iGl4mfYZW4w/NioBULAa0PMT49L0L6vYQcMP+zEifp7641DoK79GM/84iwTl
 lZtA+rPi2zbhPT8bQ1Nd3pfFfkoVKq0zUHsBPfCwgC4lypIwHd35HH4Crx1q4VnYVAB5
 HfozXCnUHAWI2NqbjSmEqFB1oi0X5npU8QNM0pU3tl8ZqvebYrnhsJWQh2LFcYc/9umw
 RywQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
 :to:cc;
 bh=f/LZ+aughdMqT3MDeeEbaRm5KaqTK4o5PPLmooiFelU=;
 b=WX9Wi7gVkMFnO4mtyefPIjW6zjSWA+4TZmOJdpBhfESfLMsY5ZToQHppk+CPJsm7zq
 moHS88DAxzgnkgR2Q8bctx73zf7H4ICWKj9ALBjzJAqU56RMLWJpRbSrdCLG8dXcFze7
 M0AgNnwaT0pK/tQj443AxqXnjoIuhSHoCkTH7XbubY3CrGWV9yAQaGxaXIjNz5TlekgJ
 wF+X/lY0IZo3OpTgmmRwgv3PYgHmTH1C3k3SsVLyo1JutFlxegOkKxpmGY05qqD3mmNb
 lvyEcV/5JkxekvAPqQs9i+jWfAuPYuSXuLXGaSwAaFCc40FTUkrlRdDYepXSwQ/LzMxC
 lW7g==
X-Gm-Message-State: AOAM532qCOxJ2a7ij8ADnt+szHayZdZ9F9jnQ2GAGmkU8yye6ID1jgxr
 pTHaFaLuhpWn70P16p2iYUHN1rLdLISUjBlq0cp9e6CVCz0Q0pXonUW99ZrNknC1E/jumzlybXe
 zO30iACB93ieJHOvIjvfR9xdDaVY+u9WYBUcebkapA83TSX/aE4gW
X-Google-Smtp-Source: ABdhPJxTUWa1I8q62K6IvtYeW529VNQGRZOh/tG4V2/hffBWOk7NmxpSEOtX/j9U8oSO/Iaa+a/nwmg=
X-Received: from scw-glinux.svl.corp.google.com
 ([2620:15c:2ce:200:f693:9fff:fef4:29b5])
 (user=scw job=sendgmr) by 2002:a0c:f74a:: with SMTP id
 e10mr6431111qvo.47.1608321245863; 
 Fri, 18 Dec 2020 11:54:05 -0800 (PST)
Date: Fri, 18 Dec 2020 11:54:00 -0800
Message-Id: <20201218195402.3581189-1-scw@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.29.2.684.gfbc64c5ab5-goog
Subject: [PATCH v3 0/2] linux-user: SO_TIMESTAMP/NS/ING sockopt
To: qemu-devel@nongnu.org, laurent@vivier.eu
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f4a;
 envelope-from=33QjdXwMKCmgYIcMUUMRK.IUSWKSa-JKbKRTUTMTa.UXM@flex--scw.bounces.google.com;
 helo=mail-qv1-xf4a.google.com
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

This is the two timestamp-related patches splitted off per
https://lists.nongnu.org/archive/html/qemu-devel/2020-12/msg05149.html

v1 -> v2:
  Address comments on the first 5 (was 3) patches.
  Fix style problems.

v2 -> v3:
  Split off into own group per
  https://lists.nongnu.org/archive/html/qemu-devel/2020-12/msg05149.html
  Rebase to master on Dec 18, 2020


Shu-Chun Weng (2):
  linux-user: Update SO_TIMESTAMP to SO_TIMESTAMP_OLD/NEW
  linux-user: setsockopt() SO_TIMESTAMPNS and SO_TIMESTAMPING

 linux-user/alpha/sockbits.h            |  21 +-
 linux-user/generic/sockbits.h          |  17 +-
 linux-user/hppa/sockbits.h             |  20 +-
 linux-user/mips/sockbits.h             |  16 +-
 linux-user/sparc/sockbits.h            |  21 +-
 linux-user/strace.c                    |  19 +-
 linux-user/syscall.c                   | 230 ++++++++++-
 tests/tcg/multiarch/socket_timestamp.c | 540 +++++++++++++++++++++++++
 8 files changed, 844 insertions(+), 40 deletions(-)
 create mode 100644 tests/tcg/multiarch/socket_timestamp.c

-- 
2.29.2.684.gfbc64c5ab5-goog


