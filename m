Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F10D2980
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Oct 2019 14:30:54 +0200 (CEST)
Received: from localhost ([::1]:37294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iIXan-0001h8-BI
	for lists+qemu-devel@lfdr.de; Thu, 10 Oct 2019 08:30:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55386)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mikhail.sennikovskii@cloud.ionos.com>)
 id 1iIXIg-0005g2-UP
 for qemu-devel@nongnu.org; Thu, 10 Oct 2019 08:12:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mikhail.sennikovskii@cloud.ionos.com>)
 id 1iIXIf-00024I-LY
 for qemu-devel@nongnu.org; Thu, 10 Oct 2019 08:12:10 -0400
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544]:40965)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <mikhail.sennikovskii@cloud.ionos.com>)
 id 1iIXIf-00023c-7t
 for qemu-devel@nongnu.org; Thu, 10 Oct 2019 08:12:09 -0400
Received: by mail-ed1-x544.google.com with SMTP id f20so5226334edv.8
 for <qemu-devel@nongnu.org>; Thu, 10 Oct 2019 05:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cloud.ionos.com; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=IVm4Q3iaNsBP4sWFGtxcWCWhC1arj/DaRHtS1VBZgIg=;
 b=ItUXECQpj7BqUH/75DzW3be1rMSla2HjLzXhSMAvWth12T/91JRFjxwBBJjOVCYe5U
 YBNW/83GreZqdh50eJxKy/BzHa5A3QLJpg5/CLOQCfpoLflslWLb1iP3rs1A6x/oQW0y
 qo64y7LO1Kq9ZHnLlMG9Ykgg7kTjKt01MQeTv+zoJahdxuY34tDexqonFfgvMcuJkka2
 Q+McXAf0P/hoq4/+I7CrPFhNS+LIQraDRFmXM4Td3anGB0ZaMDcxkWK43WuMYmL1j5T8
 DeiH639v5SRRBiyXPI7/jrQLekxFEqeY+gqsQP9bwBUJiWpeepqzeltVDeaGYj1A3WrU
 cYTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=IVm4Q3iaNsBP4sWFGtxcWCWhC1arj/DaRHtS1VBZgIg=;
 b=KYXT8gwUs88pHRa9fxqwgY3Quu5aBSrvjwRBqwreCnhF8xCgwG3xOCzpboQojIuSeD
 xOZZnxEAAgFUzws8l4j6nc99XpaSy3K7xnl3cOVG+YdNfUvh5Tim7GiAo+rNFh0UN72G
 KYsWLhRtLc2tSWdoU1l4EMiSvrLgzLhxWT3won0thX+1YsAnRQTfVeyp4BeRbB4lJquF
 qRWpu7Xo1xeMn0dSO6pZafdlwgrFDEgWH0vChVXL4SzwamzJjAysQLdFDnBufc0RvNlP
 TPgaB5pCJeKUNX1/t1stnZKvhLDn2hSHcA6crf2T3QYP54STLh+6Y3aNbnTWoXqRwik0
 8jyg==
X-Gm-Message-State: APjAAAWHLAh+q2Su8+9vuLp74jvNe183TQYFC7IceAooS8Q3habwyS1m
 DbTKz2L1bgvZJKBwUeucXCBGjeUGBSQ=
X-Google-Smtp-Source: APXvYqzOeXwdHF2qHeusSTeo+QnQINSWI9C+VrDtLZ1acQfQUkS+NrCQldvtDbukXORp6ViDKqoPvw==
X-Received: by 2002:a17:906:2cd2:: with SMTP id
 r18mr7749361ejr.282.1570709526115; 
 Thu, 10 Oct 2019 05:12:06 -0700 (PDT)
Received: from msennikovskii2.pb.local
 ([2001:1438:4010:2558:31c1:ae55:82cf:3681])
 by smtp.googlemail.com with ESMTPSA id c22sm949157edc.9.2019.10.10.05.12.05
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 10 Oct 2019 05:12:05 -0700 (PDT)
From: Mikhail Sennikovsky <mikhail.sennikovskii@cloud.ionos.com>
To: qemu-devel@nongnu.org, jasowang@redhat.com, stefanha@redhat.com,
 mst@redhat.com, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: [PATCH v3] virtio-net: prevent offloads reset on migration
Date: Thu, 10 Oct 2019 14:11:14 +0200
Message-Id: <1570709475-32073-1-git-send-email-mikhail.sennikovskii@cloud.ionos.com>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::544
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
Cc: Mikhail Sennikovsky <mikhail.sennikovskii@cloud.ionos.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi all,

This is the third version of the patch, implementing the approach
based on checking the VM runstate proposed by Jason Wang.

Regards,
Mikhail

Mikhail Sennikovsky (1):
  virtio-net: prevent offloads reset on migration

 hw/net/virtio-net.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

-- 
2.7.4


