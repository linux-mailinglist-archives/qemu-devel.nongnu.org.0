Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E156FCFB2
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 22:41:29 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwU86-0008Qg-Io; Tue, 09 May 2023 16:40:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1pwU84-0008QT-QO
 for qemu-devel@nongnu.org; Tue, 09 May 2023 16:40:12 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1pwU83-0006uK-AM
 for qemu-devel@nongnu.org; Tue, 09 May 2023 16:40:12 -0400
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-50bc3a5f462so8238a12.1
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 13:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1683664808; x=1686256808;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=PNMAAzWHtJQ1iH1LUqvg2qY09UO1u5+34sf76VinOlY=;
 b=OcQLCvN4wZzxsJS5CftP8BJUpTI4YzYhhtYbxeogvJhnC6S2JYosWBPJ6MiyH9b76O
 kmne2C81of5Fxh9FAuSK2Y49Nna8xzQ9Whup7A8rgYyrVbeAt/cmYadFpa1FM+zKce9b
 1ImjSowrQ6B59QK2hynsZVaG1l6VPKXIKdCIZhddWT0Po42DXwACPb53JTNx0XDw884Y
 5przufdwCq+ECvO0SCYNSiO3VpHGqOe8LUUnnx7fK0fO+xJ+eT/2Tkm1/5/MBgoYi7WY
 aOw9CToi2ELVOX/3V+tUJM42Qabyvs9nCgoEzUdnx/HvLVa0buvAKqKojFG9XWDtmnit
 t0lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683664808; x=1686256808;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PNMAAzWHtJQ1iH1LUqvg2qY09UO1u5+34sf76VinOlY=;
 b=kfPQNCq3AjgO6e4PcCIBfVZ99/7zhPRCtLQB350t14FVfXTNnnsL2kZ7ZVERDTsxm5
 2fsUVifWc1hYYgYPFVih5rw0MOA1GwzT4fjZjCBVs62c4dbu0P7tFpTwO6Abb13FJM1D
 mU5EyOj2rES2FQ3dS6umSrqJA5/F1FNYnoy9kMlfqD4oW3jV/gT28ieMSkCKDvB6S3Zg
 OU72nA7DuAIQok9FMgydk7g9JHmN+zoii+NH0jYX5KKrYGfEAhLxyB/1HvjQN6Hx0rt1
 lEAG7yhuivZuGowhEJ5GuhK6LSgrmswlAFo8jvvjQpTnf8jMVdgnzTxSL8sS0p7zZ6T3
 T7yA==
X-Gm-Message-State: AC+VfDyCirJJNyigxdYiOh3OI8dhaZKHVZ9nDJYRGBjVDzrdfO7SnZYC
 fnwkhnu2xI1RHY2v1Dkrla5HZTiJcAAtBUUoWhHaXzw8oj8wr2RMzMU=
X-Google-Smtp-Source: ACHHUZ5dgLCqb7RsxtRmOnzzb6LuK41TkuNcs/mJ/cJPL/pDmppZpY9XRjgbYHZva08/WpZlohFeJsgmNUWmxlmAZR8=
X-Received: by 2002:a05:6402:321a:b0:4bc:dee8:94ca with SMTP id
 g26-20020a056402321a00b004bcdee894camr20307eda.7.1683664808413; Tue, 09 May
 2023 13:40:08 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notxJzdsy6S_f64f1nXGMGU-ZSr01iRDwc1-EyT5Lj9p1Dg@mail.gmail.com>
 <CAO=notw3-Hhqyr=w-zRbCn=_yNp+r5WYeMd=-3JP3j+MJvfg0w@mail.gmail.com>
 <059dbadb-c7be-2491-e644-1118c2cd8c76@linaro.org>
 <3f0779e1-d939-f7e4-f3a8-e3e9e6a90e51@msgid.tls.msk.ru>
In-Reply-To: <3f0779e1-d939-f7e4-f3a8-e3e9e6a90e51@msgid.tls.msk.ru>
From: Patrick Venture <venture@google.com>
Date: Tue, 9 May 2023 13:39:57 -0700
Message-ID: <CAO=notwUQUMkv1EssOpNT4UK8Ei29E10eJ=SQcc_HqN32ikS7w@mail.gmail.com>
Subject: Re: ssl fips self check fails with 7.2.0 on x86 TCG
To: mjt@tls.msk.ru
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 QEMU Developers <qemu-devel@nongnu.org>, Peter Foley <pefoley@google.com>
Content-Type: multipart/alternative; boundary="000000000000d41cb405fb48c268"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=venture@google.com; helo=mail-ed1-x530.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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

--000000000000d41cb405fb48c268
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 9, 2023 at 9:51=E2=80=AFAM Michael Tokarev <mjt@tls.msk.ru> wro=
te:

> 09.05.2023 17:39, Philippe Mathieu-Daud=C3=A9 =D0=BF=D0=B8=D1=88=D0=B5=D1=
=82:
> ..> Should be fixed in v7.2-stable:
> >
> > $ git log --oneline --grep=3D1d0b9261 v7.2.2
> > c45d10f655 target/i386: fix ADOX followed by ADCX
> > 6809dbc5c5 target/i386: Fix C flag for BLSI, BLSMSK, BLSR
> > 8d3c9fc439 target/i386: Fix BEXTR instruction
>
> Unfortunately it is still not released, -
> I haven't heard anything from Michael Roth since Apr-22 (when 7.2.2
> planned).
>

Thanks, I have it cherry-picked into our repo. :)


>
> /mjt
>

--000000000000d41cb405fb48c268
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, May 9, 2023 at 9:51=E2=80=AFA=
M Michael Tokarev &lt;<a href=3D"mailto:mjt@tls.msk.ru">mjt@tls.msk.ru</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">09.05=
.2023 17:39, Philippe Mathieu-Daud=C3=A9 =D0=BF=D0=B8=D1=88=D0=B5=D1=82:<br=
>
..&gt; Should be fixed in v7.2-stable:<br>
&gt; <br>
&gt; $ git log --oneline --grep=3D1d0b9261 v7.2.2<br>
&gt; c45d10f655 target/i386: fix ADOX followed by ADCX<br>
&gt; 6809dbc5c5 target/i386: Fix C flag for BLSI, BLSMSK, BLSR<br>
&gt; 8d3c9fc439 target/i386: Fix BEXTR instruction<br>
<br>
Unfortunately it is still not released, -<br>
I haven&#39;t heard anything from Michael Roth since Apr-22 (when 7.2.2 pla=
nned).<br></blockquote><div><br></div><div>Thanks, I have it cherry-picked =
into our repo. :)</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">
<br>
/mjt<br>
</blockquote></div></div>

--000000000000d41cb405fb48c268--

