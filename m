Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 149B4380A61
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 15:27:27 +0200 (CEST)
Received: from localhost ([::1]:36764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhXqf-0002Y2-Kq
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 09:27:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lhXpX-0001Uv-KZ
 for qemu-devel@nongnu.org; Fri, 14 May 2021 09:26:15 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:36766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lhXpV-0005hH-Q0
 for qemu-devel@nongnu.org; Fri, 14 May 2021 09:26:15 -0400
Received: by mail-ej1-x62b.google.com with SMTP id c20so9267329ejm.3
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 06:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zAgGsNDV9u5dH0YnW5WJQ6maVTKrPIVwDX6kW7R0FlA=;
 b=OFNWKjoIQ/Z6GKQSj16x8NVeTLljDURtWLBFno1kjWC6BhMaTU4UOf0Gf9ZlXcuBLA
 8BEWCO1NsuM9bHrKFzELvzq3yZnGJ/blfPRWp3T1mJFbVL/9/V7qL7hlNWJzN7mOzuX1
 AZOOrtEbuB0R/TUDyKzVM18J33OUlbdl8cOif1aWCSVdhUgBctfwmAXqzvWdBazjwKiu
 32y9rzGj5qUheT5aLbPatO6qXL0HctLn5aV/GRWPKbF5dIM889C2vkAdT8qf8AIvcOeb
 XC5isALpUpnzZYVL4joMPaRIN7gf/bpSSo2K1SL/qNMNSGNNeMZAYO3m7pPhWYJj1/ZU
 HcWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zAgGsNDV9u5dH0YnW5WJQ6maVTKrPIVwDX6kW7R0FlA=;
 b=byCsZxCisXXJKPaB0oS24b5ATvbYNKaTgLjP7rpqd8aiCFPA2TdzaQRCkaHp/usXdP
 6PmM65yNB4szGE9I0R+DMDj1DJMEHuIODeuT/Z1nbxGUFNb1LzAOqxH5QTqw60GWM4XB
 wQlXXf88ujxThIOXUsL/4hamFHo6nQGXjf0948934Mw7uIliujanNvN8Tibb7Kaa3R+x
 D6tUZkQHMyjISo/iIW5jCV/jL8HkM1qGtPpkBknNukp2/MbE+WoUakt6H+tsyJ8eyoq4
 6yOS1CK1PiufR4vpx39PQaxcdaS2V0rMcXHae8j6ZCCPN33WR5H4OBpM8deJAc73WWrl
 s36A==
X-Gm-Message-State: AOAM531+ARfP2q6FEi3DNm2pPvYIMMdlzchjd4fPBp3Ux+LIo67sqhCh
 d8Q7UShRlIaUXBa/MjqS8c8AWr41H+oQdIWFFrbXdg==
X-Google-Smtp-Source: ABdhPJy8OMv7Xen4z9hhnfh8Ky26hpIgl69bmwQV4XGTqWzLhX1WF3gBZlPr8pwLtR68zqepN0SLDgms9VuqsDpCZnc=
X-Received: by 2002:a17:906:9bd6:: with SMTP id
 de22mr842583ejc.382.1620998772154; 
 Fri, 14 May 2021 06:26:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210513173737.279402-1-dgilbert@redhat.com>
In-Reply-To: <20210513173737.279402-1-dgilbert@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 14 May 2021 14:25:59 +0100
Message-ID: <CAFEAcA_o-DKNnHropboB15sUpUZPEQfpcZ4rU_0LCJU=MT7qjw@mail.gmail.com>
Subject: Re: [PULL 00/17] migration queue
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62b.google.com
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
Cc: David Hildenbrand <david@redhat.com>, Kunkun Jiang <jiangkunkun@huawei.com>,
 huangy81@chinatelecom.cn, Markus Armbruster <armbru@redhat.com>,
 Peter Xu <peterx@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Keqian Zhu <zhukeqian1@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 13 May 2021 at 18:37, Dr. David Alan Gilbert (git)
<dgilbert@redhat.com> wrote:
>
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>
> The following changes since commit dab59ce031228066eb95a9c518846fcacfb0dbbf:
>
>   Merge remote-tracking branch 'remotes/philmd/tags/pflash-20210511' into staging (2021-05-13 14:45:38 +0100)
>
> are available in the Git repository at:
>
>   git://github.com/dagrh/qemu.git tags/pull-migration-20210513a
>
> for you to fetch changes up to 1c3baa1ac4dee2b52837fda89d1d9deeb5da512e:
>
>   tests/migration: introduce multifd into guestperf (2021-05-13 18:21:14 +0100)
>
> ----------------------------------------------------------------
> Migration pull 2021-05-13
>
> Fix of the 2021-05-11 version, with a fix to build on the armhf
> cross.
>
> The largest change in this set is David's changes for ram block size
> changing; then there's a pile of other cleanups and fixes.
>
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

