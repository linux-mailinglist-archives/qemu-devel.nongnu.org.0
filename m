Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D8B4B9CA5
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 11:01:54 +0100 (CET)
Received: from localhost ([::1]:56668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKdbk-0005Og-Pi
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 05:01:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nKd6k-0005HK-7M
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 04:29:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nKd6d-0002is-0f
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 04:29:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645090181;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aW4kazNGTJFif+22NDas8WbDqc8usJZ/aFtXgYXWlpc=;
 b=SCq5Fm71dvbBW8UHb9LRmTvj/IScL8P6746CYmCEpKsEa32Hzl4ezdUNkfOfL0o33Ee915
 PMeWRG5P2rJv2Q1IeMzkHqckC+nM59GbS5w6zw8HOsvdMi3940nJUvW1Y6/nt56O24xrpg
 iCXWvD6faC6ycDwj+o46wtC6giukV0M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-624-YZXMdFMAMBGOXne07pt6eA-1; Thu, 17 Feb 2022 04:29:34 -0500
X-MC-Unique: YZXMdFMAMBGOXne07pt6eA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1D1A31091DA0;
 Thu, 17 Feb 2022 09:29:33 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.132])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8ECC64F87F;
 Thu, 17 Feb 2022 09:29:15 +0000 (UTC)
Date: Thu, 17 Feb 2022 09:29:13 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH 3/3] x86: Switch to q35 as the default machine type
Message-ID: <Yg4VaTuXWME0LQUP@redhat.com>
References: <20220215162537.605030-1-dgilbert@redhat.com>
 <20220215162537.605030-4-dgilbert@redhat.com>
 <YgvtLmoJcv+ZSW1S@redhat.com>
 <20220216105808.77kqhmsagz3ej74h@sirius.home.kraxel.org>
 <YgzZhHKSAFYTYFDc@work-vm>
 <db583712-cd6e-d67d-ad98-989a9867499a@redhat.com>
 <Yg03HB5KHGYWyI0J@work-vm> <Yg042JzxCjgF2siM@redhat.com>
 <Yg067jLmVM4aIFIq@work-vm>
MIME-Version: 1.0
In-Reply-To: <Yg067jLmVM4aIFIq@work-vm>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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
Cc: eduardo@habkost.net, Thomas Huth <thuth@redhat.com>, mst@redhat.com,
 quintela@redhat.com, qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 16, 2022 at 05:57:02PM +0000, Dr. David Alan Gilbert wrote:
> * Daniel P. Berrangé (berrange@redhat.com) wrote:
> > On Wed, Feb 16, 2022 at 05:40:44PM +0000, Dr. David Alan Gilbert wrote:
> > > * Thomas Huth (thuth@redhat.com) wrote:
> > > > On 16/02/2022 12.01, Dr. David Alan Gilbert wrote:
> > > > > * Gerd Hoffmann (kraxel@redhat.com) wrote:
> > > > > >    Hi,
> > > > > > > Given the semantic differences from 'i440fx', changing the default
> > > > > > > machine type has effects that are equivalent to breaking command
> > > > > > > line syntax compatibility, which is something we've always tried
> > > > > > > to avoid.
> > > > > > 
> > > > > > And if we are fine breaking backward compatibility I'd rather *not* pick
> > > > > > a default, effectively making -M $something mandatory, similar to arm.
> > > > > 
> > > > > Oh, that's probably easy to do;  what are other peoples thoughts on
> > > > > that?
> > > > 
> > > > I agree with Gerd. Getting rid of a default machine on x86 is likely better
> > > > than silently changing it to q35. But I'd maybe say that this should go
> > > > through the deprecation process first?
> > > 
> > > So just adding something like the following under 'System emulator
> > > machines':
> > > 
> > > x86 default machine type
> > > ------------------------
> > > 
> > > x86 currently defaults to the very old ```pc``` machine type
> > > which is based on the very old ```i440f``` chipset.  This default
> > > will be removed and the user will be required to specify a machine
> > > type explicitly using -M; users are encouraged to switch to the
> > > not quite as old ```q35``` machine types.
> > > 
> > > 
> > > (This option is going to take a lot more work switching all the
> > > test cases over; in my world here I'd only changed the tests that broke
> > > on q35, now everything is going to need to specify a type).
> > 
> > ....which is still nothing compared to how many users will be impacted
> > and the docs all over the internet we'll never be able to change, which
> > give illustrations using qemu command lines without '-M pc'
> 
> What's your prreference - it sounds like you'd prefer to leave the
> default as 'pc' ?

Yes.

> aarch's message is:
> qemu-system-aarch64: No machine specified, and there is no default
> Use -machine help to list supported machines
> 
> We could add a:
> 'Use -machine pc for the old default behaviour'

Does this really serve to benefit our users though ? As noted, this
will have no benefit to any mgmt app using libvirt, as it'll still
explicitly set 'pc' by default. So we only impact basic users who
are relying on QEMU's built-in defaults.

It feels like the arguments for removing the machine type default
apply equally to other aspects of QEMU defaults. ie lets make
-cpu, -accel, -m, -smp, and -display mandatory too, since the
defaults might not be right for some users ?

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


