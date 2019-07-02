Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE5D5CEF6
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Jul 2019 13:58:33 +0200 (CEST)
Received: from localhost ([::1]:51978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hiHQe-0004pd-AL
	for lists+qemu-devel@lfdr.de; Tue, 02 Jul 2019 07:58:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35527)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <cohuck@redhat.com>) id 1hiHJE-0000SG-FE
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 07:50:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1hiHJB-0005O5-RH
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 07:50:51 -0400
Received: from mx1.redhat.com ([209.132.183.28]:26785)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>) id 1hiHJ9-0005HM-Sb
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 07:50:48 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 743843005FC1;
 Tue,  2 Jul 2019 11:50:43 +0000 (UTC)
Received: from gondolin (dhcp-192-192.str.redhat.com [10.33.192.192])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D97F56F94E;
 Tue,  2 Jul 2019 11:50:32 +0000 (UTC)
Date: Tue, 2 Jul 2019 13:50:30 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Pankaj Gupta <pagupta@redhat.com>
Message-ID: <20190702135030.6159266b.cohuck@redhat.com>
In-Reply-To: <20190619094907.10131-4-pagupta@redhat.com>
References: <20190619094907.10131-1-pagupta@redhat.com>
 <20190619094907.10131-4-pagupta@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.40]); Tue, 02 Jul 2019 11:50:43 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v2 3/7] virtio-pmem: sync linux headers
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
Cc: kwolf@redhat.com, aarcange@redhat.com, xiaoguangrong.eric@gmail.com,
 mst@redhat.com, armbru@redhat.com, riel@surriel.com, david@redhat.com,
 qemu-devel@nongnu.org, ehabkost@redhat.com, lcapitulino@redhat.com,
 stefanha@redhat.com, pbonzini@redhat.com, imammedo@redhat.com,
 dan.j.williams@intel.com, nilal@redhat.com, dgilbert@redhat.com,
 rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 19 Jun 2019 15:19:03 +0530
Pankaj Gupta <pagupta@redhat.com> wrote:

> Sync linux headers for virtio pmem.
> 
> Signed-off-by: Pankaj Gupta <pagupta@redhat.com>
> ---
>  include/standard-headers/linux/virtio_ids.h  |  1 +
>  include/standard-headers/linux/virtio_pmem.h | 35 ++++++++++++++++++++++++++++
>  2 files changed, 36 insertions(+)
>  create mode 100644 include/standard-headers/linux/virtio_pmem.h

That's not yet upstream, right?

If so, I fear this feature won't make 4.1, as the merge window for
Linux only opens in one or two weeks :(

