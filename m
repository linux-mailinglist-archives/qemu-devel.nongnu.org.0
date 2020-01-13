Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB2B21396D4
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jan 2020 17:54:56 +0100 (CET)
Received: from localhost ([::1]:52938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ir2zP-0001p9-LE
	for lists+qemu-devel@lfdr.de; Mon, 13 Jan 2020 11:54:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57873)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <cohuck@redhat.com>) id 1ir2xQ-000878-IW
 for qemu-devel@nongnu.org; Mon, 13 Jan 2020 11:52:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1ir2xP-0002fA-Ef
 for qemu-devel@nongnu.org; Mon, 13 Jan 2020 11:52:52 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:29467
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>) id 1ir2xP-0002dd-A4
 for qemu-devel@nongnu.org; Mon, 13 Jan 2020 11:52:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578934370;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aMdo1wOtw0AUHtaJJOx3BZVfGkwJnaWPpBBLWH/oYbY=;
 b=BayeHc/0NYX0pjmjPDUycgoWKSdLHcaSYF1FBHeSeuvsgdtpSIPnKeNFyXihp9wLsWQneM
 zBa5dg8OAZRPu7drysZ5VO/0PnYuIpqfcv7F9D0gkRF54Lv1aSA4OI/e2ookFnyp9+G/ll
 xFGk47djS9HR3f9kyX2b1yykDRbxLlE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-304-wqJLrmS5OGqafTEy_NeWnA-1; Mon, 13 Jan 2020 11:52:13 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C2B041005512;
 Mon, 13 Jan 2020 16:52:11 +0000 (UTC)
Received: from gondolin (dhcp-192-245.str.redhat.com [10.33.192.245])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D74FC60BE2;
 Mon, 13 Jan 2020 16:52:10 +0000 (UTC)
Date: Mon, 13 Jan 2020 17:52:08 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v2 1/1] s390x/event-facility.c: remove unneeded labels
Message-ID: <20200113175208.0115a7a4.cohuck@redhat.com>
In-Reply-To: <20200108144607.878862-1-danielhb413@gmail.com>
References: <20200108144607.878862-1-danielhb413@gmail.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: wqJLrmS5OGqafTEy_NeWnA-1
X-Mimecast-Spam-Score: 0
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
Cc: Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed,  8 Jan 2020 11:46:07 -0300
Daniel Henrique Barboza <danielhb413@gmail.com> wrote:

> 'out' label from write_event_mask() and and write_event_data()

s/and and/and/

> can be replaced by 'return'.
> 
> The 'out' label from read_event_data() can also be replaced.
> However, as suggested by Cornelia Huck, instead of simply
> replacing the 'out' label, let's also change the code flow
> a bit to make it clearer that sccb events are always handled
> regardless of the mask for unconditional reads, while selective
> reads are handled if the mask is valid.
> 
> CC: Cornelia Huck <cohuck@redhat.com>
> CC: Thomas Huth <thuth@redhat.com>
> CC: Halil Pasic <pasic@linux.ibm.com>
> CC: Christian Borntraeger <borntraeger@de.ibm.com>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
> 
> This is the v2 of patch 37 sent in the series:
> 
> https://patchwork.kernel.org/cover/11319771/
> 
> after this review from Cornelia:
> 
> https://patchwork.kernel.org/patch/11319847/#23088037
> 
>  hw/s390x/event-facility.c | 33 ++++++++++++---------------------
>  1 file changed, 12 insertions(+), 21 deletions(-)

Thanks, applied.


