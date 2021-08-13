Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB383EBEDA
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Aug 2021 01:47:13 +0200 (CEST)
Received: from localhost ([::1]:35446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mEgtM-00069U-J2
	for lists+qemu-devel@lfdr.de; Fri, 13 Aug 2021 19:47:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <33AMXYQMKCk8u0vx55x2v.t537v3B-uvCv2454x4B.58x@flex--dje.bounces.google.com>)
 id 1mEgqn-0003Cq-0y
 for qemu-devel@nongnu.org; Fri, 13 Aug 2021 19:44:33 -0400
Received: from mail-qk1-x74a.google.com ([2607:f8b0:4864:20::74a]:33417)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <33AMXYQMKCk8u0vx55x2v.t537v3B-uvCv2454x4B.58x@flex--dje.bounces.google.com>)
 id 1mEgqk-0003jD-N0
 for qemu-devel@nongnu.org; Fri, 13 Aug 2021 19:44:32 -0400
Received: by mail-qk1-x74a.google.com with SMTP id
 w2-20020a3794020000b02903b54f40b442so8615216qkd.0
 for <qemu-devel@nongnu.org>; Fri, 13 Aug 2021 16:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=xfieLsWmq+ux5N8BsR3PXnbkSxDHrS8Wz+R2rtjhrIs=;
 b=jaMK7p2CX6pDA+kQEvlprloBvkGxvNGcQFLQk9vNGRub8ELahQGTMEVYQ7VSsmHIHY
 roZxTN2Ig8/VJVWryRowLHO4MxFfn94fF4QVR4DnhMEhY7qbwW7RryPr8bfKt+4l5gx0
 e0uTkUC+g3FxoClZLtSJGvLHWyQtQ/5RyJ8DU2CY1RkDl2R39jI0tKmDvIW9EOUznJ1O
 kyZky7NgjgwcLitqHSnrQ1Ec1DvSES2GHDugUWQT97ZmJDTuiySroo9FuLlov3C/M+Jp
 HUpptDSeMC1jWWPVeLuoYj9fVtYw6JBbGwHXfMVjwM1bdo05t+MDWPnflM1O44O5yL2Z
 SdQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=xfieLsWmq+ux5N8BsR3PXnbkSxDHrS8Wz+R2rtjhrIs=;
 b=kFTncLe11BX0QimXz0azP1NqpOgWxY625zggYkU3qiQNMYK8CeIN6IA+W66mYs3AQZ
 cDSICrwrdhY8UL/mNVv+1gvGnxVz1MquJj8HRkw1ze1FKCz44BDekGyvcBCciQ4QH1ez
 lKrzejREa1bGGN8wnDVw5nDiI0H4TFRX1J+W30qWrGhCnuxAkLyMDClE14W4IpMUl9Yc
 b2N7SsPXM5ViMZoHzvpVvJhJzFgdCyz8RSA/0OvLqzB6WBjrvbcj5J/6CoNJFME5sshr
 gGoI2rhetSKP/n1GFwR6JzxWZGwzuV3Jap1Xcww4T+aIVWBbiFP5uFO9GzYP0Ymcq5n1
 atcg==
X-Gm-Message-State: AOAM530mkIB5jsDYK+pR8FWy0T4NBJJ3rewV55uhSJvmbga74VKxkATg
 ma7ONCdgFYMv8J54v9fsTXfEpiTdoShuOcV6nxCKRy7S2mrDTEstqS0jv4vyGxa4v2UT/JXv8aO
 kABtvOpdRMRm3YL5VRDaTiyrdbwE0/N2HSX/SLEtaJ30AeM5bvGQ0
X-Google-Smtp-Source: ABdhPJwvSj3xZpMQgiUgGK195yN66D8rsqhn7ju21WpLySskXySv/2aIvFi9WA5JBv8/qHz4WNJwV+8=
X-Received: from ruffy.mtv.corp.google.com
 ([2620:0:1000:1412:94ae:6a1e:bc04:4f63])
 (user=dje job=sendgmr) by 2002:ad4:54f2:: with SMTP id
 k18mr5206216qvx.24.1628898268300; 
 Fri, 13 Aug 2021 16:44:28 -0700 (PDT)
Date: Fri, 13 Aug 2021 16:44:21 -0700
Message-Id: <20210813234424.2029019-1-dje@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.33.0.rc1.237.g0d66db33f3-goog
Subject: [PATCH v8 0/3] Add support for ipv6 host forwarding
From: Doug Evans <dje@google.com>
To: qemu-devel@nongnu.org
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>, 
 "=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?=" <berrange@redhat.com>,
 Jason Wang <jasowang@redhat.com>, 
 "=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=" <philmd@redhat.com>,
 Doug Evans <dje@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::74a;
 envelope-from=33AMXYQMKCk8u0vx55x2v.t537v3B-uvCv2454x4B.58x@flex--dje.bounces.google.com;
 helo=mail-qk1-x74a.google.com
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

Changes from v7:

None really, except to remove v7's 1/4 from this patchset.
V7's 1/4 was to update QEMU to use the latest libslirp,
and that has now been done. The remaining 3 patches are unchanged.

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

Doug Evans (3):
  util/qemu-sockets.c: Split host:port parsing out of inet_parse
  net/slirp.c: Refactor address parsing
  net: Extend host forwarding to support IPv6

 hmp-commands.hx             |  18 ++-
 include/qemu/sockets.h      |   5 +
 net/slirp.c                 | 272 ++++++++++++++++++++++++++++--------
 tests/acceptance/hostfwd.py | 185 ++++++++++++++++++++++++
 util/qemu-sockets.c         |  82 +++++++----
 5 files changed, 472 insertions(+), 90 deletions(-)
 create mode 100644 tests/acceptance/hostfwd.py

-- 
2.33.0.rc1.237.g0d66db33f3-goog


