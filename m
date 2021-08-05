Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24ECF3E10DD
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 11:08:35 +0200 (CEST)
Received: from localhost ([::1]:37934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBZMg-0001nO-7x
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 05:08:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mBZLj-00012c-5L
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 05:07:35 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:35511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mBZLh-0004MJ-KP
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 05:07:34 -0400
Received: by mail-ej1-x631.google.com with SMTP id o5so8393798ejy.2
 for <qemu-devel@nongnu.org>; Thu, 05 Aug 2021 02:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gVG3JFYt+YE17XTi0cLKILqYj8icDjFY4GEOQdtgZmM=;
 b=SSC9azHPd54/ECgfXMJumjJfjDFO6WR1giprMmoZoKFkgpBKeYytBIfSRLVtoSicAf
 zpk2+Hct2EGU4U6jiTi2YTCzWxSSdw1uVzr1SoCdojgpbMF4DwDhb5nslG/7vGOmLT8i
 E34t7+34y8GgFtY+21fy3gFON9EjCLrGuinUCFnbegubEuEdrx+Pf9Vgq8D1ZZYFb2eF
 YMIolN4GD5CRL364nBa4Z0YJvMAD8xa+CHVFbhTGMCbG1gjynvy2uUHKxWpZxt6Ik81d
 n3pcjnUxMh5Fr8Hwuy5xed/nXdHNiykSBprYhmPG1LD93DFH3xeE+ANipCxxwwM9zwBw
 qYhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gVG3JFYt+YE17XTi0cLKILqYj8icDjFY4GEOQdtgZmM=;
 b=CDP0Os03cLJLRP0rutHqZpNjcG9DnTNk8mFShpZwLOU3asQdxktD88dnOrNkooKdrX
 SVqgfLvLAzP8wXXyQOdrHxJjBrcs7cDRo8xKEeVEGAUVlcsdPcTFpgAIQApiuZgyf3HD
 v5SVIv2X31V9r8RpPhh5HOu1IfDx1EEHh8gIJvH76TZh2wU+ZuarrGAdiSzq2nsNQfxI
 LU6VKvM0qQMUP/m5TqQjBXfA2cMo4yqpJJrvjW9Y/qfmUTRX7/0hs3E22Olmli2JvLZS
 KLawfzLh4I7zciPNwkFpiIfg01Azeq4SrT7Uca5n2ZeIftjWIsci/R+XcwzH9rQOo2Zi
 3CrQ==
X-Gm-Message-State: AOAM532WS4swqmCA7yWSYjcUJCQU4YvExnF4hwVay6ZhMNQzVi8GIMdk
 +3cpL2v68+GlIqWNa5I0NIEIrdVxkZ7eItmHJutKUQ==
X-Google-Smtp-Source: ABdhPJxAu5pk03ebuZ633Ajm8G7I8gXbvkifqeSsYwYHfVasCT1H1Q7cfukqZyPOuxJYossK7bhpYxNTdyj+12gjT0c=
X-Received: by 2002:a17:906:6cb:: with SMTP id
 v11mr3781881ejb.482.1628154451182; 
 Thu, 05 Aug 2021 02:07:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210805004837.1775306-1-jsnow@redhat.com>
 <20210805004837.1775306-2-jsnow@redhat.com>
In-Reply-To: <20210805004837.1775306-2-jsnow@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Aug 2021 10:06:47 +0100
Message-ID: <CAFEAcA-ZXqAFzX5Dnudpd12DsMjidTCsZhiHMPP+OGpRrZPceg@mail.gmail.com>
Subject: Re: [PATCH 1/2] docs: remove non-reference uses of single backticks
To: John Snow <jsnow@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x631.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 5 Aug 2021 at 01:48, John Snow <jsnow@redhat.com> wrote:
>
> The single backtick markup in ReST is the "default role". Currently,
> Sphinx's default role is called "content". Sphinx suggests you can use
> the "Any" role instead to turn any single-backtick enclosed item into a
> cross-reference.
>
> This is useful for things like autodoc for Python docstrings, where it's
> often nicer to reference other types with `foo` instead of the more
> laborious :py:meth:`foo`.
>
> Before we do that, though, we'll need to turn all existing usages of the
> "content" role to inline verbatim markup wherever it does not correctly
> resolve into a cross-refernece by using double backticks instead.
>
> Signed-off-by: John Snow <jsnow@redhat.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

