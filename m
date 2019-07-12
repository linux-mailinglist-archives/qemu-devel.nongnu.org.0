Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6983266A98
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Jul 2019 12:03:54 +0200 (CEST)
Received: from localhost ([::1]:47876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hlsPB-0003Or-CL
	for lists+qemu-devel@lfdr.de; Fri, 12 Jul 2019 06:03:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52527)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <cohuck@redhat.com>) id 1hlsOx-0002wq-Rd
 for qemu-devel@nongnu.org; Fri, 12 Jul 2019 06:03:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1hlsOw-0001QC-1I
 for qemu-devel@nongnu.org; Fri, 12 Jul 2019 06:03:39 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40007)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>) id 1hlsOv-0001PZ-Rx
 for qemu-devel@nongnu.org; Fri, 12 Jul 2019 06:03:37 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 352C7307D92F;
 Fri, 12 Jul 2019 10:03:37 +0000 (UTC)
Received: from gondolin (dhcp-192-222.str.redhat.com [10.33.192.222])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2359460639;
 Fri, 12 Jul 2019 10:03:35 +0000 (UTC)
Date: Fri, 12 Jul 2019 12:03:33 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Pankaj Gupta <pagupta@redhat.com>
Message-ID: <20190712120333.25f23e47.cohuck@redhat.com>
In-Reply-To: <20190712073554.21918-1-pagupta@redhat.com>
References: <20190712073554.21918-1-pagupta@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.48]); Fri, 12 Jul 2019 10:03:37 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 0/3] virtio pmem: coverity fixes
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
Cc: peter.maydell@linaro.org, david@redhat.com, qemu-devel@nongnu.org,
 mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 12 Jul 2019 13:05:51 +0530
Pankaj Gupta <pagupta@redhat.com> wrote:

> This patch series two fixes for coverity and a 
> transactional info removal patch.
> 
> Pankaj Gupta (3):
>   virtio pmem: fix wrong mem region condition
>   virtio pmem: remove memdev null check
>   virtio pmem: remove transational device info
> 
>  hw/virtio/virtio-pmem-pci.c | 4 +---
>  hw/virtio/virtio-pmem.c     | 4 ++--
>  2 files changed, 3 insertions(+), 5 deletions(-)
> 

I think all of this is 4.1 material.

