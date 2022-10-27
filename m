Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E4860F59A
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 12:44:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo0MB-0002B9-8m; Thu, 27 Oct 2022 06:43:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tkutergin@gmail.com>)
 id 1oo0M9-00023t-HU
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 06:43:25 -0400
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tkutergin@gmail.com>)
 id 1oo0M7-0002CU-RY
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 06:43:25 -0400
Received: by mail-yb1-xb29.google.com with SMTP id z192so1420766yba.0
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 03:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=z/EbK7sRF/Sigj1k2Kcez9Dx94XU/H/hSuVScEaoQLk=;
 b=UFwbjQ/QWBwRBS0g2iOc0vRBotChAzTSNRME2BD37vmojBbD3Y0UNvsf1WTM8kxJa7
 4DcTXA1LtFbImLcbB/M+QF3hjVrj12j84jH8jOwbERD0bWCKLbh/cJDiBDc7mOwgdBQ7
 vyT9pYna+JSqMSn4GKjWg4hhUiGlwrO9JsPc+Wdwac9pFl09mn9y7ai2Z14CFa3pp1vx
 9gfHOGykv0E7DLWJacVm03UlNn26fasZmgEuXLzyPeYDrHNRUOZZab50bRGSO0c1+sJ/
 NmGZQc0XPZ1E9m/t8Btmf+dp3rY5acQbvLnw/j7d8obpQnkcBvqkwajlzRie6I8twL2V
 v7TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=z/EbK7sRF/Sigj1k2Kcez9Dx94XU/H/hSuVScEaoQLk=;
 b=vQrNImcrk9u96NACWTjMcrY2j4aWXMCWakd2VB/eTM6Ju+9aIhhXPqmGfvKyJe9wgp
 Awuh5zEB5nWtaDdRoe+vJl4ROQox8LnT1cCUtqnvkq6GnZvJeA/znoSH6gROAhuxJN21
 ZOaeJq0IwkbERULl86PuVsRybuJgQdcri05whQxQP1bDqMycHSw6gRV7U0dbSkVZNaM6
 8lbaC02MpiXTfP8xYDkY5q8q3EqBw6GTw14LmgobPE4NhxXsOhjKcxIg3pYrG9+bv0mZ
 6Pc5OKfOFAofqhPsQ/qYtEbDCVUXkV6yl38HkDL66bPvE6rY9VxjDtIfkfc79lyEkSDx
 50rQ==
X-Gm-Message-State: ACrzQf2pUaqfTzzK1zoV0g3ax0a3shv1dI1IMbxu+nx23jB287JG8VYE
 hlY9EYD4VXMsgtBSynrK90H9gborTnu9jEQ+DfU=
X-Google-Smtp-Source: AMsMyM4l3RInt72eCii+nPLIePI+C8+Cc15rdXJVkWYBplYYka90y/6eC/KArg2Ji8vb9HB9bruHYPff4WQ+/rYqAEg=
X-Received: by 2002:a05:6902:1006:b0:6ca:b5af:ee35 with SMTP id
 w6-20020a056902100600b006cab5afee35mr23415397ybt.48.1666867401485; Thu, 27
 Oct 2022 03:43:21 -0700 (PDT)
MIME-Version: 1.0
References: <20221019121537.255477-1-tkutergin@gmail.com>
 <CAFEAcA-6ZyWbRvy9VOFJd0RR1h3bk9GNNzH4Uh0pznzT6RkOnA@mail.gmail.com>
 <CACKEeROBkPn0pPcH1vv4pRDFYztS3eWSLVZ3=rPN1dqopeRPng@mail.gmail.com>
 <CAFEAcA_X5qrMMDmJS=pkvdeuGa_Ux4aX-pkwKKHDZ2aUYBBVoA@mail.gmail.com>
In-Reply-To: <CAFEAcA_X5qrMMDmJS=pkvdeuGa_Ux4aX-pkwKKHDZ2aUYBBVoA@mail.gmail.com>
From: Timofey Kutergin <tkutergin@gmail.com>
Date: Thu, 27 Oct 2022 13:43:10 +0300
Message-ID: <CACKEeRP7cJoEQ+DkuH9AxQytAcp1XbdjbizV=aCZ4uTvMY3XSg@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Fixed Privileged Access Never (PAN) for
 aarch32
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000005a718f05ec01cf52"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b29;
 envelope-from=tkutergin@gmail.com; helo=mail-yb1-xb29.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--0000000000005a718f05ec01cf52
Content-Type: text/plain; charset="UTF-8"

Understood, thank you a lot :)

Best regards
Timofey


On Thu, Oct 27, 2022 at 12:35 PM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Thu, 27 Oct 2022 at 10:22, Timofey Kutergin <tkutergin@gmail.com>
> wrote:
> > > V8 always implies V7, so we only need to check V7 here.
>
> > From silicon perspective - yes, but as I see in qemu,
> > ARM_FEATURE_V7 and ARM_FEATURE_V8 are independent bits which do not
> affect each
> > other in arm_feature() and set_feature() so they should be tested
> separately.
> > Did I miss something?
>
> In arm_cpu_realizefn() there is code which sets feature flags
> that are always implied by other feature flags. There we set
> the V7VE flag if V8 is set, and the V7 flag if V7VE is set.
> So we can rely on any v8 CPU having the V7 feature flag set.
>
> thanks
> -- PMM
>

--0000000000005a718f05ec01cf52
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Understood, thank you a lot :)<br><br>Best regards<div>Tim=
ofey</div><div><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"l=
tr" class=3D"gmail_attr">On Thu, Oct 27, 2022 at 12:35 PM Peter Maydell &lt=
;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@linaro.org</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Thu=
, 27 Oct 2022 at 10:22, Timofey Kutergin &lt;<a href=3D"mailto:tkutergin@gm=
ail.com" target=3D"_blank">tkutergin@gmail.com</a>&gt; wrote:<br>
&gt; &gt; V8 always implies V7, so we only need to check V7 here.<br>
<br>
&gt; From silicon perspective - yes, but as I see in qemu,<br>
&gt; ARM_FEATURE_V7 and ARM_FEATURE_V8 are independent bits which do not af=
fect each<br>
&gt; other in arm_feature() and set_feature() so they should be tested sepa=
rately.<br>
&gt; Did I miss something?<br>
<br>
In arm_cpu_realizefn() there is code which sets feature flags<br>
that are always implied by other feature flags. There we set<br>
the V7VE flag if V8 is set, and the V7 flag if V7VE is set.<br>
So we can rely on any v8 CPU having the V7 feature flag set.<br>
<br>
thanks<br>
-- PMM<br>
</blockquote></div>

--0000000000005a718f05ec01cf52--

