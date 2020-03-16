Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3256D1870ED
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Mar 2020 18:10:15 +0100 (CET)
Received: from localhost ([::1]:43182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jDtFm-0003QS-6X
	for lists+qemu-devel@lfdr.de; Mon, 16 Mar 2020 13:10:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48046)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <cohuck@redhat.com>) id 1jDr3p-0007vH-6h
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 10:49:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1jDr3o-0008WB-A2
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 10:49:45 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:32209)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>) id 1jDr3o-0008UM-6e
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 10:49:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584370183;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gMWv+Yb/DMylmEO1WotO4C+a6o5mTzzi1Ij1272/Zgs=;
 b=f0Zz096eiDKvGrgea/6PKxw+BRwLSA28RNNuatR/4ymZivI+NKAzDpD/z5xI9cCdqtOgHp
 UzowkX6RsA75C+jckfk/DGE0+RtSL8fr9UaP+5Nvypw+3PmW5//i+thIRqUEWV1zZEVfte
 o+Sa9wEtkUXPNYnzKFR1aNaH+4vgVOk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-347-D95hhSfJOzKkTkI3tzr3Lg-1; Mon, 16 Mar 2020 10:49:40 -0400
X-MC-Unique: D95hhSfJOzKkTkI3tzr3Lg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E17B38E072D;
 Mon, 16 Mar 2020 14:49:38 +0000 (UTC)
Received: from gondolin (ovpn-117-70.ams2.redhat.com [10.36.117.70])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1828D8AC30;
 Mon, 16 Mar 2020 14:49:34 +0000 (UTC)
Date: Mon, 16 Mar 2020 15:49:32 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Janosch Frank <frankja@linux.ibm.com>
Subject: Re: [PATCH v9 03/15] s390x: protvirt: Add migration blocker
Message-ID: <20200316154932.7c2c4d49.cohuck@redhat.com>
In-Reply-To: <20200311132151.172389-4-frankja@linux.ibm.com>
References: <20200311132151.172389-1-frankja@linux.ibm.com>
 <20200311132151.172389-4-frankja@linux.ibm.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 216.205.24.74
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
Cc: borntraeger@de.ibm.com, qemu-s390x@nongnu.org, qemu-devel@nongnu.org,
 david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 11 Mar 2020 09:21:39 -0400
Janosch Frank <frankja@linux.ibm.com> wrote:

> Migration is not yet supported.
> 
> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
> Reviewed-by: David Hildenbrand <david@redhat.com>
> ---
>  hw/s390x/s390-virtio-ccw.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>


