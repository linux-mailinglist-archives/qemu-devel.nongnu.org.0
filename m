Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC093368E7B
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 10:08:43 +0200 (CEST)
Received: from localhost ([::1]:35600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZqrj-0001pX-0c
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 04:08:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lZqqO-0001FY-1P
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 04:07:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23689)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lZqqM-0001xn-NC
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 04:07:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619165237;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=koqNnQ0jFW9/Uw30gNgHh2j5lZ9HDk1l8UEl1//TM7I=;
 b=G4ByZi6OqkgMWm5gzWlXq23IWz9Wt3pJ0rffA4JRhp+y7fnSSTWJEU5/ARGz4lakRXr22V
 mr9fWd/nK1bhKdHoaE/+FvhzinMx1UPUAYD+GuUEo9K5Ic+TQv2559qrBpVa9XBI5iKcJM
 I6Kv4KvBEMglXx0y5AcPQWyWD5YUhz4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-408-0wuFOzZnOuCZZXvrYxPKgw-1; Fri, 23 Apr 2021 04:07:14 -0400
X-MC-Unique: 0wuFOzZnOuCZZXvrYxPKgw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3F0E0881D6D;
 Fri, 23 Apr 2021 08:07:13 +0000 (UTC)
Received: from gondolin.fritz.box (ovpn-113-167.ams2.redhat.com
 [10.36.113.167])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1B1A9690F4;
 Fri, 23 Apr 2021 08:07:10 +0000 (UTC)
Date: Fri, 23 Apr 2021 10:07:08 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: Compiling the s390-ccw bios with clang (was: Re: s390-ccw:
 warning: writing 1 byte into a region of size 0)
Message-ID: <20210423100708.262eeaf0.cohuck@redhat.com>
In-Reply-To: <8abfb851-a5d2-8608-fe96-2eb3014adb96@redhat.com>
References: <YIFMt+xg+xH+M4rd@redhat.com>
 <CAFEAcA8r2k9f=XG6T_hYk542-dDJnR7Lr8DZnyc=SFgnzNYxxQ@mail.gmail.com>
 <089df242-8788-a162-4a75-4c9c9e04a64e@redhat.com>
 <8afd0f34-7e75-2661-9ea5-3ebadff3b85d@redhat.com>
 <2ec6e995-6833-1ebd-03c8-a3fede7fddb8@de.ibm.com>
 <e4116908-7172-fd9c-1837-82c489b61620@redhat.com>
 <c95369e4-ffc9-d01d-45c1-4daad0ead6a5@redhat.com>
 <20210422155238.kak7tl3xnup5vod7@steredhat>
 <da8f7353-8e2a-82f9-c324-18321649ccb5@redhat.com>
 <fb127bc3-aa4a-dc04-484a-d747c3aa503e@redhat.com>
 <20210423064001.fjouibdcwadtgijy@steredhat>
 <b167616b-1908-1a76-a2af-35b87c05d570@de.ibm.com>
 <8abfb851-a5d2-8608-fe96-2eb3014adb96@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Cc: Peter Maydell <peter.maydell@linaro.org>, "Daniel P.
 =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>,
 Janosch Frank <frankja@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 qemu-s390x <qemu-s390x@nongnu.org>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 23 Apr 2021 09:57:08 +0200
Thomas Huth <thuth@redhat.com> wrote:

> On 23/04/2021 08.52, Christian Borntraeger wrote:
> [...]
> > We can of course discuss if we compile the BIOS for z10 instead of z900. TCG
> > in the mean time can handle up to z13 and z10 is now also 13 years old.  
> 
> I'd really like to see us supporting Clang in the s390-ccw bios, too, since 
> it provides additional useful compiler warnings ... but switching the -mz900 
> to -mz10 here also means that we could not boot VMs anymore that use a CPU 
> that is older than the z10...

We could still boot a kernel/initrd directly, couldn't we?

> 
> Is anybody still using such old CPUs? Should we maybe deprecate all CPUs 
> that are older than the z10 in QEMU? Alternatively, we could try to detect 
> Clang in the Makefile, and only use -mz10 in that case and continue to use 
> -mz900 in the other case...?

So, the issue with clang is that it compiles to at least a z10, right?
Any other issues we know about?


