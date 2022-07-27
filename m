Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87930582149
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 09:40:03 +0200 (CEST)
Received: from localhost ([::1]:59876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGbeE-0002OZ-54
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 03:40:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oGbaC-0005ug-3e
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 03:35:52 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:34726)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oGbaA-0002Hp-B1
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 03:35:51 -0400
Received: by mail-pf1-x42c.google.com with SMTP id 70so15427047pfx.1
 for <qemu-devel@nongnu.org>; Wed, 27 Jul 2022 00:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FsmJxnUEsDzLqMFBH4/49xsi/OdBYy5DMcmNBDOTH7o=;
 b=VqDuMNTFjXgwp5Y3OlNdWCxOtkPdd/JO9bhQKyfPgvqwIWvZbKcDYQIRpwumCudQ3m
 qzIyEXl1m7wxEuUdhssC6Q8hTxcoaExfMM0UCP/Cl0ocJ6BUf+guM1DrUW3CETqadO9E
 DsBpv45rc/H12J/9vqVHpolmmwE9nNSC1yeDYC0S5QnRbv+yUWvmX0xqws1gG5xthi+4
 GKU6b7bmfWHoiI3w//TomoLUls2Ynr+z2INJsV/rlVuSXjEJ0UEKAbEIp9RtkBCO/9qb
 jlNndeYC8WFUrm5sL74fZJO4xwpe5TGEF0DptuzLXAKy+7tEGMeeuTTWoX02RowaHbhc
 LhYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FsmJxnUEsDzLqMFBH4/49xsi/OdBYy5DMcmNBDOTH7o=;
 b=qFEjqIEjRafMK1q+9oNQeqqoLAj4hUXSBz1oYh7VTBU9AvWNRmEZjekXcgf9YQPMdv
 zoxnXTPKGMb94g5nlokJTELqiVQ6nPDbK4rC5JuxS+oHmlsLPvep8kOGJlntRAxfKy0E
 kVgH/Xaejq0lVzXoOmuUSf0xXPRDuJVU1ybM0P0agUy/3BgigFxwXGK3JYAB3TVVlUXX
 bChLJG7ccC55LGJCfX7+vPa4iZ9MmLWDee788Xm6UP0qrAm2JzdeCVRIbyV4toXMnp5V
 CoLG9wXIY0eCDtGQ8bBn0xJQCsnYsd5u3PwiNDjUJtMnpUZf9Q2GBiEDt592oR6lwXwS
 Fzbw==
X-Gm-Message-State: AJIora9VXulJX31fePeNAaZIupDXeXQAuVedVzXeAUFm6nsVLrqlpMXL
 2PzALPQO677FUX9KIxQZ3XEV4aHTP6A=
X-Google-Smtp-Source: AGRyM1u3KvE8v8Djao3gHiwzcm8Ci+wINytLMs4XnrqSMghNdc+7AZABWgpM/l6UQg9L/VI24yJ/nw==
X-Received: by 2002:a05:6a00:a08:b0:52b:fd6e:b198 with SMTP id
 p8-20020a056a000a0800b0052bfd6eb198mr11286394pfh.53.1658907348474; 
 Wed, 27 Jul 2022 00:35:48 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 z7-20020a170902ccc700b0016c09a0ef87sm10533834ple.255.2022.07.27.00.35.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jul 2022 00:35:47 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Konstantin Kostiuk <kkostiuk@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Weil <sw@weilnetz.de>
Subject: [PATCH 0/5] Enable unix socket support on Windows
Date: Wed, 27 Jul 2022 15:35:37 +0800
Message-Id: <20220727073542.811420-1-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pf1-x42c.google.com
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


Bin Meng (5):
  util/qemu-sockets: Replace the call to close a socket with
    closesocket()
  util/oslib-win32: Add a helper to get the Windows version
  qga/commands-win32: Use os_get_win_version()
  util/qemu-sockets: Enable unix socket support on Windows
  chardev/char-socket: Update AF_UNIX for Windows

 meson.build               |  6 +++++
 include/sysemu/os-win32.h |  2 ++
 chardev/char-socket.c     |  8 +++++-
 qga/commands-win32.c      | 27 +-------------------
 util/oslib-win32.c        | 15 +++++++++++
 util/qemu-sockets.c       | 52 ++++++++++++++++++++++++++++++++-------
 6 files changed, 74 insertions(+), 36 deletions(-)

-- 
2.34.1


