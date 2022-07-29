Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A802B58521C
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jul 2022 17:09:28 +0200 (CEST)
Received: from localhost ([::1]:42146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHRcF-0002E1-On
	for lists+qemu-devel@lfdr.de; Fri, 29 Jul 2022 11:09:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oHRXo-0003cz-Qx
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 11:04:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52894)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oHRXm-0005Wr-4L
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 11:04:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659107089;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:  content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=dASDhkWeZDBIJgI4PGpOj4jRjUHYn91+7GXJoKYbVqI=;
 b=JUob8fISnzK/MWBFwsvARXAvu+y/fFJ2Cr6fEWAR4StAfKLYox7T4ET0ZbZ3xJsx2AN8zV
 mHV+fep/SlGyIN7rfFlVC3lT++C4SrxL0d9xzidIBsTm3ElGBhnBCKcWMMKn5o7jEaIxkY
 7C/b1Kou4FNFLynfE1MKjy985TUozeY=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-397-QG6Hb2I3MtCR1cilh2ta5w-1; Fri, 29 Jul 2022 11:04:45 -0400
X-MC-Unique: QG6Hb2I3MtCR1cilh2ta5w-1
Received: by mail-ed1-f71.google.com with SMTP id
 z1-20020a05640235c100b0043bca7d9b3eso3048569edc.5
 for <qemu-devel@nongnu.org>; Fri, 29 Jul 2022 08:04:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dASDhkWeZDBIJgI4PGpOj4jRjUHYn91+7GXJoKYbVqI=;
 b=mMX4X10gfjT0TsdLRNNaMzlBTqUwwg3UPY0o2QkJsEQzCf9Iu614Di9q9F3bblNVR8
 z/xpLh93Sp98luaesXYPFu8GcT/7pKiC++4J+Sw+0VWVsBz/OwNTjM6LfBITlrUZtl+b
 TLKTym/D+NSfduQ3DnEgqX/cyxQg3qfbUpjEPnhRi5QZM4mUu72Ti/XsGXD3lVgu//ix
 UxsuijEc1pqCbrlKdibwBSqw4K1wTacIK6WcPMDgEcnz3IjvreZ7G2Wo+U8Gq01uf5HS
 SdRx1TwqEtnVsm4wJ2EfmqrUreNULS9LxdF7xx+1Vy3fBphaTctyzGLbHkCpEo9zTNhv
 YaEg==
X-Gm-Message-State: AJIora+pqnlPDA2Z2xI3jSlQmUgLgfKZ60HhWwSiFuLBI+EEEYQ9RvVq
 7IBHGAZYuiQkuVnCaz/tPIy1onclZyTRRK72tAbTeN4bBEiHtEXNbuApidDufpUrh7FLZNwEx6G
 pBBPX2Wzc6voMr6ls5yH5pdupLgHcqVDJfIAIGmH9ipKo4DSxcmH8Zph6ZwNnzIBuulQ=
X-Received: by 2002:a17:907:628a:b0:72f:678d:6047 with SMTP id
 nd10-20020a170907628a00b0072f678d6047mr3173962ejc.456.1659107081716; 
 Fri, 29 Jul 2022 08:04:41 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1v8nA2ADKiJ9jWmeu/1CAwXOxfUK8FZFaa9QPF1iRIoPxN/7vZeckRIHbHCbLxFMmRRDiZYhw==
X-Received: by 2002:a17:907:628a:b0:72f:678d:6047 with SMTP id
 nd10-20020a170907628a00b0072f678d6047mr3173857ejc.456.1659107080395; 
 Fri, 29 Jul 2022 08:04:40 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 k21-20020a17090632d500b0072af102e65csm1765302ejk.152.2022.07.29.08.04.39
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jul 2022 08:04:39 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/6] Fixes for QEMU 7.1-rc1
Date: Fri, 29 Jul 2022 17:04:32 +0200
Message-Id: <20220729150438.20293-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
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

The following changes since commit 7b17a1a841fc2336eba53afade9cadb14bd3dd9a:

  Update version for v7.1.0-rc0 release (2022-07-26 18:03:16 -0700)

are available in the Git repository at:

  https://gitlab.com/bonzini/qemu.git tags/for-upstream

for you to fetch changes up to ebc55f523c2f406e30ec8fad77bd3b9aad5d4579:

  configure: pass correct cflags to container-based cross compilers (2022-07-29 00:22:19 +0200)

----------------------------------------------------------------
* Misc build system bugfixes
* Fix CGA 2-color graphics

----------------------------------------------------------------
Claudio Fontana (1):
      stubs: update replay-tools to match replay.h types

Cornelia Huck (1):
      kvm: don't use perror() without useful errno

Paolo Bonzini (3):
      ui: dbus-display requires CONFIG_GBM
      vga: fix incorrect line height in 640x200x2 mode
      configure: pass correct cflags to container-based cross compilers

Richard Henderson (1):
      configure: Fix ppc container_cross_cc substitution

 accel/kvm/kvm-all.c  | 2 +-
 configure            | 3 +--
 hw/display/vga.c     | 3 ++-
 meson.build          | 4 ++--
 stubs/replay-tools.c | 9 +++++----
 target/arm/kvm.c     | 2 +-
 ui/meson.build       | 2 +-
 7 files changed, 13 insertions(+), 12 deletions(-)
-- 
2.36.1


