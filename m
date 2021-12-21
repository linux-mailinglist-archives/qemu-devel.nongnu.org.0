Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A5447BE91
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 12:07:46 +0100 (CET)
Received: from localhost ([::1]:56612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzczh-00086d-Ez
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 06:07:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mzcxa-0005Jf-Gb
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 06:05:34 -0500
Received: from [2a00:1450:4864:20::42e] (port=34419
 helo=mail-wr1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mzcxX-0004y2-HJ
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 06:05:34 -0500
Received: by mail-wr1-x42e.google.com with SMTP id s1so26194223wrg.1
 for <qemu-devel@nongnu.org>; Tue, 21 Dec 2021 03:05:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zzgEJxrx8iOWoGtZpnIYLvBkHtfKQBL5S14sqsi1b/4=;
 b=b///rFcjaOJrT0azCztSuUf2ARRUpxjK8Eb1SOy2Jp9eTtp12dMlbLfQqZQnimgslE
 esYL69k2N02ZmXY/0Ezct17I62q8gWyU9nL925JlfHd94hLVuQqHDV+KNRr5fi8NdW54
 b5IPsGuFgQur2859eSPZk/P9ABTe8zVXmrXEan/ZXJEj/oJVutV2eMW3FM+4VtaA2VK8
 8RdLlUvp2ZOmrb6WDx3q8o+ijhwvzQgBQOZMoPzridFdMn7hMT+b1MdRmDkWArDu6Oud
 MGGZUMKPdwtKb/rE7KeIEvi5zFhnlhWIn9NrloSeRPT7L22ZFguV/JLLQ5cWtzv0Se32
 RvuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=zzgEJxrx8iOWoGtZpnIYLvBkHtfKQBL5S14sqsi1b/4=;
 b=adJBZr1AKLrOsjtWbSJKXmdu/Wpe03deq+hp/uzNvLk2XxacKLeBLwp25OK+Q1FYZ3
 ZT91arCpd+/rURdeWUZUa1sa1IrNl33uprSDZCD3IzIgAzJKxvj+0hMZWH45gJighWSm
 pghnGUtew6YtHz3joEfWXbWAsSsINSSraPDCbFLfImi4ruFGJWF+k1jmQf+RlhSs9NLs
 XROy3DRcJaucjyefUK/6iboW4dl2IuPOcKZ5Px9arS4G2iHprFt66wsi9QBKGc3EMP75
 QMwpLxlHYnADQl2WeOihxr3hKtOKBlHRkh72v9m5Nhmq0dEurcdH1+BD8CkBOFS5zDKe
 BI7g==
X-Gm-Message-State: AOAM531ekhRRsJK9fiAqKrJRI3QP1BDc9Iwgfqin9tupZG9udUylrglK
 0xdwBY5kXAe9N4gUzCH+M61DfF8jUXA=
X-Google-Smtp-Source: ABdhPJx3EimMhd9bpA4wSj5utLrmXhbdVj+uK4fPB8vK2uAd4/4LmFtJTiojQ58OpJ7ZzkpIYT3GUA==
X-Received: by 2002:adf:82d2:: with SMTP id 76mr2166888wrc.329.1640084730165; 
 Tue, 21 Dec 2021 03:05:30 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id az11sm1949444wmb.30.2021.12.21.03.05.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Dec 2021 03:05:29 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/8] Next round of configure/meson cleanups
Date: Tue, 21 Dec 2021 12:05:18 +0100
Message-Id: <20211221110526.351709-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Includes v2 of patches from the previous round, and new patches 3-8.

Paolo

Paolo Bonzini (8):
  configure: simplify creation of plugin symbol list
  configure: do not set bsd_user/linux_user early
  configure, makefile: remove traces of really old files
  configure: parse --enable/--disable-strip automatically, flip default
  configure: move non-command-line variables away from command-line
    parsing section
  meson: build contrib/ executables after generated headers
  configure, meson: move config-poison.h to meson
  meson: add comments in the target-specific flags section

 Makefile                           |  11 +--
 configure                          | 151 +++++------------------------
 contrib/elf2dmp/meson.build        |   2 +-
 contrib/ivshmem-client/meson.build |   2 +-
 contrib/ivshmem-server/meson.build |   2 +-
 contrib/rdmacm-mux/meson.build     |   2 +-
 meson.build                        |  17 ++++
 pc-bios/s390-ccw/Makefile          |   2 -
 plugins/meson.build                |  11 ++-
 scripts/make-config-poison.sh      |  16 +++
 scripts/meson-buildoptions.py      |  21 ++--
 scripts/meson-buildoptions.sh      |   3 +
 12 files changed, 90 insertions(+), 150 deletions(-)
 create mode 100755 scripts/make-config-poison.sh

-- 
2.33.1


