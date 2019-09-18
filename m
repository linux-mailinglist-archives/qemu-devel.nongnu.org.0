Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A07BAB637A
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Sep 2019 14:43:40 +0200 (CEST)
Received: from localhost ([::1]:58592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iAZJ5-0000MZ-0Q
	for lists+qemu-devel@lfdr.de; Wed, 18 Sep 2019 08:43:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55687)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <cohuck@redhat.com>) id 1iAZGd-0007Vo-T7
 for qemu-devel@nongnu.org; Wed, 18 Sep 2019 08:41:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1iAZGa-0005br-Ab
 for qemu-devel@nongnu.org; Wed, 18 Sep 2019 08:41:07 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37761)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>) id 1iAZGa-0005b1-39
 for qemu-devel@nongnu.org; Wed, 18 Sep 2019 08:41:04 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 968E065F4B
 for <qemu-devel@nongnu.org>; Wed, 18 Sep 2019 12:41:02 +0000 (UTC)
Received: from gondolin (dhcp-192-230.str.redhat.com [10.33.192.230])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8F4EBA222;
 Wed, 18 Sep 2019 12:41:00 +0000 (UTC)
Date: Wed, 18 Sep 2019 14:40:58 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Message-ID: <20190918144058.15151a60.cohuck@redhat.com>
In-Reply-To: <20190917160057.11847-3-dgilbert@redhat.com>
References: <20190917160057.11847-1-dgilbert@redhat.com>
 <20190917160057.11847-3-dgilbert@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.25]); Wed, 18 Sep 2019 12:41:02 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v3 2/3] virtio: add vhost-user-fs base
 device
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
Cc: vgoyal@redhat.com, mszeredi@redhat.com, qemu-devel@nongnu.org,
 stefanha@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 17 Sep 2019 17:00:56 +0100
"Dr. David Alan Gilbert (git)" <dgilbert@redhat.com> wrote:

> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> 
> The virtio-fs virtio device provides shared file system access using
> the FUSE protocol carried over virtio.
> The actual file server is implemented in an external vhost-user-fs device
> backend process.
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> Signed-off-by: Sebastien Boeuf <sebastien.boeuf@intel.com>
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> ---
>  configure                         |  13 ++
>  hw/virtio/Makefile.objs           |   1 +
>  hw/virtio/vhost-user-fs.c         | 299 ++++++++++++++++++++++++++++++
>  include/hw/virtio/vhost-user-fs.h |  45 +++++
>  4 files changed, 358 insertions(+)
>  create mode 100644 hw/virtio/vhost-user-fs.c
>  create mode 100644 include/hw/virtio/vhost-user-fs.h

Reviewed-by: Cornelia Huck <cohuck@redhat.com>

