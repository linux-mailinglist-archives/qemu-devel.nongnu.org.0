Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B76F9D2E0
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Aug 2019 17:36:52 +0200 (CEST)
Received: from localhost ([::1]:54860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i2H35-0002cV-5A
	for lists+qemu-devel@lfdr.de; Mon, 26 Aug 2019 11:36:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58435)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <cohuck@redhat.com>) id 1i2H23-0002Ac-Rd
 for qemu-devel@nongnu.org; Mon, 26 Aug 2019 11:35:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1i2H23-0003N4-0x
 for qemu-devel@nongnu.org; Mon, 26 Aug 2019 11:35:47 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41688)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>) id 1i2H22-0003Mi-SG
 for qemu-devel@nongnu.org; Mon, 26 Aug 2019 11:35:46 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 36EA418C890C
 for <qemu-devel@nongnu.org>; Mon, 26 Aug 2019 15:35:46 +0000 (UTC)
Received: from gondolin (dhcp-192-222.str.redhat.com [10.33.192.222])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 63D635D70D;
 Mon, 26 Aug 2019 15:35:38 +0000 (UTC)
Date: Mon, 26 Aug 2019 17:35:36 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Message-ID: <20190826173536.1ced9da7.cohuck@redhat.com>
In-Reply-To: <20190823175657.12085-3-dgilbert@redhat.com>
References: <20190823175657.12085-1-dgilbert@redhat.com>
 <20190823175657.12085-3-dgilbert@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.70]); Mon, 26 Aug 2019 15:35:46 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v2 2/2] virtio: add vhost-user-fs-pci device
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
Cc: virtio-fs@redhat.com, qemu-devel@nongnu.org, stefanha@redhat.com,
 vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 23 Aug 2019 18:56:57 +0100
"Dr. David Alan Gilbert (git)" <dgilbert@redhat.com> wrote:

> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> 
> Add the PCI version of vhost-user-fs.
> 
> Launch QEMU like this:
> 
>   qemu -chardev socket,path=/tmp/vhost-fs.sock,id=chr0
>        -device x-vhost-user-fs-pci,tag=myfs,chardev=chr0
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> Signed-off-by: Sebastien Boeuf <sebastien.boeuf@intel.com>
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> ---
>  hw/virtio/Makefile.objs       |  1 +
>  hw/virtio/vhost-user-fs-pci.c | 85 +++++++++++++++++++++++++++++++++++
>  2 files changed, 86 insertions(+)
>  create mode 100644 hw/virtio/vhost-user-fs-pci.c

Reviewed-by: Cornelia Huck <cohuck@redhat.com>

I still need to try and send out that patch wiring it up for ccw...

