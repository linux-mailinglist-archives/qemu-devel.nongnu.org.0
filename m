Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 320684B9C1F
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 10:37:19 +0100 (CET)
Received: from localhost ([::1]:54102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKdDx-0000BS-LD
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 04:37:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nKcuB-0007q9-Gv
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 04:16:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nKcu8-0000lW-Vc
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 04:16:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645089406;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=HyXfisScbKDuOqvZ5VSh9zSxmqCW7Fysbh6HUUwoEow=;
 b=XAmDOwpWRE6LVTbObaQR8413Np6WbTNL+Y3NEgUWzLyN+l8QPX+qWJ6o2BoLX3X9Rc50xQ
 jD9n2h6bxmEuUvDfvGpLoXlJ6LHvzRxNJpORzd/m0xwEeNJmmdzTRx9sSIeS9xSS7ol29v
 juafEx1k3KdKPZAzhXk79mHw96WoqJ4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-470-F9-TtWDEPwu6wRm9zEMM0A-1; Thu, 17 Feb 2022 04:16:43 -0500
X-MC-Unique: F9-TtWDEPwu6wRm9zEMM0A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 159C42F51;
 Thu, 17 Feb 2022 09:16:42 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.132])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BB8C97B14A;
 Thu, 17 Feb 2022 09:16:39 +0000 (UTC)
Date: Thu, 17 Feb 2022 09:16:36 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH 3/3] x86: Switch to q35 as the default machine type
Message-ID: <Yg4SdD7wMuB7KwEA@redhat.com>
References: <20220215162537.605030-1-dgilbert@redhat.com>
 <20220215162537.605030-4-dgilbert@redhat.com>
 <YgvtLmoJcv+ZSW1S@redhat.com>
 <20220216105808.77kqhmsagz3ej74h@sirius.home.kraxel.org>
 <YgzZhHKSAFYTYFDc@work-vm>
 <db583712-cd6e-d67d-ad98-989a9867499a@redhat.com>
 <Yg03HB5KHGYWyI0J@work-vm>
 <f5ea8b34-2d50-c0d7-4ec0-ff0921dbcbd4@redhat.com>
 <20220217080852.omqkckc5i2lav7gb@sirius.home.kraxel.org>
 <20220217031311-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20220217031311-mutt-send-email-mst@kernel.org>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Cc: eduardo@habkost.net, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, quintela@redhat.com, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 17, 2022 at 03:17:04AM -0500, Michael S. Tsirkin wrote:
> On Thu, Feb 17, 2022 at 09:08:52AM +0100, Gerd Hoffmann wrote:
> >   Hi,
> > 
> > > Other heretic question: Should we maybe get rid of the default machine type
> > > for *all* targets? ... so that we do not continue to run into this issue
> > > again and again and again...
> > 
> > /me votes "yes".
> > 
> > take care,
> >   Gerd
> 
> Well originally qemu tried to be friendly and to just create
> a reasonable machine when given a disk, to the point where
> it would even set up some networking by default.
> 
> And I think it's not a bad idea, forcing everyone to specify a bunch of
> boilerplate does not really result in people researching which machine
> type is good for them, people instead just copy paste from a random
> website.
> 
> So maybe we can detect that basic usage somehow (I only have some
> vague ideas) and then set a bunch of defaults that we consider
> best?

The "basic usage" is the majority of people using QEMU directly,
as opposed to via a MGMT app. As I pointed out elserwhere in this
thread, changing the machine type in QEMU won't have any effect
on apps using libvirt, since libvirt explicitly override's QEMU's
default. So with that in mind, this proposed QEMU level defaults
change is primarily going to impact the basic usage, as those
people aren't using libvirt. IOW, to avoid impacting basic usage
don't change the default in current QEMU binaries at all.


Separately, we've got active work going on to try to eliminate
the need for QemuOpts and enable entirely QAPI based runtime
configuration. That is intending to start off by adding new system
emulator binaries targetted exclusively at machine usage, to avoid
impacting back compat of existing binaries wrt human usage. That
will likely eliminate the notion of a default machine entirely,
because you'll be required to issue a QMP command to select a
machine as one of the very first config steps.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


