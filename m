Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 489953CD057
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 11:15:45 +0200 (CEST)
Received: from localhost ([::1]:35376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5PNI-00051p-7q
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 05:15:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m5PLc-0003cq-GK
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 05:14:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44000)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m5PLa-0007i2-9f
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 05:14:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626686037;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ve3x4hksyBUdRiqyaHHK5Bpz8t8E3OBr7qhG495nrgg=;
 b=XHunf0WPOZsFB+LQC9JeH2uu+69P/wItSksC0jFNzFEQ6bxTChhQVBwax47NMmGjJb7fkq
 pPF1cCgvB/fZ0o+IRLZbQ+U88XGLmKjJ8IlRLn4tA5u444nv+gUAq4r8GOtLhwhi6RV6h+
 r6EjUiQaXgNvAeWKfKdng8E92k/MkOI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-446-CYpKy1jkPviEZgDdfuzEgA-1; Mon, 19 Jul 2021 05:13:56 -0400
X-MC-Unique: CYpKy1jkPviEZgDdfuzEgA-1
Received: by mail-wm1-f70.google.com with SMTP id
 j141-20020a1c23930000b0290212502cb19aso5191030wmj.0
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 02:13:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ve3x4hksyBUdRiqyaHHK5Bpz8t8E3OBr7qhG495nrgg=;
 b=pLsxoseMm5+1aADhr1FwN0XOTNHKsStqQRKpuTgWXd11vntZIIRsHcpJegiIpdj2SI
 Cf30waK+foQB1wlrQAuXy2PJBD7g4E+DXlb8hdo6X+ZhBTeibwu2JCpvk5/vFdO7I6q+
 rlZy0dYdQ6Pcgciy1A8YCEXSUhoExoUAYuGJiE/RYVECJwsLYYPl2LarZAa6YPXhxIn1
 7pt1SodqDxexRhpMXRFWOknTyXCl8HkXu9KD9vWh2Py/fIPfryyPtbT3troRD8cIysX+
 2FZX9ZcfL9DfeQhhIbx/r7w6RxwMClAaY6kYjbRDEaTAvovL8r+ZYcDIRTI3ZJAQot1t
 ND3w==
X-Gm-Message-State: AOAM532fTN3/zL9L558SwKyJmqJVl3UBXV1sg8Krr9vjXVzOW2uMPJAt
 YYqcv2zxplAHfHUGZGE5mID+nGmXB1NsMSghkua3qNoNQBMWYxFGKnslGcIwSKTsF163un1KoFB
 t5PQ0JgQMkXpH9zM=
X-Received: by 2002:a05:600c:198a:: with SMTP id
 t10mr6823408wmq.32.1626686034928; 
 Mon, 19 Jul 2021 02:13:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzumxWqcb87leoWYwwAQvM5YrCQ28Ys2mjNKxWmlqPz0Q8kKJrvibMyIMqZgw5vkxAANjQ/JA==
X-Received: by 2002:a05:600c:198a:: with SMTP id
 t10mr6823384wmq.32.1626686034667; 
 Mon, 19 Jul 2021 02:13:54 -0700 (PDT)
Received: from [192.168.1.33] (abordeaux-654-1-74-136.w109-214.abo.wanadoo.fr.
 [109.214.221.136])
 by smtp.gmail.com with ESMTPSA id o18sm19434784wrx.21.2021.07.19.02.13.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Jul 2021 02:13:54 -0700 (PDT)
Subject: Re: [PATCH 03/12] ui/gtk-clipboard: use existing macros
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20210719072654.845901-1-marcandre.lureau@redhat.com>
 <20210719072654.845901-4-marcandre.lureau@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <525e964c-f91f-813f-736f-e8d888f44a36@redhat.com>
Date: Mon, 19 Jul 2021 11:13:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210719072654.845901-4-marcandre.lureau@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.466,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.07, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/19/21 9:26 AM, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Rather than hardcoding strings

Why not write a full sentence? It is only 3 words saved, and
we could directly understand the comment without having to
look at the subject.

> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>  ui/gtk-clipboard.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/ui/gtk-clipboard.c b/ui/gtk-clipboard.c
> index bff28d2030..5e817ae55c 100644
> --- a/ui/gtk-clipboard.c
> +++ b/ui/gtk-clipboard.c
> @@ -177,11 +177,11 @@ void gd_clipboard_init(GtkDisplayState *gd)
>      qemu_clipboard_peer_register(&gd->cbpeer);
>  
>      gd->gtkcb[QEMU_CLIPBOARD_SELECTION_CLIPBOARD] =
> -        gtk_clipboard_get(gdk_atom_intern("CLIPBOARD", FALSE));
> +        gtk_clipboard_get(GDK_SELECTION_CLIPBOARD);
>      gd->gtkcb[QEMU_CLIPBOARD_SELECTION_PRIMARY] =
> -        gtk_clipboard_get(gdk_atom_intern("PRIMARY", FALSE));
> +        gtk_clipboard_get(GDK_SELECTION_PRIMARY);
>      gd->gtkcb[QEMU_CLIPBOARD_SELECTION_SECONDARY] =
> -        gtk_clipboard_get(gdk_atom_intern("SECONDARY", FALSE));
> +        gtk_clipboard_get(GDK_SELECTION_SECONDARY);
>  
>      g_signal_connect(gd->gtkcb[QEMU_CLIPBOARD_SELECTION_CLIPBOARD],
>                       "owner-change", G_CALLBACK(gd_owner_change), gd);
> 


