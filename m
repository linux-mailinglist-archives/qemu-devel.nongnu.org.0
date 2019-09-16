Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C77D5B34B7
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Sep 2019 08:32:46 +0200 (CEST)
Received: from localhost ([::1]:59284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i9kZ1-0003BB-1d
	for lists+qemu-devel@lfdr.de; Mon, 16 Sep 2019 02:32:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44442)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pagupta@redhat.com>) id 1i9kWv-0002c4-MF
 for qemu-devel@nongnu.org; Mon, 16 Sep 2019 02:30:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pagupta@redhat.com>) id 1i9kWp-0004KG-Hu
 for qemu-devel@nongnu.org; Mon, 16 Sep 2019 02:30:32 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39486)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pagupta@redhat.com>) id 1i9kWp-0004K3-CS
 for qemu-devel@nongnu.org; Mon, 16 Sep 2019 02:30:27 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id B64B13086258;
 Mon, 16 Sep 2019 06:30:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CA3EB196B2;
 Mon, 16 Sep 2019 06:30:24 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
 (zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 981134A460;
 Mon, 16 Sep 2019 06:30:23 +0000 (UTC)
Date: Mon, 16 Sep 2019 02:30:23 -0400 (EDT)
From: Pankaj Gupta <pagupta@redhat.com>
To: mst@redhat.com
Message-ID: <1345104262.94526.1568615423152.JavaMail.zimbra@redhat.com>
In-Reply-To: <20190826144657.7614e4fe.cohuck@redhat.com>
References: <20190821121624.5382-1-pagupta@redhat.com>
 <20190826144657.7614e4fe.cohuck@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.116.34, 10.4.195.14]
Thread-Topic: virtio pmem: user document
Thread-Index: 79pe8ih9EF16R/J4LPA+IsBwkFDS1Q==
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Mon, 16 Sep 2019 06:30:25 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v3] virtio pmem: user document
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
Cc: riel@surriel.com, Cornelia Huck <cohuck@redhat.com>, david@redhat.com,
 qemu-devel@nongnu.org, lcapitulino@redhat.com, stefanha@redhat.com,
 nilal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Gentle ping.

Can we please merge this patch.

Thanks,
Pankaj

> 
> > This patch documents the steps to use virtio pmem.
> > It also documents other useful information about
> > virtio pmem e.g use-case, comparison with Qemu NVDIMM
> > backend and current limitations.
> > 
> > Signed-off-by: Pankaj Gupta <pagupta@redhat.com>
> > ---
> > v3->v3
> >  - Text format fixes - Cornerlia
> > v1->v2
> >  - Fixes on text format and 'Guest Data persistence'
> >    section - Cornelia
> > 
> >  docs/virtio-pmem.rst | 75 ++++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 75 insertions(+)
> >  create mode 100644 docs/virtio-pmem.rst
> 
> Looks good to me now.
> 
> Reviewed-by: Cornelia Huck <cohuck@redhat.com>
> 
> 

