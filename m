Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC574CF354
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 09:11:05 +0100 (CET)
Received: from localhost ([::1]:55418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nR8SP-0003MD-0T
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 03:11:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1nR88P-0001o6-Eq
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 02:50:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1nR88M-0007jj-Jt
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 02:50:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646639421;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2yaT4KWWHe0kc9Yqi+AHfq2KH+PXBS2LUvy+KUKG+WY=;
 b=ax6OCX1071VdHyJpPIcMkm8+IWXQQSL+9X0HBbCzMrLCQGVwZ2d0J1TRd0vtXodQ2+FPMY
 7C16JKoZ3En2E44nSGQ73G/mjTyCr58S6CYj0TKSI/YMW1vE6kTpGN8IiZVgNGz/XkPc0v
 A48LRYz2dLvYomqPvfaRI7GGDgwVYO8=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-607-NBIiXlNFOfCt3DLnrEKCLA-1; Mon, 07 Mar 2022 02:50:21 -0500
X-MC-Unique: NBIiXlNFOfCt3DLnrEKCLA-1
Received: by mail-yb1-f198.google.com with SMTP id
 l16-20020a25bf90000000b00628c3a412cdso9950356ybk.10
 for <qemu-devel@nongnu.org>; Sun, 06 Mar 2022 23:50:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2yaT4KWWHe0kc9Yqi+AHfq2KH+PXBS2LUvy+KUKG+WY=;
 b=2UQTIWD83DDS1LRzjYK2CfEvTn1sb2c/sAazIST5iJX8BwPg9UEakl7iQHlmA6G6OC
 Y8JJLg9dlfgwfe6RuVL1m57lke9Cz9/fhaBJUEDpOAKKG9n9bu75oKnJAGjw0w4BKl9U
 S4N38+9MENcxy7mt5d+URhQbituVX+3cOx7m/rJp/eHUsJ5mufWiAfs3S9jyns0NJ5KM
 ujlTQOwr5T5ekS5DRfo1y7P+wD+L2niECkM1phma0xKgN+mmVm2xv8nWMex/WoJKmFxK
 AIkHz0yvhrWcx/bVUCJHGvQ1gvYRuCchphpUGwcfYw+3bxhxho5kXoZo92+7LhkYIwFs
 qEyQ==
X-Gm-Message-State: AOAM532Y9rsuDNdY1u1o6cVexKi/klkQTlu8FGp1z7RNA8UY2XxbJCoO
 kOcPVxvUK6e9cAHpJS+Q7kb10AuH9Up/COc57W3M86ez03eGuknl6BlZN318WTbsRMXPIUIW6fo
 RGxRqO/KecXyQcpluo6H8OiQI057FCZE=
X-Received: by 2002:a81:8c7:0:b0:2db:fddb:e82a with SMTP id
 190-20020a8108c7000000b002dbfddbe82amr7408870ywi.445.1646639420247; 
 Sun, 06 Mar 2022 23:50:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyQPB6fbVCBP5zC1na4++NZhwJn4IzS5EfRHeFOUMPqhKOgdiVxF/lz0tRh8O59PhLrFQNdf/GYBEg52Kc20S4=
X-Received: by 2002:a81:8c7:0:b0:2db:fddb:e82a with SMTP id
 190-20020a8108c7000000b002dbfddbe82amr7408863ywi.445.1646639420044; Sun, 06
 Mar 2022 23:50:20 -0800 (PST)
MIME-Version: 1.0
References: <20220307042108.296428-1-vivek.kasireddy@intel.com>
In-Reply-To: <20220307042108.296428-1-vivek.kasireddy@intel.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Mon, 7 Mar 2022 11:50:09 +0400
Message-ID: <CAMxuvawcUYkjPt-iopJhJ8seO_3tJJGqkECqZfEPb3_7SSWpkg@mail.gmail.com>
Subject: Re: [PATCH v1] ui/gtk-egl: Check for a valid context before making
 EGL calls
To: Vivek Kasireddy <vivek.kasireddy@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Dongwon Kim <dongwon.kim@intel.com>, qemu-devel <qemu-devel@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Vivek

On Mon, Mar 7, 2022 at 8:39 AM Vivek Kasireddy
<vivek.kasireddy@intel.com> wrote:
>
> Since not all listeners (i.e VirtualConsoles) of GL events have
> a valid EGL context, make sure that there is a valid context
> before making EGL calls.
>
> This fixes the following crash seen while launching the VM with
> "-device virtio-gpu-pci,max_outputs=3D1,blob=3Dtrue -display gtk,gl=3Don"
>
> No provider of eglCreateImageKHR found.  Requires one of:
> EGL_KHR_image
> EGL_KHR_image_base
>
> Fixes: 7cc712e9862ff ("ui: dispatch GL events to all listeners")

I am not able to reproduce on current master.

Isn't it fixed with commit a9fbce5e9 ("ui/console: fix crash when
using gl context with non-gl listeners") ?

Could you also check after "[PATCH v3 00/12] GL & D-Bus display related fix=
es" ?

thanks

>
> Cc: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Dongwon Kim <dongwon.kim@intel.com>
> Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
> ---
>  ui/gtk-egl.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/ui/gtk-egl.c b/ui/gtk-egl.c
> index e3bd4bc274..31175827d0 100644
> --- a/ui/gtk-egl.c
> +++ b/ui/gtk-egl.c
> @@ -244,6 +244,10 @@ void gd_egl_scanout_dmabuf(DisplayChangeListener *dc=
l,
>  #ifdef CONFIG_GBM
>      VirtualConsole *vc =3D container_of(dcl, VirtualConsole, gfx.dcl);
>
> +    if (!vc->gfx.ectx || !vc->gfx.esurface) {
> +        return;
> +    }
> +
>      eglMakeCurrent(qemu_egl_display, vc->gfx.esurface,
>                     vc->gfx.esurface, vc->gfx.ectx);
>
> @@ -269,6 +273,10 @@ void gd_egl_cursor_dmabuf(DisplayChangeListener *dcl=
,
>  #ifdef CONFIG_GBM
>      VirtualConsole *vc =3D container_of(dcl, VirtualConsole, gfx.dcl);
>
> +    if (!vc->gfx.ectx || !vc->gfx.esurface) {
> +        return;
> +    }
> +
>      if (dmabuf) {
>          egl_dmabuf_import_texture(dmabuf);
>          if (!dmabuf->texture) {
> --
> 2.35.1
>


