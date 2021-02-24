Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD26B323E55
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 14:35:49 +0100 (CET)
Received: from localhost ([::1]:39360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEuKS-0005E1-Qh
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 08:35:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lEu1P-0004oI-SL
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 08:16:09 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:44050)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lEu1J-0006F8-Ns
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 08:16:07 -0500
Received: by mail-ej1-x636.google.com with SMTP id w1so2964459ejf.11
 for <qemu-devel@nongnu.org>; Wed, 24 Feb 2021 05:16:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=egMIU7EewR4sTtb8CDcwVB4M8SRXnVOWsu14gmWNO0g=;
 b=Ed4DnG9rcsNISpLi0d8skxHnerjWv7Sa7+0sUoCbFcTUr28ZjDQIFWp10fZO47vfUT
 4ApqI09CJM3cieIvCMqQGFfAACWbWWbmTs364YELz2bIlhlzLovwgOMnd+RKmAGrzwGX
 N6F4HdKAOMyqodzShoqiSENo/WPk2tB+7W7bDhC60TBr/AgvRb6HEStjmumkiUSalpnG
 5g0h/93RdZO1pJ9BONQTjXCuHobK1a3MsRdzSDarr0KuAZf34/ZwVC/cyl7TwlthbkzL
 ILNHeUfO4ZcCZIsjNCII2MdFEcFL3L8p73QIZOrxzVUJYViIR6RvmBjedAdyoQTrAjxF
 T0aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=egMIU7EewR4sTtb8CDcwVB4M8SRXnVOWsu14gmWNO0g=;
 b=oR5d9yt4+wbrE7ivvp7rHScHml/ZDRsjrkKrxPdTXWoeN12Nua4f2Q8M7ABKhm9w67
 sTQWHVNhrwmlNN/RwgVfvo+6gqRYpTGH+3ZVebL/+GZ85fKIchtAlIV5k34lyiWkJ+kW
 8oxqxGIyrUTJF8RKSAIHbW2JhhAAz1POklaoRtcUV9rn2xp6x00xn/W5vwa3sYQ/VbCW
 IbD34TUFiK1kSdKaU6ZHyv7ywJGT/Eg5tUfN6bhLtkpZVELgBUOW7FKWvmO5RpA9qZo+
 VK5AEyGUF9Wz6j9MTZe8h3sPIoZfS7xVldH47+wh6Y4YTG9rK/uQ/wm6Er5/F/qle3rk
 3tUQ==
X-Gm-Message-State: AOAM532kcUSSSm3IbV7fBZ797gSkxAgXwaCTXiYrPKfp0FmxbuqZ3jl7
 vNxp5jtqKwMGdU/WvDe6YW0JUb2En42fvsHqjHZdTA==
X-Google-Smtp-Source: ABdhPJzUTHePM45iM/ilnTt/4ehPopwFNVyrLOOGOt/TIAz7nfaYkpkIKg1U9MPZmEfa+5Bovd4sg16/KWr45jGgL8s=
X-Received: by 2002:a17:906:f10c:: with SMTP id
 gv12mr21006019ejb.407.1614172560043; 
 Wed, 24 Feb 2021 05:16:00 -0800 (PST)
MIME-Version: 1.0
References: <20210223105146.6695-1-alex.bennee@linaro.org>
 <a03c1d90-d30b-e805-8466-4d6aa9bfb015@redhat.com>
In-Reply-To: <a03c1d90-d30b-e805-8466-4d6aa9bfb015@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 24 Feb 2021 13:15:49 +0000
Message-ID: <CAFEAcA8kt_vsHFHGL=dQMPBqogJTQOiAV=O-Zc=UBxQ5AR7opA@mail.gmail.com>
Subject: Re: [RFC PATCH] docs/devel: re-organise the developers guide into
 sections
To: Wainer dos Santos Moschetta <wainersm@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 24 Feb 2021 at 12:51, Wainer dos Santos Moschetta
<wainersm@redhat.com> wrote:
> Just a fyi... yesterday I realized that the (current) TOC is not getting
> rendered on my Firefox (or chrome) browser:
>
> https://gitlab.com/qemu-project/qemu/-/tree/master/docs/devel

That's the source code for the docs, isn't it? gitlab
is trying to render it as raw rst, but that won't handle
all the Sphinx-specific markup, including the TOC.

The built-and-rendered docs are elsewhere (the gitlab CI
job runs Sphinx and puts the rendered manuals here):
https://qemu-project.gitlab.io/qemu/

thanks
-- PMM

