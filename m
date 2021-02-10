Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2405F315FE9
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 08:19:28 +0100 (CET)
Received: from localhost ([::1]:55210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9jmY-0002gr-Ib
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 02:19:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l9jkp-0002Dk-UW
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 02:17:39 -0500
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135]:40775)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l9jkj-0000Z1-Gw
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 02:17:39 -0500
Received: by mail-lf1-x135.google.com with SMTP id v24so1323140lfr.7
 for <qemu-devel@nongnu.org>; Tue, 09 Feb 2021 23:17:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Np4BwVOp+x0EEk9GCIBs34r36/GzGGn6V+AnBGsnxOA=;
 b=mzv1oyMnarTjxPCDwPFwEOHrOXWDBDeiesY6km/A2hh+yHq2A8n4LtVv6mifjoddIB
 XYIYNG+78ActqHxxMU8tLJQ6TEnAD0RdQ56xSYPOemQkBGb8CtOGNrSsbHDxA/VB7opH
 PDS+TKWKjtL8IZVftY8+Vu3bqKl67XYCayzq9UOY4GRWZ5G4jfAY3Ysk2pOJe5spBVg4
 IWZkkYRNGAlmLDtzJsmkSHdS2Qjne6nDiSUARuGfWrl8y1lt5t+nN9zYrBIvbVlbOTwZ
 uE7feJqllCGGCTgHgpWUUm1g6T2PKb+HM+kfLKsFxwZlkZgdg91rMNGy7QL4VtA/JveL
 KnKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Np4BwVOp+x0EEk9GCIBs34r36/GzGGn6V+AnBGsnxOA=;
 b=LGX/4yRp2DdVmCP63B9oWBPGzNu8StkFQO7g9Bt0xFEdKFGri+47ZRUhPdmrfzm7Ki
 1eWh3r8OLkcNqj80Y207/e8i/H9aZftFniPQjLfqQgPvoSS84C4gpLmSz10iUrpHby9e
 YEc0cTk9o5efmo+WwbbT6GAehWz/XRuCsf3cCeSDAc8QDstLjSDIFENerzoErolhpzUV
 WP5EZt3gUm4wrmzoVldtqx5X9erp3ijvkCD7CTQxFf6n7S1FltWeg4tWQtOw22A40Oe8
 QPc8ffHzCT/T2c1TjYXmCW/2R1XjxLP8E15wBnNEXGLwmxdC0oe/a5anZenLOE8K4RBj
 O9Kg==
X-Gm-Message-State: AOAM533u7qaKiJU6PMTmW1nrWMfTJDg0Z7FZ2XJjq9HujDd08E/8vK4T
 ej7O5YMtWESQY1fL7RQWjjeS2R+jtZqmFyqqloqBAQ==
X-Google-Smtp-Source: ABdhPJzS5l2yCU8xXLWut6hDuUzrqDGkd+g8JWZN8zHKpgEkdre1iQ/QDfvx5gqUrKtXIHiXTEHkunnFPlSzMCTVMA4=
X-Received: by 2002:a19:ad03:: with SMTP id t3mr1005768lfc.358.1612941451489; 
 Tue, 09 Feb 2021 23:17:31 -0800 (PST)
MIME-Version: 1.0
References: <20210205091857.845389-1-thuth@redhat.com>
 <875z319dv8.fsf@linaro.org>
 <b06ee27e-effa-d1c1-fdae-0a858e084482@redhat.com>
In-Reply-To: <b06ee27e-effa-d1c1-fdae-0a858e084482@redhat.com>
From: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Date: Wed, 10 Feb 2021 07:17:18 +0000
Message-ID: <CAHDbmO0k6-EC590CHb3npcMX4=cBWBm3+2_QnuUi8rHw8fTc2g@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] Move remaining x86 Travis jobs to the gitlab-CI
To: Thomas Huth <thuth@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000004284c205baf63264"
Received-SPF: pass client-ip=2a00:1450:4864:20::135;
 envelope-from=alex.bennee@linaro.org; helo=mail-lf1-x135.google.com
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
Cc: Willian Rampazzo <wrampazz@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000004284c205baf63264
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Will do.

On Wed, 10 Feb 2021, 05:44 Thomas Huth, <thuth@redhat.com> wrote:

> On 09/02/2021 21.37, Alex Benn=C3=A9e wrote:
> >
> > Thomas Huth <thuth@redhat.com> writes:
> >
> >> Since Travis changed their policies, travis-ci.org will soon become
> >> completely useless for the QEMU project. We should now really make sur=
e
> >> that we move the remaining tests as good as possible to the gitlab-CI
> >> instead.
> >
> > Queued to testing/next, thanks.
>
> Thanks, but please unqueue them again, I still want to send a v3 to
> address
> your comment on the -fsanitize=3Dundefined patch... and I also noticed th=
at
> the gprof/gcov job runs very long and sometimes hits the 1h time limit, s=
o
> I
> need to revisit the set of target architectures there...
>
>   Thomas
>
>

--0000000000004284c205baf63264
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Will do.=C2=A0</div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr" class=3D"gmail_attr">On Wed, 10 Feb 2021, 05:44 Thomas Huth, &lt=
;<a href=3D"mailto:thuth@redhat.com">thuth@redhat.com</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex">On 09/02/2021 21.37, Alex Benn=C3=A9e wro=
te:<br>
&gt; <br>
&gt; Thomas Huth &lt;<a href=3D"mailto:thuth@redhat.com" target=3D"_blank" =
rel=3D"noreferrer">thuth@redhat.com</a>&gt; writes:<br>
&gt; <br>
&gt;&gt; Since Travis changed their policies, <a href=3D"http://travis-ci.o=
rg" rel=3D"noreferrer noreferrer" target=3D"_blank">travis-ci.org</a> will =
soon become<br>
&gt;&gt; completely useless for the QEMU project. We should now really make=
 sure<br>
&gt;&gt; that we move the remaining tests as good as possible to the gitlab=
-CI<br>
&gt;&gt; instead.<br>
&gt; <br>
&gt; Queued to testing/next, thanks.<br>
<br>
Thanks, but please unqueue them again, I still want to send a v3 to address=
 <br>
your comment on the -fsanitize=3Dundefined patch... and I also noticed that=
 <br>
the gprof/gcov job runs very long and sometimes hits the 1h time limit, so =
I <br>
need to revisit the set of target architectures there...<br>
<br>
=C2=A0 Thomas<br>
<br>
</blockquote></div>

--0000000000004284c205baf63264--

