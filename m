Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1366F3CDC77
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 17:33:24 +0200 (CEST)
Received: from localhost ([::1]:55196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5VGl-0004Ai-4w
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 11:33:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5VF6-00025r-Mn
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 11:31:41 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:39786)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5VF5-0001YZ-1W
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 11:31:40 -0400
Received: by mail-wr1-x42a.google.com with SMTP id f17so22574280wrt.6
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 08:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=pDZi5gbuJTgxjwsgMLZNYShs1LSBieoRukXmxRzGUkM=;
 b=GNKwFcFtGmmKztX2eMC3YQL6APRCUUI8bQ2GFsI+qMNw7dSvotdANcENPoMMnUV5cq
 D+v+FDzLRRFz+VIaCO8ZDu532vPfpdkwyGcIqYRvAF35EInXeiJra+1TCxnbB209Smqx
 wzj10eyBAbIl9iBQAai7a/DyNlWcEM+bppw4eWypUq1jHBSDOafeCwbaYgUMtQnuzdez
 weVKAVTmPdZb+eqBquMRCkppzp3nxvvkuNq2172fcA9LuacxTetzOZET10Tcz6AAmSX2
 iY9cFNFmZK+2lTmxadz/ItpnAQjYqX+yg6DZ/xE2W0hczOBWfBo+siIAtcAE+EOzbpFG
 0e0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=pDZi5gbuJTgxjwsgMLZNYShs1LSBieoRukXmxRzGUkM=;
 b=HvfHvTSBOxt5kYFlQp0w9B50uPMGeOHMhNzcSn8gKP0od7XjdzZkg61im0bCWUUBc6
 pdBUuJmZPOAonY17YfE/xHgJIBN85MVGT3RaqG7Kl3Oig7DL5Pb8XsaTThZHnMJ/eEp/
 iOL/yTJdbXiNRL1DyQ1dvoixOmwrzURaQq5K3fjIDY50KFtlzhVWoCRQ1c9nroZzXKuL
 guVzXk3zQzrb+kf962SKfVJ0dREUlJzR3ERILC3645FY5jiWe5VBrHzCwK5Ps49PpuZ2
 Zl3jLck+PqbFGjGuiDJI7E66XV4kPtnzbnsgxMuriTduO63FlRqeTenEwVHKCJBLS1vr
 wv0A==
X-Gm-Message-State: AOAM530S4RHVpY4vnC71o8lbGlKYhOg2BYwTOUvFSYdv0vnR7Bt0vdBE
 DEjs1xs1YAIKsKDVAl76a7uphw==
X-Google-Smtp-Source: ABdhPJwQ06Eel9mQk5PK97l/0UTixiD7VtcmlOJCbTaGvL3Mr0us1dj2h5cKtxHnNTaDoO+BRCu49g==
X-Received: by 2002:adf:f54e:: with SMTP id j14mr30121561wrp.91.1626708697523; 
 Mon, 19 Jul 2021 08:31:37 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r17sm19811466wmq.13.2021.07.19.08.31.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jul 2021 08:31:36 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 760BF1FF7E;
 Mon, 19 Jul 2021 16:31:35 +0100 (BST)
References: <20210717100920.240793-1-ma.mandourr@gmail.com>
 <20210717100920.240793-12-ma.mandourr@gmail.com>
User-agent: mu4e 1.5.14; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Mahmoud Mandour <ma.mandourr@gmail.com>
Subject: Re: [PATCH 11/13] tests/plugins/mem: introduce "track" arg and make
 args not positional
Date: Mon, 19 Jul 2021 16:31:12 +0100
In-reply-to: <20210717100920.240793-12-ma.mandourr@gmail.com>
Message-ID: <87pmvenwvc.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
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
Cc: cota@braap.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Mahmoud Mandour <ma.mandourr@gmail.com> writes:

> This commit makes the plugin adhere to the new plugins arg-passing
> scheme by expecting full-form boolean args instead of short-form
> booleans. This necessitates that we introduce a new argument, here
> "track", to accept "r", "w", or "rw".
>
> Also, it makes arguments not positional and we only care about the last
> value specified for a certain argument.
>
> callback/inline args are now supplied separately as bool arguments so
> that both can be enabled individually.
>
> Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
> ---
>  tests/plugin/mem.c | 47 ++++++++++++++++++++++++++++------------------
>  1 file changed, 29 insertions(+), 18 deletions(-)
>
> diff --git a/tests/plugin/mem.c b/tests/plugin/mem.c
> index afd1d27e5c..3000f847b5 100644
> --- a/tests/plugin/mem.c
> +++ b/tests/plugin/mem.c
> @@ -80,29 +80,40 @@ QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plugi=
n_id_t id,
>                                             const qemu_info_t *info,
>                                             int argc, char **argv)
>  {
> -    if (argc) {
> -        if (argc >=3D 3) {
> -            if (!strcmp(argv[2], "haddr")) {
> -                do_haddr =3D true;
> -            }
> -        }
> -        if (argc >=3D 2) {
> -            const char *str =3D argv[1];
>=20=20
> -            if (!strcmp(str, "r")) {
> +    for (int i =3D 0; i < argc; i++) {
> +        char *opt =3D argv[i];
> +        g_autofree char **tokens =3D g_strsplit(opt, "=3D", 2);
> +
> +        if (g_strcmp0(tokens[0], "hadrr") =3D=3D 0) {

s/hadrr/haddr/

> +            if (!qemu_plugin_bool_parse(tokens[0], tokens[1], &do_haddr)=
) {
> +                fprintf(stderr, "boolean argument parsing failed: %s\n",=
 opt);
> +                return -1;
> +            }
> +        } else if (g_strcmp0(tokens[0], "track") =3D=3D 0) {
> +            if (g_strcmp0(tokens[1], "r") =3D=3D 0) {
>                  rw =3D QEMU_PLUGIN_MEM_R;
> -            } else if (!strcmp(str, "w")) {
> +            } else if (g_strcmp0(tokens[1], "w") =3D=3D 0) {
>                  rw =3D QEMU_PLUGIN_MEM_W;
> +            } else if (g_strcmp0(tokens[1], "rw") =3D=3D 0) {
> +                rw =3D QEMU_PLUGIN_MEM_RW;
> +            } else {
> +                fprintf(stderr, "invaild value for argument track: %s\n"=
, opt);
> +                return -1;
> +            }
> +        } else if (g_strcmp0(tokens[0], "inline") =3D=3D 0) {
> +            if (!qemu_plugin_bool_parse(tokens[0], tokens[1], &do_inline=
)) {
> +                fprintf(stderr, "boolean argument parsing failed: %s\n",=
 opt);
> +                return -1;
> +            }
> +        } else if (g_strcmp0(tokens[0], "callback") =3D=3D 0) {
> +            if (!qemu_plugin_bool_parse(tokens[0], tokens[1], &do_callba=
ck)) {
> +                fprintf(stderr, "boolean argument parsing failed: %s\n",=
 opt);
> +                return -1;
>              }
> -        }
> -        if (!strcmp(argv[0], "inline")) {
> -            do_inline =3D true;
> -            do_callback =3D false;
> -        } else if (!strcmp(argv[0], "both")) {
> -            do_inline =3D true;
> -            do_callback =3D true;
>          } else {
> -            do_callback =3D true;
> +            fprintf(stderr, "option parsing failed: %s\n", opt);
> +            return -1;
>          }
>      }

Otherwise:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

