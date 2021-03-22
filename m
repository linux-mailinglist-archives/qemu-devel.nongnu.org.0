Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6136344BE4
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 17:40:58 +0100 (CET)
Received: from localhost ([::1]:50750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lONbt-0002Tr-Ny
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 12:40:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lONY0-0007VD-HZ
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 12:36:57 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:39439)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lONXy-0002iw-2H
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 12:36:56 -0400
Received: by mail-ed1-x52b.google.com with SMTP id bf3so20163600edb.6
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 09:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=SL/qu7KjJ3dW08+smYmEiwVp6Yz9jJTneKDV4WPn+34=;
 b=Ek2L2nk4lL2zQNCjOeQf3vbrtAtTAczeni9qBjW2L/BXwm8dBV05JpPiFqYLMsXV4r
 w6E6EOfAP58ldKGj9S/VhxM/0HHd6vhs2rwdEqdhMSg0t76gsa/s4UI9i4FVbXM9aWYb
 iHc9MgSxVvgajQJ3vpK3nSkoMrvBwirrovHAWxG2U75McZEoGqJs/MGNbe1pagVexbph
 zjZU2hRFdwJKepC/Esg5yrEmW3uxY4LOf+RFNhmhKRXItIy1fwdjNpRzUIBE/WLTu3FF
 lSeRrdT4Hu7sucMFB8G1g3JldF4R57gyVe8F49rvR8AysWbtazjUV8lA+lADmxyaES5s
 45ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=SL/qu7KjJ3dW08+smYmEiwVp6Yz9jJTneKDV4WPn+34=;
 b=s3/uE53NvEBJ+FaLrwXWx4rHHH3a/fDlxv/nVP5JhHSKl69sZZ6FudVLG5TL0bO8PK
 At0bt4pQ4jSyP9bToQ9uto8bPGS//fEun6XmmXyiAzzIanFsvymEiNGz1XLdrXhNw8QA
 6AR2tB4PxqNw8SRQN3tulTkWqO4p/lomxPyRKYIyYjo5H2fkoRn2C1joN5dSZsmA8RxL
 8CBDj2f/8Mjst7VchYnP7nbmo7F+CbU7s5oHsQGF+m3UGnCqPuBgON2jZuDhIvWRK4et
 Y4bHd5TCDlkyWhnkiRx+arLFC3iNk+aLQzUzFgEBIQlcO/QKn/ImC1eamF/vd161N1oK
 p67Q==
X-Gm-Message-State: AOAM532dnn2GFwqqzGYAAWSpweOJx667LFmThTcdaUM6wF9+AXIyBQuW
 UwMjXEUrNTvNuGvXtQYAxNkZNlufZROVOQP5ZiTBR5vBMN9qDA==
X-Google-Smtp-Source: ABdhPJzc1Yi1ZW2CRmvJZiUFx2zl6F1ydNjWAT43ExDNqd5vrad/t3teXDQ9tnzFDVM1KHvVTEtwRxAURclA7aWlbo0=
X-Received: by 2002:aa7:cb0a:: with SMTP id s10mr504973edt.36.1616431012756;
 Mon, 22 Mar 2021 09:36:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210322155040.4009256-1-marcandre.lureau@redhat.com>
In-Reply-To: <20210322155040.4009256-1-marcandre.lureau@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 22 Mar 2021 16:36:24 +0000
Message-ID: <CAFEAcA95saRMvwkst1tr5wpihtKOK3GX-KSgUNe+J2T8aAcbSw@mail.gmail.com>
Subject: Re: [PATCH] docs: simplify each section title
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 22 Mar 2021 at 16:03, <marcandre.lureau@redhat.com> wrote:
>
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> Now that we merged into one doc, it makes the nav looks nicer.
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  docs/devel/index.rst   | 4 ++--
>  docs/interop/index.rst | 4 ++--
>  docs/specs/index.rst   | 4 ++--
>  docs/system/index.rst  | 4 ++--
>  docs/tools/index.rst   | 4 ++--
>  docs/user/index.rst    | 4 ++--
>  6 files changed, 12 insertions(+), 12 deletions(-)
>
> diff --git a/docs/devel/index.rst b/docs/devel/index.rst
> index 7c424ea6d7..09d21d3514 100644
> --- a/docs/devel/index.rst
> +++ b/docs/devel/index.rst
> @@ -1,8 +1,8 @@
>  .. This is the top level page for the 'devel' manual.
>
>
> -QEMU Developer's Guide
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +Developers
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

I think this should be "Developer's Guide" or "Developer Information"
or something. Just "Developers" doesn't really read right to me:
it is not "documentation of developers" in the way that the "Tools"
section is "documentation of tools", etc.

thanks
-- PMM

