Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4BEA5A239E
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 10:57:18 +0200 (CEST)
Received: from localhost ([::1]:48374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRV9Q-0001sC-Dc
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 04:57:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oRV5x-0007un-W7
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 04:53:42 -0400
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129]:43568)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oRV5s-0004qL-OH
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 04:53:38 -0400
Received: by mail-lf1-x129.google.com with SMTP id m3so1136695lfg.10
 for <qemu-devel@nongnu.org>; Fri, 26 Aug 2022 01:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=6ocG37QOmzIDbI68LKeitKOp2jfeHeq8h2Mbiz7GftA=;
 b=jfq0KU4MIqk4KZ8eu+7ehhRRHg7dRtZKyJ1futGitTSXwX4L5sz4kc1WC25OkrEz2B
 GwCIs2KekHUemQXD79/MNn3BdLOfYX+eNjZD23ZYvdbbrWaFLsVvYex7jC1IhnjD/pLa
 wgiGF/3Ejq/fBg5/BKt32Rwvo1hgzuaKAyN4pL/gsbsmSnWMMzKkU5EYEWACU9LyfZtc
 +jSosnHlzVUwQjJ5H2bKueOGykKB/R2N0g2GGMxgbmn9FM1lw3BXv+RE3nImL5uYNCjl
 7iAxGi5SBdRXMYQwazEFc86hfghsg49brWv2lvHcMFJky3hIQ6Yxjf0s2O3pn7NDKj8C
 1zOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=6ocG37QOmzIDbI68LKeitKOp2jfeHeq8h2Mbiz7GftA=;
 b=r0mR5ah3Hli4V1MD5TWb4HeJ+BnHhLF0U6CC2MBGzwPUpvKFJAK0O2UehABfMRjlcf
 m472gAr++Dsx+2eOhI6+yIGmwGYbLlTWtKIMJ9aDprfPjZ7Wh36hGBChS5qFpfilOPTE
 79EZHTXcHG7IMfKSM/slQXujpGphlVIDg7OEoStyhoxxRV9rxoANQDq1krDGtacqpNSL
 x0bG+k17nbrCmyEXSv2QJehIVvVGR7jDpLf5OyplbYUMtNmUCmehDlsWaJ5MT44LZ/9U
 yjFwVdKrEsNGISnKmxT523aSZwXSPH6oGWTY0VaPtPlBLRBMyJ3Qtv/8B73bdvbzOYY3
 hICQ==
X-Gm-Message-State: ACgBeo2x7k7+K6bRsTFKezhlBZj9n8O5T58tzrBhNbN7DttUuhFzUHkK
 MD7sGVsrB28Uu/oqb1pEhPTe/1BQxQloB9e+JNs=
X-Google-Smtp-Source: AA6agR7L4aTBRTqqRvzJpN3Edvh9GF7A0zvX3DO9J7Kzph2qeFjnBYQ1tyetzuxSz8mpwlKD9fnYZVJVpkL6BYKFwhE=
X-Received: by 2002:a05:6512:2394:b0:492:df50:28ce with SMTP id
 c20-20020a056512239400b00492df5028cemr2395552lfv.328.1661504015014; Fri, 26
 Aug 2022 01:53:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220825150703.4074125-1-peter.maydell@linaro.org>
In-Reply-To: <20220825150703.4074125-1-peter.maydell@linaro.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 26 Aug 2022 12:53:23 +0400
Message-ID: <CAJ+F1CJMp+vj-_e2YrWX34Rm999rs7LSNvenHpMQzvHc0AC7fA@mail.gmail.com>
Subject: Re: [PATCH 0/7] configure: fix misc shellcheck warnings
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000009ba01805e7210c1a"
Received-SPF: pass client-ip=2a00:1450:4864:20::129;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x129.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

--0000000000009ba01805e7210c1a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Thu, Aug 25, 2022 at 7:09 PM Peter Maydell <peter.maydell@linaro.org>
wrote:

> Currently if you run shellcheck on our configure script it
> generates a ton of warnings. This patchset fixes some of the
> easier ones. I wasn't aiming for completeness or consistency;
> I just wanted to zap some of the ones where the fix is clear
> and didn't take long to write and is hopefully easy to review.
> We can always come back and take another swing at it later.
>
> thanks
> -- PMM
>
> Peter Maydell (7):
>   configure: Remove unused python_version variable
>   configure: Remove unused meson_args variable
>   configure: Add missing quoting for some easy cases
>   configure: Add './' on front of glob of */config-devices.mak.d
>   configure: Remove use of backtick `...` syntax
>   configure: Check mkdir result directly, not via $?
>   configure: Avoid use of 'local' as it is non-POSIX
>
>  configure | 82 ++++++++++++++++++++++++++-----------------------------
>  1 file changed, 38 insertions(+), 44 deletions(-)
>
> --
> 2.25.1
>
>
>
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


--=20
Marc-Andr=C3=A9 Lureau

--0000000000009ba01805e7210c1a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Aug 25, 2022 at 7:09 PM Pet=
er Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@li=
naro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">Currently if you run shellcheck on our configure script it<br>
generates a ton of warnings. This patchset fixes some of the<br>
easier ones. I wasn&#39;t aiming for completeness or consistency;<br>
I just wanted to zap some of the ones where the fix is clear<br>
and didn&#39;t take long to write and is hopefully easy to review.<br>
We can always come back and take another swing at it later.<br>
<br>
thanks<br>
-- PMM<br>
<br>
Peter Maydell (7):<br>
=C2=A0 configure: Remove unused python_version variable<br>
=C2=A0 configure: Remove unused meson_args variable<br>
=C2=A0 configure: Add missing quoting for some easy cases<br>
=C2=A0 configure: Add &#39;./&#39; on front of glob of */config-devices.mak=
.d<br>
=C2=A0 configure: Remove use of backtick `...` syntax<br>
=C2=A0 configure: Check mkdir result directly, not via $?<br>
=C2=A0 configure: Avoid use of &#39;local&#39; as it is non-POSIX<br>
<br>
=C2=A0configure | 82 ++++++++++++++++++++++++++----------------------------=
-<br>
=C2=A01 file changed, 38 insertions(+), 44 deletions(-)<br>
<br>
-- <br>
2.25.1<br>
<br>
<br></blockquote><div><br></div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &l=
t;<a href=3D"mailto:marcandre.lureau@redhat.com">marcandre.lureau@redhat.co=
m</a>&gt; <br></div></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" cla=
ss=3D"gmail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000009ba01805e7210c1a--

