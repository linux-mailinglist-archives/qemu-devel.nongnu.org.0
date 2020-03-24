Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B32190EDB
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Mar 2020 14:15:44 +0100 (CET)
Received: from localhost ([::1]:48556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jGjPD-0001yf-Uj
	for lists+qemu-devel@lfdr.de; Tue, 24 Mar 2020 09:15:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47652)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jGjOI-00011Z-Qg
 for qemu-devel@nongnu.org; Tue, 24 Mar 2020 09:14:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jGjOH-000689-LN
 for qemu-devel@nongnu.org; Tue, 24 Mar 2020 09:14:46 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:32774)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jGjOH-00067U-Dd
 for qemu-devel@nongnu.org; Tue, 24 Mar 2020 09:14:45 -0400
Received: by mail-ot1-x342.google.com with SMTP id 22so11439459otf.0
 for <qemu-devel@nongnu.org>; Tue, 24 Mar 2020 06:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=B68Sxo8H9qlQdyolTIIK6g9+fd3MEpUNZDVwhV2iLfA=;
 b=Q4OWaEcqvRkMRu/3HTl/P+CdZhNuJLklweaj3DBt+sfcv/tq++/XNBjUsaTpwrNlAe
 OjfJ75DBiXcYz5UjW24l7ZWFnvV72q2M2heZCPfQtH9oq7gnZA2vP84KAAiSD0TtgiBW
 JK9b6/Ao0TIxJyTavjyRogBJ/FE86mlHuWle7ECQIV3f/PPh7dX6g2ZjU4nHQ46s2aH8
 5bxxSEHqmcd3Jjn8Y9Bs4uIkLiMQdQw1wMdazOBFQ6AofTorvZeKNerYWv43fnvv8rtr
 hzmN6Tw63opZQkDDPlJ6cxNkqRmZEr79YpdJkFwZNOV/RULJtRxp6ioHiIaAx/rM1oKI
 U6oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=B68Sxo8H9qlQdyolTIIK6g9+fd3MEpUNZDVwhV2iLfA=;
 b=QwGkEfLkp2+P26QUmiSdnMw8YmvxAB840Cwx9pRU+SqrJQXMF5m/N8tFPLVZ2qUvz4
 WioweU3YdscFpInK9Yz7TDTHuNCurZLV0spJPBvJcnCBfRI1kkOZjthTsNwTMzQHTydp
 AN4eZdLRpqNDECMFiHgsR+8lsMcGNXajPQRDlDZwdEE0rvuS2pIFOMP9V9Wl6a7nqsxy
 OItyE6JSSkSFlDVQBaV175RXmMZqw4z8a38t/+YTWxSmlwPXK8Ylsz0/mZ99Gngg0VlX
 vEAzzdFdXZLpE/UqeByJ9ejo2o/cXs+WqqMMwO9BrA13/lvUO521SUd+7FeIlFXtRmxS
 qXKA==
X-Gm-Message-State: ANhLgQ2DGyZ+M/LVYvxsOeLVLcJIzjAIgGSbISvLHmVXjdtY+U5VMlaQ
 oBj7jRtqcaGM1q1zmVJgQBlNwHg/47fOur5UPxM102DyLkRpeQ==
X-Google-Smtp-Source: ADFU+vvNxhFqn2+fypQuJ8Qi0a+sMHbUQ9ZJ6fW0FIu3rznzbX1XuH9C77nOQwyveOCvpITMf6WXUgQL5Prx7mYztZQ=
X-Received: by 2002:a9d:1920:: with SMTP id j32mr20709212ota.221.1585055684357; 
 Tue, 24 Mar 2020 06:14:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200324111700.595531-1-laurent@vivier.eu>
 <CAFEAcA9-gYfwNCKLkbbbTx1+xSG6E2ErH0NZ=9JPQwNJvwmVzQ@mail.gmail.com>
 <2c2cc8db-32ed-6a25-266b-9a3476f39805@vivier.eu>
In-Reply-To: <2c2cc8db-32ed-6a25-266b-9a3476f39805@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 24 Mar 2020 13:14:33 +0000
Message-ID: <CAFEAcA-LjJ0KsSTe9O=0thuFmc48BYXWOHQ2ZREptSdCMO16CA@mail.gmail.com>
Subject: Re: [PULL v2 0/5] Linux user for 5.0 patches
To: Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::342
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
Cc: Riku Voipio <riku.voipio@iki.fi>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 24 Mar 2020 at 12:32, Laurent Vivier <laurent@vivier.eu> wrote:
> OK, I think there is an existing problem in the build dependencies.
>
> Do you use enable all targets ("configure" without parameters)?
> Do you run make with "all" or "x86_64-linux-user/all"?

This config is
'../../configure' '--cc=ccache gcc' '--enable-debug' '--static'
'--disable-system' '--disable-gnutls'
and it is an incremental build, so just

make --output-sync -C build/all-linux-static -j8
make --output-sync -C build/all-linux-static check V=1 -j8
make --output-sync -C ~/linaro/linux-user-test-0.3/ test
make --output-sync -C build/all-linux-static check-tcg

(it's step 3 that fails here).

thanks
-- PMM

