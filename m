Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB53D10C440
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Nov 2019 08:12:04 +0100 (CET)
Received: from localhost ([::1]:45928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iaDy7-0002PQ-B7
	for lists+qemu-devel@lfdr.de; Thu, 28 Nov 2019 02:12:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51386)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1iaDwA-0001ql-AF
 for qemu-devel@nongnu.org; Thu, 28 Nov 2019 02:10:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1iaDw8-0000UG-FA
 for qemu-devel@nongnu.org; Thu, 28 Nov 2019 02:10:01 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:60820
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1iaDw8-0000QC-3q
 for qemu-devel@nongnu.org; Thu, 28 Nov 2019 02:10:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574924999;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fymywbYk5ISIXwbIYhoqDueFAMQz9dazgP4FMeJJQ7M=;
 b=OFq9L8AAVHHARXm2NLPTq0J9MaPAqE0hqTlasdvKeONmeYxp1g/KP5mqnIJpmWLueKNQ7A
 iTm5d7kOHkRkUl+6jpWzIoMH/JI0NiFltacKCw0oI6RCxilRWATq0OPEOdilD8SSL07Veo
 Jr2/4/kJoQjCKRiAiiQPeMxTU0F1rNY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-59-3nWBmFiIM1-lt1PQFXBAhA-1; Thu, 28 Nov 2019 02:09:55 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 84E56800D41;
 Thu, 28 Nov 2019 07:09:53 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-116-114.ams2.redhat.com [10.36.116.114])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3469A10013A7;
 Thu, 28 Nov 2019 07:09:48 +0000 (UTC)
Subject: Re: [PATCH v4 4/6] s390x: Move clear reset
To: Janosch Frank <frankja@linux.ibm.com>, qemu-devel@nongnu.org
References: <20191127175046.4911-1-frankja@linux.ibm.com>
 <20191127175046.4911-5-frankja@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <09cf076b-f554-8694-0331-077b452ca3be@redhat.com>
Date: Thu, 28 Nov 2019 08:09:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191127175046.4911-5-frankja@linux.ibm.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: 3nWBmFiIM1-lt1PQFXBAhA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: pmorel@linux.ibm.com, david@redhat.com, cohuck@redhat.com,
 borntraeger@de.ibm.com, qemu-s390x@nongnu.org, mihajlov@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 27/11/2019 18.50, Janosch Frank wrote:
> Let's also move the clear reset function into the reset handler.
> 
> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
> ---
>   target/s390x/cpu-qom.h |  1 +
>   target/s390x/cpu.c     | 58 +++++++++++++-----------------------------
>   2 files changed, 18 insertions(+), 41 deletions(-)

I really wonder why we had so much duplicated code here before and 
nobody dared to clean it up in all those years... Thanks for doing that now!

Reviewed-by: Thomas Huth <thuth@redhat.com>


