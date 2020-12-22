Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F252C2E0360
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Dec 2020 01:25:54 +0100 (CET)
Received: from localhost ([::1]:54318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krVUv-0001HK-I6
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 19:25:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenhuacai@kernel.org>)
 id 1krVU2-0000pE-7v
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 19:24:58 -0500
Received: from mail.kernel.org ([198.145.29.99]:60900)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenhuacai@kernel.org>)
 id 1krVU0-0007Bg-LC
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 19:24:57 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id D8E93229C6
 for <qemu-devel@nongnu.org>; Tue, 22 Dec 2020 00:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1608596694;
 bh=kRtXdi8cZkcQ5wOA9K0ngUzJzZCTsIZ4K9IuSNRBNDI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=aqDuZNbnJF+DQk2+BAycMJtoSXVM+cF58sGKNqm3pGv+Myp+wrZ4Ghy+p7ziv+dQq
 yTdghlcPrrWtnCteQlqZJoK/o+SpDyDrwrHAgTwJwx42feULyydNZNZfQ3bfCzB6qM
 V1I8MhasiS8kAoZga05DFZr4UKy264GBxE33Cy9F94qGcytWOKrjVhrxR7DCrQQ9+H
 lmVuaXzOMF8wwgLtfrnAK2EcKad+E8uxjghNa85JDyNP/DQ1Mh0AxB7YRICFKUeHLB
 RP0kqOvz7Jtun6faUUqw+b1ZwE/4lluLL9pSY6N5PZGM1ZAlnoxhHXKGf7FPPqoghd
 JlOabE2jcxVtw==
Received: by mail-io1-f46.google.com with SMTP id n4so10458838iow.12
 for <qemu-devel@nongnu.org>; Mon, 21 Dec 2020 16:24:54 -0800 (PST)
X-Gm-Message-State: AOAM533PHfPfggp8hrkY84HZ6DhK7iaIyTNDWqhXtO752X+86TyTOk6c
 +2AKX0hpXX2iStB0Dyo6phUY1i5AUmyvzvPOOJI=
X-Google-Smtp-Source: ABdhPJy+jtrftDfQB4XsqFVNr8yzQ4B/AbL/GTJy4MOM+2Ns01obTSADdsqhupUxySNnCMVLHVhGxdsnNXaFrBf+eq0=
X-Received: by 2002:a5d:8a1a:: with SMTP id w26mr15985054iod.112.1608596694341; 
 Mon, 21 Dec 2020 16:24:54 -0800 (PST)
MIME-Version: 1.0
References: <20201219071235.35040-1-jiaxun.yang@flygoat.com>
 <20201219072326.40157-2-jiaxun.yang@flygoat.com>
 <CAKJDGDZ06E7YyHGQukxTZu9C6hMvXsEwS27CWkvyT8g7jwFgyw@mail.gmail.com>
In-Reply-To: <CAKJDGDZ06E7YyHGQukxTZu9C6hMvXsEwS27CWkvyT8g7jwFgyw@mail.gmail.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 22 Dec 2020 08:24:42 +0800
X-Gmail-Original-Message-ID: <CAAhV-H45_LT5yfDNjM3DtNAFzrnW1aZCnqewpFmioZDf7J26GA@mail.gmail.com>
Message-ID: <CAAhV-H45_LT5yfDNjM3DtNAFzrnW1aZCnqewpFmioZDf7J26GA@mail.gmail.com>
Subject: Re: [PATCH v2 8/8] tests/acceptance: Test boot_linux_console for
 fuloong2e
To: Willian Rampazzo <wrampazz@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=198.145.29.99; envelope-from=chenhuacai@kernel.org;
 helo=mail.kernel.org
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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
Cc: Cleber Rosa Junior <crosa@redhat.com>,
 Wainer Moschetta <wainersm@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Huacai Chen <chenhuacai@kernel.org>

On Tue, Dec 22, 2020 at 5:35 AM Willian Rampazzo <wrampazz@redhat.com> wrote:
>
> On Sat, Dec 19, 2020 at 4:30 AM Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:
> >
> > The kernel comes from debian archive so it's trusted.
> >
> > Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> > ---
> >  tests/acceptance/boot_linux_console.py | 21 +++++++++++++++++++++
> >  1 file changed, 21 insertions(+)
> >
>
> Reviewed-by: Willian Rampazzo <willianr@redhat.com>
>

