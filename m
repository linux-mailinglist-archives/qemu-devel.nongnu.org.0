Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D3E62DEB39
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 22:44:03 +0100 (CET)
Received: from localhost ([::1]:51520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqNXe-0002OU-3R
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 16:44:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3GiLdXwMKCtcL5P9HH9E7.5HFJ7FN-67O7EGHG9GN.HK9@flex--scw.bounces.google.com>)
 id 1kqNVX-0001Gv-Ck
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 16:41:51 -0500
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49]:56528)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3GiLdXwMKCtcL5P9HH9E7.5HFJ7FN-67O7EGHG9GN.HK9@flex--scw.bounces.google.com>)
 id 1kqNVU-0002Z8-KC
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 16:41:50 -0500
Received: by mail-yb1-xb49.google.com with SMTP id z62so4868533yba.23
 for <qemu-devel@nongnu.org>; Fri, 18 Dec 2020 13:41:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:message-id:mime-version:subject:from:to:cc;
 bh=9D+EwOaRrEW455zjXP1G13SzgUlijDt1dGVSsiDPC2g=;
 b=TcaLwU9sbVdNsxrUu6g1QHOClUIbmzxexu3UyLSNdvpPl7sOuZYJY78Zj72EgoMOBX
 0jJkpeyRzTNxlbERwyWXvpUAjwUwG2zCB++6aXT5TlW1SKlmIzQAjeTCPJdVkzagsNU0
 EbNZQjEJ/P7zim/GXe8rhHpxAX5ZD5d7q5u3ojslR+miui53sZgs06+V001pokWAUy6g
 lwC/E3SFr/BFiiMmoSbLXaHeVlSUik5tfPaYA/aQ2XKb8BrJwgjHAXAJqMuCuhLy0KRJ
 PCHkKxdaDbRJgG6rggaJFWZc+2ly6m6mrMnesB+qvyK8r2hwWCUzkD0shJQsv6Ja8nYa
 QoUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
 :to:cc;
 bh=9D+EwOaRrEW455zjXP1G13SzgUlijDt1dGVSsiDPC2g=;
 b=reg3XPxWs2e/bypLxk/xOe0T9NLpVw+snJ4zONJeDsNaFCKxOVKbsohaYFR2vrZfWx
 Vpp7c3mekebV8yw1ZN+3uHaC1yrw68N6bnuevrrG8flmKJzmnmnKVP3WW/Ms+YEe9RTy
 Ibpb7vvC4gjzs/ilbHnw/JQyYZHMUL8NEuLtnlKsr3/XaljFwkhNxdjARgAh6Z+d+oy5
 bvueo8XrAtCxRUOwKpSi6cjqFgMiQics+LulMELtas1YoAQDxRMT4k9HRsbbagZm3AZi
 mOrUraZktuWtaiNWRx+IXaA2ohq0DMfUokvPEbGBxml5LfC8ZVfFa0sFuuRefaoxW9NU
 9d2A==
X-Gm-Message-State: AOAM533beMXvg4fWKiuxvSAy+pgOAZB4oGjisFSQteDTYmf6/5Rp6Yai
 XMtYHn3XSl8DSHYa0AaduflSpuUazBqV0jlHd/ygr5Zft/vy66Whk9xBoYjCkRQWdr5TCLqoaRp
 cFPhfmczRzH0yANr4999huUxSJbYkMF85xdai0WSLNhlv7RfDlVYE
X-Google-Smtp-Source: ABdhPJybePpWgJ6s1tjrObvIqebENWq3iBM9iWVTAR7LrDBYNQXiBRyhFuX5s/mymWWl6T5rC9IFO2Q=
X-Received: from scw-glinux.svl.corp.google.com
 ([2620:15c:2ce:200:f693:9fff:fef4:29b5])
 (user=scw job=sendgmr) by 2002:a25:5f44:: with SMTP id
 h4mr8529102ybm.505.1608327706849; 
 Fri, 18 Dec 2020 13:41:46 -0800 (PST)
Date: Fri, 18 Dec 2020 13:41:40 -0800
Message-Id: <20201218214142.3673709-1-scw@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.29.2.684.gfbc64c5ab5-goog
Subject: [PATCH 0/2] thunk, linux-user: Add support for SIOCETHTOOL ioctl
To: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b49;
 envelope-from=3GiLdXwMKCtcL5P9HH9E7.5HFJ7FN-67O7EGHG9GN.HK9@flex--scw.bounces.google.com;
 helo=mail-yb1-xb49.google.com
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
Cc: Riku Voipio <riku.voipio@iki.fi>, Shu-Chun Weng <scw@google.com>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: Shu-Chun Weng <scw@google.com>
From: Shu-Chun Weng via <qemu-devel@nongnu.org>

Hi Riku and Laurent,

These two patches together implements the SIOCETHTOOL ioctl operations. Many of
the kernel structures in this operations make use of flexible arrays (array with
no size / zero size at the end of the structure), so I extended thunk to handle
these fields natively.

This patch set was previously sent out under "[PATCH 0/6] fcntl, sockopt, and
ioctl options" and the following revisions, but did not get any feedback.

Shu-Chun Weng (2):
  thunk: supports flexible arrays
  linux-user: Add support for SIOCETHTOOL ioctl

 include/exec/user/thunk.h     |  24 +
 linux-user/ethtool.c          | 848 ++++++++++++++++++++++++++++++++++
 linux-user/ethtool.h          |  20 +
 linux-user/ethtool_entries.h  | 107 +++++
 linux-user/ioctls.h           |   2 +
 linux-user/meson.build        |   1 +
 linux-user/qemu.h             |   1 +
 linux-user/syscall.c          |  36 +-
 linux-user/syscall_defs.h     |  12 +
 linux-user/syscall_types.h    | 280 +++++++++++
 tests/tcg/multiarch/ethtool.c | 423 +++++++++++++++++
 thunk.c                       | 152 +++++-
 12 files changed, 1893 insertions(+), 13 deletions(-)
 create mode 100644 linux-user/ethtool.c
 create mode 100644 linux-user/ethtool.h
 create mode 100644 linux-user/ethtool_entries.h
 create mode 100644 tests/tcg/multiarch/ethtool.c

-- 
2.29.2.684.gfbc64c5ab5-goog


