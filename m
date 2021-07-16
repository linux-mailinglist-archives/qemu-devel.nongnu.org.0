Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 109BD3CB3BB
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Jul 2021 10:06:31 +0200 (CEST)
Received: from localhost ([::1]:43886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4Ire-0001Mo-2p
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 04:06:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m4IpN-00076U-E3
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 04:04:09 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:47030)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m4IpL-0005Go-Km
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 04:04:09 -0400
Received: by mail-wr1-x435.google.com with SMTP id d12so10979325wre.13
 for <qemu-devel@nongnu.org>; Fri, 16 Jul 2021 01:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nU45jMNyuf8/ZCCvoanDW2KLc19UpaqvYAJZ/NIec4o=;
 b=IBzGH34dDlT+M8kr8hhR6GA7qAZHbn9suByfFAfKAQgxDhd811+8GqVSnOJkLKh844
 GwOd4LaXwnGympuOvKzmTte9CGhPrKu4fHGGzAkKLOl0NfNEbx+7TNdAVtfotZDRrN4W
 fX3uhdT15xynSdqOvffCnDRkcF8TIC5rDEzujZ+vUMot9xa6dwaUhmQ30+DMVWF0LK1A
 EPop0gSGyXFjJk93I3J7dsZLmftMudzEwblbvoku//MgrOADhDf6B4l87uii2PbN5eAO
 YU0HQl8p5GrzujXgY41z1ZONmojLuHHjdQKUVrHqA3WZFycaTsauxukOlgSM0RA9E4ph
 tqVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nU45jMNyuf8/ZCCvoanDW2KLc19UpaqvYAJZ/NIec4o=;
 b=L6/2RDwltgfNFvvb3dhjHl9xJUoN1IMepWDq2YyVrY7LiZnioQI1k+AuW2nVllvFNl
 j7/l9t5sFwBNwlmmVlyyUz89kRDAudzDvhaifaUN4hXaSpbz8OSOSzT09KlVj5FC2r3H
 N9bPWC/cB5MjyE3meDvDF0+ZaSv2Qy/1TqiANZrj5653ccrJq1uYt1Euefr4GwgQIEok
 TkS0wGtFeDKASueoo/aHxbxMMD097UHzlvzpqYvPIgTKV441Pc4NtYeWWIJ7HniYXls6
 wLj8j9OxTybF5vqqGTyNnzU/wVycEGQVo+zdxFif1CPtrFVkB8k9/cHdt1KguT5QtGti
 7oaw==
X-Gm-Message-State: AOAM530WeXitfseJRLuJYRn+B9E62tUfy8cY9nYibS9xqaAsb0625X18
 DgTDO/1e3t7jaaYUMa6fSYWhJLANUWRoLA==
X-Google-Smtp-Source: ABdhPJwn7TqcyUmjf0Sp/Dr+BCqVgf1FU6yR3its7W+2qGjaUbUr8u6XV3hPKB0rH/HlpBsq0/Xl5A==
X-Received: by 2002:adf:c448:: with SMTP id a8mr10643888wrg.103.1626422645559; 
 Fri, 16 Jul 2021 01:04:05 -0700 (PDT)
Received: from localhost.localdomain ([41.34.125.69])
 by smtp.gmail.com with ESMTPSA id p12sm6558046wma.19.2021.07.16.01.04.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jul 2021 01:04:04 -0700 (PDT)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/9] new plugin argument passing scheme
Date: Fri, 16 Jul 2021 10:03:36 +0200
Message-Id: <20210716080345.136784-1-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wr1-x435.google.com
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

Mahmoud Mandour (9):
  plugins: allow plugin arguments to be passed directly
  plugins/api: added a boolean parsing plugin api
  plugins/hotpages: introduce sortby arg and parsed bool args correctly
  plugins/hotblocks: Added correct boolean argument parsing
  plugins/lockstep: make socket path not positional & parse bool arg
  plugins/hwprofile: adapt to the new plugin arguments scheme
  plugins/howvec: Adapting to the new argument passing scheme.
  docs/tcg-plugins: new passing parameters scheme for cache docs
  docs/deprecated: deprecate passing plugin args through `arg=`

 contrib/plugins/hotblocks.c | 14 +++++++++++--
 contrib/plugins/hotpages.c  | 30 ++++++++++++++++++----------
 contrib/plugins/howvec.c    | 24 +++++++++++++++--------
 contrib/plugins/hwprofile.c | 39 +++++++++++++++++++++++++------------
 contrib/plugins/lockstep.c  | 31 ++++++++++++++++++++---------
 docs/devel/tcg-plugins.rst  | 38 ++++++++++++++++++------------------
 docs/system/deprecated.rst  |  6 ++++++
 include/qemu/qemu-plugin.h  | 13 +++++++++++++
 linux-user/main.c           |  2 +-
 plugins/api.c               |  5 +++++
 plugins/loader.c            | 24 +++++++++++++++++++----
 qemu-options.hx             |  9 ++++-----
 12 files changed, 165 insertions(+), 70 deletions(-)

-- 
2.25.1


