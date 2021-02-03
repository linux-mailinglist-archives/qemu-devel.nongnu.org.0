Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEDD130E77D
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 00:38:46 +0100 (CET)
Received: from localhost ([::1]:45080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7RjR-0007VY-EA
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 18:38:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3TjMbYAMKCikIOJLTTLQJ.HTRVJRZ-IJaJQSTSLSZ.TWL@flex--dje.bounces.google.com>)
 id 1l7Rgb-00069d-AX
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 18:35:49 -0500
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a]:48759)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3TjMbYAMKCikIOJLTTLQJ.HTRVJRZ-IJaJQSTSLSZ.TWL@flex--dje.bounces.google.com>)
 id 1l7RgY-00017P-RJ
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 18:35:48 -0500
Received: by mail-pl1-x64a.google.com with SMTP id t14so840237plr.15
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 15:35:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:message-id:mime-version:subject:from:to:cc;
 bh=m2FTs8RiJopycQLRbJlJSelna5mgzBbInRy10ukAho0=;
 b=ueWojODc/ebt0rCFBrlGYFH0E6UP9oIV2mrmezdgba6Ovob4RFtCgQbcKBbLoSBPPf
 nsA9QcDrJ7lkikrwb17vbdo/F43Xcw2ZItsuqJ4H+AAYbzgsqM2QbA8qe610kgXlQVCs
 KtvuI1oJK63kFjuZXUp5ZNxtgbYZv4LLF3m8EgCF8JstTwCO43Ea/XsqAGh8GFZIUbfa
 M3WzWGXULsSY2qnKIa7AlmF/mEs1VIG/xmw+fljozAzYPqQekG401Tv34F7uzyR8HqVc
 4uaK5RC3OEf1UDg+voeGBm8qVsSG1deUc/MccfyvzTJBpgVxaOI4Zh3NHaJ3UHRwClfQ
 Z6GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
 :to:cc;
 bh=m2FTs8RiJopycQLRbJlJSelna5mgzBbInRy10ukAho0=;
 b=k5tTkjFsv1B/Lb06jPHp5kxohYfEfy6CNMlC0VRVVYfZZF724OaS1Ef01C7jELKFJT
 LkAv482wFE1hDUSw/1mEYGxrZhVatOVCfGTJMeh+DQtYmid6BKByxHMPC7WqzYxoRiK6
 BgACwnyXmIjYDxlEN5za0KT6XAKcLC+mkChq3h1V64yHejDWTgTC/T4oS8Efxk5IVxRd
 ZVjy8PHFE9VMWaXSiYJP8PKbmM85PyIiQ7ik9V9uRHb8V24HDZDyJqvU1br2QcfTN/Gw
 VlZH48Tlv9R/gshVFYrxeklBWiiatwPLUBaF81OguvIWMA3WANmnOJCrfnf/nT9U9Ptj
 DzNw==
X-Gm-Message-State: AOAM531uJ7NJBYHKr7WVMAHbiIxU7FvAnFrijQSzzQYlFe41nohBJVCQ
 Td9gbG7dTHm9NViHhBBrrt3Z1sPvi6ag0pUH1EBNuvdoOtwK4z4d3g5KsK/HvB5EuT19T5B9Ifx
 rj+vCdIAR29gNbujMJmOhbukZvMptFJ4Kqq8xv95PWD33OOS8YyOb
X-Google-Smtp-Source: ABdhPJw7595ioMrA6zriQTTwKQOfCYnXy+wgwgYTTO58cZS7D5q+xwohclGF8pZbnALdi4LON8z31h8=
X-Received: from ruffy.mtv.corp.google.com
 ([2620:0:1000:1412:25d4:96ad:ca30:7913])
 (user=dje job=sendgmr) by 2002:a17:90a:178e:: with SMTP id
 q14mr5443138pja.71.1612395342848; Wed, 03 Feb 2021 15:35:42 -0800 (PST)
Date: Wed,  3 Feb 2021 15:35:36 -0800
Message-Id: <20210203233539.1990032-1-dje@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.30.0.365.g02bc693789-goog
Subject: [PATCH v3 0/3]
To: qemu-devel@nongnu.org
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>, Doug Evans <dje@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::64a;
 envelope-from=3TjMbYAMKCikIOJLTTLQJ.HTRVJRZ-IJaJQSTSLSZ.TWL@flex--dje.bounces.google.com;
 helo=mail-pl1-x64a.google.com
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
From: dje--- via <qemu-devel@nongnu.org>

Add support for ipv6 host forwarding

This patchset takes the original patch from Maxim,
https://www.mail-archive.com/qemu-devel@nongnu.org/msg569573.html
and updates it.

New option: -ipv6-hostfwd

New commands: ipv6_hostfwd_add, ipv6_hostfwd_remove

These are the ipv6 equivalents of their ipv4 counterparts.

The libslirp part of the patch has been committed upstream,
and will require adding it to qemu.
https://gitlab.freedesktop.org/slirp/libslirp/-/commit/0624fbe7d39b5433d7084a5096d1effc1df74e39
[plus the subsequent merge commit]

Changes from v2:
- split out libslirp commit
- clarify spelling of ipv6 addresses in docs
- tighten parsing of ipv6 addresses

Change from v1:
- libslirp part is now upstream
- net/slirp.c changes split into two pieces (refactor, add ipv6)
- added docs

Doug Evans (3):
  slirp: Placeholder for libslirp ipv6 hostfwd support
  net/slirp.c: Refactor address parsing
  net: Add -ipv6-hostfwd option, ipv6_hostfwd_add/remove commands

 hmp-commands.hx     |  32 +++++
 include/net/slirp.h |   2 +
 net/slirp.c         | 310 +++++++++++++++++++++++++++++++++++---------
 qapi/net.json       |   4 +
 slirp               |   2 +-
 5 files changed, 285 insertions(+), 65 deletions(-)

-- 
2.30.0.365.g02bc693789-goog


