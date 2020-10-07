Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A40285FE6
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Oct 2020 15:15:24 +0200 (CEST)
Received: from localhost ([::1]:42020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kQ9Hv-0001y0-3y
	for lists+qemu-devel@lfdr.de; Wed, 07 Oct 2020 09:15:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kQ9GJ-00014A-S0; Wed, 07 Oct 2020 09:13:43 -0400
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143]:41255)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kQ9GI-00031G-3z; Wed, 07 Oct 2020 09:13:43 -0400
Received: by mail-lf1-x143.google.com with SMTP id d24so2219854lfa.8;
 Wed, 07 Oct 2020 06:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=St6wJ9MQVP3KEdZH+bBrhP1irzWw2bbij+XLvpkK0CE=;
 b=NLlUCQ/7O1FbIGoSRXaRFW+bXmWIkoErnYyCfLrWCrR8e3+XP/YBmXx/jv6B0dwI8h
 rIGXront86P7gOG/701UCDoR41ttfB2Tdg7qR8JyDIAvc8w2uZk0JcS3jPMoe91mcXm6
 uj5iOWsgxsIvMkas2W6C3w+gJ3qgokPRlkwHC6J3D6LdWKB8lrhyHAz0ddaqX+w2QwKb
 EbdKYG5IwHuYNkQzKTNXcqygG9x8r7s4D0tV4gvNcCC8m0BsuF5iBFY3irWZaZGN31bx
 Yjt3kUzSWBhH/FaLSeqk60ZhK6QVCPSdZ6FFfiqHhWdHn/i0b3QOjm2qjGP+7IBDVVNV
 1DOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=St6wJ9MQVP3KEdZH+bBrhP1irzWw2bbij+XLvpkK0CE=;
 b=UJM+HVLYs7/tzagjH6Tfpc0qG0d+FTFV6IVqygmoQbj7t3Y9GxmM9M5AoPifnBgtya
 aA3u1p1UGsQXiyCVSYgorWxM5FsSKqPDqgJucOosfwll4TiZTCBz8UbMq/D+zO/C/su/
 6eSve3TbmJ4Z7t1AkTdTacckTimNASkaaHNYQuD6fqQO4EVIVU78qwrw7Mr1vkesu6CY
 Kl65dXfmJEHSozaVu+t6sVE0IwdG/bovrl6sUjGdQefNf/qCRbH/pBp46yK4y91uuz5C
 LbTrzIPcdqIbuFKIclH0IVqRXDG5ydhqv6NMgW1uAeOpan2pQNBlF6SbHgjmht7k7pHl
 mHjQ==
X-Gm-Message-State: AOAM532BgI7Shnpe7BNzk955H3CTa2gMQQam2fKOEXz3N2pz4bxOGT+X
 Jf0kW/AV3fzSeydN4lXiihWTGYFYaJkiKUdaB7c=
X-Google-Smtp-Source: ABdhPJwC+qbrDLytxk9N4ImLt66ulmBse6b3Cj2bFdfesl7ht1+X+pHqx96ycxv6zU3V0QWB99ifXUP8cMr7KceBpxk=
X-Received: by 2002:a05:6512:529:: with SMTP id
 o9mr883599lfc.331.1602076419953; 
 Wed, 07 Oct 2020 06:13:39 -0700 (PDT)
MIME-Version: 1.0
References: <20201007105518.1019-1-luoyonggang@gmail.com>
 <87zh4yyyhw.fsf@linaro.org>
In-Reply-To: <87zh4yyyhw.fsf@linaro.org>
From: =?UTF-8?B?572X5YuH5YiaKFlvbmdnYW5nIEx1byk=?= <luoyonggang@gmail.com>
Date: Wed, 7 Oct 2020 21:13:27 +0800
Message-ID: <CAE2XoE8XP1y-YSyEBM+LY=CGbBihSeZd50bjS49YF74Q9cMu7A@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] Improve cirrus msys2
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000ea1d2905b1147bad"
Received-SPF: pass client-ip=2a00:1450:4864:20::143;
 envelope-from=luoyonggang@gmail.com; helo=mail-lf1-x143.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Reply-To: luoyonggang@gmail.com
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 QEMU Trivial <qemu-trivial@nongnu.org>, qemu-level <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000ea1d2905b1147bad
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 7, 2020 at 9:08 PM Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:
>
>
> Yonggang Luo <luoyonggang@gmail.com> writes:
>
> > Fixes the broken msys2/mingw ci and speed it up.
>
> Queued to testing/next, thanks.
Hi alex, still have issue, the cirrus cache are rather slow, waiting for my
v5 version
> <snip>
>
>
> --
> Alex Benn=C3=A9e



--
         =E6=AD=A4=E8=87=B4
=E7=A4=BC
=E7=BD=97=E5=8B=87=E5=88=9A
Yours
    sincerely,
Yonggang Luo

--000000000000ea1d2905b1147bad
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br>On Wed, Oct 7, 2020 at 9:08 PM Alex Benn=C3=A9e &l=
t;<a href=3D"mailto:alex.bennee@linaro.org">alex.bennee@linaro.org</a>&gt; =
wrote:<br>&gt;<br>&gt;<br>&gt; Yonggang Luo &lt;<a href=3D"mailto:luoyongga=
ng@gmail.com">luoyonggang@gmail.com</a>&gt; writes:<br>&gt;<br>&gt; &gt; Fi=
xes the broken msys2/mingw ci and speed it up.<br>&gt;<br>&gt; Queued to te=
sting/next, thanks.<div>Hi alex, still have issue, the cirrus cache are rat=
her slow, waiting for my v5 version<br>&gt; &lt;snip&gt;<br>&gt;<br>&gt;<br=
>&gt; --<br>&gt; Alex Benn=C3=A9e<br><br><br><br>--<br>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0=E6=AD=A4=E8=87=B4<br>=E7=A4=BC<br>=E7=BD=97=E5=8B=87=E5=88=
=9A<br>Yours<br>=C2=A0 =C2=A0 sincerely,<br>Yonggang Luo</div></div>

--000000000000ea1d2905b1147bad--

