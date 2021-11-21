Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96DB8458297
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Nov 2021 09:54:55 +0100 (CET)
Received: from localhost ([::1]:48362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1moicg-00019z-FN
	for lists+qemu-devel@lfdr.de; Sun, 21 Nov 2021 03:54:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <orzechowski.alexander@gmail.com>)
 id 1moglE-0005Jq-2C; Sun, 21 Nov 2021 01:55:36 -0500
Received: from [2607:f8b0:4864:20::f32] (port=34594
 helo=mail-qv1-xf32.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <orzechowski.alexander@gmail.com>)
 id 1moglB-0002yR-Dl; Sun, 21 Nov 2021 01:55:35 -0500
Received: by mail-qv1-xf32.google.com with SMTP id i13so10201819qvm.1;
 Sat, 20 Nov 2021 22:55:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VBZdCZwrgI7co0FlatAmRyngorwgBGgTSbhgup+mEeg=;
 b=I6o3EJEz7wxis7Tigi71jItJp5Qgn0OaJ2sksYbMt3Pfd1PKYCbqlV5T3+MTZY5Ek/
 pyQyyl3JqwtrNfNtd6Ze1pZTS+xGG8B5UBtlbA4XRw6bu390BL1y4pKRUTpWvnMBo5Fq
 yl5zeYIJu00MUk1Lig/vA5hlK9eM0g+suDnubuzFWxQ7Pn9mVVMsPeu/5+jvI0h9ldQK
 yQ1E3poFWW+q7C1bBVSlr8bHXlovVD69UDyi36NTcgB0RLTiYvDCLlXq59qYMZBKE99W
 yaXGC55cjOZkzMg4KmiPclNRRZzWlv7z5jx/KjPjaH0tVk/95vL7+Z97A/1dRELrzqlW
 NrQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VBZdCZwrgI7co0FlatAmRyngorwgBGgTSbhgup+mEeg=;
 b=GPwtZ7xJQnPPMNCFTa+n7JxQGZtnwL2Qi5H6zY85/RWP6wjlXhiZSf3LwCaH5B/q4i
 lxX4OSTupF8Ra8KVpcUuhvaCKtYxUs5L3Sz+SceNTXYYWFxRS71XA93KHzCf/COpT7SQ
 C4EwDg0AMRT7hUogr6R9leltAlDWneBCPNZWEit11A8OpgUI5Xte39lY5Mxk5r+IHAJv
 kZfPpnVntd0oc1D5lAR/7q2zbZvgJf2rX+8yxBNebSgOG4zVbF53nG5AheqOboU9MseY
 P8xASjiNSbZoVu/dFjI1fYap5X28FJw7GfV78pWfHU5mCubHDFpI3drjQkTShOirXNT6
 k/jw==
X-Gm-Message-State: AOAM531Eo0mUvnDz3Fx0W5GYHOjD/Zrdy0tcCF7kRl7Wu5w6H7Bm2xWY
 2YS5hEVE666Rkb7ATRGsRSIq1nTfFym8UYHeVhI=
X-Google-Smtp-Source: ABdhPJwbetCyKheuQZD9WgOOqQ20u8ake0ewsOk/flgY0c15sqfn3iQ6AWC/evqEj+BbEXoD0r7OAA==
X-Received: by 2002:a05:6214:f2d:: with SMTP id
 iw13mr90888489qvb.13.1637477731645; 
 Sat, 20 Nov 2021 22:55:31 -0800 (PST)
Received: from alexdesktop.localdomain
 (cpebc4dfb42ca53-cmbc4dfb42ca50.cpe.net.cable.rogers.com. [99.251.122.96])
 by smtp.gmail.com with ESMTPSA id j24sm2489860qkg.133.2021.11.20.22.55.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Nov 2021 22:55:31 -0800 (PST)
From: Alexander Orzechowski <orzechowski.alexander@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] Fix trivial errors with highdpi/wayland
Date: Sun, 21 Nov 2021 01:55:02 -0500
Message-Id: <20211121065504.29101-1-orzechowski.alexander@gmail.com>
X-Mailer: git-send-email 2.34.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::f32
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f32;
 envelope-from=orzechowski.alexander@gmail.com; helo=mail-qv1-xf32.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sun, 21 Nov 2021 03:51:46 -0500
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-trivial@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Alexander Orzechowski <orzechowski.alexander@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, this patch series is ment to fix two problems with highdpi/wayland
with gtk that makes the program unusuable. As it stands currently:
The virtual machine window will only render in the bottom-left quarter of the screen
(with 2x scaling) while using the gtk,gl=on and virtgl backend. This also
fixes the --usbdevice tablet option as before if the pointer would click
in the incorrect spot of the virtual machine then was expected.

Alexander Orzechowski (2):
  ui: fix incorrect scaling on highdpi with gtk/opengl
  ui: fix incorrect pointer position on highdpi with gtk
 
 ui/gtk-gl-area.c |  7 ++++---
 ui/gtk.c         | 13 ++++++++-----
 2 files changed, 12 insertions(+), 8 deletions(-)

-- 
2.34.0


