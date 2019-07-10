Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C5264447
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Jul 2019 11:19:12 +0200 (CEST)
Received: from localhost ([::1]:59254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hl8kp-00064R-0g
	for lists+qemu-devel@lfdr.de; Wed, 10 Jul 2019 05:19:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45535)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1hl8jp-0005BE-9U
 for qemu-devel@nongnu.org; Wed, 10 Jul 2019 05:18:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1hl8jn-0000uq-NL
 for qemu-devel@nongnu.org; Wed, 10 Jul 2019 05:18:09 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:45881)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <aleksandar.m.mail@gmail.com>)
 id 1hl8jn-0000qI-Gi; Wed, 10 Jul 2019 05:18:07 -0400
Received: by mail-ot1-x343.google.com with SMTP id x21so1409947otq.12;
 Wed, 10 Jul 2019 02:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=TfkIJsjeqUROcHWl3drZrM/brmN8+MRc8b8b7cP4CDM=;
 b=UU7imOpscOOvaBTyrJRxPdjRIa1/XDRypuW9zqWcvbaCtoTcYWLl1wJzSzKXTNTa2S
 d79WWflu9gsXnYvYgweFzW4Z9+t9iUsWlhXlWCGYs9szKo/0V5BIuzuNtjI0grp9QhsM
 3KFpKCvyWIwDOjlKsVssHt31DMrbNoQnIod/VKuB2dUvkUU8q6UtBas6AyUCmS0YE8U4
 wNtzFeoFbLPH04kdJcOIXJDywkxH6w4XYWl9swo3slbTwx8Rk9PR4HQrB7RxpV+jJYY4
 CrgJ6CiQzyGdLC/svUs9vP+PEQlXqEb0u7k0VBND8imX2XB0Ajq+QS4i5nLJTcKAYZqp
 pBmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=TfkIJsjeqUROcHWl3drZrM/brmN8+MRc8b8b7cP4CDM=;
 b=Vu6OvLBjl0Tf6RVq0ayo6neyLbSvugn2CsYa93MM677AtqI4HFEAW79VaV+BAflC9S
 tmSfZbrIskxsL9so6qJL2mAM30S26KYc/RDBzSf74UAijYDLfglDuhn5s42xrrfWobkX
 AfZcxhW4Zu6Eykf/jkdFZVM9sBn4qEiyEEIZuKA7BBCdliEQIxlFixBr3NBEw6baVpU6
 suSXK+VVqEi6VdM4hqNBtUr7qcg/NXp8BNXE5p8zhj8yxnSrmHNrWo4+3qemlZO+9yaz
 QaE74OZxXledCzHxyz/FICmxamaidCHX8cJLXQNpDEh/Lg8YUyrAuf+MgqmPNggYB4qP
 yOSQ==
X-Gm-Message-State: APjAAAWtonEJUR9P0X2X8bybdrFwLEB4KW0DGAdFWa24/zWu2KjJ3Tu4
 5MLi5HihLPzrW91pO1arDgJRAVtE6pPlrHyr/js=
X-Google-Smtp-Source: APXvYqzx85w5pAtzh2nrlYTmITXXqiRT0M9OIuujUfXlKPQmnCcru1vOGzWQA9w44fPLEh5sW6SFOlWeqyrUsC0ctV8=
X-Received: by 2002:a05:6830:c6:: with SMTP id x6mr6190688oto.64.1562750280435; 
 Wed, 10 Jul 2019 02:18:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:4798:0:0:0:0:0 with HTTP; Wed, 10 Jul 2019 02:17:59
 -0700 (PDT)
Received: by 2002:a9d:4798:0:0:0:0:0 with HTTP; Wed, 10 Jul 2019 02:17:59
 -0700 (PDT)
In-Reply-To: <20190705160421.19015-6-alex.bennee@linaro.org>
References: <20190705160421.19015-1-alex.bennee@linaro.org>
 <20190705160421.19015-6-alex.bennee@linaro.org>
From: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Date: Wed, 10 Jul 2019 11:17:59 +0200
Message-ID: <CAL1e-=i08h1j0V7d97p7a-OQqdNXzG1s5QATmLDxfGCDtwE-4Q@mail.gmail.com>
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.23
Subject: Re: [Qemu-devel] [PATCH v1 5/5] gdbstub: revert to previous set_reg
 behaviour
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Jon Doron <arilou@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Jul 5, 2019 6:08 PM, "Alex Benn=C3=A9e" <alex.bennee@linaro.org> wrote:
>
> The refactoring of handle_set_reg missed the fact we previously had
> responded with an empty packet when we were not using XML based
> protocols. This broke the fallback behaviour for architectures that
> don't have registers defined in QEMU's gdb-xml directory.
>
> Revert to the previous behaviour and clean up the commentary for what
> is going on.
>
> Fixes: 62b3320bddd
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Cc: Jon Doron <arilou@gmail.com>
> Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---

Do you plan to integrate this patch in 4.1?

Thanks, Aleksandar

>  gdbstub.c | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)
>
> diff --git a/gdbstub.c b/gdbstub.c
> index ea3349d1aa..b6df7ee25a 100644
> --- a/gdbstub.c
> +++ b/gdbstub.c
> @@ -1669,12 +1669,23 @@ static void handle_remove_bp(GdbCmdContext
*gdb_ctx, void *user_ctx)
>      put_packet(gdb_ctx->s, "E22");
>  }
>
> +/*
> + * handle_set/get_reg
> + *
> + * Older gdb are really dumb, and don't use 'G/g' if 'P/p' is available.
> + * This works, but can be very slow. Anything new enough to understand
> + * XML also knows how to use this properly. However to use this we
> + * need to define a local XML file as well as be talking to a
> + * reasonably modern gdb. Responding with an empty packet will cause
> + * the remote gdb to fallback to older methods.
> + */
> +
>  static void handle_set_reg(GdbCmdContext *gdb_ctx, void *user_ctx)
>  {
>      int reg_size;
>
>      if (!gdb_has_xml) {
> -        put_packet(gdb_ctx->s, "E00");
> +        put_packet(gdb_ctx->s, "");
>          return;
>      }
>
> @@ -1694,11 +1705,6 @@ static void handle_get_reg(GdbCmdContext *gdb_ctx,
void *user_ctx)
>  {
>      int reg_size;
>
> -    /*
> -     * Older gdb are really dumb, and don't use 'g' if 'p' is avaialable=
.
> -     * This works, but can be very slow.  Anything new enough to
> -     * understand XML also knows how to use this properly.
> -     */
>      if (!gdb_has_xml) {
>          put_packet(gdb_ctx->s, "");
>          return;
> --
> 2.20.1
>
>
