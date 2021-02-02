Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB1F130C6C3
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 17:59:35 +0100 (CET)
Received: from localhost ([::1]:34570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6z1a-0004SR-Ot
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 11:59:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l6ytW-00076V-Ez
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 11:51:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56163)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l6ytT-0001oc-7V
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 11:51:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612284669;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=GuPKgOxhT6QDdBLMh+A6wZczYQeEbWATxdhpFLqaMhs=;
 b=ahH54mtQPFekQEguC+p/kan7HwS4n9Lplr82rwmr2zYqyB4wBnaIvWO7qofJb/1SYYGNjA
 0yIBBuCqw6tk9W5k1q0W6dCKBceROJazSmO5Mtg+4BLDvyo6vSKCC7asgcCdf3F9fnL/vg
 AvXI9V/BI2EFWMEQznffYq8atN1Z0lM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-131-wGecj0a8PtCtxT_1FTHbeg-1; Tue, 02 Feb 2021 11:51:05 -0500
X-MC-Unique: wGecj0a8PtCtxT_1FTHbeg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6BC9A195D561;
 Tue,  2 Feb 2021 16:51:04 +0000 (UTC)
Received: from redhat.com (ovpn-112-202.ams2.redhat.com [10.36.112.202])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A4CD760C5F;
 Tue,  2 Feb 2021 16:51:02 +0000 (UTC)
Date: Tue, 2 Feb 2021 16:50:59 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: macOS (Big Sur, Apple Silicon) 'make check' fails in
 test-crypto-tlscredsx509
Message-ID: <20210202165059.GQ4168502@redhat.com>
References: <0de4a2a8-577d-a46e-3a66-1f9a9e589a4d@weilnetz.de>
 <20210127165330.GT3653144@redhat.com>
 <72e44724-94ca-43f0-aea1-2554c43cc4c3@weilnetz.de>
 <20210127181731.GX3653144@redhat.com>
 <27c01eba-ebc1-9b8e-d7ea-38ad9b4350d9@weilnetz.de>
 <20210127185917.GB3653144@redhat.com>
 <YBPKtL3reYFm7bgy@SPB-NB-133.local>
 <20210129095327.GC4001740@redhat.com>
 <YBjg7ubtbw3OeQCd@SPB-NB-133.local>
 <6d360ded-f8b6-d08b-b4fc-af8c52554a58@redhat.com>
MIME-Version: 1.0
In-Reply-To: <6d360ded-f8b6-d08b-b4fc-af8c52554a58@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Stefan Weil <sw@weilnetz.de>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Alexander Graf <agraf@csgraf.de>, QEMU Developers <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 02, 2021 at 08:50:24AM -0600, Eric Blake wrote:
> On 2/1/21 11:19 PM, Roman Bolshakov wrote:
> 
> > After a session of debugging I believe there's an issue with Clang 12.
> > Here's a test program (it reproduces unexpected ASN1_VALUE_NOT_VALID
> > from _asn1_time_der() in libtasn1):
> > 
> > #include <stdio.h>
> > 
> > static int func2(char *foo) {
> >         fprintf(stderr, "%s:%d foo: %p\n", __func__, __LINE__, foo);
> >         if (foo == NULL) {
> >                 fprintf(stderr, "%s:%d foo: %p\n", __func__, __LINE__, foo);
> >                 return 1;
> >         }
> >         return 0;
> > }
> > 
> > int func1(char *foo) {
> >         int counter = 0;
> >         if (fprintf(stderr, "IO\n") > 0)
> >                 counter += 10;
> >         fprintf(stderr, "%s:%d foo: %p counter %d\n", __func__, __LINE__, foo, counter);
> >         if(!func2(foo + counter)) {
> 
> This line has unspecified behavior in the C standard.  Adding an integer
> to a pointer is only well-specified if the pointer is to an array and
> the integer is within the bounds or the slot just past the array.  But
> since you called func1(NULL), foo is NOT pointing to an array, and
> therefore foo+counter points to garbage, and the compiler is free to
> optimize it at will.
> 
> >                 fprintf(stderr, "good\n");
> >                 return 0;
> >         } else {
> >                 fprintf(stderr, "broken\n");
> >                 return 1;
> >         }
> > }
> > 
> > int main() {
> >         char *foo = NULL;
> >         return func1(foo);
> > }
> > 
> > 
> > What return value would you expect from the program?
> 
> Because the code is not strictly compliant to the C standard, I'm not
> sure what to expect.

Roman invented this example to illustrate the problem with libtasn1,
so I wonder if this suggests that libtasn1 is relying on undefined
C behaviour too.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


