Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE8DA3DF745
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 00:10:03 +0200 (CEST)
Received: from localhost ([::1]:54204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mB2bq-0000en-F7
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 18:10:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mB2ay-0008OM-Bl
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 18:09:08 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:37401)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mB2aw-0002Pi-TJ
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 18:09:08 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 l34-20020a05600c1d22b02902573c214807so2664165wms.2
 for <qemu-devel@nongnu.org>; Tue, 03 Aug 2021 15:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=7Y1lwPgN/zjHZIVEn6mU3j43Jeej/F9zw/ZThc4sgOA=;
 b=BFPZaUx8BPtoudrcnGLhlITQLgatxpVMQbysAHBAHc6YWQ32qpEl76OKgrklxUUpKI
 efFbbJ/5CUxB3xdjbN4mKKHYej1whlKYdwzQRKtXAN2zURD9raDep/VA9xcAwiBgCGFa
 u9H45g5Fs8qIQmcTnoGJ0A7r4Tma8p8jqv6v0f6XQwzKJfkv1hhaeI+yI64svmrFbLAr
 QSBMTCC/gxiUmg6oPi626mcczBn4vrFRk9hL6Ja/j1Yj7ioSJyOOpSBWC/NNevFEn6QD
 4IgrGwL4QSE4wJJFzju5k4aZtcn3GCtI/ekCufEiG7D1LXWKQywiHKxxTmeWpKT/16WV
 k1zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=7Y1lwPgN/zjHZIVEn6mU3j43Jeej/F9zw/ZThc4sgOA=;
 b=Oo6YOQqbcBjXGnbIrfzoCOhjF3bXl7tse79YGEswfSe3OW7zz1TqKdHhmV9zU4LQbI
 7IWlldC0aDL7yEOeWMZ4rxbjixREn8TSj0KtdjM5GKoRoiiuW2peK84Le9UonJIi/SU9
 JR86IskTua5EA7BdyT8bHk8LeIdoaIToXNL7TVArXLmmfBNwCBuVDeJEiccDEdLe2MrX
 H8dIZGxDVqauPc/qn/0f786tXyVVBgb5+TJ3Ml6bJ+gaprWOnkO5nVZSi+tQURZggEoI
 p0KiFhg76dGbq5JN2bXmfLMT9Sr07QXJqUSKO6sZv24cpXiX0rZtfVZz8jdTYeA7eyD8
 j3Tw==
X-Gm-Message-State: AOAM530FC+zayQ8MeHJQpSn72cnoJqvsCia9QlAvDIM4gOxS4fQwspW0
 uSa3kmYZJG4bPAlRVGCeCfLohg==
X-Google-Smtp-Source: ABdhPJwejclC+snAZkhY1BYj46rRxYd9NomIU/gb/bEVkkN2XN5Rqd8rsrpUTxYfsEs81ufUuENEVw==
X-Received: by 2002:a05:600c:1c13:: with SMTP id
 j19mr22398944wms.164.1628028545051; 
 Tue, 03 Aug 2021 15:09:05 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id f17sm236690wrt.18.2021.08.03.15.09.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 15:09:04 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 850B81FF96;
 Tue,  3 Aug 2021 23:09:03 +0100 (BST)
References: <20210730143809.717079-1-thuth@redhat.com>
User-agent: mu4e 1.6.1; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 0/3] Gitlab-CI improvements
Date: Tue, 03 Aug 2021 23:08:59 +0100
In-reply-to: <20210730143809.717079-1-thuth@redhat.com>
Message-ID: <87czqufaf4.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
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
Cc: Willian Rampazzo <willianr@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Thomas Huth <thuth@redhat.com> writes:

> Here are three patches for some small issues that I noticed in our
> gitlab-CI files recently...

Queued to for-6.1/misc-fixes-for-rc2, thanks.

>
> Thomas Huth (3):
>   gitlab-ci: Merge "build-disabled" with "build-without-default-features"
>   gitlab-ci: Remove superfluous "dnf install" statement
>   gitlab-ci: Fix ..._RUNNER_AVAILABLE variables and document them
>
>  .gitlab-ci.d/buildtest.yml      | 99 +++++----------------------------
>  .gitlab-ci.d/custom-runners.yml | 12 ++--
>  docs/devel/ci.rst               | 13 +++++
>  3 files changed, 32 insertions(+), 92 deletions(-)


--=20
Alex Benn=C3=A9e

