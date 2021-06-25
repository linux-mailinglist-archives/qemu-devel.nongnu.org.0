Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 328673B5C95
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 12:39:40 +0200 (CEST)
Received: from localhost ([::1]:43478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxofy-0000JR-Sr
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 06:39:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lxoeu-00084f-JL
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 06:38:32 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:45955)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lxoes-0003pr-0S
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 06:38:32 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 u8-20020a7bcb080000b02901e44e9caa2aso10733226wmj.4
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 03:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=ZvLQjaifCm2OzbC/WKcWcqblFg5vvMznTLDx+q4KCsE=;
 b=btpLQ91WkpdikOEZn+9bxitb+KKc286S4AhT0GAPJ1Kky+5d4mbgv4TX9NgbdUDcyL
 eNBAGCGknAFsfJCaHCxCw2BHnuu5RIDFw/8jBFwazcgL4sGgeFUyio3UWeezkQedyTtO
 SiWA3WcqXw25RTSJXmamiQSRF8uG+Gn6uqgwQnwa/t9lrFfeveQwr4/o8spVhg90LQ/N
 eYz81MyLqhVpwFxR69zjE8bcd4kKovs+2x1bJdN5+tq2PYxe5N3SiD5qXIF+sI7t9w14
 AnvrrjKbXMIEflmBJNwOVdzEwFLT3g5U4Dbu6aRla4lJL12k6VU39Mx2rT2bnVKtfU3Z
 6kxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=ZvLQjaifCm2OzbC/WKcWcqblFg5vvMznTLDx+q4KCsE=;
 b=okHKODwFcrI5pB5GkQoHX5XFjGWY1JlBF4sL2wsT6WX0c0VzuPmOTni5cPLrfZ+ibf
 QzU+5MVtBt0/UH8eKpdG7FgpTqo8qQMCsPDv2G4haKkKKU0lcow2XpZpJs59rQfiia4U
 PuXtAZ7uZtXbvV1SklnbHyJtiFVUI0bASCXOAfuy7wQ5Of9RtS27blFUDEhxWm5dgoJz
 fKWhki0LhBQ7nXEQtOStmmSlK/2Vc5eh3aUQlXorRn5PpHW3m+amcesi2G7OKluasKoe
 q4efRxZ50gJqYnJ68M/xFvqWx42ZXimE3CBcE3enFsTrWH482PrMHffnMu+Qw430zofc
 J5KA==
X-Gm-Message-State: AOAM530VraySvBKKFuf6zYXLcutS1GGJbgcM5Xsgx6N/dKfnuE2NhSNa
 XJPxChBZeuRoPM+ut8EOhl/adg==
X-Google-Smtp-Source: ABdhPJzf04lx8Jb2VzGfObePCzvi55scitm+sIkPN6MKbdWV1zg6noBQeofdrsn1Y/TnqA2/F2yU7A==
X-Received: by 2002:a05:600c:a45:: with SMTP id
 c5mr26320794wmq.153.1624876705169; 
 Mon, 28 Jun 2021 03:38:25 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c16sm5966923wmr.2.2021.06.28.03.38.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jun 2021 03:38:24 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 769E61FF7E;
 Mon, 28 Jun 2021 11:38:23 +0100 (BST)
References: <20210623155553.481099-1-ma.mandourr@gmail.com>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Mahmoud Mandour <ma.mandourr@gmail.com>
Subject: Re: [RFC PATCH] Subject: [RFC PATCH] plugins: Passed the parsed
 arguments directly to plugins
Date: Fri, 25 Jun 2021 12:38:37 +0100
In-reply-to: <20210623155553.481099-1-ma.mandourr@gmail.com>
Message-ID: <87r1gmw9y8.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Mahmoud Mandour <ma.mandourr@gmail.com> writes:

The subject got a bit mangled. I usually send single one off patches
directly from the command line like this:

  git send-email --subject-prefix "RFC PATCH" HEAD^.. --to qemu HEAD^..

> Arguments were passed to plugins in the following form:
>     -plugin path/to/plugin,arg=3D"positional_arg=3Dvalue",arg=3D"second_a=
rg"
>
> This patch removes the need for "arg" so that the argument name itself
> is now expected and passed directly to the plugin.
>
> Now options can be passed in the following manner:
>     -plugin path/to/plugin,positional_arg=3Dvalue,second_arg
>
> Since short boolean arguments are deprecated, passing an argument that
> takes no value will trigger a warning saying that the user should use a
> full "arg_name=3Don" instead of just "arg_name". In either case, the
> argument is passed to the plugin as only the name, omitting the "=3Don"
> part.
>
> Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
> ---
>  plugins/loader.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/plugins/loader.c b/plugins/loader.c
> index 05df40398d..7f32b8c8bd 100644
> --- a/plugins/loader.c
> +++ b/plugins/loader.c
> @@ -94,6 +94,7 @@ static int plugin_add(void *opaque, const char *name, c=
onst char *value,
>  {
>      struct qemu_plugin_parse_arg *arg =3D opaque;
>      struct qemu_plugin_desc *p;
> +    char *full_arg;
>=20=20
>      if (strcmp(name, "file") =3D=3D 0) {
>          if (strcmp(value, "") =3D=3D 0) {
> @@ -107,7 +108,7 @@ static int plugin_add(void *opaque, const char *name,=
 const char *value,
>              QTAILQ_INSERT_TAIL(arg->head, p, entry);
>          }
>          arg->curr =3D p;
> -    } else if (strcmp(name, "arg") =3D=3D 0) {
> +    } else {

Unfortunately I think we also want to support the arg=3D form for now and
also update the deprecated.rst and plugin.rst documentation to point to
the new format.

>          if (arg->curr =3D=3D NULL) {
>              error_setg(errp, "missing earlier '-plugin file=3D' option");
>              return 1;
> @@ -115,9 +116,12 @@ static int plugin_add(void *opaque, const char *name=
, const char *value,
>          p =3D arg->curr;
>          p->argc++;
>          p->argv =3D g_realloc_n(p->argv, p->argc, sizeof(char *));
> -        p->argv[p->argc - 1] =3D g_strdup(value);
> -    } else {
> -        error_setg(errp, "-plugin: unexpected parameter '%s'; ignored", =
name);
> +        if (strcmp(value, "on")) {
> +            full_arg =3D g_strdup_printf("%s=3D%s", name, value);

We should probably prefer g_strcmp0 to strcmp and an explicit value test
(!=3D 0) because strcmp is weird with truth/falsity. However as we are
handling the syntactic sugar of adding "on" in the command line I wonder
if we can query QemuOpt directly. Maybe something like:

        /* pass true bools as single arg */
        if (qapi_bool_parse(name, value, &is_true, errp) && is_true) {
            full_arg =3D g_strdup(name);
        } else {
            full_arg =3D g_strdup_printf("%s=3D%s", name, value);
        }


> +        } else {
> +            full_arg =3D g_strdup(name);
> +        }
> +        p->argv[p->argc - 1] =3D full_arg;
>      }
>      return 0;
>  }


--=20
Alex Benn=C3=A9e

