Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A03B36C00B9
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Mar 2023 12:12:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pdqxB-00054e-2l; Sun, 19 Mar 2023 07:11:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pdqx9-00054Q-0c
 for qemu-devel@nongnu.org; Sun, 19 Mar 2023 07:11:55 -0400
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pdqx7-0006Q4-Do
 for qemu-devel@nongnu.org; Sun, 19 Mar 2023 07:11:54 -0400
Received: by mail-lf1-x12f.google.com with SMTP id j11so11598622lfg.13
 for <qemu-devel@nongnu.org>; Sun, 19 Mar 2023 04:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679224311;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0ycESi84KEZsdEqDtbGbHLTDTWQ63DEDUF3PvLFNuqs=;
 b=k7xNriQlcqgZYasrtBJLwOw3wnQNUsGKcnf8lcdEzd7O2JmmtYufnzqBP1L//0rpL3
 ZQUMfVD4MuGt5ZUIfwG28QgmIVz2RFUQv8+PthMdCy4NAixwwlmcxsMYpg9U2EAWbwQ5
 n9BBbluc7PDz6BHlsx7e1bqLy/u+A6vV0z3gy9iWkMDmfNixHyqh62vs2JhUPWtd85H3
 fJLtSNNd4mUBH9oUdCwdGrVupKI0tWEaIfQLygqegFg4ierGxZvohAxQj2wQvoBZQXSI
 9tE/GtQeuk1RMe7wrBm4VbSTIckYj7gzC8m2j0J+9r1PBoaG7KosfPcruh96ETnBEVVP
 tcfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679224311;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0ycESi84KEZsdEqDtbGbHLTDTWQ63DEDUF3PvLFNuqs=;
 b=kg3Tnu0nUpnkP7yPS6Udisk+PqXl3cRgKyu9pHZRC56yxCZhAUuVl17X28ikM6aacR
 vxRGwrhOfRYK5ve6DceA8LYKK3/95SfAwBTtehxpyR0xyOyVkJm9TavpjKDh8Z1Htjtu
 kmDnTBsxsm7vXdI8Exxjgw2z/RE04Ba+aQCNSiYzukIdQvC5cgTRRVcbR7xyLnZPXAkn
 eD4tWXIWtx+jqhQV48nJZ60ekfbvaLDKS9hWGu3bAPPymP4U7DGq7Y8JqMZg+XEQU8Pj
 zT0cf7uhCtMdfJIsDy+54SUXqccxbKKJx4UMKmEEgxgYWaSft/iXIZ3+YXWR5o1KaKJu
 24vw==
X-Gm-Message-State: AO0yUKV0V2YoMdAPWzvvcOwj94Nq6vLP78p7QYxenY4Gy+xQ9VBeVYSa
 cP8c9jnmajr9JNr/suTFm+G0GFaq0KetSauDZxE=
X-Google-Smtp-Source: AK7set/Nqa8kQ7v/Pr+kHkw9ckRcy47fBAzIvR8enbFQ2xPyCKesoo1NvhZwYKH185ARftaq0ZamGfKrbQq7Vvzf5Kw=
X-Received: by 2002:ac2:4c13:0:b0:4e8:c8f1:a010 with SMTP id
 t19-20020ac24c13000000b004e8c8f1a010mr3707154lfq.11.1679224310801; Sun, 19
 Mar 2023 04:11:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230318173132.98068-1-shentey@gmail.com>
In-Reply-To: <20230318173132.98068-1-shentey@gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Sun, 19 Mar 2023 15:11:39 +0400
Message-ID: <CAJ+F1CKFiP6_bv62t61zAuzOqbTo_vNagNHj8=QEYOnM4cT8bQ@mail.gmail.com>
Subject: Re: [PATCH for-8.0] Revert "ui: set cursor position upon listener
 registration"
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::12f;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x12f.google.com
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

Hi

On Sat, Mar 18, 2023 at 9:33=E2=80=AFPM Bernhard Beschow <shentey@gmail.com=
> wrote:
>
> Commit 6effaa16ac98 ("ui: set cursor position upon listener registration"=
)
> causes the mouse cursor to be placed into the lower left corner when QEMU
> starts. This could be reproduced with just by running
> `qemu-system-x86_64`.
>
> This reverts commit 6effaa16ac9846e7d6197ee54a0551fba61aecd7.

What display do you test with, gtk on x11?
thanks

>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>  ui/console.c | 7 -------
>  1 file changed, 7 deletions(-)
>
> diff --git a/ui/console.c b/ui/console.c
> index f3783021e5..35f8274aab 100644
> --- a/ui/console.c
> +++ b/ui/console.c
> @@ -95,7 +95,6 @@ struct QemuConsole {
>      QemuUIInfo ui_info;
>      QEMUTimer *ui_timer;
>      QEMUCursor *cursor;
> -    int cursor_x, cursor_y, cursor_on;
>      const GraphicHwOps *hw_ops;
>      void *hw;
>
> @@ -1666,9 +1665,6 @@ void register_displaychangelistener(DisplayChangeLi=
stener *dcl)
>      if (con && con->cursor && dcl->ops->dpy_cursor_define) {
>          dcl->ops->dpy_cursor_define(dcl, con->cursor);
>      }
> -    if (con && dcl->ops->dpy_mouse_set) {
> -        dcl->ops->dpy_mouse_set(dcl, con->cursor_x, con->cursor_y, con->=
cursor_on);
> -    }
>      text_console_update_cursor(NULL);
>  }
>
> @@ -1913,9 +1909,6 @@ void dpy_mouse_set(QemuConsole *con, int x, int y, =
int on)
>      DisplayState *s =3D con->ds;
>      DisplayChangeListener *dcl;
>
> -    con->cursor_x =3D x;
> -    con->cursor_y =3D y;
> -    con->cursor_on =3D on;
>      if (!qemu_console_is_visible(con)) {
>          return;
>      }
> --
> 2.40.0
>
>


--=20
Marc-Andr=C3=A9 Lureau

