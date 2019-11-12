Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38871F8F5B
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Nov 2019 13:10:43 +0100 (CET)
Received: from localhost ([::1]:33970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iUV0M-0001Yj-9T
	for lists+qemu-devel@lfdr.de; Tue, 12 Nov 2019 07:10:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40147)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iUUz3-0000iF-An
 for qemu-devel@nongnu.org; Tue, 12 Nov 2019 07:09:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iUUz1-0003ux-Uy
 for qemu-devel@nongnu.org; Tue, 12 Nov 2019 07:09:21 -0500
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f]:39690)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iUUz1-0003uT-Np
 for qemu-devel@nongnu.org; Tue, 12 Nov 2019 07:09:19 -0500
Received: by mail-ot1-x32f.google.com with SMTP id z9so924433otq.6
 for <qemu-devel@nongnu.org>; Tue, 12 Nov 2019 04:09:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fHMl2EwqwWUp1hddtFwsPziWvjWArTHS+ynXRb/jzJQ=;
 b=OYpmTPU1dA2Q13Z0gdS+7rFqz+Z7ef9hRitxEz5+N0rbqIcWDFgrp7Lg0wC4zOM9ce
 FRjeb2hsMPxXsUpUXuYEVATMpOTi4RKZi9jU8XWDXOPZs2RIFuvjy+zPdMTlB0O3X3R4
 AeNnAJzOf/qAtgC6HGvuwTG1e8Xi+cYqzl2jGws6U6C5nP6fYniT5lDJGlOtIT06OZi1
 TstBNNkGvwOhlNOXyy+Ia6rdgIF+q5WRE4c4ghCU2I/NupOf2dCHiIZyWNn55ZWeju+5
 +veF7Rkg8omblMKt2QlU8gg7gzReTG+ej3gdlz/TTvQFRAfDVmo9cYqlV4UHWNnq7Z92
 +OPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fHMl2EwqwWUp1hddtFwsPziWvjWArTHS+ynXRb/jzJQ=;
 b=dMBeBVoFatwyyEWxOLaYUjKe8Z7/uMeqr/ExvGZPmHB7Pn4ycHGokaXnahp8QC4fpu
 wMCPj1+nBFOJaPYXVcFDe4D27vLV/u7Qb4aPXjWnFMHGh8CurDDEJsBK3+hKFcqrqjeO
 Vub9lBO7t9ZOJp/dfWSPhp7ZUCRRX510JfKlqpU9KussDgPYh18lkXcIkCNfsOqAzH8I
 e4AWtaAnxtaMFVDTCtKJuPBlOA7RQ4wzqabNGREjVH6bXxBUI6QSymUyOwslCenBja7r
 +n2QdUg63hzbZkAA4w1wg48gKspHLgVU5ItQPwuCCSklRNcKhEsK0lCFyhfPMi6EnRQc
 wQ1A==
X-Gm-Message-State: APjAAAX6xN/oyrY1UA5uv2wGl+Z1cBDZQCpS2nk0nPH/Ytm+wMET80Gp
 WmtoZOHbojAJ6jasv9QywJpkanMXQiHVbjKi2OcoBg==
X-Google-Smtp-Source: APXvYqwDJqC8csJcm1aHFGRp731d3l1NY9HQLrTRdgBjFQ8eVU2fN8pvGhrXKww8IB3KtWUs+NM5clLVEse+ZSIvdJs=
X-Received: by 2002:a9d:68cc:: with SMTP id i12mr20370939oto.97.1573560558808; 
 Tue, 12 Nov 2019 04:09:18 -0800 (PST)
MIME-Version: 1.0
References: <20191112064332.5074-1-thuth@redhat.com>
In-Reply-To: <20191112064332.5074-1-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 12 Nov 2019 12:09:07 +0000
Message-ID: <CAFEAcA-=_a7ibQ27n08bwe_6fk6-0T4_6HkiQ4o2quqg6X+tOw@mail.gmail.com>
Subject: Re: [PULL 0/6] qtest and misc patches
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::32f
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
Cc: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 12 Nov 2019 at 06:43, Thomas Huth <thuth@redhat.com> wrote:
>
>  Hi Peter,
>
> the following changes since commit 654efcb511d394c1d3f5292c28503d1d19e5b1d3:
>
>   Merge remote-tracking branch 'remotes/vivier/tags/q800-branch-pull-request' into staging (2019-11-11 09:23:46 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/huth/qemu.git tags/pull-request-2019-11-12
>
> for you to fetch changes up to 623ef637a2e42e023e7436d4bfbdc5159fb36684:
>
>   configure: Check bzip2 is available (2019-11-11 14:35:41 +0100)
>
> ----------------------------------------------------------------
> - Fix memory leaks for QTESTS
> - Update MAINTAINERS file
> - Check for the availability of bzip2 in "configure"
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/4.2
for any user-visible changes.

-- PMM

