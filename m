Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id C886A1C344B
	for <lists+qemu-devel@lfdr.de>; Mon,  4 May 2020 10:25:40 +0200 (CEST)
Received: from localhost ([::1]:57490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jVWPz-0000Gy-PD
	for lists+qemu-devel@lfdr.de; Mon, 04 May 2020 04:25:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jVWKe-0001rH-AT; Mon, 04 May 2020 04:20:08 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:52011)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jVWKd-00049q-MM; Mon, 04 May 2020 04:20:07 -0400
Received: by mail-wm1-x332.google.com with SMTP id x4so7420837wmj.1;
 Mon, 04 May 2020 01:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=S2iyL6/1VIZMjVwjgjrt3vdlGu/LZgoQ7jcMfhHLK4U=;
 b=iih1I5uTPsqlW+ikB2efyPwT3w6aSFs2g6wbivh+fcOum/WG5c8PPYAafxIi2cPxIN
 3L7kR3TGVZqumrcOLqSJmfPvJZsxXK2cFvNS0pM0aVFsVkxmUs410tIAXLxO7YeNhM5Z
 ZY9932qNPexY0IyK3TuZhi6M7ZLZajgFBJnxWRYPi5MBIm5o4REAivXsFjpv0DKh6Qg3
 A+AxkHaDi86Ple73bn+Wlm6LXK2C7I0ufnGKCCWskUkHkh7eeRQnhhyd9tSOdMSLqlTF
 c0ZShkg9YZ0NG++MP+gKDhpeOyxnpi/UvJOK6Nj41q1clRzOXoqp99vxj46pCh5lIrGC
 vTzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=S2iyL6/1VIZMjVwjgjrt3vdlGu/LZgoQ7jcMfhHLK4U=;
 b=ArB6DzJYs53tOFsd+Pdd7fvijyaDs6I0uqO7LYLoI0rqI5998zC54OtKe++6Y8p8Xp
 xeXqajdhwwPOQHcP7flNC8S9Y3cguQkUYwZPdynrYP2jiTOhOXawAlZV6sQyiVUJhCqG
 7S/G92+8TujG4Zd/L01akAkSyenYQD9IubqyWm9NFu/YCl7v6QCqfvonr/IRtixR7zkz
 fQGI96ApaNv9Mtm6/AO1rleMhw4I2Z538Z8VFmlZnOWgadJ0Tc4fg/b+6FLd704Q93H+
 GuU1nliI9hOfJTVs3fLvbj6nzw1QUSK34r3ZIe6IdNRH8KNCqCYxS46rb4tpH9gDAez2
 UG+Q==
X-Gm-Message-State: AGi0PuZig4Z3wE7EFa86y3+iaekS5RznPgHIn4bWEoG42cYWOG3awqm2
 zNbCR92W1LrzotYA5ctzSiYZRZnl
X-Google-Smtp-Source: APiQypKjBykNZutCNkkOL/kQ6z0fvmPCWbVvMfTGBICBm9nNUW330r2AwtdJuTQ9rafeE3GZPFXNuA==
X-Received: by 2002:a7b:cd10:: with SMTP id f16mr13861215wmj.21.1588580405658; 
 Mon, 04 May 2020 01:20:05 -0700 (PDT)
Received: from x1w.redhat.com (26.red-88-21-207.staticip.rima-tde.net.
 [88.21.207.26])
 by smtp.gmail.com with ESMTPSA id z18sm17018816wrw.41.2020.05.04.01.20.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2020 01:20:04 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] hw/display: Trivial include cleanups
Date: Mon,  4 May 2020 10:20:01 +0200
Message-Id: <20200504082003.16298-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Thomas Huth <huth@tuxfamily.org>, Michael Tokarev <mjt@tls.msk.ru>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>, qemu-trivial@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Some 'display' patches worth salvaging while doing housekeeping.

Philippe Mathieu-Daudé (2):
  hw/display: Include local 'framebuffer.h'
  hw/display/edid: Add missing 'qdev-properties.h' header

 include/hw/display/edid.h | 1 +
 hw/display/artist.c       | 2 +-
 hw/display/next-fb.c      | 2 +-
 3 files changed, 3 insertions(+), 2 deletions(-)

-- 
2.21.3


