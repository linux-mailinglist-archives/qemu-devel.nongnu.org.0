Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C11060289D
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 11:45:43 +0200 (CEST)
Received: from localhost ([::1]:42310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okjAI-0006Mz-0E
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 05:45:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1okiqj-0000qG-IP
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 05:25:25 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:46041)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1okiqg-0002kC-I5
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 05:25:25 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 o9-20020a17090a0a0900b0020ad4e758b3so13443786pjo.4
 for <qemu-devel@nongnu.org>; Tue, 18 Oct 2022 02:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2NFoVjBkBNFATwFusrJIHo7uJF0tkrYaqBguja2px5U=;
 b=q6VB2OzKu3Ra75eNQAH7Pn/fatX/pHP4qifkibHgHT7W4zN5PTqKcqji7jV9159n1J
 08UATV9XgG5GFoVUVGOM86jzBs/KO7fngjRDQSPrcF+i25hTCrGDzoOdpmWYgAFVb9EG
 eUd9VE7n03FoqY7VAqIb+oPOu5QKqSjN1NGsTmpuSXVObZhTu95bM5AZX0N0rvXPP/WF
 JtHr5vN3W2YRx7mdcrmIF2JyFnAl7O38nO76/haIJ9kvy3t6Cj/v9XhdR3Ch3uCKkY94
 Em0QyYveS6uJf6kZi9Be+5a7Ni+xi4o5yeHg0eomStt/vlTuIpNJBuvb6Y/rY7bvJBHG
 KhrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2NFoVjBkBNFATwFusrJIHo7uJF0tkrYaqBguja2px5U=;
 b=ASkyslIjifixQdtBtIju8z47dOeZGuRriDpfxuhKviqIUYyLyzxglqdGSwaVvA/67x
 twRrUSccL24f6lGfA0cPcqR+094Lt7DFzek9NuN3eSXIv1pwikYFbCjrVhqUCWk+HOqx
 h/g3BoIne8ef5K/Wgmj7SR//JgB4GwOcdslhKTGR/9fdzC2gCZFnSZGQMaVl47VcHc9g
 JKLwFFpHObpXWjWvOQh4gzCXXBGo9bXaxwGs89rPWeRgcrLrhWJCUWIeXDufObDoG653
 AEcUjKzLkNwhHu0Nekl3LijR85e1ZjWA4+Rp3Bx/vbxKvOeWTEy6saTyuS7eJICRuWow
 Ri3A==
X-Gm-Message-State: ACrzQf06IjjEkJRLEqO0i/CnQKNjtDtmhwuzuKpzpWov0ZGOVkMKD+ya
 +XIitI6n1sZfgojJG4WsMDAZ45LvBobl5LY8qrLZHg==
X-Google-Smtp-Source: AMsMyM7GYZQZgb9xW/FLauFejRRgbAa4qmvAFkZRmw5h+gzy5UNQq7xaS5LIqD4L4a+GlrcRZeqa3yCjPNxzdYfjQrY=
X-Received: by 2002:a17:90a:fe92:b0:20a:daaf:75ea with SMTP id
 co18-20020a17090afe9200b0020adaaf75eamr37265542pjb.221.1666085120876; Tue, 18
 Oct 2022 02:25:20 -0700 (PDT)
MIME-Version: 1.0
References: <20221016122737.93755-1-shentey@gmail.com>
 <20221016122737.93755-3-shentey@gmail.com>
 <ac4a6fd0-9e60-df0f-533e-a9e102350deb@linaro.org>
In-Reply-To: <ac4a6fd0-9e60-df0f-533e-a9e102350deb@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 18 Oct 2022 10:25:09 +0100
Message-ID: <CAFEAcA_H_kcK6=RNuXs_ByZud8AUdypiqV_LUU7cp+EeRr_Smg@mail.gmail.com>
Subject: Re: [PATCH v3 2/9] hw/{arm,ppc}: Resolve unreachable code
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, 
 Alistair Francis <alistair@alistair23.me>, Jan Kiszka <jan.kiszka@web.de>, 
 Magnus Damm <magnus.damm@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Bin Meng <bin.meng@windriver.com>, 
 Aurelien Jarno <aurelien@aurel32.net>, qemu-ppc@nongnu.org, 
 BALATON Zoltan <balaton@eik.bme.hu>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, 
 Antony Pavlov <antonynpavlov@gmail.com>, Hanna Reitz <hreitz@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Mon, 17 Oct 2022 at 21:57, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> On 16/10/22 14:27, Bernhard Beschow wrote:
> > pflash_cfi01_register() always returns with a non-NULL pointer (otherwi=
se
> > it would crash internally). Therefore, the bodies of the if-statements
> > are unreachable.
>
> This is true, pflash_cfi0X_register() use an hardcoded &error_fatal.
>
> Shouldn't it be better to pass an Error* argument?

The whole function is a legacy convenience-wrapper that's just
doing "create, configure, realize and wire up a device". New
code, and any callers that actually care about errors, should
just be directly creating and configuring the device anyway.
Almost all the callers are in old legacy board model code.

-- PMM

