Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35A3E5962BC
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 20:56:13 +0200 (CEST)
Received: from localhost ([::1]:51334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oO1jX-0005kU-Rr
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 14:56:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1oO1gr-000464-S8; Tue, 16 Aug 2022 14:53:25 -0400
Received: from mail-vs1-xe2e.google.com ([2607:f8b0:4864:20::e2e]:35661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1oO1gq-00069N-6W; Tue, 16 Aug 2022 14:53:25 -0400
Received: by mail-vs1-xe2e.google.com with SMTP id 67so11061475vsv.2;
 Tue, 16 Aug 2022 11:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:reply-to:in-reply-to:references
 :mime-version:from:to:cc;
 bh=HBJP/aoaRsPzKK29DgOJQMP+JRmo5AETUm/mMw7Qeb0=;
 b=CdPkJoSnFBdLf/pOHvon72PHB74mKt4vknDC5Ajk590uVNaTeBxlwRWHoZJilPctbD
 IAcTuxg+bKPUgVDUFpMvOIwYi4Jodu/pWqvqPscag7T7bzNoCl8kO4p5KA8PKIuUknYN
 nGv3jXBHcvi8CglP1OfwM8Hiv0CklvuzTAHP2a9B6ZRF6TB7vOpz8Ijal4fJ87KPC0UE
 BBu1uS0l6FlJHs6g6t+C2QDnVuo12qc0GKTQQHHhZqRfqseM0YbKRGESZVB9hNAdxz9m
 0NU9szBeO4xcLR9Hf3xv/tGgkpDB19G6DNDZZWHMD3TyNyzvtIWOs0S3ncUsXA3E+soD
 4NyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:reply-to:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=HBJP/aoaRsPzKK29DgOJQMP+JRmo5AETUm/mMw7Qeb0=;
 b=mAaT4o/VyC0pDIRzdSLl2Iczxs1wbZddaTYgvh7nB6EAC9t5KbWvKcEGACPjprtyPG
 lbu1QQqqTFFPhWab3WzrPCfKhuiAWXCK6mCZxepzMHnhG2QpLlwMcgh3JjzGm/whY1Qv
 d5yVTsgtnPzuNfo9OkN75di2JhJJdmVqW1bcR4TNry22wwO1BAocDPGgGWJOfsH8almh
 sci/G+pjXhDUhFsMt/bQ3lR+rO9rqisjOnDot0P0YYvvKkhm08TQk6hVJh0gOZcuYqnV
 RdchKkOIdy4hIhpvwVtRpysqrs8IsrnE9kYs6NmH6xMJNtUWDZm/U+x+c1L72xgSip+m
 iBeQ==
X-Gm-Message-State: ACgBeo2DqA2jn6TZDrWQSnfofqz77szvah2Qe/Go4bbunfL8HfaCLFK6
 X0FmJ3ObvnyZZZdsJVRdGDZBc8urMWd7oaJgpfE=
X-Google-Smtp-Source: AA6agR53HeI0LHCwRsSrijq24GEzNjGYgBSl/+AQSeOjoqsD1fa5EvlVeoMGEQ4SgDFA67N9xEeLWJKgA3Ow8QnCZYY=
X-Received: by 2002:a67:c814:0:b0:385:1a6b:7284 with SMTP id
 u20-20020a67c814000000b003851a6b7284mr9010041vsk.15.1660676002290; Tue, 16
 Aug 2022 11:53:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220728200422.1502-1-luoyonggang@gmail.com>
 <8721edcf-9f67-5428-4ca9-eba3bd94075e@linaro.org>
In-Reply-To: <8721edcf-9f67-5428-4ca9-eba3bd94075e@linaro.org>
From: =?UTF-8?B?572X5YuH5YiaKFlvbmdnYW5nIEx1byk=?= <luoyonggang@gmail.com>
Date: Wed, 17 Aug 2022 02:53:10 +0800
Message-ID: <CAE2XoE8M+Tz3t=zh5GhX+vYCipNRdZUYieSjtAO2OUsJcYnAPw@mail.gmail.com>
Subject: Re: [PATCH v2] ci: Upgrade msys2 release to 20220603
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 qemu-trivial@nongnu.org, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Beraldo Leal <bleal@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000034271905e660437b"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2e;
 envelope-from=luoyonggang@gmail.com; helo=mail-vs1-xe2e.google.com
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
Reply-To: luoyonggang@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000034271905e660437b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I have reason to think that's msys2-64 bit failed because out of memory

I tried to show the memory size of the windows docker, it's result
are 6224352KB, that's less than 6GB?
https://gitlab.com/lygstate/qemu/-/jobs/2891399652

Can we increase the memory size to 16GB


On Sat, Jul 30, 2022 at 3:24 AM Richard Henderson <
richard.henderson@linaro.org> wrote:
>
> On 7/28/22 13:04, Yonggang Luo wrote:
> > Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
> > ---
> >   .cirrus.yml              | 2 +-
> >   .gitlab-ci.d/windows.yml | 2 +-
> >   2 files changed, 2 insertions(+), 2 deletions(-)
>
> Thanks.  Applied to master as a hot-fix.
>
>
> r~



--
         =E6=AD=A4=E8=87=B4
=E7=A4=BC
=E7=BD=97=E5=8B=87=E5=88=9A
Yours
    sincerely,
Yonggang Luo

--00000000000034271905e660437b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I have reason to think that&#39;s msys2-64 bit failed beca=
use out of memory<div><br></div><div>I tried to show the memory size of the=
 windows docker, it&#39;s result are=C2=A06224352KB, that&#39;s less than 6=
GB?</div><div><a href=3D"https://gitlab.com/lygstate/qemu/-/jobs/2891399652=
">https://gitlab.com/lygstate/qemu/-/jobs/2891399652</a></div><div><br></di=
v><div>Can we increase the memory size to 16GB</div><div><br><br>On Sat, Ju=
l 30, 2022 at 3:24 AM Richard Henderson &lt;<a href=3D"mailto:richard.hende=
rson@linaro.org">richard.henderson@linaro.org</a>&gt; wrote:<br>&gt;<br>&gt=
; On 7/28/22 13:04, Yonggang Luo wrote:<br>&gt; &gt; Signed-off-by: Yonggan=
g Luo &lt;<a href=3D"mailto:luoyonggang@gmail.com">luoyonggang@gmail.com</a=
>&gt;<br>&gt; &gt; ---<br>&gt; &gt; =C2=A0 .cirrus.yml =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>&gt; &gt; =C2=A0 .gitlab-ci.d/windows=
.yml | 2 +-<br>&gt; &gt; =C2=A0 2 files changed, 2 insertions(+), 2 deletio=
ns(-)<br>&gt;<br>&gt; Thanks.=C2=A0 Applied to master as a hot-fix.<br>&gt;=
<br>&gt;<br>&gt; r~<br><br><br><br>--<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
=E6=AD=A4=E8=87=B4<br>=E7=A4=BC<br>=E7=BD=97=E5=8B=87=E5=88=9A<br>Yours<br>=
=C2=A0 =C2=A0 sincerely,<br>Yonggang Luo</div></div>

--00000000000034271905e660437b--

