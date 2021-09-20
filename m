Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B5AD411B51
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 18:56:23 +0200 (CEST)
Received: from localhost ([::1]:33858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSMab-0004XM-MZ
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 12:56:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevin.townsend@linaro.org>)
 id 1mSMUB-0006dJ-Cj
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 12:49:43 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:40903)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kevin.townsend@linaro.org>)
 id 1mSMU9-0008H9-Mh
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 12:49:43 -0400
Received: by mail-wr1-x436.google.com with SMTP id q26so31525657wrc.7
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 09:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Z3YoGNY/P5DHE5Iv6RWE30O4HpELox6HgP5mOIKdCVE=;
 b=FxzoJ/Y2Ln2JQ4HwnYvIWzi3QHU296updVnqSHGjOtl+ACNclQjyTVs5v447AZhNCG
 +UQN2Ofqma7cWRaqpEkY3vrs+Fsh1dKu/MPI+olnShlFzC+NOtZk+tJG7s7t2KfQWNt5
 PY2NDJheNT7CY75FRK51T+dxKMj9Tpf5NVQO66EujsOBNUJTHgZnFOdKftF/Hf86O4HQ
 +RU1NecqRPx8bnv0LhK6dzY/DORcJListJ5voaSWk55ry19EqNZ4uJ63qASE6tnK9PJJ
 7nctQOkjffpcEHk0hymDGmCj1ro3UC+tBuFVio7BKyUqhp7BOSi01mhfYhlcmk9JiJ4J
 BA/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Z3YoGNY/P5DHE5Iv6RWE30O4HpELox6HgP5mOIKdCVE=;
 b=YEXaLv5NR3Q5OEXUoSZSQvEHKrfytqEWvxicfKMqT7X+IUW7i+QMUTN0kfS4i1DTHA
 0SBLp9T8C8+B2ogUs1W++rxpEzas5Ki8Y+K1wrD0gBYMm+m9Z7vJqwyuGiaV45urhMt5
 /F6FzIp1oU3BwOtNzl2lDeyDZ3gtU1ZgNSNCG/fGD7MfeF51s1bhKYEVZ/g6lvfqfSEW
 aTS/RFRTQGb6LGlrD2m7qRe6mjxR0Va0nD6wThtkV/EDJFxGRzBY3OaanyFKNcWJN2Uw
 IA9dv1YgPlyzB/EtFhO5jwhdIxbIx39HwN9ExaUJ6ogiUZj5bOm0OOM3666ftGkDMr6l
 a4hw==
X-Gm-Message-State: AOAM531or4qhV9QUBanJGe53pzLV/BgoEYKC4FplGmKyrAZKzCZoaxZj
 +nq5g9cZbIgk/YcEg+cSMtChCm8agrl64Ckipdy+UA==
X-Google-Smtp-Source: ABdhPJzjdHXobV+u5e0zTuLsuSipoY2Xb4o4MB/cMupQ6R3IgQOKOkaZWMElwbUQu1XHtNw/mVZ59NwBbNvqO27VwyU=
X-Received: by 2002:adf:f8d2:: with SMTP id f18mr29710348wrq.140.1632156579928; 
 Mon, 20 Sep 2021 09:49:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210815162738.75461-1-kevin.townsend@linaro.org>
 <20210815162738.75461-2-kevin.townsend@linaro.org>
 <CAFEAcA8L7N0m1XRzRnyLt8QUOdrX436-2Xa9a04oYGOd6E0agw@mail.gmail.com>
 <CAFPHj6PJZdLXRiYXfz-zwgCaUwvTB8sbUsXcNL=aweqXR2hxQA@mail.gmail.com>
 <CAFEAcA_T4i9HL45h_AXfir+5U6ab8YFd7Sb2_6mGMtQuKh5UXg@mail.gmail.com>
 <CAFPHj6OWBhBg_SfXQ0MbjJ-Lfg3-=6=sLeY9zTaVU=LAMdSmBA@mail.gmail.com>
 <CAFEAcA-Fi4ZVdXMv-HZ5EPMGpj_fH2VmY+ZFeKKXvVYp4OkP0A@mail.gmail.com>
In-Reply-To: <CAFEAcA-Fi4ZVdXMv-HZ5EPMGpj_fH2VmY+ZFeKKXvVYp4OkP0A@mail.gmail.com>
From: Kevin Townsend <kevin.townsend@linaro.org>
Date: Mon, 20 Sep 2021 18:49:29 +0200
Message-ID: <CAFPHj6PhOxcXjxHnW33iO2z+Z72LyFOeg5Z5uDBCTM-RVz7Q6A@mail.gmail.com>
Subject: Re: [PATCH v2] hw/sensor: Add lsm303dlhc magnetometer device
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000002a348105cc7011bd"
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=kevin.townsend@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000002a348105cc7011bd
Content-Type: text/plain; charset="UTF-8"

On Mon, 20 Sept 2021 at 17:14, Peter Maydell <peter.maydell@linaro.org>
wrote:

> That's OK -- our "int" properties are int64_t. So we could easily
> fit something like 10000 == 1.0000 uT, in case we might want
> the extra precision in future. That would be 1,000,000 == 1 G
> (assuming I haven't messed up my arithmetic ;-))
>
> Is 0.001 uT OK to use as a starting point? I think that's enough for most
sensors I'm aware of.

Kevin

--0000000000002a348105cc7011bd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, 20 Sept 2021=
 at 17:14, Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">pe=
ter.maydell@linaro.org</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">
That&#39;s OK -- our &quot;int&quot; properties are int64_t. So we could ea=
sily<br>
fit something like 10000 =3D=3D 1.0000 uT, in case we might want<br>
the extra precision in future. That would be 1,000,000 =3D=3D 1 G<br>
(assuming I haven&#39;t messed up my arithmetic ;-))<br>
<br></blockquote><div>Is 0.001 uT OK to use as a starting point? I think th=
at&#39;s enough for most</div><div>sensors I&#39;m aware of.</div><div><br>=
</div><div>Kevin<br></div></div></div>

--0000000000002a348105cc7011bd--

