Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E131A4B8FFB
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 19:17:01 +0100 (CET)
Received: from localhost ([::1]:42192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKOrM-00050g-KU
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 13:17:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nKOPr-0005GW-Me
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 12:48:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33279)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nKOPo-0002DE-Dz
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 12:48:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645033711;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=G5IPezS7qN1gZsRq7hb2cIwgL06zdqVhvqu5JoLVHLk=;
 b=RMVxSt2NjHtIKQi+/ClmKajrl3xOzh8qtLXAuadXEgCPPGnATq4BR0cDqr/4294H0zxL0/
 CbYRUgaFCtGXnrkoer2swW1576Br0ReoB268XVgwPYW10KZ5chFzkxaJlBS5R+S6oKxTdr
 ysEtg/ntqmHNSl2yFKgSvCF9i4D6P8U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-3-K5wWbHVTPbi8o_MHSZL8-w-1; Wed, 16 Feb 2022 12:48:28 -0500
X-MC-Unique: K5wWbHVTPbi8o_MHSZL8-w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7F9831091DA1;
 Wed, 16 Feb 2022 17:48:27 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.245])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8747C753F9;
 Wed, 16 Feb 2022 17:48:11 +0000 (UTC)
Date: Wed, 16 Feb 2022 17:48:08 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH 3/3] x86: Switch to q35 as the default machine type
Message-ID: <Yg042JzxCjgF2siM@redhat.com>
References: <20220215162537.605030-1-dgilbert@redhat.com>
 <20220215162537.605030-4-dgilbert@redhat.com>
 <YgvtLmoJcv+ZSW1S@redhat.com>
 <20220216105808.77kqhmsagz3ej74h@sirius.home.kraxel.org>
 <YgzZhHKSAFYTYFDc@work-vm>
 <db583712-cd6e-d67d-ad98-989a9867499a@redhat.com>
 <Yg03HB5KHGYWyI0J@work-vm>
MIME-Version: 1.0
In-Reply-To: <Yg03HB5KHGYWyI0J@work-vm>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
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
Cc: eduardo@habkost.net, Thomas Huth <thuth@redhat.com>, mst@redhat.com,
 quintela@redhat.com, qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 16, 2022 at 05:40:44PM +0000, Dr. David Alan Gilbert wrote:
> * Thomas Huth (thuth@redhat.com) wrote:
> > On 16/02/2022 12.01, Dr. David Alan Gilbert wrote:
> > > * Gerd Hoffmann (kraxel@redhat.com) wrote:
> > > >    Hi,
> > > > > Given the semantic differences from 'i440fx', changing the default
> > > > > machine type has effects that are equivalent to breaking command
> > > > > line syntax compatibility, which is something we've always tried
> > > > > to avoid.
> > > > 
> > > > And if we are fine breaking backward compatibility I'd rather *not* pick
> > > > a default, effectively making -M $something mandatory, similar to arm.
> > > 
> > > Oh, that's probably easy to do;  what are other peoples thoughts on
> > > that?
> > 
> > I agree with Gerd. Getting rid of a default machine on x86 is likely better
> > than silently changing it to q35. But I'd maybe say that this should go
> > through the deprecation process first?
> 
> So just adding something like the following under 'System emulator
> machines':
> 
> x86 default machine type
> ------------------------
> 
> x86 currently defaults to the very old ```pc``` machine type
> which is based on the very old ```i440f``` chipset.  This default
> will be removed and the user will be required to specify a machine
> type explicitly using -M; users are encouraged to switch to the
> not quite as old ```q35``` machine types.
> 
> 
> (This option is going to take a lot more work switching all the
> test cases over; in my world here I'd only changed the tests that broke
> on q35, now everything is going to need to specify a type).

....which is still nothing compared to how many users will be impacted
and the docs all over the internet we'll never be able to change, which
give illustrations using qemu command lines without '-M pc'

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


