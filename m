Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9623B472B
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 18:06:20 +0200 (CEST)
Received: from localhost ([::1]:55534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwoLT-0001wW-8a
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 12:06:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lwoKd-00016v-JI
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 12:05:27 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:40873)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lwoKX-0002kI-TY
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 12:05:27 -0400
Received: by mail-ej1-x62b.google.com with SMTP id d16so12415589ejm.7
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 09:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rUf1/S2HAvQYBg1fsYdr2ks+2t/z4xrNnmiUhYLwTWo=;
 b=Atq5G69Y3GReoHY7id8vtzmVPdGxYOi3aRRpxvkQYXh73nrJIp4teZGJCsleR/vfz1
 dTeDikkw8AnvsUUKfSNtqJMnijKk1w4BTBHt382HzeuaBv5Z1vH1PIbbCNeVakfciGJZ
 tAfhzWbe829kyZhkt+TO2tjbwSTA19yAaO3JQfQUqY9gB0ZZ8rI3zlI2cNtm+R8gHQKh
 pyZlbii1U3BOYZ3IaoW/KvXQ7HzZ0kv4WiEi+sxPJ6uDYJEvk9gVPRHpWno9+HSaDAgr
 eZBuDowgHcekYH/2tQC7LBUrFh1WTXMq0gXCHl9r2EQyBZB06FN+8XJvTa7kw8VAbRTW
 xx0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rUf1/S2HAvQYBg1fsYdr2ks+2t/z4xrNnmiUhYLwTWo=;
 b=HRiz3uX9wXhY6darNZlz8MPxf92cXH5E/iaHpCcD7wYGbhcyqDUZ+ilpMckGLsGeNA
 /cGwUXlPBx2xzA7Cm9tpW0fQswIRvdM9XxL1pt9ofznYiS8Wx7HTHyYssy8b3DKIqIEl
 wQsm7vTIBfV55aKniwOyZLjsdAt3cqErv/KImag53smDd/4hsf3yKoYEDgwVhsr3/1Cd
 L4We+75K+DNTHT51HP7/rMMimQbmCH+kws8EnrlZ0/n6oxtarspRWhepsPmqPTnInAAF
 1bn2ZTbiUcP+IybhYMye6E863EehgLiJxYrokzOe1P1WW4Q2zEOIO5jwhs6/SHTBlzHL
 aJeg==
X-Gm-Message-State: AOAM533tyyY3GfiJnb8JR9+4CoNa4r1t6VJvWpWk/s/P1x2y17DMwFtf
 6C4JiLOuxmLxwBhdR4KGPkpeoaQT08UpYNSbAm3GHw==
X-Google-Smtp-Source: ABdhPJymgyBCLmaLKdl9Qk1OVdJ7AGQJV7/FmWwa1DKFmANl7fO2EZRcaeYj1b6B3ZNHbJq7bIIlnCH4BmUQAHmgqOk=
X-Received: by 2002:a17:906:a108:: with SMTP id
 t8mr11510428ejy.407.1624637119986; 
 Fri, 25 Jun 2021 09:05:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210624114316.1354823-1-mreitz@redhat.com>
In-Reply-To: <20210624114316.1354823-1-mreitz@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 25 Jun 2021 17:04:42 +0100
Message-ID: <CAFEAcA_RCXRjLh1AOjujCt9kECSFSEnBNRVmQCi3NSygTGeuYA@mail.gmail.com>
Subject: Re: [PULL 0/1] Block patch
To: Max Reitz <mreitz@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 24 Jun 2021 at 12:43, Max Reitz <mreitz@redhat.com> wrote:
>
> The following changes since commit b22726abdfa54592d6ad88f65b0297c0e8b363e2:
>
>   Merge remote-tracking branch 'remotes/vivier2/tags/linux-user-for-6.1-pull-request' into staging (2021-06-22 16:07:53 +0100)
>
> are available in the Git repository at:
>
>   https://github.com/XanClic/qemu.git tags/pull-block-2021-06-24
>
> for you to fetch changes up to 32a9a245d719a883eef2cbf07d2cf89efa0206d0:
>
>   block/snapshot: Clarify goto fallback behavior (2021-06-24 09:49:04 +0200)
>
> ----------------------------------------------------------------
> Block patch:
> - Fix Coverity complaint in block/snapshot.c


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

