Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 995DD3D1EBE
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 09:14:08 +0200 (CEST)
Received: from localhost ([::1]:45262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6SuF-0008NZ-KN
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 03:14:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m6Ssz-0005yT-0t
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 03:12:49 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:40697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m6Ssw-0005KW-Em
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 03:12:48 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 z8-20020a1c4c080000b029022d4c6cfc37so900885wmf.5
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 00:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aAkjhBxl3RaE1zCL5xf2hmIre/F4REx/ev0iRoVODn8=;
 b=PXxCvgBPwQNZ28dUVMWLxMkX8fNqxiD1dsB2s3vdUxA9DZxUvm+1Jc6R9SmS+QqEkd
 gmia4lSyjTBAPJAtFifhDqLdDyM3rmHBhomldklLfYhdMhk6x6nhzNkTTy32u1waml7r
 LnFGDdRfN0h/KutNBfainPVCtSQrMM7tSQuxfx2AKZMslkLxvMGCfG/TmvnJ6VBVpODS
 2aaUKintACpm4k2EaAa9jGAef3IU+ugSy10daq3mfJU3SzV+f/U07GrT3oZOnKO7D6XR
 FImxmePVdavtpIlLBpOHGqHKsZfZELgtOlu2ArbjHK7u50EawrfCm1X6HFJCsOxr2g6B
 rhlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aAkjhBxl3RaE1zCL5xf2hmIre/F4REx/ev0iRoVODn8=;
 b=YcDH34i56F0vlkQjQSnBydAJ6TSHUXxkMpXgBC3Os6Z90n8tSV+WbO+BSoFxQZZANA
 CtvuXnVXF7p2xMqDw0e1+rDh/c5+b3Gert+JF/2k7TWif5VIsB/ZqBUC4pVg8UKE8K16
 y3lJMKzVJ3K3cBttqSmQrG1hx20nRVKv6XiTiKi+4A4ya8fQ4N1BcV+z62xnIYCyG5xo
 GTY4BzwUl2Y1eUpKmFVXDy0d/lYuBMYDmGQprT9Ai3Dynk7JSl4s14bL4sYnTN6C0kwQ
 TMx/8MjjFxA12RQDgktkv1S+NtRrTz/7+dgpVLekUusQP6fb28+Ljx8DTvV/0h1jJ9L8
 nm1g==
X-Gm-Message-State: AOAM533SiQ4ypXocDDv/m/TUji71AMvEwdxGatyEVU0ryEYkwxLM2eSh
 FWm6enhTF38ImYpFf1Ub31Iq1WrMNxI=
X-Google-Smtp-Source: ABdhPJyn6FNNzabKW3/IV3G7qlPDr1GaydcL+h7v9v33D6+RkqifxzQ+MA58nkLkzvkxwQQcy/I3HQ==
X-Received: by 2002:a05:600c:cb:: with SMTP id
 u11mr39743562wmm.66.1626937964372; 
 Thu, 22 Jul 2021 00:12:44 -0700 (PDT)
Received: from localhost.localdomain ([102.44.10.38])
 by smtp.gmail.com with ESMTPSA id v21sm1802871wml.5.2021.07.22.00.12.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 00:12:44 -0700 (PDT)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 00/13] new plugin argument passing scheme
Date: Thu, 22 Jul 2021 09:12:23 +0200
Message-Id: <20210722071236.139520-1-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Mahmoud Mandour <ma.mandourr@gmail.com>, cota@braap.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

This series removes passing arguments to plugins through "arg=" since
it's redundant and reduces readability especially when the argument
itself is composed of a name and a value.

Also, passing arguments through "arg=" still works but is marked as
deprecated and will produce a deprecation warning.

Right now, the code for parsing the argument before passing it to the
plugin is unfortunately not so clean but that's mainly because "arg=" is
still supported.

At first, considering boolean parameters, those were not special to
plugins and QEMU did not complain about passing them in the form
"arg=bool_arg" even though that's considered a short-form boolean, which
is deprecated. As "arg" is removed, a deprecation warning is issued.

This is mitigated by making plugins aware of boolean arguments and
parses them through a newly exposed API, namely the `qapi_bool_parse`
function through a plugin API function. Now plugins expect boolean
parameters to be passed in the form that other parts of QEMU expect,
i.e. "bool_arg=[on|true|yes|off|false|no]".

Since we're still supporting "arg=arg_name", there are some assumptions
that I made that I think are suitable:

    1. "arg=arg_name" will be passed to the plugin as "arg_name=on".
    2. "arg=on" and "arg" will not be assumed to be the old way of
        passing args. Instead, it will assume that the argument name is
        "arg" and it's a boolean parameter. (will be passed to plugin
        as "arg=on")

The docs are updated accordingly and a deprecation notice is put in the
deprecated.rst file.

Based-on: <20210722065428.134608-1-ma.mandourr@gmail.com>

However, the dependency is so light and it should only be in the patch

    docs/tcg-plugins: new passing parameters scheme for cache docs

where it depends on

    docs/devel/tcg-plugins: added cores arg to cache plugin

in the aforementioned series (conflict lies in the argument "cores=N" only.)

Patches that still need review:
    plugins/api: added a boolean parsing plugin api
    docs/deprecated: deprecate passing plugin args through `arg=`

v2 -> v3:
    1. Protected calling `qapi_bool_parse` by ensuring name & value are
    not NULL.
    2. Updated the docs for the hotpages plugin to include its arguments
    3. Typo in tests/plugins/mem (hadrr -> haddr)
    4. Reword the deprecation entry in deprecated.rst

Mahmoud Mandour (13):
  plugins: allow plugin arguments to be passed directly
  plugins/api: added a boolean parsing plugin api
  plugins/hotpages: introduce sortby arg and parsed bool args correctly
  plugins/hotblocks: Added correct boolean argument parsing
  plugins/lockstep: make socket path not positional & parse bool arg
  plugins/hwprofile: adapt to the new plugin arguments scheme
  plugins/howvec: Adapting to the new argument passing scheme.
  docs/tcg-plugins: new passing parameters scheme for cache docs
  tests/plugins/bb: adapt to the new arg passing scheme
  tests/plugins/insn: made arg inline not positional and parse it as
    bool
  tests/plugins/mem: introduce "track" arg and make args not positional
  tests/plugins/syscalls: adhere to new arg-passing scheme
  docs/deprecated: deprecate passing plugin args through `arg=`

 contrib/plugins/hotblocks.c | 14 ++++++++--
 contrib/plugins/hotpages.c  | 30 ++++++++++++++-------
 contrib/plugins/howvec.c    | 27 +++++++++++++------
 contrib/plugins/hwprofile.c | 39 ++++++++++++++++++---------
 contrib/plugins/lockstep.c  | 31 +++++++++++++++-------
 docs/devel/tcg-plugins.rst  | 53 ++++++++++++++++++++++++-------------
 docs/system/deprecated.rst  |  7 +++++
 include/qemu/qemu-plugin.h  | 13 +++++++++
 linux-user/main.c           |  2 +-
 plugins/api.c               |  5 ++++
 plugins/loader.c            | 24 ++++++++++++++---
 qemu-options.hx             |  9 +++----
 tests/plugin/bb.c           | 15 ++++++++---
 tests/plugin/insn.c         | 14 ++++++++--
 tests/plugin/mem.c          | 47 +++++++++++++++++++-------------
 tests/plugin/syscall.c      | 23 +++++++++++-----
 16 files changed, 252 insertions(+), 101 deletions(-)

-- 
2.25.1


