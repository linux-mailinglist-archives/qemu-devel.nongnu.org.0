Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C90A300516
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 15:16:29 +0100 (CET)
Received: from localhost ([::1]:55676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2xEi-0002dj-1z
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 09:16:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l2xAf-0006mv-L9
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 09:12:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36541)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l2xAb-0006hZ-0s
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 09:12:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611324730;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=Z/dZ98GRzsCjBGleFz8D8jGZ2GPr7o5JHxZIT40FeuQ=;
 b=KzN7Gw1KJq+dPrRmf5AjSM4QeHwEox3H/DDpvzVpRPfxHuMdA/kW0WOy0BthkfG3BAtgs7
 e+4Hs9Fy1HLEOf98lkMJZzbCXfr+c6XfwjJsM2F+LK3TpKQ+BN06QED8AhJ2nUsdJFIy4Z
 263OxhmilcX6w+SwvVsWLwthHN5Ob+M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-199-GAtBQt-ANYysGxibil3Ryw-1; Fri, 22 Jan 2021 09:12:03 -0500
X-MC-Unique: GAtBQt-ANYysGxibil3Ryw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B9A9B1005C83
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 14:11:55 +0000 (UTC)
Received: from redhat.com (ovpn-115-108.ams2.redhat.com [10.36.115.108])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 963755DA2D;
 Fri, 22 Jan 2021 14:11:54 +0000 (UTC)
Date: Fri, 22 Jan 2021 14:11:51 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Laszlo Ersek <lersek@redhat.com>
Subject: Re: [PATCH] vnc: drop vnc_colordepth() call.
Message-ID: <20210122141151.GF3150238@redhat.com>
References: <20210122085525.3827724-1-kraxel@redhat.com>
 <450c366a-d6a8-8a23-aad7-54eadd444b5e@redhat.com>
MIME-Version: 1.0
In-Reply-To: <450c366a-d6a8-8a23-aad7-54eadd444b5e@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.182,
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 22, 2021 at 02:54:24PM +0100, Laszlo Ersek wrote:
> Hi Gerd,
> 
> On 01/22/21 09:55, Gerd Hoffmann wrote:
> > With gtk-vnc (which supports VNC_FEATURE_WMVI) this results in
> > sending a VNC_ENCODING_WMVi message to the client.  Which in turn
> > seems to make gtk-vnc respond with another non-incremental update
> > request.  Hello endless loop ...
> >
> > Drop the call.
> >
> > Fixes: 9e1632ad07ca ("vnc: move initialization to framebuffer_update_request")
> > Reported-by: Laszlo Ersek <lersek@redhat.com>
> > Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> > ---
> >  ui/vnc.c | 1 -
> >  1 file changed, 1 deletion(-)
> >
> > diff --git a/ui/vnc.c b/ui/vnc.c
> > index d429bfee5a65..0a3e2f4aa98c 100644
> > --- a/ui/vnc.c
> > +++ b/ui/vnc.c
> > @@ -2041,7 +2041,6 @@ static void framebuffer_update_request(VncState *vs, int incremental,
> >      } else {
> >          vs->update = VNC_STATE_UPDATE_FORCE;
> >          vnc_set_area_dirty(vs->dirty, vs->vd, x, y, w, h);
> > -        vnc_colordepth(vs);
> >          vnc_desktop_resize(vs);
> >          vnc_led_state_change(vs);
> >          vnc_cursor_define(vs);
> >
> 
> while this patch has some effect, it does not fix the issue.
> 
> * With the gvncviewer binary I mentioned before, there is no change in
> behavior -- initial screen shown, no updates then, and finally
> connection dropped:
> 
> > Connected to server
> > Remote desktop size changed to 800x480
> > Connection initialized
> > Error: Failed to flush data
> > Disconnected from server
> 
> * With virt-manager, there is a before-after difference: the screen is
> now *flashing*, between actual content and a black void. Meanwhile the
> VNC client is still spinning.
> 
> * If I pass "--gtk-vnc-debug" to "gvncviewer", the following log snippet
> keeps repeating:
> 
> > src/vncconnection.c Emit main context 8
> > src/vncconnection.c Re-requesting framebuffer update at 0,0 size 640x480, incremental 0
> > src/vncconnection.c Num rects 1
> > src/vncconnection.c FramebufferUpdate type=-223 area (640x480) at location 0,0
> > src/vncconnection.c Desktop resize w=640 h=480
> > src/vncconnection.c Emit main context 5
> > src/vncdisplay.c Framebuffer size / format unchanged, skipping recreate
> > src/vncconnection.c Requesting framebuffer update at 0,0 size 640x480, incremental 0
> > src/vncconnection.c Num rects 1
> > src/vncconnection.c FramebufferUpdate type=-261 area (1x1) at location 0,0
> > src/vncconnection.c LED state: 0

If gtk-vnc sees an update with a psuedo encoding it will re-request the
last framebuffer update message.

In this case it had a fb update request with incremental==0 pending, so
when seeing the pesudo encoding it re-request incremental==0 again. This
triggers a loop in QEMU, because QEMU is unconditionally sending these
psuedo-encodings when every non-incremental update.

Once gtk-vnc receives a non-psuedo encoding update, it wil switch to
using incremental==1.


The problem is this QEMU code above is sending the psuedo encodings
synchronously upon getting the framebuffer update request, and so
putting gtk-vnc into a loop, as QEMU nevers gets around to sending
the actual framebuffer data which we're expecting.

QEMU needs to only send these psuedo encodings if they reflect something
which has changed on the server, rather than sending them unconditionally
on every non-incremental update. 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


