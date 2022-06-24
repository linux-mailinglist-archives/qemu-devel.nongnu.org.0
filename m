Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC61559FB3
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 19:42:44 +0200 (CEST)
Received: from localhost ([::1]:40978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4nKL-000097-Ri
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 13:42:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1o4nCD-0005E5-P4
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 13:34:17 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:36394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1o4nCC-00027V-01
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 13:34:17 -0400
Received: by mail-pf1-x42a.google.com with SMTP id x138so461842pfc.3
 for <qemu-devel@nongnu.org>; Fri, 24 Jun 2022 10:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8owhFFnRQ1vWrVWsYClpmbknyw928ToB7PAcea7Qu7g=;
 b=ng+SJkQLuq/okj6Ty7WUu+UMWeIkfxQ1H0EYFnz/uhfU/nWMe68DuD/YmdBDIodEK/
 Wn6rJ2lyIVSDa1R1eQPKPgZUMvmjzsWetdYLk3ObFCLX3y/BRQFBIMoE9jB21+Bm4pLw
 GvHTruL1PeHWtOUQD5kFNMe01kL1T6/R1ujZ5ysZ7as+sHPRh1k8Wu3YyrSjyAkivYvm
 rgY9OL7OKa9WF6YLr1SnRL2gO0vGix40fXCfysDOUr6Jic/bJ5W8tGvYAgCOibJ3x7cH
 Ff3YGRmU50i4J3IgxEL1mXqaoVYLa5wj4JPOne67NFdIj+reY8iPregwxZXf9TbK8bxl
 YlXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8owhFFnRQ1vWrVWsYClpmbknyw928ToB7PAcea7Qu7g=;
 b=dQFUKUIkHZM6nQunjjWZzhe6sgA169EWlFXSbuW9WgalvQol07bNNiXj+DYglRVrum
 soAAlFtJMuxAsUsA8+Av6r5yWJWLAgaUxhq0eFVzPPW5LjxxWUWcZvQKoRxCyKWQYoTv
 aiVyNjslmPdDam6OaLt2fPWI0cHoQXRbkAdwjw4Y+ChyZNEylTW5BErlrHLnNVyTWL6r
 e97Vn9KorC/NOYaA9c7pl224ZYZgTRmw6ancy8co3brnRJ3k+hH6m/lacYdxk9jKTKWu
 DDco1kE1pjYonUmV3MYg+BqT+SAUAGUvkNazwQNY68iVMd97AzZJoCRGV02wF4LTG4Ll
 DJ8Q==
X-Gm-Message-State: AJIora/tkLmx7G3O2t6ksU6J0amsF6JhNvYnHdvDoF7zBCw307i6e+Pv
 8Xr3NPJVSTAbH9aFs6xYeEA=
X-Google-Smtp-Source: AGRyM1uuhR60WG/E6KkJ9KbBCOcekbwUakmJYF1gbw09/0EyWa76hf8m3tj5Ln6gugJ9qVEi8LuV7w==
X-Received: by 2002:a63:6942:0:b0:40d:b8a:c55f with SMTP id
 e63-20020a636942000000b0040d0b8ac55fmr12950079pgc.542.1656092054522; 
 Fri, 24 Jun 2022 10:34:14 -0700 (PDT)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:80ba:2fd0:a1d1:c891])
 by smtp.gmail.com with ESMTPSA id
 mv24-20020a17090b199800b001d954837197sm4269406pjb.22.2022.06.24.10.34.10
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 24 Jun 2022 10:34:13 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Programmingkid <programmingkidx@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, John Snow <jsnow@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: [PATCH v9 0/4] cutils: Introduce bundle mechanism
Date: Sat, 25 Jun 2022 02:34:01 +0900
Message-Id: <20220624173405.85131-1-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.32.1 (Apple Git-133)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pf1-x42a.google.com
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

Developers often run QEMU without installing. The bundle mechanism
allows to look up files which should be present in installation even in
such a situation.

It is a general mechanism and can find any files located relative
to the installation tree. The build tree must have a new directory,
qemu-bundle, to represent what files the installation tree would
have for reference by the executables.

Note that this abandons compatibility with Windows older than 8 to use
PathCchSkipRoot(). The extended support for the prior version, 7 ended
more than 2 years ago, and it is unlikely that anyone would like to run
the latest QEMU on such an old system.

v9:
* Update _WIN32_WINNT in include/qemu/osdep.h (Thomas Huth)

v8:
* Pass absolute paths to get_relocated_path() (Paolo Bonzini)
* Use meson introspection (Paolo Bonzini)
* Drop "qga: Relocate a path emitted in the help text" as it is no longer
  relevant for the bundle mechanism.

v7: Properly fix --firmwarepath (Daniel P. Berrangé)

v6: Reuse get_relocated_path() in find_bundle() (Paolo Bonzini)

v5:
* Prefer qemu-bundle if it exists. (Daniel P. Berrangé)
* Check install_blobs option before installing BIOSes (Paolo Bonzini)
* Add common code to set up qemu-bundle to the top level meson.build
  (Paolo Bonzini)

v4:
* Add Daniel P. Berrangé to CC. Hopefully this helps merging his patch:
  https://mail.gnu.org/archive/html/qemu-devel/2022-06/msg02276.html
* Rebased to the latest QEMU.

v3:
* Note that the bundle mechanism is for any files located relative to the
  installation tree including but not limited to datadir. (Peter Maydell)
* Fix "bridge" typo (Philippe Mathieu-Daudé)

v2: Rebased to the latest QEMU.

Akihiko Odaki (3):
  cutils: Introduce bundle mechanism
  datadir: Use bundle mechanism
  module: Use bundle mechanism

Paolo Bonzini (1):
  tests/vm: do not specify -bios option

 .travis.yml                     |  2 +-
 docs/about/build-platforms.rst  |  2 +-
 include/qemu/cutils.h           | 18 +++++++--
 include/qemu/osdep.h            |  2 +-
 meson.build                     |  4 ++
 pc-bios/keymaps/meson.build     | 21 +++-------
 pc-bios/meson.build             | 13 ++-----
 scripts/oss-fuzz/build.sh       |  2 +-
 scripts/symlink-install-tree.py | 37 ++++++++++++++++++
 softmmu/datadir.c               | 22 +----------
 tests/qtest/fuzz/fuzz.c         | 15 --------
 tests/vm/fedora                 |  1 -
 tests/vm/freebsd                |  1 -
 tests/vm/netbsd                 |  1 -
 tests/vm/openbsd                |  1 -
 util/cutils.c                   | 68 +++++++++++++++++++++++----------
 util/meson.build                |  1 +
 util/module.c                   |  1 -
 18 files changed, 118 insertions(+), 94 deletions(-)
 create mode 100755 scripts/symlink-install-tree.py

-- 
2.32.1 (Apple Git-133)


