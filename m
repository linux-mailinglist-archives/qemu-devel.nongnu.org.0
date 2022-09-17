Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5868B5BBA33
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Sep 2022 22:13:26 +0200 (CEST)
Received: from localhost ([::1]:37800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZeBo-0007iO-VH
	for lists+qemu-devel@lfdr.de; Sat, 17 Sep 2022 16:13:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oZeAM-0006FB-81
 for qemu-devel@nongnu.org; Sat, 17 Sep 2022 16:11:54 -0400
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35]:34509)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oZeAK-0000JP-OF
 for qemu-devel@nongnu.org; Sat, 17 Sep 2022 16:11:54 -0400
Received: by mail-yb1-xb35.google.com with SMTP id 198so32277537ybc.1
 for <qemu-devel@nongnu.org>; Sat, 17 Sep 2022 13:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=5D0vNCl8FUv0RgZDoHK/BJmxho1+RJ+rQYzizB37vMA=;
 b=LhIb6yeq7nv5yjT4ss5vUisHXAKVxRRnU3aOrdaWRqLJiO2iSBZXkfxgOdtrwBunZ9
 jL5nuS24DLJ1/C2pzYYpcYfGp0wGjhJLfcA49uEc8estU8nMsj94kks4Y95W8NsJXFC3
 qA7AAeOCDPO2+UFEh0Rumt4ARYAAb92snnGMMiy0M133Y0Nk+ggFfX5iRIMx6q5ABhQ3
 2j6OVGhOzMCUY7Zpb4SH2+a356h0s4MB0RYPhrTmDGLuXGKpBkLYcVqYp8gKumrphNwG
 e0zqx9Ri3YB5z7TrxK9FJNoJfoJxNyV8YkrqDcStfVWbhANfCOnycnoFSsajOgMWsYYE
 javQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=5D0vNCl8FUv0RgZDoHK/BJmxho1+RJ+rQYzizB37vMA=;
 b=Z+7N8g/xM/kWHGSpB7Wh1WfhW7kfBW5KAXY0c+g/iSTtL+sQlVO6ROFYyjKEcI0Dwj
 Ud24IPY0yirSCh8QjFEiksg9pfUqRysGFQrX9SX6bVZj/n7EVQL7UJVvEl40c5LPdWyD
 ToeJEIHmck5BxHBcYLslqdwOWKvuRn3UgnnNrMNyQimLRNz6oPF2YK3SuCsvG6/XzBtf
 kSxqq4q/0KTdijHSGO6rDcKVSOtpRTITOF6UfRJYZvmkV5rwM57ZC13pZmTPtWGRnfvE
 3cgfg7vVc0OSctJlr+B1lVUb5s2yR0OKsKDPlnGoPhsDWqrPFMBllh3dPfnJvXPGEU93
 e6Yg==
X-Gm-Message-State: ACrzQf1a2kY57qo6NrEZyUGfte4w9lV3CBbJVi1iniyfH7o5O0sGomxl
 KcgHsRQlojwHfpqT3EgmJdFDB5hB41MsM1LZ/oI=
X-Google-Smtp-Source: AMsMyM7urAz1X+HQGmZx/ypr9yvRZJRC6RVTB8/y3zxqulv6gQQqNNB6WD7By4z8fQiK5ZlA+EIQKpHEoFB+gx0srb4=
X-Received: by 2002:a05:6902:1083:b0:6b1:4a11:9cf5 with SMTP id
 v3-20020a056902108300b006b14a119cf5mr6043553ybu.537.1663445511473; Sat, 17
 Sep 2022 13:11:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220913191321.96747-1-deller@gmx.de>
 <CAJSP0QWfUhRVhRJ7og1ntfbrjdpcuU31xRnUNWTOBhshpP8cTQ@mail.gmail.com>
 <467e4795-31ea-54b7-1735-ef5c2857ca5f@amsat.org>
In-Reply-To: <467e4795-31ea-54b7-1735-ef5c2857ca5f@amsat.org>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Sat, 17 Sep 2022 16:11:39 -0400
Message-ID: <CAJSP0QVNsqY7ovqJSXgHraX=z_WSTwUXhh520oki2soJ3pa=NA@mail.gmail.com>
Subject: Re: [PULL 00/12] linux-user patches
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Laurent Vivier <laurent@vivier.eu>
Cc: Helge Deller <deller@gmx.de>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org, 
 Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb35.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 17 Sept 2022 at 15:31, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
> wrote:
>
> On 17/9/22 16:26, Stefan Hajnoczi wrote:
> > The close_range(2) man page says:
> > close_range() first appeared in Linux 5.9.  Library support was added
> > in glibc in version 2.34.
> >
> > The qemu-user GitLab CI jobs are failing. For example, see
> > https://gitlab.com/qemu-project/qemu/-/jobs/3043629417:
> >
> > ../linux-user/syscall.c:8734:26: error: implicit declaration of
> > function 'close_range' is invalid in C99
> > [-Werror,-Wimplicit-function-declaration]
> > return get_errno(close_range(arg1, arg2, arg3));
> >                             ^
> >
> > There is a second issue with this pull request:
> > ../linux-user/syscall.c:357:16: error: =E2=80=98pidfd_getfd=E2=80=99 de=
fined but not
> > used [-Werror=3Dunused-function]
> > 357 | _syscall3(int, pidfd_getfd, int, pidfd, int, targetfd, unsigned
> > int, flags);
> >         | ^~~~~~~~~~~
> > ../linux-user/syscall.c:251:13: note: in definition of macro =E2=80=98_=
syscall3=E2=80=99
> >
> > See https://gitlab.com/qemu-project/qemu/-/jobs/3043629434.
>
> Hmm apparently this PR hasn't been reviewed (although the patches were
> on the list for 2 weeks).
>
> The 'check DCO' job - looking for S-o-b tags -  is green:
> https://gitlab.com/qemu-project/qemu/-/jobs/3043629425.
> Should we complete it by a R-b/A-b check over the commit range?

In some areas there will be no R-b/A-b, so I don't think we can
require those checks.

Was this pull request supposed to go through Laurent instead of being
applied directly by me?

Stefan

