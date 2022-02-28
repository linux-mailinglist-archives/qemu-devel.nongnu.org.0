Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E014C71F6
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 17:51:16 +0100 (CET)
Received: from localhost ([::1]:54490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOjEx-0002HN-7Q
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 11:51:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nOjDa-0000W8-KD
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 11:49:50 -0500
Received: from [2607:f8b0:4864:20::b32] (port=37611
 helo=mail-yb1-xb32.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nOjDZ-0007VP-2N
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 11:49:50 -0500
Received: by mail-yb1-xb32.google.com with SMTP id y189so21779918ybe.4
 for <qemu-devel@nongnu.org>; Mon, 28 Feb 2022 08:49:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=tykO1rWDH4YNWN/cFdBY60978RDlItaxReFrDdZm3F8=;
 b=TT/pc5lmfZkTs+CLYwA5PYNQl8solEau7pDu054bcxIvYKFSLn64PPyWB8/2gFYNtg
 Ewnj//y26Z/fdeK4yxsgI0Z9bXDfGkb52f4tAJuKwad2uK8wvzRHs2urDsBpzSiZ0RhT
 8qUXLPdtNJjj0j6jUmV+t6N8qdUsrpbwJ1bqBt6InFMJBHNtw2ffT5UIwL+XWuQE0MbZ
 YiSEF5KLqWH0CQyEjuYrVYqsVZzuEnrOF2fCtd2aAPjVoVKHTvH1BCmUhEo/ZDsTNx78
 hgnC3E/85ero5YtnBP+lpL0+c8PLsNd7GB4TGWZfAK+6GNKFk78rbLkHfcKQkR3NpRN+
 dqQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=tykO1rWDH4YNWN/cFdBY60978RDlItaxReFrDdZm3F8=;
 b=HnEX347HPUyMlwNrBPOY334gXrVbaWKSFhuX4q9MZzavnKGVJAeJ+0BhGni54jCr3M
 c3mQJAo2J4aI9SFG17Vnl1/EuWMxuOO7noBvatJMpyvHU2Acr42avq7XilMVtYwJIBSw
 2euBeQEAJ+m5yibT5HZbGXDooH5dH1oahu98+YZ1HwJvFsxkDUDFY6rRo0/TBf1I8Kqm
 sW9i7V7wcd1Hrje00Qddo4UkeI6YmHoSWcRCx4R5zcoF/Fm2ssdgrVj0r64PX+2LdCim
 VsXo7EMcLng3mGN0VzXwQXnPGAAJV97Xe7QfwBek3L54S+OLxmwog13ihrXI9739+k11
 c7PQ==
X-Gm-Message-State: AOAM532MfrMp8Yroa6LSlJ/FdO6sVqk5OUYQEi9w8JqQg8btzHPfImBV
 d25GRAwlhTO7G2aJbBmuGXGmjAGLiUnVErvg1AxUfg==
X-Google-Smtp-Source: ABdhPJxGMWOEBCIJnks4Ok53ynwMwvNQbuXWdndKzi8Ijx8j7f6PHY8OKJVo4oVJoi5+SwzMsbnOptgL2xs67WHhfqI=
X-Received: by 2002:a5b:745:0:b0:622:1c46:3c19 with SMTP id
 s5-20020a5b0745000000b006221c463c19mr19984885ybq.479.1646066988146; Mon, 28
 Feb 2022 08:49:48 -0800 (PST)
MIME-Version: 1.0
References: <20220225172021.3493923-1-alex.bennee@linaro.org>
 <20220225172021.3493923-4-alex.bennee@linaro.org>
 <CAFEAcA_xh58hX-bXPOQzkjUEuWsfXYc9K27HRCQ+tH3+Xt85PA@mail.gmail.com>
 <87ee3nlz1k.fsf@linaro.org>
In-Reply-To: <87ee3nlz1k.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 28 Feb 2022 16:49:37 +0000
Message-ID: <CAFEAcA8=33zjv72BYNxdNehtrVgWuUR=9pZJTbdi_JwmHZCLwQ@mail.gmail.com>
Subject: Re: [PATCH v2 03/18] tests/lcitool: update to latest version
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 Beraldo Leal <bleal@redhat.com>, sw@weilnetz.de, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 f4bug@amsat.org, qemu-arm@nongnu.org, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 28 Feb 2022 at 16:46, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > On Fri, 25 Feb 2022 at 17:36, Alex Benn=C3=A9e <alex.bennee@linaro.org>=
 wrote:
> >>
> >> We will need an update shortly for some new images.
> >>
> >> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> >> Message-Id: <20220211160309.335014-4-alex.bennee@linaro.org>
> >> ---
> >>  tests/docker/dockerfiles/opensuse-leap.docker | 3 +--
> >>  tests/docker/dockerfiles/ubuntu1804.docker    | 3 +--
> >>  tests/docker/dockerfiles/ubuntu2004.docker    | 3 +--
> >>  tests/lcitool/libvirt-ci                      | 2 +-
> >>  4 files changed, 4 insertions(+), 7 deletions(-)
> >>
> >> diff --git a/tests/docker/dockerfiles/opensuse-leap.docker b/tests/doc=
ker/dockerfiles/opensuse-leap.docker
> >> index 1b78d8369a..e1ad9434a3 100644
> >> --- a/tests/docker/dockerfiles/opensuse-leap.docker
> >> +++ b/tests/docker/dockerfiles/opensuse-leap.docker
> >> @@ -127,8 +127,7 @@ RUN zypper update -y && \
> >>      ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/g++ && \
> >>      ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/gcc
> >>
> >> -RUN pip3 install \
> >> -         meson=3D=3D0.56.0
> >> +RUN pip3 install meson=3D=3D0.56.0
> >
> > Why are these formatting changes to the dockerfiles in this commit ?
>
> The latest lcitool I assume didn't see the need for the continuation
> line. I ran:
>
>   make lcitool-refresh
>
> when I updated.

Oh, I see. If you put something in the commit message along
the lines of

"This commit was automatically generated by running 'make lcitool-refresh'"

that will help reviewers, since the default assumption is
generally that changes are hand-written.

thanks
-- PMM

