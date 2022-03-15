Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A47BC4DA1B3
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 18:55:43 +0100 (CET)
Received: from localhost ([::1]:42108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUBOY-0003Kh-Ny
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 13:55:42 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nUBIh-0007MY-LA
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 13:49:45 -0400
Received: from [2607:f8b0:4864:20::1129] (port=36982
 helo=mail-yw1-x1129.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nUBIf-0005m9-Mw
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 13:49:38 -0400
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-2e5757b57caso55602257b3.4
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 10:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=f3T9W0okLz71ZSuhEX5nunMPR4/lZWItcyv+dSE4JU4=;
 b=EAX5NYkrbfxZijVVY7wW/17O7Ao0mB8lhBq0nTIcsAolxHtZZ5MnV5rfF27hWeGdxZ
 a7PT/Hop2LptmSx+APzyHl/1lFJdgvlZhRd5pMHi/AE3D/WqmuJlPabd0tCungXGEONY
 biQiBwlUMJkKjfVaT66G38biDtMj81Ci13W2mEfcBaJ+ZVxyks35hU9cVgkJMSAtoEbE
 ICLe+ne3qZvIifUOVN5/GtfYyq7SORhBh3NexKSjdHpMqif9wOwr2pa0dhpBKUdVSQ3t
 HhRjWKA8V4ctyAeUmLnrAhQq8me3JbF87StZMR4DisB9B473QkTdzZnw6RKzkkGkbV04
 /Hlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=f3T9W0okLz71ZSuhEX5nunMPR4/lZWItcyv+dSE4JU4=;
 b=WK5sM40BkDiNsGzpBgMvAfsmfSpWA9BRCQz2+RPvpDqUz7oBA8+WlgFqYtKVPekGE/
 rny5uiQZbplAMbj5UpbOsq82gU2EOvPSi5Ub0X8ybaGL/D+TRD0soPvS6dpQNt+NMKY6
 7K3dlRcDZYLTQEtP3yU5Cn8wmixubDBzry8XdVBDN1be3iYELxpn6NTeHVZ8AiEY7h7f
 XrwlxCCWlXolLjGI92ObVavFe/ph4Z/zWuffJjqpAu5NBG+LvzDhxDEQqAFHER8ajBwC
 ey/Yaa6i9efxXEUmoY1IRg8jmsyy7CdcyForypvXVZupgMLJvFrnU4Rt0zNKNRFGiwTb
 leHg==
X-Gm-Message-State: AOAM531ByCjCnuagQX9QQN1fYkyoE+PtaYc5rvs0sg7t4K4HB3RBixaD
 Z7+gLxDtwo/qBF3Tf+szkAPEcZXxhrWMF3SKuGqKiA==
X-Google-Smtp-Source: ABdhPJyCSmbQpvNZmLlZ4ZXYfYZp8Xv7pF4exglJdET8s0d/+CPgiw9+eEmG5K3eX/W/hHQeGvCmK+yR0TVzT36a9K8=
X-Received: by 2002:a81:12c3:0:b0:2dc:5f5a:38ec with SMTP id
 186-20020a8112c3000000b002dc5f5a38ecmr25778384yws.347.1647366576318; Tue, 15
 Mar 2022 10:49:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220315110739.2095676-1-marcandre.lureau@redhat.com>
In-Reply-To: <20220315110739.2095676-1-marcandre.lureau@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Mar 2022 17:49:24 +0000
Message-ID: <CAFEAcA_h7GGaYb6ER2HfhBQuFHtgFD+vRCJBD4DaP2D7PWK+tg@mail.gmail.com>
Subject: Re: [PULL v2 00/12] dbus console fixes
To: marcandre.lureau@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1129
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1129.google.com
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
Cc: qemu-devel@nongnu.org, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 15 Mar 2022 at 11:07, <marcandre.lureau@redhat.com> wrote:
>
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> The following changes since commit 1416688c53be6535be755b44c15fb2eb9defd2=
0f:
>
>   Merge remote-tracking branch 'remotes/mcayland/tags/q800-updates-for-7.=
0-20220309' into staging (2022-03-10 13:16:37 +0000)
>
> are available in the Git repository at:
>
>   git@gitlab.com:marcandre.lureau/qemu.git tags/dbus-pull-request
>
> for you to fetch changes up to e1c676a254b012779db87166a1f26db6886a8bce:
>
>   ui/console: call gfx_switch() even if the current scanout is GL (2022-0=
3-15 12:55:02 +0400)
>
> ----------------------------------------------------------------
> GL & D-Bus display related fixes
>
> Hi,
>
> Here are pending fixes related to D-Bus and GL, most of them reported tha=
nks to
> Akihiko Odaki.
>
> v2:
>  - fix avocado vnc test regression (crash without associated console)
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.0
for any user-visible changes.

-- PMM

