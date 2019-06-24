Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6982F509AC
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jun 2019 13:23:34 +0200 (CEST)
Received: from localhost ([::1]:49978 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hfN4P-0004EW-K1
	for lists+qemu-devel@lfdr.de; Mon, 24 Jun 2019 07:23:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58663)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peterx@redhat.com>) id 1hfN26-0002qq-5V
 for qemu-devel@nongnu.org; Mon, 24 Jun 2019 07:21:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peterx@redhat.com>) id 1hfN23-0007MX-LG
 for qemu-devel@nongnu.org; Mon, 24 Jun 2019 07:21:10 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54478)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <peterx@redhat.com>) id 1hfN23-0007Iz-Do
 for qemu-devel@nongnu.org; Mon, 24 Jun 2019 07:21:07 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 3BFD2C04AC69;
 Mon, 24 Jun 2019 11:21:05 +0000 (UTC)
Received: from xz-x1 (ovpn-12-60.pek2.redhat.com [10.72.12.60])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C75595C1B5;
 Mon, 24 Jun 2019 11:21:00 +0000 (UTC)
Date: Mon, 24 Jun 2019 19:20:56 +0800
From: Peter Xu <peterx@redhat.com>
To: Li Qiang <liq3ea@gmail.com>
Message-ID: <20190624112056.GM6279@xz-x1>
References: <20190622002119.126834-1-liq3ea@163.com>
 <20190624094216.GI6279@xz-x1>
 <CAKXe6S+5Ad-WHYpX9E8EFv61ASxSQYL+RQoqnG6NVbysgtv4FQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAKXe6S+5Ad-WHYpX9E8EFv61ASxSQYL+RQoqnG6NVbysgtv4FQ@mail.gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.31]); Mon, 24 Jun 2019 11:21:05 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v2] ioapic: use irq number instead of
 vector in ioapic_eoi_broadcast
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Li Qiang <liq3ea@163.com>,
 Qemu Developers <qemu-devel@nongnu.org>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jun 24, 2019 at 07:08:30PM +0800, Li Qiang wrote:
> Do you mean the redirect table entry of ioapic update?

Yes.

> I think this is reasonable, I will prepare a separate patch with this one
> as a patchset later.

IMHO you can post that as separate patch.  After all these are
different issues and this one looks good already, so no need to
repost.

Regards,

-- 
Peter Xu

