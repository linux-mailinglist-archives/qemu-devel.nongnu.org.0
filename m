Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A892E447071
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Nov 2021 21:35:00 +0100 (CET)
Received: from localhost ([::1]:60018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mjSOx-00069j-Ex
	for lists+qemu-devel@lfdr.de; Sat, 06 Nov 2021 16:34:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mjSNF-0005JD-T5
 for qemu-devel@nongnu.org; Sat, 06 Nov 2021 16:33:13 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:44177)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mjSMt-00022C-Qg
 for qemu-devel@nongnu.org; Sat, 06 Nov 2021 16:33:13 -0400
Received: from [192.168.100.1] ([82.142.14.190]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MKsax-1n2MnH1S3h-00LCje; Sat, 06 Nov 2021 21:32:42 +0100
Message-ID: <e44b788c-0764-66ce-f78b-a7123832fd00@vivier.eu>
Date: Sat, 6 Nov 2021 21:32:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: fr
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
References: <20211105113043.4059361-1-kraxel@redhat.com>
 <20211105113043.4059361-5-kraxel@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PULL 4/6] ui/gtk-egl: guest fb texture needs to be regenerated
 when reinitializing egl
In-Reply-To: <20211105113043.4059361-5-kraxel@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:AV3BX4aV9uw/m80UngeM/QR55Yd6YK7R2ixP9mRBa0t/qAH2a9H
 dTRQZb5+XrDD4sDce+0PG+Jx6eoGEz6seYtxRdb6KFAxM06Y7I6hgw3mwXjSOInDcB7T8pu
 yq6HC56TOJZarw7vsCzh61lL5JvdFtv4eVMcwXA/ffmOeo+QD10n0vubi5y2ecYZ+I3xukw
 Gkp3MyeD1TryU8SzAkoEQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:8WS8VLpYbtY=:l73+UjzsbhTs/TZVqGwSLu
 NoJCAbydD4FRYz05zTxzH7D/7Hys+3oF4PxIG4PxjMve/Er5pM26OIeALd8zYrt44AcwVam7B
 v9/sfiXSAI7xKYFWj5fuA4/1WpGpBuiKTC4C7gurXEHhF2oP//USOGl2ZVY9p9gv9fCq04Uc/
 l8qIUm+FioZU8S2N3fHVvWEETHqA6NgFA0DP/oan7zUmcKkSTKnn2JsrX3lAX14N+V0HKhvC5
 6MdSTI/wH88qrlsybwAAMuU3GrdboZEmPEODhSHFLrO1N49Sc4AkYFP+QlMJ4uPgxIoHrxrzv
 qc9rIgbfF4TdQDcUuJ7uzlxyUbzPpKnpdUEL9iDZ91XC6ty8TyYjcE5OfPMACVwBM1yG0xWoJ
 PQ/LdJ22ys6sbnBBk/HzJkUPFnVQRZxsvITRrfJCXXXsgTe3l++0CopVZzzJUbQFfnrdMMG5u
 f/8myIIM91Jq5zdLW5ul6Cepk/st6B5dyZB3FZrsLWXq70lNKW7kiQKLxzyH7EGj3htb5eQl6
 /F9CY/qH7RqNUlAA1BvMqrcZdQI6Ni9C04Ku1tzskfxht3sevev+ICLiZel2xZtreYJtrFuoy
 kvutACBM+cAtxHm49OL0jm0NPSMvv23g9a5tM8NiMdpCqpW27oscuxz87nfZoERzRfq+k6r32
 mCXly/DxtBxOmML5PYE61p9vmU1rYS71JfnYaCU3lvqAeWNTBmHMsGX6xVUhMfcrF8/Y=
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.407,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Dongwon Kim <dongwon.kim@intel.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 05/11/2021 à 12:30, Gerd Hoffmann a écrit :
> From: Dongwon Kim <dongwon.kim@intel.com>
> 
> If guest fb is backed by dmabuf (blob-resource), the texture bound to the
> old context needs to be recreated in case the egl is re-initialized (e.g.
> new window for vc is created in case of detaching/reattaching of the tab)
> 
> v2: call egl_dmabuf_release_texutre instead of putting 0 to dmabuf->texture
>      (Vivek Kasireddy)
> 
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
> Message-Id: <20211104065153.28897-3-dongwon.kim@intel.com>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>   ui/gtk-egl.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/ui/gtk-egl.c b/ui/gtk-egl.c
> index 21649950983f..f2026e4b5c9b 100644
> --- a/ui/gtk-egl.c
> +++ b/ui/gtk-egl.c
> @@ -155,6 +155,10 @@ void gd_egl_refresh(DisplayChangeListener *dcl)
>               surface_gl_destroy_texture(vc->gfx.gls, vc->gfx.ds);
>               surface_gl_create_texture(vc->gfx.gls, vc->gfx.ds);
>           }
> +        if (vc->gfx.guest_fb.dmabuf) {
> +            egl_dmabuf_release_texture(vc->gfx.guest_fb.dmabuf);
> +            gd_egl_scanout_dmabuf(dcl, vc->gfx.guest_fb.dmabuf);
> +        }
>       }
>   
>       graphic_hw_update(dcl->con);
> 

This patch breaks something:

$ .../configure' '--target-list=m68k-softmmu' '--enable-virglrenderer'
$ make
...

FAILED: libcommon.fa.p/ui_gtk-egl.c.o
cc -m64 -mcx16 -Ilibcommon.fa.p -I../../../Projects/qemu-next/capstone/include/capstone 
-I../../../Projects/qemu-next/dtc/libfdt -I../../../Projects/qemu-next/slirp 
-I../../../Projects/qemu-next/slirp/src -I/usr/include/pixman-1 -I/usr/include/libpng16 
-I/usr/include/p11-kit-1 -I/usr/include/glib-2.0 -I/usr/lib64/glib-2.0/include 
-I/usr/include/sysprof-4 -I/usr/include/libmount -I/usr/include/blkid -I/usr/include/gio-unix-2.0 
-I/usr/include/virgl -I/usr/include/gtk-3.0 -I/usr/include/pango-1.0 -I/usr/include/harfbuzz 
-I/usr/include/freetype2 -I/usr/include/fribidi -I/usr/include/libxml2 -I/usr/include/cairo 
-I/usr/include/gdk-pixbuf-2.0 -I/usr/include/cloudproviders -I/usr/include/atk-1.0 
-I/usr/include/at-spi2-atk/2.0 -I/usr/include/dbus-1.0 -I/usr/lib64/dbus-1.0/include 
-I/usr/include/at-spi-2.0 -I/usr/include/vte-2.91 -fdiagnostics-color=auto -Wall -Winvalid-pch 
-Werror -std=gnu11 -O2 -g -isystem /home/laurent/Projects/qemu-next/linux-headers -isystem 
linux-headers -iquote . -iquote /home/laurent/Projects/qemu-next -iquote 
/home/laurent/Projects/qemu-next/include -iquote /home/laurent/Projects/qemu-next/disas/libvixl 
-iquote /home/laurent/Projects/qemu-next/tcg/i386 -pthread -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=2 
-D_GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -Wstrict-prototypes -Wredundant-decls 
-Wundef -Wwrite-strings -Wmissing-prototypes -fno-strict-aliasing -fno-common -fwrapv 
-Wold-style-declaration -Wold-style-definition -Wtype-limits -Wformat-security -Wformat-y2k 
-Winit-self -Wignored-qualifiers -Wempty-body -Wnested-externs -Wendif-labels -Wexpansion-to-defined 
-Wimplicit-fallthrough=2 -Wno-missing-include-dirs -Wno-shift-negative-value -Wno-psabi 
-fstack-protector-strong -fPIE -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600 -DNCURSES_WIDECHAR -D_REENTRANT 
-MD -MQ libcommon.fa.p/ui_gtk-egl.c.o -MF libcommon.fa.p/ui_gtk-egl.c.o.d -o 
libcommon.fa.p/ui_gtk-egl.c.o -c ../../../Projects/qemu-next/ui/gtk-egl.c
../../../Projects/qemu-next/ui/gtk-egl.c: In function 'gd_egl_refresh':
../../../Projects/qemu-next/ui/gtk-egl.c:159:13: error: implicit declaration of function 
'egl_dmabuf_release_texture' [-Werror=implicit-function-declaration]
   159 |             egl_dmabuf_release_texture(vc->gfx.guest_fb.dmabuf);
       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~
../../../Projects/qemu-next/ui/gtk-egl.c:159:13: error: nested extern declaration of 
'egl_dmabuf_release_texture' [-Werror=nested-externs]

I think we need something like:

diff --git a/ui/gtk-egl.c b/ui/gtk-egl.c
index f2026e4b5c9b..45cb67712df0 100644
--- a/ui/gtk-egl.c
+++ b/ui/gtk-egl.c
@@ -155,10 +155,12 @@ void gd_egl_refresh(DisplayChangeListener *dcl)
              surface_gl_destroy_texture(vc->gfx.gls, vc->gfx.ds);
              surface_gl_create_texture(vc->gfx.gls, vc->gfx.ds);
          }
+#ifdef CONFIG_GBM
          if (vc->gfx.guest_fb.dmabuf) {
              egl_dmabuf_release_texture(vc->gfx.guest_fb.dmabuf);
              gd_egl_scanout_dmabuf(dcl, vc->gfx.guest_fb.dmabuf);
          }
+#endif
      }

      graphic_hw_update(dcl->con);

Thanks,
Laurent

