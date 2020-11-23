Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75CBA2C0ECF
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 16:30:11 +0100 (CET)
Received: from localhost ([::1]:41230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khDn8-0005Rh-Ih
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 10:30:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1khDlw-0004dU-FO
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 10:28:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1khDls-0001gl-CG
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 10:28:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606145331;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nIcu4Sw0Xiji/aDZDq5g78frK7BXA++imxnrL3zCtts=;
 b=SYV7pJEU2tJllHocjR1BTMICr05vE6IsJTTyaH5I5uRV0qcfymU8w2rox1xWluFMTxHhXa
 5pTbKSFdqo3tYOvAJAhOvd1T8d1YntdqBx4FK7ICboOAiTK9WiqJLHUSRAusQCmuxXPzZT
 6DrFP/d7AKFCWjE/GLcXZHVgzQnzFpg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-172-tOWWz0d9NOC-8H9wvVqaGQ-1; Mon, 23 Nov 2020 10:28:48 -0500
X-MC-Unique: tOWWz0d9NOC-8H9wvVqaGQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 46E8A1F764;
 Mon, 23 Nov 2020 15:28:47 +0000 (UTC)
Received: from redhat.com (ovpn-115-103.ams2.redhat.com [10.36.115.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B336410013BD;
 Mon, 23 Nov 2020 15:28:42 +0000 (UTC)
Date: Mon, 23 Nov 2020 15:28:39 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Stefan Weil <sw@weilnetz.de>
Subject: Re: Regressions in build process introduced since August
Message-ID: <20201123152839.GJ987095@redhat.com>
References: <97b04446-ca94-cebd-2d8d-4c2013521208@weilnetz.de>
 <20201117175030.eqz5run2m7qmx5qt@steredhat>
 <a6c8de1a-da41-1a4a-8907-790c2467a0b0@redhat.com>
 <ee31c6f2-19dd-f3f6-d916-f04490909dd8@weilnetz.de>
 <d69b024e-9762-2b27-b558-0c60b3e96811@weilnetz.de>
 <53da03f4-f044-fb1d-9a1a-a793077cccc3@redhat.com>
 <496e409e-533a-74fb-c4f7-8b394452d0be@weilnetz.de>
MIME-Version: 1.0
In-Reply-To: <496e409e-533a-74fb-c4f7-8b394452d0be@weilnetz.de>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Nov 23, 2020 at 03:40:48PM +0100, Stefan Weil wrote:
> Am 23.11.20 um 14:55 schrieb Paolo Bonzini:
> 
> > On 21/11/20 12:09, Stefan Weil wrote:
> > > --- a/meson.build
> > > +++ b/meson.build
> > > @@ -649,9 +649,8 @@ if get_option('vnc').enabled()
> > >     vnc = declare_dependency() # dummy dependency
> > >     png = dependency('libpng', required: get_option('vnc_png'),
> > >                      method: 'pkg-config', static: enable_static)
> > > -  jpeg = cc.find_library('jpeg', has_headers: ['jpeglib.h'],
> > > -                         required: get_option('vnc_jpeg'),
> > > -                         static: enable_static)
> > 
> > Does it work if you just remove "static: enable_static"?  That asks
> > Meson to look explicitly for a ".a" file instead of just adding a
> > "-ljpeg" flag.  However it is not what configure used to do so it
> > shouldn't be necessary.
> 
> 
> No, that does not help. Neither header file nor library will be found in my
> cross environment without using the provided --extra-cflags and
> --extra-ldflags, because all those files are installed below
> /usr/i686-w64-mingw32/sys-root/mingw or
> /usr/x86_64-w64-mingw32/sys-root/mingw which is not searched by the default
> compiler settings. The Meson checks obviously don't use those flags.
> 
> pkg-config provides the right paths and works therefore.

Relying on pkg-config should be our strong preference. I expect we're doing
the old fashioned library check just for historical reasons, but even RHEL-7
supports pkg-config for libjpeg. So I think we're safe to just unconditionally
rely on pkg-config these days and thus have it "just work" for cross compiles
too.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


