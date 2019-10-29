Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3559BE9091
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Oct 2019 21:07:23 +0100 (CET)
Received: from localhost ([::1]:33326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iPXlx-0006Jl-TX
	for lists+qemu-devel@lfdr.de; Tue, 29 Oct 2019 16:07:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47312)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iPXkb-0005Ca-BD
 for qemu-devel@nongnu.org; Tue, 29 Oct 2019 16:05:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iPXka-0008Ts-08
 for qemu-devel@nongnu.org; Tue, 29 Oct 2019 16:05:57 -0400
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234]:38330)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iPXkZ-0008T2-Pw
 for qemu-devel@nongnu.org; Tue, 29 Oct 2019 16:05:55 -0400
Received: by mail-oi1-x234.google.com with SMTP id v186so10080274oie.5
 for <qemu-devel@nongnu.org>; Tue, 29 Oct 2019 13:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RDCYIP1r7rRs5ndVLgJGdLUVPAHQsdFnGKrXoluN+Gk=;
 b=xQkHjgX/Xw08sOLQe36/hyYyAoRkewn8tC61SKjzY5JarnEa5U8Vn9POZV23+j1L77
 v0D/qxlRwL/0kr50I5hVyNf6vFnuXCTJSiw1EdwSLK7OV+Zc4HbxJHeHQoIGVUcFCvlx
 WS54XKbPuyNVQhhS6yGyPzZbEvnky9HnrCqX6r1YZJ6wO3lpgIMhfl0Nt9snfefng2Jl
 1Ebc+wSKWZWJaRqZB/D2K6m7bqkBEsFOPPf2xNy53+au8EPS+S4nzVGVdoDX3rthhz2Q
 gkf4xikZC9iUbJZzH8N3Mm4IzkzW6YI7VbvucMd22ohNn3tfWSSJsWIYw97Sf+mC8utm
 BGuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RDCYIP1r7rRs5ndVLgJGdLUVPAHQsdFnGKrXoluN+Gk=;
 b=jp3x8EPuGv+tmTpJ4cXfqGP1mBQUlPm73tQs+GbJPfpmuAqOWMGxG5NYMUNyfm4R5+
 QqpMLhg5H5jFwKcNkJnUnNCdR2W1RiT8A2FpG1uevig0HlyOIoKLX5yOwhIkuA0WiSK0
 ikE4n47ZeqaD5B3S0zHzYrVu3y28f4M1o9t7scjVoS/TYpU5YygjzvtT7R2xtSyp0oJt
 dxZM/9pT5D4xWqVCptdjk/jC7opCnEavL3DaTnuglCfqs3hb80ivrsrFBC7rVj3/vVLQ
 rX9f7eYhtAo972eg8v1V619PUw48JgMuQP05R1CF6R0qp9a0A5+vPYj8KDX8Z4RpP7rH
 5I3g==
X-Gm-Message-State: APjAAAWlQnyGd1LQSsyIcrq9OEfyGvZ8X6suIEqv/kO7vDYc05MMk8Qd
 6LssVBHIA3gllTcRkpKcotJl6t+eFwXuh3hau55fIw==
X-Google-Smtp-Source: APXvYqx3aAGUbYYU+6QUNYXCjgIha6KwPQjeZBgXBSK1YoVfzLKDgbwWZ4NH4LQhPSLiihOElSFzFBPNnrmYta2dADA=
X-Received: by 2002:aca:451:: with SMTP id 78mr5790869oie.170.1572379555052;
 Tue, 29 Oct 2019 13:05:55 -0700 (PDT)
MIME-Version: 1.0
References: <1572316661-20043-1-git-send-email-jasowang@redhat.com>
In-Reply-To: <1572316661-20043-1-git-send-email-jasowang@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 29 Oct 2019 20:05:56 +0000
Message-ID: <CAFEAcA9P8+7fJceB2qZHH8rkQX5Jv0HS3sLBbNBtuUuceK0wtA@mail.gmail.com>
Subject: Re: [PULL V2 0/4] Net patches
To: Jason Wang <jasowang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::234
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

On Tue, 29 Oct 2019 at 02:37, Jason Wang <jasowang@redhat.com> wrote:
>
> The following changes since commit 187f35512106501fe9a11057f4d8705431e0026d:
>
>   Merge remote-tracking branch 'remotes/stsquad/tags/pull-testing-next-251019-3' into staging (2019-10-26 10:13:48 +0100)
>
> are available in the git repository at:
>
>   https://github.com/jasowang/qemu.git tags/net-pull-request
>
> for you to fetch changes up to 1e907a32b77e5d418538453df5945242e43224fa:
>
>   COLO-compare: Fix incorrect `if` logic (2019-10-29 10:28:07 +0800)
>
> ----------------------------------------------------------------
>
> Changes from V1:
>
> - Fix compling issue
>
> ----------------------------------------------------------------

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/4.2
for any user-visible changes.

-- PMM

