Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C2E41A5A
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jun 2019 04:24:29 +0200 (CEST)
Received: from localhost ([::1]:56362 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hasw8-0000sH-PY
	for lists+qemu-devel@lfdr.de; Tue, 11 Jun 2019 22:24:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60521)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <pagupta@redhat.com>) id 1hasuz-0000P7-Aw
 for qemu-devel@nongnu.org; Tue, 11 Jun 2019 22:23:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pagupta@redhat.com>) id 1hasuy-0001wa-CT
 for qemu-devel@nongnu.org; Tue, 11 Jun 2019 22:23:17 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42882)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pagupta@redhat.com>) id 1hasuw-0001uQ-Np
 for qemu-devel@nongnu.org; Tue, 11 Jun 2019 22:23:16 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 63D5C3082E03;
 Wed, 12 Jun 2019 02:23:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 32A02648BF;
 Wed, 12 Jun 2019 02:23:11 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
 (zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2391624B25;
 Wed, 12 Jun 2019 02:23:10 +0000 (UTC)
Date: Tue, 11 Jun 2019 22:23:09 -0400 (EDT)
From: Pankaj Gupta <pagupta@redhat.com>
To: Mike Snitzer <snitzer@redhat.com>
Message-ID: <332155967.34508010.1560306189624.JavaMail.zimbra@redhat.com>
In-Reply-To: <20190611171416.GA1248@redhat.com>
References: <20190611163802.25352-1-pagupta@redhat.com>
 <20190611163802.25352-5-pagupta@redhat.com>
 <20190611171416.GA1248@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.116.70, 10.4.195.27]
Thread-Topic: enable synchronous dax
Thread-Index: 7O59Nmg+n8QzGpvkvBkkxWqWG8w3fA==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Wed, 12 Jun 2019 02:23:12 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v12 4/7] dm: enable synchronous dax
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
Cc: rdunlap@infradead.org, jack@suse.cz, kvm@vger.kernel.org, mst@redhat.com,
 jasowang@redhat.com, david@fromorbit.com, qemu-devel@nongnu.org,
 virtualization@lists.linux-foundation.org, dm-devel@redhat.com,
 adilger kernel <adilger.kernel@dilger.ca>, zwisler@kernel.org,
 aarcange@redhat.com, dave jiang <dave.jiang@intel.com>, jstaron@google.com,
 linux-nvdimm@lists.01.org, vishal l verma <vishal.l.verma@intel.com>,
 david@redhat.com, willy@infradead.org, hch@infradead.org,
 linux-acpi@vger.kernel.org, jmoyer@redhat.com, linux-ext4@vger.kernel.org,
 lenb@kernel.org, kilobyte@angband.pl, riel@surriel.com,
 yuval shaia <yuval.shaia@oracle.com>, stefanha@redhat.com, imammedo@redhat.com,
 dan j williams <dan.j.williams@intel.com>, lcapitulino@redhat.com,
 kwolf@redhat.com, nilal@redhat.com, tytso@mit.edu,
 xiaoguangrong eric <xiaoguangrong.eric@gmail.com>, cohuck@redhat.com,
 rjw@rjwysocki.net, linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, pbonzini@redhat.com,
 darrick wong <darrick.wong@oracle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


> On Tue, Jun 11 2019 at 12:37pm -0400,
> Pankaj Gupta <pagupta@redhat.com> wrote:
> 
> > This patch sets dax device 'DAXDEV_SYNC' flag if all the target
> > devices of device mapper support synchrononous DAX. If device
> > mapper consists of both synchronous and asynchronous dax devices,
> > we don't set 'DAXDEV_SYNC' flag.
> > 
> > 'dm_table_supports_dax' is refactored to pass 'iterate_devices_fn'
> > as argument so that the callers can pass the appropriate functions.
> > 
> > Suggested-by: Mike Snitzer <snitzer@redhat.com>
> > Signed-off-by: Pankaj Gupta <pagupta@redhat.com>
> 
> Thanks, and for the benefit of others, passing function pointers like
> this is perfectly fine IMHO because this code is _not_ in the fast
> path.  These methods are only for device creation.
> 
> Reviewed-by: Mike Snitzer <snitzer@redhat.com>

Thank you, Mike

Best regards,
Pankaj

> 
> 

