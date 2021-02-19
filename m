Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29BD131F503
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 07:13:32 +0100 (CET)
Received: from localhost ([::1]:56148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCz2h-0003HH-8v
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 01:13:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1lCz0s-0002Qc-Ey
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 01:11:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42891)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1lCz0n-00072H-2z
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 01:11:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613715091;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LVovE5F8C/ZzWe7wQKo4RCtu+PNaWHZm/EEVqmtEV3E=;
 b=RW7/NmKht0e1mCIm7jLJxdKgib2C7nrXmpKi+JT8U15Dv2FXmmBr0JCj0YiUbee57zwwNi
 IODwr+Lw6UIZ3o+gF2jigxvoQKVwi3vKu/0esb5vLcY+YoEeBdsAVHyKUhnvcNLqFtiJVR
 Pn+0bAv9bl76zw1+5zPQBgljf0sCslo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-129-R8U3iFt0PJaJ9FQdc-0cSg-1; Fri, 19 Feb 2021 01:11:28 -0500
X-MC-Unique: R8U3iFt0PJaJ9FQdc-0cSg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4783D100A61E;
 Fri, 19 Feb 2021 06:11:27 +0000 (UTC)
Received: from kaapi (vpn2-54-200.bne.redhat.com [10.64.54.200])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E0755171FE;
 Fri, 19 Feb 2021 06:11:21 +0000 (UTC)
Date: Fri, 19 Feb 2021 11:41:11 +0530 (IST)
From: P J P <ppandit@redhat.com>
To: Alexander Bulekov <alxndr@bu.edu>
Subject: Re: [PATCH] net: eepro100: validate various address values
In-Reply-To: <20210219015403.tl5upltt3d2bnmw5@mozz.bu.edu>
Message-ID: <6qo84891-7or2-7p58-rr4-n2n46o5730rq@erqung.pbz>
References: <20210218140629.373646-1-ppandit@redhat.com>
 <CAFEAcA_8sUX5nbg5+DR8Z6F3t1Y3o=tgZY56dFTKLgA7XVWOcw@mail.gmail.com>
 <20210219015403.tl5upltt3d2bnmw5@mozz.bu.edu>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ppandit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Stefan Weil <sw@weilnetz.de>,
 Jason Wang <jasowang@redhat.com>, Li Qiang <liq3ea@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Ruhr-University Bochum <bugs-syssec@rub.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hello Alex, Stefan, all

+-- On Thu, 18 Feb 2021, Alexander Bulekov wrote --+
| Maybe the infinite loop mentioned in the commit message is actually a DMA 
| recursion issue? I'm providing a reproducer for a DMA re-entracy issue 
| below. With this patch applied, the reproducer triggers the assert(), rather 
| than overflowing the stack, so maybe it is the same issue? -Alex
| 
| cat << EOF | ./qemu-system-i386 -display none -machine accel=qtest, -m \
| 512M -device i82559er,netdev=net0 -netdev user,id=net0 -nodefaults \
| -qtest stdio
| outl 0xcf8 0x80001014
| outl 0xcfc 0xc000
| outl 0xcf8 0x80001010
| outl 0xcfc 0xe0020000
| outl 0xcf8 0x80001004
| outw 0xcfc 0x7
| write 0x1ffffc0b 0x1 0x55
| write 0x1ffffc0c 0x1 0xfc
| write 0x1ffffc0d 0x1 0x46
| write 0x1ffffc0e 0x1 0x07
| write 0x746fc59 0x1 0x02
| write 0x746fc5b 0x1 0x02
| write 0x746fc5c 0x1 0xe0
| write 0x4 0x1 0x07
| write 0x5 0x1 0xfc
| write 0x6 0x1 0xff
| write 0x7 0x1 0x1f
| outw 0xc002 0x20
| EOF
| 

* Yes, it is an infinite recursion induced stack overflow. I should've said 
  recursion instead of loop.

  Thank you for sharing a reproducer and the stack trace.


+-- On Thu, 18 Feb 2021, Stefan Weil wrote --+
| Am 18.02.21 um 15:41 schrieb Peter Maydell:
||  +        assert (s->cb_address >= s->cu_base);
| > We get these values from the guest; you can't just assert() on them. You 
| > need to do something else.
| > http://www.intel.com/content/dam/doc/manual/8255x-10-100-mbps-ethernet-controller-software-dev-manual.pdf
|
| I agree with Peter. The hardware emulation in QEMU should try to do the same 
| as the real hardware.

* Agreed.

* While the manual does not say how to handle uint32_t overflow in above 
  'cb_address' calculation, I doubt if overflow is expected.

  +    if (s->cb_address < s->cu_base) {
  +        logout ("invalid cb_address: %s: %u\n", __func__, s->cb_address);
  +        break;
  +    }

  I tried above fix first, it does not seem to arrest the recurssion induced 
  stack overflow. Hence assert(3).

* I also tried to find out if there's any cap on the 'cu_offset' value OR 
  number of command units (cu) that can be addressed.

  But in linear addressing mode offset is a 32bit value with base address set 
  to zero(0).

  And in 32bit segmented addressing mode 'offset' is 16bit value with 
  non-zero(0) base address. ie. maximum offset could be about ~4K for 16byte 
  command block IIUC. I'm not sure if segmented addressing mode is supported.

* I'd appreciate if you could suggest a right way to fix it OR propose/post 
  another patch. I'm okay either way.

Thank you.
--
Prasad J Pandit / Red Hat Product Security Team
8685 545E B54C 486B C6EB 271E E285 8B5A F050 DE8D


