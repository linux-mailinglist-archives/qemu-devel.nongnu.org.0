Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75C0A60DC5A
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 09:41:51 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onb0R-0001aa-Hm; Wed, 26 Oct 2022 03:39:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1onb0O-0001Nn-GK
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 03:39:16 -0400
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1onb0M-0003s3-Ot
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 03:39:16 -0400
Received: by mail-lf1-x136.google.com with SMTP id f37so26898597lfv.8
 for <qemu-devel@nongnu.org>; Wed, 26 Oct 2022 00:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=91CPOdDQ9LMzbOEab1snaRjNdjfUahwY+QSQro0dnUU=;
 b=EcPUvuMPYtGCVh5nVeV/jDQeaqz3d+99hL+Z4JTZ2DupahQjVwHhir2XvYarpR89I5
 6X2cmpDuCFwTJCLwjeM5XKpiopPDm5TP8nHHeQNhuZ5+LYLHIKzeoE0D7D0LujtOE1zu
 +Zn1gUDlVvm8W8647zj4hdNmjJVufNhSZaL+U6hxA+HkarR3N23VoZzXPJUpgY9ZPIVD
 Ba5OPxOSdpuHDRpLEpNfPF5hlavc8hFBHs0mF2WybzvGQfhFjV5MRxY6TpKjimtd4565
 wKJLVKUmR1rwkJU6DBcgd//Wb7ZW/HT83RNqu3ZDWc6/x0yCB9PPHRVeRPmF4+q9UOSR
 zKnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=91CPOdDQ9LMzbOEab1snaRjNdjfUahwY+QSQro0dnUU=;
 b=v/hlzXgwe64ClFKHohyUkz+EAfRi92nRoANymfNhjzgmAmZUydLy2zuvl3iLfSKwOt
 7g9zP4yz94sEVCMxRWw0kn2JawyGlZsPaRwwOnnEZEXoG3KIUWXbh7R6VN6Jje5cmhmL
 lJmy+d+pChgvxrhUy0u8cR2IXXVI6rjtjNNjjZeUmcsZZUZmkKQ00FSaJQyrk2IdSxPe
 mLRwNsJKkkBIkDA7MqarS/zDiYOEcvXzFsOEv4u+l3O0Bnj0xV+E8hf1l9pyUFXEFbMk
 k+LwlIXxnXKiqzml0ixAmGbeggTTiqBos0pBFGbACMSb+e7WbR2bzynE7odvOP9rt96V
 eUuw==
X-Gm-Message-State: ACrzQf2255xbFsHnHXaK3hfHaF7Ue04/PhxGBZdqmUq4N5QtHJwJV9VI
 r92L618sxJTFwiv/IdeaH6YJripdEYti6RF0sd8=
X-Google-Smtp-Source: AMsMyM4DxwgPoC4zhWptCB6WMQvW3MA6HPCVt4slxRsCQ3fp8sdUnNeEttcc6awc9mYWKyc3C+G15E2fIKSLt6X3/s4=
X-Received: by 2002:a05:6512:3d1d:b0:4a2:588b:d78 with SMTP id
 d29-20020a0565123d1d00b004a2588b0d78mr17285214lfv.375.1666769951224; Wed, 26
 Oct 2022 00:39:11 -0700 (PDT)
MIME-Version: 1.0
References: <20221025141015.612291-1-bin.meng@windriver.com>
In-Reply-To: <20221025141015.612291-1-bin.meng@windriver.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 26 Oct 2022 11:38:59 +0400
Message-ID: <CAJ+F1CKueW5uhTe8CCdnthJmmaLO7vvHtANqZ4N6wUjGc9qpGQ@mail.gmail.com>
Subject: Re: [PATCH] chardev/char-win-stdio: Pass Ctrl+C to guest with a
 multiplexed monitor
To: Bin Meng <bin.meng@windriver.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::136;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x136.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Oct 25, 2022 at 6:15 PM Bin Meng <bin.meng@windriver.com> wrote:
>
> At present when pressing Ctrl+C from a guest running on QEMU Windows
> with a multiplexed monitor, e.g.: -serial mon:stdio, QEMU executable
> just exits. This behavior is inconsistent with the Linux version.
>
> Such behavior is caused by unconditionally setting the input mode
> ENABLE_PROCESSED_INPUT for a console's input buffer. Fix this by
> testing whether the chardev is allowed to do so.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>
>  chardev/char-win-stdio.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/chardev/char-win-stdio.c b/chardev/char-win-stdio.c
> index a4771ab82e..eb830eabd9 100644
> --- a/chardev/char-win-stdio.c
> +++ b/chardev/char-win-stdio.c
> @@ -146,6 +146,8 @@ static void qemu_chr_open_stdio(Chardev *chr,
>                                  bool *be_opened,
>                                  Error **errp)
>  {
> +    ChardevStdio *opts =3D backend->u.stdio.data;
> +    bool stdio_allow_signal =3D !opts->has_signal || opts->signal;
>      WinStdioChardev *stdio =3D WIN_STDIO_CHARDEV(chr);
>      DWORD              dwMode;
>      int                is_console =3D 0;
> @@ -193,7 +195,11 @@ static void qemu_chr_open_stdio(Chardev *chr,
>      if (is_console) {
>          /* set the terminal in raw mode */
>          /* ENABLE_QUICK_EDIT_MODE | ENABLE_EXTENDED_FLAGS */
> -        dwMode |=3D ENABLE_PROCESSED_INPUT;
> +        if (stdio_allow_signal) {
> +            dwMode |=3D ENABLE_PROCESSED_INPUT;
> +        } else {
> +            dwMode &=3D ~ENABLE_PROCESSED_INPUT;
> +        }
>      }
>
>      SetConsoleMode(stdio->hStdIn, dwMode);
> --
> 2.25.1
>
>


--=20
Marc-Andr=C3=A9 Lureau

