Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 602381343A5
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jan 2020 14:17:43 +0100 (CET)
Received: from localhost ([::1]:43640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ipBDS-00028z-Cw
	for lists+qemu-devel@lfdr.de; Wed, 08 Jan 2020 08:17:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60119)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <cohuck@redhat.com>) id 1ipBCR-0001cj-Ti
 for qemu-devel@nongnu.org; Wed, 08 Jan 2020 08:16:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1ipBCQ-0007DT-Us
 for qemu-devel@nongnu.org; Wed, 08 Jan 2020 08:16:39 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:53292
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>) id 1ipBBy-0006vp-4t
 for qemu-devel@nongnu.org; Wed, 08 Jan 2020 08:16:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578489368;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nPcmk0b6yRUBu9FYvwhg+6bf/76SqxpUR2t7+mUQVoE=;
 b=ZzPSCZTYrHsnQ0efXFWIdIScQ7xdNHqMAOp2LLwFM2ACa+zf+EAm087nn9TXxvno1E40s5
 bl9QAowGdHwYjbskX0fiwzWdVbFe/wdg90aEV51AUcl5JIl9pninRomIAT4oI9pmVp7xmD
 pCt/4XeavYy7S7TwNWg3D3Gja7oJXcM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-123-5frj8CK_OQOzT6ZooWMIyw-1; Wed, 08 Jan 2020 08:16:04 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8D6AE800D41;
 Wed,  8 Jan 2020 13:16:03 +0000 (UTC)
Received: from gondolin (dhcp-192-245.str.redhat.com [10.33.192.245])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 65BC65C1B0;
 Wed,  8 Jan 2020 13:16:02 +0000 (UTC)
Date: Wed, 8 Jan 2020 14:16:00 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v1 38/59] s390x/sclp.c: remove unneeded label in
 sclp_service_call()
Message-ID: <20200108141600.23c879c0.cohuck@redhat.com>
In-Reply-To: <20200106182425.20312-39-danielhb413@gmail.com>
References: <20200106182425.20312-1-danielhb413@gmail.com>
 <20200106182425.20312-39-danielhb413@gmail.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: 5frj8CK_OQOzT6ZooWMIyw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: qemu-trivial@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 qemu-s390x@nongnu.org, qemu-devel@nongnu.org,
 Christian Borntraeger <borntraeger@de.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon,  6 Jan 2020 15:24:04 -0300
Daniel Henrique Barboza <danielhb413@gmail.com> wrote:

> 'out' label can be replaced by 'return' with the appropriate
> value. The 'r' integer, which is used solely to set the
> return value for this label, can also be removed.
> 
> CC: Cornelia Huck <cohuck@redhat.com>
> CC: Halil Pasic <pasic@linux.ibm.com>
> CC: Christian Borntraeger <borntraeger@de.ibm.com>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>  hw/s390x/sclp.c | 16 +++++-----------
>  1 file changed, 5 insertions(+), 11 deletions(-)

Thanks, applied.


