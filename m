Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B2C6A0C66
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 16:01:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVD5S-0001Oc-HE; Thu, 23 Feb 2023 10:00:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pVD5H-0001LD-E7
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 10:00:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pVD5C-0000Jj-8V
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 10:00:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677164425;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=mfYARXRw4ptBDtwqUyuAu9I1gF2BykipjJne1/yUgdE=;
 b=iuSWxbNJkrKWo6Qa7qShFd3H4dmE6TbF3kWukPINS9twZS+E8iT23Te/kwDRiqW61CUPQi
 448APZpraZMLHbpiRETzUoRQFOdZ40ZWl/Lb0PwSrYdkjBm29EHTbz/7mHYptOww50yz2D
 /i8565Wbl0+BxO2O64zUvfsfifiD2KI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-382-GFxelGdfMiCJzorc6t8XPA-1; Thu, 23 Feb 2023 10:00:24 -0500
X-MC-Unique: GFxelGdfMiCJzorc6t8XPA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BE1EA886065;
 Thu, 23 Feb 2023 15:00:23 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.113])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AF5F82026D4B;
 Thu, 23 Feb 2023 15:00:22 +0000 (UTC)
Date: Thu, 23 Feb 2023 15:00:19 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Warner Losh <imp@bsdimp.com>
Cc: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: out of CI pipeline minutes again
Message-ID: <Y/d/g8A5gG+Bb2kc@redhat.com>
References: <CAFEAcA83u_ENxDj3GJKa-xv6eLJGJPr_9FRDKAqm3qACyhrTgg@mail.gmail.com>
 <3e1f9f5f-c4ec-d13d-7f88-df741a63f747@redhat.com>
 <CANCZdfr8Cm4d-Z64tqO92-ThZzq4YyLhhfbqC4tn5qkGc5sA7w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANCZdfr8Cm4d-Z64tqO92-ThZzq4YyLhhfbqC4tn5qkGc5sA7w@mail.gmail.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Feb 23, 2023 at 07:15:47AM -0700, Warner Losh wrote:
> On Thu, Feb 23, 2023, 6:48 AM Thomas Huth <thuth@redhat.com> wrote:
> 
> > On 23/02/2023 13.56, Peter Maydell wrote:
> > > Hi; the project is out of gitlab CI pipeline minutes again.
> > > In the absence of any other proposals, no more pull request
> > > merges will happen til 1st March...
> >
> > I'd like to propose again to send a link along with the pull request that
> > shows that the shared runners are all green in the fork of the requester.
> > You'd only need to check the custom runners in that case, which hopefully
> > still work fine without CI minutes?
> >
> > It's definitely more cumbersome, but maybe better than queuing dozens of
> > pull requests right in front of the soft freeze?
> >
> 
> Yea. I'm just getting done with my pull request and it's really
> demotivating to be done early and miss the boat...

Send your pull request anyway, so it is in the queue to be handled.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


