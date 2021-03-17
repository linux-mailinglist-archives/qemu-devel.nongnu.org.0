Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 413F033FA45
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 22:05:04 +0100 (CET)
Received: from localhost ([::1]:50450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMdLj-0001Rk-9L
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 17:05:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lMdJ7-0007ej-9J
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 17:02:21 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:41862)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lMdJ5-0007tm-H9
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 17:02:21 -0400
Received: by mail-ed1-x534.google.com with SMTP id z1so4004897edb.8
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 14:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=B7sACMuipmEGFyJbqN1C3YIplK9r5oIqaezwBhuHvfE=;
 b=N4ayVTV4DJlUodjxiA0GFheeDJq5Im+Q/ocOdwbMURafyW/Gk7Oz+HD97jkISgVDHe
 +oCIhrFa4vU/fK9kio1vb9IijfpeCDDKh2gUO+RnZ9sQi/YYya7kHxUi8P0UgwHU9thR
 VRmNDX/0SnaAjCKp21P52Ute5BJBn4HW2+GYRYByhzYVIzGUVDQclKKhgQexOyZRKTVl
 x5lnVvOgZVNDK7/9GOvub/9FpJrc/H//viN2yvciU8obtpF0sKLLZ2+zT81LGjF3SRFJ
 ytjBX4wGZKh12qg42wMcI1RW5JqtwiUYFtNirMphzyUHg8D0/mfvjN+W82SI0dz0eVzP
 BGRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=B7sACMuipmEGFyJbqN1C3YIplK9r5oIqaezwBhuHvfE=;
 b=lfYwDjyRdkLh3kSeGt6/PrPlST02WOvX6ya10W5Oe8WZDrgaZ24Mq7N++bIolgd7nr
 cQiEWwTBoen1Qdj6YXD8M+XChjKHtJ7Hwc+S3wA2kHubECduJhiQaAciICc3DsfVWg4M
 TKyZ4BhwZukylAiSQGA1liYM3RdChPjBuIRQi2DX1EKdb3mhM2miKH38CqZ4bLj+ZFAq
 fW1s0cUrVvPMuePLToSc6WWSlIbplXSBoiTkESuAwY3v46pgI+y5bZBCvKYBGPX4rLl+
 PAhDX7EP9wcLo8rwNmlyQee1n681oScT6EQYb7M5hKaW/uPAIHgt19zNk1ww+Pd9mHR0
 vfAw==
X-Gm-Message-State: AOAM530sYNoVLJQHYgfpRAeJoJdiTvgcLiqQ2hevjspRy323vmOrzxCD
 Pgzruyyb5aBSy5/ngEiKxCJ4U75KusKoyRoLvZXyZw==
X-Google-Smtp-Source: ABdhPJy37GjHPfZKxxnnnAXGdMQuK+BoYjK60h1h7E1TKCralo43s84Xa+/verL+yJHWnxfIrZiGFGErKouOq6Ng7Vc=
X-Received: by 2002:aa7:c3cd:: with SMTP id l13mr43893101edr.52.1616014938120; 
 Wed, 17 Mar 2021 14:02:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210316192347.3918857-1-armbru@redhat.com>
In-Reply-To: <20210316192347.3918857-1-armbru@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 17 Mar 2021 21:01:54 +0000
Message-ID: <CAFEAcA8_Xu8EJs4m0YGJU9iG7ewkicTV1_N6cJFrBmaUgzsbzQ@mail.gmail.com>
Subject: Re: [PULL v2 0/6] QOM and fdc patches patches for 2021-03-16
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
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

On Tue, 16 Mar 2021 at 19:23, Markus Armbruster <armbru@redhat.com> wrote:
>
> The following changes since commit 6e31b3a5c34c6e5be7ef60773e607f189eaa15f3:
>
>   Merge remote-tracking branch 'remotes/jasowang/tags/net-pull-request' into staging (2021-03-16 10:53:47 +0000)
>
> are available in the Git repository at:
>
>   git://repo.or.cz/qemu/armbru.git tags/pull-qom-fdc-2021-03-16
>
> for you to fetch changes up to 901c36b68c327c5a4e4b3701cd991dd927ac07ae:
>
>   memory: Drop "qemu:" prefix from QOM memory region type names (2021-03-16 15:52:26 +0100)
>
> ----------------------------------------------------------------
> QOM and fdc patches patches for 2021-03-16
>

CONFLICT (content): Merge conflict in docs/system/removed-features.rst

Please fix up and resend.

thanks
-- PMM

