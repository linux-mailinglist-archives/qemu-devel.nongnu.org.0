Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 446569A39F
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Aug 2019 01:17:52 +0200 (CEST)
Received: from localhost ([::1]:48690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i0wL1-00055S-52
	for lists+qemu-devel@lfdr.de; Thu, 22 Aug 2019 19:17:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53952)
 by lists.gnu.org with esmtp (Exim 4.90_1) (envelope-from
 <36iFfXQMKCpsN7RBJJBG9.7JHL9HP-89Q9GIJIBIP.JMB@flex--scw.bounces.google.com>)
 id 1i0wIB-0003UL-3F
 for qemu-devel@nongnu.org; Thu, 22 Aug 2019 19:14:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from
 <36iFfXQMKCpsN7RBJJBG9.7JHL9HP-89Q9GIJIBIP.JMB@flex--scw.bounces.google.com>)
 id 1i0wIA-0007it-4y
 for qemu-devel@nongnu.org; Thu, 22 Aug 2019 19:14:54 -0400
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49]:46395)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from
 <36iFfXQMKCpsN7RBJJBG9.7JHL9HP-89Q9GIJIBIP.JMB@flex--scw.bounces.google.com>)
 id 1i0wI9-0007i8-Vw
 for qemu-devel@nongnu.org; Thu, 22 Aug 2019 19:14:54 -0400
Received: by mail-yb1-xb49.google.com with SMTP id t18so5321558ybp.13
 for <qemu-devel@nongnu.org>; Thu, 22 Aug 2019 16:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=oSjaBZiB897A+JXI+hGh8XrU+/BygSpBt6d69nCXV4U=;
 b=BdRzCBCvXFIziyMLIe1oqvYA5pw9zWB45eV7s13IU/fvHtMyjQiI2Ft5PeEKpgOneF
 WMZEJN+ntJXCBCmyiBAOLT5rsBkdLr4VxMQm+0MPDWoEo8hO/9NxwD5w6sHe5OZjAR+Q
 HCziM6cbd4a0fYpuoGW7LDY7oGgdEJahtSMiGAaL6C5Nw56812g+Xl21aM8AoO8xuPgx
 6Own03viPAGKLeZBv4XxrVvhYExXIXVfArfcLrTJuzv1kIFVc0qO4yBW4YbGHgIVouUy
 /ZJG+RWJoYP/tsSq6Ig1Evq5gF0hPCx0p6GnVRiGAyVxBXhDB17CvAZadCpyuPUFyD8W
 em5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=oSjaBZiB897A+JXI+hGh8XrU+/BygSpBt6d69nCXV4U=;
 b=KtCE70Ix6E0nVWttb8/5OnnrjB4Uozq3DYlngq44U6v92aTn/1voNWRGNiQrqgOMb0
 jUKsCgq0hcxdgqwapLFnkFr5k2QUvZbDW3UikKACtS5xMlPIV9XyoiMi9BdtTqyFRhZV
 gj8W2g0jJQo9XWoanBNxyP84o3UKFb78Wu/cXSTqlgy8i732U5uMH+fW2CqUcitX0PK/
 bJaQq7sgD9iRnCA5rbCM7jvbopXwwLzSNmz8mdwjco1DIwR60SprCgkBIiy6ZCBs44Se
 BF4csMSOHwFzAGMJCRkZZzt2mzYihY5hZYclyblDkC4cBJZAZGnl4xzQa8CuE5z+tm3b
 cIpw==
X-Gm-Message-State: APjAAAXUxm/OaO/JAAuarCOb7aCyFhzzt+cYAf45qY9dq0xAFu00RGQw
 N7zy1dVxnAHWsAW5E1giabHO+bM=
X-Google-Smtp-Source: APXvYqxCz6dKhnBVZNLPDKMQ041r+77KdsIGHdg/H5/ohG8XN07yW8eDl4c/rXsLit0AvxrudDBgLrQ=
X-Received: by 2002:a81:914a:: with SMTP id i71mr1358782ywg.141.1566515690793; 
 Thu, 22 Aug 2019 16:14:50 -0700 (PDT)
Date: Thu, 22 Aug 2019 16:14:41 -0700
Message-Id: <20190822231443.172099-1-scw@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.23.0.187.g17f5b7556c-goog
To: Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::b49
Subject: [Qemu-devel] [PATCH 0/2] Adding some setsockopt() options
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
From: Shu-Chun Weng via Qemu-devel <qemu-devel@nongnu.org>
Reply-To: Shu-Chun Weng <scw@google.com>
Cc: Riku Voipio <riku.voipio@iki.fi>, qemu-devel@nongnu.org,
 Shu-Chun Weng <scw@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Shu-Chun Weng (2):
  linux-user: add missing UDP and IPv6 setsockopt options
  linux-user: time stamping options for setsockopt()

 linux-user/generic/sockbits.h |  4 ++++
 linux-user/mips/sockbits.h    |  4 ++++
 linux-user/syscall.c          | 16 +++++++++++++---
 3 files changed, 21 insertions(+), 3 deletions(-)

-- 
2.23.0.187.g17f5b7556c-goog


