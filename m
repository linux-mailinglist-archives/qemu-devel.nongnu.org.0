Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E11307EBA
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 20:31:18 +0100 (CET)
Received: from localhost ([::1]:34774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5D0e-00087q-Nk
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 14:31:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1l5CyX-0007dJ-Es
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 14:29:05 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:44659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1l5CyV-0003gx-UE
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 14:29:05 -0500
Received: by mail-ed1-x531.google.com with SMTP id c2so7935892edr.11
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 11:29:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=cjxLwpKeTpDXhCpqh/aYtxOL72HZi04kzKRymafej3c=;
 b=QqddcPOVDWtePZj3wjp0OECsm9G+66Rf5sAQq6+H4sWY5Getv9K1RMJ9DKPgT8bWzC
 3499R9FJYMdiRm+bAERtfxu+VXZjzXxUfMxQ43ZuTMmoT/N71ckQ8rSewIaUG+Tgz0KY
 hOh+A7+46coMQQ/DlbLiV1xa9cFQXUO9II+BJ6H9mUx/eRGraLuVzCwJdWCYmBFJqgUn
 gIdN5OBmfmNBphAgE0fFygdjModztYJ59fQEILYX8OQl+5JOmAuwyhzAa+nc2XhSVER5
 h9DKj5jkx58wzU4PMZGoR+LpIsXAk3aGmUXRdu7+psWICfL6sJ+c8cUjvR7B9mh3xlri
 DJBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=cjxLwpKeTpDXhCpqh/aYtxOL72HZi04kzKRymafej3c=;
 b=Bq0OCjes2s4/ik932qgdDxGjx1gA4tH/eo6w3n0zQjzJUo3aL+RB9mwkS6l2ZHNDZ6
 pjvqQ4mjK7cd5wCmT4rZH5D9skXGOLMCvliwNFFZfgBcDxiqQNOa9AoOQba15m4oeZ/r
 kXE9y3GH67I6mIyEJO3/vt2JeAci0N4cbBlQBg7K9RyFq4W9DkSGU5T2wsjxi3XwZDZb
 2ahOdrtaF2jkn9IBrzan2TDCjOH8cf/YFWZDF5KdqkAx/f5MM+BHJ4dgosAzMGkOdbKx
 jnwiCmrBBAuojXEqlBOHuQL+Wooxy+VFIolv73D0uoAUodScxsGjpHq6qItp7q74jw+3
 jqpw==
X-Gm-Message-State: AOAM531UQFaxF0ruLDEl6OtvPtf5PatGuVPNsad65xyis3q7rieDtAXh
 ZKJABwDyNLnHZzw+2OEPvk4iAgyucbkOmp9rwJM=
X-Google-Smtp-Source: ABdhPJwu5ehjf/yMDAM+Mz3DcmiRXPfjweq75xUSb5HPdODhb+2pdlAABQiBvTRuoqqWcGCeco0NNv+Piu1yzfYyiuU=
X-Received: by 2002:a05:6402:1682:: with SMTP id
 a2mr1363739edv.30.1611862142199; 
 Thu, 28 Jan 2021 11:29:02 -0800 (PST)
MIME-Version: 1.0
References: <20210128111319.329755-1-marcandre.lureau@redhat.com>
 <20210128114352.tvwnx435qbqcv4a4@sirius.home.kraxel.org>
 <CAMxuvazAToFV_uD3Q7whGymoY07eiq-hErToDPB41F2T9ZY7hg@mail.gmail.com>
 <CAMxuvazChfKDHyjP2o1ipfgquawMab9zc4p8J5wnNnmVMmJ1yw@mail.gmail.com>
 <20210128142625.vzdrehzw6mufja3s@sirius.home.kraxel.org>
 <CAJ+F1CJ0Z378KCLGDzLYOfBor7HkHM2YemRj5F-3kTSnVK7ADg@mail.gmail.com>
 <20210128144202.2pqjjn3epspfvlgk@sirius.home.kraxel.org>
 <CAJ+F1C+1LdY2gJp0trTx_pR7iLeJG9j7O+FjqF6pgnDZGUa=YA@mail.gmail.com>
 <20210128163426.lsd2y3w7htovfnfx@sirius.home.kraxel.org>
In-Reply-To: <20210128163426.lsd2y3w7htovfnfx@sirius.home.kraxel.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 28 Jan 2021 23:28:50 +0400
Message-ID: <CAJ+F1CJR2HzRPDmRudCKimeyRq0OFJV8q8BrdY1xw9DK-y2a8A@mail.gmail.com>
Subject: Re: [PATCH] spice: delay starting until display are initialized
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ed1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: "Bonzini, Paolo" <pbonzini@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 28, 2021 at 8:34 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
>   Hi,
>
> > > So move the vmstate handler registration call too?
> > > I'd prefer to not add more state variables if we can avoid it ...
> >
> > Does that seem right to you?
>
> > @@ -626,7 +625,7 @@ static int add_channel(void *opaque, const char
> > *name, const char *value,
> >  static void vm_change_state_handler(void *opaque, int running,
> >                                      RunState state)
> >  {
> > -    if (running && spice_display_init_done) {
> > +    if (running) {
> >          qemu_spice_display_start();
> >      } else if (state !=3D RUN_STATE_PAUSED) {
> >          qemu_spice_display_stop();
> > @@ -635,7 +634,7 @@ static void vm_change_state_handler(void *opaque,
> > int running,
> >
> >  void qemu_spice_display_init_done(void)
> >  {
> > -    spice_display_init_done =3D true;
> > +    qemu_add_vm_change_state_handler(vm_change_state_handler, NULL);
> >      vm_change_state_handler(NULL, runstate_is_running(), runstate_get(=
));
>
> I'd just call qemu_spice_display_start() directly here, the need for
> runstate_get() goes away then.  Otherwise looks good to me.

Hmm, that could work, but it will behave differently as we will start
spice even if the VM is not running then.


--=20
Marc-Andr=C3=A9 Lureau

