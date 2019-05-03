Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C91B91298F
	for <lists+qemu-devel@lfdr.de>; Fri,  3 May 2019 10:10:25 +0200 (CEST)
Received: from localhost ([127.0.0.1]:36298 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hMTGy-0000aM-M0
	for lists+qemu-devel@lfdr.de; Fri, 03 May 2019 04:10:24 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51551)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1hMTFx-0000Hx-Tk
	for qemu-devel@nongnu.org; Fri, 03 May 2019 04:09:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1hMTFw-0006uj-1q
	for qemu-devel@nongnu.org; Fri, 03 May 2019 04:09:20 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46750)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cohuck@redhat.com>)
	id 1hMTFt-0006sd-MR; Fri, 03 May 2019 04:09:18 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6B74FC057F3B;
	Fri,  3 May 2019 08:09:16 +0000 (UTC)
Received: from gondolin (dhcp-192-222.str.redhat.com [10.33.192.222])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2C624629DC;
	Fri,  3 May 2019 08:09:15 +0000 (UTC)
Date: Fri, 3 May 2019 10:09:12 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Thomas Huth <thuth@redhat.com>, Christian Borntraeger
	<borntraeger@de.ibm.com>
Message-ID: <20190503100912.468652e7.cohuck@redhat.com>
In-Reply-To: <20190502155516.12415-1-cohuck@redhat.com>
References: <20190502155516.12415-1-cohuck@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Fri, 03 May 2019 08:09:16 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH] s390/ipl: cast to SCSIDevice directly
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "Jason J . Herne" <jjherne@linux.ibm.com>, qemu-s390x@nongnu.org,
	qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu,  2 May 2019 17:55:16 +0200
Cornelia Huck <cohuck@redhat.com> wrote:

> Coverity notes that the result of object_dynamic_cast() to
> SCSIDevice is not checked in s390_gen_initial_iplp(); as
> we know that we always have a SCSIDevice in that branch,
> we can instead cast via SCSI_DEVICE directly.
> 
> Coverity: CID 1401098
> Fixes: 44445d8668f4 ("s390 vfio-ccw: Add bootindex property and IPLB data")
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
>  hw/s390x/ipl.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Queued to s390-next.

