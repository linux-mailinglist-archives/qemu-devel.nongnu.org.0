Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F74309BDE
	for <lists+qemu-devel@lfdr.de>; Sun, 31 Jan 2021 13:10:18 +0100 (CET)
Received: from localhost ([::1]:35652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6BYX-0000O3-MK
	for lists+qemu-devel@lfdr.de; Sun, 31 Jan 2021 07:10:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1l6BMN-00004z-Lq
 for qemu-devel@nongnu.org; Sun, 31 Jan 2021 06:57:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:52197)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1l6BMK-0008AE-Ff
 for qemu-devel@nongnu.org; Sun, 31 Jan 2021 06:57:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612094258;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/eB22EK6Sxe6tquaW0oxDejbZSU1tflyFzbU5sPweqk=;
 b=ae9yjPMZtRufmN6sgXs7t0NcDYtg+/rdLV5fHnjj6tpjAfpL2kDsnIOYnOi4D/gZOaEZBq
 LffhVvGaxpoOE5MzFuexyq+0G5Xiy195Eyex8RWhvWsf4ZtPhwIuljR8MqxjBv0knEdPSH
 vDJkEa197+jTuj5GC6YwfMCd5IjnYFU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-460-B6ZazDrIP5C0GuiN5ReEGw-1; Sun, 31 Jan 2021 06:57:34 -0500
X-MC-Unique: B6ZazDrIP5C0GuiN5ReEGw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E086F801B16;
 Sun, 31 Jan 2021 11:57:32 +0000 (UTC)
Received: from kaapi (ovpn-112-95.phx2.redhat.com [10.3.112.95])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 05D0B5C3E0;
 Sun, 31 Jan 2021 11:57:26 +0000 (UTC)
Date: Sun, 31 Jan 2021 17:27:20 +0530 (IST)
From: P J P <ppandit@redhat.com>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH] hw/intc/arm_gic: Fix interrupt ID in GICD_SGIR
 register
In-Reply-To: <3a94e327-0454-bf43-552a-1c84407e1d7d@amsat.org>
Message-ID: <20p82p5p-ns25-n434-37os-n55013s6313@erqung.pbz>
References: <20210131103401.217160-1-f4bug@amsat.org>
 <3a94e327-0454-bf43-552a-1c84407e1d7d@amsat.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ppandit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed;
 boundary="-1463811718-1923904730-1612094251=:1010257"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ppandit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Darren Kenny <darren.kenny@oracle.com>,
 Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>, Li Qiang <liq3ea@gmail.com>,
 qemu-stable@nongnu.org, qemu-devel@nongnu.org,
 Alexander Bulekov <alxndr@bu.edu>, qemu-arm@nongnu.org,
 Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.
---1463811718-1923904730-1612094251=:1010257
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT

+-- On Sun, 31 Jan 2021, Philippe Mathieu-Daudé wrote --+
| On 1/31/21 11:34 AM, Philippe Mathieu-Daudé wrote:
| > Per the ARM Generic Interrupt Controller Architecture specification
| > (document "ARM IHI 0048B.b (ID072613)"), the SGIINTID field is 4 bit,
| > not 10:
| > 
| >     - Table 4-21 GICD_SGIR bit assignments
| > 
| >     The Interrupt ID of the SGI to forward to the specified CPU
| >     interfaces. The value of this field is the Interrupt ID, in
| >     the range 0-15, for example a value of 0b0011 specifies
| >     Interrupt ID 3.
| > 
| > diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
| > index af41e2fb448..75316329516 100644
| > --- a/hw/intc/arm_gic.c
| > +++ b/hw/intc/arm_gic.c
| > @@ -1476,7 +1476,7 @@ static void gic_dist_writel(void *opaque, hwaddr offset,
| >          int target_cpu;
| >  
| >          cpu = gic_get_current_cpu(s);
| > -        irq = value & 0x3ff;
| > +        irq = value & 0xf;
| >          switch ((value >> 24) & 3) {
| >          case 0:
| >              mask = (value >> 16) & ALL_CPU_MASK;
| > 

* Looks okay.


| > Correct the irq mask to fix an undefined behavior (which eventually
| > lead to a heap-buffer-overflow, see [Buglink]):
| > 
| >    $ echo 'writel 0x8000f00 0xff4affb0' | qemu-system-aarch64 -M virt,accel=qtest -qtest stdio
| >    [I 1612088147.116987] OPENED
| >   [R +0.278293] writel 0x8000f00 0xff4affb0
| >   ../hw/intc/arm_gic.c:1498:13: runtime error: index 944 out of bounds for type 'uint8_t [16][8]'
| >   SUMMARY: UndefinedBehaviorSanitizer: undefined-behavior ../hw/intc/arm_gic.c:1498:13
| > 
| > Cc: qemu-stable@nongnu.org
| > Fixes: 9ee6e8bb853 ("ARMv7 support.")
| > Buglink: https://bugs.launchpad.net/qemu/+bug/1913916
| > Buglink: https://bugs.launchpad.net/qemu/+bug/1913917
| 
| > ---
| > Isnt it worth a CVE to help distributions track backports?
| > ---

* Please send such report(s) to 'qemu-security' list to be triaged as 
  potential security ones.


Thank you.
--
Prasad J Pandit / Red Hat Product Security Team
8685 545E B54C 486B C6EB 271E E285 8B5A F050 DE8D
---1463811718-1923904730-1612094251=:1010257--


