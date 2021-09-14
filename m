Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5376C40B034
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 16:04:23 +0200 (CEST)
Received: from localhost ([::1]:46162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ92s-0001H1-Ei
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 10:04:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQ8y1-0004XS-0R
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 09:59:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQ8xx-0004DM-PS
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 09:59:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631627956;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=ndIpCjw3VtAflO7tnCFxFmPwsz9ZKUgjHj5H1mD57NY=;
 b=L0df7gnFPczUvfCChaiH7mKSCN7vB5mzJg9L/AapiGLiTI/oXl4ytIu7gSd5f+k1Nq5ZxD
 U/4mX0VvYAJ/KsP5XvtDAwfmOGyzcrIOvm6WlpVXTqeuLuri4ORwkwcliZktj2ycRaUq47
 Vkaj5tUNSsb2gR0HiqJ7TgyjTzqstJQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-19-k2q3j07PMXG07rXL0jt2gw-1; Tue, 14 Sep 2021 09:59:15 -0400
X-MC-Unique: k2q3j07PMXG07rXL0jt2gw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 150D3801E72;
 Tue, 14 Sep 2021 13:59:14 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.47])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5436F19736;
 Tue, 14 Sep 2021 13:58:59 +0000 (UTC)
Date: Tue, 14 Sep 2021 14:58:56 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH] virtio-balloon: Fix page-poison subsection name
Message-ID: <YUCqoJzt8VjkcNin@redhat.com>
References: <20210914131716.102851-1-dgilbert@redhat.com>
 <535891c6-237b-6d37-7492-ef8c1e19e6ca@redhat.com>
 <YUCj3i2BK1HzuztT@work-vm>
MIME-Version: 1.0
In-Reply-To: <YUCj3i2BK1HzuztT@work-vm>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: Alexander Duyck <alexander.duyck@gmail.com>, mst@redhat.com,
 qemu-devel@nongnu.org, stefanha@redhat.com,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Sep 14, 2021 at 02:30:06PM +0100, Dr. David Alan Gilbert wrote:
> * David Hildenbrand (david@redhat.com) wrote:
> > On 14.09.21 15:17, Dr. David Alan Gilbert (git) wrote:
> > > From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> > > 
> > > The subsection name for page-poison was typo'd as:
> > > 
> > >    vitio-balloon-device/page-poison
> > > 
> > > Note the missing 'r' in virtio.
> > > 
> > > When we have a machine type that enables page poison, and the guest
> > > enables it (which needs a new kernel), things fail rather unpredictably.
> > > 
> > > The fallout from this is that most of the other subsections fail to
> > > load, including things like the feature bits in the device, one
> > > possible fallout is that the physical addresses of the queues
> > > then get aligned differently and we fail with an error about
> > > last_avail_idx being wrong.
> > > It's not obvious to me why this doesn't produce a more obvious failure,
> > > but virtio's vmstate loading is a bit open-coded.
> > > 
> > > Fixes: 7483cbbaf82 ("virtio-balloon: Implement support for page poison reporting feature")
> > > bz: https://bugzilla.redhat.com/show_bug.cgi?id=1984401
> > > Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> > > ---
> > >   hw/virtio/virtio-balloon.c | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/hw/virtio/virtio-balloon.c b/hw/virtio/virtio-balloon.c
> > > index 5a69dce35d..c6962fcbfe 100644
> > > --- a/hw/virtio/virtio-balloon.c
> > > +++ b/hw/virtio/virtio-balloon.c
> > > @@ -852,7 +852,7 @@ static const VMStateDescription vmstate_virtio_balloon_free_page_hint = {
> > >   };
> > >   static const VMStateDescription vmstate_virtio_balloon_page_poison = {
> > > -    .name = "vitio-balloon-device/page-poison",
> > > +    .name = "virtio-balloon-device/page-poison",
> > >       .version_id = 1,
> > >       .minimum_version_id = 1,
> > >       .needed = virtio_balloon_page_poison_support,
> > > 
> > 
> > Oh, that's very subtle. I wasn't even aware that the prefix really has to
> > match the actual device ... I thought the whole idea of the prefix here was
> > just to make the string unique ...
> 
> Subsection naming is *very* critical; the logic is something like:
>   'we're loading the X device'
> a subsection arrives for 'N/P'
> if 'X==N' then it looks in X for subsection P.
> If 'X!=N' then it assumes we've finished loading X
> and P is really for an outer device that X is part of.
> This is horrible.

Is there value in making this more explicit via a code convention
for .name field initializers. eg instead of

   .name = "virtio-balloon-device/page-poison",

Prefer

   .name = TYPE_VIRTIO_BALLOON "/page-poison"

?

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


