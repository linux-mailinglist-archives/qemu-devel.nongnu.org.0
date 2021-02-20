Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 256F6320229
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Feb 2021 01:21:02 +0100 (CET)
Received: from localhost ([::1]:47790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDG17-0000yx-2o
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 19:21:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3JVQwYAMKCpY3946EE6B4.2ECG4CK-34L4BDED6DK.EH6@flex--dje.bounces.google.com>)
 id 1lDFts-0000VR-8D
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 19:13:32 -0500
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a]:34782)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3JVQwYAMKCpY3946EE6B4.2ECG4CK-34L4BDED6DK.EH6@flex--dje.bounces.google.com>)
 id 1lDFto-0005Nq-9U
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 19:13:31 -0500
Received: by mail-pg1-x54a.google.com with SMTP id y15so4616505pgk.1
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 16:13:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:message-id:mime-version:subject:from:to:cc;
 bh=c6UPbK3HQAs+QTYPAy07r5h5rFVlERqMVFPKS7Rl3h4=;
 b=tVQc5JuvnVoSIMlE1PWRg80WWzFlq718B6mc71IflGk+CU6QO7TPBvkaLEslJduo3a
 dZrmySP0/cczTm0AuIc1QnHYOiMY0iOafDW5UQJFfpPpfYo7KPy+Fiq+T8r+X7d3PLuL
 i5Ed4MdZSkSI2GExsvkkcbECa3rjbdW+ISvQs/uob+MPp9wAD9P6ers+oHNpnit6ptdw
 1am/jj58Gyx5JgDDR1kkpbWoCBdrccREdGcGSOhA39u/TqdXgteni5+7FW2/+Yj+Pe3a
 /CqRM3bMqlvl72dQm1FzZ7Cc2q6yk443RWPi8a8neC6zcjxwC8ZwyssrPHArr69QR6s2
 Bvfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
 :to:cc;
 bh=c6UPbK3HQAs+QTYPAy07r5h5rFVlERqMVFPKS7Rl3h4=;
 b=QVtkuSrzs8O0q0zRGr4Lh9Pfbu13AEbqh8+QzTghL5HFTWfasfKUOHMV7JJfq66YKu
 o+mKKlVOrRgLiw7a0sInsPnS86hPjusjShEXooyJxeU63bAzwj7ov3B/EPZ4e0i1iV9j
 qOAFcpUAR9OjHcsbeut5pNLimA1JexlPzhZK4jfjno8UNw4meLCa/rLX5Ijwe8g5YssA
 aNAAtsRSP0klI+WLKuIrQ3FTFsODGRIS/+ecYd19Kz5EUEbtaWpe+o9spn0V/tw8I8Kd
 wgeW1Db94zBA9S0c/Ctk+rBsJ3PpJWTx97LPb88cq/xEHn0rB5wtbYeudmNlorbnnbNK
 kK8Q==
X-Gm-Message-State: AOAM532MwMWwsRlckdFoprTNuZWEc7ZDOfxKJdZyh5Fuu0MBC7pfJUPv
 F0E42tkCcmE08un8vXgLt7QlBu8wSPMvLDiXLiyeCKmDpoT7czn84bUzbTECZcj3sg7sDak/Q78
 SdUj5/v/ZzkQ1H8sFxAzXK7BMYRUDKMBtRu68GqZKoE0ajuBYzKcG
X-Google-Smtp-Source: ABdhPJzCAwtf5lQsY5LM++xuwsPf2qBqCdblLjdzlPJ4qUW9bRLARLqn6p/eNJjNycsrifT1Tc9LGO4=
X-Received: from ruffy.mtv.corp.google.com
 ([2620:0:1000:1412:7d06:9b98:ec95:3f70])
 (user=dje job=sendgmr) by 2002:a17:90a:8a95:: with SMTP id
 x21mr11081122pjn.221.1613780005748; Fri, 19 Feb 2021 16:13:25 -0800 (PST)
Date: Fri, 19 Feb 2021 16:13:17 -0800
Message-Id: <20210220001322.1311139-1-dje@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.30.0.617.g56c4b15f3c-goog
Subject: [PATCH v5 0/5] Add support for ipv6 host forwarding
To: qemu-devel@nongnu.org
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>, 
 "=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?=" <berrange@redhat.com>,
 Doug Evans <dje@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::54a;
 envelope-from=3JVQwYAMKCpY3946EE6B4.2ECG4CK-34L4BDED6DK.EH6@flex--dje.bounces.google.com;
 helo=mail-pg1-x54a.google.com
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
Reply-to:  Doug Evans <dje@google.com>
From:  Doug Evans via <qemu-devel@nongnu.org>

This patchset takes the original patch from Maxim,
https://www.mail-archive.com/qemu-devel@nongnu.org/msg569573.html
and updates it.

Option hostfwd is extended to support ipv6 addresses.
Commands hostfwd_add, hostfwd_remove are extended as well.

The libslirp part of the patch has been committed upstream,
and is now in qemu. See patch 1/5.

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

Doug Evans (5):
  slirp: Advance libslirp submodule to add ipv6 host-forward support
  util/qemu-sockets.c: Split host:port parsing out of inet_parse
  inet_parse_host_and_addr: Recognize []:port (empty ipv6 address)
  net/slirp.c: Refactor address parsing
  net: Extend host forwarding to support IPv6

 hmp-commands.hx             |  15 +++
 include/qemu/sockets.h      |   3 +
 net/slirp.c                 | 196 ++++++++++++++++++++++++------------
 slirp                       |   2 +-
 tests/acceptance/hostfwd.py | 174 ++++++++++++++++++++++++++++++++
 util/qemu-sockets.c         |  84 ++++++++++++----
 6 files changed, 390 insertions(+), 84 deletions(-)
 create mode 100644 tests/acceptance/hostfwd.py

-- 
2.30.0.617.g56c4b15f3c-goog


