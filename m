Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCDCF52E870
	for <lists+qemu-devel@lfdr.de>; Fri, 20 May 2022 11:12:19 +0200 (CEST)
Received: from localhost ([::1]:44472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrygC-0004ln-QE
	for lists+qemu-devel@lfdr.de; Fri, 20 May 2022 05:12:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <itaru.kitayama@gmail.com>)
 id 1nryXC-0005Y7-Qt
 for qemu-devel@nongnu.org; Fri, 20 May 2022 05:02:58 -0400
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d]:42831)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <itaru.kitayama@gmail.com>)
 id 1nryX6-0003Wx-Vu
 for qemu-devel@nongnu.org; Fri, 20 May 2022 05:02:57 -0400
Received: by mail-oi1-x22d.google.com with SMTP id q10so9270248oia.9
 for <qemu-devel@nongnu.org>; Fri, 20 May 2022 02:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dfsoJeepJBeAfMLO17JXcaVRr8lEloZCGNcgQCUuG/4=;
 b=FbTi0rmVr/wl+mYPkudHkvYMbnimZapmN7rNXzIQAeiKfh8YvEqw3bFrhyhpinI+8i
 nOhkiky0yhBrCD4AT/+xiA8mogQn78KV0pZv4IkBZl5lq/VFCUl9u9y34YqcX7qUmxfj
 pz0RMYuFwqzzscVrasZwdZb7wOSVRYsvqOLZRsGtgkAe+YwLRueC1Y80aE+E0dvGmZgz
 vLjsQySKzz/C24n3OIUtwln8a05qVXU3XSIVc5yvEfxI2+pc3Ccu1nepl1wDKGSaJ0NK
 xE/cIjLE/dUkHB1D5OQ0Itb3tb7eC5gwsC4/5Wv/a/q4uqp/1sRXAciZsoCtjz0b+mNX
 lFpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dfsoJeepJBeAfMLO17JXcaVRr8lEloZCGNcgQCUuG/4=;
 b=E578vN/MFVNe3mKI9tw/KpdPwl+e/lYuKmCYrrqH9QPF9/m16wJfTFUDu6pjR3+pCG
 Rdb+ytm5NmeSZgFlEqFI/UDdBeEmoXfjTcZ5T3gZt41Rxhg0LczlZUtC/umix0srxj1+
 3As7lfVOIe94p3e2Nwn00h665i8jqSD0VJ1wvEZYr1o7ADiKQdwPZ8CE7xDrGLYWg4vm
 iLLT551RlLEbiXVC2a5FwwOoqECnMoYBwrsSOJtkB0pYSwu3Ja+hf2NE77FsGd/Wlrc2
 00pdggBGI5dp2rTMAlVZnJTXyJsapqVnF4Q9tvwpURSyneTwjNjITzCDGf3RYbu24O/D
 jMOA==
X-Gm-Message-State: AOAM533u5Eb3nmgksFR5SyycP4qMde3UlVNiTkLqw/waxAD3BL/+yh0h
 k98sWTTmS9V0A9ajH1leZrbx2QbchKRNU9tUGCV7DPgo
X-Google-Smtp-Source: ABdhPJxk1PeSnWtaqBqH/2oKcYvcqW2bshoT+eQ9g/N/s5haegSMj/lHq1LDB7p9YxoBMQlfMUkeSd62CAogAiTZNmw=
X-Received: by 2002:aca:aa54:0:b0:32a:f3f3:93ac with SMTP id
 t81-20020acaaa54000000b0032af3f393acmr2835698oie.89.1653037371813; Fri, 20
 May 2022 02:02:51 -0700 (PDT)
MIME-Version: 1.0
References: <CANW9uyss4-NC3SH7xzofpMbu-cn4aDVT9Vvwjk6_JUzBwX4ioQ@mail.gmail.com>
 <CANW9uysaP5dFbXNi-ZmvhMJ9ESzHbqrhoLqXR05c2gBhQS6Hfw@mail.gmail.com>
 <CAFEAcA8XW0DGvysnn08m+dVVnfUADS4khV1jgXea2JgZEPzVaw@mail.gmail.com>
In-Reply-To: <CAFEAcA8XW0DGvysnn08m+dVVnfUADS4khV1jgXea2JgZEPzVaw@mail.gmail.com>
From: Itaru Kitayama <itaru.kitayama@gmail.com>
Date: Fri, 20 May 2022 18:02:40 +0900
Message-ID: <CANW9uytx_ocywwRVBLbze32-Vp1qR8FGMWx1691_ji_J8Ngfhw@mail.gmail.com>
Subject: Re: CPUs supported by the sbsa-ref board
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="00000000000058f31905df6dc1ce"
Received-SPF: pass client-ip=2607:f8b0:4864:20::22d;
 envelope-from=itaru.kitayama@gmail.com; helo=mail-oi1-x22d.google.com
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

--00000000000058f31905df6dc1ce
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

By calling a57=E2=80=99s CPU init function inside the max=E2=80=99s, I can =
bring up the
sbsa-ref board with the latest kernel. I=E2=80=99ll try to patch a64=E2=80=
=99s unit
function with Shuichiro next week.

On Fri, May 20, 2022 at 17:57 Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Mon, 16 May 2022 at 02:58, Itaru Kitayama <itaru.kitayama@gmail.com>
> wrote:
> >
> > With the latest, manually built TF-A, I was able to boot a72, but not
> > max. Since `max` type is supported by TF-A, I think it might be
> > a Qemu issue.
>
> How far did boot go? Does '-cpu max,lpa2=3Doff' work? There's a
> bug in older Linux kernels that makes them fail to boot on
> CPUs with the LPA2 feature.
>
> -- PMM
>

--00000000000058f31905df6dc1ce
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">By calling a57=E2=80=99s CPU init function inside the max=
=E2=80=99s, I can bring up the sbsa-ref board with the latest kernel. I=E2=
=80=99ll try to patch a64=E2=80=99s unit function with Shuichiro next week.=
</div><div dir=3D"auto"><br></div><div><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Fri, May 20, 2022 at 17:57 Peter Maydell &=
lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@linaro.org</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Mon, 16 May 2022 at =
02:58, Itaru Kitayama &lt;<a href=3D"mailto:itaru.kitayama@gmail.com" targe=
t=3D"_blank">itaru.kitayama@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; With the latest, manually built TF-A, I was able to boot a72, but not<=
br>
&gt; max. Since `max` type is supported by TF-A, I think it might be<br>
&gt; a Qemu issue.<br>
<br>
How far did boot go? Does &#39;-cpu max,lpa2=3Doff&#39; work? There&#39;s a=
<br>
bug in older Linux kernels that makes them fail to boot on<br>
CPUs with the LPA2 feature.<br>
<br>
-- PMM<br>
</blockquote></div></div>

--00000000000058f31905df6dc1ce--

