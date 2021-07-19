Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F243F3CD5C0
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 15:32:59 +0200 (CEST)
Received: from localhost ([::1]:47004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5TOF-0001gf-33
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 09:32:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5TN6-00008Y-HL
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 09:31:48 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:42581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5TN4-0004gw-Bh
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 09:31:48 -0400
Received: by mail-wr1-x432.google.com with SMTP id r11so22039205wro.9
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 06:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=0xoc/fnxKLHsLXk6mab4AUqWYdOSb6wcmuUqJWab+NQ=;
 b=EAUH/9p2U1VEh9RONQANfs/no04zE0lHyB7UgIYnUY+29lFK26OlSLX24XPHBc2qK0
 tX7ZYz0pzQpq9LL/YNrZoYr21FWivdBUpq+1+CLA8Gyk9cBII10UzC0XbJ3WYtl9cWZA
 YboKMxcAcVF7berWtInn86vpZ9zH7ASHuchQ2gzdd/cZKHCWgqeHx2CmzoYbnkkjd9Fk
 Yj4sy/cNcl9jG89+UXIj0jTQK8eH8wF2/rtBl+k52dADuqONR87b42uxksmPdFo4W6J4
 bvswjaKfgRydw03GNQqHJFJULtA249XUszhRKYNT1gyeL3zSmFU4SIwaO167iQ/UR7b1
 uLGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=0xoc/fnxKLHsLXk6mab4AUqWYdOSb6wcmuUqJWab+NQ=;
 b=lAIhpa/xK0kvvuOTgArqeOE6gDQqQIQov3eDIAyypjglNm1lFiuAxVLLsBbyCzmwlu
 tDXTKFlCGLliVDPcFhUQ0aQxbB1zGM+We6RPi1StC2YnOSScH58EL/15KeLRCST2e7qN
 iTFhnYCRpJd3Os/fHY0EW+lTgn4+MoNhRUMZ3LgGp7MtfFIGmvTdgozxFaAgne2lGGRI
 1mvyLnTzemyw/lwqJv3SWV5GPhOJrKyl/2+Y+oHBWQvHfYDT0HB9DDiXPNjnP4jukLm+
 KpRoJPKN+RHwH0UvHfGpkyhdhc9dHqjHdNoy+KV+rgUxvc/wl6kqhYJn6JAGmZw41tbm
 HMqQ==
X-Gm-Message-State: AOAM530hqJo1dmaaqC+zAeVhahx865lkjWGLjuY4UHRgjkxSGVsbBnCa
 lfWET1Qei/pYNnS4eNriZWHZbQ==
X-Google-Smtp-Source: ABdhPJyXItxTAX3O8l9vNMbzDtc5/uJNrT5SiK688aEcVYjxmZf72S58p9dDDb16XjRx7lL6JPmiTg==
X-Received: by 2002:a5d:6209:: with SMTP id y9mr29588633wru.402.1626701504095; 
 Mon, 19 Jul 2021 06:31:44 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id x9sm20550620wrm.82.2021.07.19.06.31.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jul 2021 06:31:42 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id EAC5E1FF7E;
 Mon, 19 Jul 2021 14:31:41 +0100 (BST)
References: <20210717100920.240793-1-ma.mandourr@gmail.com>
 <20210717100920.240793-2-ma.mandourr@gmail.com>
User-agent: mu4e 1.5.14; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Mahmoud Mandour <ma.mandourr@gmail.com>
Subject: Re: [PATCH 01/13] plugins: allow plugin arguments to be passed
 directly
Date: Mon, 19 Jul 2021 14:31:35 +0100
In-reply-to: <20210717100920.240793-2-ma.mandourr@gmail.com>
Message-ID: <87lf62pgzm.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: cota@braap.org, qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Mahmoud Mandour <ma.mandourr@gmail.com> writes:

> Passing arguments to plugins had to be done through "arg=3D<argname>".
> This is redundant and introduces confusion especially when the argument
> has a name and value (e.g. `-plugin plugin_name,arg=3D"argname=3Dargvalue=
"`).
>
> This allows passing plugin arguments directly e.g:
>
>     `-plugin plugin_name,argname=3Dargvalue`
>
> For now, passing arguments through "arg=3D" is still supports but outputs
> a deprecation warning.
>
> Also, this commit makes boolean arguments passed to plugins in the
> `argname=3Don|off` form instead of the deprecated short-boolean form.
>
> Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>

Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  linux-user/main.c |  2 +-
>  plugins/loader.c  | 24 ++++++++++++++++++++----
>  qemu-options.hx   |  9 ++++-----
>  3 files changed, 25 insertions(+), 10 deletions(-)
>
> diff --git a/linux-user/main.c b/linux-user/main.c
> index 4dfc47ad3b..d47f78132c 100644
> --- a/linux-user/main.c
> +++ b/linux-user/main.c
> @@ -462,7 +462,7 @@ static const struct qemu_argument arg_table[] =3D {
>       "",           "[[enable=3D]<pattern>][,events=3D<file>][,file=3D<fi=
le>]"},
>  #ifdef CONFIG_PLUGIN
>      {"plugin",     "QEMU_PLUGIN",      true,  handle_arg_plugin,
> -     "",           "[file=3D]<file>[,arg=3D<string>]"},
> +     "",           "[file=3D]<file>[,<argname>=3D<argvalue>]"},
>  #endif
>      {"version",    "QEMU_VERSION",     false, handle_arg_version,
>       "",           "display version information and exit"},
> diff --git a/plugins/loader.c b/plugins/loader.c
> index 05df40398d..a4ec281692 100644
> --- a/plugins/loader.c
> +++ b/plugins/loader.c
> @@ -94,6 +94,8 @@ static int plugin_add(void *opaque, const char *name, c=
onst char *value,
>  {
>      struct qemu_plugin_parse_arg *arg =3D opaque;
>      struct qemu_plugin_desc *p;
> +    bool is_on;
> +    char *fullarg;
>=20=20
>      if (strcmp(name, "file") =3D=3D 0) {
>          if (strcmp(value, "") =3D=3D 0) {
> @@ -107,18 +109,32 @@ static int plugin_add(void *opaque, const char *nam=
e, const char *value,
>              QTAILQ_INSERT_TAIL(arg->head, p, entry);
>          }
>          arg->curr =3D p;
> -    } else if (strcmp(name, "arg") =3D=3D 0) {
> +    } else {
>          if (arg->curr =3D=3D NULL) {
>              error_setg(errp, "missing earlier '-plugin file=3D' option");
>              return 1;
>          }
> +
> +        if (g_strcmp0(name, "arg") =3D=3D 0 &&
> +                !qapi_bool_parse(name, value, &is_on, NULL)) {
> +            if (strchr(value, '=3D') =3D=3D NULL) {
> +                /* Will treat arg=3D"argname" as "argname=3Don" */
> +                fullarg =3D g_strdup_printf("%s=3D%s", value, "on");
> +            } else {
> +                fullarg =3D g_strdup_printf("%s", value);
> +            }
> +            warn_report("using 'arg=3D%s' is deprecated", value);
> +            error_printf("Please use '%s' directly\n", fullarg);
> +        } else {
> +            fullarg =3D g_strdup_printf("%s=3D%s", name, value);
> +        }
> +
>          p =3D arg->curr;
>          p->argc++;
>          p->argv =3D g_realloc_n(p->argv, p->argc, sizeof(char *));
> -        p->argv[p->argc - 1] =3D g_strdup(value);
> -    } else {
> -        error_setg(errp, "-plugin: unexpected parameter '%s'; ignored", =
name);
> +        p->argv[p->argc - 1] =3D fullarg;
>      }
> +
>      return 0;
>  }
>=20=20
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 14258784b3..36b6cb9a2f 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -4459,19 +4459,18 @@ SRST
>=20=20
>  ERST
>  DEF("plugin", HAS_ARG, QEMU_OPTION_plugin,
> -    "-plugin [file=3D]<file>[,arg=3D<string>]\n"
> +    "-plugin [file=3D]<file>[,<argname>=3D<argvalue>]\n"
>      "                load a plugin\n",
>      QEMU_ARCH_ALL)
>  SRST
> -``-plugin file=3Dfile[,arg=3Dstring]``
> +``-plugin file=3Dfile[,argname=3Dargvalue]``
>      Load a plugin.
>=20=20
>      ``file=3Dfile``
>          Load the given plugin from a shared library file.
>=20=20
> -    ``arg=3Dstring``
> -        Argument string passed to the plugin. (Can be given multiple
> -        times.)
> +    ``argname=3Dargvalue``
> +        Argument passed to the plugin. (Can be given multiple times.)
>  ERST
>=20=20
>  HXCOMM Internal use


--=20
Alex Benn=C3=A9e

