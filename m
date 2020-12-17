Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 946392DD1BB
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 13:56:17 +0100 (CET)
Received: from localhost ([::1]:53954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpspL-0005QZ-LW
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 07:56:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kpskh-0001P9-2O
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 07:51:27 -0500
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:35988)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kpskf-0006If-47
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 07:51:26 -0500
Received: by mail-ed1-x52f.google.com with SMTP id b2so28539319edm.3
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 04:51:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vtoqln3Jr+eDZ2yCBUut6Qs7LnAYPcKcQOaOK0B+yi4=;
 b=I9f6Ep56RWEVQ8cPafa5P2sUzpBsKKWAfc5M87WOn0mD+m7I855WKRpqCpFYGyihri
 kY5FtJaNjujV8RJr3uVG3SKWlmQ5DsXKavUgy2eKhbFEs9vgtFCgrUwvJwvxhuMHYsZp
 trK8Zby0cvQGu+jLVAf1ORiJRqRXINJidBmCr4sWW2L7adwAuY5oRPtU3A+vMVkEe0eU
 SzGiRXRMcPAYP8l9NhVKrfqz25PMCyuHVSSehDYvMOuHgGsnZo9sJh4JAeEx3VQA8oFL
 euEI+N+Bzd79cP7QDhn0r65hsmXWj0iJXJBvlv56DYr68xC1kXC0KOl0QaQy7QKpicwt
 uSBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vtoqln3Jr+eDZ2yCBUut6Qs7LnAYPcKcQOaOK0B+yi4=;
 b=EP0T0XDAqxGgQAvbO86Tl4+xGetlcIxSwyxmVhCjPDCJu/bJDrAyfBYNCqCreXedjf
 8XACgC50Spx4VmHe7D2HZ/gqmOEKhpjLm5YLDyop7Tud/uB34IoEbLb2f6y1sNRRkHzZ
 pgcKCzJzWphn2uaxlYEpC1FbGbLQpgivwUxSXyLI/mXtMyQGDJYuuToluebdHF0jPpLm
 x9Rf/JhyrWZT+/vQt/oM1rCViNyld0m07PZ+f4nIfBdKwpvz5ItnmeVIYkXfFw6lFR/S
 vY9JZfNf4c5N+9+TgziXmM8VsZcrpIS99Kjr466tk6B9+4Fdd4wttgUXr4CHGZiilxn0
 0KrA==
X-Gm-Message-State: AOAM530XSPb6WQT538G9E6fmh9qjksEA8kK92CQ/X/akHTA9kWyPzd0f
 FlMOSsMZ4WL5dTYyJ5CdBuBs2dej0tZ47yB+MuL8cQ==
X-Google-Smtp-Source: ABdhPJw+3Lh+q/5sezpW1aW8fyz2iGe9NTGoYB0leC6sMGzjbW+1Ds6XwKUOO/dYrjNAGkUZoT/afXiV5qsSF1EVPd8=
X-Received: by 2002:a05:6402:366:: with SMTP id
 s6mr11158695edw.44.1608209482465; 
 Thu, 17 Dec 2020 04:51:22 -0800 (PST)
MIME-Version: 1.0
References: <20201216172949.57380-1-thuth@redhat.com>
In-Reply-To: <20201216172949.57380-1-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 17 Dec 2020 12:51:11 +0000
Message-ID: <CAFEAcA97zNc3yEfSeBTOuQLFghcJHbh_toJ368HMZzHke+y0SQ@mail.gmail.com>
Subject: Re: [PULL 00/12] Compile QEMU with -Wimplicit-fallthrough
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
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
Cc: Chen Qun <kuhn.chenqun@huawei.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 16 Dec 2020 at 17:29, Thomas Huth <thuth@redhat.com> wrote:
>
>  Hi!
>
> The following changes since commit af3f37319cb1e1ca0c42842ecdbd1bcfc64a4b6f:
>
>   Merge remote-tracking branch 'remotes/bonzini-gitlab/tags/for-upstream' into staging (2020-12-15 21:24:31 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/huth/qemu.git tags/pull-request-2020-12-16
>
> for you to fetch changes up to cbbedfeeb77e25b065f8a2b0c33e81403edaf728:
>
>   configure: Compile with -Wimplicit-fallthrough=2 (2020-12-16 12:52:20 +0100)
>
> ----------------------------------------------------------------
> * Compile QEMU with -Wimplicit-fallthrough=2 to avoid bugs in
>   switch-case statements
> ----------------------------------------------------------------

Hi; this generates a new warning on the NetBSD build:

../src/bsd-user/main.c: In function 'cpu_loop':
../src/bsd-user/main.c:513:16: warning: this statement may fall
through [-Wimplicit-fallthrough=]
             if (bsd_type != target_freebsd)
                ^
../src/bsd-user/main.c:515:9: note: here
         case 0x100:
         ^~~~

thanks
-- PMM

