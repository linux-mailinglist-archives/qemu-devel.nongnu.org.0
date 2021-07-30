Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 383B83DB9E1
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 16:00:33 +0200 (CEST)
Received: from localhost ([::1]:39422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9T3v-0006TP-QL
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 10:00:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m9T2M-0003sM-BT
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 09:58:54 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:50721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m9T2K-0006R3-GU
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 09:58:53 -0400
Received: by mail-wm1-x32d.google.com with SMTP id m19so6068627wms.0
 for <qemu-devel@nongnu.org>; Fri, 30 Jul 2021 06:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2SgJK5cQ+oe7g3Wh2i3qaXgWqsq2sNQGk72Xbn15AqU=;
 b=F+MAxTy5hKp6ukkhFKFkMNMl/g8VqKdFkwk5nUeMpnPCopsERS8zO2UkdbOl+UbiYd
 MFNZjHKiMaVdo6SgBxOyRGKjg97Y7Ll13jQJAL2UipENaxK2ye1fH1NNBY42gEKnqkOh
 Ewkwsf2w4rHuodWnbG1g2/21fp2hVPAZxi0P+j2sADsxqEQtrEc1j/WyQGaceO9zevhU
 TdTVgMXakOyjXLjN+BeVx+h5JeONQZDzZr15SGOZbuVcfEJvaUhRfdOIX+Pdkv/1sVfq
 1Tl9D2y5KIUmdkDFBLyN9gA9SE0hS6Yk5k8ho8UKxwjZ5mCe4mueWBxGCXOuGHKJ/ZR/
 Nz0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2SgJK5cQ+oe7g3Wh2i3qaXgWqsq2sNQGk72Xbn15AqU=;
 b=TNugAETbqym1oXfsm/kBq1LdW5va5rpqflpA9SdPH4DEBFSuXSX4SBF/b9ARMZ/jz9
 YarN1nvj2pWr+s67xmk1uAQmX6nDMWXdhYEjUphCKb5/i1xdkfeCfzxA9QtYZ6UmKG+J
 VPGP7FptpMPCTI0T/mcFJ4BQW4gtfdFXPGDU2ZwSq8FoBuCiIvQsbmZuwc/mctrgG7kf
 8ZEbzVQhzM9utH1E9fEVGryQxy6QSk2j8qtY5sZAQKdzV2/y9aNe7Dy3R2nAeMnowDff
 kqgHZ9T60ZOWgp0c0AEc3u3tJkhkr/x0uH/+sOKvCSZDa13dYbu3VshXtsO8C6H82h8U
 s0lA==
X-Gm-Message-State: AOAM532RdK22mQP5CKXoRw2x+8N000jFm/lY6NS0Bux16cCgKBGWwWTD
 pFll86ofTvGcTv0rK2/g1HKyUYpklK4=
X-Google-Smtp-Source: ABdhPJzwSN6r97m9jnVbKvGIpcBrLzjIvUsvSET54qu/hInwGCa3wxKHw30ofmBmcgLMHB2YRAt4jA==
X-Received: by 2002:a1c:791a:: with SMTP id l26mr3222557wme.179.1627653529576; 
 Fri, 30 Jul 2021 06:58:49 -0700 (PDT)
Received: from localhost.localdomain ([102.44.217.242])
 by smtp.gmail.com with ESMTPSA id h9sm1770277wrw.38.2021.07.30.06.58.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jul 2021 06:58:49 -0700 (PDT)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 00/13] new plugin argument passing scheme
Date: Fri, 30 Jul 2021 15:58:04 +0200
Message-Id: <20210730135817.17816-1-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wm1-x32d.google.com
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
Cc: Mahmoud Mandour <ma.mandourr@gmail.com>, cota@braap.org,
 alex.bennee@linaro.org
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
    plugins/hwprofile: adapt to the new plugin arguments scheme

v3 -> v4:
    1. added Reviewed-by and Tested-By tags to commit messages of the
    already-reviewed patches.

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
  plugins/howvec: adapting to the new argument passing scheme
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


