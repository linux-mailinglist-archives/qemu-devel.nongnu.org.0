Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D7219BEA6
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Apr 2020 11:28:42 +0200 (CEST)
Received: from localhost ([::1]:35958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jJw9S-0001Qj-2T
	for lists+qemu-devel@lfdr.de; Thu, 02 Apr 2020 05:28:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54209)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <cohuck@redhat.com>) id 1jJw8h-00010g-Lo
 for qemu-devel@nongnu.org; Thu, 02 Apr 2020 05:27:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1jJw8g-0003yf-KH
 for qemu-devel@nongnu.org; Thu, 02 Apr 2020 05:27:55 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:21723
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>) id 1jJw8g-0003xD-Gm
 for qemu-devel@nongnu.org; Thu, 02 Apr 2020 05:27:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585819673;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H75luzOZMfsPyKBO4YlaNeRz70OmZeQTfA6zTyx3MW0=;
 b=IrShmNHT56p6prlu/Oo4v3T47aWgECMjfE+z2Hu0HmPLCrTy/Ja3k5/qfFWOXgxCc6pXUS
 6BQh1Qllb2gpuxqDhgEuUcUXggk5l9KtWMRpExotgvxmGpYxXm9/AmX3C45zH3OaQ7OfLs
 RYIcttWYyAOToYayloK1AzJAJ32cyYw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-299-lvFnPMS8Mh-OlIGTetQejA-1; Thu, 02 Apr 2020 05:27:47 -0400
X-MC-Unique: lvFnPMS8Mh-OlIGTetQejA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1C0021409;
 Thu,  2 Apr 2020 09:27:46 +0000 (UTC)
Received: from gondolin (ovpn-113-176.ams2.redhat.com [10.36.113.176])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6236060BF3;
 Thu,  2 Apr 2020 09:27:38 +0000 (UTC)
Date: Thu, 2 Apr 2020 11:27:35 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH v3 1/1] vl/s390x: fixup ram sizes for compat machines
Message-ID: <20200402112735.6961297d.cohuck@redhat.com>
In-Reply-To: <20200401183456.09ba3540@redhat.com>
References: <20200401123754.109602-1-borntraeger@de.ibm.com>
 <20200401183456.09ba3540@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
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
Cc: =?UTF-8?B?THVrw6HFoQ==?= Doktor <ldoktor@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Janosch Frank <frankja@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 "Dr . David
 Alan Gilbert" <dgilbert@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 qemu-s390x <qemu-s390x@nongnu.org>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 1 Apr 2020 18:34:56 +0200
Igor Mammedov <imammedo@redhat.com> wrote:

> On Wed,  1 Apr 2020 08:37:54 -0400
> Christian Borntraeger <borntraeger@de.ibm.com> wrote:

> > +static ram_addr_t s390_fixup_ram_size(ram_addr_t sz)
> > +{
> > +    /* same logic as in sclp.c */
> > +    int increment_size = 20;
> > +    ram_addr_t newsz;
> > +
> > +    while ((sz >> increment_size) > MAX_STORAGE_INCREMENTS) {
> > +        increment_size++;
> > +    }
> > +    newsz = sz >> increment_size << increment_size;
> > +
> > +    if (sz != newsz) {
> > +        qemu_printf("Ram size %" PRIu64 "MB was fixed up to %" PRIu64  
>                                                    ^^^^^^^^
> 
> for unaware  user it could be confusing as it could be read as 'value was increased'
> s/fixed up/amended/ might be better

"rounded", perhaps?

> 
> > +                    "MB to match machine restrictions. Consider updating "
> > +                    "the guest definition.i\n", sz / MiB, newsz / MiB);  
> 
> also it might be better to use size_to_str() to format numbers

The text explicitly talks about 'MB'... not sure if it would be
confusing if the user specified MB and ended up with GB or so in this
message.

> 
> > +    }
> > +    return newsz;
> > +}
> > +

(If we can agree upon message and format, I'll happily fix that up when
applying.)


