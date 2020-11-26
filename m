Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A204F2C51C7
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Nov 2020 11:11:06 +0100 (CET)
Received: from localhost ([::1]:44974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiEEx-00050I-CA
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 05:11:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kiED6-0004UY-90
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 05:09:08 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:35123)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kiECw-0002JX-93
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 05:09:07 -0500
Received: by mail-ej1-x634.google.com with SMTP id f23so2125714ejk.2
 for <qemu-devel@nongnu.org>; Thu, 26 Nov 2020 02:08:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=fWx1Q0HJ67YVpQIjJAXXivTwDjdOLj2gl6O3PnK6TSg=;
 b=xPeN2kBfQzaoGeOILQxLLzMdM7lpWsJp5MSphnZ6rybkJCWrE6hks4IhVFnhV+7w4a
 /NskGiOw2MdJrutmObVfWHucRXPIcE8ju6PHjM5M/KNwausHvMLoN2SmK/J03Sivkny5
 b8dKSrr1iHd2E16LdntRqyJxUJuyzS+2KOJd8Zadd367SHQJo/7wcsBZBNqxM4M5NR33
 I1vIGNPW7NRBKzRXoP8TsEA2sJiot5SOMYyZ9Vs74q1Gf+UPPhG57ymAlU0QXsp3+B4N
 gMoJSrOUnKu6kymTBBhzodo4QjRj4/HUq1V80WI5bwP9V15bLMjiJ8fTHZRDEInCInSR
 izwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=fWx1Q0HJ67YVpQIjJAXXivTwDjdOLj2gl6O3PnK6TSg=;
 b=LX8xftBGyB3WMg9jL3kpIQpxXP6FzsK2bchE8LJJ1H4ZYCIkOdfwDkhFgbon3T29qB
 RaiK5J+SXE84fhuGY+1Pd7WM15iPayLJPu+zCGar/Hyvh3UPXu7kZgUdwgApipxPIZ3a
 ohWkj5o4KwDMYTb97kz/yWxuFHUiak8EAzZ3paWWDutBeQieKkbFUPkFnkk5LOCv+Dzd
 gkjLYkPSsYhs02sPDijKosjh6ZEFXvl2QaThTbqzMjLC8o9pPbwp7xWdLbHZ1FgJnaZo
 hma4gZHS0JhHdmiX7TaNskxbc2hiFxvtkL3/MEeZIlpvcuurGxUgej2Re55N6YfWO1TA
 8Bug==
X-Gm-Message-State: AOAM533iDWkbxPsWChofhTIl2FUpFi6th7zR/9kXU5Y1jsImpxXNWUcc
 qV5BQLCo2owbOI0qNOFN/IRS3KNMxZo7e0Kz+6tkpA==
X-Google-Smtp-Source: ABdhPJyn5ZukRyjVQ+dCA67BT6z/FnhJWqFtFU/IMWq5AljoDjxgMJ+QuOeEyZHCCRXdcqHNnrw6C/fSrTTHiEPT7Qo=
X-Received: by 2002:a17:906:5a88:: with SMTP id
 l8mr1964867ejq.407.1606385334574; 
 Thu, 26 Nov 2020 02:08:54 -0800 (PST)
MIME-Version: 1.0
References: <CADPb22TfGZjr85z=5+Vc9fNqooGq5JTTos1h-rta8d3eG0SQew@mail.gmail.com>
In-Reply-To: <CADPb22TfGZjr85z=5+Vc9fNqooGq5JTTos1h-rta8d3eG0SQew@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 26 Nov 2020 10:08:43 +0000
Message-ID: <CAFEAcA8CT8CpBJtm2Y=0ppj1ZLfN2LLP=o0K307rfX3juWn7fg@mail.gmail.com>
Subject: Re: [DISCUSSION] Running one qtest test: how?
To: Doug Evans <dje@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x634.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 25 Nov 2020 at 23:41, Doug Evans <dje@google.com> wrote:
> I can run a subset of qtest tests with "make check-qtest-TARGET", but tha=
t's the limit of the granularity that I can find. Why would one want more g=
ranularity? When adding a test one wants the edit/test cycle as short as po=
ssible and needlessly running other tests is a pain.
>
> It'd be really nice to be able to specify one test via make check. I real=
ize I can pass V=3D1 and get some help to dig further.

> Am I missing something? What do others do when adding a test?

I just follow the approach outlined in:
https://wiki.qemu.org/Features/QTest
 -- use V=3D1 to fish out the relevant commandline, and then
if necessary narrow it down further with -p.
I agree it might be nice if there were better support in
the build system for doing this more automatically.

thanks
-- PMM

