Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85F0C394962
	for <lists+qemu-devel@lfdr.de>; Sat, 29 May 2021 01:55:41 +0200 (CEST)
Received: from localhost ([::1]:47310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmmKK-0000pj-21
	for lists+qemu-devel@lfdr.de; Fri, 28 May 2021 19:55:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3g4KxYAMKClo5B68GG8D6.4GEI6EM-56N6DFGF8FM.GJ8@flex--dje.bounces.google.com>)
 id 1lmmIU-0006mx-Vu
 for qemu-devel@nongnu.org; Fri, 28 May 2021 19:53:47 -0400
Received: from mail-qv1-xf49.google.com ([2607:f8b0:4864:20::f49]:44949)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3g4KxYAMKClo5B68GG8D6.4GEI6EM-56N6DFGF8FM.GJ8@flex--dje.bounces.google.com>)
 id 1lmmIP-0007Zn-Kx
 for qemu-devel@nongnu.org; Fri, 28 May 2021 19:53:45 -0400
Received: by mail-qv1-xf49.google.com with SMTP id
 6-20020a05621420a6b0290214b9d4b6c3so3785000qvd.11
 for <qemu-devel@nongnu.org>; Fri, 28 May 2021 16:53:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=cuLSYQW1FJaSsroNfEPMtCzlw8f4h1qsJviWCgp88e8=;
 b=DQvkCMgAECxrWUmYBaXVXoGcuiHJN8vv+BX6FZczCl7hX7oRYWdTIxT5foVc9fngbP
 hzI+wu/+ja2dHgI+6OujPnuCro8IBD90VMlpwHgf77pFlLjTAFeNPOR6n9MisoFzSGWv
 4NSO0pScyk+WyrduKNYuIeFvmHOvFVfJyZP3VenFR6B8sRprhXrvRxzOvY8D81YMhnO0
 k7vbF9vL6jV7XPs6HYrWAIzmNO9Jy8s8lno1nANlklSTts+fiWG6rHA3uILSQqEtp67F
 I/m+VhvNHEuiYhtinqjCUdXKb2OnCPwKSWQOvGUVONvUn5ZGVqPOLVVTN2B7AIZ87g1B
 AvkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=cuLSYQW1FJaSsroNfEPMtCzlw8f4h1qsJviWCgp88e8=;
 b=gg3QCu0/3jGtKqxR/T44e4aZHbANJ1kXOP2XEmB8hmHV26/B15g7tmGRxyTclcLL2V
 DKxaSWulKtoLx1ng8ouEqsWzilQdpEj7nGk2PnB1WFa1P1ZcVVJywuaG9zfnHlZifDEp
 R1IZXjeAc0qw9wICVYD4H76VaJLJ31yRtWk7ihvk76ufDhL3CMWwrY0Zoo+vRf+qUI6z
 25IsF4Kv4WNyogq3+rLn3LmX+gkr0gLyImJ/JmLSKZyrkAU+OrjT/iBw9EzZvniCDZsz
 3bIztpC0Q7S/U/j2XV/hD3ptryQ6opj/MXutgvlFpAc7wEecsxNlJYaEk8nNcyvuRN24
 cF8w==
X-Gm-Message-State: AOAM5310zccJR3XTHuek7swvJK09Kq7Lxd3Xx1TbkqNEmeWgk+OKtW7y
 VsfsfumGPLh9OsflFYtjrKsNr97pMPHCqZPWE9wLlSoL9hhictEw23q2CfPOH2zDysHsAEORovL
 HZi9edpZ5Jaxhx3Wzue5kYEUFGVS0q9lHoY8PgQUhgTv8rzMuycit
X-Google-Smtp-Source: ABdhPJzB/GbmMIW5zE6LDdwGsbM6suYhGXt8w59Pw2QWA8XEWZ5c7u5X22xIXqVVfZqZKJstNsDp0IQ=
X-Received: from ruffy.mtv.corp.google.com
 ([2620:0:1000:1412:da9a:e3bd:2fe6:1f1b])
 (user=dje job=sendgmr) by 2002:a05:6214:e82:: with SMTP id
 hf2mr6664326qvb.22.1622246019747; Fri, 28 May 2021 16:53:39 -0700 (PDT)
Date: Fri, 28 May 2021 16:53:27 -0700
Message-Id: <20210528235331.3727583-1-dje@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.32.0.rc0.204.g9fa02ecfa5-goog
Subject: [PATCH v7 0/4] Add support for ipv6 host forwarding
From: Doug Evans <dje@google.com>
To: qemu-devel@nongnu.org
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>, 
 "=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?=" <berrange@redhat.com>, 
 "=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?=" <marcandre.lureau@redhat.com>,
 Maxim Samoylov <max7255@yandex-team.ru>, Doug Evans <dje@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f49;
 envelope-from=3g4KxYAMKClo5B68GG8D6.4GEI6EM-56N6DFGF8FM.GJ8@flex--dje.bounces.google.com;
 helo=mail-qv1-xf49.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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

This patchset takes the original patch from Maxim,
https://www.mail-archive.com/qemu-devel@nongnu.org/msg569573.html
and updates it.

Option hostfwd is extended to support ipv6 addresses.
Commands hostfwd_add, hostfwd_remove are extended as well.

Changes from v6:

1/4: Update to use libslirp v4.5.0 tag

The libslirp parts of the patch have been committed to the libslirp repo,
and are now in QEMU's copy of the libslirp repo.
Advancing QEMU to use Libslirp v4.5.0 is being done separately.
Discussion of patch 1/4 is left to that thread:
https://lists.nongnu.org/archive/html/qemu-devel/2021-05/msg06010.html

2/4: No change

3/4: Add support for --enable-slirp=system
Tested with system libslirp 4.4.0.

4/4: No change

Changes from v5:

1/4 slirp: Advance libslirp submodule to current master
NOTE TO REVIEWERS: It may be a better use of everyone's time if a
maintainer takes on advancing QEMU's libslirp to libslirp's master.
Beyond that, I really don't know what to do except submit this patch as
is currently provided.

2/4: util/qemu-sockets.c: Split host:port parsing out of inet_parse

Also split out parsing of ipv4=on|off, ipv6=on|off

3/4: net/slirp.c: Refactor address parsing

Use InetSocketAddress and getaddrinfo().
Use new libslirp calls: slirp_remove_hostxfwd, slirp_add_hostxfwd.

4/4: net: Extend host forwarding to support IPv6

Recognize ipv4=,ipv6= options.

Note: v5's 3/5 "Recognize []:port (empty ipv6 address)" has been deleted:
the churn on this patch series needs to be reduced.
This change is not required, and can easily be done in a later patch.

Changes from v4:

1/5 slirp: Advance libslirp submodule to add ipv6 host-forward support
NOTE TO REVIEWERS: I need some hand-holding to know what The Right
way to submit this particular patch is.

- no change

2/5 util/qemu-sockets.c: Split host:port parsing out of inet_parse

- move recognition of "[]:port" to separate patch
- allow passing NULL for ip_v6
- fix some formatting issues

3/5 inet_parse_host_and_addr: Recognize []:port (empty ipv6 address)

- new in this patchset revision

4/5 net/slirp.c: Refactor address parsing

- was 3/4 in v4
- fix some formatting issues

5/5 net: Extend host forwarding to support IPv6

- was 4/4 in v4
- fix some formatting issues

Changes from v3:

1/4 slirp: Advance libslirp submodule to add ipv6 host-forward support

- pick up latest libslirp patch to reject ipv6 addr-any for guest address
  - libslirp currently only provides a stateless DHCPv6 server, which means
    it can't know in advance what the guest's IP address is, and thus
    cannot do the "addr-any -> guest ip address" translation that is done
    for ipv4

2/4 util/qemu-sockets.c: Split host:port parsing out of inet_parse

- this patch is new in v4
  - provides new utility: inet_parse_host_and_port, updates inet_parse
    to use it

3/4 net/slirp.c: Refactor address parsing

- this patch renamed from 2/3 to 3/4
- call inet_parse_host_and_port from util/qemu-sockets.c
- added tests/acceptance/hostfwd.py

4/4 net: Extend host forwarding to support IPv6

- this patch renamed from 3/3 to 4/4
- ipv6 support added to existing hostfwd option, commands
  - instead of creating new ipv6 option, commands
- added tests to tests/acceptance/hostfwd.py

Changes from v2:
- split out libslirp commit
- clarify spelling of ipv6 addresses in docs
- tighten parsing of ipv6 addresses

Change from v1:
- libslirp part is now upstream
- net/slirp.c changes split into two pieces (refactor, add ipv6)
- added docs

Doug Evans (4):
  slirp: Advance libslirp submodule to 4.5 release
  util/qemu-sockets.c: Split host:port parsing out of inet_parse
  net/slirp.c: Refactor address parsing
  net: Extend host forwarding to support IPv6

 hmp-commands.hx             |  18 ++-
 include/qemu/sockets.h      |   5 +
 net/slirp.c                 | 272 ++++++++++++++++++++++++++++--------
 slirp                       |   2 +-
 tests/acceptance/hostfwd.py | 185 ++++++++++++++++++++++++
 util/qemu-sockets.c         |  82 +++++++----
 6 files changed, 473 insertions(+), 91 deletions(-)
 create mode 100644 tests/acceptance/hostfwd.py

-- 
2.32.0.rc0.204.g9fa02ecfa5-goog


