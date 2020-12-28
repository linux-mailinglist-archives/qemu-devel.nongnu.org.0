Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D82702E34F5
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Dec 2020 09:16:29 +0100 (CET)
Received: from localhost ([::1]:40184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ktnhc-0000fB-Uv
	for lists+qemu-devel@lfdr.de; Mon, 28 Dec 2020 03:16:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <devnexen@gmail.com>)
 id 1ktnfy-00089q-6f; Mon, 28 Dec 2020 03:14:46 -0500
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:44576)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <devnexen@gmail.com>)
 id 1ktnfv-0004dp-Sd; Mon, 28 Dec 2020 03:14:45 -0500
Received: by mail-ed1-x52d.google.com with SMTP id p22so9000552edu.11;
 Mon, 28 Dec 2020 00:14:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=bZPdva3rrEvtWTVI5+0aCjnTV2tMqJ91QjYptzh0T6k=;
 b=VgslnLbiUFtY9XC1A3QJ05ExgDU1KcSlh2GuJ8YaXRvdw7WMeqNmm6qMqXT+pzyTkg
 pKgYkUat+Zstl2+WVkj2VYzG7k+sAqol0DNw1Eo5R+nPZTNs5qsaBjgalodu9D7zbVOC
 pX8R3u337FhTW0NklJzPCFBAWkTrG+Pf/MzVWIfZUEKd4ObTAhfzV7cRb1kBOv+i449a
 hDtmzpZA6rAn8mhcM2x5c7FZrWa29qFZrFCgf95ri9JhnR+a4jEOKOcu7H/2yQPGQfYv
 kkGKmyUxzqEa+6r3CwAnWBAcisr6u1iyXxQQLVWSLKTsHyU7r/Uu7jtapn/ZnjJ1cORO
 j1pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=bZPdva3rrEvtWTVI5+0aCjnTV2tMqJ91QjYptzh0T6k=;
 b=C+JWrl2b0+qrDKdqFANihfldHT9yQ6rfXAZgJoyzE8fShjmqw8EstYNZZllVrmhkej
 7Ep7e9QFno9frGvgR53/yjhoFIhIo7EX6ACvGCY9QS5+ka98L3++DXYpm4TsugW9Qq5k
 QB+SwqPuMxHOmh0PDay5Qnh2xawuc8ZwUDM847DvhLhcBnpyvFWGteWbWXICX+7gRp39
 18u2pOAFl70i+MDAk5cjKJ1e+DrimM8TcAMY8mRKTjDSo3GcDZeDnMOzLgDUZaG/lbBj
 wWWyAUFklPndvUkldvHZjbV0a6eF8Dtlv6XRUK6X1fE3YKREGZaj2C/iOj98qTuImMRG
 0FtA==
X-Gm-Message-State: AOAM5339PxREuWBaqreusT6tUD+z5hveXn1dQf0lVb4rNIn33auNZEbG
 i+7ed7X0neS+hszpStshozIvjCQ56pAtFDevydABmxhW+/Q6lw==
X-Google-Smtp-Source: ABdhPJxAeeTIut19lP8uLRPFLZZWA9g4l2a1kiwO7RXX/hLiMDV7Bdzi7QpECiZMxxJGEEU+mJUOjUU2LAoTiCUG97Q=
X-Received: by 2002:a05:6402:354e:: with SMTP id
 f14mr33753298edd.183.1609143280682; 
 Mon, 28 Dec 2020 00:14:40 -0800 (PST)
MIME-Version: 1.0
From: David CARLIER <devnexen@gmail.com>
Date: Mon, 28 Dec 2020 08:14:29 +0000
Message-ID: <CA+XhMqwjq99QdTKntxbQ_rZ-L3bQX7D3WHLkwMdK6zmiP=_56w@mail.gmail.com>
Subject: [PATCH 0/2] bsd-user, FreeBSD update
To: qemu-devel <qemu-devel@nongnu.org>, QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=devnexen@gmail.com; helo=mail-ed1-x52d.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From 10b13162949debdbbd8394bc1047511d1a900176 Mon Sep 17 00:00:00 2001
From: David Carlier <devnexen@gmail.com>
Date: Mon, 28 Dec 2020 08:10:43 +0000
Subject: [PATCH 0/2] *** SUBJECT HERE ***

bsd-user, FreeBSD update.

David Carlier (2):
  bsd-user, updating the FreeBSD's syscall list, based on the 11.x
  bsd-user, Adding more strace support for a handful of syscalls.

 bsd-user/freebsd/strace.list  | 12 ++++++++++++
 bsd-user/freebsd/syscall_nr.h | 25 ++++++++++++++++++++++---
 2 files changed, 34 insertions(+), 3 deletions(-)

-- 
2.30.0.rc2

