Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CED0C1868F6
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Mar 2020 11:27:15 +0100 (CET)
Received: from localhost ([::1]:36660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jDmxl-0002UI-Ds
	for lists+qemu-devel@lfdr.de; Mon, 16 Mar 2020 06:27:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38019)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yuri.benditovich@daynix.com>) id 1jDmgp-00060l-RP
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 06:09:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <yuri.benditovich@daynix.com>) id 1jDmgo-0003RE-M5
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 06:09:43 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:46681)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <yuri.benditovich@daynix.com>)
 id 1jDmgn-00031P-UB
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 06:09:42 -0400
Received: by mail-wr1-x444.google.com with SMTP id w16so3960190wrv.13
 for <qemu-devel@nongnu.org>; Mon, 16 Mar 2020 03:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id;
 bh=8dqIf7x4xvvX+26xdYNWGyCJJwyBAGUEznQ6buBcw6A=;
 b=P5YlIRNaXZXXUWABWiLqMPjHrDDFw3B/JNgcZuStci3s/VcFfCEr4WwJn7v2DfHU28
 +uFkahDviksvyAe2jmdQA8ClT7OAHHHXgREJRc49YdRyhsdzOwMGp89xfhaw4Co6puyj
 MLHyRPHVVsQd3fwz2IRgwnVdtjCw8MPSlCYdehYY0/FkSikYW2mXrLBpXJYqCd/Ux9fc
 TiB9ocnYJPIUYzIb/qm8RmtPTDI7+EsWcZoUCMjIFg6FmesOx3DQL9zPExmdc8OQ1oCS
 kQTnSZPSRwmv7l1qMmlt/pi1PiODR/ihasklTTOJvkyNPmu4ovtANFU3zG8ToOL0RQJG
 lmzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=8dqIf7x4xvvX+26xdYNWGyCJJwyBAGUEznQ6buBcw6A=;
 b=uIifRT/RjEke3sVo6mQh3cjPOwFC8tsVtT5BZm8OtI7DHdJ/Ak+mPY2TwS7ruEHFpl
 31R+Cu/G3k4yusagaRHoHBzskGylLgHMhisWUFLzSWqboo+B5I4GbpKBH+CCtJsz6mIO
 vq9SEaoSBvlSsXskMa5+6etST9arnkT3o4xrz6YLediqyCP9+fR+/hCWIYHUIpvYcRxy
 jeeOq2MQ5Yz8BRuubsu6cj6auPWWmhbTjgd6v9vCEHlzuP+HTOr0hT6DWPIBBIn63j31
 gPr+M8mdbv87c+qCAoUJyLEsKP4kJyzBE2ZbEkFetgzupWt8baxaf5U3IY8o/kV3pFuP
 PceQ==
X-Gm-Message-State: ANhLgQ3enQhW5ULa94ujKVppwdpJkPsdazVx0vyCRDniVmdsPhniaZdS
 cs0oatq3dV8Tz59V29GjfBx1/+Vbx8cizw==
X-Google-Smtp-Source: ADFU+vvwTnoV7VAAmoEoXdKVRk1j7rQMG+fFSNXsnj8pe6Vw3jW3nhzIRIjbtx+Ijx0I88gJFN2QLQ==
X-Received: by 2002:a5d:68c1:: with SMTP id p1mr22167486wrw.198.1584353380201; 
 Mon, 16 Mar 2020 03:09:40 -0700 (PDT)
Received: from f2.redhat.com (bzq-79-183-43-120.red.bezeqint.net.
 [79.183.43.120])
 by smtp.gmail.com with ESMTPSA id l7sm22083171wrw.33.2020.03.16.03.09.38
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 16 Mar 2020 03:09:39 -0700 (PDT)
From: Yuri Benditovich <yuri.benditovich@daynix.com>
To: qemu-devel@nongnu.org,
	mst@redhat.com,
	jasowang@redhat.com
Subject: [PATCH v4 0/6] reference implementation of RSS and hash report
Date: Mon, 16 Mar 2020 12:09:27 +0200
Message-Id: <20200316100933.11499-1-yuri.benditovich@daynix.com>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::444
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
Cc: yan@daynix.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Support for VIRTIO_NET_F_RSS and VIRTIO_NET_F_HASH_REPORT
features in QEMU for reference purpose.
Implements Toeplitz hash calculation for incoming
packets according to configuration provided by driver.
Uses calculated hash for decision on receive virtqueue
and/or reports the hash in the virtio header

Changes from v3
Use pointer for indirections table instead of array
Cosmetic changes per v3 review

Changes from v2:
Implemented migration support
Added implementation of hash report
Changed reporting of error during processing of command
(per review of v2)
Cosmetic changes per v2 review

Yuri Benditovich (6):
  virtio-net: introduce RSS and hash report features
  virtio-net: implement RSS configuration command
  virtio-net: implement RX RSS processing
  tap: allow extended virtio header with hash info
  virtio-net: reference implementation of hash report
  virtio-net: add migration support for RSS and hash report

 hw/net/trace-events            |   3 +
 hw/net/virtio-net.c            | 437 +++++++++++++++++++++++++++++++--
 include/hw/virtio/virtio-net.h |  16 ++
 net/tap.c                      |  11 +-
 4 files changed, 439 insertions(+), 28 deletions(-)

-- 
2.17.1


