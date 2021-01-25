Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24D9630261D
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 15:13:46 +0100 (CET)
Received: from localhost ([::1]:53494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l42ch-0000po-6C
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 09:13:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l42bP-0000OU-Me
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 09:12:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20722)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l42bN-0003Qv-VT
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 09:12:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611583941;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=BLO/deXFXXfTeqFgDMjkPVOfKb0Ug51Ti4vfnS/FBcg=;
 b=gyDxSQQ6tXQFcuU615m/C6ARdkmVUh+TBYnfZvJVSlZN9bZDgyM5Uy/sqFHGNPpVC3kUx5
 UBGkmHOSQkZiARhKXaQU1dCLjdX23g/vEl08iypPMNq6Pc8fMjmGczFwAeQj5mfiJF6WLK
 H2QbsfniFEpVG+2VKeJMEl29bOgjJz8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-191-1Aj5OMO2PI-EQRt3eyUsXA-1; Mon, 25 Jan 2021 09:12:16 -0500
X-MC-Unique: 1Aj5OMO2PI-EQRt3eyUsXA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 77697107ACE4
 for <qemu-devel@nongnu.org>; Mon, 25 Jan 2021 14:12:15 +0000 (UTC)
Received: from redhat.com (ovpn-114-9.ams2.redhat.com [10.36.114.9])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5D9785D71D;
 Mon, 25 Jan 2021 14:12:03 +0000 (UTC)
Date: Mon, 25 Jan 2021 14:12:00 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 11/25] remove -writeconfig
Message-ID: <20210125141200.GH3527172@redhat.com>
References: <20210118163113.780171-1-pbonzini@redhat.com>
 <20210118163113.780171-12-pbonzini@redhat.com>
 <87y2ghfa8u.fsf@dusky.pond.sub.org>
 <70b3a8fd-8f54-8eeb-3f9d-be731d9367ac@redhat.com>
MIME-Version: 1.0
In-Reply-To: <70b3a8fd-8f54-8eeb-3f9d-be731d9367ac@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
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
Cc: kwolf@redhat.com, imammedo@redhat.com,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 25, 2021 at 03:01:01PM +0100, Paolo Bonzini wrote:
> On 25/01/21 13:53, Markus Armbruster wrote:
> > I love the "and how give me a config file for all that" idea, but I
> > agree our -writeconfig is flawed.  I hope we can bring it back in more
> > useful shape.
> > 
> > No deprecation grace period?
> > 
> 
> That's a decision that we have to take overall once the whole series is
> reviewed, I think.  I have no problem having a grace period:

I'm normally in strongly pushing for honouring our deprecation policy,
but in almost all past cases we're changing/removing something that is
genuinely used by people in the real world.

I think it is possible to argue that -writeconfig is a special case
becuase its functionality is so limited in scope that its real world
use cases are fairly niche, and is majorly buggy in what it writes
in some cases. IOW we could argue it is too broken + useless to justify
going through the deprecation process.

So overall I'm ambivalent on whether we use deprecation for -writeconfig
or not.

> 
> - the patches aren't 101% ready
> 
> - the real conflict magnets have been merged already
> 
> - I have a large KVM backlog so I don't mind leaving this aside for a few
> months



Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


