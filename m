Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DEAB3674C7
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Apr 2021 23:25:53 +0200 (CEST)
Received: from localhost ([::1]:51350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZKM4-0007V9-BF
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 17:25:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lZKK9-0006LN-1s
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 17:23:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48273)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lZKK4-0008Fb-HX
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 17:23:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619040227;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=P9KYefggnSpcKM1Ot/c89q2Cm5UyKHkTAHzrKLsdOPA=;
 b=T+Uk6zDuhistlk2fz/R/P34wTqg+NtW+i35UjMpx10nqM9a3wUsZFFmLUfVJTO5+IsfcT5
 r4+NOv7ilJBaFZS1nrglfJmW3bD04fwVK4UYRmzR1LY+Th3zRwTSoWa4UUhWmkRkFDk6Jh
 xbc7GdvSbEEl5UJXSKKORwP52+S1FHc=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-489-Rkf7-HExPg2OT5_QA4c_Zw-1; Wed, 21 Apr 2021 17:23:46 -0400
X-MC-Unique: Rkf7-HExPg2OT5_QA4c_Zw-1
Received: by mail-ot1-f72.google.com with SMTP id
 h11-20020a9d61cb0000b029028e9bba56d9so12595131otk.20
 for <qemu-devel@nongnu.org>; Wed, 21 Apr 2021 14:23:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=P9KYefggnSpcKM1Ot/c89q2Cm5UyKHkTAHzrKLsdOPA=;
 b=K0LWIJxqvCcHFAgMN67oYeXuCEQHdbEryJcTp3yHdvk5hNU80fgBQKIr2UFLjfAIH8
 srj5i0xiGXFm1P/U6GG+9ot2owfckikqgSxEm9wjhkqOjOI7kEQZP5t1BHtSuO54N3Aa
 D9CgFQWvgGXk3xkx2FXSll9DoZzSFWZ4g77VJV7+bOVFlr++8iq8VpbNkU8R1KWdRMMc
 el1Zr1pimABzGYudMRiG04ZD+8YO03TOpLn++dTMq9bX6E+t78/7JfFD+45NFCEfRPrO
 Texgj2BXfPa0p74Rhfo2idZzCrCKA/wiKB1d0pgVyVgSOw2cAxbYL6WGdpOeyKeGmsJL
 R5aQ==
X-Gm-Message-State: AOAM530BSICB2QXOIgjWgF4kPmlq/pYooLEeIBVX9G8pXoLoISr28yS5
 Esxzo2s5aDBNcV/iJFJEULc8nqAyF4g8JYnh8lPr5SJAGd8pA57jZbcltS0B23oqXG+4jOhMNUY
 p/b3oEVqNbCBDQ4k=
X-Received: by 2002:a54:4188:: with SMTP id 8mr27139oiy.96.1619040225359;
 Wed, 21 Apr 2021 14:23:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyyJ9EcGzT17HPFE7yVcaaEUSe10UsmTNpwUAQt3HrTvrJvrcib2ZjTT6JOdNwy7VS081nc/g==
X-Received: by 2002:a54:4188:: with SMTP id 8mr27129oiy.96.1619040225208;
 Wed, 21 Apr 2021 14:23:45 -0700 (PDT)
Received: from redhat.redhat.com (ip68-103-222-6.ks.ok.cox.net. [68.103.222.6])
 by smtp.gmail.com with ESMTPSA id n13sm141031otk.61.2021.04.21.14.23.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Apr 2021 14:23:44 -0700 (PDT)
From: Connor Kuehl <ckuehl@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v4 0/2] Fix segfault in qemu_rbd_parse_filename
Date: Wed, 21 Apr 2021 16:23:41 -0500
Message-Id: <20210421212343.85524-1-ckuehl@redhat.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ckuehl@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ckuehl@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, sgarzare@redhat.com, qemu-devel@nongnu.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Connor Kuehl (2):
  iotests/231: Update expected deprecation message
  block/rbd: Add an escape-aware strchr helper

 block/rbd.c                | 32 +++++++++++++++++++++-----------
 tests/qemu-iotests/231     |  4 ++++
 tests/qemu-iotests/231.out |  7 ++++---
 3 files changed, 29 insertions(+), 14 deletions(-)

-- 
2.30.2


