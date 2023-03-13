Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CB146B7B15
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 15:52:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbjWS-00047L-0T; Mon, 13 Mar 2023 10:51:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pbjWD-00046h-SC
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 10:51:21 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pbjWA-0004rw-DI
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 10:51:21 -0400
Received: by mail-ed1-x52e.google.com with SMTP id cy23so49677873edb.12
 for <qemu-devel@nongnu.org>; Mon, 13 Mar 2023 07:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678719076;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=yeMyMDDWQDV8Ilfzex3/TxESKgsN8h0b3K1cyKPfMw8=;
 b=q4lzG03aLCt1xQs4kc7tseRg7D+ghAU1n8cyOlpgQF/xtoCD0D65DVP3S1XW8wbYtO
 dJJwJYPoWWpUL+Es/EtXTgkSvH2VyFk1dVSjB+6dVYnQHy3U0nJKlLIQf4PHHVoR6QWi
 icBEvfJzKsD3clhqEdVSmZuyUCFgxHSlzF+h82s55cvCkT6cLgbeDvK+DiaN299w4A1c
 NbTDXI15cCvYUbQmOR+lpBn/yaaf0ffRpiNehGpTi5Ke+zbiU3FcrsBawkaPK9UySFKj
 J61PpEx9rhsQ1SHzwwTYusYCONj9J9qVyR9vsE9SpeTPoo04wsxBu5EMstnAOvXMVtZB
 ssIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678719076;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yeMyMDDWQDV8Ilfzex3/TxESKgsN8h0b3K1cyKPfMw8=;
 b=zjNJa1JEhNjxfhpEDeV8YDxTgNksF3WIj5xwrkBim3hSiIq+j+aD7TyJeh9HyhfDUe
 pGSJw2JWZoClsEcKxWPPJzb3pTxn7/w5i/GPm9y4c5/hPXO/Uzo8YhMCQTqzMO2JHCgQ
 gz3xnMm0nOioSJKKDTcsC6hPttnUfZBY5jA4FCQXQQ9byyQhwZST/7W3FYQ5a9xFDm34
 tYgu+1pEDHMlr0kd9qqa6ZmtrEFzdL6P1O0zS1gaVVtPoCVd27gvFQkiDm/8OJXPmK4+
 leMZ1arsNN2j3STxgV6WGZsnugXYbhfaD9ZsqJXOhgldObQNMKnmuxprmNLD+MTEODDI
 QWhg==
X-Gm-Message-State: AO0yUKUpcmhlzZP0FovypJwyZXo0Xu2ooIVDLlv3N1kI4dzps3ZT3gHq
 iat+fsdg2xGgsuDpwALXyh+i3+zSjdukJAUzAFdYYw==
X-Google-Smtp-Source: AK7set/uSiR909a12bV0POXwcejhg7bNJ22uKfO2sLutVL9IWkDGPNKsZmU8LzJhredgzKaFm+S41OyAUXmZz25L26Q=
X-Received: by 2002:a17:906:2d51:b0:8af:7efc:84af with SMTP id
 e17-20020a1709062d5100b008af7efc84afmr17628286eji.11.1678719076387; Mon, 13
 Mar 2023 07:51:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220926142422.22325-1-antonio.caggiano@collabora.com>
 <877cx46jjg.fsf@linaro.org>
 <fc74d071-2563-ee8c-ab7e-c5d4a2f3b0cc@collabora.com>
 <CAAfnVBmiB=fokNztOj4XR=6d1U7JFGK9Z0wcyfVYBu_bDmWPbQ@mail.gmail.com>
 <CAJ+F1C+v9tM2FezYoGJ+yAPPoNzT6foPoyJ-_WvS+kTcBSJgPg@mail.gmail.com>
 <e912b13f-4306-88f2-1fd6-ca7481374cdf@collabora.com>
In-Reply-To: <e912b13f-4306-88f2-1fd6-ca7481374cdf@collabora.com>
From: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Date: Mon, 13 Mar 2023 14:51:04 +0000
Message-ID: <CAHDbmO3vjfS2goZFyhja9YvV1xMor20_73=LXhR-y+CBcgGmqQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/9] virtio-gpu: Support Venus Vulkan driver
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>, 
 Gurchetan Singh <gurchetansingh@chromium.org>, gert.wollny@collabora.com, 
 QEMU Developers <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="00000000000039e49005f6c93ec3"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
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

--00000000000039e49005f6c93ec3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

If gfxstream is the android pipe based transport I think it's a legacy from
before the switch to pure VirtIO for the new Cuttlefish models.

On Mon, 13 Mar 2023, 13:27 Dmitry Osipenko, <dmitry.osipenko@collabora.com>
wrote:

> On 3/13/23 15:58, Marc-Andr=C3=A9 Lureau wrote:
> ...
> >> 2) Additional context type: gfxstream [i]?
> >>
> >> One of the major motivations for adding context types in the
> >> virtio-gpu spec was supporting gfxstream.  gfxstream is used in the
> >> Android Studio emulator (a variant of QEMU) [ii], among other places.
> >> That would move the Android emulator closer to the goal of using
> >> upstream QEMU for everything.
> >
> > What is the advantage of using gfxstream over virgl? or zink+venus?
> >
> > Only AOSP can run with virgl perhaps? I am not familiar with Android
> > development.. I guess it doesn't make use of Mesa, and thus no virgl
> > at all?
>
> +1 I'm also very interested in getting an overview of gfxstream
> advantages over virgl and why Android emulator can't move to use
> virgl+venus (shouldn't it just work out-of-the-box already?). Thanks!
>
> --
> Best regards,
> Dmitry
>
>

--00000000000039e49005f6c93ec3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">If gfxstream is the android pipe based transport I think =
it&#39;s a legacy from before the switch to pure VirtIO for the new Cuttlef=
ish models.=C2=A0</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" clas=
s=3D"gmail_attr">On Mon, 13 Mar 2023, 13:27 Dmitry Osipenko, &lt;<a href=3D=
"mailto:dmitry.osipenko@collabora.com">dmitry.osipenko@collabora.com</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex">On 3/13/23 15:58, Marc-And=
r=C3=A9 Lureau wrote:<br>
...<br>
&gt;&gt; 2) Additional context type: gfxstream [i]?<br>
&gt;&gt;<br>
&gt;&gt; One of the major motivations for adding context types in the<br>
&gt;&gt; virtio-gpu spec was supporting gfxstream.=C2=A0 gfxstream is used =
in the<br>
&gt;&gt; Android Studio emulator (a variant of QEMU) [ii], among other plac=
es.<br>
&gt;&gt; That would move the Android emulator closer to the goal of using<b=
r>
&gt;&gt; upstream QEMU for everything.<br>
&gt; <br>
&gt; What is the advantage of using gfxstream over virgl? or zink+venus?<br=
>
&gt; <br>
&gt; Only AOSP can run with virgl perhaps? I am not familiar with Android<b=
r>
&gt; development.. I guess it doesn&#39;t make use of Mesa, and thus no vir=
gl<br>
&gt; at all?<br>
<br>
+1 I&#39;m also very interested in getting an overview of gfxstream<br>
advantages over virgl and why Android emulator can&#39;t move to use<br>
virgl+venus (shouldn&#39;t it just work out-of-the-box already?). Thanks!<b=
r>
<br>
-- <br>
Best regards,<br>
Dmitry<br>
<br>
</blockquote></div>

--00000000000039e49005f6c93ec3--

