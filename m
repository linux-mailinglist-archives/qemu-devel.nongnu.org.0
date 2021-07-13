Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1333F3C6EB6
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 12:39:22 +0200 (CEST)
Received: from localhost ([::1]:44950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3Fov-0003ZI-3r
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 06:39:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3Fnm-00025C-5u
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 06:38:10 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:38709)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3Fnk-0007P6-Cx
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 06:38:09 -0400
Received: by mail-ej1-x632.google.com with SMTP id gb6so40588627ejc.5
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 03:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zzINCQ5tg4gd3KK1zI6mJwuLGmxvKlH7VQs/cs6Fajg=;
 b=jCKQvb5WqKgWhLfIISZbbm8RufRE4xYRgHE4DLC0D4FkA8APmYMLLoz03pWXrNzJw8
 xI27Y+NAyvf/SUz2lTyNB3zjf1dEN1N6O9O9/4udSl87B4gsssjio1AWoJRRPaim9tpL
 Sxpm2tC4D1YNrUwPEE6FOtC9+whc1XhA2PKQrOu/2LdIJWCx2SHbr1Jw3EbkLUQ/SDbp
 m8UjPZVm2GNMbyM0K3S+OHQ2ygK/dHFktmbeBD90g19Sp78FM7ldzD1unvhx++EzAHKw
 QW332+6HuXPijD5HMvitOgOLtozhANYSmSpdShxulepWnT6/fOVECrfrO0Dfs/HQPToj
 PnBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zzINCQ5tg4gd3KK1zI6mJwuLGmxvKlH7VQs/cs6Fajg=;
 b=uQgwh5NRLc/oQEYmnWYrAGkzJbujBDmavSyxk7x0q/WVj+H6aL0slXa1XzqMcXUdBj
 UdLRIKiQdK2heCVoP3OJbomLmnGeeSJjIi4TkzSX9uUjtBvvpHZdrSDXHSKl8ah3xs/D
 Iihms5O/YAKeWe7GGsN7MpTXaQ6LRXmRcE9tuUTUBGnAn2ykqyosJ/aRY/3iHtBDLm7b
 O1fc6ukMLEyGcUGLI0S+zOyQWb5fCotaBYBkRZMCEZHY8jkaZaI48aK2wF0tdzxjPsys
 d92wq8RM/Y8y7dFsVN4W/7TJmJ1FgsJO1WmxSl+7ArbMgRcP7A13/cv2MYe/w6CMgLxG
 JzMQ==
X-Gm-Message-State: AOAM533keMFI7J51Wq9dfl86NNLuThpzEsajJ+T1+WLJ8cXDfoTXZmBS
 +gZAYc+gm0uQIgzeiTpvm94QNiCtZoSnnWylSpQGfQ==
X-Google-Smtp-Source: ABdhPJwTKdPTE2v8WIqDkw3+lqkmtX4dNzKosDTgQ+bOK2CImxOl6aJ1kTBxS8OOtfqB6lxmmLCw20orSosbWJO9bCk=
X-Received: by 2002:a17:906:16cd:: with SMTP id
 t13mr4863923ejd.250.1626172686937; 
 Tue, 13 Jul 2021 03:38:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210706100141.303960-1-pbonzini@redhat.com>
 <20210706100141.303960-38-pbonzini@redhat.com>
In-Reply-To: <20210706100141.303960-38-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 13 Jul 2021 11:37:27 +0100
Message-ID: <CAFEAcA8JNoPcn8OBw1up0_q-ezw_Dcu4smg3HiiYjJuT8k0-Vg@mail.gmail.com>
Subject: Re: [PULL 37/40] machine: add smp compound property
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x632.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 6 Jul 2021 at 11:39, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> Make -smp syntactic sugar for a compound property "-machine
> smp.{cores,threads,cpu,...}".  machine_smp_parse is replaced by the
> setter for the property.
>
> numa-test will now cover the new syntax, while other tests
> still use -smp.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Hi; Coverity reports a leak in this code (CID 1458085):

> +static void
> +machine_parse_property_opt(QemuOptsList *opts_list, const char *propname,
> +                           const char *arg, Error **errp)
> +{
> +    QDict *opts, *prop;
> +    bool help = false;
> +    ERRP_GUARD();
> +
> +    prop = keyval_parse(arg, opts_list->implied_opt_name, &help, errp);
> +    if (help) {
> +        qemu_opts_print_help(opts_list, true);
> +        return;

In this return path we don't unref 'prop'.

> +    }
> +    opts = qdict_new();
> +    qdict_put(opts, propname, prop);
> +    keyval_merge(machine_opts_dict, opts, errp);
> +    qobject_unref(opts);
> +}

thanks
-- PMM

