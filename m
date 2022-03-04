Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ACB74CD260
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 11:27:27 +0100 (CET)
Received: from localhost ([::1]:41172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ59g-00039T-Ai
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 05:27:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nQ53e-0004jZ-5X
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 05:21:10 -0500
Received: from [2607:f8b0:4864:20::1135] (port=41823
 helo=mail-yw1-x1135.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nQ53Z-00026o-Ef
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 05:21:09 -0500
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-2dc242a79beso75582277b3.8
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 02:21:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hmspUjcU0yL57ZYPbXKOpvyLCEIBSY2LiQ9I8amIAHc=;
 b=mzPTOOdzUAuDBGDPrrkNyUr6vGelp4j5UyYcLWqomoKU1TXLgkcYs/7HsHrRteZqFZ
 mC0tnWpe6ZIys/pA6X4Wc/6765a3tMLvQ2nwT5PU94ZfeN/KGtucGz9T6FqzU4E0Ejgy
 +W2l0xjxEzWkygs713iYyy/hnXXghO615q7c/d9TBoszM2VlNkgkxoVdN4fk9HlmdhEc
 BgSWCtTSmukNrgS3iiC2d898XdP0sSgaycZToXcICultwAZiz3WV925Mqrkgx70/IGN8
 q0XTuisOblgvL2sTwpV7w49FvZx2y3p8xOirrs7k+ZfGaTW36ErUp5FqCbBNrR4B9mjY
 EC8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hmspUjcU0yL57ZYPbXKOpvyLCEIBSY2LiQ9I8amIAHc=;
 b=6AxwpYE1yYSsjX+YJTdzANKabHX3YCH7U2SZ9tCy/hbOP4u7QjPb0HpDoKEjUi7dp9
 X3NhFxakJ41EJDGqQ/lk+WVVdaompO+mgiMyHkaKbgp/KKzNvOkywsZexrOVQ5d82SbV
 4pzBdE9yWxvKqeOkeiflIlDD4uoPB+/NZEcqIfVBLmbYXDReLu5rfRTndT0mc8I5J+yu
 t17/wobb9RRyFXiATdlwL1mX0B2X9D9B8N2mAp4MpgemP4zV30tn9wPaI4I0KvglIaby
 oughKAvKdtokghWWnlSKIE2uGkvE0x6Xgv6PwM1wzxCk1REAu1M/U4fHqK7PYhtbKt7B
 AKCw==
X-Gm-Message-State: AOAM531/vFcw6iNcDymAe7Th7zlmgpFlK8qjGClBfki9BdLyDDm68El8
 iaEnN/nixb3KyhSKBlsS9xZBVsNkqTbbc7umZTot6w==
X-Google-Smtp-Source: ABdhPJx+Vh/8algAQYVqm5pFHUr+M3aSFa6O8wcN4L8OjWW3Yi9rMCcK+yvwCldKYqUwRpD9f4gJt6C6fIs8M+1kzxY=
X-Received: by 2002:a0d:f603:0:b0:2d1:57e5:234 with SMTP id
 g3-20020a0df603000000b002d157e50234mr41098390ywf.469.1646389264031; Fri, 04
 Mar 2022 02:21:04 -0800 (PST)
MIME-Version: 1.0
References: <20220226180723.1706285-1-peter.maydell@linaro.org>
 <20220226180723.1706285-5-peter.maydell@linaro.org>
 <71304530-f1d7-13a9-c80e-f41a68a344c8@linaro.org>
 <CAFEAcA8J+pYScRp3KJAb0iLuS65nYVDYkiWPARAT5Ot9299VqA@mail.gmail.com>
 <91cc02c4-8ea5-23e7-7384-6c6b2c8e12b5@linaro.org>
 <CAFEAcA9mO0rEuhj4rxerDF7qiePjWo0tUs5PBUF-zqgxqsdm3A@mail.gmail.com>
 <5931e696-fb03-98e3-ed34-6d0c79c47504@linaro.org>
In-Reply-To: <5931e696-fb03-98e3-ed34-6d0c79c47504@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 4 Mar 2022 10:20:52 +0000
Message-ID: <CAFEAcA8nTMF6aiWQSMMsooDGJuWug__5G78q5g0i5TDF8_M9Nw@mail.gmail.com>
Subject: Re: [PATCH 4/9] util/oslib-win32: Return NULL on qemu_try_memalign()
 with zero size
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1135
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1135.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 3 Mar 2022 at 23:02, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 3/3/22 06:55, Peter Maydell wrote:
> >> Alternately, force size == 1, so that we always get a non-NULL value that can be freed.
> >> That's a change on the POSIX side as well, of course.
> >
> > Yes, I had a look at what actual malloc() implementations tend
> > to do, and the answer seems to be that forcing size to 1 gives
> > less weird behaviour for the application. So here that would be
> >
> >     if (size == 0) {
> >         size++;
> >     }
> >     ptr = _aligned_malloc(size, alignment);
> >
> > We don't need to do anything on the POSIX side (unless we want to
> > enforce consistency of handling the size==0 case).
>
> I would do this unconditionally.  The POSIX manpage says that either NULL or a unique
> pointer is a valid return value into *memptr here for size == 0.  What we want in our
> caller is NULL if and only if error.

Mm, I guess. I was trying to avoid changing the POSIX-side behaviour,
but this seems safe enough.

-- PMM

