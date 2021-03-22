Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D4DB343FB0
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 12:28:01 +0100 (CET)
Received: from localhost ([::1]:47886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOIj2-0000cO-By
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 07:28:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lOIfi-0006KJ-Ax
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 07:24:34 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:33366)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lOIff-000590-QX
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 07:24:33 -0400
Received: by mail-ej1-x636.google.com with SMTP id k10so20616568ejg.0
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 04:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=37tU7E3oaao3VapJ49a5zmQpDCUM+jOHIILCqSrKqmI=;
 b=KUDrvnI5X8F2mZ9tcAJGswHLsqt8bUmU0YzOhA2XjwVEIuUckqJZtCeKZ0O9YbpxrM
 0nhQOCNX4jVh2f2K9AxEoPxHEfABg8kiduiE0tjt/PlGivJrOgxxoXt6EqQU0E0mmI1s
 n/xeUwcqiHI1pTgOHRQwyeqH76Gn9+E9PXvs5AUJO2pJwoYNLHi1bCwVpsX81YFXSLwp
 b/yNdhjO7AnOurQkCxgXigKi5gtKV0W+JG+b/xZeFFB7xbgw7Xxndi3kiUeFD18TZ9mQ
 abYEroazr8Cwwc96NYFICZqCopFa7UaQESvmCC6yHLMxWCZOx225oQI6oRuvHYcUMTcX
 TFYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=37tU7E3oaao3VapJ49a5zmQpDCUM+jOHIILCqSrKqmI=;
 b=t7ReizQSsgKxgiffijbx2BjI6rkIcIgdlSBl9FJp085dQtP7t6EISsVtLQ2vShNfR2
 pn2KKGN54D6RBqElM+3R9H8473KhCwmMAE0JTY3jYTMYD3pHUcPSthC9cAgvmwdYdv5C
 HQmfWhSeWa4PEkml3tOV8mcYqnCgL+zSjKaK4/x9wTwCXY88Xae5e7/fDEJ3y2p+alR9
 17lICv3EUbvxLvyPlGYr8fj+gvqOKvb83j3Va0JdCf5TvHDNZpbt37I+5kYAbtjXFW41
 2csNSPA31FkI654VcZunNRflT8jeW09ITZ3P369X9Wx6h3pWAtjkdr7eB/0zaRFlUJCQ
 DPBQ==
X-Gm-Message-State: AOAM531jinL8GHw19fHkcGkp0qE+wNwjk15shp7rh69Kkr9Xt5rWyihh
 IA+hddrca97dIgNAYVjyrSvstBsnurUqS/BQCaNX7g==
X-Google-Smtp-Source: ABdhPJyKw0lnr5QldBs9D6DQpbw2fAPHMzjwus7SvPxrr55CtZc08Y5LqRDjRvRlcIrlBjFHq4aLaUreoqSXRrxsOLM=
X-Received: by 2002:a17:906:bd2:: with SMTP id
 y18mr18907973ejg.482.1616412270348; 
 Mon, 22 Mar 2021 04:24:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210321171833.20736-1-thuth@redhat.com>
In-Reply-To: <20210321171833.20736-1-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 22 Mar 2021 11:24:02 +0000
Message-ID: <CAFEAcA8-U3HD23Uju8y2GWbbXuZf50mxSj5gGHxB6Od2vzEf0Q@mail.gmail.com>
Subject: Re: [PULL 0/5] Unit test fixes + misc OS patches
To: Thomas Huth <thuth@redhat.com>
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 21 Mar 2021 at 17:18, Thomas Huth <thuth@redhat.com> wrote:
>
>  Hi Peter!
>
> The following changes since commit 2e1293cbaac75e84f541f9acfa8e26749f4c3562:
>
>   Merge remote-tracking branch 'remotes/armbru/tags/pull-qapi-2021-03-16-v4' into staging (2021-03-19 16:40:00 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/thuth/qemu.git tags/pull-request-2021-03-21
>
> for you to fetch changes up to 262fd27392128c180afc8f968d90d530574862f7:
>
>   FreeBSD: Upgrade to 12.2 release (2021-03-20 06:33:17 +0100)
>
> ----------------------------------------------------------------
> * Small fixes for the unit tests
> * Compilation fixes for Illumos et al.
> * Update the FreeBSD VM to 12.2
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

