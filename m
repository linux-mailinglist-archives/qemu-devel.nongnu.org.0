Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E25924D165A
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 12:37:51 +0100 (CET)
Received: from localhost ([::1]:59666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRYA3-0000aW-01
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 06:37:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nRY6p-0007D4-TR
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 06:34:32 -0500
Received: from [2a00:1450:4864:20::42d] (port=35808
 helo=mail-wr1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nRY6o-0005j6-DD
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 06:34:31 -0500
Received: by mail-wr1-x42d.google.com with SMTP id b5so28064382wrr.2
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 03:34:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Xd42Hhzdlk3yVr+uJbGUdbbOwvnMtfC+b5aDLM8yYqg=;
 b=mG+ytCpZTcoFD+V+rtEAk8zCu0vAYITvCaLKV6i8175TKieiDqXglAIWiJycwrHwu3
 xsKUHEY8vB1GllsVGQ7g9eEQI+B5FJH9Ip2nORDAzWZ1H6nYCkeKLReVbeVy0/HiyDx3
 b6EjRPz9dUfZvZcl7FUBmb+98VsuwpGQeckkduzoitsbJDQRbJ5zQ8K8CXPrcDIaAL8/
 KU8Crcn37voqlbUONuoamcDgIr4EMqjNF4mjO1tsRLyHDmuTt+WDFWMT6eU3ufs5IZ73
 1XuMDbPzG4pImQeQk4ppeQ+FYUM7X0Xyu2ZIXB1tob6+l7fNOdEwYeaXGm50vn6tDgDo
 KmMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Xd42Hhzdlk3yVr+uJbGUdbbOwvnMtfC+b5aDLM8yYqg=;
 b=jNkgz+vcMajXLgMLN3YrcYmuJNvx//JmGod5GlRZPKqZg0OkgNv1rAt86gL0Ud3mXf
 K0ahfjXEar8MAFoYWKf/brEvXZppkrIetG4Nzu/DV4JL984zi3qghDAF87P3PAIWHgDt
 APjumkbAdKxPB4wLCAPOFaDekA2pS+FmWqQNLilU1e5CV1RlFx/PScUtDTpB5iNLMnOL
 yT4q5225lkb9GhE14CeEiZh6Bifi44NH1mXVLnvVEIazDkwBUycE4K7UTvVYwPKtryj8
 lJHzvvigMXnJJL2vvrQOuzJ6TQCzkZWNPa9VtrI+jTjZR5V0mIOQc25Dyz0OQ1MtGhvh
 AMUQ==
X-Gm-Message-State: AOAM532Sa+fE+Jwg4z4FWOwyl5mxfs4xBuBiDbESC48dY4xrMeYwzVko
 6vYcQXSHOzRq6QIex4QwitLXffUmjaIm1Uf6J4U=
X-Google-Smtp-Source: ABdhPJynFkmqtO6H9LVAjpTcgTqSk9z5+guIzFSSbjbop2HmlBlZw15vKYrGnXcTWB+yjaiebCtBiW5I6J5UDatl+tU=
X-Received: by 2002:a5d:4704:0:b0:1fb:768d:7b6 with SMTP id
 y4-20020a5d4704000000b001fb768d07b6mr4971735wrq.187.1646739268109; Tue, 08
 Mar 2022 03:34:28 -0800 (PST)
MIME-Version: 1.0
References: <20220301144611.1299277-1-marcandre.lureau@redhat.com>
 <fedbc4bc-c5de-4320-4103-f46730680dbe@linaro.org>
In-Reply-To: <fedbc4bc-c5de-4320-4103-f46730680dbe@linaro.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 8 Mar 2022 15:34:16 +0400
Message-ID: <CAJ+F1CJ5XU3g+CiLEwq7hWbtom4UEu-ud2wMV8tAgdcD4p8f9Q@mail.gmail.com>
Subject: Re: [PATCH] RFC: replace qemu_real_host_page variables with inlined
 functions
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000001d0ab105d9b35d23"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, QEMU <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000001d0ab105d9b35d23
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Mon, Mar 7, 2022 at 9:41 PM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 3/1/22 04:46, marcandre.lureau@redhat.com wrote:
> > Replace the global variables with inlined helper functions.
> getpagesize() is very
> > likely annotated with a "const" function attribute (at least with
> glibc), and thus
> > optimization should apply even better.
> >
> > This avoids the need for a constructor initialization too.
>
> What's the change in the size of the qemu text section with this change?
>

I get +496 bytes  (on a 58Mb binary ;)

--=20
Marc-Andr=C3=A9 Lureau

--0000000000001d0ab105d9b35d23
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Mar 7, 2022 at 9:41 PM Rich=
ard Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.h=
enderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">On 3/1/22 04:46, <a href=3D"mailto:marcandre.lureau@redh=
at.com" target=3D"_blank">marcandre.lureau@redhat.com</a> wrote:<br>
&gt; Replace the global variables with inlined helper functions. getpagesiz=
e() is very<br>
&gt; likely annotated with a &quot;const&quot; function attribute (at least=
 with glibc), and thus<br>
&gt; optimization should apply even better.<br>
&gt; <br>
&gt; This avoids the need for a constructor initialization too.<br>
<br>
What&#39;s the change in the size of the qemu text section with this change=
?<br></blockquote><div><br></div><div>I get +496 bytes=C2=A0 (on a 58Mb bin=
ary ;) <br></div></div><br>-- <br><div dir=3D"ltr" class=3D"gmail_signature=
">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000001d0ab105d9b35d23--

