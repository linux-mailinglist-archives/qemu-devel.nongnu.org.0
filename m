Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6271D479ED9
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Dec 2021 03:33:05 +0100 (CET)
Received: from localhost ([::1]:36002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mym0W-0003iX-DH
	for lists+qemu-devel@lfdr.de; Sat, 18 Dec 2021 21:33:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <orzechowski.alexander@gmail.com>)
 id 1mylys-0001Ty-Uq; Sat, 18 Dec 2021 21:31:23 -0500
Received: from [2607:f8b0:4864:20::731] (port=40591
 helo=mail-qk1-x731.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <orzechowski.alexander@gmail.com>)
 id 1mylyr-0003e6-EH; Sat, 18 Dec 2021 21:31:22 -0500
Received: by mail-qk1-x731.google.com with SMTP id p4so6107420qkm.7;
 Sat, 18 Dec 2021 18:31:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zt3DV620w/3r9Ik709MfDpAfUtpfb73j3MsVFH8yJds=;
 b=VSVeFJ2jGW24XmI+8H4wFwdjpgN66TMqxJKQE+X1ug4W+q2d2kigATTQYFFBHb4Sog
 k700hdmdca7ZYWzV87AjVZWDh5u89UWr5AOUiWp01n9HXo3RX8G3RPEZFhht5748zEgi
 H8r5ofx/npGZ6oASQGX2aV8wiejsJL76xregm4H11QZATKYmAGKfW/aW8JMVhcdUZbFG
 Qp63dQ6m2sULgcr1hubFwafkHXY9GJkMdloS97LBCs6Q9Y0K8Fq05vU+C2+yqZolwQlC
 4xJUJWc8+7kBL7RNN3mtyeVxaqfP6ooqH4kE3gnXzTchW4IC2ng13BMvGRZZYGWyj567
 gHoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zt3DV620w/3r9Ik709MfDpAfUtpfb73j3MsVFH8yJds=;
 b=QomqMFRHPW/ean8Ge+cfcqhA0490JIqz9IOohChagaxBWZ/0V4h4SzznzmLPQ1gchn
 /NgIVTbW6c+0aJFo9TWAvTlzpeGdjFXWw0MbtKjLKlQ20a5U6OKiHG0u2R+mZP2G37lX
 RHMy5/808/8wc+R6D/2lI8j6QtouGPr3KOT2T+eeQQQSrKKU/avhEYOp7oTpe9wzECEu
 LZC2o5uJcogyBhCS5A+nIgrIJhDdtab0GYvyFPkyBAHzC3Oum+j4G+4UuE/w3KzkGMOQ
 /GSdM8JX2K+w0ysXWjYlH2v0IpPKwY7txzjFKjQxgN0O7yIDq+mxE5T2KWw0FLidJoUQ
 66GQ==
X-Gm-Message-State: AOAM533BHEEG1tFjAodHM0aEpHgY2UaEAWwHOS0BL2ECv7VdjNV+GY6C
 L5uBhi2JaMgFXDL+MEaVpin4kbhfjARgpzeRbQY=
X-Google-Smtp-Source: ABdhPJxM9N1HSt9BAS20uX9SNMaH7u6M9qajEDcT03cg6JrV5vE/Xk3q3leLhpHKVXFfoLYy8SijLw==
X-Received: by 2002:a05:620a:470e:: with SMTP id
 bs14mr6072378qkb.210.1639881070410; 
 Sat, 18 Dec 2021 18:31:10 -0800 (PST)
Received: from alexdesktop.localdomain
 (cpebc4dfb42ca53-cmbc4dfb42ca50.cpe.net.cable.rogers.com. [99.251.122.96])
 by smtp.gmail.com with ESMTPSA id m4sm10174293qtu.87.2021.12.18.18.31.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Dec 2021 18:31:10 -0800 (PST)
From: Alexander Orzechowski <orzechowski.alexander@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/4] UI fixups
Date: Sat, 18 Dec 2021 21:30:02 -0500
Message-Id: <20211219023006.124530-1-orzechowski.alexander@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::731
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::731;
 envelope-from=orzechowski.alexander@gmail.com; helo=mail-qk1-x731.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
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

Some UI fixups including one revert.

I have some things that I want to have a discussion about. Fullscreen mode
will always distort the virtual console. Is this behavior we really want? If we
get rid of this, we can combine scale_x and scale_y into a single variable
and simplify things a little bit.

Also just from looking around a little bit in ui/gtk-egl.c the code
seems super broken regarding the virtual console rendering in the correct place.
I'm unable to test those code paths so I haven't touched it for now.

Alexander Orzechowski (4):
  ui: Use allocated size instead of window size
  ui: Remove unnecessary checks
  ui: Revert: "fix incorrect pointer position on highdpi with gtk"
  ui: Fix gtk/gl when the scaled virtual console does not fit the window

 ui/gtk-gl-area.c | 34 ++++++++++++++++++++++++-----
 ui/gtk.c         | 57 +++++++++++++++---------------------------------
 2 files changed, 46 insertions(+), 45 deletions(-)

-- 
2.34.1


