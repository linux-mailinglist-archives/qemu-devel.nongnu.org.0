Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA126990F4
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 11:18:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSbKM-0003QB-7R; Thu, 16 Feb 2023 05:17:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pSbKK-0003PU-6R
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 05:17:20 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pSbKH-0007Dk-Ba
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 05:17:19 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 pg6-20020a17090b1e0600b002349579949aso1251888pjb.5
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 02:17:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=SIvbH+2oCoVJcZr5kE3Rg4OxD86gasq7822fKFMT+7Q=;
 b=aelfbm8yU49HxpHiR+lnqqKpilGkGr7y/wegTEHjwVi819V2eUg/59OX+0t5kMa2Hq
 L/3YmuVfZJ/R+8cktNZ8lI5PH+k885yDuMvjjcO0yHs3GHBgXA4wh8IueMKawWPXT9z2
 mocabZmScm9doJqWM/LEMv3N+k+cdwI1c3ww7xlrT8iFsw4CQags2AMXsd8llMtVahVy
 Y70LGb4eC3XYzy86u4FIzY2NujBec5MrMZzHu+6a7Co+ModcjuiE1yq/LEewucn3ou0p
 5Y4DHkZJlmtGAg0lzvFdtN2PGmJt1YZIG0q+pzR4gQ/CUeAjQfQy4fpxIEOZLDuK8CKp
 KoBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SIvbH+2oCoVJcZr5kE3Rg4OxD86gasq7822fKFMT+7Q=;
 b=BpxEnKenkr5sMlOgWzEFePxNSpuGhAczKrkIsKRT35b5asdf4OBmxBNz1OgwNX5FFV
 Z1AkWsnyFgNVIN0b3+6CLB6XjawCA71Om9xT1jBf80xJgghPwqXmWixvuFDzWzoFn0CN
 jf12YHCkElMBHYcBdsxJdJlLEtCYMhqX0bho8XtWChClp4+ilbekjd5gRUqQKDLnOSoC
 V2KR0E40qeEgYWYT+R3WSuDRzqAZ3ruzU5HGqIWqhagj7UszFUv6uxx+6iGJasNhlPOa
 ndTH7ZQI7oJ1BDCu9xP5oxjzD9dpQUmSyBKb2fbWJqEe9iCk0ktXfOBB65ibh9Omk7EW
 CbTA==
X-Gm-Message-State: AO0yUKWzZ2mGu7QlQ4fHHtBcjTRqZmep2UTg24qIvHtx8zl8hCu2kor1
 Osx2GNMPARmLec0Cena2QBGlMePGor9sKOqb371M7A==
X-Google-Smtp-Source: AK7set8VtlJJnlo3Y636dVrxu+w1viKw3v9AHGI7DsVDXHYqodqf///5Cgzp+fJ/bbm2c9ED3pzz0Y4EHPo7AxfMix4=
X-Received: by 2002:a17:90b:5109:b0:233:dcb5:ee15 with SMTP id
 sc9-20020a17090b510900b00233dcb5ee15mr463583pjb.92.1676542634354; Thu, 16 Feb
 2023 02:17:14 -0800 (PST)
MIME-Version: 1.0
References: <20230210003147.1309376-1-jsnow@redhat.com>
 <87v8k2ycjb.fsf@pond.sub.org>
In-Reply-To: <87v8k2ycjb.fsf@pond.sub.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Feb 2023 10:17:02 +0000
Message-ID: <CAFEAcA9bv-xfU4CkcMbq4LbQ6rvhVJ5JXLJ58G+=z88j4gZQRQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] Python: Drop support for Python 3.6
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Thomas Huth <thuth@redhat.com>, Daniel Berrange <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org, 
 Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Kevin Wolf <kwolf@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102f.google.com
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

On Wed, 15 Feb 2023 at 19:05, Markus Armbruster <armbru@redhat.com> wrote:
>
> The discussion under PATCH 6 makes me think there's a bit of confusion
> about the actual impact of dropping support for Python 3.6.  Possibly
> because it's spelled out in the commit message of PATCH 7.  Let me
> summarize it in one sentence:
>
>     *** All supported host systems continue to work ***
>
> Evidence: CI remains green.
>
> On some supported host systems, different packages need to be installed.
> On CentOS 8, for instance, we need to install Python 3.8.13 or 3.9.16
> instead of 3.6.8.  Let me stress again: same repository, different
> package.  No downsides I can see.

Yes; I never had any issues with this part of it. If there was
a "Sphinx that also used that Python" in that repo, the answer
would be easy.

> The *one* exception is Sphinx on CentOS 8.  CentOS 8 does not ship a
> version of Sphinx that works with Python 3.7 or newer.  This series
> proposes to simply stop building the docs there, unless the user
> provides a suitable version of Sphinx (which is easy enough with pip).
> That's PATCH 7.

Yes; this brings CentOS 8 down from "fully supported" to "kinda
supported but not for everything", which is less than ideal.
I think the level of not-idealness of that side of the scales
is probably clear enough. The difficulty I think for those who
haven't had their arms deep in QEMU's Python code is not having
the background info to be able to weigh up how heavy the other side
of the tradeoff scales is (since the naive "well, just keep writing
Python 3.6 for the moment" take is clearly wrong).

thanks
-- PMM

