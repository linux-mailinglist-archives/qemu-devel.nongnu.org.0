Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFDD1458E17
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 13:18:28 +0100 (CET)
Received: from localhost ([::1]:47942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mp8HC-0007wr-Aj
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 07:18:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mp8Er-0006pB-RJ
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 07:16:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20058)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mp8Ep-00056Y-5W
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 07:16:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637583357;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hdRofaOLUP0ztdALFcsjC3kqoUUAV2bdoU8YWngRX/w=;
 b=WxNlDhtQTKweNfFrvSlGrOjOJ4xr/ubjW45Fvh0kG+R6xx80PonV8r0R95QaVSBnE83nZl
 cctOMyN7RGEKsR1LTWcrWTdFyqwamjS8GxRqzDqTLvTB0EeGtQRBoBXJ43JWkXb72fF2jY
 2CdNhOOZDDzvzc6GgXVfbC1Vz3FDRkU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-289-gK2v82RDPaKCLNA4repSoA-1; Mon, 22 Nov 2021 07:15:56 -0500
X-MC-Unique: gK2v82RDPaKCLNA4repSoA-1
Received: by mail-wm1-f70.google.com with SMTP id
 v62-20020a1cac41000000b0033719a1a714so6709856wme.6
 for <qemu-devel@nongnu.org>; Mon, 22 Nov 2021 04:15:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=hdRofaOLUP0ztdALFcsjC3kqoUUAV2bdoU8YWngRX/w=;
 b=EvN0+1Rfs+5XvkZ+UmRGYhccra9vKMIcRSOyK/FjwXAWNNO7XYD+8rPMLtOptf/Tqi
 xqRB4OWQBZvpAOrutinYb85flY0A9IVaRl63Wj+1Ce1k0iW1LXrYxbR2gx5htuvIYQbQ
 m+DEsBgWoKYJFtHn1HdnSXbCbXIv5UZ2IaDea8JIl6Af1XXJO6+v9rrksXH/sVUz43qJ
 xSM8W2dEVXewVTpGp5B3ADRLR41q/xpLPyUSIIGzWEIPI94VgifgQVZxnmQGDgc28guA
 bgRMW/TVdGrI9hvIxYLtdh1Ozaa6vI+n5AGq12JI0rJhE0LVTEZGjNJHLLfwe2G7Y6os
 xMhQ==
X-Gm-Message-State: AOAM532xGxTSi4UM/Btd4SIs3i4YWWzmL4QcnRCm5thSmIyGHPdwd92r
 lRIxQBn8UG8xhJxE2b3MJ7BzGFBmmV+bd05GN1Wm/Tva11CzfYITvIjjjSzQvrq3XhZceVo0Yq7
 AEXbUkBmXQWMTx6g=
X-Received: by 2002:a05:600c:6d2:: with SMTP id
 b18mr29649406wmn.98.1637583355532; 
 Mon, 22 Nov 2021 04:15:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz6MehIuPFtqm3fOPXrBaw3hOkBYCwKiXN3KMaB4hrWFt0M2y5wo0ZXKoNlfYO3JTFKXqCXVQ==
X-Received: by 2002:a05:600c:6d2:: with SMTP id
 b18mr29649373wmn.98.1637583355288; 
 Mon, 22 Nov 2021 04:15:55 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id x21sm20168227wmc.14.2021.11.22.04.15.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Nov 2021 04:15:54 -0800 (PST)
Message-ID: <f701c999-0a08-75d0-e715-c7cc6aeb494e@redhat.com>
Date: Mon, 22 Nov 2021 13:15:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 2/2] ui: fix incorrect pointer position on highdpi with gtk
To: Alexander Orzechowski <orzechowski.alexander@gmail.com>,
 qemu-devel@nongnu.org
References: <20211121065504.29101-1-orzechowski.alexander@gmail.com>
 <20211121065504.29101-3-orzechowski.alexander@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211121065504.29101-3-orzechowski.alexander@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.709,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.097, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/21/21 07:55, Alexander Orzechowski wrote:
> Signed-off-by: Alexander Orzechowski <orzechowski.alexander@gmail.com>
> ---
>  ui/gtk.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/ui/gtk.c b/ui/gtk.c
> index d2892ea6b4..b2670142b5 100644
> --- a/ui/gtk.c
> +++ b/ui/gtk.c
> @@ -838,10 +838,11 @@ static gboolean gd_motion_event(GtkWidget *widget, GdkEventMotion *motion,
>  {
>      VirtualConsole *vc = opaque;
>      GtkDisplayState *s = vc->s;
> +    GdkWindow *window;
>      int x, y;
>      int mx, my;
>      int fbh, fbw;
> -    int ww, wh;
> +    int ww, wh, ws;
>  
>      if (!vc->gfx.ds) {
>          return TRUE;
> @@ -850,8 +851,10 @@ static gboolean gd_motion_event(GtkWidget *widget, GdkEventMotion *motion,
>      fbw = surface_width(vc->gfx.ds) * vc->gfx.scale_x;
>      fbh = surface_height(vc->gfx.ds) * vc->gfx.scale_y;
>  
> -    ww = gdk_window_get_width(gtk_widget_get_window(vc->gfx.drawing_area));
> -    wh = gdk_window_get_height(gtk_widget_get_window(vc->gfx.drawing_area));
> +    window = gtk_widget_get_window(vc->gfx.drawing_area);
> +    ww = gdk_window_get_width(window);
> +    wh = gdk_window_get_height(window);
> +    ws = gdk_window_get_scale_factor (window);

Please follow the coding style and remove the extra space.

Otherwise LGTM.


