Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32CA739B9A1
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 15:16:19 +0200 (CEST)
Received: from localhost ([::1]:57392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lp9gQ-0007RE-AT
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 09:16:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lp9fQ-0006dL-Ay
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 09:15:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25558)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lp9fH-0001ZN-OX
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 09:15:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622812505;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Kby6XJJsLGihjNrIfnXNOp6dMP5PaCQZvLwkEq+d/RY=;
 b=eyl44w8SHr/tJh/LWA4ZMZxmpYLc4jLmuX83U0FwSZJb9TNCQJ6tFFum2VJkRxUKdYI/+h
 rply45kuV3MjRPTICv1le0uOTNi7xYXggFMqIKwzxYFwVFydEU9Iy0sx2dvIqNInFGL/Nm
 52dZAoa5A8/4pI4yOyura0XHR7T0a5A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-590-a1wuv932MESq0yQirwER1A-1; Fri, 04 Jun 2021 09:14:59 -0400
X-MC-Unique: a1wuv932MESq0yQirwER1A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EB3EA801817;
 Fri,  4 Jun 2021 13:14:58 +0000 (UTC)
Received: from redhat.com (ovpn-114-239.ams2.redhat.com [10.36.114.239])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2E8EB5E26F;
 Fri,  4 Jun 2021 13:14:56 +0000 (UTC)
Date: Fri, 4 Jun 2021 14:14:54 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH] vnc: avoid deprecation warnings for SASL on OS X
Message-ID: <YLonThBK4yhIEgfL@redhat.com>
References: <20210604120915.286195-1-pbonzini@redhat.com>
 <155dcb87-c6ab-de58-e2cd-c6bfb478c56b@amsat.org>
MIME-Version: 1.0
In-Reply-To: <155dcb87-c6ab-de58-e2cd-c6bfb478c56b@amsat.org>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jun 04, 2021 at 03:07:05PM +0200, Philippe Mathieu-Daudé wrote:
> On 6/4/21 2:09 PM, Paolo Bonzini wrote:
> > Apple has deprecated sasl.h functions in OS X 10.11.  Therefore,
> > all files that use SASL API need to disable -Wdeprecated-declarations.
> > Remove the only use that is outside vnc-auth-sasl.c and add the
> > relevant #pragma GCC diagnostic there.
> > 
> > Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> > ---
> >  ui/vnc-auth-sasl.c | 20 ++++++++++++++++++++
> >  ui/vnc-auth-sasl.h |  1 +
> >  ui/vnc.c           | 10 ++--------
> >  3 files changed, 23 insertions(+), 8 deletions(-)
> > 
> > diff --git a/ui/vnc-auth-sasl.c b/ui/vnc-auth-sasl.c
> > index df7dc08e9f..cf65a0b161 100644
> > --- a/ui/vnc-auth-sasl.c
> > +++ b/ui/vnc-auth-sasl.c
> > @@ -28,10 +28,30 @@
> >  #include "vnc.h"
> >  #include "trace.h"
> >  
> > +/*
> > + * Apple has deprecated sasl.h functions in OS X 10.11.  Therefore,
> > + * files that use SASL API need to disable -Wdeprecated-declarations.
> > + */
> > +#ifdef CONFIG_DARWIN
> > +#pragma GCC diagnostic warning "-Wdeprecated-declarations"
> > +#endif
> > +
> >  /* Max amount of data we send/recv for SASL steps to prevent DOS */
> >  #define SASL_DATA_MAX_LEN (1024 * 1024)
> >  
> >  
> > +bool vnc_sasl_server_init(Error **errp)
> > +{
> > +    int saslErr = sasl_server_init(NULL, "qemu");
> 
> What is the plan once these functions are removed for the
> distribution? Is there a replacement or should we start warning
> the users here and in docs/system/deprecated.rst VNC/SASL will
> go away soon?

VNC/SASL isn't going anywhere. It is fully supported on Linux and a
critically important security feature.

If macOS removes SASL, that sucks for macOS users, but then in that case I
assume HomeBrew/MacPorts would bring it back to life, because SASL is an
important feature for many apps.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


