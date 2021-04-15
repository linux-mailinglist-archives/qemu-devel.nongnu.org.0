Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41BD9360093
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 05:42:25 +0200 (CEST)
Received: from localhost ([::1]:52994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWstb-0001dx-NF
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 23:42:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3irV3YAMKCt0CIDFNNFKD.BNLPDLT-CDUDKMNMFMT.NQF@flex--dje.bounces.google.com>)
 id 1lWsrI-0000JE-2i
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 23:40:00 -0400
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449]:44807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3irV3YAMKCt0CIDFNNFKD.BNLPDLT-CDUDKMNMFMT.NQF@flex--dje.bounces.google.com>)
 id 1lWsrF-0004ht-HM
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 23:39:59 -0400
Received: by mail-pf1-x449.google.com with SMTP id
 d130-20020a621d880000b02901fb88abc171so2055283pfd.11
 for <qemu-devel@nongnu.org>; Wed, 14 Apr 2021 20:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=uigCV7iN8L8HyQfw7Nte0uVxsGjx/eePiI6e0hjIKy4=;
 b=RmcqT+YPzb9v3tPbAZek+uGgEfrHt0etwv1hE83UXgUyYO9fWnPNBUWHdUbVbnS9Tg
 aCSQl/stIPt2ORe9a8iZ9gkOKjMj119Odtn+zy+qL0HPRGL7IkUoZzsTDjeyN5PtqYUn
 rtFKSXwPCXyejDF3+msqs85Fe8uc7TE2fFmPSC9U1ehw1cpq44b3UUk4QfzUYOBXv9xV
 +Y8Jx5O7759bF1hHfFORcyEsYseaicKis5tFfSY29wFOJiW887F0WGHX+w0xe2+2iioa
 OuBsS6e9/HDjIadS9+P+jT0g1ZQewO56zEzY2X10/VIW9hq1u8bfQKQ3k5dSioPpvu3U
 lJ/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=uigCV7iN8L8HyQfw7Nte0uVxsGjx/eePiI6e0hjIKy4=;
 b=sp1hZHQLrGDrrvDpsvi+xioJJsWOCFN2ZOvNpJS6EcE0DnBjq33ZpnzTYUW2ilNI/b
 WOKJNy9xAJbP28hQKpxhejUSPDCVS1xTukEFMXLR4pCXoI7OpxoN1L7fd2/2NchQipfK
 /Ym65nt948saXl8DK/I5+YfPiNatu2od+V5Xe+fT8Y8xJCd+IbnCuThK25W1TQyQrIQE
 LCHMDeIh1eYOAAiZdOxz/onjTPoPjGgyerSC9ZfeQtkL364y9svK41NeRaol5JrOUyFO
 SkfZmaIC0VVrCDsrOxBehqWiMlQ64VcBA0TKTgVsmogl3Gw3JVFLrtTBj853Bi4/h3RV
 5XnA==
X-Gm-Message-State: AOAM531acYrfALzKd3OYYvD3PMt6onjYMYyJtGACTciOqV5zC5T3Km6j
 aoryo1dMdO8lZSGr2CykOnNtT/K61J0B6VrUOHuz+RwONuhFcbEnAUGPHD+3+gtZffjjDhjIpII
 ycMDRSdqaboEFadSbWTOqBKo0NSjfUW9Ntfvw6/iX0m9tvx9Ok7qD
X-Google-Smtp-Source: ABdhPJzPu708/1WbdMWTvSKdjuiy2CSR08T3PzcM1OVq8IEGn2ct1zwX00GGbjEH3ZCvivjbqTfn464=
X-Received: from ruffy.mtv.corp.google.com
 ([2620:0:1000:1412:83d5:e012:e680:1449])
 (user=dje job=sendgmr) by 2002:a65:6792:: with SMTP id
 e18mr1574332pgr.256.1618457994621; 
 Wed, 14 Apr 2021 20:39:54 -0700 (PDT)
Date: Wed, 14 Apr 2021 20:39:21 -0700
Message-Id: <20210415033925.1290401-1-dje@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.31.1.295.g9ea45b61b8-goog
Subject: [PATCH v6 0/4] Add support for ipv6 host forwarding
From: Doug Evans <dje@google.com>
To: qemu-devel@nongnu.org
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>, 
 "=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?=" <berrange@redhat.com>,
 Doug Evans <dje@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::449;
 envelope-from=3irV3YAMKCt0CIDFNNFKD.BNLPDLT-CDUDKMNMFMT.NQF@flex--dje.bounces.google.com;
 helo=mail-pf1-x449.google.com
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

The libslirp part of the patch has been committed upstream,
and is now in qemu. See patch 1/4.

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
  slirp: Advance libslirp submodule to add ipv6 host-forward support
  util/qemu-sockets.c: Split host:port parsing out of inet_parse
  net/slirp.c: Refactor address parsing
  net: Extend host forwarding to support IPv6

 hmp-commands.hx             |  18 ++-
 include/qemu/sockets.h      |   5 +
 net/slirp.c                 | 236 ++++++++++++++++++++++++++----------
 slirp                       |   2 +-
 tests/acceptance/hostfwd.py | 185 ++++++++++++++++++++++++++++
 util/qemu-sockets.c         |  82 +++++++++----
 6 files changed, 436 insertions(+), 92 deletions(-)
 create mode 100644 tests/acceptance/hostfwd.py

-- 
2.31.1.295.g9ea45b61b8-goog


