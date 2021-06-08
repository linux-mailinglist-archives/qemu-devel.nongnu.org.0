Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B3463A050F
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 22:20:32 +0200 (CEST)
Received: from localhost ([::1]:43354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqiD8-0003j6-Ni
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 16:20:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqiCL-00032j-VJ
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 16:19:41 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:42639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqiCK-0006hB-CW
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 16:19:41 -0400
Received: by mail-ed1-x532.google.com with SMTP id i13so26024870edb.9
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 13:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=0xlt7UWG2qUDqOVr/8U2eX96PcOZChy5uyR6jnYSEB0=;
 b=Cg5gdqUrqCZUCe+49/yfWc+MODZJQDnkfl20qD28h1+WuGIf/BCp+mTVqMi6j/tTNI
 YxTe3S4M2GvsSKG2WgrVvMVtTPfI+N9/KQeq6/pbmeu+sG0FoYEqJkSxrojfVdHPnzpb
 QtOKeGo2O/3t4wC8MJbr3mFz3Ed8Xs5YR0dhi5Qa4Wj00uXJNvPkZ6X/xpt/3Bi/UaDW
 y16Vq1DhnLOThXpAJPCRD9wiOhWd+3oSHLQVId2TAdGLFU5yj155cLX/plESMiZ1dAXz
 DOdHeX7X9jtpVCRJsM4mKefd3aPCzxs9DD8O+KllvrDJxeRtVTrq7RNi36GHd7aagilv
 Nu+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=0xlt7UWG2qUDqOVr/8U2eX96PcOZChy5uyR6jnYSEB0=;
 b=cVToMEy1WsuoA5TDDBz//CMWcmk18jz44CJtcE9bXzfHzjMjtvOiqGj+otWyRNk6aA
 cZfZ9pZKgWLqhlBxLYAuKEj4GyyCveKCpcF6QL3ahmoJmF0+zlEU5y4uMXMXjZKlt4J+
 ffuuDdQ/fBdladCUHb3qidJmN+J2NnVlWihU/mzr7TMy1L87MxzsjHvzrl0awDH1H0Dz
 MPg9g34shqWOVWWp4AsSEpl1K4EYT0/3ezQuwTtcoxT6xwv0iuZRCMNr/tbuJFaqDjfM
 FLzHPP2eNYwDXcmDrRYOH74ZWEpBmbo712XPOsowni0tKkBqHjVDgM7mBnzj3WZ33JJZ
 lWew==
X-Gm-Message-State: AOAM532B6okRweFj9eG9pMR7YjJ8S99p3C4u0PFaWfhS3OLjIr0zieSI
 O4ZdEH0NotCMQXOIKeVwsBGD1VRhMMnrgYUE324Erg==
X-Google-Smtp-Source: ABdhPJxUPRYuJMicULF0ZTBwbpIpb+qmK6WHCnSDgQ2TJiRwkCXCWljCnKg4YQSMzn685qCDy1X4SyHCrQc8lPE4qaY=
X-Received: by 2002:aa7:d755:: with SMTP id a21mr27777705eds.146.1623183578637; 
 Tue, 08 Jun 2021 13:19:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210608170607.21902-1-peter.maydell@linaro.org>
 <CAMxuvay_bMs_hRzMjc-bVfFJaqk_Zui8anU-dNam4tUztxcvWQ@mail.gmail.com>
In-Reply-To: <CAMxuvay_bMs_hRzMjc-bVfFJaqk_Zui8anU-dNam4tUztxcvWQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Jun 2021 21:19:05 +0100
Message-ID: <CAFEAcA9wHEcHO7GpiWZif2w-CUBmLPJYUgr11su7S2hAPhiuwA@mail.gmail.com>
Subject: Re: [PATCH] tests/unit/test-char.c: Fix error handling issues
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 8 Jun 2021 at 20:51, Marc-Andr=C3=A9 Lureau
<marcandre.lureau@redhat.com> wrote:
>
> Hi
>
> On Tue, Jun 8, 2021 at 9:06 PM Peter Maydell <peter.maydell@linaro.org> w=
rote:
>> I think that improving the quality of the failure reporting
>> in 'make check' is useful, and that we should probably turn
>> on g_test_set_nonfatal_assertions() everywhere. (The worst that
>> can happen is that instead of crashing on the assert we proceed
>> and crash a bit later, I think.) Awkwardly we don't have a single
>> place where we could put that call, so I guess it's a coccinelle
>> script to add it to every test's main() function.
>>
>
> I don't have any strong opinion on this. But I don't see much sense in
> having extra code for things that should never happen.

The point is that I want to make them happen, though...

> I would teach coverity instead that those asserts are always fatal.

If you want an assert that's always fatal, that's g_assert().
These ones are documented as not always fatal.

> Fwiw, none of the tests in glib or gtk seem to use
> g_test_set_nonfatal_assertions(), probably for similar considerations.

That's interesting. I did wonder about these APIs, and if glib
themselves aren't using them that seems like a reason why they're
so awkward.

thanks
-- PMM

