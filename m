Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C16F145A43
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jan 2020 17:51:58 +0100 (CET)
Received: from localhost ([::1]:44416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iuJET-0003VR-Al
	for lists+qemu-devel@lfdr.de; Wed, 22 Jan 2020 11:51:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50621)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <cohuck@redhat.com>) id 1iuJBf-0001md-EX
 for qemu-devel@nongnu.org; Wed, 22 Jan 2020 11:49:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1iuJBe-0001wm-A8
 for qemu-devel@nongnu.org; Wed, 22 Jan 2020 11:49:03 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:20978
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>) id 1iuJBe-0001wO-69
 for qemu-devel@nongnu.org; Wed, 22 Jan 2020 11:49:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579711741;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eSz5VX2O9AYyHC1te8CSiocSt+Pqx7f6H7tbPqVOGJ8=;
 b=CU0w2X5hTU7a82C/2Xpn46yMgDFk2qjJuMO11EOhcOidtVHDsrctqKaP3+pnaNHWiF3jN5
 RKCuDMKjFy9QI0eqZ6bqiPlFFhVgRCfPUBMcJTW+hgeroO25uePc+sLVistWEnBEE0+WZ3
 DR1Dgggj5VTDDyU8XNINJTadWVv/0GM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-114-yJij60BcNOyunofK5gaUFA-1; Wed, 22 Jan 2020 11:48:58 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EE0F4800D41;
 Wed, 22 Jan 2020 16:48:56 +0000 (UTC)
Received: from gondolin (dhcp-192-195.str.redhat.com [10.33.192.195])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4FBA186426;
 Wed, 22 Jan 2020 16:48:53 +0000 (UTC)
Date: Wed, 22 Jan 2020 17:48:51 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v5] target/s390x/kvm: Enable adapter interruption
 suppression again
Message-ID: <20200122174851.07d4b833.cohuck@redhat.com>
In-Reply-To: <20200122101437.5069-1-thuth@redhat.com>
References: <20200122101437.5069-1-thuth@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: yJij60BcNOyunofK5gaUFA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: Matthew Rosato <mjrosato@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 22 Jan 2020 11:14:37 +0100
Thomas Huth <thuth@redhat.com> wrote:

> The AIS feature has been disabled late in the v2.10 development cycle since
> there were some issues with migration (see commit 3f2d07b3b01ea61126b -
> "s390x/ais: for 2.10 stable: disable ais facility"). We originally wanted
> to enable it again for newer machine types, but apparently we forgot to do
> this so far. Let's do it now for the machines that support proper CPU models.
> 
> Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=1756946
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  v5: Use cpu_model_allowed() as suggested by David. Seems to work as far
>      as I can test it without PCI cards, but ping-pong migration with
>      "-cpu host" from/to an older version of QEMU is now not working
>      anymore - but I think that's kind of expected since "-cpu host"
>      is not migration-safe anyway.
> 
>  target/s390x/kvm.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)

Thanks, applied.


