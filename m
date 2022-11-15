Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C4296296AF
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 12:03:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1outhu-0003LT-Em; Tue, 15 Nov 2022 06:02:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ouths-0003Kw-Ao
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 06:02:20 -0500
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1outho-0008JE-OZ
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 06:02:18 -0500
Received: by mail-pf1-x435.google.com with SMTP id c203so2663980pfc.11
 for <qemu-devel@nongnu.org>; Tue, 15 Nov 2022 03:02:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=jWpsFThWQLgtJHrxOSurvh6a5jKaeay5QFOJpn2Rr4A=;
 b=GdatS03WSLjdAfKf7Xges7oywS9e+vrLgQeeMKxWEC14yuNWP0dosZI8j9y4CJdtrg
 819j6fDkEYN/mE3q8pH7KmTCxKRrEi7rMtxIgG56A1jXuKMWZQ4GLnUQrHnZ1jHs0Yme
 Of6S1aBaBK9NOewq9cl9sAQettRJR9TnAKXkBhLigibTHm5ot/XX/cEF7PPihJ9FvdPn
 AMnJAsdCEyuSZEJiXBU00DYhuCSmZDB06P9tv68vDkP9LpTdqTqohPdjJn8EqLvsCSBx
 g6FDqdcnMBd6xfjTrwrmTwBuj/QQDsvw2QClWSroxEFeKPOIl8k13GEml1hRRyPRwW95
 0S4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jWpsFThWQLgtJHrxOSurvh6a5jKaeay5QFOJpn2Rr4A=;
 b=Za8iHAnw5s8WrxHKBuzt9jkMwBxSrirecN0l5xmiUsfLt+45aTglEjr0sR2D91HVWs
 o9P39Zpfqj3CMHjB4hwBVdFxx47vubPcXoLICge4yWZnxcupnxQcqtGidfajc+EYdG9n
 Cwhna/irR+yZ2sjOG2sDzRqC+jac6wYCgEMln3BJnQ29cfcNoMhdXIHGC9/QYdj/q7QA
 SPRwICDmACi7zIryrocN/JI1ddjSj4L/v6S8xZ2q6R4cp11A7KwhBZqgeHLonkBVmzMF
 V526ORYQKsVjXB2R/SYhRgrmZjNt1/sORcgc47HSZU1C3aTF/VKkTp4L+g3aUNTpITQ5
 Ol0Q==
X-Gm-Message-State: ANoB5pkjL8CmWze06XfBiCipgf9OzhTYOa/N3MkPElj4otxGpN2fIiTe
 EW2q30e+lPpB+PJWBhTSEMdilsHl6JIN37xgm40/dA==
X-Google-Smtp-Source: AA0mqf4XGIB/Ap/wiXBtGYzsBDZLcB70SCOCw1nYZNvhiM0P456km4FqnwGyeI7w3+/Z1AXisnK8BOb4Mx/Rqf7O1no=
X-Received: by 2002:a63:535e:0:b0:43c:7da:e64b with SMTP id
 t30-20020a63535e000000b0043c07dae64bmr15805255pgl.231.1668510135097; Tue, 15
 Nov 2022 03:02:15 -0800 (PST)
MIME-Version: 1.0
References: <20221113200942.18882-1-mjt@msgid.tls.msk.ru>
 <CAFEAcA_aGiukDWQBAjj=Ln_u02wEbMNxOsHRZcBOm+jOz6HU2Q@mail.gmail.com>
 <ba8aee1e-4b53-4c28-d77d-41782b56a5e0@msgid.tls.msk.ru>
 <CAFEAcA9z564UNPqaMyuAemp_ctmh6eTZbSi5zR6w46Ndkq4u3Q@mail.gmail.com>
In-Reply-To: <CAFEAcA9z564UNPqaMyuAemp_ctmh6eTZbSi5zR6w46Ndkq4u3Q@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Nov 2022 11:02:03 +0000
Message-ID: <CAFEAcA97jWEQoMnFNwiCSH+K31Ta==nAeNEtUdWK5tECA0VKmQ@mail.gmail.com>
Subject: Re: [PATCH v2] capstone: use <capstone/capstone.h> instead of
 <capstone.h>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 "Daniel P. Berrange" <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, 15 Nov 2022 at 11:00, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Tue, 15 Nov 2022 at 09:25, Michael Tokarev <mjt@tls.msk.ru> wrote:
> >
> > 14.11.2022 14:59, Peter Maydell wrote:
> > ..
> > > We can do something like
> > >
> > > config_host_data.set('HAVE_CAPSTONE_CAPSTONE_H',
> > > cc.has_header('capstone/capstone.h', depedencies: [capstone])
> >
> > This doesn't work, because has_header does not have "dependencies"
> > argument.
>
> That's odd, the Meson documentation says it does:
>
> https://mesonbuild.com/Reference-manual_returned_compiler.html#compilerhas_header
>
> "dependencies dep | list[dep]
>  Additionally dependencies required for compiling and / or linking."
> and it's not marked with a "since version xxx" tag...

...and we already have a few lines in meson.build that use it:

  if cc.has_header('epoxy/egl.h', dependencies: epoxy)

  if nettle.found() and not cc.has_header('nettle/xts.h', dependencies: nettle)

-- PMM

