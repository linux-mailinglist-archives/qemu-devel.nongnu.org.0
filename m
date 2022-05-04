Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4F8F51B00E
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 23:05:07 +0200 (CEST)
Received: from localhost ([::1]:36630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmMBH-00043p-0n
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 17:05:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nmM6T-0006PS-F3
 for qemu-devel@nongnu.org; Wed, 04 May 2022 17:00:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47080)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nmM6R-00067s-PL
 for qemu-devel@nongnu.org; Wed, 04 May 2022 17:00:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651698006;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=BM26IEeM8p4E03a27dsjikLHcepoDQUe6a04+YYT5Ys=;
 b=ilpBAcIqRm6A5iHUmLwF/4Miom42ow39fMNSV+cjbgSsGegnv5FpZZLFjdKyPpswvp8Oro
 J+q6T2FTfuDZeSSlZHfWErV2ZwiiGzF4F1YX6DdJb8d0oqNvwA/VihxMbMJP1C1pSAnuoX
 67XCDD3PAp3OIZZP3L07PyIc8fDu3gQ=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-384-fBUSeGIaNpWf2m4R_aViJQ-1; Wed, 04 May 2022 17:00:05 -0400
X-MC-Unique: fBUSeGIaNpWf2m4R_aViJQ-1
Received: by mail-ej1-f70.google.com with SMTP id
 qf19-20020a1709077f1300b006f439243355so1499516ejc.3
 for <qemu-devel@nongnu.org>; Wed, 04 May 2022 14:00:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BM26IEeM8p4E03a27dsjikLHcepoDQUe6a04+YYT5Ys=;
 b=Hdd6mb5A5+JqV6cakV+Wh5Q0/5cnLaOdkvCY0Lhg4JHypiS/wZzdL1L5zH/4Uhr4nn
 7eGTU+0pE+gzKGRybsdxxWBytyKNzBFXN+GFUQwiFsiIvLIAfpJhL8qJPNBHw4qmo31r
 O7Ssx6HetyKPKWHVtj4RvNSvsTu+5/+0XgJoKb+6/+DQZ5TPGApBbA7GhitvcC60Wp4I
 JnRJ3rhJmdnihHrbCELl33+bcCMN/vPdxKfrQfrYQWmmJMliZZsJFegvUOnIO0ZAMGCM
 upF69YC45iCTsTOsMWDa7XXj8ysdqic4GCi40um1VNdROoAs3g8L6QJxikdj/91C9ulB
 /0NA==
X-Gm-Message-State: AOAM533R330NuFmCDtltWEWcVBDFRNi3/3RTkxoqpjQ0Z5XZVyFJOlJr
 szyjw7HHiyA2I0G9b0OQdlv5dQmD/E3dR09xc8F6cYP6O14ttTnJD9cSw9Wcetx/fnZftoofQff
 q+w5y5FmBc/AhC5jc4CgqYayb3A8ycxD6Aomq7rOPahqdmIvKncuXQX+vw7QQGThdCRU=
X-Received: by 2002:a17:906:19c6:b0:6ce:98a4:5ee6 with SMTP id
 h6-20020a17090619c600b006ce98a45ee6mr21857722ejd.567.1651698003846; 
 Wed, 04 May 2022 14:00:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwH3LlR861048p8PSc6YcY19QI9GPaL3BCEDyvt6q6CBnjRyMNLGjfd0aGxmgnV/9rYgFIlYw==
X-Received: by 2002:a17:906:19c6:b0:6ce:98a4:5ee6 with SMTP id
 h6-20020a17090619c600b006ce98a45ee6mr21857698ejd.567.1651698003515; 
 Wed, 04 May 2022 14:00:03 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 gz14-20020a170907a04e00b006f3ef214e71sm6042381ejc.215.2022.05.04.14.00.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 14:00:02 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Daniele Buono <dbuono@linux.vnet.ibm.com>
Subject: [PATCH 0/5] net: support for CFI with libslirp >= 4.7
Date: Wed,  4 May 2022 22:59:56 +0200
Message-Id: <20220504210001.678419-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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

Paolo Bonzini (5):
  slirp: bump submodule to 4.7 release
  net: slirp: introduce a wrapper struct for QemuTimer
  net: slirp: switch to slirp_new
  net: slirp: add support for CFI-friendly timer API
  net: slirp: allow CFI with libslirp >= 4.7

 meson.build | 31 ++++++++++---------
 net/slirp.c | 85 ++++++++++++++++++++++++++++++++++++++++++++++-------
 slirp       |  2 +-
 3 files changed, 92 insertions(+), 26 deletions(-)

-- 
2.35.1


