Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C11734CD511
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 14:20:57 +0100 (CET)
Received: from localhost ([::1]:52652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ7rY-0003xi-Eb
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 08:20:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nQ7ky-0008Uo-74
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 08:14:04 -0500
Received: from [2607:f8b0:4864:20::112d] (port=43712
 helo=mail-yw1-x112d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nQ7kw-00066r-JR
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 08:14:03 -0500
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-2d6d0cb5da4so90685057b3.10
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 05:14:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sG9v7o4Ld83etBYXOLRJLd5PwnPDkRxipkHJyI/1v90=;
 b=pDck9KcTz6qElMUmr++zngb0chRgc2XegYA6F/ba7FPxc4/fK2k1c8tW+eCr/ZHVqb
 6bl4l5+jxUFNbDggiz1tbzgn3YBY+cihNp09fI++PYHLFY0R2pYqnMKhzyCV06+N6ILP
 h6StgwhSf1PzB9BFQqZuLRXh969DaRmP9NZrkcLeEpsvS2C4+XNqaXSyFWvfzExO9GuT
 Qe6R2HXtnoXI3JLPjWn/PpGSSUOKW5ysDOT64OWLgnJ/nE4EY4L1vtSULJF3NU11mIJz
 Smyr3ez6iQTeFg8Uc/n0hr53Y0sCtNCeAkuS1jDtSR360vOWCbo6wuEUOXKTwYNbRyik
 mHXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sG9v7o4Ld83etBYXOLRJLd5PwnPDkRxipkHJyI/1v90=;
 b=DBvSJK+TstAqVsWnaZaSzZIO5E37l/itDUEsnK4fzLYYQyQubH9SvjHUjG+oXdXn4z
 j9mQQFFfC1Z9seMhpsTw9mNslNIc1crNqO4BYSqDnKAotX3SEpRzs3NP4jR90jbMWjEw
 iXQ844Eouphj5VsaKIhQ1GbEs4ulCD1mgE2gAZataeBUfd4VyiMLMtYF1pBHIAkPDGQP
 GV40hnDeRlhKVfbq5Zsn1RVTH50aPP0Lyi1UsKOOpz3mSgiw1+QKeorYuGML6XW9QxDy
 5tTr5kD+V4WNQ0PQ302fuPspvMLT4XO1AdUzy76r2Z6JDxgoZgj/jWlswDk98k/0HNM4
 1nRg==
X-Gm-Message-State: AOAM530baOAy/VNLlEcoJiNKEGjUWtruo/sp1l+8lW9D0A4EUkp7OIlG
 YYHqEOz7tR6iiD2Cp4mP9OkCoNwTbu6cNReNBQkZhA==
X-Google-Smtp-Source: ABdhPJwNOjKfJnGxIYT6Qr02yuuMfY3BX3BvIoL19NsDNN2RPsonpQp4r601/5T6RXLAqAzlMXteHidQKYHw487HlJY=
X-Received: by 2002:a81:164f:0:b0:2dc:3906:27c0 with SMTP id
 76-20020a81164f000000b002dc390627c0mr7024213yww.64.1646399641229; Fri, 04 Mar
 2022 05:14:01 -0800 (PST)
MIME-Version: 1.0
References: <20220227042241.1543-1-akihiko.odaki@gmail.com>
In-Reply-To: <20220227042241.1543-1-akihiko.odaki@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 4 Mar 2022 13:13:50 +0000
Message-ID: <CAFEAcA_JxLfnpF5v8w8O9PRBGPg5XVL=W0D=PPEHHrrcWmN_zA@mail.gmail.com>
Subject: Re: [PATCH v3] ui/cocoa: Use the standard about panel
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::112d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112d.google.com
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 27 Feb 2022 at 04:22, Akihiko Odaki <akihiko.odaki@gmail.com> wrote:
>
> This provides standard look and feel for the about panel and reduces
> code.
>
> Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
> ---



Applied to target-arm.next, thanks.

-- PMM

