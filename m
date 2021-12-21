Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB00A47BBCC
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 09:28:05 +0100 (CET)
Received: from localhost ([::1]:51950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzaVB-0007sH-0k
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 03:28:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <orzechowski.alexander@gmail.com>)
 id 1mzaU4-00070R-2i; Tue, 21 Dec 2021 03:26:56 -0500
Received: from [2607:f8b0:4864:20::f32] (port=37635
 helo=mail-qv1-xf32.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <orzechowski.alexander@gmail.com>)
 id 1mzaU2-0003VX-Dr; Tue, 21 Dec 2021 03:26:55 -0500
Received: by mail-qv1-xf32.google.com with SMTP id fo11so11813100qvb.4;
 Tue, 21 Dec 2021 00:26:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:cc:in-reply-to:content-transfer-encoding;
 bh=ISoNwL9hruIDeN+zSOkGWOpuJkWiy0iPdEQ/XotEuwU=;
 b=jJpJFprQColG4mDqPpqZUwTj4NSFmSLzp3uszwDdWgSzFeRPTOibGYAC+85km9c9kZ
 Zwrwi/QOb5q3Da1yrnLBPqbMxFiXESa0CPfLMflEhgF8ngSAjsIeeJnfR5QMb+diZ5z+
 Y2Ilj6ys8xzLfFz9owV40H7kvb/TLtgC96MLUKtC+EJ4HWrZM9VNmzZorhlpBpcyIAki
 Jv0Qx5JYgmRQfmyP5SBW+9kj2iw+6Rz19cKh2udQLpxdoaKzazFkWg+agpTp08tU3uTr
 1KHHbzJQUv8kq3AVjFAT80168ekQCSr5mPku8NuXsaAQh7mQEBBUfipZL033jAUPrqhz
 3ezA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:cc:in-reply-to
 :content-transfer-encoding;
 bh=ISoNwL9hruIDeN+zSOkGWOpuJkWiy0iPdEQ/XotEuwU=;
 b=t5sX8S5KQUeM5fOQGc6blJD/0IFv4aAILyLW4gHpWbNzaKOvC4jSvHhelB5Xi6dKeY
 0/1byKJVKGs81VUBTmemtF59+EcdV7S5P+2XtSNXrLLATMyhB6nwvyp87pVOWH6ydWuh
 bPP4ZB3zLXypvI0ubBYZ5La7IvNnks2eJn2FHl8EtzWqOEu+9dgvO31lj9I2QgVecvTC
 YnHDg8gL8JzZUIIIops1EqhjKdhLEBTWHuUMfJBBBlsH3m9Z+/6SfcAk+VsSIJQ22Ho0
 TUsduzHE2IySDclTqgXWDJDEHLbC1XiDL4vt1KNUPSRTDWpqwU81iJL/9xom/yg34lD6
 pNhg==
X-Gm-Message-State: AOAM530j7Um5qfcf6jr+YEH5RsysDWt/xLRyex5/j51eJWqTre3hra6b
 HE9bnFrn5aGvYdX2FdoILxo=
X-Google-Smtp-Source: ABdhPJyuXUy5fHxWMSnrr1Eu5g3cKS/OWVy+gR0qjwiuTH6Sj68Uo0BSEAAU9VNsmI+mxZHGHQXrzg==
X-Received: by 2002:a0c:efcd:: with SMTP id a13mr1619001qvt.11.1640075213048; 
 Tue, 21 Dec 2021 00:26:53 -0800 (PST)
Received: from [192.168.1.10]
 (cpebc4dfb42ca53-cmbc4dfb42ca50.cpe.net.cable.rogers.com. [99.251.122.96])
 by smtp.gmail.com with ESMTPSA id x15sm13505850qko.82.2021.12.21.00.26.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Dec 2021 00:26:52 -0800 (PST)
Message-ID: <b8300a7d-dffe-c600-1b36-62d7ae2b2699@gmail.com>
Date: Tue, 21 Dec 2021 03:26:52 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 2/4] ui: Remove unnecessary checks
Content-Language: en-US
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
References: <20211219023006.124530-1-orzechowski.alexander@gmail.com>
 <20211219023006.124530-3-orzechowski.alexander@gmail.com>
 <CAJ+F1CL4LxdbCOzt+uFTw_ggxQ+forzd7chDQRw8DMsc9EMamA@mail.gmail.com>
From: Alexander Orzechowski <orzechowski.alexander@gmail.com>
In-Reply-To: <CAJ+F1CL4LxdbCOzt+uFTw_ggxQ+forzd7chDQRw8DMsc9EMamA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::f32
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f32;
 envelope-from=orzechowski.alexander@gmail.com; helo=mail-qv1-xf32.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-2.012, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu trivial <qemu-trivial@nongnu.org>, QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/21/21 02:40, Marc-André Lureau wrote:

> Hi
>
> On Sun, Dec 19, 2021 at 6:32 AM Alexander Orzechowski 
> <orzechowski.alexander@gmail.com> wrote:
>
>     These conditionals should never be false as scale_x and scale_y should
>     scale the fbw and fbh variables such that the ww and wh variables
>     always
>     have a greater magnitude.
>
>     Signed-off-by: Alexander Orzechowski <orzechowski.alexander@gmail.com>
>
>
> I don't understand how you reached that conclusion.
>
> scale_x/scale_y can have various values, from 0.25 manually, or pretty 
> much anything in freescale.
>
> Just adding a breakpoint/debug there and you can see they can be false.
>
>     ---
>      ui/gtk.c | 27 ++++++---------------------
>      1 file changed, 6 insertions(+), 21 deletions(-)
>
>     diff --git a/ui/gtk.c b/ui/gtk.c
>     index 824334ff3d..f2d74b253d 100644
>     --- a/ui/gtk.c
>     +++ b/ui/gtk.c
>     @@ -416,13 +416,8 @@ static void gd_update(DisplayChangeListener *dcl,
>          ww = gtk_widget_get_allocated_width(vc->gfx.drawing_area);
>          wh = gtk_widget_get_allocated_height(vc->gfx.drawing_area);
>
>     -    mx = my = 0;
>     -    if (ww > fbw) {
>     -        mx = (ww - fbw) / 2;
>     -    }
>     -    if (wh > fbh) {
>     -        my = (wh - fbh) / 2;
>     -    }
>     +    mx = (ww - fbw) / 2;
>     +    my = (wh - fbh) / 2;
>
>          gtk_widget_queue_draw_area(vc->gfx.drawing_area,
>                                     mx + x1, my + y1, (x2 - x1), (y2 -
>     y1));
>     @@ -801,13 +796,8 @@ static gboolean gd_draw_event(GtkWidget
>     *widget, cairo_t *cr, void *opaque)
>          fbw *= vc->gfx.scale_x;
>          fbh *= vc->gfx.scale_y;
>
>     -    mx = my = 0;
>     -    if (ww > fbw) {
>     -        mx = (ww - fbw) / 2;
>     -    }
>     -    if (wh > fbh) {
>     -        my = (wh - fbh) / 2;
>     -    }
>     +    mx = (ww - fbw) / 2;
>     +    my = (wh - fbh) / 2;
>
>          cairo_rectangle(cr, 0, 0, ww, wh);
>
>     @@ -850,13 +840,8 @@ static gboolean gd_motion_event(GtkWidget
>     *widget, GdkEventMotion *motion,
>          ws = gdk_window_get_scale_factor(
>      gtk_widget_get_window(vc->gfx.drawing_area));
>
>     -    mx = my = 0;
>     -    if (ww > fbw) {
>     -        mx = (ww - fbw) / 2;
>     -    }
>     -    if (wh > fbh) {
>     -        my = (wh - fbh) / 2;
>     -    }
>     +    mx = (ww - fbw) / 2;
>     +    my = (wh - fbh) / 2;
>
>          x = (motion->x - mx) / vc->gfx.scale_x * ws;
>          y = (motion->y - my) / vc->gfx.scale_y * ws;
>     -- 
>     2.34.1
>
>
>
>
> -- 
> Marc-André Lureau

Thanks for the thorough review. I didn't realize you could set the scale 
manually, but

it was under my impression that qemu would set the GDK_HINT_MIN_SIZE 
property[1]

to try to disallow the user from resizing the window any smaller than 
the size of the

virtual console. Qemu provides no mechanism to change the translation of 
the virtual

console within the window in this case where the window is smaller than 
the virtual

console would normally allow, I consider this invalid state. The mx and 
my variables

are only used to translate the virtual console within its render 
surface. Thus, if qemu

were to enter this "invalid" state as I've called it, the view would 
show the middle of

the virtual console and obscure the edges. Without this patch it would 
show the top

left, obscuring the bottom right. I am happy to drop this patch for v2. 
Please let me

know your thoughts.


[1]: See ui/gtk.c line 279 with the patches applied.

--

Alexander Orzechowski


