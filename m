Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD33827AEB5
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Sep 2020 15:09:37 +0200 (CEST)
Received: from localhost ([::1]:44364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kMsuO-0002NI-Of
	for lists+qemu-devel@lfdr.de; Mon, 28 Sep 2020 09:09:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kMskH-0003RP-JR
 for qemu-devel@nongnu.org; Mon, 28 Sep 2020 08:59:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kMskF-0008Pn-Ra
 for qemu-devel@nongnu.org; Mon, 28 Sep 2020 08:59:09 -0400
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601297947;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=nDFU0aycq03ATtU0lHbfVt7dYo7QmD5+RumgZUX0XnQ=;
 b=h8FR2pqqaDlc6iWjo2RnuvD/5S30dtgjF2Liup179Qaoqm5TdmyPy739G4e32hApq6gCII
 HOu46kxqkGiM5IQs0jcVOZrS9Q1eKFcPnfaNNn0bgnAu/IxlKKJNcaxOuX2ya2VynDdJGe
 YNb/4laXBgbIzkOSfelbWptxF5A9Mmk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-75-1xirIKMXM26DQF3DAJlWrg-1; Mon, 28 Sep 2020 08:59:03 -0400
X-MC-Unique: 1xirIKMXM26DQF3DAJlWrg-1
Received: by mail-wr1-f70.google.com with SMTP id f18so373160wrv.19
 for <qemu-devel@nongnu.org>; Mon, 28 Sep 2020 05:59:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nDFU0aycq03ATtU0lHbfVt7dYo7QmD5+RumgZUX0XnQ=;
 b=gthxCxIudAvuqp+FMLdgdcfrqVWw7cK3euIdDkop/sHK9xRNI+hPdgCXLj/Bz4b2Jx
 38YxtncUwVufMboyNASWYaL0tlMXIQYzA/swoicdTM7acNWCNXdKMF8sCwxU8TAjYVDe
 9rQ9i2JiYXMCuMe3lvgQLk0RUgo02fo7YJpqErniaZ+NivuHGi8dpFgn76miOH5VXj7K
 cxENK+MtiFOQbMXaSUZyVnTDrP16WIDJjYOD7mOVpmg+/1gxqQ3S5XpvLzPixU+CK/bK
 079py0tVbAwNc9rJFdmWNxE4pe/7XpTq0z1zmGTBxFDvjpXFBLjWFBI2r+LWlsYCKMPt
 WJ8A==
X-Gm-Message-State: AOAM532nc70DWdlTX3FIJ15eOjipOHM/6939hpisU2Xptp889McMfm9D
 JGi9jftendIT5rfs4SAKFC+/RYvtypo3WV0quifq8PBuy2vEOics4fTfnIw3LXtG5zznuSV33J4
 RtCtbUC9IyHaehgU=
X-Received: by 2002:a05:6000:7:: with SMTP id h7mr1727708wrx.16.1601297942310; 
 Mon, 28 Sep 2020 05:59:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzw8u/JOmAGTAecl3OL9HasV3eTk/FnbG4rg58AHveA3yFAmnTlzPA6AhNKLaoxQxpUvTiGTw==
X-Received: by 2002:a05:6000:7:: with SMTP id h7mr1727688wrx.16.1601297942134; 
 Mon, 28 Sep 2020 05:59:02 -0700 (PDT)
Received: from localhost.localdomain (74.red-83-53-161.dynamicip.rima-tde.net.
 [83.53.161.74])
 by smtp.gmail.com with ESMTPSA id w2sm1405390wrs.15.2020.09.28.05.59.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Sep 2020 05:59:01 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] qemu/compiler: Remove unused special case code for GCC <
 4.8
Date: Mon, 28 Sep 2020 14:58:56 +0200
Message-Id: <20200928125859.734287-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/28 03:29:35
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.687,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since commit efc6c070aca we require GCC 4.8 minimum.
Drop the special cases for older versions.

Philippe Mathieu-Daudé (3):
  qemu/compiler: Simplify as all compilers support attribute
    'gnu_printf'
  qemu/atomic: Drop special case for unsupported compiler
  accel/tcg: Remove special case for GCC < 4.6

 include/qemu/atomic.h   | 17 -----------------
 include/qemu/compiler.h | 19 ++++++++-----------
 accel/tcg/cpu-exec.c    |  2 +-
 3 files changed, 9 insertions(+), 29 deletions(-)

-- 
2.26.2


