Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED1A2CEE5E
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 13:52:34 +0100 (CET)
Received: from localhost ([::1]:58608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klAZd-0004R1-18
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 07:52:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1klAY5-00040q-3P
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 07:50:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37062)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1klAY2-0005WY-AV
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 07:50:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607086253;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=heQmBSzrVwhsMoGM044mLY8vUYLOaw4CKi568bQJ0cg=;
 b=X9csL8/cnIVV4FrFMUpC0l2QiP6VV+NoD86e45/t0O/G1cvYbn2VGDbgvyHOJwWp/Ahrjd
 2e6x1lzAIdr2IqPree0jfVS9BTXOMpHUyrqOIUM4fy7QPbWJBYmDiD4QnEP1Ej60RGTdCI
 EpcJNAPUwsh+N/pg+zFlR7Q6s3JVlJs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-155-shOMTOEbMeClecBjkQOvqA-1; Fri, 04 Dec 2020 07:50:48 -0500
X-MC-Unique: shOMTOEbMeClecBjkQOvqA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 73E6310054FF;
 Fri,  4 Dec 2020 12:50:47 +0000 (UTC)
Received: from redhat.com (ovpn-115-10.ams2.redhat.com [10.36.115.10])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 47B676085A;
 Fri,  4 Dec 2020 12:50:43 +0000 (UTC)
Date: Fri, 4 Dec 2020 12:50:40 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>
Subject: Re: [PATCH 9/9] qxl: add ui_info callback
Message-ID: <20201204125040.GH3056135@redhat.com>
References: <20201203110806.13556-1-kraxel@redhat.com>
 <20201203110806.13556-10-kraxel@redhat.com>
 <20201204122020.GF3056135@redhat.com>
 <CAJ+F1CLSxNrsXYik4u=HJav5tUdYbHVAUqBf58ym_BVbZsNfBA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ+F1CLSxNrsXYik4u=HJav5tUdYbHVAUqBf58ym_BVbZsNfBA@mail.gmail.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Dec 04, 2020 at 04:45:41PM +0400, Marc-André Lureau wrote:
> On Fri, Dec 4, 2020 at 4:21 PM Daniel P. Berrangé <berrange@redhat.com>
> wrote:
> 
> > On Thu, Dec 03, 2020 at 12:08:05PM +0100, Gerd Hoffmann wrote:
> > > This makes qxl respond to user interface window resizes
> > > when not using spice, so it works with gtk and vnc too.
> > >
> > > Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> > > ---
> > >  hw/display/qxl.c | 27 +++++++++++++++++++++++++++
> > >  1 file changed, 27 insertions(+)
> > >
> > > diff --git a/hw/display/qxl.c b/hw/display/qxl.c
> > > index 431c1070967a..e1df95c3e8a9 100644
> > > --- a/hw/display/qxl.c
> > > +++ b/hw/display/qxl.c
> > > @@ -1177,8 +1177,35 @@ static const QXLInterface qxl_interface = {
> > >      .client_monitors_config = interface_client_monitors_config,
> > >  };
> > >
> > > +static int qxl_ui_info(void *opaque, uint32_t idx, QemuUIInfo *info)
> > > +{
> > > +    PCIQXLDevice *qxl = opaque;
> > > +    VDAgentMonitorsConfig *cfg;
> > > +    size_t size;
> > > +
> > > +    if (using_spice) {
> > > +        /* spice agent will handle display resize */
> > > +        return -1;
> > > +    }
> >
> > Does this break VNC resizes if  both  VNC + SPICE are enabled
> > but the client is connected with VNC ?
> >
> 
> Yes. I am not sure we should worry about that case much, either way.
> Perhaps it's best to handle both QEMU-originated resize and spice-agent
> based resizes, even if the former can lose details from the later for
> multiple screens.

Or at least worth  comment to say that we're intentionally breaking
VNC resizes when both are enabled.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


