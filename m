Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E37F66B807
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 08:18:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHJkQ-0003EJ-8Z; Mon, 16 Jan 2023 02:17:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pHJkE-0003Cc-BA
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 02:17:35 -0500
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pHJkB-0003vz-ER
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 02:17:26 -0500
Received: by mail-lj1-x230.google.com with SMTP id e16so2202326ljn.3
 for <qemu-devel@nongnu.org>; Sun, 15 Jan 2023 23:17:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KGMxtT1mNHLLjKF0shfd/CbAZuum4mCKtBWvzSl9Xco=;
 b=WB31r4smnmy6HRj35SC9t0Ahlk0xwtXsYOaadiibOPoxiQmwm4r6JwhrMT5PfLHF61
 zBqfO5obWgekPlmZTrJsWz6nmQ37Fnl2ga0YeNwpuF8oz1tAdI9m9gZfZS/hLcbNR/Zo
 Kc30oMeV5g/WWmT5oek/ty7n5XMKPVdukiFu7IUlUqyRvgx8I367wU7pwQHn3eaSyENZ
 q9juXJktQRmc4QSpMUPCMYAL7u/Fj5ukwqY+0ICJmSbUfr17Kp4gMDvclzkH9C6ZxIbA
 2D5VF1Oxfr9hjdIRoxJy+jBxRZlhVmxf6hHMdmv9Xct63p1y98DyljTw1GR/PWUj3tIU
 ve2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KGMxtT1mNHLLjKF0shfd/CbAZuum4mCKtBWvzSl9Xco=;
 b=bUa9AtrbAvsFUFlwf1T5SBD0qgRPA8jPAPh0LjBj/RNtsv2xpvjNruWreezxE3HN2b
 gThHPkoM8pLeJ8iO9oo4UrKTPT6oeTLYIhlLU5qR9mNIB2bIrDKjBAQPIIcxTU3KsX85
 CEbYshRwA01kQJxNFlRLqC23J4OZCt/FGN1AXPK+SyYzMzv4D3TOsLR5KnlSMrFOilBn
 6lYU/zZuxbtOeLrHdTit0eh/jAJrP4CYBwUiMXwsWcYON03RZY4EeRntpm7wNGRxRbRa
 TK2a6P8NmHokAzKHOwwPyuGBbqbc/lvEJ0cNlJlSiVhvth22cXTEZvWw3MW7Cz+mb3Si
 sZMA==
X-Gm-Message-State: AFqh2kocdJ3gUqhDikCgjKjsNuh0PJ+WR0w6Ri8pITMjxj5Qk1d4RT3+
 13QJep/K3sqIJYZ9JIN1HBWZvqlVVAKgbm52d/A=
X-Google-Smtp-Source: AMrXdXvQqsXMkOa0ClF0VjJgKsro3KnhUODsmtqPo5pl0m50KpJat8Ne6L2xl7bCx5udFoqfJbRATCqzJcc2mFCCByI=
X-Received: by 2002:a05:651c:b1e:b0:280:78f1:8b85 with SMTP id
 b30-20020a05651c0b1e00b0028078f18b85mr1890079ljr.449.1673853440128; Sun, 15
 Jan 2023 23:17:20 -0800 (PST)
MIME-Version: 1.0
References: <20230116013421.3149183-1-jeb.study@gmail.com>
In-Reply-To: <20230116013421.3149183-1-jeb.study@gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 16 Jan 2023 11:17:08 +0400
Message-ID: <CAJ+F1C+x3tSHAb6LbL+GK0m08UuKCS0RWygz41gMFycqL0JrrQ@mail.gmail.com>
Subject: Re: [PATCH v2] Fix exec migration on Windows (w32+w64).
To: "John Berberian, Jr" <jeb.study@gmail.com>
Cc: qemu-devel@nongnu.org, Stefan Weil <sw@weilnetz.de>, 
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::230;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x230.google.com
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

On Mon, Jan 16, 2023 at 5:35 AM John Berberian, Jr <jeb.study@gmail.com> wr=
ote:
>
> * Use cmd instead of /bin/sh on Windows.
>
> * Try to auto-detect cmd.exe's path, but default to a hard-coded path.
>
> Note that this will require that gspawn-win[32|64]-helper.exe and
> gspawn-win[32|64]-helper-console.exe are included in the Windows binary
> distributions (cc: Stefan Weil).
>
> Signed-off-by: "John Berberian, Jr" <jeb.study@gmail.com>
> ---
> Whoops, forgot a header. Here's a revised patch.
>
>  migration/exec.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>
> diff --git a/migration/exec.c b/migration/exec.c
> index 375d2e1b54..38604d73a6 100644
> --- a/migration/exec.c
> +++ b/migration/exec.c
> @@ -23,12 +23,31 @@
>  #include "migration.h"
>  #include "io/channel-command.h"
>  #include "trace.h"
> +#include "qemu/cutils.h"
>
> +#ifdef WIN32
> +const char *exec_get_cmd_path(void);
> +const char *exec_get_cmd_path(void)
> +{
> +    g_autofree char *detected_path =3D g_new(char, MAX_PATH);
> +    if (GetSystemDirectoryA(detected_path, MAX_PATH) =3D=3D 0) {
> +        warn_report("Could not detect cmd.exe path, using default.");
> +        return "C:\\Windows\\System32\\cmd.exe";
> +    }
> +    pstrcat(detected_path, MAX_PATH, "\\cmd.exe");
> +    return g_steal_pointer(&detected_path);
> +}
> +#endif
>
>  void exec_start_outgoing_migration(MigrationState *s, const char *comman=
d, Error **errp)
>  {
>      QIOChannel *ioc;
> +
> +#ifdef WIN32
> +    const char *argv[] =3D { exec_get_cmd_path(), "/c", command, NULL };
> +#else
>      const char *argv[] =3D { "/bin/sh", "-c", command, NULL };
> +#endif

It may be a better idea to use g_shell_parse_argv() instead.

>
>      trace_migration_exec_outgoing(command);
>      ioc =3D QIO_CHANNEL(qio_channel_command_new_spawn(argv,
> @@ -55,7 +74,12 @@ static gboolean exec_accept_incoming_migration(QIOChan=
nel *ioc,
>  void exec_start_incoming_migration(const char *command, Error **errp)
>  {
>      QIOChannel *ioc;
> +
> +#ifdef WIN32
> +    const char *argv[] =3D { exec_get_cmd_path(), "/c", command, NULL };
> +#else
>      const char *argv[] =3D { "/bin/sh", "-c", command, NULL };
> +#endif
>
>      trace_migration_exec_incoming(command);
>      ioc =3D QIO_CHANNEL(qio_channel_command_new_spawn(argv,
> --
> 2.39.0
>
>


--=20
Marc-Andr=C3=A9 Lureau

