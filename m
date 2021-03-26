Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C918634A925
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 14:57:48 +0100 (CET)
Received: from localhost ([::1]:47010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPmyB-0004tr-TU
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 09:57:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lPmve-0003Mo-4O
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 09:55:10 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:35576)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lPmva-00084v-PY
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 09:55:09 -0400
Received: by mail-ed1-x52c.google.com with SMTP id dm8so6434637edb.2
 for <qemu-devel@nongnu.org>; Fri, 26 Mar 2021 06:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZvSGmQRYV21paSMIpl9aNffVDk0oeAXFMvY51jWDyHk=;
 b=B9vwq/P5FxG2+lZSgLAwM4wT9ToJHUnKK6/v0P6u44Mayb4+4ci7MBqvdVL0RGhS9z
 5tViQx6gsU5tufpwan6sAJKOiL9jpQ9IXRU2qzwA7HjOb6E0yDsOtdgT8r+r/3bV6iyY
 KhJBrze7zQClMawwTVp8VQ/ztWc/3tw4qmH67OJ1m+kWgVhzFb+WJt2Sdvd2N2inzDbo
 rN7wPvEKd6Atq8QyKqOhZdb+V/TIkEDeqiehAojktSvbMK4FuvConfta8yfN9X7yHkGC
 L1nhqwFj2nzbprusK/m1JczqPu4AiVvNJq0/pC5yh00ERS8ped4dPFY8FiJdvLFogLFN
 URqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZvSGmQRYV21paSMIpl9aNffVDk0oeAXFMvY51jWDyHk=;
 b=sdobnY3MjMV9M9rS7Hn2DquOMh/zjvT5k6l8osktyEhFul5KV9et7ezVRurGD29R6Y
 4MKBLwiILwv2Ft6mOxkvrVyzQ8QEZo7MqQl59F6vE46NAp47sb7ptpM0KVuY9kM/FDN/
 9evfN+pSKDyWFZmDPBSiJb7IV7FjgBE4IIHE/Lk8OXMOF9wUUNQ7W8GuX155n3zLqqWJ
 ZAAuNY/mTpsZ7g4ezVz9tcBVirUgI7qBwga+sE1o5zsaCJYTUc7tAO2159wbqJqMBqX8
 GPk6k7w91Lzz45HVUxCWc7k1ZMVVDwas2yCUfZpr3d1owNb02H3MSor7sIIiAWETETdN
 7qVA==
X-Gm-Message-State: AOAM533udDWl0jG9cfi+CxcOR8bjedSYvxapcuCTI3vgbtZUVZ/FCMsN
 mj812xj1nhYCuV60+K72TrRcWqbOm7megSAQ/zsPVQ==
X-Google-Smtp-Source: ABdhPJxUFkvmzJJWAsHQRcJLb78R/dbql6dsbElBhqOKG27clF35gdFGqviIubUd3Q4UVgEJVdAVwxL8uoNn6h0HqgA=
X-Received: by 2002:aa7:c804:: with SMTP id a4mr14931919edt.251.1616766905440; 
 Fri, 26 Mar 2021 06:55:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210325142702.790-1-yuzenghui@huawei.com>
In-Reply-To: <20210325142702.790-1-yuzenghui@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 26 Mar 2021 13:54:37 +0000
Message-ID: <CAFEAcA8tbeJgxpRMu83aX+frPOgsDvHUG+PWHtaJEG5qQaFcLQ@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/smmuv3: Drop unused CDM_VALID() and is_cd_valid()
To: Zenghui Yu <yuzenghui@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Eric Auger <eric.auger@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, wanghaibin.wang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 25 Mar 2021 at 14:27, Zenghui Yu <yuzenghui@huawei.com> wrote:
>
> They were introduced in commit 9bde7f0674fe ("hw/arm/smmuv3: Implement
> translate callback") but never actually used. Drop them.
>
> Signed-off-by: Zenghui Yu <yuzenghui@huawei.com>
> ---



Applied to target-arm.next, thanks.

-- PMM

