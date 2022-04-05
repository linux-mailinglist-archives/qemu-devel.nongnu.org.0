Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC0FA4F3D3B
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Apr 2022 20:49:03 +0200 (CEST)
Received: from localhost ([::1]:47364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nboEg-0006mo-EP
	for lists+qemu-devel@lfdr.de; Tue, 05 Apr 2022 14:49:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nboCk-0005vD-Ht
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 14:47:02 -0400
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130]:33836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nboCi-0002iP-TM
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 14:47:02 -0400
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-2db2add4516so2034787b3.1
 for <qemu-devel@nongnu.org>; Tue, 05 Apr 2022 11:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/buYJ+2IpTAYt9YHgByQ0YxywhG63n3G7r6wkTpS6gE=;
 b=EnWB/4qGQdciE4LzExQcd9LUdDMe7PgQ5/kYIJVNcnOp9kAK6DOjgUmApkX76w58xM
 ViHwPNe9phw0PE25xnoLhNcBAfgS8UHobmZIuyGubHNxUEFhcZNZMm71bCkhO/e4YgUz
 A7JUkKJ7+wXTMuNU5oQa4eQBDCccAlcSnJfDgIFqmbZ1TDFUpD9gW8Von6ydm7kN2Hoc
 msFcjZmG++4ybz1NkKggm2l05gn8i/UTh43dFc8V2j2U9BGFhutJhZTIfz25+UmvjeHs
 wDgpXmFfS0BxCm0iibeuN5IGGlgibUGWpW4mN1gKQCH+xJnbG6SQTfDa0lKbIs3HwIzj
 IJlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/buYJ+2IpTAYt9YHgByQ0YxywhG63n3G7r6wkTpS6gE=;
 b=xWZ4ITpPsn7aZpa1RCNJ0RH4+Fr3Ci3Vn+Y2wq73HJmDxN97VzKhPAQ65LBbRp7njd
 zfJAOyYzZq+mx1azf7HcFg05pcckX0WVWrHYrRuzAs32OUYFwUMvBtVq35KCOmudloLg
 4nSxV8loUwYm6I3f3jF2uJtBUFf8O+FQEw29Zou1YaSZD33fG3z6GDnKJ/+PzBl+zYXb
 tJ2tGEc0tu0w7lJmpkKKCK03ASAbWLgVQWa4moPPz4QfXbv/wgBhy7FKtOY3D1iryLpR
 6UdD8JEBUtWKeeUzlyAIX/hKId/gpxDLOgfDaJlYpURN61TGD4lWhVHjV7qNp4TyWVx2
 p5Sw==
X-Gm-Message-State: AOAM530n8qFR+ESMNHMRsG43lVm9SREUQmHAzKIxJFmSlA/KrNxHvInk
 s4pqKD1hnu5SAnSxcwirOD+m7W1vDJ7YM9+0fZfOZw==
X-Google-Smtp-Source: ABdhPJwrW9m0tOuv2ccvL52gb0SlVo7358VfHv+AGlL1kx3Kp5khVvrO3cZX5d3Nql9Mri8Lp+m/jFItCLCbV4KXMgY=
X-Received: by 2002:a81:4655:0:b0:2eb:2e0e:9d47 with SMTP id
 t82-20020a814655000000b002eb2e0e9d47mr3954506ywa.455.1649184418877; Tue, 05
 Apr 2022 11:46:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220405092001.104507-1-pbonzini@redhat.com>
In-Reply-To: <20220405092001.104507-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 5 Apr 2022 19:46:47 +0100
Message-ID: <CAFEAcA_X_JGTx04ydZ+w2ZYvx4uGPRRWVaq+d7-6wSMw7tuiKQ@mail.gmail.com>
Subject: Re: [PULL 0/3] Misc changes for 2022-04-05
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1130.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 5 Apr 2022 at 10:25, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> The following changes since commit 20661b75ea6093f5e59079d00a778a972d6732c5:
>
>   Merge tag 'pull-ppc-20220404' of https://github.com/legoater/qemu into staging (2022-04-04 15:48:55 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/bonzini/qemu.git tags/for-upstream
>
> for you to fetch changes up to 776a6a32b4982a68d3b7a77cbfaae6c2b363a0b8:
>
>   docs/system/i386: Add measurement calculation details to amd-memory-encryption (2022-04-05 10:42:06 +0200)
>
> ----------------------------------------------------------------
> * fix vss-win32 compilation with clang++
>
> * update Coverity model
>
> * add measurement calculation to amd-memory-encryption docs
>
> ----------------------------------------------------------------
> Dov Murik (1):
>       docs/system/i386: Add measurement calculation details to amd-memory-encryption
>
> Helge Konetzka (1):
>       qga/vss-win32: fix compilation with clang++
>
> Paolo Bonzini (1):
>       coverity: update model for latest tools


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.0
for any user-visible changes.

-- PMM

