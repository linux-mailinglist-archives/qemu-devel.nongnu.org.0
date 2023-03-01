Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A7B6A6835
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 08:35:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXGyv-0008EL-Js; Wed, 01 Mar 2023 02:34:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pXGys-000886-Rl
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 02:34:31 -0500
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pXGyr-0003Lx-6Z
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 02:34:30 -0500
Received: by mail-lf1-x132.google.com with SMTP id bi9so16455786lfb.2
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 23:34:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677656067;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EbPmmveDsoDfWAtTxQnh+QD2BWzalgjH7HztOoHMIC8=;
 b=fnCta4iL93FyUmd6ZTlIq9oUnRiWnFq9xvfP2oyw98S7wZj97qkzQb7+N577ayEBXY
 ph9oorQf3G45Q08xykPUilUONI+3T1J8MPEx3S0y32kiD6oORQKlaF40AzIRSV1iebL1
 HVaJPj4uWg0oQPDGRHmNXsraxw3tiy7bVj5rs76m064/Xe0MCR7LKW8fJ62Ka29XZRt/
 WZPB28SwP7qmL7SZjdu7okFHgLLfy8hu1/grm5YXYqCIwvxnnYqzd3arQ3M0VbxMI5EX
 nqof27uK15dN20MB902WmT/PCryPf/GSHBQ9l0IYjyp0qPiMrF0x4/nJTkJL9m66Txvn
 6biA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677656067;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EbPmmveDsoDfWAtTxQnh+QD2BWzalgjH7HztOoHMIC8=;
 b=3jxqTyFJVDiRCIgpI3dXOKTyJdpHWD3dCcal01y7v9lfIIw1T1oySPR1B62mlzqPkH
 pv9Im4Qx/4BQf9hDylvfi0HkRNQK8//sFv4K88z/HLKZby5C1FyltPqGYevG9RipL1bU
 9ff1XK0O7n6Xn1QuiB+TD+dqyM05pnoEh42pTRTflkzYxHOXu9G/Z7EiFy3rqrdsZOqm
 eXWGNgQY1bIsv+WCOu6iyyON5MIAYSLq4Np99ZupaZ9bOOdYBrwALHGkemEjDzWMlchM
 xB0zdnZbEczC6YYAiuM+YiQAT5DLSR7j7uxwYVAHKX/PUB3x5Yu+tEAqxVdsHB7yXuUj
 DVBg==
X-Gm-Message-State: AO0yUKWL8vXcdIBMTmdnRqtKZMn4fz2npkN28K4zcTr4jbhizrGfYAgL
 AbA7vrvmeZuOB/TazRWlRuoPU2zjKReLmhTrQnc=
X-Google-Smtp-Source: AK7set+qgtRBBskGJCbsr8PR8af5vvK9ZbrQIq+To3tdQOiN4oqSVDGu7DyCORLJMm7idFejPsFE+Kwv+7RZ6pZLEqQ=
X-Received: by 2002:ac2:5690:0:b0:4db:33ed:89eb with SMTP id
 16-20020ac25690000000b004db33ed89ebmr1559849lfr.5.1677656066989; Tue, 28 Feb
 2023 23:34:26 -0800 (PST)
MIME-Version: 1.0
References: <cover.1677617035.git.dxu@dxuuu.xyz>
 <3f1aaa1fb5b5fa6daaf4e0080faeb4b094030a06.1677617035.git.dxu@dxuuu.xyz>
In-Reply-To: <3f1aaa1fb5b5fa6daaf4e0080faeb4b094030a06.1677617035.git.dxu@dxuuu.xyz>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 1 Mar 2023 11:34:15 +0400
Message-ID: <CAJ+F1CLz86=kvYCea1eR6waWC_0Jka+ssWHnqA3avOFeQjHNQg@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] qemu-keymap: Fix memory leaks
To: Daniel Xu <dxu@dxuuu.xyz>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::132;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x132.google.com
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

On Wed, Mar 1, 2023 at 12:48 AM Daniel Xu <dxu@dxuuu.xyz> wrote:
>
> When building with `--enable-sanitizers`, I was getting quite a few
> memory leak crashes from ASAN:
>
>         [21/574] Generating pc-bios/keymaps/fr-ch with a custom command
>         FAILED: pc-bios/keymaps/fr-ch
>         /home/dxu/dev/qemu/build/qemu-keymap -f pc-bios/keymaps/fr-ch -l =
ch -v fr
>
>         =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>         =3D=3D3232549=3D=3DERROR: LeakSanitizer: detected memory leaks
>
>         Direct leak of 1424 byte(s) in 1 object(s) allocated from:
>             #0 0x7f32636bf411 in __interceptor_calloc /usr/src/debug/gcc/=
gcc/...
>             #1 0x7f32635db73e  (/usr/lib/libxkbcommon.so.0+0x2273e)
>
> Fix leaks by correctly decrementing refcounts on xkb structs.
>
> Signed-off-by: Daniel Xu <dxu@dxuuu.xyz>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>  qemu-keymap.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/qemu-keymap.c b/qemu-keymap.c
> index 229866e004..ed8cee3467 100644
> --- a/qemu-keymap.c
> +++ b/qemu-keymap.c
> @@ -203,6 +203,7 @@ int main(int argc, char *argv[])
>      map =3D xkb_keymap_new_from_names(ctx, &names, XKB_KEYMAP_COMPILE_NO=
_FLAGS);
>      if (!map) {
>          /* libxkbcommon prints error */
> +        xkb_context_unref(ctx);
>          exit(1);
>      }
>
> @@ -227,7 +228,11 @@ int main(int argc, char *argv[])
>      state =3D xkb_state_new(map);
>      xkb_keymap_key_for_each(map, walk_map, state);
>      xkb_state_unref(state);
> +    xkb_keymap_unref(map);
> +    xkb_context_unref(ctx);
>      state =3D NULL;
> +    map =3D NULL;
> +    ctx =3D NULL;
>
>      /* add quirks */
>      fprintf(outfile,
> --
> 2.39.1
>


--=20
Marc-Andr=C3=A9 Lureau

