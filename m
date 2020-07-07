Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87672217049
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jul 2020 17:22:22 +0200 (CEST)
Received: from localhost ([::1]:57376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jspQL-0003b3-Ki
	for lists+qemu-devel@lfdr.de; Tue, 07 Jul 2020 11:22:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jspON-0002Gl-KA
 for qemu-devel@nongnu.org; Tue, 07 Jul 2020 11:20:19 -0400
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b]:41565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jspOL-0006Ag-QV
 for qemu-devel@nongnu.org; Tue, 07 Jul 2020 11:20:19 -0400
Received: by mail-oi1-x22b.google.com with SMTP id y22so22545929oie.8
 for <qemu-devel@nongnu.org>; Tue, 07 Jul 2020 08:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BKVtdM6DioPxp/ztEKC//hFqjyrrB7h3c20R0r1lMqQ=;
 b=irO0f+pVNow/yJOu/6T35p8C27wRJBWc8LmkdvGH7so9cHaHeeGMv/D6Q+MOXD9bZd
 UMd14tb3h9AJjc4p3AVQnnN5cCFgkaaCCHqHYPr5bE/+pZyIPQXk66sIAIOQGRtfhP90
 hZq9N9hINgwVWZgR/Kx8GxeZwy0X1ar4LR1z/8GXf7WlLAB5/5LC29nnjQ6Hmcuvog38
 g4LfvWjbITl9mKVI/IUABaISgIZfx4X/J2pSUqsSOly80L+62Bccw+VeHNffyh09IuIk
 jDKo0jGB1+D1DkM14KDHTCOgiV0+Lk795pDH/cmHbeJ+iRcH1EnCg5+p3EWHamafw36r
 Ebgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BKVtdM6DioPxp/ztEKC//hFqjyrrB7h3c20R0r1lMqQ=;
 b=DlSdQnBm8aKe33EIKGjcJP56HuRRm8rRUl/OT65w33m8oYRyBcZcZk8HLidXMLl+sL
 ag1hPPScjBhOvNXOEkHf7ldMXkn+jIerDrlVjGeToXf0Hp4O2ouni+0iFvOwVl0D66Vw
 nPpk0CXBz07pcNpEAUw64bG5YRfHrv7csCRvjluXZr+GnneKgbVXY8dUVtymidpL+mgo
 fGmeWnkvULC9Nx/m3tUZAE/ZjVRl/bP+IsmtKivNDf3e0kg4AqY1VukPovqOdG9vDkm7
 dpTyA1gShX6vN+vy5nnXc7wSfYg7EtCJjE0alGjd3KlE5KKnP9nRL4g/JWtIVOoBSVyn
 f3mA==
X-Gm-Message-State: AOAM533CNUsKEBTvfE6Y6oYDKhGDAcObIdNa0LdWwbELknJs/kJwd/oX
 qUTHc5VF8QnvUO+i9MPWorGDiVIw+NGxx+wQHWWYyg==
X-Google-Smtp-Source: ABdhPJzEldpF5Yku+YZrtYEv0zvoPiHwBHMXV8f2ajtl/zGu8ZdXKovzy/VQz2HrnZfC16bdRQtI1pUb6WgeMwcmj04=
X-Received: by 2002:aca:1706:: with SMTP id j6mr3503330oii.146.1594135216151; 
 Tue, 07 Jul 2020 08:20:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200706072835.23582-1-thuth@redhat.com>
In-Reply-To: <20200706072835.23582-1-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Jul 2020 16:20:05 +0100
Message-ID: <CAFEAcA-ZGZf2NSLCsPY0XpAqGduKmnBYhbKPTtt3VC-Ma8ECYA@mail.gmail.com>
Subject: Re: [PULL 0/6] qtest and misc patches
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::22b;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x22b.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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

On Mon, 6 Jul 2020 at 08:28, Thomas Huth <thuth@redhat.com> wrote:
>
>  Hi Peter,
>
> the following changes since commit eb6490f544388dd24c0d054a96dd304bc7284450:
>
>   Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20200703' into staging (2020-07-04 16:08:41 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/huth/qemu.git tags/pull-request-2020-07-06
>
> for you to fetch changes up to 70f909b4eec6fa92a9e33a8d23e185cad7abd533:
>
>   tests/acceptance: Add a test for the sun4u sparc64 machine (2020-07-06 07:37:02 +0200)
>
> ----------------------------------------------------------------
> * Fuzzer fixes from Alexander
> * Clean-up patches for qtests, configure and mcf5206
> * Sparc64 sun4u acceptance test
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.1
for any user-visible changes.

-- PMM

