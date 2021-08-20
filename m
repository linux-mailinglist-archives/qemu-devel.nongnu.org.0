Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B3153F290D
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Aug 2021 11:23:39 +0200 (CEST)
Received: from localhost ([::1]:39578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mH0kU-00020u-59
	for lists+qemu-devel@lfdr.de; Fri, 20 Aug 2021 05:23:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mH0iz-0001KP-T1
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 05:22:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22931)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mH0it-0005Pe-6B
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 05:22:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629451316;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cir5oSRgW2bfvVerudJt7wmHlnf7fJEuciOiIQszryw=;
 b=hUEgR/S07HlVL/BRm3U1E+rMs2J/yVM5dS+iXLceIbub2WYlfrqERwe6616SWYGPbAznSN
 SByvM88is5pnJ50K0ejCosYCFeAPNB27Fhy2Z+xp+0whKuZzuh/KfWoy/UqG7Y9Zi8ZrCp
 mAF/7YaQmCK/S6B/cc2IR501/bJp7Eo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-264-Nj78eOYDPQit8Lr1dmru6Q-1; Fri, 20 Aug 2021 05:21:51 -0400
X-MC-Unique: Nj78eOYDPQit8Lr1dmru6Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1DE2F94EE0
 for <qemu-devel@nongnu.org>; Fri, 20 Aug 2021 09:21:51 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.176])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2C86F60C13;
 Fri, 20 Aug 2021 09:21:45 +0000 (UTC)
Date: Fri, 20 Aug 2021 10:21:42 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Hanna Reitz <hreitz@redhat.com>
Subject: Re: [qemu-web PATCH] Add a blog post about FUSE block exports
Message-ID: <YR90Jm6jne6gzDA6@redhat.com>
References: <20210819102501.69638-1-hreitz@redhat.com>
 <YR6FauCbECxehubc@stefanha-x1.localdomain>
 <46a68d5c-cfc1-e521-8c6b-90eb74c85ede@redhat.com>
MIME-Version: 1.0
In-Reply-To: <46a68d5c-cfc1-e521-8c6b-90eb74c85ede@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Aug 20, 2021 at 09:56:54AM +0200, Hanna Reitz wrote:
> On 19.08.21 18:23, Stefan Hajnoczi wrote:
> > On Thu, Aug 19, 2021 at 12:25:01PM +0200, Hanna Reitz wrote:
> > > This post explains when FUSE block exports are useful, how they work,
> > > and that it is fun to export an image file on its own path so it looks
> > > like your image file (in whatever format it was) is a raw image now.
> > > 
> > > Signed-off-by: Hanna Reitz <hreitz@redhat.com>
> > > ---
> > > You can also find this patch here:
> > > https://gitlab.com/hreitz/qemu-web fuse-blkexport-v1
> > > 
> > > My first patch to qemu-web, so I hope I am not doing anything overly
> > > stupid here (adding SVGs with extremely long lines comes to mind)...
> > > ---
> > >   _posts/2021-08-18-fuse-blkexport.md       | 488 ++++++++++++++++++++++
> > >   screenshots/2021-08-18-block-graph-a.svg  |   2 +
> > >   screenshots/2021-08-18-block-graph-b.svg  |   2 +
> > >   screenshots/2021-08-18-block-graph-c.svg  |   2 +
> > >   screenshots/2021-08-18-block-graph-d.svg  |   2 +
> > >   screenshots/2021-08-18-block-graph-e.svg  |   2 +
> > >   screenshots/2021-08-18-root-directory.svg |   2 +
> > >   screenshots/2021-08-18-root-file.svg      |   2 +
> > >   8 files changed, 502 insertions(+)
> > >   create mode 100644 _posts/2021-08-18-fuse-blkexport.md
> > >   create mode 100644 screenshots/2021-08-18-block-graph-a.svg
> > >   create mode 100644 screenshots/2021-08-18-block-graph-b.svg
> > >   create mode 100644 screenshots/2021-08-18-block-graph-c.svg
> > >   create mode 100644 screenshots/2021-08-18-block-graph-d.svg
> > >   create mode 100644 screenshots/2021-08-18-block-graph-e.svg
> > >   create mode 100644 screenshots/2021-08-18-root-directory.svg
> > >   create mode 100644 screenshots/2021-08-18-root-file.svg
> > Great! Two ideas:
> > 
> > It would be nice to include a shoutout to libguestfs and mention that
> > libguestfs avoids exposing the host kernel's file systems and partion
> > code to untrusted disk images. If you don't mount the image then the
> > FUSE export has similar security properties.
> 
> Oh, right!  Absolutely.
> 
> Though now I do wonder why one would actually want to use QEMU’s FUSE
> exports then...

If you can't use KVM for libguestfs, then performance likely to
suffer significantly. This could be either if your disk image
is non-native architecture, or if your running inside a VM and
don't have nested KVM avaialble. You do still need to bear in
mind the security implications of course, but QEMU FUSE might
be your only viable option to achieve the performance needed.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


