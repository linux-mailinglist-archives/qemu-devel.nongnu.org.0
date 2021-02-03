Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A33130E50B
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 22:41:01 +0100 (CET)
Received: from localhost ([::1]:48786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7PtT-0006jB-UD
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 16:40:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3nRcbYAMKCkAflgiqqing.eqosgow-fgxgnpqpipw.qti@flex--dje.bounces.google.com>)
 id 1l7PqI-0005Aq-JA
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 16:37:43 -0500
Received: from mail-ua1-x949.google.com ([2607:f8b0:4864:20::949]:52957)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3nRcbYAMKCkAflgiqqing.eqosgow-fgxgnpqpipw.qti@flex--dje.bounces.google.com>)
 id 1l7PqC-0000iG-9o
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 16:37:41 -0500
Received: by mail-ua1-x949.google.com with SMTP id y26so334618uap.19
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 13:37:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:message-id:mime-version:subject:from:to:cc;
 bh=u49Otbexgrc2GWVSjYj61CpIpaqc121l31PGLPhfRu4=;
 b=pZQu/88vaL0TYhNdYfV96FDGk/mW31GxYfs2fXXRxA4v1KdJp6e2u/sl9FRaaq15il
 xHt1xhVOU3tU6KkYiFsjSYwaE0OUum9T06WWsarFyJsu/rbgDcG8RDjBQP3Y7Iv8VMDt
 f+pT/J/pgtDUDfIlszd4dmgKoAIj/cuEMt1kU11z/nHZi+B6RsiQuvQxoo9hDb3l9wxO
 e9eKQE9j0gbwfVSatxj0WWLSrjcVf2BNpt4FtOLlCBaAlnquYOn54g/ntyOwi3vWKscn
 ALX3l6g46ADmcQVuDVPv/VvKxZyPpwCkYO0DM67o3VzGO/siBRz8KNgGrA2vCKA0jkdb
 Kzfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
 :to:cc;
 bh=u49Otbexgrc2GWVSjYj61CpIpaqc121l31PGLPhfRu4=;
 b=fCzH2JQIUK23FJyVbADlan+gclqh/LOBelvBTeigXVBRmQaVzZOaBcFRHzrmjMQPpJ
 74z6/zgiT9Wi0BwBaszBpAUTPPouWOPLRx7d//bSWd6WvoEou9b8Cdcz9MWeFJwsykCR
 yCJrodWFY3blbiQv3gKZB7V2M5C+2vsTbWt4JN3uKQ3CZj+OkW5wl7N+OXDh1xDZuzwk
 KQ3XaziN4xr3hi80NLIqKq4Kd3MJ2Y3ShVbknQlxgMm4H+5GudVXqDfvsFa42nRuaIS+
 60TRkemIO/WOjpnygVYeF5Th9Qkf3YCyAvrBZeYX4PhqnPUIjSTnISPK/ODeiDJhPDvI
 /mmw==
X-Gm-Message-State: AOAM531l+dIt++ZoJLOdncUgymfUMCOSWsH3hI+WNbblQUC+Cl4VSXrB
 WXy6bmCV3y+bobFpiNheCwo/L4AhQQoFEZ3w284fYYQEsQCrNzpB7uMWoXz6nJiv1GyImxf5djp
 PQzhnhOOhtanBHOk7FmnIELWfGRsyBirn5ZWcaS0SMHEtfXpLdiNN
X-Google-Smtp-Source: ABdhPJwKfJbTEuVpOTTtSpE+7uycnwU4gFaktsRPSPbm1IG0xlaKNWFOsau8iqt4Isr34dFkM8F3hho=
X-Received: from ruffy.mtv.corp.google.com
 ([2620:0:1000:1412:25d4:96ad:ca30:7913])
 (user=dje job=sendgmr) by 2002:a1f:9004:: with SMTP id
 s4mr3356546vkd.6.1612388253713; 
 Wed, 03 Feb 2021 13:37:33 -0800 (PST)
Date: Wed,  3 Feb 2021 13:37:27 -0800
Message-Id: <20210203213729.1940893-1-dje@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.30.0.365.g02bc693789-goog
Subject: [PATCH v2 0/2] Add support for ipv6 host forwarding
To: qemu-devel@nongnu.org
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>, Doug Evans <dje@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::949;
 envelope-from=3nRcbYAMKCkAflgiqqing.eqosgow-fgxgnpqpipw.qti@flex--dje.bounces.google.com;
 helo=mail-ua1-x949.google.com
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

Change from v1:
- libslirp part is now upstream
- net/slirp.c changes split into two pieces (refactor, add ipv6)
- added docs

Doug Evans (2):
  net/slirp.c: Refactor address parsing
  net: Add -ipv6-hostfwd option, ipv6_hostfwd_add/remove commands

 hmp-commands.hx     |  28 ++++
 include/net/slirp.h |   2 +
 net/slirp.c         | 311 +++++++++++++++++++++++++++++++++++---------
 qapi/net.json       |   4 +
 slirp               |   2 +-
 5 files changed, 282 insertions(+), 65 deletions(-)

-- 
2.30.0.365.g02bc693789-goog


