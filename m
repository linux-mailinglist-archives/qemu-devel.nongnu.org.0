Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9CF14398A7
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 16:32:27 +0200 (CEST)
Received: from localhost ([::1]:49810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mf11X-0005aq-0B
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 10:32:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mf0sR-00033K-KX
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 10:23:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59408)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mf0sP-0008Ks-9Z
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 10:23:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635171780;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=RnkpcjAXt0qYI+6Q2Vy/KeNXr0eeOj5cFAGj+04aMsU=;
 b=IkJ6WIJd+GiDNrUji74nx4+vWkAIdOsCom8CqHf6nKGKS5Dg88vqBqdjwu/+GCe3SmfqH0
 /Sbz9zOzXVj5INdYogbm/OtWR3R3jIZHTVOSb4pW78lpe5FZFot7Dsb1FuzN+vg/VEun26
 z6signMWt731ibH3KX4UjQeNGLN1fx0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-154-Q9UdFrvIMdCtu5rshUbrew-1; Mon, 25 Oct 2021 10:22:47 -0400
X-MC-Unique: Q9UdFrvIMdCtu5rshUbrew-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4F4BD10B3943;
 Mon, 25 Oct 2021 14:22:46 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.59])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 437435D9D5;
 Mon, 25 Oct 2021 14:22:43 +0000 (UTC)
Date: Mon, 25 Oct 2021 15:22:40 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Alexander Graf <agraf@csgraf.de>
Subject: Re: [PATCH v4] isa-applesmc: provide OSK forwarding on Apple hosts
Message-ID: <YXa9sCG+crLWnK29@redhat.com>
References: <20211022161448.81579-1-yaroshchuk2000@gmail.com>
 <394b94ad-3de6-2dfb-4aaf-344dcef8ec18@csgraf.de>
MIME-Version: 1.0
In-Reply-To: <394b94ad-3de6-2dfb-4aaf-344dcef8ec18@csgraf.de>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Phil Dennis-Jordan <phil@philjordan.eu>,
 Pedro =?utf-8?Q?To=CC=82rres?= <t0rr3sp3dr0@gmail.com>,
 Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>, suse@csgraf.de,
 f4bug@amsat.org, qemu-devel@nongnu.org, r.bolshakov@yadro.com,
 "Gabriel L. Somlo" <gsomlo@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Oct 25, 2021 at 12:13:32PM +0200, Alexander Graf wrote:
> 
> On 22.10.21 18:14, Vladislav Yaroshchuk wrote:
> > On Apple hosts we can read AppleSMC OSK key directly from host's
> > SMC and forward this value to QEMU Guest.
> > 
> > Usage:
> > `-device isa-applesmc,hostosk=on`
> > 
> > Apple licence allows use and run up to two additional copies
> > or instances of macOS operating within virtual operating system
> > environments on each Apple-branded computer that is already running
> > the Apple Software, for purposes of:
> > - software development
> > - testing during software development
> > - using macOS Server
> > - personal, non-commercial use
> > 
> > Guest macOS requires AppleSMC with correct OSK. The most legal
> > way to pass it to the Guest is to forward the key from host SMC
> > without any value exposion.
> > 
> > Based on https://web.archive.org/web/20200103161737/osxbook.com/book/bonus/chapter7/tpmdrmmyth/
> > 
> > Signed-off-by: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>


> > @@ -331,6 +464,25 @@ static void applesmc_isa_realize(DeviceState *dev, Error **errp)
> >       isa_register_ioport(&s->parent_obj, &s->io_err,
> >                           s->iobase + APPLESMC_ERR_PORT);
> > +    if (s->hostosk_flag) {
> > +        /*
> > +         * Property 'hostosk' has higher priority than 'osk'
> > +         * and shadows it.
> > +         * Free user-provided 'osk' property value
> > +         */
> > +        if (s->osk) {
> > +            warn_report("isa-applesmc.osk is shadowed "
> > +                        "by isa-applesmc.hostosk");
> > +            g_free(s->osk);
> > +        }
> > +
> > +        if (!applesmc_read_host_osk(&s->osk, &err)) {
> > +            /* On host OSK retrieval error report a warning */
> > +            error_report_err(err);
> > +            s->osk = default_osk;
> > +        }
> > +    }
> 
> 
> This part is yucky. A few things:
> 
> 1) QEMU in general does not fail user requested operations silently. If the
> user explicitly asked to read the host OSK and we couldn't, it must
> propagate that error.
> 2) In tandem to the above, I think the only consistent CX is to make both
> options mutually exclusive. The easiest way to achieve that IMHO would be to
> overload the "osk" property. If it is "host", then use the host one.
> 3) Should we make "osk"="host" the default on macOS as well then? Of course,
> that one should *not* fail hard when it can't read the key, because it's an
> implicit request rather than an explicit one.

The problem with using a magic string value for the existing "osk"
parameter is that this is not introspectable by management apps.

IMHO, using an explicit separate parameter is the right approach.

We just need to make sure we report an error properly via the
'Error **errp' parameter to this method instead of warn_report
or error_report_err, when the user gives a non-sensible combination,
or if reading the host value fails.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


