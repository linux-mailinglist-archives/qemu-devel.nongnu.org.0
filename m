Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FFC29CFD0
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Aug 2019 14:48:45 +0200 (CEST)
Received: from localhost ([::1]:52560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i2EQO-00080E-Ck
	for lists+qemu-devel@lfdr.de; Mon, 26 Aug 2019 08:48:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56271)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <cohuck@redhat.com>) id 1i2EOv-0007YO-DY
 for qemu-devel@nongnu.org; Mon, 26 Aug 2019 08:47:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1i2EOu-00023n-Ez
 for qemu-devel@nongnu.org; Mon, 26 Aug 2019 08:47:13 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59710)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>) id 1i2EOu-000236-9E
 for qemu-devel@nongnu.org; Mon, 26 Aug 2019 08:47:12 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 9EBA28342DA;
 Mon, 26 Aug 2019 12:47:10 +0000 (UTC)
Received: from gondolin (dhcp-192-222.str.redhat.com [10.33.192.222])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D5528608C1;
 Mon, 26 Aug 2019 12:46:59 +0000 (UTC)
Date: Mon, 26 Aug 2019 14:46:57 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Pankaj Gupta <pagupta@redhat.com>
Message-ID: <20190826144657.7614e4fe.cohuck@redhat.com>
In-Reply-To: <20190821121624.5382-1-pagupta@redhat.com>
References: <20190821121624.5382-1-pagupta@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.69]); Mon, 26 Aug 2019 12:47:10 +0000 (UTC)
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
Cc: mst@redhat.com, david@redhat.com, qemu-devel@nongnu.org,
 lcapitulino@redhat.com, stefanha@redhat.com, riel@surriel.com,
 nilal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 21 Aug 2019 17:46:24 +0530
Pankaj Gupta <pagupta@redhat.com> wrote:

> This patch documents the steps to use virtio pmem.
> It also documents other useful information about
> virtio pmem e.g use-case, comparison with Qemu NVDIMM
> backend and current limitations.
> 
> Signed-off-by: Pankaj Gupta <pagupta@redhat.com>
> ---
> v3->v3
>  - Text format fixes - Cornerlia
> v1->v2
>  - Fixes on text format and 'Guest Data persistence'
>    section - Cornelia
> 
>  docs/virtio-pmem.rst | 75 ++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 75 insertions(+)
>  create mode 100644 docs/virtio-pmem.rst

Looks good to me now.

Reviewed-by: Cornelia Huck <cohuck@redhat.com>

