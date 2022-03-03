Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E9BF4CB9CF
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 10:06:33 +0100 (CET)
Received: from localhost ([::1]:37918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPhPr-0007S2-Gp
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 04:06:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nPhKF-0005gP-2w
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 04:00:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48408)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nPhKB-0002mn-A4
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 04:00:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646298037;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Wi61Gn0vgJuzdcSZOIa37Lh2ix0HhsrPrgy42I8x5rk=;
 b=L88YO8dH4aCp7YYxF0FTbX1entWFOafjSiWrz2GON79V2CovJ3b8FmH7LVz2uCaxoJq3VW
 gNTVZ8G6DkcZ646xFzYvoAnbB1j4SFR/rBFvZDI1VhrFZrePV9rtM/eCFRCiajzDyN78m1
 ofX33ZR/7Aazxg0/oVyqs+X+xsf7TAg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-44-GlSDWKH-NKSublcRglp5Og-1; Thu, 03 Mar 2022 04:00:32 -0500
X-MC-Unique: GlSDWKH-NKSublcRglp5Og-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6785A801DDB;
 Thu,  3 Mar 2022 09:00:31 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.83])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EA796105958D;
 Thu,  3 Mar 2022 08:59:55 +0000 (UTC)
Date: Thu, 3 Mar 2022 08:59:52 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH] deprecation: x86 default machine types
Message-ID: <YiCDiKqxyE+dXNUz@redhat.com>
References: <20220301195432.114252-1-dgilbert@redhat.com>
 <Yh+sbYC5n4DsZWWg@redhat.com> <Yh/HzPymVWPZpVaf@work-vm>
MIME-Version: 1.0
In-Reply-To: <Yh/HzPymVWPZpVaf@work-vm>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: eduardo@habkost.net, libvir-list@redhat.com, thuth@redhat.com,
 qemu-devel@nongnu.org, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 02, 2022 at 07:38:52PM +0000, Dr. David Alan Gilbert wrote:
> * Daniel P. Berrangé (berrange@redhat.com) wrote:
> > On Tue, Mar 01, 2022 at 07:54:32PM +0000, Dr. David Alan Gilbert (git) wrote:
> > > From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> > > 
> > > Declare the intent to require a machine type to be specified on x86
> > > system emulation.
> > > 
> > > Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> > > ---
> > >  docs/about/deprecated.rst | 8 ++++++++
> > >  1 file changed, 8 insertions(+)
> > > 
> > > diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
> > > index 85773db631..143c60d105 100644
> > > --- a/docs/about/deprecated.rst
> > > +++ b/docs/about/deprecated.rst
> > > @@ -324,6 +324,14 @@ machine is hardly emulated at all (e.g. neither the LCD nor the USB part had
> > >  been implemented), so there is not much value added by this board. Use the
> > >  ``ref405ep`` machine instead.
> > >  
> > > +x86 default machine type
> > > +''''''''''''''''''''''''
> > > +
> > > +x86 currently defaults to the ```pc``` machine type which is based on the very
> > > +old ```i440fx``` chipset.  This default will be removed and the user will be
> > > +required to specify a machine type explicitly using -M; users are encouraged to
> > > +switch to the not quite as old ```q35``` machine types.
> > 
> > This will have no impact on anyone using libvirt as a mgmt app,
> > because it will explicitly set 'pc' if the user doesn't request
> > a machine type.
> > 
> > It will, however, break a huge number of users who don't use
> > libvirt or a similar mgmt app.
> > 
> > 'q35' is not a drop in replacement for 'pc', and even though
> > it is slightly newer, the features it brings are not likely
> > to be important enough for most users who aren't using a mgmt
> > app to care about switching.
> 
> I can see it having advantages for those who do things like PCIe pass
> through of graphics cards.
> However, my main concern is that there's a split happening where
> downstream we're working primarily on q35 but a lot of people still use
> i440fx; eventually that split will mean the i440fx users will have a
> pretty bad experience instability/features.
> So I'd like to encourage them onto a35.

We've still got quite significant testing coverage of i440fx and outside
of PCI-Express much logic is shared with q35. Right now at least i440fx
feels mature and stable, while q35 is still showing significant
instability with PCI-Express and hotplug in particular. I'd hoppe at
least the combination of maturity of our plain PCI code and testing
coverage would address risk of significant regressions in i440fx even
when attention is on q35. 

> > In the ongoing work to introduce a completely new system
> > emulator binary that is exclusively runtime QMP configured,
> > the machine type will almost certainly be mandatory, without
> > affecting existing users. That would also apply consistently
> > across all target arches.
> 
> I'm assuming that will also cause the disruption to those end users.

The difference is that people would opt-in to usage of the new system
binaries. So existing users, scripts and documentation won't be impacted
unless they decide to switch - at least as long as we keep the old
system emulators around. If did eventually decide to remove the old
binaries, then there would be disruption but that's more of a clean
break with the past.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


