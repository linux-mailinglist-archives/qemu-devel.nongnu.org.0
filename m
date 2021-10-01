Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B0241E96E
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 11:12:00 +0200 (CEST)
Received: from localhost ([::1]:49526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWEaF-0007zJ-Dw
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 05:11:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mWEX8-0003qx-IS
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 05:08:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20779)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mWEX4-0002iR-Ny
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 05:08:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633079321;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=PrVZofCcfa67fs4N3t0NNeTpuNnAl3CeaqnGyhcboqc=;
 b=P0QDntJFHryuIcfIbx7/fQF2K2Tgs9JVNaHJEzS3eV7x7GbZgIS2fywSHM7cMQzQuOLxBT
 GOQUleBRgzNKAcFONYiw0yPFdT0nFfOVK3t5BfCmK9tTUoeHqCzaUzOA7rd85In+yOhfvY
 r8NtWEKuwYmQiM56FCR0t8sm08OPxRU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-268-ce18OlleMiWBEZF-9VqLPg-1; Fri, 01 Oct 2021 05:08:39 -0400
X-MC-Unique: ce18OlleMiWBEZF-9VqLPg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6AB0418414A2;
 Fri,  1 Oct 2021 09:08:38 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.28])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 74E6560936;
 Fri,  1 Oct 2021 09:08:36 +0000 (UTC)
Date: Fri, 1 Oct 2021 10:08:33 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 3/3] dtc: Update to version 1.6.1
Message-ID: <YVbQERWD9fY0kxxW@redhat.com>
References: <20210827120901.150276-1-thuth@redhat.com>
 <20210827120901.150276-4-thuth@redhat.com>
 <7004c933-5262-3119-80f5-722a8e858046@redhat.com>
MIME-Version: 1.0
In-Reply-To: <7004c933-5262-3119-80f5-722a8e858046@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Cc: Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 30, 2021 at 09:10:12AM +0200, Thomas Huth wrote:
> On 27/08/2021 14.09, Thomas Huth wrote:
> > The dtc submodule is currently pointing to non-release commit. It's nicer
> > if submodules point to release versions instead and since dtc 1.6.1 is
> > available now, let's update to that version.
> > 
> > Signed-off-by: Thomas Huth <thuth@redhat.com>
> > ---
> >   dtc | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/dtc b/dtc
> > index 85e5d83984..b6910bec11 160000
> > --- a/dtc
> > +++ b/dtc
> > @@ -1 +1 @@
> > -Subproject commit 85e5d839847af54efab170f2b1331b2a6421e647
> > +Subproject commit b6910bec11614980a21e46fbccc35934b671bd81
> 
> Ping!
> 
> David, could you please pick up this patch if you don't mind it?

Most of our supported platforms don't have version 1.6.1 available.

As a general goal IMHO we should be seeking to eliminate bundling of
3rd party modules that are commonly available in distros. We've
carried dtc for a hell of a long time, and if we keep updating our
submodule we'll keep relyin on new features, and never be able to
drop it because it will always be newer than what's in the distros.

So personally I think we should never again update dtc and capstone
modules. If we want to take adbantage of new features, then do that
through conditional compilation, as we do for any of the other 3rd
party libraries consumed.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


