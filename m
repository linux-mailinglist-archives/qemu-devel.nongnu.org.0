Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A6B3CF6A1
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 11:10:42 +0200 (CEST)
Received: from localhost ([::1]:51144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5llx-0002xZ-Jx
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 05:10:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m5lkk-0002I2-4t
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 05:09:26 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:42545)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m5lki-0001ft-Kc
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 05:09:25 -0400
Received: by mail-ej1-x634.google.com with SMTP id hd33so33238109ejc.9
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 02:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/9R/R7Hg+FM4d9nvIcDL64gSDX1bAi7JR98EWF3lkpo=;
 b=JPe2Yah6p+cudbIs5qhi8LAUYNeu4bDOjBi4Nacei0P+5vYlueWzVKNkP8LAGAM6lb
 a9xx+J//qHwFX2/Tuuiiq9XdFOsYOT6YZXsbtwApQ2l7wvcIzWNHxiYMmoS8HNUCwSRF
 VRnVIkqmCOPXw97BEJILiO6yIygmy3t22JV/epUke+RNuvN0R91MWmVAmtcBXjI01a9A
 zyjJvTX4CB1rvAkEwqW56+hCv9TK5Om83lmW824AQH7nx6tadUYJL7+Y7fg5xNh1nSq/
 hBxISrwyX6NBeQi5bex1p6u4qQAIP7DMDaApDZZHfdu2fcITJ2yDwb10zj+ri+o9a5LX
 dWng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/9R/R7Hg+FM4d9nvIcDL64gSDX1bAi7JR98EWF3lkpo=;
 b=QR3AON/1pAtIMDn3EOA19xTcBygQ2meframj25kKxqGtlebr0GXu35eWJHh/Dwp8QG
 oC0k5YycEnOJqsWvvnIXFKn0Z3PcFHnZGtA79AngP24GMosEn+mVzLrZ8mfVltBbUGf3
 QV4Bfcpy5dn/jjktXC4eSlMGuHFva1v7YHPfAZYJp98X3c+bBreo4BLJ0suxF8jRQBfm
 jyDz2T64+RJ6VvTnvh9+B3u0S9CJKcLeqOZtDKYKwdNbcvmLbbwDJu5Gdp6Is+o+2ALr
 u+ozJJfGyH/vozzBL4bZFkH+Qdp2Ln5FWwtpLqYDfP73XkQIZMIy6IU15R9ZaeYDnyBr
 oYMg==
X-Gm-Message-State: AOAM532KTartEg/PBM/8XQzWro2esTxTZogmEm9sa5tew4pmaGiLao9O
 7XtTjlmcm0DcTHt88pO8tGtC5Aj5Irf6hGtwYncwlg==
X-Google-Smtp-Source: ABdhPJw+kfLN0pm8KUaPrQciQA8+v52KjxkY3q9FGfSKvDtMoBv1q49nQtbss6iWcFNDpco82S8I+5Wxj4llFaBaeFA=
X-Received: by 2002:a17:906:a2d7:: with SMTP id
 by23mr31090662ejb.382.1626772162954; 
 Tue, 20 Jul 2021 02:09:22 -0700 (PDT)
MIME-Version: 1.0
References: <1626413223-32264-1-git-send-email-ishii.shuuichir@fujitsu.com>
 <CAFEAcA_xMdsLtsyX3aV+JKoLuNiaR3zHmv1NXwVUkWRSAbQuAA@mail.gmail.com>
 <TYCPR01MB61601256BD8311CE6D2A6767E9E29@TYCPR01MB6160.jpnprd01.prod.outlook.com>
In-Reply-To: <TYCPR01MB61601256BD8311CE6D2A6767E9E29@TYCPR01MB6160.jpnprd01.prod.outlook.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Jul 2021 10:08:42 +0100
Message-ID: <CAFEAcA9vQ+00p3RHouqwQHg-f95gTci=WxN22akx0TSSf6ca1g@mail.gmail.com>
Subject: Re: [PATCH 0/4] Add support for Fujitsu A64FX processor
To: "ishii.shuuichir@fujitsu.com" <ishii.shuuichir@fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 20 Jul 2021 at 08:35, ishii.shuuichir@fujitsu.com
<ishii.shuuichir@fujitsu.com> wrote:
>
> Hi, peter
> Thank you for your comment.
>
> > Hi; it looks like something with your outgoing email setup still disagrees
> > with QEMU's mailing list server :-(  As far as I can tell these emails didn't
> > make it to the list, so only people on the direct-cc list will have
> > seen them :-(
>
> As you said, it seems that I am not listed in the mail server again.
> When I contacted the server administrator before,
> the server administrator took care of it so that my e-mail address would not be judged as spam mail,
> but I am in the process of contacting the server administrator again.
>
> If the mail server is able to list it correctly,
> should we resubmit the V1 patch series to list it properly?
> Or, since there are patches that have already been commented on,
> should I post them as a V2 patch series that reflects those comments?

Once you've got the mail issues sorted, if you have a v2 ready to
go at that point, you might as well just post the v2. Otherwise
you can repost the v1.

thanks
-- PMM

