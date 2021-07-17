Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE1E73CC269
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Jul 2021 12:12:12 +0200 (CEST)
Received: from localhost ([::1]:60998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4hIq-000237-0g
	for lists+qemu-devel@lfdr.de; Sat, 17 Jul 2021 06:12:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m4hH0-0007gy-Hc
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 06:10:19 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:50898)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m4hGv-0007Qa-Jy
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 06:10:14 -0400
Received: by mail-wm1-x334.google.com with SMTP id l6so7303224wmq.0
 for <qemu-devel@nongnu.org>; Sat, 17 Jul 2021 03:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sTAqdDaSpa48MH/dXAGtc2bAl3+THlUzD2GMS5lAJY8=;
 b=BUR0DHb0k4leisCzBYzHTtTiJwlLAQo/pslJ4J9wrhnW1zBb1hv7v6kdDhnE6R540O
 vB63HDEFvC2HN9ySHtkC3V3aiT5E/X0MeU5tz7V6nGGDgrjiwoTCB8bjY28D47jxpBMF
 omPYKUGR7P5zrDCfhk97XacFfKB61xgQgaIbDDSfsMPpu5Q4XYc9+bZHIpexB3l6VmyE
 +wH0n1HdRZoLZpLFCvlW6jYOjbGO3ZM7OTuLOfN1LY/gJ18h0xKPxdDQkxbNC8m8IgHJ
 ob/kujU5FCvwbOrhBhua9v5iWa3g1QaLdpMjmVZgPeakRd7qXoHTg6AN1D5mqO5qN/6g
 voag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sTAqdDaSpa48MH/dXAGtc2bAl3+THlUzD2GMS5lAJY8=;
 b=C9gSNV1jvjrdBWS1znqHqj7oQQYM/ToQY6w/azIYFNgXDleHu6Vff53jYV6nMxwszw
 RWamKHVYqdTYLjrOUls93Y42NtQRVcOaniO/S78dAfK+jToad0//779jdpW8hX4loVO9
 v5josSI2a07qjJlfoGn4h2exjJiTUgVVOs4MaYAOUK1gwNTs4QeMxOl483q80WImOEX6
 iGXZ8OFVa0Bj4HTgkIgzvS2aTgO/qQ2oQq9X+xnPbPNOlBDqwuaa/ryX3pHMXiX5ubZr
 WxSZSpV45vaJc/VmFopnGMM62fj8daDj9gs26zRVOuoFrgDw7mHn9rIatMwhZRqj11yo
 HkfQ==
X-Gm-Message-State: AOAM532vO1n6/O91xCFUVKexFCvspQwiMQPfXl2dK343fIMRESrXGjuT
 g+v6ounP5pUuJgy8nizvO6gD1H2b4GA=
X-Google-Smtp-Source: ABdhPJzw+UW1/9lVqT7UsbLMzbMUrvxg+wdZT0gEdXXT7O63ii1kUfVpe2mUzbk7OacykHykdmd/aw==
X-Received: by 2002:a05:600c:4ec9:: with SMTP id
 g9mr15204017wmq.54.1626516609045; 
 Sat, 17 Jul 2021 03:10:09 -0700 (PDT)
Received: from localhost.localdomain ([41.34.125.69])
 by smtp.gmail.com with ESMTPSA id 11sm13846923wmo.10.2021.07.17.03.10.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Jul 2021 03:10:08 -0700 (PDT)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/13] new plugin argument passing scheme
Date: Sat, 17 Jul 2021 12:09:07 +0200
Message-Id: <20210717100920.240793-1-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wm1-x334.google.com
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

v1 -> v2:
    1. Added patches that handle test plugins as well
    2. Handled unsupported arguements in howvec

Based-on: <20210714172151.8494-1-ma.mandourr@gmail.com>

However, the dependency is so light and it should only be in the patch

    docs/tcg-plugins: new passing parameters scheme for cache docs

where it depends on

    docs/devel/tcg-plugins: added cores arg to cache plugin

in the aforementioned series (conflict lies in the argument "cores=N" only.)

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

 contrib/plugins/hotblocks.c | 14 +++++++++--
 contrib/plugins/hotpages.c  | 30 +++++++++++++++--------
 contrib/plugins/howvec.c    | 27 ++++++++++++++-------
 contrib/plugins/hwprofile.c | 39 ++++++++++++++++++++----------
 contrib/plugins/lockstep.c  | 31 +++++++++++++++++-------
 docs/devel/tcg-plugins.rst  | 38 +++++++++++++++---------------
 docs/system/deprecated.rst  |  6 +++++
 include/qemu/qemu-plugin.h  | 13 ++++++++++
 linux-user/main.c           |  2 +-
 plugins/api.c               |  5 ++++
 plugins/loader.c            | 24 +++++++++++++++----
 qemu-options.hx             |  9 ++++---
 tests/plugin/bb.c           | 15 ++++++++----
 tests/plugin/insn.c         | 14 +++++++++--
 tests/plugin/mem.c          | 47 +++++++++++++++++++++++--------------
 tests/plugin/syscall.c      | 23 ++++++++++++------
 16 files changed, 236 insertions(+), 101 deletions(-)

-- 
2.25.1


