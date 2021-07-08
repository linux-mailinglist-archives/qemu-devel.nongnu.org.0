Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4827A3C18B4
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 19:55:13 +0200 (CEST)
Received: from localhost ([::1]:40882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1YEy-00025Y-CQ
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 13:55:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <titusr@google.com>) id 1m1Xkr-0005C4-Jj
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 13:24:05 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:33690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <titusr@google.com>) id 1m1Xkq-0004vD-3p
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 13:24:05 -0400
Received: by mail-ej1-x62b.google.com with SMTP id bu12so11047527ejb.0
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 10:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ivzdeDYe7zWqR54/NrNr+5CxEF8EicDFdbc5TgBM3hM=;
 b=Vo/aGxN7h9vA/0FfsZIhOMxAfjHlVxRWEemVTMhPLiLshwPspt3Kj8GzJn9rJKvB7x
 VLRlz0c6ctG5bU0JvTbjHYGZJ+PriIxdiu1y+Valt0yn+QFyf9dnNNGJNzwWgdC+6FQM
 P2gRTi7JHY+DHlMdnC8B94ZPI72dGxmjHOTHIZc0WaJ6ubS2yFBmJbQx9u+CJhuKXR6w
 IX/7niJUSjJv/YmkEUp2T9UIisiU6I4GnZuzMfSlFNUzp8vDhiga3eVSbq04S/JSGUgT
 djFUDzfP0VqvaHGQVhKungn09AjfeEKtT5ug5pT3uI1hgwRNlTbUsGVMwh6hh/halTQR
 Cc8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ivzdeDYe7zWqR54/NrNr+5CxEF8EicDFdbc5TgBM3hM=;
 b=HLeDj7FDnbcoX85Ts9PhgCAkPLrOtY8QhzlpwM9HQwjJHT7OAvpij+Ls0HUKbLiaZt
 xMfoynN+AQ27zNkM6jJ3C8+wOdlfFyxOzRbmISMOsCRDkvLSPowPnW05YKAGthvC0wG2
 ATT/E4A2nJON2Dv5NN6I1qw05RSRngM6OAkvNZA6Ctm5nrPvsK0U5xk/prcikIPy8Rgv
 l11I+o0cSWAmq4qL0j8Yk5LzZRgnBMndhrlDEOa534eiLf8ALMJZcYvwXHAYl036PKtl
 qRMQief/BldYd14yP9lf87DJeuB9yAh6xSIEjdf2Ej85d2GyvD8zvIq3JARnIH2LuBbz
 d/Cw==
X-Gm-Message-State: AOAM5307cc+xFgKz8ysenTh9AqHYgho3rSd3Hd2WUrgFYhy2MRHs1iLc
 jQ2kvkeT9U8itHVgKj6UgjiiamfW8M4e2PLzHqrjpA==
X-Google-Smtp-Source: ABdhPJxb8Njzq6ZROgpQC4k+QmSyD8Ti0IjF+GocTGR/EM4iNWDK/8SzdaxH9DAh0/R+VwKHrA+EW4pAl1URD70iHpo=
X-Received: by 2002:a17:906:49ce:: with SMTP id
 w14mr32255119ejv.273.1625765041768; 
 Thu, 08 Jul 2021 10:24:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210706200558.GT2921206@minyard.net>
 <CAFEAcA-dvSPpKoJ-+ATYcBs6UuLJY1ZKwx-9WYvPyJ+0MYU4ew@mail.gmail.com>
 <20210706214535.GU2921206@minyard.net>
 <CAFEAcA8Xxxo7Ubm344nUe12jctSdBO36p+nf3uP9ZjscSJBS7Q@mail.gmail.com>
In-Reply-To: <CAFEAcA8Xxxo7Ubm344nUe12jctSdBO36p+nf3uP9ZjscSJBS7Q@mail.gmail.com>
From: Titus Rwantare <titusr@google.com>
Date: Thu, 8 Jul 2021 13:23:21 -0400
Message-ID: <CAMvPwGpFqGqf01svHt8hkgSyJV4EuuoBxUnRiQJ71qiQ=jKLmg@mail.gmail.com>
Subject: Re: [GIT PULL] I2C/IPMI bug fixes for QEMU 6.1
To: Corey Minyard <minyard@acm.org>, Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Joel Stanley <joel@jms.id.au>,
 Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=titusr@google.com; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -180
X-Spam_score: -18.1
X-Spam_bar: ------------------
X-Spam_report: (-18.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.5,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I've sent out some patches using BIT_ULL(). Hopefully it's fixed.
-Titus

On Tue, 6 Jul 2021 at 18:00, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Tue, 6 Jul 2021 at 22:45, Corey Minyard <minyard@acm.org> wrote:
> >
> > Hmm, it compiled for me, I wonder if there are some compiler
> > differences, but I don't see how.
>
> I'd expect it to fail when compiling for any target where
> 'unsigned long' is 32 bits...
>
> -- PMM

