Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B31A2FE4DD
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 09:25:02 +0100 (CET)
Received: from localhost ([::1]:40236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2VH2-00020s-Fu
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 03:25:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <39jkJYAMKCpU2835DD5A3.1DBF3BJ-23K3ACDC5CJ.DG5@flex--dje.bounces.google.com>)
 id 1l2VFT-0000eq-E2
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 03:23:23 -0500
Received: from mail-vs1-xe49.google.com ([2607:f8b0:4864:20::e49]:51203)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <39jkJYAMKCpU2835DD5A3.1DBF3BJ-23K3ACDC5CJ.DG5@flex--dje.bounces.google.com>)
 id 1l2VFR-0007Ei-MJ
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 03:23:23 -0500
Received: by mail-vs1-xe49.google.com with SMTP id u15so149063vsg.18
 for <qemu-devel@nongnu.org>; Thu, 21 Jan 2021 00:23:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:message-id:mime-version:subject:from:to:cc;
 bh=8FyVEsTE2UNLRLvEaTqaY1kG+4HxPxbGy2tRuWRf5XA=;
 b=sLVtmAq/Ex5CRblkJeEerPxaz8D0Qmm0656zlMdMcDp8R5HQRoFOdTkJ+h8GK0DHB+
 fZYKX/wkwXaGheARueC4P32m1AEVRd1+pMitmR05Zt/s9ROUYtO3OD1rQpOUhrVeFLOO
 bfIiruXqGNplFt2zZAEmwPTodGjFKvr586i+qIkGWjfz10/50VwzLEYzCbh+2/BLyHvx
 2uB/suBZCUyQ3loY82taReGna027+td6Aoz2UVjj55/f08tqTfLMGOPvU2RDCNOuc4GY
 SaX+rpOjsExLiYcgP4n8qs1CkSS5PF4FMvSb9VbRkX0+EmpluswQoydYeYM+gqYHiz3b
 s9tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
 :to:cc;
 bh=8FyVEsTE2UNLRLvEaTqaY1kG+4HxPxbGy2tRuWRf5XA=;
 b=XZSX6kxpZXs4zkzriBZbqk9Vkqi8T5kGMkDC5Cgo6EhHcWpRlbZOY9PMu82utPpoGi
 ay8HVvcwT8gQDqmU41GPoUTjlEQSy6AE8/sdqyCMSG73GyZjNqw4kaJe1ev49nB6bPtK
 u83y8nvXjMfk4oVfr1yugpLS2mdx/e9BFPY6w8IdNT/Ol0KHd/vSJfk2Ahn5sxldD9+N
 bZd9ZPauKJfeSN0xkTBSSXN/Ahcm5NqaGbcVmaRWFsf6vFbMIBM2aLWmJnmw441wNnBh
 3DcEIpbPY5L9CVTZMFH8wQOgBnTjdAZJuHpw01JuA30jjbZVDkBcgIyktGjMfSioFn6n
 Ds5A==
X-Gm-Message-State: AOAM532pOaVNx4O1mFRxZ554xG6bInoKAqjKNn1FEeHEtDs4jh1kVlsQ
 o6zfSxCR6StBclrMeqolSSg3Eq0me+bK3pe8512SDXFNLxYN501l77MZuxz1DPEtxpk/lbtOOB8
 W1wXzHL+d0HA+y97R9ScH+DYH5/s/+/oYAhIeBuRAnK3IqcewUma8
X-Google-Smtp-Source: ABdhPJxYlA2q0Q4iK0BAEYxSAtOz2O9hmrT0kBV7iWIZCd05m4pxz5a8xdm78NwbHW0A4UPVEN0W+fs=
X-Received: from ruffy.mtv.corp.google.com
 ([2620:0:1000:1412:4a0f:cfff:fe66:e570])
 (user=dje job=sendgmr) by 2002:a05:6102:22e7:: with SMTP id
 b7mr9885155vsh.3.1611217398950; Thu, 21 Jan 2021 00:23:18 -0800 (PST)
Date: Thu, 21 Jan 2021 00:23:12 -0800
Message-Id: <20210121082314.458600-1-dje@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.30.0.296.g2bfb1c46d8-goog
Subject: [PATCH 0/2] Add ipv6 hostfwd support
To: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e49;
 envelope-from=39jkJYAMKCpU2835DD5A3.1DBF3BJ-23K3ACDC5CJ.DG5@flex--dje.bounces.google.com;
 helo=mail-vs1-xe49.google.com
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
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>, Doug Evans <dje@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Doug Evans <dje@google.com>
From: dje--- via <qemu-devel@nongnu.org>

Hi. This patchset takes the original patch from Maxim,
https://www.mail-archive.com/qemu-devel@nongnu.org/msg569573.html
and updates it.

The first patch is the slirp additions, the second patch adds the u/i.

Doug Evans (2):
  slirp: Add ipv6 hostfwd support
  net: Add ipv6_hostfwd option

Slirp:
 src/libslirp.h |   6 +++
 src/slirp.c    |  51 +++++++++++++++++++++--
 src/socket.c   | 109 +++++++++++++++++++++++++++++++++++--------------
 src/socket.h   |   9 ++++
 src/udp.c      |  73 ++++++++++++++++++++++++++-------
 src/udp.h      |   2 +
 6 files changed, 202 insertions(+), 48 deletions(-)

QEMU:
 hmp-commands.hx     |  29 ++++-
 include/net/slirp.h |   2 +
 net/slirp.c         | 311 +++++++++++++++++++++++++++++++++++---------
 qapi/net.json       |   1 +
 slirp               |   2 +-
 5 files changed, 279 insertions(+), 66 deletions(-)

-- 
2.30.0.296.g2bfb1c46d8-goog


