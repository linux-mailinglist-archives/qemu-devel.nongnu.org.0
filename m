Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD614332C3D
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 17:37:38 +0100 (CET)
Received: from localhost ([::1]:59458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJfMX-0004Br-Nl
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 11:37:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJevF-0004B1-UX
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 11:09:25 -0500
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:39432)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJevD-0008DI-VU
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 11:09:25 -0500
Received: by mail-ed1-x535.google.com with SMTP id h10so21277743edl.6
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 08:09:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/cZs14T4NNs3nZl0AmPme1XuKd/3K0U0U6XI7Kd1eQo=;
 b=EcOvxAHOcPSfgnyG8zdDEMxgZcJfGIvZWGpY99FUAP3SFBH8h2haqi+SnOLBy/DhcR
 vjVqQY32MleecqznR7UCPgaanhf5n1535per26QejZ3UK4sHcXK+dmdtVrwacISGZQ8K
 hKaNKB/3HCI6+1Sa+FgUoeLJ+RUtwrQe8jf9VHEiW1MNeLF+SRndNjPCnK/BIoODmCtO
 XzFkYx3sqDKRKADW3THc6g7V6jiX4cRrALnGZxssDGzNUca2Lpv2lUjiFL/uDvO1FrN+
 i8CikCsaonuLTx6m7VMbC4HOPoEqtLmqLJcfIHFl+sVJZ6dUVKY+OjLtBCWkONUk1nVR
 K+KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/cZs14T4NNs3nZl0AmPme1XuKd/3K0U0U6XI7Kd1eQo=;
 b=EBR8K6YBxriDGGFVUAPu1SP7TeYqWhk1LlXXp7eeYxB0MyG++ykGVXnP+OuUhooZwD
 2CtJm6xOxGg5wLOAJo+k8tn99UpNYWAnloNRmBKLjcgrI2H29mpDC4dts8SCtPYMr3XI
 1CJnC4aHbHUlF0Ffhtjr380YFyRAh82ULXg5G8zF93gNuonl5t1laBlKYTVjaaL8Bj2e
 tr4DAPA92MiO0HNan9Ox6uinBgQeX/0xZmUJmcyiZPPdDbK4vUalMJFVTmEqRkk/6vh2
 i580BF2IhEFB/YaCLycJwHzcIEvwH9uh+zWPX4w6LsdxjOs9cLhfI5pknDVQ1OPjUsxA
 5VdA==
X-Gm-Message-State: AOAM5314ZB4rHDOq/whSFxQDe45EAYUeHkQNTt5bh2PAxdon6AOQB7jd
 sJqBwEsyoLJwbh7koWa+Lp6NLhFyPOFeuoT5jmofRh7iD6g=
X-Google-Smtp-Source: ABdhPJxAP5ePM/NWuXCx3YQ8fqrpOvoFMuFUX5x9OPxQqcuATJq9sK/8fKCp1hhn8OyWaDyJ/OswAVlb7o2Xx03J1zs=
X-Received: by 2002:aa7:d686:: with SMTP id d6mr5089236edr.146.1615306162412; 
 Tue, 09 Mar 2021 08:09:22 -0800 (PST)
MIME-Version: 1.0
References: <20210307120850.10418-1-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20210307120850.10418-1-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 Mar 2021 16:09:04 +0000
Message-ID: <CAFEAcA_qecMRbzAMoaCTXN-tUKpJfD7tZ_byvXHNPrptqBjc7A@mail.gmail.com>
Subject: Re: [PULL 00/42] qemu-sparc queue 20210307
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
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

On Sun, 7 Mar 2021 at 12:09, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> The following changes since commit 91e92cad67caca3bc4b8e920ddb5c8ca64aac9e1:
>
>   Merge remote-tracking branch 'remotes/cohuck-gitlab/tags/s390x-20210305' into staging (2021-03-05 19:04:47 +0000)
>
> are available in the Git repository at:
>
>   git://github.com/mcayland/qemu.git tags/qemu-sparc-20210307
>
> for you to fetch changes up to 7aa6baee7c8a54473f28c6fa1e980a9ff7989036:
>
>   esp: add support for unaligned accesses (2021-03-07 10:39:05 +0000)
>
> ----------------------------------------------------------------
> qemu-sparc queue


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

