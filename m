Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 304FE303E32
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 14:11:25 +0100 (CET)
Received: from localhost ([::1]:59742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4O7v-00042V-0i
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 08:11:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1l4O6C-0003Ni-Qd
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 08:09:36 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:43975)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1l4O6B-0005PG-AG
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 08:09:36 -0500
Received: by mail-ed1-x530.google.com with SMTP id n6so19638078edt.10
 for <qemu-devel@nongnu.org>; Tue, 26 Jan 2021 05:09:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=6U9jc1GUpP4avLrTuNGkxIy22o5xUTadzhnm1SLPtdM=;
 b=uQ06pVpKgLlLmo5uMnIQwYrxpkMfOZlFwl19FaKKUBHslQSTG1PCD2pALmGBTOHCSV
 /+U6P05md/AbN4pxpmWOpNLnChFE0kdN6fs3RoiAOs57TQI8TtPhwJI4K6zi/IWZ7kIZ
 +epDzUXQnI9F/sjWO0aLjOLDdOkVr+LRh35I6wXPozk6Ne632pPC+6SlGDcgzKcXwxHL
 aV5gYYgiacs7i99+dgSwxF70cyXUnlroxRe5frRR8oHwDf3tg/Qn/V8FSiIy785WtQJJ
 gG+cWZvKnELBe3m4oc862HYKp66bwETyRnbYoddVuGxtrvLkNIzPxVwa/hCXimTvyV3m
 YUJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=6U9jc1GUpP4avLrTuNGkxIy22o5xUTadzhnm1SLPtdM=;
 b=Q2/taBw9GCWp5g7ndf6SUFUt1dc4fXtU3HG+DA9a3mEt0xVIlMbskCNT283+OCQ9OF
 s3t3UbquJ05hSWIA0Yo3gBfMIooldKLZtvhGHI7N3CvTv2sD5pI0roiy7CiSDUbGF2sK
 c3VpMWHcHv3En6nSMTlDBy9MiyLrqmT+Y1aUWNIrBmqoBkWx1vpYGCvvbMIB4tCfPhxc
 prqOXsdMJUkj2PpuIVnAA8uZXYECDtKrsbXVX3X+yNeXCsj74inpq0ortKijzfSZOJaR
 wJlwXFTPCyg9K+tjs+fZV02QqlfhsZPyavhM5svY5QRChjNSdX52ZWkNAM1xCQKaFJJb
 UJ9Q==
X-Gm-Message-State: AOAM531mplmVE/yptKsg/TShSD1QB32AM2xYSS5Vvy3tc8SvOE89LuA7
 xPCH43DhIujoCgGVA2Qcm+3IfGqFNNDelCmMdAg=
X-Google-Smtp-Source: ABdhPJwRzTU6EYwHYafWSPfaAMYvZvDx9KcgnN9MarQDxBRZCMKBiYT9Iy0Jol93RMvkvDQ8DxadPN6oYvL7TjvL2eQ=
X-Received: by 2002:a05:6402:757:: with SMTP id
 p23mr4602373edy.245.1611666573717; 
 Tue, 26 Jan 2021 05:09:33 -0800 (PST)
MIME-Version: 1.0
References: <20210126124240.2081959-1-armbru@redhat.com>
 <20210126124240.2081959-2-armbru@redhat.com>
In-Reply-To: <20210126124240.2081959-2-armbru@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 26 Jan 2021 17:09:21 +0400
Message-ID: <CAJ+F1CKZ+b+EUE3sgq-v3jmXedvBJELMO0HQYpy_MJRRzwXMgQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] backends/dbus-vmstate: Fix short read error handling
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ed1-x530.google.com
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

On Tue, Jan 26, 2021 at 4:43 PM Markus Armbruster <armbru@redhat.com> wrote=
:
>
> When dbus_vmstate_post_load() fails, it complains to stderr.  Except
> on short read, where it checks with g_return_val_if_fail().  This
> fails silently if G_DISABLE_CHECKS is undefined (it should be), or
> else pads the short read with uninitialized bytes.
>
> Replace g_return_val_if_fail() by a proper error check.
>
> Fixes: 5010cec2bc87dafab39b3913c8ca91f88df9c540
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

thanks

> ---
>  backends/dbus-vmstate.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/backends/dbus-vmstate.c b/backends/dbus-vmstate.c
> index bd050e8e9c..2a0d2e4a31 100644
> --- a/backends/dbus-vmstate.c
> +++ b/backends/dbus-vmstate.c
> @@ -229,7 +229,10 @@ static int dbus_vmstate_post_load(void *opaque, int =
version_id)
>                                       &bytes_read, NULL, &err)) {
>              goto error;
>          }
> -        g_return_val_if_fail(bytes_read =3D=3D len, -1);
> +        if (bytes_read !=3D len) {
> +            error_report("%s: Short read", __func__);
> +            return -1;
> +        }
>          id[len] =3D 0;
>
>          trace_dbus_vmstate_loading(id);
> --
> 2.26.2
>
>


--=20
Marc-Andr=C3=A9 Lureau

