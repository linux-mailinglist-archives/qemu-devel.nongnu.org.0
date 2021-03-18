Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A52E33FCAD
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 02:30:20 +0100 (CET)
Received: from localhost ([::1]:55940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMhUR-0006g4-4O
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 21:30:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lMhT2-0006FG-Ut
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 21:28:52 -0400
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35]:45263)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lMhT1-0004o1-7l
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 21:28:52 -0400
Received: by mail-yb1-xb35.google.com with SMTP id y133so796749ybe.12
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 18:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=e0ucuVJiZYc+FCuSGiK/lkLYvfsN0DasntUDfM/fyUE=;
 b=GC61keIARHGvlFl12OnyukI0Lb9Pz+ujSAWZA4MWgofAqocXDCnTpkWOMHLNDD2Wcg
 /pdJsBBHZcfiTycrVOMpvBc9D9/v3M250yTGIFBtZU5CUP2E5TmhPxJm6wVtKzFCYD/q
 s8L7TWRLgFXTjhAfDFbpCm7o/zx05yRmA+POnbsEn6bOEg5n9xPy3K6Nl5zzfJFtxHy3
 Es7/er29eiNX36EAUzYnI2XFjpSvYG4Y3Ar7tEzCmBNqk7VtCkpoVXKzt5XHoP4eWpeC
 QYglE8Frma8FhvbRRQDpHkw8DcTRqMZcqZuEKTyefoKNYzkH4j7Gd0Jc81z+vat3Zh0x
 rNKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=e0ucuVJiZYc+FCuSGiK/lkLYvfsN0DasntUDfM/fyUE=;
 b=aBjfTforvRMvkxqmtZciLAJb97EuCrLmWj4kxhzZNxzzrmY6MeT8OZK4S9h/sF2ySq
 rJ+trpIvkz8x0G2rihkMf+T1uSFNuzZbt1zAjPOmUnphLEQp7NBcTH8BeLUlH2De6LeE
 PwtYeaS4iIppayxQ1Y0nKkOjwLzr9XsMi9/sR8ni96/SdJdFeg/TrDwtfBZ6f+uzTbHy
 tOUDbn0m9PTTArA0VWv45HbXqgSpfT62bEyaZK4hDLiZt4eQrw5l5AfsicA5vcca1rZQ
 r7FoWic9kwIGbvcK/JX+UP3b3QJpWiU+9tV5nSjowtLeJqJFhXPwrVNQ6+tulO/cAbD1
 tTPg==
X-Gm-Message-State: AOAM530iMwYdoxhKC5l3F7QI/GMNSDu/OXI2PLr5HBsUoEQ3Xw76uAsH
 UOXIZW9RQNxMDCssFdCQ/DIYhXgh/rIdBdrIgt0=
X-Google-Smtp-Source: ABdhPJwCRnl0g1O1AgIo0HUNE6hkVCHxnZUwYLLlVjujX9kIKbs3Y9Z/cBBsr2AsPZ5rxxa3LW+k8OvWnxAVwmk6sqw=
X-Received: by 2002:a25:73d1:: with SMTP id o200mr7179640ybc.239.1616030929539; 
 Wed, 17 Mar 2021 18:28:49 -0700 (PDT)
MIME-Version: 1.0
References: <cb9d0504-aba5-3114-d121-694a5247764c@amsat.org>
In-Reply-To: <cb9d0504-aba5-3114-d121-694a5247764c@amsat.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 18 Mar 2021 09:28:38 +0800
Message-ID: <CAEUhbmW=sGq+bH59xV4hiTyMp4TD6YwaTGz+K7RjyH4qQ2urFA@mail.gmail.com>
Subject: Re: Serious doubts about Gitlab CI
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb35.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 18, 2021 at 4:32 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> Hi,
>
> For some (unclear) reason I got my free tier Gitlab account renewed and
> lost the privilege for users opening account before the quota limit.
>
> I pushed a single branch to my namespace repo to trigger a pipeline.
> 1h later I was surprised to see the pipeline was stuck, having completed
> 99 jobs of 119. Looking closer there is a red comment on top of the
> pipeline:
>
>  philmd has exceeded its pipeline minutes quota. Unless you buy
>  additional pipeline minutes, no new jobs or pipelines in its projects
>  will run. [Buy more Pipelines minutes]
>
> So I exhausted my 400 monthly minutes credit.
>
> From this FAQ:
> https://about.gitlab.com/pricing/faq-consumption-cicd/#managing-your-cicd=
-minutes-usage
>
> Q. What happens if I hit the CI/CD Minutes allotted limit and forget to
> purchase additional CI/CD Minutes?
>
> A. You will not be able to run new jobs until you purchase additional
> CI/CD Minutes, or until the next month when you receive your monthly
> allotted CI/CD Minutes.
>
> Q. Will I be notified before I hit my limit on CI/CD Minutes?
>
> A. You will receive notification banners in-app when your group has less
> than 30%, 5% or exceeded your total allotted CI/CD minutes.
>
> I indeed received 3 warnings in 7 minutes.
>
> Now I'm having serious doubts about Gitlab usefulness for the QEMU
> community...
>
> Some screenshots FWIW:
>
> https://pasteboard.co/JT51wGR.png
> https://pasteboard.co/JT51Rqq.png

This snapshot shows that 2278 / 400 minutes (569%) were used. Strange?

> https://pasteboard.co/JT52fNL.png

I checked my gitlab settings, and it shows 0 / 400 minutes. However I
am pretty sure I have been using gitlab CI this month several times.

Regards,
Bin

