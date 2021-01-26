Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E50B303E3B
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 14:12:12 +0100 (CET)
Received: from localhost ([::1]:60702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4O8h-0004VG-4M
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 08:12:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1l4O6P-0003ZH-AS
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 08:09:49 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:41128)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1l4O6N-0005Sw-8C
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 08:09:49 -0500
Received: by mail-ej1-x632.google.com with SMTP id g12so22852489ejf.8
 for <qemu-devel@nongnu.org>; Tue, 26 Jan 2021 05:09:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=o589BE9ZZ/mvlWm7cv3uz4bbhn7SR1z2YrhnuwTSzhA=;
 b=HQAlkjpAwE/CrxYRB1SUGlxA0sYAHbsWeH/kDgigUfG+H4BlQS/9ZiPPGEwy3h/l2n
 WLuRL8uD7pyhPXYBG2ds3pVH4wloKBi/IHPiFC49V/u+Iciab3gFRFwK8+xvD3zlugg0
 Pix5LBF/IcLUDuiMJu2Y5YsK2pFoz+2MLMsFFXeMHAfNThR4Vyd8tqWpU3VnODZHBXpE
 FV29BOiO7UI3JqORcfgI7ek7sasm7s66wKHC4yVA+Pr245tQPGcw2vg3vgLi848BcgCT
 yZZOXdK2UJVJPSF1fvS04BdNU76Pz9IKoNakJARaDtop+fjX/QEF+hic53qPNjRl+WRN
 HrKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=o589BE9ZZ/mvlWm7cv3uz4bbhn7SR1z2YrhnuwTSzhA=;
 b=uGVv9QrgpMRhgX6VanvG9LFpwz/S7mUsUWB6XhhbufSWZqxX03b4evx3gqrVNZ3YP7
 xbavTSC5BKPMasehnVdql09LDG5bUSmMHWK17M3eFy+6tvU0eENn+zm+F0PFHZBg7s3J
 43A3aDV0iykRhCJtBc0JG7UVeefDbep4qolGiqT0Sybtu9heDB5vuSF99VfZYiHvXH/R
 SLBMOuwUffscjpcRAsM4BUwS+l/kNr7XrOdHbhfWRZdv9SRn6KKJWSIbL56CDY1/9VUu
 j6FePnDWTYcxAxAYLZuWGMA+1eccwWTBZOO8hGhpQQxfRxbN4aHkiEsGvrJjglth8J7F
 ubpw==
X-Gm-Message-State: AOAM532H5DAVczaVOA+n6FI6JNxGw3UGfcdMBuG0Ve3FJaczQVs6Orpc
 OimvKuJe4hrPPTeQVar/233e9spnMofj5KwAbEA=
X-Google-Smtp-Source: ABdhPJysztcwZhGo6SvmxIdIz2D2RCcChY3FJl9r2afBciH8oPdEE+6R2am6k/h8t3Z4z9oTlHDATyPNzcMrXZ32E0o=
X-Received: by 2002:a17:906:2b9b:: with SMTP id
 m27mr3465160ejg.92.1611666585884; 
 Tue, 26 Jan 2021 05:09:45 -0800 (PST)
MIME-Version: 1.0
References: <20210126124240.2081959-1-armbru@redhat.com>
 <20210126124240.2081959-3-armbru@redhat.com>
In-Reply-To: <20210126124240.2081959-3-armbru@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 26 Jan 2021 17:09:34 +0400
Message-ID: <CAJ+F1C+v9XCk2xRO_m8zWu-sdN+NdNuJHMU_UK-grZw0j_nRtA@mail.gmail.com>
Subject: Re: [PATCH 2/2] vhost_user_gpu: Drop dead check for g_malloc() failure
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, QEMU <qemu-devel@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 26, 2021 at 4:47 PM Markus Armbruster <armbru@redhat.com> wrote=
:
>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>


Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

thanks

> ---
>  hw/display/vhost-user-gpu.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/hw/display/vhost-user-gpu.c b/hw/display/vhost-user-gpu.c
> index 51f1747c4a..db042c7c5e 100644
> --- a/hw/display/vhost-user-gpu.c
> +++ b/hw/display/vhost-user-gpu.c
> @@ -332,7 +332,6 @@ vhost_user_gpu_chr_read(void *opaque)
>      }
>
>      msg =3D g_malloc(VHOST_USER_GPU_HDR_SIZE + size);
> -    g_return_if_fail(msg !=3D NULL);
>
>      r =3D qemu_chr_fe_read_all(&g->vhost_chr,
>                               (uint8_t *)&msg->payload, size);
> --
> 2.26.2
>
>


--=20
Marc-Andr=C3=A9 Lureau

