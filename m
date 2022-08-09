Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D77C58D56D
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Aug 2022 10:33:25 +0200 (CEST)
Received: from localhost ([::1]:47942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLKg0-0004h8-CA
	for lists+qemu-devel@lfdr.de; Tue, 09 Aug 2022 04:33:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oLKbZ-0000NC-JD
 for qemu-devel@nongnu.org; Tue, 09 Aug 2022 04:28:50 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:46014)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oLKbX-0007qb-29
 for qemu-devel@nongnu.org; Tue, 09 Aug 2022 04:28:49 -0400
Received: by mail-ed1-x52b.google.com with SMTP id e13so14137219edj.12
 for <qemu-devel@nongnu.org>; Tue, 09 Aug 2022 01:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=YDgVcRnv5lkalapTk738QTAthM8jFl2ykbLN4m6B7sw=;
 b=zOmCxf83ZNzrds82jzItehj0JUa6542u22VkM9icMh1H4qbe7iy6i4lQTrZ8l3Oacw
 WjfElolYLThqttBH+ArvDM+RXQDP3+EFmLNuiAXNoIq3W8F+Tl+kK6jDW8xZim/r28++
 DAM+j8XyNEJKMkENgTSwMjAc8KEjWlstjKULz2MlMOoDhPIVb6Zv9fiwT3sHIua5dstd
 P5MQru8W3GQt8anC4I5Cdua7UUP8q62LXLvQSBGUuWz2w2A7irpXD7rrU1RXGGulr8Eg
 HROY0HegoXdO9hEISSn1UY5VUXgUWOKvAeSfB9t0JCVoy87XVn7+DwrSu246jpc5PqKj
 jE+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=YDgVcRnv5lkalapTk738QTAthM8jFl2ykbLN4m6B7sw=;
 b=iL5h3oCiExjG0Ai0M8kg0J+vFYWqTP711G9fg+RtxEVSnhvnmI4WYfSOL8SyDrn2+V
 9wKCiWSq2g4nSGLeBS8nq5N2LeS0TX34kua4Ziy6aWM1PG6GTZnDzHsrnlw2ROXuU+V2
 rptkuUV/9bBBXTILbovQB4mm8eSYh/dfTwz5KKDtqKFgr0M0GQzVlf+DM6AJg8nwMH3w
 EQIEr0gkQdhDczlwnurRU2JhMiQ2GK2qX7iiqEeveGO0WUpKslG51V7mkbZbz3/jzsDe
 lxFmPYHuZStf5+wLRHKttvHQ4V55/f5TanrXkVwij8SJ62+JGVTiFrG9jZcJUps8zocI
 cjfw==
X-Gm-Message-State: ACgBeo0P/PpZ428rQX6gJtyjnMfbPg+VQhibkXgKTe/1c2gl1R36wZOA
 UfT4Vus9+SR44opeFeJZAARl44YP0XgWUfL8I0++rg==
X-Google-Smtp-Source: AA6agR5t2nC2Z8O2xHasO9rLa2gn+wvXiBIr8qyvlU0KDzjibYudnShr0z2RyGyjupHd6A2WznfstLksmUw8f12DC/w=
X-Received: by 2002:a05:6402:3206:b0:43d:4e0e:b693 with SMTP id
 g6-20020a056402320600b0043d4e0eb693mr20349789eda.316.1660033725576; Tue, 09
 Aug 2022 01:28:45 -0700 (PDT)
MIME-Version: 1.0
References: <165943656662.362178.2086588841425038338.stgit@pasha-ThinkPad-X280>
 <878rnxomfm.fsf@linaro.org>
In-Reply-To: <878rnxomfm.fsf@linaro.org>
From: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Date: Tue, 9 Aug 2022 09:28:34 +0100
Message-ID: <CAHDbmO2zMH+5Zdemht+UW-d0bEfPa1RXKCP0gbiFcCSba6Pzwg@mail.gmail.com>
Subject: Re: [PATCH] tests/avocado: fix replay-linux test
To: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, philmd@redhat.com, 
 crosa@redhat.com
Content-Type: multipart/alternative; boundary="0000000000008751ba05e5cab8fb"
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
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

--0000000000008751ba05e5cab8fb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

ignore that - I see Thomas has already merged it.

On Tue, 9 Aug 2022 at 09:23, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:

>
> Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru> writes:
>
> > Last line of the test is missing by accident.
> > This patch fixes the script.
> >
> > Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
> > ---
> >  tests/avocado/replay_linux.py |    1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/tests/avocado/replay_linux.py
> b/tests/avocado/replay_linux.py
> > index 40e4f6908e..e1f9981a34 100644
> > --- a/tests/avocado/replay_linux.py
> > +++ b/tests/avocado/replay_linux.py
> > @@ -189,3 +189,4 @@ def test_virt_gicv3(self):
> >
> >          self.run_rr(shift=3D3,
> >                      args=3D(*self.get_common_args(),
> > +                          "-machine", "virt,gic-version=3D3"))
>
> Queued to testing/next, thanks.
>
> --
> Alex Benn=C3=A9e
>


--=20
Alex Benn=C3=A9e
KVM/QEMU Hacker for Linaro

--0000000000008751ba05e5cab8fb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">ignore that - I see Thomas has already merged it.<br></div=
><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tu=
e, 9 Aug 2022 at 09:23, Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@=
linaro.org">alex.bennee@linaro.org</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex"><br>
Pavel Dovgalyuk &lt;<a href=3D"mailto:pavel.dovgalyuk@ispras.ru" target=3D"=
_blank">pavel.dovgalyuk@ispras.ru</a>&gt; writes:<br>
<br>
&gt; Last line of the test is missing by accident.<br>
&gt; This patch fixes the script.<br>
&gt;<br>
&gt; Signed-off-by: Pavel Dovgalyuk &lt;<a href=3D"mailto:Pavel.Dovgalyuk@i=
spras.ru" target=3D"_blank">Pavel.Dovgalyuk@ispras.ru</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 tests/avocado/replay_linux.py |=C2=A0 =C2=A0 1 +<br>
&gt;=C2=A0 1 file changed, 1 insertion(+)<br>
&gt;<br>
&gt; diff --git a/tests/avocado/replay_linux.py b/tests/avocado/replay_linu=
x.py<br>
&gt; index 40e4f6908e..e1f9981a34 100644<br>
&gt; --- a/tests/avocado/replay_linux.py<br>
&gt; +++ b/tests/avocado/replay_linux.py<br>
&gt; @@ -189,3 +189,4 @@ def test_virt_gicv3(self):<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.run_rr(shift=3D3,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 args=3D(*self.get_common_args(),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 &quot;-machine&quot;, &quot;virt,gic-version=3D3&quot=
;))<br>
<br>
Queued to testing/next, thanks.<br>
<br>
-- <br>
Alex Benn=C3=A9e<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Alex Benn=C3=A9e<br>KVM/QEMU Hacker for Linaro</div>

--0000000000008751ba05e5cab8fb--

