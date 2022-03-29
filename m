Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3711E4EB567
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 23:41:35 +0200 (CEST)
Received: from localhost ([::1]:60412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZJam-0003Gm-8y
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 17:41:32 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nZJ5V-00027v-Bi
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 17:09:13 -0400
Received: from [2a00:1450:4864:20::52a] (port=35492
 helo=mail-ed1-x52a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nZJ5T-0005Ps-6M
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 17:09:12 -0400
Received: by mail-ed1-x52a.google.com with SMTP id g22so11043664edz.2
 for <qemu-devel@nongnu.org>; Tue, 29 Mar 2022 14:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=nspZRn/4hSnc37wMl5gDvAnAMGSAPcnZCf08x0ntsbE=;
 b=LkX7ls0qLjrlDJj3PC6Bh5gqnFf9W/rZF00jWLaKMIHw/xbNzt4yRSzDfTHCBOSBDc
 +ksZSR2MKKQ72IlRH0HqvvPcImVjfQRwVGsjpS4VSz1yvWpRwiA/EnsDUSC7ZU8dQq9+
 6OS9K7BR6/OOIMgLYbObejUwd1xfto59y3fyKUw9RJghPSvujGM4RJRA+tBGy2o34PCx
 hOq7tj42hKojoBG7glPA5XF/Q6sqr8+oC1tF3lJwPahmRji2VVKvTlMzoUmcTmDKM4fI
 FC7TKDULUBzAgUtu6odP+yDq9Los6zSkF1BlUcybLVGtXL0w3OIctHlWoO5TieUY54Eh
 8Grw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=nspZRn/4hSnc37wMl5gDvAnAMGSAPcnZCf08x0ntsbE=;
 b=7eczlLnM1xxbKyo4L4Gd12FK7FwRaSLqUzrEpPDsqyKcCdsUy/e6ikXj7ouQlRVgRU
 aWn774u8IoS2SWiQ637w1wcIHhXpr5xe5wAEsZMicSe1j6sh6RDEKCh2LjKzUh5J2O8j
 4vpCNls+MVFT0Qklzhgmuz4FXQUiSL4Jekp9R5ZLc7WrQU30IBBSpLz0bCIi6msK6QDy
 62ChfHx7RCbIilmFL9AiL5k9RH48KKYCrl7ku8pIglrJPnNJUORYqP3eaNN1KhApBVgH
 +i0kpXYtoBpGiBtVWf6w+rTasINfQ7lJxTKgPI5DwuyTCPAAUaxN3YgwMuGj+4M1BH3i
 ww5Q==
X-Gm-Message-State: AOAM531+2lfRwZyC8xd02W+CTWn8T2RWkq7dMZt6KghsMGJeSRKA9M+8
 aBijevFTjvR5EKObZ/SjBps=
X-Google-Smtp-Source: ABdhPJyW58TJEyi1MOiBlvZmmduHdf4XMo2XhlPACaX0VO1IeZSUnw9NrK/W6ChT88RupB3peozp5A==
X-Received: by 2002:a05:6402:1111:b0:416:2ac8:b98e with SMTP id
 u17-20020a056402111100b004162ac8b98emr7060717edv.236.1648588149352; 
 Tue, 29 Mar 2022 14:09:09 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:8ca6:a836:a237:fed1?
 ([2001:b07:6468:f312:8ca6:a836:a237:fed1])
 by smtp.googlemail.com with ESMTPSA id
 b3-20020aa7d483000000b00419209d4c85sm8774606edr.66.2022.03.29.14.09.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Mar 2022 14:09:08 -0700 (PDT)
Message-ID: <28fb5ce8-c62d-deec-4893-ca02fb2d3ff8@redhat.com>
Date: Tue, 29 Mar 2022 23:09:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v3 1/2] Replacing CONFIG_VNC_PNG with CONFIG_PNG
Content-Language: en-US
To: Kshitij Suri <kshitij.suri@nutanix.com>, qemu-devel@nongnu.org
References: <20220329134235.44298-1-kshitij.suri@nutanix.com>
 <20220329134235.44298-2-kshitij.suri@nutanix.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220329134235.44298-2-kshitij.suri@nutanix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52a.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, soham.ghosh@nutanix.com, berrange@redhat.com,
 prerna.saxena@nutanix.com, armbru@redhat.com, thuth@redhat.com,
 dgilbert@redhat.com, philippe.mathieu.daude@gmail.com, kraxel@redhat.com,
 prachatos.mitra@nutanix.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/29/22 15:42, Kshitij Suri wrote:
> Libpng is only detected if VNC is enabled currently. This patch adds a
> generalised png option in the meson build which is aimed to replace use of
> CONFIG_VNC_PNG with CONFIG_PNG.
> 
> Signed-off-by: Kshitij Suri <kshitij.suri@nutanix.com>
> 
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   meson.build        |  9 ++++-----
>   meson_options.txt  |  4 ++--
>   ui/vnc-enc-tight.c | 18 +++++++++---------
>   ui/vnc.c           |  4 ++--
>   ui/vnc.h           |  2 +-
>   5 files changed, 18 insertions(+), 19 deletions(-)
> 
> diff --git a/meson.build b/meson.build
> index 282e7c4650..ccb6840a49 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1115,14 +1115,13 @@ if gtkx11.found()
>     x11 = dependency('x11', method: 'pkg-config', required: gtkx11.found(),
>                      kwargs: static_kwargs)
>   endif
> +png = dependency('libpng', required: get_option('png'),
> +                 method: 'pkg-config', kwargs: static_kwargs)

Please use

png = not_found
if get_option('png').allowed() and have_system
    png = dependency('libpng', required: get_option('png'),
                     method: 'pkg-config', kwargs: static_kwargs)
endif

as suggested in the review of v2.

Paolo

>   vnc = not_found
> -png = not_found
>   jpeg = not_found
>   sasl = not_found
>   if get_option('vnc').allowed() and have_system
>     vnc = declare_dependency() # dummy dependency
> -  png = dependency('libpng', required: get_option('vnc_png'),
> -                   method: 'pkg-config', kwargs: static_kwargs)
>     jpeg = dependency('libjpeg', required: get_option('vnc_jpeg'),
>                       method: 'pkg-config', kwargs: static_kwargs)
>     sasl = cc.find_library('sasl2', has_headers: ['sasl/sasl.h'],
> @@ -1554,9 +1553,9 @@ config_host_data.set('CONFIG_TPM', have_tpm)
>   config_host_data.set('CONFIG_USB_LIBUSB', libusb.found())
>   config_host_data.set('CONFIG_VDE', vde.found())
>   config_host_data.set('CONFIG_VHOST_USER_BLK_SERVER', have_vhost_user_blk_server)
> +config_host_data.set('CONFIG_PNG', png.found())
>   config_host_data.set('CONFIG_VNC', vnc.found())
>   config_host_data.set('CONFIG_VNC_JPEG', jpeg.found())
> -config_host_data.set('CONFIG_VNC_PNG', png.found())
>   config_host_data.set('CONFIG_VNC_SASL', sasl.found())
>   config_host_data.set('CONFIG_VIRTFS', have_virtfs)
>   config_host_data.set('CONFIG_VTE', vte.found())
> @@ -3638,11 +3637,11 @@ summary_info += {'curses support':    curses}
>   summary_info += {'virgl support':     virgl}
>   summary_info += {'curl support':      curl}
>   summary_info += {'Multipath support': mpathpersist}
> +summary_info += {'PNG support':       png}
>   summary_info += {'VNC support':       vnc}
>   if vnc.found()
>     summary_info += {'VNC SASL support':  sasl}
>     summary_info += {'VNC JPEG support':  jpeg}
> -  summary_info += {'VNC PNG support':   png}
>   endif
>   if targetos not in ['darwin', 'haiku', 'windows']
>     summary_info += {'OSS support':     oss}
> diff --git a/meson_options.txt b/meson_options.txt
> index 52b11cead4..d85734f8e6 100644
> --- a/meson_options.txt
> +++ b/meson_options.txt
> @@ -177,12 +177,12 @@ option('vde', type : 'feature', value : 'auto',
>          description: 'vde network backend support')
>   option('virglrenderer', type : 'feature', value : 'auto',
>          description: 'virgl rendering support')
> +option('png', type : 'feature', value : 'auto',
> +       description: 'PNG support with libpng')
>   option('vnc', type : 'feature', value : 'auto',
>          description: 'VNC server')
>   option('vnc_jpeg', type : 'feature', value : 'auto',
>          description: 'JPEG lossy compression for VNC server')
> -option('vnc_png', type : 'feature', value : 'auto',
> -       description: 'PNG compression for VNC server')
>   option('vnc_sasl', type : 'feature', value : 'auto',
>          description: 'SASL authentication for VNC server')
>   option('vte', type : 'feature', value : 'auto',
> diff --git a/ui/vnc-enc-tight.c b/ui/vnc-enc-tight.c
> index 7b86a4713d..e879cca7f5 100644
> --- a/ui/vnc-enc-tight.c
> +++ b/ui/vnc-enc-tight.c
> @@ -32,7 +32,7 @@
>      INT32 definitions between jmorecfg.h (included by jpeglib.h) and
>      Win32 basetsd.h (included by windows.h). */
>   
> -#ifdef CONFIG_VNC_PNG
> +#ifdef CONFIG_PNG
>   /* The following define is needed by pngconf.h. Otherwise it won't compile,
>      because setjmp.h was already included by qemu-common.h. */
>   #define PNG_SKIP_SETJMP_CHECK
> @@ -95,7 +95,7 @@ static const struct {
>   };
>   #endif
>   
> -#ifdef CONFIG_VNC_PNG
> +#ifdef CONFIG_PNG
>   static const struct {
>       int png_zlib_level, png_filters;
>   } tight_png_conf[] = {
> @@ -919,7 +919,7 @@ static int send_full_color_rect(VncState *vs, int x, int y, int w, int h)
>       int stream = 0;
>       ssize_t bytes;
>   
> -#ifdef CONFIG_VNC_PNG
> +#ifdef CONFIG_PNG
>       if (tight_can_send_png_rect(vs, w, h)) {
>           return send_png_rect(vs, x, y, w, h, NULL);
>       }
> @@ -966,7 +966,7 @@ static int send_mono_rect(VncState *vs, int x, int y,
>       int stream = 1;
>       int level = tight_conf[vs->tight->compression].mono_zlib_level;
>   
> -#ifdef CONFIG_VNC_PNG
> +#ifdef CONFIG_PNG
>       if (tight_can_send_png_rect(vs, w, h)) {
>           int ret;
>           int bpp = vs->client_pf.bytes_per_pixel * 8;
> @@ -1020,7 +1020,7 @@ static int send_mono_rect(VncState *vs, int x, int y,
>   struct palette_cb_priv {
>       VncState *vs;
>       uint8_t *header;
> -#ifdef CONFIG_VNC_PNG
> +#ifdef CONFIG_PNG
>       png_colorp png_palette;
>   #endif
>   };
> @@ -1082,7 +1082,7 @@ static int send_palette_rect(VncState *vs, int x, int y,
>       int colors;
>       ssize_t bytes;
>   
> -#ifdef CONFIG_VNC_PNG
> +#ifdef CONFIG_PNG
>       if (tight_can_send_png_rect(vs, w, h)) {
>           return send_png_rect(vs, x, y, w, h, palette);
>       }
> @@ -1233,7 +1233,7 @@ static int send_jpeg_rect(VncState *vs, int x, int y, int w, int h, int quality)
>   /*
>    * PNG compression stuff.
>    */
> -#ifdef CONFIG_VNC_PNG
> +#ifdef CONFIG_PNG
>   static void write_png_palette(int idx, uint32_t pix, void *opaque)
>   {
>       struct palette_cb_priv *priv = opaque;
> @@ -1379,7 +1379,7 @@ static int send_png_rect(VncState *vs, int x, int y, int w, int h,
>       buffer_reset(&vs->tight->png);
>       return 1;
>   }
> -#endif /* CONFIG_VNC_PNG */
> +#endif /* CONFIG_PNG */
>   
>   static void vnc_tight_start(VncState *vs)
>   {
> @@ -1706,7 +1706,7 @@ void vnc_tight_clear(VncState *vs)
>   #ifdef CONFIG_VNC_JPEG
>       buffer_free(&vs->tight->jpeg);
>   #endif
> -#ifdef CONFIG_VNC_PNG
> +#ifdef CONFIG_PNG
>       buffer_free(&vs->tight->png);
>   #endif
>   }
> diff --git a/ui/vnc.c b/ui/vnc.c
> index 310a873c21..8376291b47 100644
> --- a/ui/vnc.c
> +++ b/ui/vnc.c
> @@ -2165,7 +2165,7 @@ static void set_encodings(VncState *vs, int32_t *encodings, size_t n_encodings)
>               vs->features |= VNC_FEATURE_TIGHT_MASK;
>               vs->vnc_encoding = enc;
>               break;
> -#ifdef CONFIG_VNC_PNG
> +#ifdef CONFIG_PNG
>           case VNC_ENCODING_TIGHT_PNG:
>               vs->features |= VNC_FEATURE_TIGHT_PNG_MASK;
>               vs->vnc_encoding = enc;
> @@ -3256,7 +3256,7 @@ static void vnc_connect(VncDisplay *vd, QIOChannelSocket *sioc,
>   #ifdef CONFIG_VNC_JPEG
>       buffer_init(&vs->tight->jpeg,     "vnc-tight-jpeg/%p", sioc);
>   #endif
> -#ifdef CONFIG_VNC_PNG
> +#ifdef CONFIG_PNG
>       buffer_init(&vs->tight->png,      "vnc-tight-png/%p", sioc);
>   #endif
>       buffer_init(&vs->zlib.zlib,      "vnc-zlib/%p", sioc);
> diff --git a/ui/vnc.h b/ui/vnc.h
> index a7149831f9..a60fb13115 100644
> --- a/ui/vnc.h
> +++ b/ui/vnc.h
> @@ -201,7 +201,7 @@ typedef struct VncTight {
>   #ifdef CONFIG_VNC_JPEG
>       Buffer jpeg;
>   #endif
> -#ifdef CONFIG_VNC_PNG
> +#ifdef CONFIG_PNG
>       Buffer png;
>   #endif
>       int levels[4];


