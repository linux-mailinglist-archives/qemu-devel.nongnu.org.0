Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9615831F68B
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 10:28:00 +0100 (CET)
Received: from localhost ([::1]:42288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD24t-00029T-Jb
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 04:27:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1lD23V-0001cE-Rb
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 04:26:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55406)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1lD23T-0007el-9X
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 04:26:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613726790;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=s1IS/ZfyP37wEnHDBk2LIws5xHu0wnJwnf20ESCFET0=;
 b=DAFeVjHaTk82LNHXS+023DJVtL0PtR4h8KCx0lrz13QbjECwFvDnSaJ9zt+mFA0pqGl7Rf
 mx9qFmyx9IYH+8r3qhUw4dcK0+I2T++eT9rgnqKgQvyKvy3qwrpxB6VM5yoBzDEnrCPCXr
 liVfubD/BDeGq43QT70QgrZnJ0V9sXk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-3-wiKAdn-TN2yZ1fjxaX7X9w-1; Fri, 19 Feb 2021 04:26:26 -0500
X-MC-Unique: wiKAdn-TN2yZ1fjxaX7X9w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 647911083E8F;
 Fri, 19 Feb 2021 09:26:25 +0000 (UTC)
Received: from kaapi (vpn2-54-200.bne.redhat.com [10.64.54.200])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B80DD6267C;
 Fri, 19 Feb 2021 09:26:20 +0000 (UTC)
Date: Fri, 19 Feb 2021 14:56:11 +0530 (IST)
From: P J P <ppandit@redhat.com>
To: Stefan Weil <sw@weilnetz.de>
Subject: Re: [PATCH] net: eepro100: validate various address values
In-Reply-To: <43340d92-55da-61f2-5ad1-c8e3d6679f6d@weilnetz.de>
Message-ID: <n62s8q1-4ns8-pq39-7r2o-p483n3555o1p@erqung.pbz>
References: <20210218140629.373646-1-ppandit@redhat.com>
 <CAFEAcA_8sUX5nbg5+DR8Z6F3t1Y3o=tgZY56dFTKLgA7XVWOcw@mail.gmail.com>
 <20210219015403.tl5upltt3d2bnmw5@mozz.bu.edu>
 <6qo84891-7or2-7p58-rr4-n2n46o5730rq@erqung.pbz>
 <00338810-b72e-6a9c-eef0-3c0adc764695@weilnetz.de>
 <43340d92-55da-61f2-5ad1-c8e3d6679f6d@weilnetz.de>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ppandit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed;
 boundary="-1463810559-1665963969-1613726784=:396166"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ppandit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Alexander Bulekov <alxndr@bu.edu>, Ruhr-University Bochum <bugs-syssec@rub.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.
---1463810559-1665963969-1613726784=:396166
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT

  Hello Stefan,

+-- On Fri, 19 Feb 2021, Stefan Weil wrote --+
| If there are no recursions in normal use, the following patch should work:
| 
| diff --git a/hw/net/eepro100.c b/hw/net/eepro100.c
| index 16e95ef9cc..2474cf3dc2 100644
| --- a/hw/net/eepro100.c
| +++ b/hw/net/eepro100.c
| @@ -279,6 +279,9 @@ typedef struct {
|      /* Quasi static device properties (no need to save them). */
|      uint16_t stats_size;
|      bool has_extended_tcb_support;
| +
| +    /* Flag to avoid recursions. */
| +    bool busy;
|  } EEPRO100State;
| 
|  /* Word indices in EEPROM. */
| @@ -837,6 +840,14 @@ static void action_command(EEPRO100State *s)
|         Therefore we limit the number of iterations. */
|      unsigned max_loop_count = 16;
| 
| +    if (s->busy) {
| +        /* Prevent recursions. */
| +        logout("recursion in %s:%u\n", __FILE__, __LINE__);
| +        return;
| +    }
| +
| +    s->busy = true;
| +
|      for (;;) {
|          bool bit_el;
|          bool bit_s;
| @@ -933,6 +944,7 @@ static void action_command(EEPRO100State *s)
|      }
|      TRACE(OTHER, logout("CU list empty\n"));
|      /* List is empty. Now CU is idle or suspended. */
| +    s->busy = false;
|  }
| 
|  static void eepro100_cu_command(EEPRO100State * s, uint8_t val)

Please see:
  -> https://ruhr-uni-bochum.sciebo.de/s/NNWP2GfwzYKeKwE?path=%2Feepro100_stackoverflow1

* It does not seem to address above case.

Thank you.
--
Prasad J Pandit / Red Hat Product Security Team
8685 545E B54C 486B C6EB 271E E285 8B5A F050 DE8D
---1463810559-1665963969-1613726784=:396166--


