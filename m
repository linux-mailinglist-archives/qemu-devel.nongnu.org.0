Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A2D02DC3F2
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 17:22:15 +0100 (CET)
Received: from localhost ([::1]:45362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpZZ8-0003x1-HH
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 11:22:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kpZX9-00028l-EP
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 11:20:11 -0500
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:33173)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kpZX7-0006UP-Mh
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 11:20:11 -0500
Received: by mail-ej1-x62d.google.com with SMTP id b9so8638585ejy.0
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 08:20:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wriHtt7qiXwOsKyET9M1f7QWc8pzHgf4bO+e20Nf8bY=;
 b=D1E5zGm3SvpZuVWrff4jJ40NqoMC/mevLVPpRHYVtsmveh6jdrkGN2k7GsPaeYi56D
 ysJjE36s8gIjeiq32T5ki/R5SLZqm2VCJLIt0PV/Z1FlpdACXm52eaewnEsaZ+A5UjLl
 1frIMaEhXs3iRF+DWAouSJVORW+lsDLm9basXPqLFs7Dp3SyNcukdPhLU2ScMwuPiWrb
 UV12EadfaYvF+70YdMCrt0CPui713PPHE+kVM7hVwK3VfUm13+OqwCsc3AZ8MTlUw7NO
 SWRM7kCuJisD8AEH4JVwN/yV6BKUbZ2lJzxFs8BWUGxArR98T/yoros4ZjtcJrYc0RL/
 BW3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=wriHtt7qiXwOsKyET9M1f7QWc8pzHgf4bO+e20Nf8bY=;
 b=NW3Sde7ykbNeBifv1KJYu4u1rguGydRd6yK1toNZktrvxBtb7Aoa/QBot2Fbd1bnxw
 fJ7lGQDCds1BIaP7/zqbKK8TH0BObAR+w/3vHpEKXggKy09L4M6EugtZQ4xZ496+cKln
 QSqaGBt3sgnJNKLNP9j70gfC+DFQ1C2HlOReAqV3PLBpwa2RoLAEaISh7SUOCd21nR1v
 2IEKkbQibMA3Zh2v5rjvftmJlIUQfpKikH3eNOdcpErpiJnqpPgbB8/sc1vsn5ZCtpmS
 CN4HV+0p59afQLeigrUJ5guxJrEGgU1a5wOm8N050yJGUFmsmzLGuJrdcthwxzjQCrlK
 ovzQ==
X-Gm-Message-State: AOAM5310kCBO3J/F/OLNqVJxufcDxrsHBJ6KwJnvXCDULC5u8urTpiy/
 8SjeOcUpBGubX/WJXf1x0DVsBpDqBxo=
X-Google-Smtp-Source: ABdhPJzZQ8AyrpEnNkdvk3PRHfpcKjZkamSLipFDsUl7pQmpn1xzzvRnBW5pK+oujiahdjJHdRjTxw==
X-Received: by 2002:a17:906:2898:: with SMTP id
 o24mr14933844ejd.215.1608135608363; 
 Wed, 16 Dec 2020 08:20:08 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id a13sm21264501edb.76.2020.12.16.08.20.07
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Dec 2020 08:20:07 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/7] First round of meson bugfixes and cleanups for 6.0
Date: Wed, 16 Dec 2020 17:19:59 +0100
Message-Id: <20201216162006.433850-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Mostly switching to 0.56.0 in order to remove the b_staticpic
version-dependent hack.

Paolo Bonzini (7):
  Makefile: add dummy target for build.ninja dependencies
  meson: update submodule to 0.56.0
  meson: switch minimum meson version to 0.56.0
  meson: fix detection of curses with pkgconfig
  meson: use pkg-config method for libudev
  meson: use dependency to gate block modules
  meson: cleanup Kconfig.host handling

 Makefile                      |   1 +
 accel/Kconfig                 |   9 +++
 block/meson.build             |  20 +++----
 configure                     |   7 +--
 docs/devel/kconfig.rst        |  19 +++----
 docs/meson.build              |  12 ++--
 meson                         |   2 +-
 meson.build                   | 104 +++++++++++++++-------------------
 plugins/meson.build           |   4 +-
 tests/meson.build             |   2 +-
 tests/qapi-schema/meson.build |   4 +-
 tests/qtest/meson.build       |   2 +-
 trace/meson.build             |   4 +-
 13 files changed, 91 insertions(+), 99 deletions(-)

-- 
2.29.2


