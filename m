Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1365383DA
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 17:11:26 +0200 (CEST)
Received: from localhost ([::1]:46326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvh3F-0006Cz-Ek
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 11:11:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nvgzO-0003Ph-Gy
 for qemu-devel@nongnu.org; Mon, 30 May 2022 11:07:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48937)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nvgzJ-00060r-CV
 for qemu-devel@nongnu.org; Mon, 30 May 2022 11:07:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653923240;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=KG4TGHCpoYORfeW2+pzlieXWrBP3YorRTeHPbougtDc=;
 b=IENa1tVwk3bbBcOnO64DKb2w5W3aO/2FRVaBrqu1JJoDgdleV7knpX9TGxu1JIZbEXq8b1
 EldGt6UDBBzScveRam/pcWcz0EySMvZLbLh/GuieD7v2QhXzfbL8gifoMC6aeok4P9pRbn
 p1Nl89MEF/fTSkmG+saJG2Q3SsQDaoc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-608-wL0r6MeKM4CT-ucVjmiBwg-1; Mon, 30 May 2022 11:07:19 -0400
X-MC-Unique: wL0r6MeKM4CT-ucVjmiBwg-1
Received: by mail-wm1-f70.google.com with SMTP id
 u12-20020a05600c19cc00b0038ec265155fso9874699wmq.6
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 08:07:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KG4TGHCpoYORfeW2+pzlieXWrBP3YorRTeHPbougtDc=;
 b=E7O+yxV7dP3CQ8GbHGDv68UElrzDO9xpXchHVDNTVFc2B8H/rT/fp/ygGpTgcVVasP
 qDKkLH6ZEO8SZJnrkjkTodO+ap+bBobkKiX+wuBwsBmPIh9ozKbMTkTbI9CQXLGmdeSW
 M0YCQirLLssrdykai3sanw8OnJZ0Lt/BUh4kCH6BjrJ0aQ37c7L8ATu+fpsSbp22Cjea
 jiAtCi8A0u5xM/VfAokjY2L2oIzOMQP5TQ2hW6xEx8inJxVPhlNKJ8QsSHE8uyBzMTmb
 vEZNtz8d4kB2mqk74hYi8eG8+dL9WQpJ9wkcSFCwo32BwcKE1b6ag5Xruk0v6i8mG6q5
 ZcXw==
X-Gm-Message-State: AOAM530TlY8h+5C6wVFONc6XpNoGVJAYYcdZZ0OqQJ1MXjXxSioaNeaG
 7widEz2bY9R/20C4S0K/WogDXyBVFIvJw/84TH99/AQltvCEo9dT2/Xk0crFs7pZivaCC5KpnxO
 0Vh91pLMMDU70l4kmvC9vLCSPBdaotcimU/BZesaCT6xCvpS7fI6CQdF3xFdx52x674U=
X-Received: by 2002:a5d:47a1:0:b0:20f:ecc4:7f6c with SMTP id
 1-20020a5d47a1000000b0020fecc47f6cmr28152014wrb.236.1653923237205; 
 Mon, 30 May 2022 08:07:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz4SmgCZDDZ5cWGHa5dDC6iksI1ERu8CKF5TiQ6+gI8RA9mtvpIygoNeLlo2ZY28xp4RKoxBw==
X-Received: by 2002:a5d:47a1:0:b0:20f:ecc4:7f6c with SMTP id
 1-20020a5d47a1000000b0020fecc47f6cmr28151980wrb.236.1653923236803; 
 Mon, 30 May 2022 08:07:16 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id
 l6-20020adff486000000b0020c5253d907sm9220916wro.83.2022.05.30.08.07.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 08:07:15 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: armbru@redhat.com,
	dgilbert@redhat.com
Subject: [PATCH v5 00/10] qmp, hmp: statistics subsystem and KVM suport.
Date: Mon, 30 May 2022 17:07:04 +0200
Message-Id: <20220530150714.756954-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

This patchset adds QEMU support for querying fd-based KVM statistics.
This allows the user to analyze the behavior of the VM without access
to debugfs.

However, instead of adding an ad hoc command, the new QMP entry point
can be extended in the future to more statistics provider than KVM
(for example TCG, tap, or the block layer) and to more objects than
the VM and vCPUS (for example network interfaces or block devices).

Because the statistics exposed by KVM are not known at compile time,
the kernel interface also comes with an introspectable schema.  This
schema is exposed by the query-stats-schemas QMP command.

Patches 1 and 2 add the basic support, respectively the QMP command
and the KVM producer.

Patches 3 to 6 add a basic HMP implementation.  The first of the two
adds a basic filtering mechanism to the QMP command, which is then used
by HMP (which only shows vCPU statistics for the currently selected
guest CPU; this is consistent with other HMP commands and does not
flood the user with an overwhelming amount of output).

The remaining patches add more filtering, respectively by provider
and by the name of a statistic.

The v4->v5 delta mostly restructures the implementation to hve
sensible results if the same providers is specified many times in
the same query-stats invocation.

v4->v5:
- all: wrap long lines

- patch 1: fix indentation of "Note"

- patch 2: use QAPI_LIST_PREPEND and error_setg_errno

- patches 4/5: new

- patch 6: reorganize printing of units to use prefixes instead
  of long names ("ns", not "nanoseconds")

- patches 1/3/7/9: filtering reimplemented to improve behavior if the
  same provider occurs many times in the same query-stats invocation.
  Before, all filters were evaluated first, and the callback was then
  run if there was a match.  Now, each filter is evaluated separately.

- patch 9: do not drop names from prototypes


Mark Kanda (3):
  qmp: Support for querying stats
  kvm: Support for querying fd-based stats
  hmp: add basic "info stats" implementation

Paolo Bonzini (7):
  qmp: add filtering of statistics by target vCPU
  cutils: fix case for "kilo" and "kibi"
  cutils: add functions for IEC and SI prefixes
  qmp: add filtering of statistics by provider
  hmp: add filtering of statistics by provider
  qmp: add filtering of statistics by name
  hmp: add filtering of statistics by name

 accel/kvm/kvm-all.c      | 408 +++++++++++++++++++++++++++++++++++++++
 hmp-commands-info.hx     |  14 ++
 include/monitor/hmp.h    |   1 +
 include/monitor/stats.h  |  45 +++++
 include/qemu/cutils.h    |  18 ++
 monitor/hmp-cmds.c       | 232 ++++++++++++++++++++++
 monitor/qmp-cmds.c       | 155 +++++++++++++++
 qapi/meson.build         |   1 +
 qapi/qapi-schema.json    |   1 +
 qapi/stats.json          | 249 ++++++++++++++++++++++++
 tests/unit/test-cutils.c |  52 +++++
 util/cutils.c            |  36 +++-
 12 files changed, 1202 insertions(+), 10 deletions(-)
 create mode 100644 include/monitor/stats.h
 create mode 100644 qapi/stats.json

-- 
2.36.1


