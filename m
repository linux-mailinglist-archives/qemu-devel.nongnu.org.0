Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06D043479C8
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 14:42:28 +0100 (CET)
Received: from localhost ([::1]:47450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP3m9-0007S0-IB
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 09:42:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lP3ks-0006vI-Aq
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 09:41:02 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:37613)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lP3kp-0002U0-U9
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 09:41:01 -0400
Received: by mail-ed1-x52a.google.com with SMTP id x21so27673365eds.4
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 06:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=bkmbpRUJE0vLZqNA4D2Izne3aK+Kk2poYciMwvYF9Es=;
 b=p97wub24lQulZ7jo6YylNlfTgpyqJW5V9UAbEfbyUwYU43UL98nNAOAwj4nV1dlzyo
 W6uLdnWa3nKy6Y8FMLGUcTQXHstnYaxBqNGLrX6xFOSlN1KN8Dk+zKOvzto+69gzH8D1
 WWMARCj+4NS+l2f+PyY0uPcExCSpTqxuFoJmqsUKHPArWZD6DpTww23y5JBImsDr6mgw
 LRVuKs74CoNe+hicGiKhqnJfhEnskPRFRGTLqyEbJ34VhW0UNXl9vJDVhvj3mVwCRj8t
 rB9AqtLui4hPK8p7Prvtlts8I5leTS1ovK9GYjh10NCxXGmhhzz2qk/EbBC+LlZ5d/hQ
 Bzjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=bkmbpRUJE0vLZqNA4D2Izne3aK+Kk2poYciMwvYF9Es=;
 b=DmJ5TlBe2uLImZZoPvObTHYKLiHei+elOf5tLVQBAFcoGK040wU5GMdqRx9RGcCZjR
 yIsBrmtWaQWW31bPDO3KSg3eERH9RH2OqTXg1//KUZAW5TUu8je/67VSupl6V8ag0LXs
 UE/p64ZcaY+N/5J6jVYdASGgqsu1XwATTBnNG+cfcOfT//Dyy1z2Ktle8ie1YvK46ejL
 Y52uu2zzpAS5Qe/zcfYYUUXLPQdblVX2ZrDrq6OxHEyTs5kUt3M9rT+3qlkhbgFpGD/G
 cZ1EtUMhboHAi3omvDMlE+bX1Rs80BzYQ3d7NH4d8l0zphq06BZywibWNrJgGtJzzw2e
 AiUw==
X-Gm-Message-State: AOAM532y7/5TSgx8Y//xV3add9cynBz4fssk7L03f92pQDrcn3GasvXn
 wC24E8td4ky4gGn9f6XESI7nhz3DZDdKoaRNfyD+rQ==
X-Google-Smtp-Source: ABdhPJx/iye6Sv0owAaKpdhdVdf1p2qn6sbsvjooKW0dsdSJLRxrLZJ/i6eQb73g4uTABX8kFyM59Se4NIi9IZRB0fA=
X-Received: by 2002:a05:6402:4244:: with SMTP id
 g4mr3528461edb.204.1616593258196; 
 Wed, 24 Mar 2021 06:40:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210323165308.15244-1-alex.bennee@linaro.org>
In-Reply-To: <20210323165308.15244-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 24 Mar 2021 13:40:28 +0000
Message-ID: <CAFEAcA_c0xYHhwyJtgcwhzVfv9EaRTYdjRCWJsk-ZOuE5okTbg@mail.gmail.com>
Subject: Re: [PATCH for 6.0 v2 00/22] fixes for rc1 pre-PR (kernel-doc,
 semihosting, testing)
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
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

On Tue, 23 Mar 2021 at 17:59, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
> I've added a testing patch to extend the CFI times, Laurent's series
> to fix the iotest regressions currently keeping the CI from going
> green and an optimisation to the --enable-docs build to try and start
> bringing the total CI time down a bit. rc0 is being tagged today so
> I'll probably roll a PR from this later in the week in time for rc1.

That's tricky given you sent this patchseries at 6pm on the day
when rc1 was nominally going to be tagged :-)

I was kinda hoping to get the iotest regression fixed in rc1,
but I want to tag it today. Oh well, it's only the CI, not an
actual bug, so no big deal I guess.

thanks
-- PMM

