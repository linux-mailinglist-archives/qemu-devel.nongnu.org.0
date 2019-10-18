Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3952FDCC24
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Oct 2019 19:02:46 +0200 (CEST)
Received: from localhost ([::1]:43516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iLVeH-0003zm-7M
	for lists+qemu-devel@lfdr.de; Fri, 18 Oct 2019 13:02:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54956)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iLVbf-0002lp-D2
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 13:00:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iLVbd-0004k1-AI
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 13:00:03 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:43644)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iLVbY-0004ij-53
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 12:59:57 -0400
Received: by mail-ot1-x343.google.com with SMTP id o44so5537414ota.10
 for <qemu-devel@nongnu.org>; Fri, 18 Oct 2019 09:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=brKJQVGK8zfwG+wODMWZklzQKwkI6ehnbopN2Ik5gXE=;
 b=uAIvnoiDQvjuFycLPpLqGrrD1MGdxof9rE/dRe6AwFJ+3jRZVa8koJ6sAtGA1R3PCZ
 Nbm0sbJDZRcP35/x3DnOivltpvTg2RyE1IqRoXmKKta2in4bkFIOsjWBt4SAH7qjLn76
 uQdWqc0m5SuHNUMsp1J8XaYReWsY/lnPDkWu170J42aC7nLKqlq0plHSLc7sxNWUYIj1
 RPllqmJO3raIjfzpsZ+9tTb+LUqE7CzXd3XEwxa9RgfCVLFCqtCkubsp1WMql6lqa1Vl
 4qnG9cjAPwZGLwPn78oogEKmYeqwgj+9uXIJyoyheVexoIkh4id1M3D6sYzP1jF+OK7O
 C3qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=brKJQVGK8zfwG+wODMWZklzQKwkI6ehnbopN2Ik5gXE=;
 b=KQT6g0Y+4EP7oPl4T/yCWneSyz3TAf9Y5mTE1Qj+cqVARsqM/WL6gD8z/4f6aN4c41
 KElLMLudJwun4DNEYIehZcCXD5whzMVsvvwU704MhWaPMyJp+T7u+HUHFedQC9yDswaS
 4Z9CO+Cl8v5afSxRVjF38dkYL59j8rPduNJGVZXPkbnKJ1CgI7OqQzHfKAIefH2UiIps
 Ca4Fm+R1AQmeqwWeZz/F41a4O0Q2DtEhoTc6Zj1E5Si87tK0sAMrvtp+1URrpbCiOZo5
 LkKv2+zQnK+Q2bgmVIBv0cHkx5rZakt9nWQ5Fta1HQuja5BRSmGxDhkdQZ2t95jXou5I
 cvrA==
X-Gm-Message-State: APjAAAUr5Nv+aTy5VXlt9WL1Sq4VmCGrAHEmBeBOemopbXJBk9R6iBtz
 lR2d9qdYQRf4ra0aGgvuBdxTh3vPuHuMOachDjgwBg==
X-Google-Smtp-Source: APXvYqzsGkkRpakEJDwdq45hYfaaCoS+MSE0GClI4vnbAnCBD4EQRezxFvGKPI/19i+ieuiJFAWzil7f7x5OGbVjXGg=
X-Received: by 2002:a9d:708e:: with SMTP id l14mr8508471otj.135.1571417995180; 
 Fri, 18 Oct 2019 09:59:55 -0700 (PDT)
MIME-Version: 1.0
References: <20191018154212.13458-1-marcandre.lureau@redhat.com>
 <20191018154212.13458-15-marcandre.lureau@redhat.com>
In-Reply-To: <20191018154212.13458-15-marcandre.lureau@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 18 Oct 2019 17:59:44 +0100
Message-ID: <CAFEAcA8PyEfmWUbTqC7dHRzRT7OzQYR3dX9j=2fiH-CxHqWptg@mail.gmail.com>
Subject: Re: [PATCH 14/14] Remove QDEV_PROP_PTR
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
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
Cc: Corey Minyard <cminyard@mvista.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Aleksandar Rikalo <arikalo@wavecomp.com>, Magnus Damm <magnus.damm@gmail.com>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Fabien Chouteau <chouteau@adacore.com>, qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <rth@twiddle.net>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-ppc <qemu-ppc@nongnu.org>, Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 18 Oct 2019 at 16:44, Marc-Andr=C3=A9 Lureau
<marcandre.lureau@redhat.com> wrote:
>
> No longer used in the tree. The comment about user_creatable is still
> quite relevant, but there is already a similar comment in qdev-core.h.
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  hw/core/qdev-properties.c    | 18 ------------------
>  include/hw/qdev-properties.h | 22 ----------------------
>  2 files changed, 40 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

