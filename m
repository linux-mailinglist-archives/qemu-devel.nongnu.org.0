Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F3B614A7C5
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jan 2020 17:05:36 +0100 (CET)
Received: from localhost ([::1]:47314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iw6tL-0001oh-8e
	for lists+qemu-devel@lfdr.de; Mon, 27 Jan 2020 11:05:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55513)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.williamson@redhat.com>) id 1iw6sR-0001Hl-9g
 for qemu-devel@nongnu.org; Mon, 27 Jan 2020 11:04:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.williamson@redhat.com>) id 1iw6sQ-00011a-DS
 for qemu-devel@nongnu.org; Mon, 27 Jan 2020 11:04:39 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:59877
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <alex.williamson@redhat.com>)
 id 1iw6sQ-00010G-8e
 for qemu-devel@nongnu.org; Mon, 27 Jan 2020 11:04:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580141076;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NoKVjHd4fM7JngAm/gJmrlcPTfKhZZiwN/9rnEYuHzE=;
 b=IcezoVoj8azKd3AqqVx4wyZiTvD7xrZHoKvyUHCC1DE1703mLFO+kibkvhPkz3ltZo8oeY
 m6I32oKNQdKZXCF9lLQKPdeF7MDf3degrkl0QWu7YQ/FdGmGaEbCOSk4Ee1SxXnaqV4vL5
 hCl/O06iu0Pbkmlxi0l8jDDvxtXzAfA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-422-TRw9jrdBP52h_rBHSXqLcA-1; Mon, 27 Jan 2020 11:04:33 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C439A1089A7D;
 Mon, 27 Jan 2020 16:04:32 +0000 (UTC)
Received: from w520.home (ovpn-116-28.phx2.redhat.com [10.3.116.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9764585747;
 Mon, 27 Jan 2020 16:04:32 +0000 (UTC)
Date: Mon, 27 Jan 2020 09:04:32 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Graeme Brett Houston <graemebrett.houston@btopenworld.com>
Subject: Re: Documentation and VFIO on SPARC
Message-ID: <20200127090432.57e41910@w520.home>
In-Reply-To: <1fe252e9-5c9d-a572-d3ae-76d51ef77026@btopenworld.com>
References: <1fe252e9-5c9d-a572-d3ae-76d51ef77026@btopenworld.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: TRw9jrdBP52h_rBHSXqLcA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 24 Jan 2020 14:48:40 +0000
Graeme Brett Houston <graemebrett.houston@btopenworld.com> wrote:

> 2 Queries:
> 
> 1st is there any Good Documentation on Writing VGA devices?
> 
> 2nd Can VFIO devices be successfully passed to the sparc engine & 
> hopefully Solaris 9 actually bootup
> 
> I am thinking a Actual PCI SPARC Card with OpenFirmware ROM and other 
> dev ices i am interested in getting a PCI trace from.

Re: 2, try it and see.  When developing vfio I tested with an emulated
powerpc machine as it was one of the few archs other than x86 systems
that seemed to have functional PCI in QEMU, it worked.  I'm not sure
what might have broken since then, it's been a long time since I've run
that test case, but worth a shot.  Thanks,

Alex


