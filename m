Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25ED12D65F2
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 20:08:50 +0100 (CET)
Received: from localhost ([::1]:59330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knRJ2-0007HA-LD
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 14:08:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1knREo-0005QJ-1e
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 14:04:26 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:38988)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1knREm-0003Pc-96
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 14:04:25 -0500
Received: by mail-wr1-x42a.google.com with SMTP id c5so2973062wrp.6
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 11:04:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zOfkL5zuXBuCbSpo2Hkp0oBdamn5YmquOF0z9MEyBr0=;
 b=h/l+jL7TvgteXEVdFgROItDdz0g8/PQIOXVavvV+47s6c5cEh8M4OrQJru9kLOe1EU
 IL4B8GacNFcTPooZuEn93dcG6FlhPvwozP2rLlsy4GaQwUmdhZSaSmH5z7w/RS5tUdXW
 oAUm0emMzS04hNbbj2SzYPCjv6NKhxf+T2zycPxeIQ/uZ3XU8QwOTfhRHwlAxTOnq4Tc
 maC+Ir2wGsm+mNqjdf6ob2jOQI9SKjIHvg5gBoUFfRijNpSTYYBHiXffs/wDoCC7A5AV
 5ArTHL1RJeCQ1Vq1HExGJgJTnv9SB9TgBq3PeRMNd3dBivTBizxrKc7Wnmr0B/Q+Kv8D
 ovFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zOfkL5zuXBuCbSpo2Hkp0oBdamn5YmquOF0z9MEyBr0=;
 b=bHHvMAB9B5/HVitNf2cPomiAN07XFJB0lMp27HC5PxHPdvhIrTGfRjfk3ELkcI79Of
 KwWGqKIEhI5Fav/VbS3zMgtds+ZkRYVWmAlSygBQ206jW+NG7MoJB2cGiZJq4uHUuTJk
 Za5S69+cnX82qmVr0NQMn8ZjyB9Wa9PlhyXKW5pBgpclUNrK92Mn1zoZ1erDj9N3dXi9
 CAtfzv1cyHhSoqAyTZ6OIpt3m1IBZ33V9T2C7T0pfYkBGJ7sD6cNgeh4rTmhOkODP0Vx
 YqjxeNLstHVY//pfGgbEWHMSqMXoxCKIdAHT3TQlQMgldFwD9WDWrSkxwCn2kJpqBhu3
 tqOQ==
X-Gm-Message-State: AOAM532cSwQK1fa+7Nx0aOvK9glpX89QKhu/nDKUEkECkkQQVgbpd/ve
 zkj3Na1gu6vWUJ2iK6Y9isXTCw==
X-Google-Smtp-Source: ABdhPJwtEdhgydF5Z5R+g0yG74cl6mpIN8/+m5Lwjan5UWmnwzdqHMGPoWCB+brI1uCMdE8CpUCmjw==
X-Received: by 2002:a5d:61c4:: with SMTP id q4mr9892909wrv.304.1607627061627; 
 Thu, 10 Dec 2020 11:04:21 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id d17sm9994204wro.62.2020.12.10.11.04.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Dec 2020 11:04:19 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E7FA21FF7E;
 Thu, 10 Dec 2020 19:04:17 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 0/8] testing/next (without-features, gitlab, python)
Date: Thu, 10 Dec 2020 19:04:09 +0000
Message-Id: <20201210190417.31673-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: fam@euphon.net, berrange@redhat.com, stefanb@linux.vnet.ibm.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 richard.henderson@linaro.org, f4bug@amsat.org, cota@braap.org,
 stefanha@redhat.com, marcandre.lureau@redhat.com, pbonzini@redhat.com,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

A quick turnaround from the version I posted yesterday. I've cleaned
up the --without-default-devices stuff thanks to Paolo's feedback and
it's a big win on binary size cutting my qemu-system-aarch64 to around
a 1/3rd of it's normal size. I've also enable -Werror for tests/tcg.

All still need some review tags.

Alex Bennée (8):
  configure: include moxie-softmmu in deprecated_targets_list
  gitlab: include aarch64-softmmu and ppc64-softmmu cross-system-build
  configure: move gettext detection to meson.build
  configure: add --without-default-features
  python: add __repr__ to ConsoleSocket to aid debugging
  gitlab: move --without-default-devices build from Travis
  gitlab: add --without-default-features build
  tests/tcg: build tests with -Werror

 configure                     | 179 +++++++++++++++++-----------------
 .gitlab-ci.d/crossbuilds.yml  |   6 +-
 .gitlab-ci.yml                |  16 ++-
 .travis.yml                   |   8 --
 meson_options.txt             |   2 +-
 po/meson.build                |   2 +-
 python/qemu/console_socket.py |   7 ++
 tests/tcg/Makefile.target     |   2 +-
 8 files changed, 119 insertions(+), 103 deletions(-)

-- 
2.20.1


