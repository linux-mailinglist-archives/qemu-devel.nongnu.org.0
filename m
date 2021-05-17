Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C37673829D4
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 12:31:56 +0200 (CEST)
Received: from localhost ([::1]:42596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liaXT-0006LT-Dt
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 06:31:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1liaVi-0004hY-3W
 for qemu-devel@nongnu.org; Mon, 17 May 2021 06:30:06 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:37668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1liaVf-0008NO-Ch
 for qemu-devel@nongnu.org; Mon, 17 May 2021 06:30:05 -0400
Received: by mail-ej1-x635.google.com with SMTP id et19so1342112ejc.4
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 03:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=wd4NPOS9/I6xFJNdfYm2gIoX0F77VPrbA3tHKIYaDGc=;
 b=T9LlSY+oAnNBQJxMmqKbt4dRvcUmk7cYFlLK+ZSKG8koTl3Kr6aT0gKFrkai154k34
 RXMg8arz9jr8VlC78triv23LmCAakNXlKDn1ASw7AS+o8LYPRE+c5QY28X0YRPQemLON
 pN6NdZiruCEEzG2mO1BDhTzIWAeUa1bjxzjvfjwEtrfwBEiDLvgZgErWV4PxEmQZNNbR
 mkG1KiXwp1tHVYOBK0dLva6g5XwgK5qxmx46ihmUvL10cmsq5J9dE+FNdx8HmKH9TciD
 rTsfd2g6dhqLNMUZiU7WgYaN2nHEwaCRkj3yz51Y9oeDC5KLLhM5rbMWWr5h0omnEZe/
 wMFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=wd4NPOS9/I6xFJNdfYm2gIoX0F77VPrbA3tHKIYaDGc=;
 b=TFshz6FER92lzRaCRq6cYcCQnEaGMvB6yYMn1rOM4mAPZDyoxbuZcCzLyuWeWsKggO
 QN9xTrcicU0ME2Ey7U7OZRoe8SRpR15Q2yucWXFvEqmD0vz8Cecr0tjbyfR10IwD+R14
 dycscCjB5WvQrxGO3tglMpsD9cebvNiWrfR2tlws5HPmsHkMEJ3WMMhXKi00yyWUWqiT
 Pf/fTaOYH7UYS/7hku2/4+hIjdZEt2PT9bxo6wAa25C2M9Tfqwjy2CIt/JIyzK+WFxZd
 wAPJBMO8uMhqa/XkZ6MgXI5Jvqlfaqd56p945C61aay+bve2tgr5zUdTiC9pjjpCligz
 sbHA==
X-Gm-Message-State: AOAM5320Q866AXtjqjXNDF3oHk45o8D+0QHzT1ev6DIMq8nuQHbeN9e/
 uEKqB8apR7/ByJUA3OT1IqkL3NfZ5f58CHHJ9T6FKg==
X-Google-Smtp-Source: ABdhPJwUP+sGY8D0YwKNxY5GFD2x8O1TlkkyuUa18sMPHLeynwUWt/BPMF4pMDnj9hHUpUkH6Sq8gNz9Fz62yLd0e84=
X-Received: by 2002:a17:906:3883:: with SMTP id
 q3mr11337833ejd.4.1621247399266; 
 Mon, 17 May 2021 03:29:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210514163124.251741-1-kwolf@redhat.com>
 <ddb8621b-001d-48ca-d103-0c2bd7e65bb4@redhat.com>
In-Reply-To: <ddb8621b-001d-48ca-d103-0c2bd7e65bb4@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 17 May 2021 11:29:43 +0100
Message-ID: <CAFEAcA8GwjcfhG-V6UwiG-8Y70++qCGWwc2ALCQcSe_SX=Hmkw@mail.gmail.com>
Subject: Re: [PULL 00/14] Block layer patches
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x635.google.com
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

On Sun, 16 May 2021 at 22:09, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> On 5/14/21 6:31 PM, Kevin Wolf wrote:
> > The following changes since commit 96662996eda78c48aadddd4e76d8615c7eb7=
2d80:
> >
> >   Merge remote-tracking branch 'remotes/dgilbert/tags/pull-migration-20=
210513a' into staging (2021-05-14 12:03:47 +0100)
> >
> > are available in the Git repository at:
> >
> >   git://repo.or.cz/qemu/kevin.git tags/for-upstream
> >
> > for you to fetch changes up to b773c9fb68ceff9a9692409d7afbc5d6865983c6=
:
> >
> >   vhost-user-blk: Check that num-queues is supported by backend (2021-0=
5-14 18:04:27 +0200)
> >
> > ----------------------------------------------------------------
> > Block layer patches
> >
> > - vhost-user-blk: Fix error handling during initialisation
> > - Add test cases for the vhost-user-blk export
> > - Fix leaked Transaction objects
> > - qcow2: Expose dirty bit in 'qemu-img info'
> >
> > ----------------------------------------------------------------
> > Coiby Xu (1):
> >       test: new qTest case to test the vhost-user-blk-server
>
> Not sure if worth blocking the pull request, but this new test
> breaks builds using --disable-tools (therefore breaks bisection).

Since I hadn't got as far as applying it, I'll drop the pullreq so
that can be fixed.

-- PMM

