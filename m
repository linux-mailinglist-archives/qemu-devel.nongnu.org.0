Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 997331D115E
	for <lists+qemu-devel@lfdr.de>; Wed, 13 May 2020 13:31:01 +0200 (CEST)
Received: from localhost ([::1]:49398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jYpbI-0000V3-AR
	for lists+qemu-devel@lfdr.de; Wed, 13 May 2020 07:31:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1jYpKy-0006Hh-4q
 for qemu-devel@nongnu.org; Wed, 13 May 2020 07:14:08 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:60930
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1jYpKx-0005EW-5x
 for qemu-devel@nongnu.org; Wed, 13 May 2020 07:14:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589368446;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=alOjQwXfExPkMvOX4NmVhV63DDT6oRC/UofOuwnYzVA=;
 b=HHdSw3byMEKegJCqTh080RLfSLI8M6PbPnMV7elw4GUjCn6th4ZVHucte4VODNt4C4TGls
 3tRPEPQpfaKvjjBU+aPPAIRS9ZmNiY+zo69QMr2/pizGjCwo7zrPhTx0J5M2m+AaFe6H8B
 9vOBLWoB4Odp5EsvPlqwiCqbb2szzyE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-420-ExQYPhAXMTqdJoo_byAYZg-1; Wed, 13 May 2020 07:14:04 -0400
X-MC-Unique: ExQYPhAXMTqdJoo_byAYZg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4E5E78014C0;
 Wed, 13 May 2020 11:14:03 +0000 (UTC)
Received: from kaapi (unknown [10.74.9.109])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BB5B838D;
 Wed, 13 May 2020 11:13:55 +0000 (UTC)
Date: Wed, 13 May 2020 16:43:51 +0530 (IST)
From: P J P <ppandit@redhat.com>
X-X-Sender: pjp@kaapi
To: Alexander Bulekov <alxndr@bu.edu>
Subject: Re: [PATCH 0/2] use unsigned type for MegasasState fields
In-Reply-To: <20200512194759.nb42yurlnynr5yrw@mozz.bu.edu>
Message-ID: <nycvar.YSQ.7.76.2005131641440.1451610@xnncv>
References: <20200507105718.1319187-1-ppandit@redhat.com>
 <26201c24-c483-85a7-2f4b-b3cc56d4b8b7@redhat.com>
 <nycvar.YSQ.7.76.2005122357030.1451610@xnncv>
 <20200512190803.o6vr2shjmhsplsjx@mozz.bu.edu>
 <20200512194759.nb42yurlnynr5yrw@mozz.bu.edu>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=205.139.110.61; envelope-from=ppandit@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/13 01:56:38
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Fam Zheng <fam@euphon.net>, QEMU Developers <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Ren Ding <rding@gatech.edu>,
 =?ISO-8859-15?Q?Marc-Andr=E9_Lureau?= <marcandre.lureau@redhat.com>,
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hello Alex,

+-- On Tue, 12 May 2020, Alexander Bulekov wrote --+
| ==20527==ERROR: AddressSanitizer: heap-buffer-overflow on address 0x7f79f968a5e0 at pc 0x55b6bb84ce28 bp 0x7ffcbca04eb0 sp 0x7ffcbca04ea8
| READ of size 8 at 0x7f79f968a5e0 thread T0
| 
| #0 0x55fbeb2bdafc in megasas_lookup_frame /home/alxndr/Development/qemu-bugs/qemu2/qemu/hw/scsi/megasas.c:449:30
| #1 0x55fbeb27caa9 in megasas_handle_abort /home/alxndr/Development/qemu-bugs/qemu2/qemu/hw/scsi/megasas.c:1904:17
| #2 0x55fbeb26cb77 in megasas_handle_frame /home/alxndr/Development/qemu-bugs/qemu2/qemu/hw/scsi/megasas.c:1961:24
| #3 0x55fbeb267b78 in megasas_mmio_write /home/alxndr/Development/qemu-bugs/qemu2/qemu/hw/scsi/megasas.c:2122:9
| #4 0x55fbe90b117b in memory_region_write_accessor /home/alxndr/Development/qemu-bugs/qemu2/qemu/memory.c:496:5
| #5 0x55fbe90b05e4 in access_with_adjusted_size /home/alxndr/Development/qemu-bugs/qemu2/qemu/memory.c:557:18
| #6 0x55fbe90ae177 in memory_region_dispatch_write /home/alxndr/Development/qemu-bugs/qemu2/qemu/memory.c:1488:16
| #7 0x55fbe8d97325 in flatview_write_continue /home/alxndr/Development/qemu-bugs/qemu2/qemu/exec.c:3174:23
| 
| Fixed reproducer (tested on qemu 5.0 built with ASAN with these patches):
| 
| cat << EOF | qemu-system-i386 -qtest stdio -nographic -monitor none \
| -serial none -M q35 -device megasas -device scsi-cd,drive=null0 \
| -blockdev driver=null-co,read-zeroes=on,node-name=null0 -nographic
| outl 0xcf8 0x80001814
| outl 0xcfc 0xc021
| outl 0xcf8 0x80001818
| outl 0xcf8 0x80001804
| outw 0xcfc 0x7
| outl 0xcf8 0x80001810
| outl 0xcfc 0xe10c0000
| outl 0xcf8 0x8000f810
| write 0x0 0x18 0x060017e1ff00f8ffffffff60efffffffffffffffffffffff
| write 0xff00 0x1 0x06
| write 0xc021e10c0040 0x81 0x755e08ff0000845e08ff0000935e08ff0000a25e08ff0000b15e08ff0000c05e08ff0000cf5e08ff0000de5e08ff0000ed5e08ff0000fc5e08ff00000b5e08ff00001a5e08ff0000295e08ff0000385e08ff0000475e08ff0000565e08ff0000655e08ff0000745e08ff0000835e08ff0000925e08ff0000a15e08ff0000b05e08
| -M pc-q35-5.0 -no-shutdown -M q35 -device megasas -device scsi-cd,drive=null0 -blockdev driver=null-co,read-zeroes=on,node-name=null0 -nographic

Thanks much for this, will try it.

Thank you.
--
Prasad J Pandit / Red Hat Product Security Team
8685 545E B54C 486B C6EB 271E E285 8B5A F050 DE8D


