Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D9E021385C
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jul 2020 12:03:25 +0200 (CEST)
Received: from localhost ([::1]:59008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jrIXU-0000Pe-EP
	for lists+qemu-devel@lfdr.de; Fri, 03 Jul 2020 06:03:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1jrIWR-0007zy-PB
 for qemu-devel@nongnu.org; Fri, 03 Jul 2020 06:02:19 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:33239
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1jrIWP-0003ns-Qh
 for qemu-devel@nongnu.org; Fri, 03 Jul 2020 06:02:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593770536;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Bh2NdWYaVZD3e/WuDBPhMvvgWUAWKnurj1VimsQMHYI=;
 b=CVLkr/sqzcc1DyNL02vJT+1jcs4t4yxKlg6IGJpbUkzDeaOX92En2HqFC71uxqyARv+kIO
 olfzCUpt8hKt61D6aiyoiCjehddm6+DT0wVfny+hEvZulgAZ5PHscF6hDmFhc7eW57uztr
 bX6ZDogOIzVG47lVTXrtNCcvXQUKikQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-482-zRNJ23hTP2KRDn6N8zyzKg-1; Fri, 03 Jul 2020 06:02:12 -0400
X-MC-Unique: zRNJ23hTP2KRDn6N8zyzKg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 22613107ACCD;
 Fri,  3 Jul 2020 10:02:11 +0000 (UTC)
Received: from gondolin (ovpn-113-54.ams2.redhat.com [10.36.113.54])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CB7812B4C8;
 Fri,  3 Jul 2020 10:02:09 +0000 (UTC)
Date: Fri, 3 Jul 2020 12:02:07 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PULL SUBSYSTEM s390x 00/11] s390-ccw bios update
Message-ID: <20200703120207.7864380c.cohuck@redhat.com>
In-Reply-To: <20200702115045.6171-1-thuth@redhat.com>
References: <20200702115045.6171-1-thuth@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/03 03:17:33
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org, Janosch Frank <frankja@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu,  2 Jul 2020 13:50:34 +0200
Thomas Huth <thuth@redhat.com> wrote:

> This pull request is not for master.
> 
>  Hi Cornelia,
> 
> the following changes since commit fc1bff958998910ec8d25db86cd2f53ff125f7ab:
> 
>   hw/misc/pca9552: Add missing TypeInfo::class_size field (2020-06-29 21:16:10 +0100)
> 
> are available in the Git repository at:
> 
>   https://gitlab.com/huth/qemu.git tags/s390-ccw-bios-2020-07-02
> 
> for you to fetch changes up to b71db6b9abb5af302c9669c133d78115c6437c45:
> 
>   pc-bios/s390: Update s390-ccw bios binaries with the latest changes (2020-07-02 11:51:31 +0200)
> 
> ----------------------------------------------------------------
> * Source code clean-ups from Janosch
> ----------------------------------------------------------------
> 
> Janosch Frank (9):
>       pc-bios: s390x: cio.c cleanup and compile fix
>       pc-bios: s390x: Consolidate timing functions into time.h
>       pc-bios: s390x: Move sleep and yield to helper.h
>       pc-bios: s390x: Get rid of magic offsets into the lowcore
>       pc-bios: s390x: Rename PSW_MASK_ZMODE to PSW_MASK_64
>       pc-bios: s390x: Use PSW masks where possible and introduce PSW_MASK_SHORT_ADDR
>       pc-bios: s390x: Move panic() into header and add infinite loop
>       pc-bios: s390x: Use ebcdic2ascii table
>       pc-bios: s390x: Make u32 ptr check explicit
> 
> Thomas Huth (2):
>       pc-bios/s390-ccw: Generate and include dependency files in the Makefile
>       pc-bios/s390: Update s390-ccw bios binaries with the latest changes
> 
>  pc-bios/s390-ccw.img           | Bin 42608 -> 42608 bytes
>  pc-bios/s390-ccw/Makefile      |   3 +++
>  pc-bios/s390-ccw/bootmap.c     |   4 +---
>  pc-bios/s390-ccw/cio.c         |  40 ++++++++++++++++++++++------------------
>  pc-bios/s390-ccw/cio.h         |  17 +++++++++++------
>  pc-bios/s390-ccw/helper.h      |  19 ++++++++++++++++++-
>  pc-bios/s390-ccw/jump2ipl.c    |  10 ++++------
>  pc-bios/s390-ccw/main.c        |  15 +++------------
>  pc-bios/s390-ccw/menu.c        |   1 +
>  pc-bios/s390-ccw/netboot.mak   |  13 +++++++------
>  pc-bios/s390-ccw/netmain.c     |  23 +++--------------------
>  pc-bios/s390-ccw/s390-arch.h   |   4 +++-
>  pc-bios/s390-ccw/s390-ccw.h    |  27 +++++++--------------------
>  pc-bios/s390-ccw/s390-time.h   |  23 +++++++++++++++++++++++
>  pc-bios/s390-ccw/start.S       |   5 +++--
>  pc-bios/s390-ccw/virtio-net.c  |   2 ++
>  pc-bios/s390-ccw/virtio-scsi.c |   2 ++
>  pc-bios/s390-ccw/virtio.c      |  18 +++---------------
>  pc-bios/s390-netboot.img       | Bin 67232 -> 67232 bytes
>  19 files changed, 116 insertions(+), 110 deletions(-)
>  create mode 100644 pc-bios/s390-ccw/s390-time.h

Thanks, pulled.


