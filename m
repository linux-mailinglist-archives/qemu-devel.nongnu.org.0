Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 333004BBA1A
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Feb 2022 14:25:56 +0100 (CET)
Received: from localhost ([::1]:58996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nL3Gl-0006mp-8n
	for lists+qemu-devel@lfdr.de; Fri, 18 Feb 2022 08:25:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nL3Dg-0004yj-R2
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 08:22:45 -0500
Received: from [2607:f8b0:4864:20::b32] (port=46033
 helo=mail-yb1-xb32.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nL3Dc-0008Qb-So
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 08:22:43 -0500
Received: by mail-yb1-xb32.google.com with SMTP id v73so7169832ybe.12
 for <qemu-devel@nongnu.org>; Fri, 18 Feb 2022 05:22:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bsKvkYBAQekVg0VdupEh2DRJctyAUJtkQGEpf4z59l0=;
 b=ZnzS6VexlSiCnZ+nd10MgF6B9h/xO9wPphnufxj1+J0zAXMfh1kiT3ghWLYxZt67po
 zH4VXs3btvsASbrEO5Rd8SkrKGTCvkdUebAO4JPFAOr7YNL1Pyf+v4U3hg5K8dt89j5W
 j54Jxx2paFm1Tk3MYVWrg+SHKmpy2eUfvHw3lx/TcQjPvEei2ZSGmOcU6nxC6GYjXaUk
 3LSrbLX9UJaqpeak7U67tWhg2nvOH7zt1SiWEgjpJ7zKAqlVac63YNcT1GUn0N1Frvy9
 aBqG96eUGWnqfuL7yYKsetWQQ9f4OQBla/9T29DgWUlpN69brTXCjdA3TYSftZYmzwZE
 F1yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bsKvkYBAQekVg0VdupEh2DRJctyAUJtkQGEpf4z59l0=;
 b=Oxa7Y8ILv7mYxGHzmuQKF6mG30BhPskiAc+ILN6FG9oblO2MqM8ozjdxdrVRKIYt0N
 5txk0kPmWdHgr9GgPV2dsY5D9/8+/MuJwER/BWV0PdcRWaqT6+XgrfS6VB/XOlltRwD/
 7uXvlR+JpaX3nSNegA+9XC7kTlhl15Va9vX+KUskwhH16HBs7huNA3twRzVc6FskAjok
 NlJDptFCvBANOVI4+3sBSQcZ28ZA1qMr8YOojvaAojSMixwU/RKP9nscAE+fkQkRbj9A
 nGaa3IZ7dR4mYkw86BqTtDzAsSL2SZnjSzGFjnaiXtkDvhe9KbMwje/bN9pNlPi4iB6a
 ukwQ==
X-Gm-Message-State: AOAM531QqoE5xXMy5B9mZ/EbtwWLNtq3QHx6ZmZa9FrLXzB4s26uixm7
 y6xuCHBLGMQe+D94xmMqtbzmXFPAMgN+nnWAEnw53A==
X-Google-Smtp-Source: ABdhPJx2OfCdBs1avPwt7tzR3+dvfOPclR9fwnBA+gzer2Xp/cUx1Anspk2tSb1m/l1jhFxntGn9QBNjtOdsg0Bxlew=
X-Received: by 2002:a5b:745:0:b0:622:1c46:3c19 with SMTP id
 s5-20020a5b0745000000b006221c463c19mr7264305ybq.479.1645190546157; Fri, 18
 Feb 2022 05:22:26 -0800 (PST)
MIME-Version: 1.0
References: <164422345976.2186660.1104517592452494510.stgit@pasha-ThinkPad-X280>
 <a59bb981-fe68-b75d-0e4c-f888e3e45fa0@ispras.ru>
In-Reply-To: <a59bb981-fe68-b75d-0e4c-f888e3e45fa0@ispras.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 18 Feb 2022 13:22:15 +0000
Message-ID: <CAFEAcA9KsErR_odg4ioq6=7ndwQXcgdVNEYFUcddQdYxM+vW3g@mail.gmail.com>
Subject: Re: [PATCH] hw/timer: fix a9gtimer vmstate
To: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b32
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb32.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 14 Feb 2022 at 07:34, Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru> wrote:
>
> ping
>
> On 07.02.2022 11:44, Pavel Dovgalyuk wrote:
> > A9 gtimer includes global control field and number of per-cpu fields.
> > But only per-cpu ones are migrated. This patch adds a subsection for
> > global control field migration.
> >
> > Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>

Thanks for the ping, this one fell through the net.


Applied to target-arm.next, thanks.

-- PMM

