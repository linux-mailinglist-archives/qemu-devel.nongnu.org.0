Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FED56CD274
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Mar 2023 09:03:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phPom-0005cg-6m; Wed, 29 Mar 2023 03:02:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1phPod-0005cX-Um
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 03:01:51 -0400
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1phPoc-0005b5-1S
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 03:01:51 -0400
Received: by mail-lj1-x236.google.com with SMTP id h9so15049376ljq.2
 for <qemu-devel@nongnu.org>; Wed, 29 Mar 2023 00:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680073307;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Aw8Lduf/Qr/On9y+4mAanPATKIx/k1fN17aSdO9CjCo=;
 b=VID/k4K2nd+sfxKG0JD2IEnhCmstAZDvCZhMJja3pbtTHDmbcdj1J3v0idQ/X2HoHX
 T3mOxy+AID6q92m4wDoJtlvoPxaOsD8Ed0r2DVh4yIJesUUBraIu5DKDmDHBcu7ZXhwp
 IXnROUBa/uP14kX9RI57My4kte8LFlKx8FH+4kAws71Lpg152ZPyshfm+UeCbrIvK2S3
 jlOp/POq8BByoidGrPFKZRJMr5ygIqiVBsNMuXdpq9ChN7qoSvkDeu6o/u0HMBk7Lf6X
 jOXgHgnRxqdGBK3DvAgvQFvOk9SuLAYdAGRRVLka8hFX19xrJi9zTDqPJYN+uSr/HNTg
 0JHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680073307;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Aw8Lduf/Qr/On9y+4mAanPATKIx/k1fN17aSdO9CjCo=;
 b=X5Dt40m9thZIbHGdVJhyWUykvUXu0cr2bbpIEQg4RdWWb/XGa45EObryu0ch88ckvz
 zW4mQKIf9otZVIQELkZFQiXiKLft0aVbL+jdpnwHNN4IpNv4SS8yzUbC64cjFwl7YuMr
 k+emvNHWdx/VpoShxng8iOdVXFKIdIrvBdYnGn6WufVSKHeuBBytEpKy3n7CI+SFt/wU
 kv/MAjWWwQ6Ir+1DhDyMXCZYu4AqmmfMeUbhP2J9+5QdTD6qkdT8MvZvXttTopnjdgnn
 vZA7CqZ4dIdKQ873j8/Cy855Q5rqATZyMP0IsshaC67YXfkewqEAbmcimGyk7WI0I2X8
 xLWw==
X-Gm-Message-State: AAQBX9e7dQIu9H8wK9wMVEGwXWgKqBJQKHfob0ZOyF9bmNqDORKn1MxZ
 fk3KAew7fpONiYVBaQ4XIZXFNE3czU34/8h/AFA=
X-Google-Smtp-Source: AKy350Z6MygFW62ayWZwe70nITwRGnrFuqjWUgr4+Vcg+RsnSAQuBlx/SkGmyhJP70T1kGJ2aEsXWAELzXTjDL8wVac=
X-Received: by 2002:a2e:3814:0:b0:2a5:843c:589c with SMTP id
 f20-20020a2e3814000000b002a5843c589cmr3779732lja.0.1680073306507; Wed, 29 Mar
 2023 00:01:46 -0700 (PDT)
MIME-Version: 1.0
References: <CAFEAcA96hY7wxj9NjbkZmBshA6VECUQktNXAyGdS+-zLL5rWmw@mail.gmail.com>
In-Reply-To: <CAFEAcA96hY7wxj9NjbkZmBshA6VECUQktNXAyGdS+-zLL5rWmw@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 29 Mar 2023 11:01:35 +0400
Message-ID: <CAJ+F1C+6YYdNoFbraKwaw0A5NeUnwdJvrM6q98V6z0f-hr68Tw@mail.gmail.com>
Subject: Re: egl compile error on msys CI runners
To: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 "Daniel P. Berrange" <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::236;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x236.google.com
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

Hi Peter

On Tue, Mar 28, 2023 at 6:39=E2=80=AFPM Peter Maydell <peter.maydell@linaro=
.org> wrote:
>
> The msys CI runners have started failing to compile with an EGL
> related error:
>
> https://gitlab.com/qemu-project/qemu/-/jobs/4015682307
>
> In file included from
> C:/GitLab-Runner/builds/qemu-project/qemu/msys64/mingw64/include/epoxy/eg=
l.h:46,
> from C:/GitLab-Runner/builds/qemu-project/qemu/include/ui/egl-helpers.h:5=
,
> from ../ui/egl-helpers.c:21:
> C:/GitLab-Runner/builds/qemu-project/qemu/msys64/mingw64/include/epoxy/eg=
l_generated.h:11:10:
> fatal error: EGL/eglplatform.h: No such file or directory
> 11 | #include "EGL/eglplatform.h"
> | ^~~~~~~~~~~~~~~~~~~
> ninja: build stopped: subcommand failed.
>
> Dan says this is because of a msys2 packaging issue:
> https://github.com/msys2/MINGW-packages/issues/16492
>
> Can we have a meson test that doesn't try to enable EGL on systems
> like this one where it's broken ? Changing the current meson.build
>   if cc.has_header('epoxy/egl.h', dependencies: epoxy)
> to whatever the meson is for "actually try to compile with the
> header" ought to do the trick, I think.
>

This is an unfortunate consequence of using a fast-moving rolling
distribution, there are random breakages. It would make sense to have
tagged / pre-built images instead. That would also speed up the CI a
bit, hopefully.
Thomas, any idea how to do that?


--=20
Marc-Andr=C3=A9 Lureau

