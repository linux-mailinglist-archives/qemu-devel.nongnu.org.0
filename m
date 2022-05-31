Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0111753951A
	for <lists+qemu-devel@lfdr.de>; Tue, 31 May 2022 18:54:45 +0200 (CEST)
Received: from localhost ([::1]:46280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nw58m-0001of-7F
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 12:54:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1nw4mS-0004Pw-1B
 for qemu-devel@nongnu.org; Tue, 31 May 2022 12:31:40 -0400
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d]:39664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1nw4mO-0005vm-NT
 for qemu-devel@nongnu.org; Tue, 31 May 2022 12:31:38 -0400
Received: by mail-qv1-xf2d.google.com with SMTP id a9so5475470qvt.6
 for <qemu-devel@nongnu.org>; Tue, 31 May 2022 09:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KIKeAqkrG19d4My41f/svEHozW5TdYssAHIH19GQ9fA=;
 b=tP9Rf9qKhwP+AZZ/rpTX27784bvPBI/RVELijOsQFudJ3T7Z03VmD5P3VBjNLQR0E3
 zUFq8Oynr5MGfjsBQSK5Lerxqbv35edOL5t9A19e/PeNLy1le0GJOdqyJ4ozSkJPJXmJ
 i41jE10x3MVErzG6q/veReKM8FT/T7fU2TnGaYcZfZujQf8ne9diq8PxenwTVSeXjpjI
 0K39/ZGakaW+bx8RWjt813nPKB2yUa94T4W+xb2qGYTTyp3o3YdgHS22DHQTLK+T8BPV
 SgEMCPk/Ak9K+7xEJi5AZHtCsRCdqvEPW9W3+bhtFrp4p6pviH63YW7Y0+ana0ebDBwN
 T32Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KIKeAqkrG19d4My41f/svEHozW5TdYssAHIH19GQ9fA=;
 b=mIelPnDo89H4ZhWrDp25Kb0B/AJNSAAvAzLkVZEX9NPKUXeW5bV245d8iP7/E2iofr
 X1LdpK72uWsflcr8P3B//XxxuCduUw/sBzDDZ1PTBsrRxoUVpC8XKpBMIiI51CpkiRFj
 xxGNwP2GDYDFoW8ua7WQKEXpz3ahV4f0z+cIz9KxKHpyGHhS7ALhPnG/8UEbMWjpJH6V
 Onc3VZHsn7gSr1PCCYJ+GWVfdWKOZJkTNwh62F6RVRDpDx11SdrcABU6/iV38Cbs4lm1
 A3+qxreIiqagsQSCnK47bHVF3BwJBs+4BCUGbfkCPqiMk8i1cUPKDIG3p0YrXPCfa7WM
 Nwug==
X-Gm-Message-State: AOAM532i4NH+JlUxQt+zqfLWZUWBPCgWgjxkEWoHFVLKFu/FysRvbKtm
 Z+8TOBdj+OqVqMCg82p50GKRLNDZo/rOyjX5R1EE2w==
X-Google-Smtp-Source: ABdhPJz7TBHddq+ySz2MKZUGm4N0ikCtHt/fRXqhs1i67KQ259LV+UO0AvLIrtZvWHJ1BBx7Kfn9Fr+J7Jg94kIXjPQ=
X-Received: by 2002:a05:6214:224f:b0:43f:cd6a:1d6b with SMTP id
 c15-20020a056214224f00b0043fcd6a1d6bmr51826881qvc.12.1654014695062; Tue, 31
 May 2022 09:31:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220531080921.4704-1-linmq006@gmail.com>
In-Reply-To: <20220531080921.4704-1-linmq006@gmail.com>
From: Hao Wu <wuhaotsh@google.com>
Date: Tue, 31 May 2022 09:31:24 -0700
Message-ID: <CAGcCb129Mz-ZDSc_wFF=Z6SiNHiC6Lnr+4TGvUKMOaYWchaCPg@mail.gmail.com>
Subject: Re: [PATCH] qtest/npcm7xx_pwm-test: Fix memory leak in mft_qom_set
To: Miaoqian Lin <linmq006@gmail.com>
Cc: Havard Skinnemoen <hskinnemoen@google.com>,
 Tyrone Ting <kfting@nuvoton.com>, 
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm <qemu-arm@nongnu.org>, 
 QEMU Developers <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="0000000000005aa52805e0514ed0"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2d;
 envelope-from=wuhaotsh@google.com; helo=mail-qv1-xf2d.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000005aa52805e0514ed0
Content-Type: text/plain; charset="UTF-8"

On Tue, May 31, 2022 at 6:18 AM Miaoqian Lin <linmq006@gmail.com> wrote:

> g_strdup_printf() allocated memory for path, we should free it with
> g_free() when no longer needed.
>
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
>
Reviewed-by: Hao Wu <wuhaotsh@google.com>

> ---
>  tests/qtest/npcm7xx_pwm-test.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/tests/qtest/npcm7xx_pwm-test.c
> b/tests/qtest/npcm7xx_pwm-test.c
> index c4a5fdcacd79..e320a625c4b6 100644
> --- a/tests/qtest/npcm7xx_pwm-test.c
> +++ b/tests/qtest/npcm7xx_pwm-test.c
> @@ -268,6 +268,9 @@ static void mft_qom_set(QTestState *qts, int index,
> const char *name,
>              path, name, value);
>      /* The qom set message returns successfully. */
>      g_assert_true(qdict_haskey(response, "return"));
> +
> +    qobject_unref(response);
> +    g_free(path);
>  }
>
>  static uint32_t get_pll(uint32_t con)
> --
> 2.25.1
>
>
>

--0000000000005aa52805e0514ed0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, May 31, 2022 at 6:18 AM Miaoq=
ian Lin &lt;<a href=3D"mailto:linmq006@gmail.com">linmq006@gmail.com</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">g_strdu=
p_printf() allocated memory for path, we should free it with<br>
g_free() when no longer needed.<br>
<br>
Signed-off-by: Miaoqian Lin &lt;<a href=3D"mailto:linmq006@gmail.com" targe=
t=3D"_blank">linmq006@gmail.com</a>&gt;<br></blockquote><div>Reviewed-by: H=
ao Wu &lt;<a href=3D"mailto:wuhaotsh@google.com">wuhaotsh@google.com</a>&gt=
;=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0tests/qtest/npcm7xx_pwm-test.c | 3 +++<br>
=C2=A01 file changed, 3 insertions(+)<br>
<br>
diff --git a/tests/qtest/npcm7xx_pwm-test.c b/tests/qtest/npcm7xx_pwm-test.=
c<br>
index c4a5fdcacd79..e320a625c4b6 100644<br>
--- a/tests/qtest/npcm7xx_pwm-test.c<br>
+++ b/tests/qtest/npcm7xx_pwm-test.c<br>
@@ -268,6 +268,9 @@ static void mft_qom_set(QTestState *qts, int index, con=
st char *name,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0path, name, value);<br>
=C2=A0 =C2=A0 =C2=A0/* The qom set message returns successfully. */<br>
=C2=A0 =C2=A0 =C2=A0g_assert_true(qdict_haskey(response, &quot;return&quot;=
));<br>
+<br>
+=C2=A0 =C2=A0 qobject_unref(response);<br>
+=C2=A0 =C2=A0 g_free(path);<br>
=C2=A0}<br>
<br>
=C2=A0static uint32_t get_pll(uint32_t con)<br>
-- <br>
2.25.1<br>
<br>
<br>
</blockquote></div></div>

--0000000000005aa52805e0514ed0--

