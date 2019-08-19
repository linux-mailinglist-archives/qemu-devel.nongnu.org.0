Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F7D9209C
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Aug 2019 11:45:13 +0200 (CEST)
Received: from localhost ([::1]:46684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hzeDw-0005lk-Qd
	for lists+qemu-devel@lfdr.de; Mon, 19 Aug 2019 05:45:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34938)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <cohuck@redhat.com>) id 1hzeCz-00059v-DN
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 05:44:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1hzeCy-0007uJ-3p
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 05:44:12 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35936)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>)
 id 1hzeCx-0007td-UG; Mon, 19 Aug 2019 05:44:12 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 26CEE30A5A64;
 Mon, 19 Aug 2019 09:44:10 +0000 (UTC)
Received: from gondolin (unknown [10.36.116.255])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D8F0D831DF;
 Mon, 19 Aug 2019 09:44:05 +0000 (UTC)
Date: Mon, 19 Aug 2019 11:44:02 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: David Hildenbrand <david@redhat.com>
Message-ID: <20190819114402.58419749.cohuck@redhat.com>
In-Reply-To: <20190816084708.602-2-david@redhat.com>
References: <20190816084708.602-1-david@redhat.com>
 <20190816084708.602-2-david@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.47]); Mon, 19 Aug 2019 09:44:10 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v3 1/6] s390x/mmu: Trace the right value if
 setting/getting the storage key fails
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
Cc: Thomas Huth <thuth@redhat.com>, Janosch Frank <frankja@linux.ibm.com>,
 qemu-devel@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Alex =?UTF-8?B?QmVubsOpZQ==?= <alex.bennee@linaro.org>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 16 Aug 2019 10:47:03 +0200
David Hildenbrand <david@redhat.com> wrote:

> We want to trace the actual return value, not "0".
> 
> Fixes: 0f5f669147b5 (s390x: Enable new s390-storage-keys device)

Fixes: 0f5f669147b5 ("s390x: Enable new s390-storage-keys device")

:)

> Reviewed-by: Cornelia Huck <cohuck@redhat.com>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  target/s390x/mmu_helper.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

