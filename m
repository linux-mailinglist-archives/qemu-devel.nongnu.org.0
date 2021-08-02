Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C1C53DD584
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 14:19:06 +0200 (CEST)
Received: from localhost ([::1]:35436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAWuP-00026k-6a
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 08:19:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mAWrB-0007SD-Cr
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 08:15:45 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:46846)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mAWr7-0000hS-Sp
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 08:15:44 -0400
Received: by mail-ed1-x531.google.com with SMTP id f13so24104250edq.13
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 05:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tidx8/ydHdVSbK6wUpRTU5/5PMZ4Z9b+/ivRjqw46o4=;
 b=fkWv/oHGdGeovYGhPoKeJSoUnPGhys/ijdlDa0EgeoO/UL8yjDBfNcIQgp7Ob5SXVh
 eAMw4DeTmCyq7jSUs5bS3t+P3F2VEmXOABc/YiZp2MJTKcw3tD/i9Sp65qqExqUUi48s
 mT0qQjOihY0/cnplho/XVtQk7cbSLInRQ2mY5YY45m1pIP/AUe8L2PHQ/jrUj0LHpvqp
 IGpgpZCl1AtWSd6lGJ2TrzEj6SIep9dvFzdJg0U8+mZxAm6MSOZN21MdF3nqqJyvT7FX
 IN8EIL6qYabCsXBHdK2Xq72G6LGZQe6L5GoWA9TSjwmvw1fXHi6vbm+89FkT+WjHQF0v
 debA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tidx8/ydHdVSbK6wUpRTU5/5PMZ4Z9b+/ivRjqw46o4=;
 b=CUNCIrIMZbc9tLEVF0x3I4GXifOhWDM2qpX/b0BG5v7JVFrj6MeIYGTjqE5OSO7BSb
 mT3zO9A3HuiXLr+Drh5EwUp/7V7DBv4GQkdup39M+qMLIDeOiiityKiVmQIdL/h/7EiR
 6Vkz5JlfQ4VB0zTWuChl7tWxzktpiJM861IzEVGCzXHNMoBJ5mzcxGXb4rRGzVDKT91k
 IJBPXaqo064OBtzELuDAmASoeEsPOh0rC9Y5wu4cVNqAT2sh62LqN3PExLhqvrCxqWvv
 8E2zpMoLx2pgLBeCWfTqEWWWCs6EIUi8qL42p0QwhzpL5O9hTZpuvKPffx0sJ/x1Ys2t
 E3qg==
X-Gm-Message-State: AOAM531xIkWZOAZhQh6HgbCT3S4SXBPX5nsgKhBA9iSsgwT0iNXqwtnE
 /ZUXF+7cCg5KtAig1wMJPNZNbTxSzPFzMbR6VyGFfw==
X-Google-Smtp-Source: ABdhPJxM8uEW5YlfAC4sKANz16TuJuqLmVP2d8AaOihRpRTasON8HT3J0mA1BuNYvJS9qLMht7ZuE+dqvFQvUb/WgSw=
X-Received: by 2002:a50:f615:: with SMTP id c21mr19451947edn.146.1627906540393; 
 Mon, 02 Aug 2021 05:15:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210729175554.686474-1-ehabkost@redhat.com>
 <20210729175554.686474-2-ehabkost@redhat.com>
In-Reply-To: <20210729175554.686474-2-ehabkost@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 2 Aug 2021 13:14:57 +0100
Message-ID: <CAFEAcA8FdSL6YwL1GiEqc0sF087SFCzRN3QvjOeOYxWaPoTO2Q@mail.gmail.com>
Subject: Re: [PATCH for-6.2 01/10] docs: qom: Replace old GTK-Doc #symbol
 syntax with `symbol`
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 29 Jul 2021 at 19:00, Eduardo Habkost <ehabkost@redhat.com> wrote:
>
> Replace leftover of GTK-Doc #name syntax with `name`, and use
> default-role:: any, so we can add references to other functions,
> types, and macros.
>
> There are 3 cases that required extra care:
> - #TypeInfo.class_init: kernel-doc doesn't generate c:member::
>   directives, so references to C struct members are not possible
>   yet.  This was replaced with `TypeInfo`.class_init.
> - #CPUClass.reset and #DeviceClass.realize: cpu.h and qdev docs are not
>   rendered using Sphinx yet, so use ``code`` syntax for those.
>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---
>  docs/devel/qom.rst | 25 +++++++++++++------------
>  1 file changed, 13 insertions(+), 12 deletions(-)
>
> diff --git a/docs/devel/qom.rst b/docs/devel/qom.rst
> index e5fe3597cd8..9c1be5d7fc2 100644
> --- a/docs/devel/qom.rst
> +++ b/docs/devel/qom.rst
> @@ -3,6 +3,7 @@ The QEMU Object Model (QOM)
>  ===========================
>
>  .. highlight:: c
> +.. default-role:: any
>
>  The QEMU Object Model provides a framework for registering user creatable
>  types and instantiating objects from those types.  QOM provides the following
> @@ -42,8 +43,8 @@ features:
>
>     type_init(my_device_register_types)
>
> -In the above example, we create a simple type that is described by #TypeInfo.
> -#TypeInfo describes information about the type including what it inherits
> +In the above example, we create a simple type that is described by `TypeInfo`.
> +`TypeInfo` describes information about the type including what it inherits

I've just gone through all of docs/ finding the places where we had `foo` and
probably meant ``foo``, so please don't add any new ones. I would suggest
that you either use the ``double-backtick`` syntax to render as fixed-width
font, or use an explicit role tag so readers of the rST source can tell that
that's what you meant to use, ie avoid "default-role".

thanks
-- PMM

