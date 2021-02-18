Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BB7731F0F2
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 21:25:57 +0100 (CET)
Received: from localhost ([::1]:34974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCps4-0005Qb-5y
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 15:25:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <38couYAMKCkopvqs00sxq.o0y2qy6-pq7qxz0zsz6.03s@flex--dje.bounces.google.com>)
 id 1lCpiV-0005P1-5p
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 15:16:04 -0500
Received: from mail-vk1-xa49.google.com ([2607:f8b0:4864:20::a49]:43387)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <38couYAMKCkopvqs00sxq.o0y2qy6-pq7qxz0zsz6.03s@flex--dje.bounces.google.com>)
 id 1lCpiN-0000JZ-Pn
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 15:16:02 -0500
Received: by mail-vk1-xa49.google.com with SMTP id d68so373264vkg.10
 for <qemu-devel@nongnu.org>; Thu, 18 Feb 2021 12:15:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:message-id:mime-version:subject:from:to:cc;
 bh=Q0z/PQWW6Lb/SJ/kQITPQU7NoYMb+5YbggGfOYFKxDw=;
 b=t/N0DqdKPu6OldeW26DFyMQBgHq1gR/ATHyjWp+deMwVfVSpypu+JccUVj1GX0u8Tg
 7aOpdWC3j17pRXgW+KJwZHqj9oW6P5Zp0zc8NJ60OxYbDkNxXNpD4fvHcTnJZJsH4Slx
 Jy+2s9S560sO79ya7OltJIM4gkohrRKfp9oNoGnNVdoup/g7aJ6y5Thqj43HWtPIujzX
 StfR3Sx7zovaWkGHFiodywUMBzRvelS7zyXyrV1RFOWpaZAYueB7a1TUqfwixTOlawuH
 rwSnXmflHT6oMeyPmfPpIuvDQlvDAuXrwe8E/aHxcNwjCrXIOWaLQncXf8t5uuxjVarh
 CUVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
 :to:cc;
 bh=Q0z/PQWW6Lb/SJ/kQITPQU7NoYMb+5YbggGfOYFKxDw=;
 b=LdUwJxsLUhW5i1mKEtk/NWqO/+1qkjHxsDsXUvCaZ4gZNG+I3rcV0up5eyHFC8vhjI
 NCgrdweTW8yoBrys3wRFtggWd4vRIik3WNTi/VQTsktdP/8pn22WOwOXFJOt3qtGIl1i
 AKdJR/9HV9vFLfsDIR+EUne8KIM0U8JloaBuE3AZJBqmp/m8g/XInBqJMi6vWnN56OJ7
 Q0SGPC7D6CwDmYn7eDw79KWU71iq2EBMyEndCSvEV7IFeKnoetC7w9/+a9wZfkvbFjF4
 leFR7KWqO8PPXAPInLQVnN0SHcJviCx5efzpwh5niuGdvKOxYvyjNr1X+b6is+Xz3C/N
 B20g==
X-Gm-Message-State: AOAM530k2WqlzLZp9hZsDHItiXrFuZ1AJHx8Z+o3l8SC+wk/ANSgN3bF
 SgAXhAk8LfLxZEpeHFbVsygo/Z3Noz+HyFhk7yw7zrF+fu2g3Egedd62haNlpCQcl4it3s5TS1y
 5DIEAJFVlGpb7FSFrT1/iFvOBGW9s2XPEFbRJAkD4cyz57g+87B3L
X-Google-Smtp-Source: ABdhPJx5ZxV6mYklPPApEgQX3KWwDwY7C3HtuNaD8nlrDx2q2HS3bFHKnC4BrAjkMi/D/C85dbBkivY=
X-Received: from ruffy.mtv.corp.google.com
 ([2620:0:1000:1412:4cc1:c5e:b49d:b16f])
 (user=dje job=sendgmr) by 2002:a9f:37c1:: with SMTP id
 q59mr5246762uaq.78.1613679345560; 
 Thu, 18 Feb 2021 12:15:45 -0800 (PST)
Date: Thu, 18 Feb 2021 12:15:34 -0800
Message-Id: <20210218201538.701509-1-dje@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.30.0.617.g56c4b15f3c-goog
Subject: [PATCH v4 0/4] Add support for ipv6 host forwarding
To: qemu-devel@nongnu.org
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>, 
 "=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?=" <berrange@redhat.com>,
 Doug Evans <dje@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::a49;
 envelope-from=38couYAMKCkopvqs00sxq.o0y2qy6-pq7qxz0zsz6.03s@flex--dje.bounces.google.com;
 helo=mail-vk1-xa49.google.com
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
and is now in qemu. See patch 1/4.

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

 hmp-commands.hx             |  15 +++
 include/qemu/sockets.h      |   3 +
 net/slirp.c                 | 194 ++++++++++++++++++++++++------------
 slirp                       |   2 +-
 tests/acceptance/hostfwd.py | 150 ++++++++++++++++++++++++++++
 util/qemu-sockets.c         |  94 ++++++++++++-----
 6 files changed, 370 insertions(+), 88 deletions(-)
 create mode 100644 tests/acceptance/hostfwd.py

-- 
2.30.0.617.g56c4b15f3c-goog


