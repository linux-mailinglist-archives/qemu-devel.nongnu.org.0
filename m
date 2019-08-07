Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C9FA848AF
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Aug 2019 11:36:03 +0200 (CEST)
Received: from localhost ([::1]:39134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hvIMU-0004AE-FV
	for lists+qemu-devel@lfdr.de; Wed, 07 Aug 2019 05:36:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58392)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <stefanha@redhat.com>) id 1hvILm-0003fC-6E
 for qemu-devel@nongnu.org; Wed, 07 Aug 2019 05:35:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@redhat.com>) id 1hvILl-0002KQ-9O
 for qemu-devel@nongnu.org; Wed, 07 Aug 2019 05:35:18 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33428)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefanha@redhat.com>) id 1hvILl-0002Jx-46
 for qemu-devel@nongnu.org; Wed, 07 Aug 2019 05:35:17 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 596F830A00B1;
 Wed,  7 Aug 2019 09:35:16 +0000 (UTC)
Received: from localhost (ovpn-117-144.ams2.redhat.com [10.36.117.144])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6D43F1CD;
 Wed,  7 Aug 2019 09:35:12 +0000 (UTC)
Date: Wed, 7 Aug 2019 10:35:10 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Message-ID: <20190807093510.GF13267@stefanha-x1.localdomain>
References: <20190801165409.20121-1-stefanha@redhat.com>
 <20190801165409.20121-2-stefanha@redhat.com>
 <20190805120231.GL13734@work-vm>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190805120231.GL13734@work-vm>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.43]); Wed, 07 Aug 2019 09:35:16 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 1/4] virtiofsd: process requests in a
 thread pool
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
Cc: virtio-fs@redhat.com, Liu Bo <bo.liu@linux.alibaba.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Aug 05, 2019 at 01:02:31PM +0100, Dr. David Alan Gilbert wrote:
> * Stefan Hajnoczi (stefanha@redhat.com) wrote:
> > +        if (se->debug)
> > +                fuse_debug("%s: elem %d: with %d out desc of length %zd"
> > +                           " bad_in_num=%u bad_out_num=%u\n",
> > +                           __func__, elem->index, out_num,
> > +                           out_len, req->bad_in_num, req->bad_out_num);
> 
> Are the debug/logging calls thread safe?

Yes, vsyslog(3) and vfprintf(3) are thread-safe.

Stefan

