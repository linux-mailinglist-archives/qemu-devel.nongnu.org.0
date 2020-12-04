Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4942CEDE8
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 13:17:35 +0100 (CET)
Received: from localhost ([::1]:34886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klA1m-0000xi-6V
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 07:17:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kl9zi-0008IC-Ns
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 07:15:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:36848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kl9zg-0001sQ-IN
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 07:15:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607084123;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=xHdHb8CCLns5X4putP5h0aiEmMAP2Hfu1yZbRmVtbik=;
 b=ZIzWzwm3ZJ0yjYKHd42+tu3N69YAadMZP77TKl3UqTfe9UO2cVeLNkAypeBHc7I4TeyaC0
 F3RfAVokcwSONjdnhvUxz9fB0HFMWwi1F+6nX3nbJFsfythuR4M+yC1LpZc6xO1PI6mIl4
 m1aZ8tHvNGAEjiOk8SUYiTekzbBTfio=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-542-ps1z1ozzPBu3VL-1KXXnTg-1; Fri, 04 Dec 2020 07:15:18 -0500
X-MC-Unique: ps1z1ozzPBu3VL-1KXXnTg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 15EBABBEE1
 for <qemu-devel@nongnu.org>; Fri,  4 Dec 2020 12:15:18 +0000 (UTC)
Received: from redhat.com (ovpn-115-10.ams2.redhat.com [10.36.115.10])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 546525D9CA;
 Fri,  4 Dec 2020 12:15:13 +0000 (UTC)
Date: Fri, 4 Dec 2020 12:15:11 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH 8/9] vnc: add support for extended desktop resize
Message-ID: <20201204121511.GE3056135@redhat.com>
References: <20201203110806.13556-1-kraxel@redhat.com>
 <20201203110806.13556-9-kraxel@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201203110806.13556-9-kraxel@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Dec 03, 2020 at 12:08:04PM +0100, Gerd Hoffmann wrote:
> The extended desktop resize encoding adds support for (a) clients
> sending resize requests to the server, and (b) multihead support.
> 
> This patch implements (a).  All resize requests are rejected by qemu.
> Qemu can't resize the framebuffer on its own, this is in the hands of
> the guest, so all qemu can do is forward the request to the guest.
> Should the guest actually resize the framebuffer we can notify the vnc
> client later with a separate message.
> 
> This requires support in the display device.  Works with virtio-gpu.
> 
> https://github.com/rfbproto/rfbproto/blob/master/rfbproto.rst#extendeddesktopsize-pseudo-encoding
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  ui/vnc.h |  2 ++
>  ui/vnc.c | 64 +++++++++++++++++++++++++++++++++++++++++++++++++++++++-
>  2 files changed, 65 insertions(+), 1 deletion(-)
> 
> diff --git a/ui/vnc.h b/ui/vnc.h
> index c8d3ad9ec496..77a310947bd6 100644
> --- a/ui/vnc.h
> +++ b/ui/vnc.h
> @@ -442,6 +442,7 @@ enum {
>  
>  enum VncFeatures {
>      VNC_FEATURE_RESIZE,
> +    VNC_FEATURE_RESIZE_EXT,
>      VNC_FEATURE_HEXTILE,
>      VNC_FEATURE_POINTER_TYPE_CHANGE,
>      VNC_FEATURE_WMVI,
> @@ -456,6 +457,7 @@ enum VncFeatures {
>  };
>  
>  #define VNC_FEATURE_RESIZE_MASK              (1 << VNC_FEATURE_RESIZE)
> +#define VNC_FEATURE_RESIZE_EXT_MASK          (1 << VNC_FEATURE_RESIZE_EXT)
>  #define VNC_FEATURE_HEXTILE_MASK             (1 << VNC_FEATURE_HEXTILE)
>  #define VNC_FEATURE_POINTER_TYPE_CHANGE_MASK (1 << VNC_FEATURE_POINTER_TYPE_CHANGE)
>  #define VNC_FEATURE_WMVI_MASK                (1 << VNC_FEATURE_WMVI)
> diff --git a/ui/vnc.c b/ui/vnc.c
> index bdaf384f71a4..a15132faa96f 100644
> --- a/ui/vnc.c
> +++ b/ui/vnc.c
> @@ -663,10 +663,35 @@ void vnc_framebuffer_update(VncState *vs, int x, int y, int w, int h,
>      vnc_write_s32(vs, encoding);
>  }
>  
> +static void vnc_desktop_resize_ext(VncState *vs, bool reject)
> +{
> +    vnc_lock_output(vs);
> +    vnc_write_u8(vs, VNC_MSG_SERVER_FRAMEBUFFER_UPDATE);
> +    vnc_write_u8(vs, 0);
> +    vnc_write_u16(vs, 1); /* number of rects */
> +    vnc_framebuffer_update(vs,
> +                           reject ? 1 : 0,
> +                           reject ? 3 : 0,

So there are a number of reject reasons defined

Code 	Description
0 	No error
1 	Resize is administratively prohibited
2 	Out of resources
3 	Invalid screen layout

none of them is an ideal fit, because we are actually attempting
to honour the request, but it is asynchronous so we can't
confirm this to the client yet.

I feel like we could propose a new reason 4 to the spec, since
it explicitly allows for adding new reasons

  "Request under consideration"

to make it clear this is not actually an invalid layout.

This can be useful for clients to decide how they want to
handle the failure.

> +                           vs->client_width, vs->client_height,
> +                           VNC_ENCODING_DESKTOP_RESIZE_EXT);
> +    vnc_write_u8(vs, 1);  /* number of screens */
> +    vnc_write_u8(vs, 0);  /* padding */
> +    vnc_write_u8(vs, 0);  /* padding */
> +    vnc_write_u8(vs, 0);  /* padding */
> +    vnc_write_u32(vs, 0); /* screen id */
> +    vnc_write_u16(vs, 0); /* screen x-pos */
> +    vnc_write_u16(vs, 0); /* screen y-pos */
> +    vnc_write_u16(vs, vs->client_width);
> +    vnc_write_u16(vs, vs->client_height);
> +    vnc_write_u32(vs, 0); /* screen flags */
> +    vnc_unlock_output(vs);
> +    vnc_flush(vs);
> +}
>  
>  static void vnc_desktop_resize(VncState *vs, bool force)
>  {
> -    if (vs->ioc == NULL || !vnc_has_feature(vs, VNC_FEATURE_RESIZE)) {
> +    if (vs->ioc == NULL || (!vnc_has_feature(vs, VNC_FEATURE_RESIZE) &&
> +                            !vnc_has_feature(vs, VNC_FEATURE_RESIZE_EXT))) {
>          return;
>      }
>      if (vs->client_width == pixman_image_get_width(vs->vd->server) &&
> @@ -681,6 +706,12 @@ static void vnc_desktop_resize(VncState *vs, bool force)
>             pixman_image_get_height(vs->vd->server) >= 0);
>      vs->client_width = pixman_image_get_width(vs->vd->server);
>      vs->client_height = pixman_image_get_height(vs->vd->server);
> +
> +    if (vnc_has_feature(vs, VNC_FEATURE_RESIZE_EXT)) {
> +        vnc_desktop_resize_ext(vs, false);
> +        return;
> +    }
> +
>      vnc_lock_output(vs);
>      vnc_write_u8(vs, VNC_MSG_SERVER_FRAMEBUFFER_UPDATE);
>      vnc_write_u8(vs, 0);
> @@ -2110,6 +2141,9 @@ static void set_encodings(VncState *vs, int32_t *encodings, size_t n_encodings)
>          case VNC_ENCODING_DESKTOPRESIZE:
>              vs->features |= VNC_FEATURE_RESIZE_MASK;
>              break;
> +        case VNC_ENCODING_DESKTOP_RESIZE_EXT:
> +            vs->features |= VNC_FEATURE_RESIZE_EXT_MASK;
> +            break;
>          case VNC_ENCODING_POINTER_TYPE_CHANGE:
>              vs->features |= VNC_FEATURE_POINTER_TYPE_CHANGE_MASK;
>              break;
> @@ -2431,6 +2465,34 @@ static int protocol_client_msg(VncState *vs, uint8_t *data, size_t len)
>              break;
>          }
>          break;
> +    case VNC_MSG_CLIENT_SET_DESKTOP_SIZE:
> +    {
> +        size_t size;
> +        uint8_t screens;
> +        uint16_t width;
> +        uint16_t height;
> +        QemuUIInfo info;
> +
> +        if (len < 8) {
> +            return 8;
> +        }
> +
> +        screens = read_u8(data, 6);
> +        size    = 8 + screens * 16;
> +        if (len < size) {
> +            return size;
> +        }
> +
> +        width   = read_u16(data, 2);
> +        height  = read_u16(data, 4);
> +        vnc_desktop_resize_ext(vs, true);

I think it is worth a comment to say why we are rejecting the request...


> +
> +        memset(&info, 0, sizeof(info));
> +        info.width = width;
> +        info.height = height;
> +        dpy_set_ui_info(vs->vd->dcl.con, &info);

...while still (attempting to) honour it.

> +        break;
> +    }
>      default:
>          VNC_DEBUG("Msg: %d\n", data[0]);
>          vnc_client_error(vs);

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


