Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF5130F566
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 15:52:35 +0100 (CET)
Received: from localhost ([::1]:32814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7fzm-00031p-AS
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 09:52:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l7fxh-0001a3-27
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 09:50:28 -0500
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:45881)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l7fxe-0004wj-Si
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 09:50:24 -0500
Received: by mail-ed1-x535.google.com with SMTP id t5so4393347eds.12
 for <qemu-devel@nongnu.org>; Thu, 04 Feb 2021 06:50:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=YeQtZ0DWseKqa2xSTR5sxEWc+wNr6Qr983RrLFfa/qU=;
 b=xIFyLmpCwB+kBLUsV8JF8nMHO7/ccLo6ebkKO+3dC+kac1ibYgoFStqbckUeYcDlyv
 mYdI6SV8XAj4sVrW+A9207sXLAhDhc8PQCoSyh0LJp3kZSithRDYT6S0Xacs/zwIPu17
 e9Qj0a2txsI4VxwFDfi3iePgPXmPoIaSQCyX301pzxr5R+hEj1OZZtqDqujol0hKJUKb
 j6n1I1MD9vGZwhHhv1xurjWvY+055vMmoEaE61uoUDUy6ARX4PBGhGbE/g4xQzbUFfle
 BlXEMcU01sRAnyk/VhEckyWOcl1DZw8kCXYDUpVGtZLEeR1hFCEVxqGzSwVmDHWABHeS
 7tJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=YeQtZ0DWseKqa2xSTR5sxEWc+wNr6Qr983RrLFfa/qU=;
 b=XSZwi5FUDin8fpbvP9pfbTbxghGqRB8PaBw3Jxfw6Ig6amW+cIqii6qkI0leBBEzi0
 OX3Rg4JEvQSTHu5BksEu4Wnxc5I6o3zk+chUyzSPSCVBeLjHtFVXGiAOjTBjSxkQZUiA
 HQkUfHEZrjta8KqrC2sdKFRieMR7djxTKvBPzrVB8ZIfe4FDu55BoSvK7fp3UKt/RHXS
 DUJuFR3/ZxTEVx6VyyIqAZ9Ul1CWJe/9RzBG2doNJ4h3RB/hahXtxLbG9wB7/C0vcYym
 xj8WUMzLfvs/rcyUS/U7dND/L207tUlF45opMkIfnEZyvPTb1CEIonfgAvXaO2ls3BbS
 2c7g==
X-Gm-Message-State: AOAM532/y71Y+XTIWu2nUASRcmmjXOMf/KtgxU9FH2M6PW48Csg27BF4
 oomZsXx959kattFceU3IcNxmi5e1APb+RDgCwmw5mQ==
X-Google-Smtp-Source: ABdhPJy4KcxzyD9YqKL7EzdBlJQ8a4rS17nBZWe6Welv0kvVkLpzz85+hTeb7HgovVJiiHSUqzkf9Bexl8UpfEH8gt4=
X-Received: by 2002:a50:e80d:: with SMTP id e13mr8099366edn.251.1612450219531; 
 Thu, 04 Feb 2021 06:50:19 -0800 (PST)
MIME-Version: 1.0
References: <20210204135425.1380280-1-wainersm@redhat.com>
 <516694bd-42fe-7929-811b-545f257c58bf@redhat.com>
 <0e0f9745-fe21-0bc6-2d02-431d67a6b57e@redhat.com>
 <CAFEAcA9nwnii1geGFpwEg8CFfST8B21y0BRL5ci=4ykiwqJywQ@mail.gmail.com>
 <20210204144006.GI6496@merkur.fritz.box> <20210204144700.GN549438@redhat.com>
In-Reply-To: <20210204144700.GN549438@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 4 Feb 2021 14:50:08 +0000
Message-ID: <CAFEAcA_=ANGKcy7QNfEdxUft9qGyCHttHo9hfvjQHC_ZfYeo1g@mail.gmail.com>
Subject: Re: [RFC] Move tools sources to the tools directory (was Re: [PATCH
 v2] MAINTAINERS: Fix the location of tools manuals)
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Greg Kurz <groug@kaod.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Max Reitz <mreitz@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 4 Feb 2021 at 14:47, Daniel P. Berrang=C3=A9 <berrange@redhat.com> =
wrote:
> The distinction of contrib/ vs tools/ is supposed to be more a
> reflection on the quality of the program.
>
> contrib/ should be considered demo-ware, no back compat guaranteed,
> may or may not work, no testing guaranteed, no man pages.

On this definition, why do we have any of it in our source tree?
Interesting but unmaintained side things can live quite happily
elsewhere (other peoples' git forks, blog posts, whatever).
If we care about a bit of code enough to keep it in our source
tree we ought to care about it enough to properly document
and test it and give it a suitable place to live.

thanks
-- PMM

