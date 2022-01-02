Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3376482C6F
	for <lists+qemu-devel@lfdr.de>; Sun,  2 Jan 2022 18:43:56 +0100 (CET)
Received: from localhost ([::1]:41528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n44tf-000060-DG
	for lists+qemu-devel@lfdr.de; Sun, 02 Jan 2022 12:43:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <carwynellis@gmail.com>)
 id 1n44rq-0006KL-Rr; Sun, 02 Jan 2022 12:42:02 -0500
Received: from [2a00:1450:4864:20::429] (port=33637
 helo=mail-wr1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <carwynellis@gmail.com>)
 id 1n44rp-0003lU-BT; Sun, 02 Jan 2022 12:42:02 -0500
Received: by mail-wr1-x429.google.com with SMTP id d9so65918261wrb.0;
 Sun, 02 Jan 2022 09:42:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version:signed-off-by
 :content-transfer-encoding;
 bh=/RloWi4NnWFUkJAUfth5A2gIvX9pKr10npzQltNYZRg=;
 b=pi5vKq/6xmmUJhGWPCQzlvKRzlW9YWGoxpIdm7io09CviNmbUyUwdm+OnQiDuQrFse
 HvMndzn4jlHExWGa2XDS3D3VV/X23DlG9FXfvGaUIP23V/mUjRjpWDKTyjJza/GM1wLY
 O/NkhTHOB87/FRQ/cxhwNnN5SsDazgXntYDLPJC85XBGVMMfGP7Ghf5bkbys3+vfdA8e
 1CHGWKtu/7HnuhU/4AN/J8bd+v16PkzhlNBBLOIkgGIvNv5FPy5qCu/0YPWaAZguUxdx
 3O1oAuXwfV3Nd18ooA7C67li8JGkwTkh5hXrcX1UrCA4ukPnTJq+1vUhMietY5+IPxmy
 ij/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :signed-off-by:content-transfer-encoding;
 bh=/RloWi4NnWFUkJAUfth5A2gIvX9pKr10npzQltNYZRg=;
 b=wm9gKRqv+8LSVon0+r+QcNpmASij/oohvbhPaxmbfACowbNkUYcKFju4XNS7L+/KO1
 8Ep/HFRGdszGOXf6iNBboRhHB2MuuqiVOaUZH/A139VTKK9CvAtaJ0UQP4y4p6hD8zg0
 xdytzzPWW4nLO3azCs/1LX0zZ0VfDxhIGVhgLrsMrECqOdGevGwW4XiZdGdNvKXg248j
 jptiZjITT69f6IQ0ff64AsKN9DJbYC1YLc3yl9VQVk3aFkO5izxx9dqr0Klzc6NNdSGy
 ry0au5G5M8uw7GBaZ4dRCdaQ6kATHRC7n7gmrupEMHwaqAdl1HqhylBWbFclfVp6l+tp
 +HCg==
X-Gm-Message-State: AOAM531kstC7RV3RM+3NP1FIc2tWp5yovRCaJsu7OdCjgKhN2LwfWche
 UO+Qvy4UZBQnx3bhKIqAL98s0P+uqvk=
X-Google-Smtp-Source: ABdhPJyCQOAUOBi1c2vMhAIwAtXUGtuAJeNVfe/+22beamakYw8DmArtxnvJYyoPXQhUt4COGLZ4tw==
X-Received: by 2002:a5d:6d84:: with SMTP id l4mr36763992wrs.61.1641145318871; 
 Sun, 02 Jan 2022 09:41:58 -0800 (PST)
Received: from localhost.localdomain (201.11.75.194.dyn.plus.net.
 [194.75.11.201])
 by smtp.googlemail.com with ESMTPSA id w9sm1626565wrq.70.2022.01.02.09.41.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Jan 2022 09:41:58 -0800 (PST)
From: Carwyn Ellis <carwynellis@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] ui/cocoa: Add option to disable left command and hide
 cursor on click
Date: Sun,  2 Jan 2022 17:41:51 +0000
Message-Id: <20220102174153.70043-1-carwynellis@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Signed-off-by: Carwyn Ellis <carwynellis@gmail.com>
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::429
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=carwynellis@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: 6
X-Spam_score: 0.6
X-Spam_bar: /
X-Spam_report: (0.6 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org,
 Carwyn Ellis <carwynellis@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Supersedes earlier submissions and splits the patch into two separate
patches covering

  - addition of left-command-key option to disable forwarding this key
    to the guest
  - fix for persistent mouse cursor when switching from and back to the
    QEMU window

Having made the switch to an M1 Mac I needed to switch from VMware back
to QEMU in order to run some intel guests.

This patch addresses a couple of niggles with the cocoa UI, namely:

 - Using command-tab to switch between the guest OS and MacOS sends the
   command keypress to the guest which can be annoying e.g. on a
   windows guest this may trigger the start menu

 - Switching between the guest and MacOS sometimes leaves the MacOS
   mouse cursor visible with no way to hide it without switching
   windows again

I've made the following changes

 - Added a new cocoa display option left-command-key which can be used
   to disable the left command key in the guest. Default is on.

 - Added a call to ungrabMouse in the applicationWillResignActive method
   which frees the mouse and unhides the cursor when switching away from
   the QEMU window. When switching back the user must left-click in
   to grab the mouse and hide the cursor again. After testing several
   different approaches this was the only way I could find to reliably
   hide the cursor every time the user returns to QEMU after switching
   to another app on the host machine.

 - Updated the command line docs to reference the show-cursor option
   which is also respected by the cocoa UI code.

Carwyn Ellis (2):
  ui/cocoa: add option to disable left-command forwarding to guest
  ui/cocoa: release mouse when user switches away from QEMU window

 qapi/ui.json    | 17 +++++++++++++++++
 qemu-options.hx | 12 ++++++++++++
 ui/cocoa.m      | 10 +++++++++-
 3 files changed, 38 insertions(+), 1 deletion(-)

-- 
2.34.1


