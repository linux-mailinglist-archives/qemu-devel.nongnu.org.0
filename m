Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F433447CBB
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 10:25:03 +0100 (CET)
Received: from localhost ([::1]:59638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mk0ti-0005FE-7T
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 04:25:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mk0s8-0004Da-LY
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 04:23:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22147)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mk0s5-0002fH-8Q
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 04:23:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636363399;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jY49A9KzArywxc8ARPL90BOT1FsANf+mwu+Rl9lhuJA=;
 b=RTy0jcYqMtqadS2ILStD8Ix8ynIGsYyxGz1wnuwsxRHVRXoghJgFyRZqTsfBZZwY5Zc/CX
 bQ+ljrFnlr7/OMNlu61MdqLJBQmWOSVAnuTdvwco1kN1tAzMcSm5TJiWbYEDC5F38t4AVi
 8g6b4rfJap2eVM7gyyp46pLVxGvlBuw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-168-j9LTbE5vNkCGataQSyFO1g-1; Mon, 08 Nov 2021 04:23:09 -0500
X-MC-Unique: j9LTbE5vNkCGataQSyFO1g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C1ED4104ECFD;
 Mon,  8 Nov 2021 09:23:07 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.176])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0E17D19729;
 Mon,  8 Nov 2021 09:22:52 +0000 (UTC)
Date: Mon, 8 Nov 2021 09:22:50 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PULL 0/6] Egl 20211105 patches
Message-ID: <YYjsatU4ENpazt29@redhat.com>
References: <20211105113043.4059361-1-kraxel@redhat.com>
 <9221f39f-32ca-094b-c526-82fdbf99a588@linaro.org>
 <c97aefa2-4686-b339-4d07-f801ac6e5de1@amsat.org>
 <1b641554-f983-a86f-3512-c109779f6d73@amsat.org>
 <cc48fcc7-4408-be45-7081-335b98c1ce6f@ilande.co.uk>
 <4733e0d7-a108-e444-e640-0d5dd7644943@amsat.org>
MIME-Version: 1.0
In-Reply-To: <4733e0d7-a108-e444-e640-0d5dd7644943@amsat.org>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
Cc: Thomas Huth <thuth@redhat.com>, Dongwon Kim <dongwon.kim@intel.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Nov 08, 2021 at 09:17:19AM +0100, Philippe Mathieu-Daudé wrote:
> +Thomas & Daniel for Travis-CI
> 
> On 11/8/21 09:12, Mark Cave-Ayland wrote:
> > On 05/11/2021 18:49, Philippe Mathieu-Daudé wrote:
> >> On 11/5/21 19:26, Philippe Mathieu-Daudé wrote:
> >>> On 11/5/21 18:13, Richard Henderson wrote:
> >>>> On 11/5/21 7:30 AM, Gerd Hoffmann wrote:
> >>>>> The following changes since commit
> >>>>> b1fd92137e4d485adeec8e9f292f928ff335b76c:
> >>>>>
> >>>>>     Merge remote-tracking branch 'remotes/bonzini/tags/for-upstream'
> >>>>> into staging (2021-11-03 13:07:30 -0400)
> >>>>>
> >>>>> are available in the Git repository at:
> >>>>>
> >>>>>     git://git.kraxel.org/qemu tags/egl-20211105-pull-request
> >>>>>
> >>>>> for you to fetch changes up to
> >>>>> 1350ff156b25be65c599ecca9957ce6726c6d383:
> >>>>>
> >>>>>     ui/gtk-egl: blitting partial guest fb to the proper scanout
> >>>>> surface
> >>>>> (2021-11-05 12:29:44 +0100)
> >>>>>
> >>>>> ----------------------------------------------------------------
> >>>>> gtk: a collection of egl fixes.
> >>>>>
> >>>>> ----------------------------------------------------------------
> >>>>>
> >>>>> Dongwon Kim (6):
> >>>>>     virtio-gpu: splitting one extended mode guest fb into n-scanouts
> >>>>>     ui/gtk-egl: un-tab and re-tab should destroy egl surface and
> >>>>> context
> >>>>>     ui/gtk-egl: make sure the right context is set as the current
> >>>>>     ui/gtk-egl: guest fb texture needs to be regenerated when
> >>>>>       reinitializing egl
> >>>>>     ui/gtk: gd_draw_event returns FALSE when no cairo surface is bound
> >>>>>     ui/gtk-egl: blitting partial guest fb to the proper scanout
> >>>>> surface
> >>>>>
> >>>>>    include/hw/virtio/virtio-gpu.h        |  5 +++--
> >>>>>    include/ui/console.h                  |  4 ++++
> >>>>>    hw/display/virtio-gpu-udmabuf-stubs.c |  3 ++-
> >>>>>    hw/display/virtio-gpu-udmabuf.c       | 22 ++++++++++++++--------
> >>>>>    hw/display/virtio-gpu.c               |  4 ++--
> >>>>>    ui/egl-helpers.c                      | 25
> >>>>> +++++++++++++++++++++----
> >>>>>    ui/gtk-egl.c                          | 10 ++++++++++
> >>>>>    ui/gtk.c                              | 23 +++++++++++++++++++++++
> >>>>>    8 files changed, 79 insertions(+), 17 deletions(-)
> >>>>
> >>>> Applied, thanks.
> >>>
> >>> Ubuntu 18.04.4 LTS:
> >>>
> >>> ui/gtk-egl.c:159:13: error: implicit declaration of function
> >>> 'egl_dmabuf_release_texture' is invalid in C99
> >>> [-Werror,-Wimplicit-function-declaration]
> >>>              egl_dmabuf_release_texture(vc->gfx.guest_fb.dmabuf);
> >>>              ^
> >>> ui/gtk-egl.c:159:13: error: this function declaration is not a prototype
> >>> [-Werror,-Wstrict-prototypes]
> >>> 2 errors generated.
> >>>
> >>> https://app.travis-ci.com/gitlab/qemu-project/qemu/builds/241272737
> >>>
> >>
> >> This seems to fix but I have no clue whether it is correct:
> >>
> >> -- >8 --
> >> diff --git a/ui/gtk-egl.c b/ui/gtk-egl.c
> >> index f2026e4b5c9..45cb67712df 100644
> >> --- a/ui/gtk-egl.c
> >> +++ b/ui/gtk-egl.c
> >> @@ -156,8 +156,10 @@ void gd_egl_refresh(DisplayChangeListener *dcl)
> >>               surface_gl_create_texture(vc->gfx.gls, vc->gfx.ds);
> >>           }
> >> +#ifdef CONFIG_GBM
> >>           if (vc->gfx.guest_fb.dmabuf) {
> >>               egl_dmabuf_release_texture(vc->gfx.guest_fb.dmabuf);
> >>               gd_egl_scanout_dmabuf(dcl, vc->gfx.guest_fb.dmabuf);
> >>           }
> >> +#endif
> >>       }
> >>
> >> ---
> > 
> > I see the same error here trying to build QEMU git master on Debian
> > Buster (oldstable). The fix looks reasonable to me in that it matches
> > the CONFIG_GBM guards around other similar functions and the resulting
> > binary appears to work, so:
> > 
> > Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> 
> Thank you, I'll post a formal patch then.
> 
> I wonder why this got merged while this configuration is covered in
> Travis-CI. Is it that we have a too high failure rate than we don't
> use it anymore?

I've not looked at travis in ages what matters is GitLab CI, and there
the problem is that we're building ubuntu 20.04 not 18.04 so didn't
catch the older problem.

I don't know what Mark sees a problem on Debian Buster though, as we
successfully built there AFAICT

   https://gitlab.com/qemu-project/qemu/-/jobs/1756202449

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


