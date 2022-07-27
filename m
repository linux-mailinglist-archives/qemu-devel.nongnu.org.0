Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 055BF5827C3
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 15:33:47 +0200 (CEST)
Received: from localhost ([::1]:49072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGhAX-000869-SP
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 09:33:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oGh5B-0003VP-Iq
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 09:28:13 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:36566)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oGh57-00021W-5U
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 09:28:10 -0400
Received: by mail-pl1-x62f.google.com with SMTP id x1so14360783plb.3
 for <qemu-devel@nongnu.org>; Wed, 27 Jul 2022 06:28:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HbB6FsiNnyi4VWdNQ+Dgn/yA/UpMNBqMDzAxxz8oQOs=;
 b=btrQ+SsrNwNAN7BLVNeO803VRtz1j1S8zPY7aLZRY7x/sTunfSV0NICnnWLmQvNGiX
 g0RYVcErUjiKptkGjj5jmWhjUNnM2SKUpB1pjWw93X/kVWZml0GwO7ZGdYzn7RnCTifV
 NmUkAyCPOxBosRCldUQ7J7iCjHYD3sEwFrmxWk7fH3olhqEQIKCdQ3oYYb3MQHaw/FIJ
 YINo65LIQt+TDnc+whlsdkn98sMe0Irlq7YAwVG2K3FgCbSAeQxmBd/o2/yjvkqomRK+
 pnr9EQbKRAagCnYm/GY1cvQfVvBv+phvjBr6czF18UWMfV2RMciK7cw2fSMnQMqx0Bfz
 NafQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HbB6FsiNnyi4VWdNQ+Dgn/yA/UpMNBqMDzAxxz8oQOs=;
 b=KiIF/V2pFnBP0SbD3+D/BCi8PLGVTskG1DXLCr7Hgg+U/1WKtEHr31vf4BMIIkFkSk
 dY+O+mk7F5Km8xtuL6BHK5XRn7rkJKCVxF5VCTCQpw/b3IZxFBgW5TUObvQxpLLvXd0/
 lgJ+q/3K1E4xGHtWl0sv108NNm0vbaxYSoYUWkWIuakFAf/RxgMv57V6bSXZgURsVuJr
 dWr2+gAi344Jl91cloWLoDcES4pGqdt9N1ufSF20Qh/7RX+MEHjIbRGB8lgPFzHIzmIg
 q8VBjUtHPJpG3wERt/NrTHwAE8e1Mz2LX+AVNUVmN0dB5QANuw2aV03VyFOMeHGNngaO
 fpDw==
X-Gm-Message-State: AJIora/HcbR5YmDQknzJmMBir6QvpxAfUCxHcSwUWk9pEo5eJthN6EB1
 oAyGk4wFn1sMx32KaYLc6joujNHR4C0=
X-Google-Smtp-Source: AGRyM1vqMzXQU/0w9nWyStIJ34HYMzH1wPsNdkTr/Hq+UQpTO7nHDboX2MjZFh4n/RK1deOdDY1TSg==
X-Received: by 2002:a17:90b:1c81:b0:1f1:aa6a:82d0 with SMTP id
 oo1-20020a17090b1c8100b001f1aa6a82d0mr4735338pjb.170.1658928487271; 
 Wed, 27 Jul 2022 06:28:07 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 ij13-20020a170902ab4d00b0016daee46b72sm1971192plb.237.2022.07.27.06.28.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jul 2022 06:28:06 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Konstantin Kostiuk <kkostiuk@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Weil <sw@weilnetz.de>
Subject: [PATCH v2 0/6] Enable unix socket support on Windows
Date: Wed, 27 Jul 2022 21:27:56 +0800
Message-Id: <20220727132802.812580-1-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Support for the unix socket has existed both in BSD and Linux for the
longest time, but not on Windows. Since Windows 10 build 17063 [1],
the native support for the unix socket has came to Windows. Starting
this build, two Win32 processes can use the AF_UNIX address family
over Winsock API to communicate with each other.

Introduce a new build time config option CONFIG_AF_UNIX when the build
host has such a capability, and a run-time check afunix_available() for
Windows host in the QEMU sockets util codes.

[1] https://devblogs.microsoft.com/commandline/af_unix-comes-to-windows/

Changes in v2:
- move #include <afunix.h> to os-win32.h
- define WIN_BUILD_AF_UNIX only when CONFIG_WIN32
- drop #include <afunix.h> as it is now already included in osdep.h
- new patch: tests/unit: Update test-io-channel-socket.c for Windows

Bin Meng (6):
  util/qemu-sockets: Replace the call to close a socket with
    closesocket()
  util/oslib-win32: Add a helper to get the Windows version
  qga/commands-win32: Use os_get_win_version()
  util/qemu-sockets: Enable unix socket support on Windows
  chardev/char-socket: Update AF_UNIX for Windows
  tests/unit: Update test-io-channel-socket.c for Windows

 meson.build                         |  6 ++++
 include/sysemu/os-win32.h           |  6 ++++
 chardev/char-socket.c               |  4 ++-
 qga/commands-win32.c                | 27 +---------------
 tests/unit/test-io-channel-socket.c | 16 ++++++++--
 util/oslib-win32.c                  | 15 +++++++++
 util/qemu-sockets.c                 | 49 +++++++++++++++++++++++------
 7 files changed, 85 insertions(+), 38 deletions(-)

-- 
2.34.1


