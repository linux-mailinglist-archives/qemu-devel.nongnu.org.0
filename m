Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3103051EC83
	for <lists+qemu-devel@lfdr.de>; Sun,  8 May 2022 11:36:08 +0200 (CEST)
Received: from localhost ([::1]:60914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nndKh-0004CD-6r
	for lists+qemu-devel@lfdr.de; Sun, 08 May 2022 05:36:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nndGJ-0001RT-Vz
 for qemu-devel@nongnu.org; Sun, 08 May 2022 05:31:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44245)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nndGD-0008OW-CO
 for qemu-devel@nongnu.org; Sun, 08 May 2022 05:31:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652002287;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Sw7ErqtOYBeCzKs2sY/L6urneqNEBLv02dtvHv+vIo0=;
 b=brXp/ukehJBw3sm+iZVp17WTuiz9JJXh6G6M/kq/IJQCEhsklfcVOW34vUknZYtVA/4gwl
 TS4NY0FIWArdz4v0s+Fd5O7GXa4gZmQQP5c0lWN6pKRzdwDUXDYkd92AT5rp4/jk9lkTBY
 eOOIojIL2McoI04ahR1TCIUKQ74RriI=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-301--hLGaHAeOcyRynPlFjhm2w-1; Sun, 08 May 2022 05:31:26 -0400
X-MC-Unique: -hLGaHAeOcyRynPlFjhm2w-1
Received: by mail-ed1-f72.google.com with SMTP id
 h7-20020a056402094700b00425a52983dfso6582230edz.8
 for <qemu-devel@nongnu.org>; Sun, 08 May 2022 02:31:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Sw7ErqtOYBeCzKs2sY/L6urneqNEBLv02dtvHv+vIo0=;
 b=NLl4CMaOyF2j1SfcXhXY22cNIwXGW1cMMWoElzc8DseYVNPlY5OOV+AFPSa70ScULQ
 f4KfrCq++Io58TnBwnNoerdhXqJg0kFTkCZUf6LFrI4JEgHlzI7F4a+NNBSGlbOyBg/X
 p4tCav+PJrfTaqrRG2YtWPe5rDsQHoC1rtc07JPNtTKptzFT+DVRMyJioGHQkciwNscq
 zV2WGWwSmHyrgGd+4nkP4kgxWVQFmXr89ye4O6eNZ9CdkTYhiH/DEt3ma7yYBYjt1Nue
 cHW3h3/K64OfdTWgUI8kmh8sy2+AY3VYEKheb0f5C1N7rVz91IjMilrxeXls6tcwom4S
 SqIg==
X-Gm-Message-State: AOAM530zJy7L00YBDqWWMbGvEjF1DVbHwBXMmre6i/tDgytPWGk/Tysr
 wxryYDYFl8ba+cplrecoYxd9+M9lca0tfXuRo7I+ySIy3Rpg7qg2wJ2qE+hptM4ldysZOOvPR3I
 Sq2R0zTqJxNgq19WS9oc0lsh66vwhxkCmGPLjjCwfAq+zMa6PGqfs0Xj8blNavtmBHC0=
X-Received: by 2002:a05:6402:3585:b0:427:ccd4:bec3 with SMTP id
 y5-20020a056402358500b00427ccd4bec3mr12060186edc.2.1652002284626; 
 Sun, 08 May 2022 02:31:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxMpH8y9yFTgqcc5i35Z+cZAOV33MnneinzNUTsSD16u/w1gGxOztjm3K1DsucFnxl9EnLWkQ==
X-Received: by 2002:a05:6402:3585:b0:427:ccd4:bec3 with SMTP id
 y5-20020a056402358500b00427ccd4bec3mr12060174edc.2.1652002284375; 
 Sun, 08 May 2022 02:31:24 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:e3ec:5559:7c5c:1928])
 by smtp.gmail.com with ESMTPSA id
 z12-20020a170906714c00b006f3ef214dfdsm3833117ejj.99.2022.05.08.02.31.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 May 2022 02:31:23 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: berrange@redhat.com,
	malureau@redhat.com
Subject: [PATCH v2 0/5] net: support for CFI with libslirp >= 4.7
Date: Sun,  8 May 2022 11:31:15 +0200
Message-Id: <20220508093120.173131-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Content-Type: text/plain

Up until now, a CFI-enabled build would require slirp to be compiled as
a static library, using the version that is bundled together with QEMU.
This is because slirp registers functions as callbacks for QEMU Timers
and, when using a system-wide shared libslirp, the type information for
the callback is missing.  Thus, the timer call produces a false positive
with CFI.

slirp 4.7 introduces a new CFI-friendly timer callback that does not pass
function pointers within libslirp as callbacks for timers.  Check the
version number and, if it is new enough, allow using CFI even with a
system libslirp.

Supersedes: <20220412121337.207203-1-pbonzini@redhat.com>

Paolo

v1->v2: check for minimum slirp version (4.1), use config version 1


Paolo Bonzini (5):
  slirp: bump submodule past 4.7 release
  net: slirp: introduce a wrapper struct for QemuTimer
  net: slirp: switch to slirp_new
  net: slirp: add support for CFI-friendly timer API
  net: slirp: allow CFI with libslirp >= 4.7

 meson.build | 33 +++++++++++----------
 net/slirp.c | 85 ++++++++++++++++++++++++++++++++++++++++++++++-------
 slirp       |  2 +-
 3 files changed, 93 insertions(+), 27 deletions(-)

-- 
2.35.1


