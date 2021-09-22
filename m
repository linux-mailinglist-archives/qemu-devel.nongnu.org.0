Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E226F414A2E
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 15:09:41 +0200 (CEST)
Received: from localhost ([::1]:40120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT20L-00048g-0Y
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 09:09:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mT1x6-0001ks-Ro
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 09:06:22 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:35508)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mT1x4-000850-7D
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 09:06:20 -0400
Received: by mail-wr1-x436.google.com with SMTP id i23so6698982wrb.2
 for <qemu-devel@nongnu.org>; Wed, 22 Sep 2021 06:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IAzB8PKn3EXAHES0hRswrlKAHMva6edPoAJ61/ZrWKU=;
 b=Gg9GO6tMgQAVgrpKNtLJVJUICn/S/L9mCSazkmBzKCLiyEQOGUxtVW2pEia7p+abSz
 Q+Y1GhBmPmX7eeLWWl899g5y37Y2UsGLVhgD+nB0UFJR9Kpb3e1TBBlxuFp3pSsmH4mm
 Yk8+q0zoQXNXkpcnfU9Ed6t+cOJs8emiwxY6kZ8H5IZL7D5jI9vGQwO7lYOxI8cafWxW
 LYAntgIYcWmNrwaD7ubV+z0SvImGK6vG0I8ZuGRlQzIB7e5l0Cl2HJQace3+FJXtfcwr
 ke9YgTwj4zg/OZHH3W+ZnsGHRiE6hpIpLOM+GZEBbogec6syQZ/alztcqRe0w4Y6R0hi
 2M1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IAzB8PKn3EXAHES0hRswrlKAHMva6edPoAJ61/ZrWKU=;
 b=tavi/ghTaWs2EL/uyDWC3VnY3VWur87AkD5kF4qLUPKt6w5xrPl3pGg5SW7b7arLOl
 1Swl9Y1ZYo6qpOwLkVEmRiAbp8MyafWSyecLiI8S+BZSwg7oaAFfXIymG2U+U3hmK7Ep
 w7ZPonS4iUpR2JiOedsT0p938hLUTIBNAEC1wxwCNF34qCNb85XBmzpY95xyUyUFEjXi
 YCB0Jun/TyiWaskwXPXlcrkzANfrFNZBrYR10axMad8AZYjrvpSUptR/NNUxZDZDv2Sd
 xJRGDNia8gHB6QYsaGxw7cRr9CMvBwZKMtCnYSz7C0uRt/CjWu6iWgjnm0PE7L7PNEoF
 2W+g==
X-Gm-Message-State: AOAM532cNsoi0+0wOxdAr/3Liw/HRvEfEKrTQ+0J0m3CBGkJvpfeizLq
 MIFMPfK7lqe6Tdp0cNqzjDmK6s8/ubSAQrKNsJyyi1tDMBk=
X-Google-Smtp-Source: ABdhPJzVh8XJnlRlER4P8DMfeidBO61DlC5Kzu8qdmiKvK+3OXqo8hpVBkd1jvv5gSEnMaAht8yOMTYFj4PwQhRkZGo=
X-Received: by 2002:a5d:6b07:: with SMTP id v7mr14875514wrw.376.1632315976476; 
 Wed, 22 Sep 2021 06:06:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210922121054.1458051-1-kchamart@redhat.com>
In-Reply-To: <20210922121054.1458051-1-kchamart@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 22 Sep 2021 14:05:24 +0100
Message-ID: <CAFEAcA-vF0P7+aPLfv8GYb_9PdKKwqSv5smg1h+pZw-Qzip9XQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] rSTify SubmitAPatch, TrivialPatches, and SpellCheck
 wiki pages
To: Kashyap Chamarthy <kchamart@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, John Snow <jsnow@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>, QEMU Developers <qemu-devel@nongnu.org>,
 Laurent Vivier <laurent@vivier.eu>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 22 Sept 2021 at 13:11, Kashyap Chamarthy <kchamart@redhat.com> wrote:
>
> As of writing this, qemu.org is down, so I've used a one-month old
> copy[1] of the wiki from 27Aug2021 to do the rST conversion.

The wiki is now back up, and it says the most recent change to
any of these 3 pages was May 2021, so there shouldn't be any
recent changes missed by using that old copy.

thanks
-- PMM

