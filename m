Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83231639C3B
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Nov 2022 19:16:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozMBU-00070E-82; Sun, 27 Nov 2022 13:15:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1ozMBH-0006zy-ET
 for qemu-devel@nongnu.org; Sun, 27 Nov 2022 13:15:07 -0500
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1ozMBF-0008O8-UC
 for qemu-devel@nongnu.org; Sun, 27 Nov 2022 13:15:07 -0500
Received: by mail-yb1-xb29.google.com with SMTP id d128so10788290ybf.10
 for <qemu-devel@nongnu.org>; Sun, 27 Nov 2022 10:15:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QptXnrRTrxsxHI5+2SM9cByHfqJtynr13n8sR5kColo=;
 b=b2M+6GnRP0bkQEe2vQcXw6AL5MIOH37+KQyVTQaWVNVrC989rzHv2pIHb/J9nBXK5D
 k8t8oFba8AVEy1ScfjGeFrcMHptzw+cb10lwjHHoLBGq+9Seqw1JSc9OwWgmi5dq6m/0
 m2pmMzYiaTqam/nMsZa7ba+CeloLXoA4Ygk57wGLiMAdDItBjvVsqnbbX4uyXIqS0tfn
 E/2JRZRdaFHnD4mturcpkPjQMhRWSTKpBCk7V9HJdH4BUYZmbqb+655n/iWQd7hBJSVN
 f5ESPgFUXbLjn/5EXR3IfZO6xFYi4tujoyBKukVfvvoBU5QOvXZaBoapxgrHTzCcmg3n
 oEww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QptXnrRTrxsxHI5+2SM9cByHfqJtynr13n8sR5kColo=;
 b=1CxHG+j5n3RCho/LnxKydoI6Fp5SF4Tb0MQsbgb/WuB9SQ0JuuFikROpjUervI4Tsw
 xzJQl9uMi4ex6UD8Fs9/Q7PRXAG4uxvoRK8fuLyqp57yV2tOCVsq8dhpfasGiwVyWEbo
 Wx9AQ2GV2x3QJ4EaA6KweKibEInvB58v9foqzuVRhpAKhdEuZW2uztmLv+Ht4nWYrELP
 2lAs0XAw8QMNAK/aY2L79eNm73PWUS4cZnpBteOoufhGTABw7pHjgiQJK6Vv9MkS0Qc2
 Lk63lYdEFTaCKOW+zuVTB0BKvGSpgLKnwkLZPwXFOmzHKRv1qfZWqxjshC2x1tYD0KhB
 JQEA==
X-Gm-Message-State: ANoB5pnPQMHAUQ8LA16SFCIWAlFIzIkLe6Fk/9B2jxjtcQVOG0bm5FgX
 hD/c8KgyicECHTmEPa1yp1WWv2KJBy/bUJo/qgs=
X-Google-Smtp-Source: AA0mqf4DDrGtxhFUSGm0nxemn9jD7TupCaNKScj6+eMRZ2Q4OCVacmFwXhs7z+Z45xShKJz+Y/cKzHpIdrh9aiIITxY=
X-Received: by 2002:a25:bcf:0:b0:6f2:a9c3:cbad with SMTP id
 198-20020a250bcf000000b006f2a9c3cbadmr14173938ybl.118.1669572904769; Sun, 27
 Nov 2022 10:15:04 -0800 (PST)
MIME-Version: 1.0
References: <20221126152507.283271-1-sw@weilnetz.de>
 <20221126152507.283271-5-sw@weilnetz.de>
In-Reply-To: <20221126152507.283271-5-sw@weilnetz.de>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Sun, 27 Nov 2022 13:14:52 -0500
Message-ID: <CAJSP0QX-Uo3y_DD7qvWZqBuVdS+LTnk=4jp6jWf9e6T38S06Bg@mail.gmail.com>
Subject: Re: [PATCH v3 for-7.2 4/6] libvhost-user: Add format attribute to
 local function vu_panic
To: Stefan Weil <sw@weilnetz.de>
Cc: qemu-devel@nongnu.org, "Michael S . Tsirkin" <mst@redhat.com>, 
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b29;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb29.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Sat, 26 Nov 2022 at 10:25, Stefan Weil <sw@weilnetz.de> wrote:
>
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> Message-Id: <20220422070144.1043697-4-sw@weilnetz.de>
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> ---
>  subprojects/libvhost-user/libvhost-user.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)

I would rather not merge something that can cause new build failures
this late in the release cycle.

If you respin, please make this a separate 8.0 patch.

> diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/libv=
host-user/libvhost-user.c
> index 80f9952e71..d6ee6e7d91 100644
> --- a/subprojects/libvhost-user/libvhost-user.c
> +++ b/subprojects/libvhost-user/libvhost-user.c
> @@ -45,6 +45,17 @@
>  #include "libvhost-user.h"
>
>  /* usually provided by GLib */
> +#if     __GNUC__ > 2 || (__GNUC__ =3D=3D 2 && __GNUC_MINOR__ > 4)
> +#if !defined(__clang__) && (__GNUC__ =3D=3D 4 && __GNUC_MINOR__ =3D=3D 4=
)
> +#define G_GNUC_PRINTF(format_idx, arg_idx) \
> +  __attribute__((__format__(gnu_printf, format_idx, arg_idx)))
> +#else
> +#define G_GNUC_PRINTF(format_idx, arg_idx) \
> +  __attribute__((__format__(__printf__, format_idx, arg_idx)))
> +#endif
> +#else   /* !__GNUC__ */
> +#define G_GNUC_PRINTF(format_idx, arg_idx)
> +#endif  /* !__GNUC__ */
>  #ifndef MIN
>  #define MIN(x, y) ({                            \
>              typeof(x) _min1 =3D (x);              \
> @@ -151,7 +162,7 @@ vu_request_to_string(unsigned int req)
>      }
>  }
>
> -static void
> +static void G_GNUC_PRINTF(2, 3)
>  vu_panic(VuDev *dev, const char *msg, ...)
>  {
>      char *buf =3D NULL;
> --
> 2.35.1
>

