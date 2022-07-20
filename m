Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A78357BD08
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jul 2022 19:43:07 +0200 (CEST)
Received: from localhost ([::1]:46968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEDj0-0002MA-9W
	for lists+qemu-devel@lfdr.de; Wed, 20 Jul 2022 13:43:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oEDf5-0007Q6-Gj
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 13:39:03 -0400
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d]:44577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oEDf3-0002Am-P4
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 13:39:03 -0400
Received: by mail-yb1-xb2d.google.com with SMTP id h62so33175233ybb.11
 for <qemu-devel@nongnu.org>; Wed, 20 Jul 2022 10:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=IiO8XhM1JSEKQAf839lqq4zlAOh0TtumE78ocsl5HH8=;
 b=ZoHFZRIrgD+6VKAjBN7PCBKuZ62X24RBlj3PjlvJ/Gn/Cs+95dGONYwgm7GEkCZgLP
 b5Y784VbappM3vX5CUOnsQH6yi5FReWZ4npX1ylX5kCGWu9UXAzUbi2WcD86+o7A7PKU
 Symn2VQxdIpjYg/M6kY/m9FaiaEm79QWajBvMqQNjPcQQ/iAbJXsDHMaQjQZw7DRRuJl
 +0N0MDgMEqlbQGY7q7mcyxJId/kcCH+7D9Y8VISnKQ6URkLyZ2ghqU9u1io9NB20Twn9
 J8O4tqTS1ozMbGQoFQpEP8uizVbFE8YwaY/IZ96e0F1vjwMNmYmQ6O4NJpj10TiMJcfA
 IGFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=IiO8XhM1JSEKQAf839lqq4zlAOh0TtumE78ocsl5HH8=;
 b=yUu8dtOqCVZm0tl3UkFQIWCHKHKPnzXLCRGBRR13dmzK+pQKttHsQ268zPbpRyl5ca
 eV1jkiiKQLuaRVxP2BETuM5K9QwKQu2koP/TzZtGsWjB3md8xXNB1+eapbCvzbipkktJ
 W0lzja9NIKXhefTrmM6K938BfMEPG6rIRyD5HEQkt89A3mj7ED9hefAb3P59k7VAwoWj
 07CbqqLnQs4l2+k0FkGgXTqHyTdvGQMhcN7ZLTqUUsvb1quODWT8vBNR+/FXobV8Xg8H
 qEEudE7fNu/4xTk/XY0ywi/NfWSG3i8tg76IAE0Nb7dZDskVYj0BcDKrUAN+HNILhYsA
 Hw1A==
X-Gm-Message-State: AJIora832isYaWW0RQp8wPu5mfN2IaU+OUwq9kGs7Cm5c6O3tW8I8Tou
 mhkVg6sKHcpQMk9n5QEjHZIblYJLiHlW5zbpeFYsaQ==
X-Google-Smtp-Source: AGRyM1tJ6lVyP/wj9BJ/vEhZ2s3RQuCmhuV5lI6giBe6g7LfLL9HEW5wSaX2uJs7sY+GqXGYioPO/aIqoG3QkcPyyV8=
X-Received: by 2002:a5b:dd2:0:b0:668:fc4a:9403 with SMTP id
 t18-20020a5b0dd2000000b00668fc4a9403mr38295609ybr.39.1658338740667; Wed, 20
 Jul 2022 10:39:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220707163720.1421716-1-berrange@redhat.com>
 <20220707163720.1421716-2-berrange@redhat.com>
 <CAFEAcA-gANYJSK4LPXQoP0jTO5ex-zf3XZA2WH91ByXCEZMysQ@mail.gmail.com>
 <Ytgt+I+XFg2sFbNi@redhat.com> <20220720170820.a37iermixiljc2xh@redhat.com>
In-Reply-To: <20220720170820.a37iermixiljc2xh@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 20 Jul 2022 18:38:49 +0100
Message-ID: <CAFEAcA9WRE2qUjauGng5zu=zTOk_KZOcYBLGwYG_VxQavODeaQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/9] tests: introduce tree-wide code style checking
To: Eric Blake <eblake@redhat.com>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 20 Jul 2022 at 18:08, Eric Blake <eblake@redhat.com> wrote:
>
> On Wed, Jul 20, 2022 at 05:31:52PM +0100, Daniel P. Berrang=C3=A9 wrote:
> > > > diff --git a/meson.build b/meson.build
> > > > index 65a885ea69..d8ef24bacb 100644
> > > > --- a/meson.build
> > > > +++ b/meson.build
> > > > @@ -18,6 +18,8 @@ config_host =3D keyval.load(meson.current_build_d=
ir() / 'config-host.mak')
> > > >  enable_modules =3D 'CONFIG_MODULES' in config_host
> > > >  enable_static =3D 'CONFIG_STATIC' in config_host
> > > >
> > > > +in_gitrepo =3D run_command('test', '-d', '.git', check: false).ret=
urncode() =3D=3D 0
> > >
> > > Should we use Meson's fs.is_dir() rather than running a shell?
> > > (https://mesonbuild.com/Fs-module.html)
> >
> > Will investigate
>
> Probably not a good idea as-is; .git need not be a directory, but can
> also be a symlink.  So 'test -e .git' is the better check (see
> scripts/qemu-version.sh); but if you can write an existence check in
> meson (instead of a directory check), then go for it.

There is a fs.exists(), yes. I just suggested .is_dir() because
the code as written here is doing a -d check, not a -e check.

-- PMM

